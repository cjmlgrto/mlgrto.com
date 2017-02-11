---
title: Blog

layout: default
permalink: /
---
{% assign featured = 6 %}
<section class="featured grid">
	{% for post in site.posts limit:featured %}
	<a href="{{ post.url }}" class="featured--tile"{% if post.preview %} style="background-image:url({{ post.preview }});"{% endif %}>
		<article class="featured--content">
			<h1>{{ post.title }}</h1>
			<div class="featured--meta">
				<time class="featured--meta--date">{{ post.date | date: "%B %-d %Y" }}</time>
				<span class="featured--meta--prompt caps">Read Article {% include link-icon.svg %}</span>
			</div>
			{% if post.preview == null %}{{ post.excerpt | truncatewords: 20 }}{% endif %}
		</article>
	</a>
	{% endfor %}
</section>