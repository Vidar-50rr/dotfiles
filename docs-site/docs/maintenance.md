---
id: maintenance
title: Maintenance and Troubleshooting
---

## Updating configs

- Edit files in the repository, not the symlink targets.
- Existing symlinks pick up file edits automatically.

## Backups

- Back up existing destination files manually before replacing them with
  symlinks.

## Common issues

- Missing fonts: install fonts from `fonts/` and restart the terminal.
- Prompt not showing: ensure `starship` is installed and on `PATH`.
- Bash modules not loading: verify `.bashrc` sources the intended directory.

## Adding new files

- Place new configs under the closest existing directory.
- Document the expected destination in Manual Installation and the relevant
  tool-specific page.

## Documentation Site Deployment

The public documentation at `https://vidar-50rr.github.io/dotfiles/` is built
from `docs-site/` with Docusaurus and published from the `gh-pages` branch.
That branch stores generated static files only; normal source edits belong on
`master`.

Relevant config lives in `docs-site/docusaurus.config.js`:

- `url: 'https://Vidar-50rr.github.io'`
- `baseUrl: '/dotfiles/'`
- `trailingSlash: false`
- `deploymentBranch: 'gh-pages'`

To update the published site after changing docs or Docusaurus config:

```bash
cd docs-site
pnpm install
pnpm build
USE_SSH=true pnpm deploy
```

If SSH auth is not available, use HTTPS auth instead:

```bash
cd docs-site
GIT_USER=<your-github-user> pnpm deploy
```

`pnpm deploy` builds the site and pushes the generated output to the remote
`gh-pages` branch. Do not edit `gh-pages` by hand and do not merge `master` into
it.

The `gh-pages` branch is a publishing branch, not a source branch. It is normal
for `origin/gh-pages` to appear many commits behind `origin/master`, because it
only needs generated site commits. The useful check is that its latest commit
message references the source commit you deployed, for example
`Deploy website - based on <master-sha>`.

The command deploys from a temporary clone and force-pushes the generated site
to `origin/gh-pages`. If a local `gh-pages` branch looks different after a
deploy, it is usually stale; run `git fetch origin gh-pages` before comparing.
