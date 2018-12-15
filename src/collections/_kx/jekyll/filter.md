---
tech: jekyll
tags: [jekyll, filter]
---

## Filterting arrays with `where`, `group_by` and `sort`

In this website, KX files are sorted by technologies:

```
collections:
    - kx
        - css
        - javascript
        - ...
```

And such technologies are reported in front-matters:

```
---
tech: css
title: Flex
---
```

To generate this left menu (irrelevant tags ommited):

```html
{% raw %}
<!-- Group by "tech" front matter and order tech by name     -->
<!-- Improvement: loop and split by file path?               -->
{% assign kx_techs = site.kx | group_by : "tech" | sort: "name" %}

{% for kx_tech in kx_techs %}

    <!-- User friendly name stored in data -->
    <h4>{{ site.data.kx[kx_tech.name] }}</h4>

    <!-- Loop through grouped items -->
    {% for kx_item in kx_tech.items %}
    <a href="{{ kx_item.url | relative_url }}">
        {{ kx_item.title }}
    </a>
    {% endfor %}

{% endfor %}
{% endraw %}
```

Sources:

- [where and group by](https://blog.webjeda.com/jekyll-filters/#simple-jekyll-filters)
