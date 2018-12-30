---
tech: travis
title: Encrypting variables
tags: [travis]
sources:
  - name: Travis encryption documentation
    link: https://docs.travis-ci.com/user/encryption-keys/
---

Encryption is done via Travis CLI which is a Ruby gem:

```
gem install travis
```

Then login. Go to Github > Settings > Developper Settings > Personal access tokens.
Generate a new token and **make sure you save the token** as you will not see it again.
Full control over private repositories is required. Such authorisation cascades to
repositories status, deployment, public ones and invitations.

```
travis login --com --debug --debug-http --github-token XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
```

I have not seen any difference between `--com` and `--pro`. Debugs are for my curiosity only.

- [Github auth token on Travis](https://blog.wyrihaximus.net/2015/09/github-auth-token-on-travis/)
- [By default, Travis CLI connects to .org](https://github.com/travis-ci/travis-ci/issues/10137)
- [Travis CLI requires scopes for GitHub token](https://github.com/travis-ci/travis.rb/issues/367)
