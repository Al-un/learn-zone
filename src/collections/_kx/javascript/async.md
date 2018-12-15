---
tech: javascript
title: Async / await
mentioned:
---

Async cannot be combined with `forEach`:

```javascript
async function printFiles() {
  const files = await getFilePaths();

  await Promise.all(
    files.map(async file => {
      const contents = await fs.readFile(file, "utf8");
      console.log(contents);
    })
  );
}
```

From [StackOverflow](https://stackoverflow.com/a/37576787/4906586)
