// interviewX - minimal production Node service (no external dependencies).
// Serves the project landing page and the endpoints the DevOps milestones need:
//   GET /        -> landing page (public/index.html)
//   GET /health  -> {"status":"ok","service":"interviewx","commit": "..."}
//   GET /metrics -> Prometheus text metrics
const http = require('http');
const fs = require('fs');
const path = require('path');

const PORT = process.env.PORT || 3000;
const COMMIT = process.env.COMMIT_SHA || 'dev';
let requests = 0;

const server = http.createServer((req, res) => {
  requests += 1;
  if (req.url === '/health') {
    res.writeHead(200, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ status: 'ok', service: 'interviewx', commit: COMMIT }));
    return;
  }
  if (req.url === '/metrics') {
    res.writeHead(200, { 'Content-Type': 'text/plain; version=0.0.4' });
    res.end(
      '# HELP interviewx_up Whether the interviewX service is up\n' +
      '# TYPE interviewx_up gauge\ninterviewx_up 1\n' +
      '# HELP interviewx_http_requests_total Total HTTP requests served\n' +
      '# TYPE interviewx_http_requests_total counter\n' +
      `interviewx_http_requests_total ${requests}\n`
    );
    return;
  }
  if (req.url === '/' || req.url === '/index.html') {
    fs.readFile(path.join(__dirname, 'public', 'index.html'), (err, data) => {
      if (err) { res.writeHead(500); res.end('landing page missing'); return; }
      res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' });
      res.end(data);
    });
    return;
  }
  res.writeHead(404, { 'Content-Type': 'application/json' });
  res.end(JSON.stringify({ error: 'not found' }));
});

server.listen(PORT, () => {
  console.log(`interviewX service listening on port ${PORT} (commit ${COMMIT})`);
});
