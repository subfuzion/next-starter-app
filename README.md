# Overview

This is a starter Next.js app configured for TypeScript. The app is generated
using [@subfuzion/create-next-app].

Configuration boilerplate includes:

-   [TypeScript]
-   [Jest]
-   Linting and formatting
    -   [EditorConfig]
    -   [ESLint]
    -   [Prettier]

The linting and formatting tools have been configured to work together:

-   `.editorconfig` has format settings that feed into Prettier
-   `.eslintrc.json` uses Prettier for formatting

## Development

There are a number of package scripts. Most of the time during development,
you probably want to run: `npm run dev` or `npm run dev:notify`.

Package scripts:

-   `prepare`  
    Configure a git `commit` hook (using [Husky])
    for linting. You need to run this if you cloned this repo instead of
    generating the app using [@subfuzion/create-next-app].

-   `clean`  
    Remove the `.next` directory

-   `build`
    Compile the app to `.next/standalone`.

-   `test` | `test:watch`
    Run tests with [Jest].
    
> **NOTE** - not working yet (wip on the `jest` branch).

-   `lint` | `lint:fix`  
    Report and fix lint issues.  
    When committing staged files, Husky is configured (in `./husky/pre-commit`)
    to run [lint-staged], which gets configuration from `.lintstagedrc.json`.

-   `dev`
    Monitor source files and rebuild.

## License

Licensed under [MIT].

[@subfuzion/create-next-app]: https://github.com/subfuzion/create-next-app/
[EditorConfig]: https://editorconfig.org/
[ESLint]: https://eslint.org/
[Husky]: https://typicode.github.io/husky/
[Jest]: https://jestjs.io/
[lint-staged]: https://github.com/okonet/lint-staged/
[MIT]: ./LICENSE
[Prettier]: https://prettier.io/
[TypeScript]: https://typescriptlang.org/
