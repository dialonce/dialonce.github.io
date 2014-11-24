<header>
	<div class="container">
		<h1>
			<a href="/"><span class="bold">Dial Once</span> Developer</a>
		</h1>
		<ul role="navigation">
			{% for entry in site.data.projects %}
				{% assign current = nil %}
				{% capture currentPage %}/{{ entry.slug }}/index.html{% endcapture %}
				{% if page.url == currentPage %}
					{% assign current = 'active' %}
				{% endif %}
				<li class="bold {{ current }}">
					<a href="/{{ entry.slug }}">{{ entry.name }}</a>
				</li>
			{% endfor %}
		</ul>
	</div>
</header>