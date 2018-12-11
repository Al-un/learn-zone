---
layout: default
title: Learnzone
---
# Learning zone

Development to learn basics in some web application by testing specific features.

# Specifications

It basically implements a simple e-commerce structure. 

### Functional

- [**F01**: Minimal CRUD](https://github.com/Al-un/learnzone/issues/1)
- [**F02**: Authentication & Authorization](https://github.com/Al-un/learnzone/issues/2)
- [**F03**: Secure data edition](https://github.com/Al-un/learnzone/issues/3)
- [**F04**: Adding tenancy](https://github.com/Al-un/learnzone/issues/4)
- [**F05**: Priced article publication](https://github.com/Al-un/learnzone/issues/5)
- [**F06**: Products photo](https://github.com/Al-un/learnzone/issues/17)
- [**F07**: notify products crud](https://github.com/Al-un/learnzone/issues/18)

### Technical

- [**T01**: Minimal configuration](https://github.com/Al-un/learnzone/issues/10)
- [**T02**: Identity management](https://github.com/Al-un/learnzone/issues/11)
- [**T03**: CI/CD](https://github.com/Al-un/learnzone/issues/12)
- [**T04**: Logging](https://github.com/Al-un/learnzone/issues/13)
- [**T05**: Testing](https://github.com/Al-un/learnzone/issues/14)
- [**T06**: Code quality](https://github.com/Al-un/learnzone/issues/15)
- [**T07**: Documentation](https://github.com/Al-un/learnzone/issues/16)
- [**T08**: Websocket](https://github.com/Al-un/learnzone/issues/19)

### Design

- [**S01** SASS](https://github.com/Al-un/learnzone/issues/6)
- [**S02** SASS update](https://github.com/Al-un/learnzone/issues/7)
- [**S03** Sidemenu](https://github.com/Al-un/learnzone/issues/8)
- [**S04** Bootstrap](https://github.com/Al-un/learnzone/issues/9)

# Landscape

### Deployments

whenever possible, apps are deployed on Heroku:

| Role      | Stack       | Deployment                                  | Repository                                                            |
| --------- | ----------  | ------------------------------------------- | --------------------------------------------------------------------- |
| Database  | PostgreSQL  | https://learnzone-postgresql.herokuapp.com/ | (none)                                                                |
| Fullstack | Java / JSF  | not deployed                                | [learn-zone-javaee](https://github.com/Al-un/learn-zone-javaee)       |
| API       | Rails       | https://learnzone-rails-api.herokuapp.com/  | [learnzone-rails-api](https://github.com/Al-un/learnzone-rails-api)   |
| Fullstack | Rails       | https://learnzone-rails.herokuapp.com/      | [learnzone-rails](https://github.com/Al-un/learnzone-rails)           |
| Fullstack | NodeJs      | https://learnzone-node.herokuapp.com        | [learnzone-node](https://github.com/Al-un/learnzone-nodejs)           |
| Front-end | React       | TBD                                         | [learnzone-react](https://github.com/Al-un/learnzone-react)           |
|           |             |                                             |                                                                       |

### Shared third party components

To avoid copy-pasting links, here are some third party components used in multiple
projects:

- [Auth0](https://auth0.com) (IDaaS)
- [CodeClimate](https://codeclimate.com/) (code quality)

### Technical stack

#### Rails (API)

- T01:
  - T01.1: [Puma](http://puma.io/)
  - T01.2: ORM: [ActiveRecord](https://guides.rubyonrails.org/active_record_querying.html)
  - T01.3: Web framework: [Rails](https://rubyonrails.org/) [API only version](https://guides.rubyonrails.org/api_app.html)

#### Rails (Fullstack)

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
  - Travis [![Build Status](https://travis-ci.com/Al-un/learn-zone-rails.svg?branch=master)](https://travis-ci.com/Al-un/learn-zone-rails)
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
  - [SimpleCov] (test coverage)
- T06: Code quality: Code Climate
  - [![Maintainability](https://api.codeclimate.com/v1/badges/a1cd2c7d60769ef7a1b9/maintainability)](https://codeclimate.com/github/Al-un/learn-zone-rails/maintainability)
  - [![Test Coverage](https://api.codeclimate.com/v1/badges/a1cd2c7d60769ef7a1b9/test_coverage)](https://codeclimate.com/github/Al-un/learn-zone-rails/test_coverage)
  - Using [SimpleCov](https://github.com/colszowka/simplecov) ([guide](https://medium.com/the-code-review/display-your-ruby-test-coverage-using-simplecov-gem-and-codeclimate-6db6336fe409))

#### Node.js

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
  - Travis [![Build Status](https://travis-ci.com/Al-un/learn-zone-rails.svg?branch=master)](https://travis-ci.com/Al-un/learn-zone-rails)
- T04:
- T05:
  - [Istanbul](https://istanbul.js.org/)
- T06: Code Climate
  - [![Maintainability](https://api.codeclimate.com/v1/badges/b417fe74ebe4a8870cc8/maintainability)](https://codeclimate.com/github/Al-un/learn-zone-nodejs/maintainability)
  - [![Test Coverage](https://api.codeclimate.com/v1/badges/b417fe74ebe4a8870cc8/test_coverage)](https://codeclimate.com/github/Al-un/learn-zone-nodejs/test_coverage)

# Notes

### Heroku Git deploy

To deploy a sub folder on Heroku:

```
git subtree push --prefix rails/api heroku-rails-api master
```

with `heroku-rails-api`, the remote connected to the heroku app git repository. In case of fast-forward merge issues, force push with:

```
git push heroku-rails-api `git subtree split --prefix rails/api/ master`:master --force
```

The error is

```
git push using:  heroku-rails-api master
To https://git.heroku.com/learn-rails-api.git
 ! [rejected]        42ec0434bb179af1e134ab73ba852922e92294b9 -> master (non-fast-forward)
error: failed to push some refs to '{git address}
hint: Updates were rejected because the tip of your current branch is behind
hint: its remote counterpart. Integrate the remote changes (e.g.
hint: 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```

Source:

- https://coderwall.com/p/ssxp5q/heroku-deployment-without-the-app-being-at-the-repo-root-in-a-subfolder
- https://stackoverflow.com/questions/13756055/git-subtree-subtree-up-to-date-but-cant-push

### Heroku Misc

To attach the database to another app

```shell
heroku addons:attach postgresql-learnzone -a {app name}
```

Source:

- https://devcenter.heroku.com/articles/managing-add-ons
