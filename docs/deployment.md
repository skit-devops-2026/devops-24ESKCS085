# Deployment - interviewX (24ESKCS085)

- Live URL: https://b240584-droid.github.io/interviewx-live/
- The organisation repository cannot enable GitHub Pages without an admin
  (Settings -> Pages is restricted and the deployment workflow's
  configure-pages step fails with "Resource not accessible by integration"),
  so the site is deployed from the author's personal repository
  https://github.com/b240584-droid/interviewx-live (GitHub Pages, Deploy from
  a branch: main, / root). The screenshot of the live site is
  docs/deployment-screenshot.png.
- Container image: ghcr.io/skit-devops-2026/devops-24eskcs085:latest
  (built and pushed by the CI workflow on every push to main).

## Local deployment with Docker

```bash
docker compose up --build
# app:         http://localhost:3000
# health:      http://localhost:3000/health
# Prometheus:  http://localhost:9090
# Grafana:     http://localhost:3001
```

## Kubernetes

```bash
kubectl apply -f k8s/
```
