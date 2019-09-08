{% extends './../admin_layout.tpl' %}

{% block content %}
<link rel="stylesheet" href="/stylesheets/adaptive_01.css"/>

  <div class="content-redact">
    <div class="content-title">新增分类</div>
    <div class="content-control">
      <a href="/admin/classify" class="content-skip">返回分类列表 >></a>
    </div>
  </div>
  <div class="form-section">
    <div class="form-item">
      <input id="classifyName" type="text" class="form-input" placeholder="请输入分类名称"/>
    </div>
      <button id="classifySubmit" class="form-button">新增</button>
    </div>
  </div>

{% endblock %}

{% block js %}
<script src="/javascripts/jquery-3.3.1.min.js"></script>
<script src="/javascripts/classify/classify_create.js"></script>
{% endblock %}