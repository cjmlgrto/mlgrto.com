---
title: Some of my work
layout: default
permalink: "/work/"
---

{% for project in site.projects %}
<div class="project">
	<figure class="pull-left">
		<img src="{{ project.images[0] }}"/>
	</figure>
	<figure class="push-left">
		<img src="{{ project.images[1] }}"/>
	</figure>

	<h2>{{ project.title }}</h2>
	{% if project.subtitle %}<h3>{{ project.subtitle }}</h3>{% endif %}

	{{ project.content }}
</div>
{% endfor %}