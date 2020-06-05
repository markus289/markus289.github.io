---
layout: default
title: Recipes
permalink: /recipes/
---

## {{ page.title }}

<ul class="clean-ul">
{% assign recipes = site.recipes | sort_natural: 'title' %}
{% for recipe in recipes %}
    <li><a href="{{ recipe.url | prepend: site.baseurl }}">{{ recipe.title }}</a></li>
{% endfor %}
</ul>
