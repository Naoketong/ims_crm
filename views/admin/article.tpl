{% extends './../admin_layout.tpl' %}

{% block content %}
<div class="user-section">
	<a href="/admin/article/create" class="user-add_button">添加文章</a>
	<ul class="user-list">
		<li class="user-item top">
			<div class="user-items">代号</div>
			<div class="user-items">标题</div>
			<div class="user-items">分类</div>
			<div class="user-items">操作</div>
		</li>
		{% for val in article %}
		<li class="user-item">
			<div class="user-items">{{val.id}}</div>
			<div class="user-items">{{val.title}}</div>
			<div class="user-items">{{val.classify_name}}</div>
			<div class="user-items operation">
				<a class="items-operation" href="/admin/article/{{val.id}}/edit">编辑</a>
				<a class="items-operation">删除</a>
			</div>
		</li>
		{% endfor %}
	</ul>
</div>
{% endblock %}