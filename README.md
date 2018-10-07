## Learning zone

Development to learn basics in some web application or testing specific features. It basically implements a simple e-commerce structure. Basic objects are:

- Article
- Catalog
- Ordering
- OrderItem

An article can belong to zero (not visible), one or several catalogs.

## Heroku

when possible, apps are deployed on Heroku:

Role        | Language      |  Heroku apps                              | Repository
---         |---            |---                                        |---
Database    | PostgreSQL    | https://learn-pgsql.herokuapp.com/        | (none)
Full-Stack  | Java / JSF    | not on Heroku                             | [/java](https://github.com/Al-un/learn-zone/tree/master/java)
Back-end    | Rails         | https://learn-rails-api.herokuapp.com/    | [/rails/api](https://github.com/Al-un/learn-zone/tree/master/rails/api)
Front-end   | Rails         | TODO                                      |

To deploy a sub folder on Heroku:

```
git subtree push --prefix rails/api heroku-rails-api master
```
woth `heroku-rails-api`, the remote connected to the heroku app git repository.

Source:
 - https://coderwall.com/p/ssxp5q/heroku-deployment-without-the-app-being-at-the-repo-root-in-a-subfolder