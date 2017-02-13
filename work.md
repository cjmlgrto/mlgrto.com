---
title: Work
layout: default
permalink: /work
---
<section class="projects grid">
	{% for project in site.projects %}
	<a href="{{ project.url }}" class="project">
		<figure class="project--image grid--col--full">
			{% if project.preview %}
				{% assign source = project.preview %}
			{% else %}
				{% assign source = project.image %}
			{% endif %}
			<img src="{{ source }}" srcset="{{ source | replace:'.','@2x.' }} 2x"/>
		</figure>
	</a>
	{% endfor %}
</section>