---
tech: git
title: Content versioning
---

## Add

```shell
# list staged changes and un-staged changes
git status
# add all files
git add .
# or add specific file
git add /path/to/my/file.extension
```

## Delete

```shell
# remove local and remote
git rm filename.ext
# remove remote only after commit
git rm --cached filename.ext
# remote remote folder
git rm --cached -r foldername
```
