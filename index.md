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
			{% if post.preview == null %}
				{% if post.subtitle %}
					<p>{{ post.subtitle }}</p>
				{% else %}
					{{ post.excerpt | truncatewords: 20 }}
				{% endif %}
			{% endif %}
		</article>
	</a>
	{% endfor %}
</section>

<section class="blog grid">
	<time class="blog--year grid--col--mini">2016</time>
	<div class="blog--items grid--col--maxi">
		<a href="#" class="blog--item">
			<article>
				<h1>Recommended Resources</h1>
				<time class="blog--date">January 27</time>
			</article>
		</a>
		<a href="#" class="blog--item">
			<article>
				<h1>Recommended Resources</h1>
				<time class="blog--date">January 27</time>
			</article>
		</a>
		<a href="#" class="blog--item">
			<article>
				<h1>Recommended Resources</h1>
				<time class="blog--date">January 27</time>
			</article>
		</a>
		<a href="#" class="blog--item">
			<article>
				<h1>Recommended Resources</h1>
				<time class="blog--date">January 27</time>
			</article>
		</a>
	</div>

	<time class="blog--year grid--col--mini">2016</time>
	<div class="blog--items grid--col--maxi">
		<a href="#" class="blog--item">
			<article>
				<h1>Recommended Resources</h1>
				<time class="blog--date">January 27</time>
			</article>
		</a>
		<a href="#" class="blog--item">
			<article>
				<h1>Recommended Resources</h1>
				<time class="blog--date">January 27</time>
			</article>
		</a>
		<a href="#" class="blog--item">
			<article>
				<h1>Recommended Resources</h1>
				<time class="blog--date">January 27</time>
			</article>
		</a>
		<a href="#" class="blog--item">
			<article>
				<h1>Recommended Resources</h1>
				<time class="blog--date">January 27</time>
			</article>
		</a>
	</div>
</section>