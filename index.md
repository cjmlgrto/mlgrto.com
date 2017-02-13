---
title: Blog
layout: default
permalink: /
---
{% assign featured = 6 %}
<section class="featured grid">
	{% for post in site.posts limit:featured %}
		<a href="{% if post.link %}{{ post.link }}{% else %}{{ post.url }}{% endif %}" class="featured--tile"{% if post.preview %} style="background-image:url({{ post.preview }});"{% endif %}>
			<article class="featured--content">
				<h1>{{ post.title }}</h1>
				<div class="featured--meta">
					<time class="featured--meta--date">{{ post.date | date: "%B %-d %Y" }}</time>
					<span class="featured--meta--prompt caps">Read Article {% include link-icon.svg %}</span>
				</div>
				{% if post.preview == null %}
					{% if post.subtitle %}
						{{ post.subtitle | markdownify }}
					{% else %}
						{{ post.excerpt | truncatewords: 20 }}
					{% endif %}
				{% endif %}
			</article>
		</a>
	{% endfor %}
</section>
<section class="blog grid">
	{% for post in site.posts offset:featured %}
		{% assign currentdate = post.date | date: "%Y" %}
		{% if currentdate != date %}
			{% unless forloop.first %}</div>{% endunless %}
			<span class="blog--year grid--col--mini caps"><time>{{ currentdate }}</time> Articles</span>
			<div class="blog--items grid--col--maxi">
			{% assign date = currentdate %}
		{% endif %}
			<a href="{% if post.link %}{{ post.link }}{% else %}{{ post.url }}{% endif %}" class="blog--item">
				<article>
					<h1>{{ post.title }}</h1>
					<time class="blog--date">{{ post.date | date: "%B %-d %Y" }}</time>
				</article>
			</a>
		{% if forloop.last %}</div>{% endif %}
	{% endfor %}
</section>