# interviewX - Makefile (target names are called by .github/workflows/ci.yml)

.PHONY: install test build run docker-build docker-up

install:
	@echo "interviewX service has no external dependencies - nothing to install."
	@node --version

test:
	bash tests/test_app.sh

build:
	@node --check server.js
	@test -f Dockerfile && test -f docker-compose.yml && test -f monitoring/prometheus.yml && test -f k8s/deployment.yaml && test -f k8s/service.yaml && echo "Build validation passed: service + M5-M7 deliverables present."

run:
	node server.js

docker-build:
	docker build -t interviewx:latest .

docker-up:
	docker compose up --build
