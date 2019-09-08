{% extends './../admin_layout.tpl' %}

{% block content %}
<div class="user-section">
  <a class="user-add_button" href="/admin/article" style="width: 110px;">返回文章列表</a>
  <ul class="user-list">
    
    <div class="article-section">
      <span class="article-title">标题</span>
      <input id="articleTitle" type="text" class="article-input" placeholder="{{val.title}}">
    </div>

    <!-- <select id="userRole" class="form-input">
          <option value="0">请选择角色</option>
          <option value="1" {% if user.role == 1 %} selected {% endif %}>管理员</option>
          <option value="2" {% if user.role == 2 %} selected {% endif %}>销售</option>
          
        </select> -->

        <div class="article-section">
          <span class="article-title">分类</span>
          <select class="article-form-input" id="option_id">
            <!-- <option value="0">请选择分类</option> -->
            {% for val in article %}
            <option value="{{val.id}}" class="option_id" data-index="{{val.id}}">{{val.name}}</option>
            {% endfor %}
          </select>
        </div>
    


    <div class="article-section">
      <span class="article-title">内容</span>
      <textarea  name="editor2" id="editor2" rows="200" cols="100">{{article.text}}</textarea>

      <!-- <input type="text" class="article-input text"> -->
      <!-- <textarea class="article-input text"></textarea> -->
    </div>
    
    <div class="new-button" id="articleSubmit">新建</div>
  

  </ul>
</div>
{% endblock %}

{% block js %}
<script src="/javascripts/jquery-3.3.1.min.js"></script>
<!-- <script src="https://cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script> -->
<script src="https://cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script>
<script type="text/javascript">
  CKEDITOR.replace('editor2', {
    height:100,
    width:1000,
    
  })
</script>
<script src="/javascripts/article/article_edit.js"></script>
{% endblock %}