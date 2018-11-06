# Learning zone

Development to learn basics in some web application or testing specific features. It basically implements a simple e-commerce structure. Basic objects are:

- Article
- Catalog
- Ordering
- OrderItem
- User (Identity is managed by [Auth0](https://auth0.com))

An article can belong to zero (not visible), one or several catalogs.
Relationships are as follow:

Entity          | Relationships     | Entity
---             |---                |--- 
Article         | [0..n] --- [0..n] | Catalog
Article         | [0..n] --- [1..1] | User
Catalog         | [0..n] --- [1..1] | User
Ordering        | [0..n] --- [1..1] | User
Ordering        | [1..1] --- [1..n] | OrderItem
Article         | [1..1] --- [0..n] | OrderItem

# Landscape

### Deployments

whenever possible, apps are deployed on Heroku:

Role        | Language      |  Heroku apps                              | Repository
---         |---            |---                                        |---
Database    | PostgreSQL    | https://learn-pgsql.herokuapp.com/        | (none)
Fullstack   | Java / JSF    | not deployed                              | [learn-zone-javaee](https://github.com/Al-un/learn-zone-javaee)
Back-end    | Rails         | https://learn-rails-api.herokuapp.com/    | [learn-zone-rails-api](https://github.com/Al-un/learn-zone-rails-api)
Fullstack   | Rails         | https://learn-rails-fullstack.herokuapp.com/ | [learn-zone-rails](https://github.com/Al-un/learn-zone-rails)

### Components

 - Rails (Fullstack):
    - ORM: [ActiveRecord](https://guides.rubyonrails.org/active_record_querying.html)
    - Testing: TBC
    - Logging:
        - [Lograge](https://github.com/roidrage/lograge)
        - [Lograge-sql](https://github.com/iMacTia/lograge-sql)
        - [Ougai](https://github.com/tilfin/ougai)
        - [Loggly](https://www.loggly.com/) via [Logglier](https://github.com/freeformz/logglier)
    - Serialization: TBC

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

