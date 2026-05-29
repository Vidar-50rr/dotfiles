# Node Ecosystem Command Runbook

This runbook keeps the most useful commands for `npm`, `nvm`, `node`, and `pnpm` in one place.

## npm

`npm` is the default package manager shipped with Node.js. It installs dependencies, runs package scripts, publishes packages, and manages project metadata through `package.json` and `package-lock.json`.

### Everyday Commands

```bash
npm --version
npm help
npm init
npm init -y
npm install
npm run <script>
npm run
```

### Install Packages

```bash
npm install <package>
npm install --save-dev <package>
npm install --global <package>
```

Short forms:

```bash
npm i <package>
npm i -D <package>
npm i -g <package>
```

### Update Packages

```bash
npm outdated
npm update
npm update <package>
npm install <package>@latest
npm install --global npm@latest
```

### Remove Packages

```bash
npm uninstall <package>
npm uninstall --global <package>
```

### List Installed Packages

```bash
npm list --depth=0
npm list --global --depth=0
npm root
npm root --global
```

### Package Metadata And Config

```bash
npm view <package>
npm view <package> version
npm config list
npm config get prefix
npm cache verify
```

### Security

```bash
npm audit
npm audit fix
```

Use `npm audit fix --force` only when you accept potentially breaking dependency upgrades.

## nvm

`nvm` is Node Version Manager. It installs and switches between multiple Node.js versions per shell session or project.

### Install And Use Node Versions

```bash
nvm install --lts
nvm install <version>
nvm use <version>
nvm use --lts
nvm alias default <version>
```

Examples:

```bash
nvm install 24
nvm use 24
nvm alias default 24
```

### Inspect Versions

```bash
nvm current
nvm ls
nvm ls-remote
nvm ls-remote --lts
node --version
npm --version
```

### Project `.nvmrc`

```bash
nvm install
nvm use
```

When a project has an `.nvmrc`, these commands install or use the version declared in that file.

### Uninstall Versions

```bash
nvm uninstall <version>
```

## node

`node` is the JavaScript runtime. Use it to run JavaScript files, evaluate snippets, inspect runtime information, or open a REPL.

### Basic Commands

```bash
node --version
node
node <file>.js
node -e "console.log(process.version)"
```

### Runtime Inspection

```bash
node -p "process.version"
node -p "process.versions"
node -p "process.execPath"
node -p "process.platform"
node -p "process.arch"
```

### Useful Execution Flags

```bash
node --watch <file>.js
node --env-file=.env <file>.js
node --inspect <file>.js
node --trace-warnings <file>.js
```

Use `node --env-file=.env` only on Node versions that support it.

## pnpm

`pnpm` is a fast package manager for Node.js projects. It uses a content-addressable store and symlinks dependencies into projects, reducing duplicated packages on disk.

### Everyday Commands

```bash
pnpm --version
pnpm install
pnpm run <script>
pnpm <script>
pnpm exec <command>
pnpm dlx <package>
```

### Install Packages

```bash
pnpm add <package>
pnpm add -D <package>
pnpm add -g <package>
```

### Update Packages

```bash
pnpm outdated
pnpm update
pnpm update <package>
pnpm update --latest
pnpm add <package>@latest
```

### Remove Packages

```bash
pnpm remove <package>
pnpm remove -g <package>
```

### List Installed Packages

```bash
pnpm list --depth 0
pnpm list -g --depth 0
pnpm root
pnpm root -g
```

### Store And Cache

```bash
pnpm store path
pnpm store status
pnpm store prune
```

### Work In A Specific Directory

```bash
pnpm --dir <dir> install
pnpm --dir <dir> run <script>
pnpm --dir frontend install
pnpm --dir frontend build
```

This is useful for repositories where Node projects live in subdirectories.

## npm vs pnpm Command Cheat Sheet

| Task | npm | pnpm |
| --- | --- | --- |
| Check version | `npm --version` | `pnpm --version` |
| Initialize package | `npm init` | `pnpm init` |
| Install dependencies | `npm install` | `pnpm install` |
| Add dependency | `npm install <package>` | `pnpm add <package>` |
| Add dev dependency | `npm install --save-dev <package>` | `pnpm add -D <package>` |
| Add global package | `npm install --global <package>` | `pnpm add -g <package>` |
| Remove package | `npm uninstall <package>` | `pnpm remove <package>` |
| Remove global package | `npm uninstall --global <package>` | `pnpm remove -g <package>` |
| Update dependencies | `npm update` | `pnpm update` |
| Update one package | `npm update <package>` | `pnpm update <package>` |
| Show outdated packages | `npm outdated` | `pnpm outdated` |
| List local packages | `npm list --depth=0` | `pnpm list --depth 0` |
| List global packages | `npm list --global --depth=0` | `pnpm list -g --depth 0` |
| Run script | `npm run <script>` | `pnpm run <script>` |
| Run common script | `npm run dev` | `pnpm dev` |
| Execute local binary | `npx <command>` | `pnpm exec <command>` |
| Execute package without installing | `npx <package>` | `pnpm dlx <package>` |
| Show config | `npm config list` | `pnpm config list` |
| Verify cache/store | `npm cache verify` | `pnpm store status` |
| Prune cache/store | Not commonly needed | `pnpm store prune` |

## Quick Diagnostics

```bash
node --version
npm --version
pnpm --version
nvm current
which node
which npm
which pnpm
```

If a project declares a Node version in `.nvmrc`, run:

```bash
nvm install
nvm use
```

Then install dependencies with the package manager expected by that project.
