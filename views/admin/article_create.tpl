{% extends './../admin_layout.tpl' %}

{% block content %}
<div class="user-section">
	<a class="user-add_button" href="/admin/article" style="width: 110px;">返回文章列表</a>
	<ul class="user-list">
		<div class="article-section">
			<span class="article-title">标题</span>
			<input type="text" class="article-input">
		</div>

		<!-- <select id="userRole" class="form-input">
		      <option value="0">请选择角色</option>
		      <option value="1" {% if user.role == 1 %} selected {% endif %}>管理员</option>
		      <option value="2" {% if user.role == 2 %} selected {% endif %}>销售</option>
		      
		    </select> -->
		    <div class="article-section">
					<span class="article-title">标题</span>
					<select id="userRole" class="article-form-input">
					  <!-- <option value="0">请选择分类</option> -->
					  <option value="1" >保时捷</option>
					  <option value="2" >宝马</option>
					</select>
				</div>
		


		<div class="article-section">
			<span class="article-title">内容</span>
			<!-- <input type="text" class="article-input text"> -->
			<textarea class="article-input text"></textarea>
		</div>

		<div class="new-button">新建</div>
	

	</ul>
</div>
{% endblock %}