# interviewX - Node.js service image
FROM node:20-alpine

WORKDIR /app

# The service has no external dependencies, so no install step is needed.
COPY package.json ./
COPY server.js ./
COPY public ./public

ARG COMMIT_SHA=dev
ENV COMMIT_SHA=$COMMIT_SHA
ENV PORT=3000

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget -qO- http://127.0.0.1:3000/health || exit 1

CMD ["node", "server.js"]
