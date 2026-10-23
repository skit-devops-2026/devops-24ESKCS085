# Contributing to interviewX

Thanks for helping improve the interview practice platform.

## Workflow
1. Create a branch from `main` - use a short prefix such as `feature/`, `fix/`,
   `docs/` or `chore/` (for example `docs/testing-notes`).
2. Make your change and commit with a descriptive message
   (for example `Add booking form validation`, not `update`).
3. Open a pull request into `main` **with a description** of what changed
   and why. At least half of merged PRs must carry a description - it is
   part of the course rubric.
4. Wait for the CI pipeline to pass (hygiene, build-and-test, Docker build).
5. Merge the pull request once CI is green.

## Local development
```bash
make install
make test
make build
make run          # serves the site on http://localhost:3000
# or the full stack:
docker compose up --build
```

## Style notes
- Plain HTML/CSS/JavaScript - no build step and no new frameworks.
- Keep image filenames descriptive; venue images live at the repo root.
