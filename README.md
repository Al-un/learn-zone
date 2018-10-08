## Learning zone

Development to learn basics in some web application or testing specific features. It basically implements a simple e-commerce structure. Basic objects are:

- Article
- Catalog
- Ordering
- OrderItem

An article can belong to zero (not visible), one or several catalogs.

## Heroku

### Applications

when possible, apps are deployed on Heroku:

Role        | Language      |  Heroku apps                              | Repository
---         |---            |---                                        |---
Database    | PostgreSQL    | https://learn-pgsql.herokuapp.com/        | (none)
Full-Stack  | Java / JSF    | not on Heroku                             | [/java](https://github.com/Al-un/learn-zone/tree/master/java)
Back-end    | Rails         | https://learn-rails-api.herokuapp.com/    | [/rails/api](https://github.com/Al-un/learn-zone/tree/master/rails/api)
Front-end   | Rails         | TODO                                      |

### Git deploy

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
 
### Misc

To attach the database to another app

```
heroku addons:attach postgresql-learnzone -a {app name}
```

Source:
 - https://devcenter.heroku.com/articles/managing-add-ons
