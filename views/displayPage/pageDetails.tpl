{% extends './page.tpl' %}

{% block content %}
<link rel="stylesheet" href="/stylesheets/page.css"/>
	<div class="page-article-item">
		<h2 class="item-title">{{article.title}}</h2>
		<p class="item-issue">发布时间：{{article.created_time}}</p>
		<p class="item-classify">分类：<a href="javascript:;">{{article.classify_name}}</a></p>
		<p class="item-content">{{article.content | safe}}</p>
	</div>
	
{% endblock %}

{% block js %}
<script src="/javascripts/jquery-3.3.1.min.js"></script>
{% endblock %}