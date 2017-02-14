---
title: Articles I‘ve written
layout: default
permalink: "/blog/"
---

{% for post in site.posts %}
{% assign currentdate = post.date | date: "%Y" %}
{% if currentdate != date %}
{% unless forloop.first %}</ul>{% endunless %}
<h3>{{ currentdate }}</h3>
<ul class="blog-posts">
{% assign date = currentdate %}
{% endif %}
<li>
	<a href="{% if post.link %}{{ post.link }}{% else %}{{ post.url }}{% endif %}">
		<h2>{{ post.title }}</h2>
		<span class="left">{{ post.subtitle }}</span>
	</a>
</li>
{% if forloop.last %}</ul>{% endif %}
{% endfor %}