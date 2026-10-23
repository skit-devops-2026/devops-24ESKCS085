# Monitoring - interviewX

- `prometheus.yml` - Prometheus scrape configuration. Jobs: `prometheus`
  (itself) and `interviewx` (the Node service's `/metrics` endpoint).
- `dashboard.json` - Grafana dashboard "interviewX - Service Overview"
  (service up, HTTP request total and rate). Also provisioned automatically
  under `grafana/` for the docker compose stack.
- Alert rules arrive via the monitoring PR (alert-rules.yml).

Run the full stack with `docker compose up --build`:
app on :3000, Prometheus on :9090, Grafana on :3001 (admin/admin).
