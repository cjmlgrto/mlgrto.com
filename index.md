---
title: Blog
layout: default
permalink: /
---
<div class="page-title container">
	<h1>Hello! I'm Carlos Melegrito— a designer studying computer science.</h1>
	<p class="page-subtitle">This is my blog, and I write about design, tech, movies, books and other cool things from around the interwebs. (Basically, anything I can geek out on). Feel free to check out <a href="/work">my portfolio</a>, find out <a href="/info">more about me</a>— or just browse my writing below.</p>

</div>
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
	<h2>Older Articles</h2>
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