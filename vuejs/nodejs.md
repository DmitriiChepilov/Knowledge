# Vue.js application

## Project setup
```bash
npm install
```

There is a flag `--lockfile-version` in `npm` with which you can override the default lock file version
```bash
npm install  --lockfile-version 1
```

Update/generate just the lock file without installing the dependencies by adding the flag `--package-lock-only`
```bash
npm install --lockfile-version 1 --package-lock-only
```

### Compiles and hot-reloads for development
```bash
npm run serve
```

### Compiles and minifies for production
```bash
npm run build
```

### Run your unit tests
```bash
npm run test:unit
```

### Lints and fixes files
```bash
npm run lint
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).


# Yarn project A.
```bash
# install yarn
npm install yarn

# run prebuild, build & package
yarn run package
```
