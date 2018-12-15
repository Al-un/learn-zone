---
---

# pouet

Start
{% assign kx_techs = site.kx | group_by : "tech" | sort: "name" %}

{% for kx_tech in kx_techs %}

{% assign kx_tech_info = site.data.kx | where: "collection", kx_tech.name | first %}

- {{ kx_tech.name }} - {{ site.data.kx[kx_tech.name] | inspect }} - {{ kx_tech_info | inspect }}

  {% for kx_item in kx_tech.items %}

  - {{ kx_item.title }} `{{ kx_item.url }}`

  {% endfor %}

{% endfor %}

**pouet**

{% for kx in site.kx %}

- {{ kx.path }}

{% endfor %}

End

Data start

{% for kx in site.data.kx %}

- {{ kx.name}}

  {% for pouet in site.kx[kx.collections] %}

  - {{ pouet }}

  {% endfor %}

{% endfor %}

Data end
