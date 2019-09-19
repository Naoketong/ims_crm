{% extends './page.tpl' %}

{% block content %}
<link rel="stylesheet" href="/stylesheets/page.css"/>
	
	<ul class="pagearticle-list">
		{% for val in classifyContent %}
		<li class="pagearticle-item">
			<a href="/admin/page/article/{{val.id}}" class="pagearticle-link">
				<p class="pagearticle-title">{{val.title}}</p>
				<p class="pagrarticle-data">{{val.created_time}}</p>	
			</a>
		</li>
		{% endfor %}
	</ul>
	
{% endblock %}

{% block js %}
<script src="/javascripts/jquery-3.3.1.min.js"></script>
{% endblock %}