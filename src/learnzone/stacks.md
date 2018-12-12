---
title: Learnzone Stacks
---

# Technical stack

## Rails (API)

- T01:
  - T01.1: [Puma](http://puma.io/)
  - T01.2: ORM: [ActiveRecord](https://guides.rubyonrails.org/active_record_querying.html)
  - T01.3: Web framework: [Rails](https://rubyonrails.org/) [API only version](https://guides.rubyonrails.org/api_app.html)

## Rails (Fullstack)

- T01:
  - T01.1: [Puma](http://puma.io/)
  - T01.2: ORM: [ActiveRecord](https://guides.rubyonrails.org/active_record_querying.html)
  - T01.3: Web:
    - [Rails](https://rubyonrails.org/)
    - [sass-rails](https://github.com/rails/sass-rails) (SCSS)
    - [rails-ujs](https://github.com/rails/rails/tree/master/actionview/app/assets/javascripts) (Ajax)
  - T01.4: documented by [Yard](https://yardoc.org/)
  - T01.5: routed [ActionDispatch](https://guides.rubyonrails.org/routing.html)
  - T01.6
- T02:
  - Auth0
  - Authenticate:
    - [OmniAuth](https://github.com/omniauth/omniauth)
    - [OmniAuth-Auth0](https://github.com/auth0/omniauth-auth0)
  - Verify:
    - [jwt](https://github.com/jwt/ruby-jwt) (API)
- T03:
  - Travis [![Build Status](https://travis-ci.com/Al-un/learnzone-rails.svg?branch=master)](https://travis-ci.com/Al-un/learnzone-rails)
  - CircleCI [![CircleCI](https://circleci.com/gh/Al-un/learnzone-rails.svg?style=svg)](https://circleci.com/gh/Al-un/learnzone-rails)
- T04:
  - Logging
    - [Lograge](https://github.com/roidrage/lograge)
    - [Lograge-sql](https://github.com/iMacTia/lograge-sql)
    - [Ougai](https://github.com/tilfin/ougai)
    - Tested but not used: Rails default logger, [Logging](https://github.com/TwP/logging)
  - Log aggregation
    - [Loggly](https://www.loggly.com/) via [Logglier](https://github.com/freeformz/logglier)
- T05: Testing
  - [RSpec](http://rspec.info/) (testing library)
  - [FactoryBot](https://github.com/thoughtbot/factory_bot) (entity factories)
  - [Database Cleaner](https://github.com/DatabaseCleaner/database_cleaner)
  - [SimpleCov](https://github.com/colszowka/simplecov) (test coverage) ([guide](https://medium.com/the-code-review/display-your-ruby-test-coverage-using-simplecov-gem-and-codeclimate-6db6336fe409))

- T06: Code quality
  - Code Climate Maintainability [![Maintainability](https://api.codeclimate.com/v1/badges/7bb038bdf3cf874ef3e9/maintainability)](https://codeclimate.com/github/Al-un/learnzone-rails/maintainability)
  - Code Climate test coverage [![Test Coverage](https://api.codeclimate.com/v1/badges/7bb038bdf3cf874ef3e9/test_coverage)](https://codeclimate.com/github/Al-un/learnzone-rails/test_coverage)
  - CodeBeat [![codebeat badge](https://codebeat.co/badges/ad1591f7-9321-475e-af03-482b6c296e5f)](https://codebeat.co/projects/github-com-al-un-learnzone-rails-master)
  - Codacy [![Codacy Badge](https://api.codacy.com/project/badge/Grade/09fa7d649b2c4b488755f37c12644207)](https://www.codacy.com/app/alun/learnzone-rails?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=Al-un/learnzone-rails&amp;utm_campaign=Badge_Grade)

## Node.js

- T01:
  - T01.1: `?`
  - T01.2: ORM: [Sequelize](http://docs.sequelizejs.com/)
  - T01.3: Web framework:
    - [Method-override](https://github.com/expressjs/method-override) to handle `PUT` and `DELETE` forms
    - [Express](https://expressjs.com/)
    - [Body-parser](https://www.npmjs.com/package/body-parser)
    - [Handlebars](https://handlebarsjs.com/)
    - [Express-handlebars](https://github.com/ericf/express-handlebars)
    - [Node-sass](https://github.com/sass/node-sass) (SCSS)
    - [Nodemon](https://nodemon.io/) (local hot deploy. `npm run dev`
      instead of `npm start` from [this guide](https://dev.to/whoisryosuke/nextjs-tip-hot-reloading-for-dynamic-servers-43ed))
  - T01.4: ? documentation
  - T01.5: routed by Express
- T02:
  - Auth0
  - Authenticate:
    - [Passport](http://www.passportjs.org/)
    - [Passport-Auth0](https://github.com/auth0/passport-auth0)
    - [Express-session](https://www.npmjs.com/package/express-session)
  - Verify:
    - [Express-jwt]()
    - [Jwks-rsa]()
    - [Express-jwt-authz]()
- T03:
  - Travis [![Build Status](https://travis-ci.com/Al-un/learnzone-node.svg?branch=master)](https://travis-ci.com/Al-un/learnzone-node)
  - CircleCI [![CircleCI](https://circleci.com/gh/Al-un/learnzone-node.svg?style=svg)](https://circleci.com/gh/Al-un/learnzone-node)
- T04:
- T05:
  - [Istanbul](https://istanbul.js.org/)
- T06:
  - Code Climate Maintainability [![Maintainability](https://api.codeclimate.com/v1/badges/8ec5eb36093811e5c539/maintainability)](https://codeclimate.com/github/Al-un/learnzone-node/maintainability)
  - Code Climate Test coverage [![Test Coverage](https://api.codeclimate.com/v1/badges/8ec5eb36093811e5c539/test_coverage)](https://codeclimate.com/github/Al-un/learnzone-node/test_coverage)
  - Codebeat [![codebeat badge](https://codebeat.co/badges/67eaa1bb-4708-4f6f-a88c-81506fff1539)](https://codebeat.co/projects/github-com-al-un-learnzone-node-master)
  - Codacy [![Codacy Badge](https://api.codacy.com/project/badge/Grade/a614ba1c7e0e46e9aebbec85719fdca3)](https://www.codacy.com/app/alun/learnzone-node?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=Al-un/learnzone-node&amp;utm_campaign=Badge_Grade)

## React


- T01:
  - T01.1: ?
  - T01.2: N/A
  - T01.3: Web:
    - [ReactJS](https://reactjs.org/)
    - [node-sass](https://github.com/sass/node-sass) (SCSS)
  - T01.4: documentation?
  - T01.5: routed by [react-router](https://github.com/ReactTraining/react-router)
  - T01.6
- T02:
  - Auth0
  - Authenticate:
    - [Auth0-js](https://github.com/auth0/auth0.js/)
  - Verify:
    - N/A
- T03:
  - CircleCI [![CircleCI](https://circleci.com/gh/Al-un/learnzone-react.svg?style=svg)](https://circleci.com/gh/Al-un/learnzone-react)
- T04:
  - Logging
    - `console.log`...
- T05: Testing
  - [RSpec](http://rspec.info/) (testing library)
  - [FactoryBot](https://github.com/thoughtbot/factory_bot) (entity factories)
  - [Database Cleaner](https://github.com/DatabaseCleaner/database_cleaner)
  - [SimpleCov] (test coverage)
- T06: Code quality: 
  - Code Climate Maintainability [![Maintainability](https://api.codeclimate.com/v1/badges/5e1b2e8d5253145ee15f/maintainability)](https://codeclimate.com/github/Al-un/learnzone-react/maintainability)
  - Code Climate test coverage [![Test Coverage](https://api.codeclimate.com/v1/badges/5e1b2e8d5253145ee15f/test_coverage)](https://codeclimate.com/github/Al-un/learnzone-react/test_coverage)
  - Codebeat [![codebeat badge](https://codebeat.co/badges/0073eaf6-195a-42a7-ab63-a48b1e98ff70)](https://codebeat.co/projects/github-com-al-un-learnzone-react-master)
  - Codacy [![Codacy Badge](https://api.codacy.com/project/badge/Grade/b46e78dca26b48acaef7bf53d39b3a33)](https://www.codacy.com/app/alun/learnzone-react?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=Al-un/learnzone-react&amp;utm_campaign=Badge_Grade)