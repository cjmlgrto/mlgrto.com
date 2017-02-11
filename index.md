---
title: Blog

layout: default
permalink: /
---

<section class="featured grid">
	{% for post in site.posts limit:6 %}
	<a href="{{ post.url }}" class="featured--tile"{% if post.preview %} style="background-image:url({{ post.preview }});"{% endif %}>
		<article class="featured--content">
			<h1>{{ post.title }}</h1>
			<div class="featured--meta">
				<time class="featured--meta--date">{{ post.date | date: "%B %-d %Y" }}</time>
				<span class="featured--meta--prompt caps">Read Article {% include link-icon.svg %}</span>
			</div>
			{% if post.preview == null %}
			{% if post.subtitle %}
			<p>{{ post.subtitle }}</p>
			{% else %}
			<p>{{ post.content | strip_html | truncatewords:20 }}</p>
			{% endif %}
			{% endif %}
		</article>
	</a>
	{% endfor %}
</section>