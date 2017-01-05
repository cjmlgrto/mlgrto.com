---
title: Blog
layout: default
permalink: /
---
{% assign featured = 6 %}
<ul class="grid featured-posts">
	{% for post in site.posts limit:featured %}
	<li class="tile"{% if post.preview_image %} style="background-image:url({{ post.preview_image }});"{% endif %}>
		<a href="{{ post.url }}" class="meta">
			<h1>{{ post.title }}</h1>
			<time>{{ post.date | date: "%B %-d %Y" }}</time>
			{% if post.preview_image == null %}
			{% if post.subtitle %}
			<p>{{ post.subtitle }}</p>
			{% else %}
			<p>{{ post.content | strip_html | truncatewords:30 }}</p>
			{% endif %}
			{% endif %}
		</a>
	</li>
	{% endfor %}
</ul>
<section class="container">
	<h2>Articles</h2>
	<ul class="blogroll">
		{% for post in site.posts offset:featured %}
		<li>
			<a href="{{ post.url }}">
				<span>{{ post.title }}</span>
				<time>{{ post.date | date: "%B %-d %Y"}}</time>
			</a>
		</li>
		{% endfor %}
	</ul>
</section>