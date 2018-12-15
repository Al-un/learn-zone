---
tech: react
title: Testing with Jest and Enzyme
tags: [react, testing]
sources:
  - name: Jest documentation
    link: https://jestjs.io/docs/en/getting-started
  - name: Enzyme documentation
    link: https://airbnb.io/enzyme/
  - name: Redux test writing recipe
    link: https://redux.js.org/recipes/writing-tests*
  - name: Jest cheatsheet
    link: https://devhints.io/jest
mentioned:
  - /2018/12/12/jest-start
  - /2018/12/13/jest-stage-2
---

## Installation

Jest is shipped with `create-react-app` but babel extras are required:

```
yarn add --dev babel-core babel-jest babel-loader babel-polyfill babel-preset-env babel-preset-react
# If you need es6 functions in your component
yarn add --dev babel-plugin-transform-class-properties
```

And add Enzyme:

```
yarn add --dev enzyme enzyme-adapter-react-16
```

Configure some files:

**package.json**:

```json
{
  "jest": {
    "setupTestFrameworkScriptFile": "<rootDir>/src/setupTests.js",
    "moduleNameMapper": {
      "\\.(jpg|jpeg|png|gif|eot|otf|webp|svg|ttf|woff|woff2|mp4|webm|wav|mp3|m4a|aac|oga)$": "<rootDir>/__mocks__/fileMock.js",
      "\\.(css|scss)$": "<rootDir>/__mocks__/styleMock.js"
    }
  }
}
```

**.babelrc**:

```json
{
  "presets": ["env", "react"],
  "plugins": ["transform-class-properties"]
}
```

Create mocks files defined in `package.json`:

**\_\_mocks\_\_/fileMock.js**:

```javascript
module.exports = "test-file-stub";
```

**\_\_mocks\_\_/styleMock.js**:

```javascript
module.exports = {};
```

## Fixing Redux & Saga

When testing, one has to consider API communication: we have to provide a mock API
instead of fetching from an actual API: it is up to API testing to ensure
that requests are properly answers.

### Store

Ensure that store is initialised when tests run.

> For testing purpose, do not set the `<Provider />` in the _index.js_ but in the
> `<App />`(or `<Root />`, whatever you call it).

If you leave the `<Provider />` in _index.js_, you will have the following error:
`Uncaught [Invariant Violation: Could not find "store" in the context of "Connect(_class)". Either wrap the root component in a <Provider>, or pass a custom React context provider to <Provider> and the corresponding React context consumer to Connect(_class) in connect options.]`.

Source:

- [StackOverflow](https://stackoverflow.com/a/52299416/4906586)
- [StackOverflow](https://stackoverflow.com/a/44813705/4906586)

## Snapshot testing

```javascript
/**
 * requires `yarn add --dev react-test-renderer`
 */
import React from "react";
import renderer from "react-test-renderer";
import { MyComponent } from "my-component-path;

describe("My Component", () => {
    it ('match snapshot', () => {
      const tree = renderer
        .create(<MyComponent someparam="somevalue" />)
        .toJSON();
      expect(tree).toMatchSnapshot();
    })
});
```

### API communication
