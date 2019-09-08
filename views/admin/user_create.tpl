{% extends './../admin_layout.tpl' %}

{% block content %}
<link rel="stylesheet" href="/stylesheets/adaptive_01.css"/>

  <div class="content-redact">
    <div class="content-title">新增人员</div>
    <div class="content-control">
      <a href="/admin/user" class="content-skip">返回用户列表 >></a>
    </div>
  </div>
  <div class="form-section">
    <div class="form-item">
      <input id="userName" type="text" class="form-input" placeholder="姓名"/>
    </div>
    <div class="form-item">
      <input id="userPhone" type="text" class="form-input" placeholder="电话"/>
    </div>
    <div class="form-item">
      <input id="userPassword" type="text" class="form-input" placeholder="密码"/>
    </div>
    <div class="form-item">
      <input id="userId"  type="text" hidden value="{{user.id}}" />
      <button id="userSubmit" class="form-button">新增</button>
    </div>
  </div>

{% endblock %}

{% block js %}
<script src="/javascripts/jquery-3.3.1.min.js"></script>
<script src="/javascripts/user/user_create.js"></script>
{% endblock %}