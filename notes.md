---
layout: default
title: Notes
permalink: /notes/
---

## {{ page.title }}

<ul>
{% assign notes = site.notes | sort_natural: 'title' %}
{% for note in notes %}
    <li><a href="{{ note.url | prepend: site.baseurl }}">{{ note.title }}</a></li>
{% endfor %}
</ul>
