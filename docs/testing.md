# Testing - interviewX

## Automated checks
The CI pipeline (`.github/workflows/ci.yml`) runs on every push and pull request:
1. **Repository hygiene** - `scripts/hygiene.sh` (README placeholders, author
   table, no oversized or secret files, descriptive commit messages).
2. **Build and test** - Node 20, then `make install`, `make test`, `make build`.
   `make test` runs `tests/test_app.sh`, which verifies that all deliverable
   files exist, `server.js` parses, the JSON files are valid, and then boots
   the real service and checks that `/health` returns ok and the landing
   page serves.
3. **Docker** - on pushes to main, builds the image and pushes it to GHCR.

## Running the tests locally
```bash
make install
make test
make build
```

## Manual checks before a release
- `node server.js`, open http://localhost:3000 and confirm the landing page loads.
- `curl http://localhost:3000/health` returns `{"status":"ok",...}`.
- `curl http://localhost:3000/metrics` returns Prometheus metrics.
