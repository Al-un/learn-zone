---
title: Learnzone
---

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
