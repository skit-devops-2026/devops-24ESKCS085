# Project Structure - interviewX

| Path | Purpose |
|---|---|
| `server.js`, `package.json` | Node.js service: landing page, `/health`, `/metrics` |
| `public/` | Static landing page served by the service and by GitHub Pages |
| `Dockerfile`, `docker-compose.yml` | Container image and local stack (app + MongoDB + Prometheus + Grafana) |
| `monitoring/` | Prometheus config, Grafana dashboard and provisioning, alert rules |
| `k8s/`, `kubernetes/` | Kubernetes Deployment and Service manifests |
| `.github/workflows/` | CI pipeline (hygiene, build-and-test, Docker build/push to GHCR) and the Pages workflow |
| `Jenkinsfile` | Jenkins pipeline mirroring the CI stages |
| `tests/` | Shell-based checks run by `make test` |
| `docs/` | Deployment notes and the deployment screenshot |
| `scripts/` | Repository hygiene script used by CI |
| `Makefile` | Standard entry points: install, test, build, run, docker-build, docker-up |
