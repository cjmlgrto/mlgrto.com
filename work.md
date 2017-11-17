---
title: Work
layout: default
permalink: /work/
---
<section class="projects">
	{% for project in site.projects %}
	<div class="project grid">
		<a href="{% if project.link %}{{ project.link }}{% else %}{{ project.url }}{% endif %}" {% if project.link %}target="_blank"{% endif %} class="project--link">
			<figure class="project--image grid--col--full">
				{% if project.preview %}
					{% assign source = project.preview %}
				{% else %}
					{% assign source = project.image %}
				{% endif %}
				<img src="{{ source }}" srcset="{{ source | replace:'.','@2x.' }} 2x" alt="{{ project.title }}"/>
				<div class="project--prompt caps">View Project {% include link-icon.svg %}</div>
			</figure>
		</a>
		<time class="page--subtitle grid--col--mini">{{ project.title }}</time>
		<div class="page--content grid--col--maxi">
			{{ project.content | markdownify }}
		</div>
	</div>
	{% endfor %}
</section>