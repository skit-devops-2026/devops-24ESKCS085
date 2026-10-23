# interviewX

## Author

| Roll No. | Name | GitHub username |
|---|---|---|
| 24ESKCS085 | BHAVISHYA MEENA | b240584-droid |

## About

interviewX is an AI-assisted interview practice platform. Candidates can take
timed, role-specific mock interviews, get instant AI feedback on their answers
and track their readiness over time. This repository contains the project's
Node.js service (server.js) together with the complete DevOps setup for the
course milestones: CI, Docker, deployment, monitoring and Kubernetes.

## Tech stack

- Frontend: react, tailwindcss, motion, react-icons
- Backend: node.js, express.js, axios, redux, multer, openrouter
- Database: mongodb-atlas

## Running locally

```bash
make install
make test
make run        # service on http://localhost:3000
```

## Live URL

[Visit the live interviewX site](https://b240584-droid.github.io/interviewx-live/)

https://b240584-droid.github.io/interviewx-live/

## Health endpoint

`GET /health` returns the running commit SHA, e.g.
`{"status":"ok","service":"interviewx","commit":"..."}`.
`GET /metrics` exposes Prometheus metrics.

## Container registry

Image: `ghcr.io/skit-devops-2026/devops-24eskcs085:latest`
(built and pushed by the CI workflow on every push to main).

https://github.com/orgs/skit-devops-2026/packages/container/devops-24eskcs085

## Deployment and monitoring

- `docker compose up --build` runs the app (:3000), MongoDB, Prometheus (:9090)
  and Grafana (:3001).
- Kubernetes: `kubectl apply -f k8s/`
- See `docs/deployment.md` for deployment notes and the deployment screenshot.
