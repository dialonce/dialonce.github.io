<header>
	<div class="container">
		<h1>
			<a href="/">
				<img src="{{site.data.cdn.url}}img/dialonce-logo-128.png" alt="Dial Once"/>
			</a>
		</h1>
		<span class="subtitle">developer()</span>
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