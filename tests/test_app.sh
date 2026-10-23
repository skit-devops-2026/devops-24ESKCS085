#!/usr/bin/env bash
# Automated checks for interviewX - run by `make test` and the CI pipeline.
set -u
fail=0
check() { if [ -e "$1" ] && [ -s "$1" ]; then echo "ok: $1 present"; else echo "FAIL: $1 missing or empty"; fail=1; fi }

for f in package.json server.js public/index.html Dockerfile docker-compose.yml \
         monitoring/prometheus.yml monitoring/dashboard.json \
         k8s/deployment.yaml k8s/service.yaml .github/workflows/ci.yml Jenkinsfile; do
  check "$f"
done

node --check server.js && echo "ok: server.js syntax valid" || { echo "FAIL: server.js syntax"; fail=1; }
node -e "JSON.parse(require('fs').readFileSync('package.json','utf8')); JSON.parse(require('fs').readFileSync('monitoring/dashboard.json','utf8'))" \
  && echo "ok: JSON files parse" || { echo "FAIL: JSON parse"; fail=1; }

PORT=3100 COMMIT_SHA=test node server.js & SRV=$!
sleep 1
curl -sf http://localhost:3100/health | grep -q '"status":"ok"' \
  && echo "ok: /health responds" || { echo "FAIL: /health did not respond ok"; fail=1; }
curl -sf http://localhost:3100/ | grep -qi 'interviewX' \
  && echo "ok: landing page serves" || { echo "FAIL: landing page"; fail=1; }
kill $SRV 2>/dev/null

[ "$fail" -eq 0 ] && echo "All interviewX checks passed." || echo "Some checks FAILED."
exit $fail
