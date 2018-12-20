---
tech: vue
title: Routing
tags: [vue, router]
sources:
  - name: Vue Router documentaiton
    link: https://router.vuejs.org/
mentioned:
  - /2018/12/16/starting-vuejs
---

### Navigation

To render routed view:

```html
<main id="myApp">
  <router-view/>
</main>
```

To generate navigation links:

```javascript
// src/components/layout/SideMenu.vue
<router-link class="list-group-item" active-class="active" to="/catalogs">
  Catalogs
</router-link>
```

### Browser routing vs Hash routing

By default, Vue router uses a Hash routing such as `mysite.com/#/myroute`. This
can raise issue when bookmark and history are involved. To use browser routing,
use the _history_ mode:

```javascript
// src/routes/index.js

Vue.use(Router);

export default new Router({
  mode: "history",
  routes: [
    // paths here
  ]
});
```
