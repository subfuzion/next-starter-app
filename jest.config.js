const { pathsToModuleNameMapper } = require("ts-jest");
const { compilerOptions } = require("./tsconfig");

/** @type {import('ts-jest').JestConfigWithTsJest} */
module.exports = {
    preset: "ts-jest",
    testEnvironment: "node",
    testPathIgnorePatterns: [".next"],
    coveragePathIgnorePatterns: ["next"],
    rootDir: ".",
    roots: ["<rootDir>"],
    modulePaths: [compilerOptions.baseUrl],
    moduleNameMapper: pathsToModuleNameMapper(compilerOptions.paths),
    testMatch: [
        "**/[__]?tests[__]?/**/*.[jt]s?(x)",
        "**/?(*.)+(spec|test).[jt]s?(x)",
    ],
};
