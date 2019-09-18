<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>{{title}}</title>
  <!-- <link rel="stylesheet" href="/stylesheets/reset.css"/> -->
  <link rel="stylesheet" href="/stylesheets/admin_layout.css"/>
  {% block css %}
  {% endblock %}
</head>
<body>
  <div class="wrapper">
    <header class="page-header">
    	<div class="page-logo">
    		<img src="https://files.porsche.cn/filestore/image/multimedia/none/875d5e3d-6763-47fe-bc52-809142d53274/svg/d4c766d7-7761-11e7-99c7-0019999cd470/porsche-svg.svg">
    	</div>
    	<div class="page-quit" style="background-color: #67C23A;">欢迎光临!</div>
    </header>
    <div class="page-body">
      <div class="page-aside" style="background-color: #67C23A;">
        <nav class="page-nav">
          <ul>
            <li>
              <a class="page-nav-item" href="/">全部文章</a>
            </li>
          
            <li class="page-nav">
              <div class="page-nav-item button" style="cursor: pointer;">文章分类</div>
              <a class="page-nav-item child">分类</a>
            </li>
          </ul>
        </nav>
      </div>
      <div class="page-content">
        {% block content %}
        {% endblock %}
      </div>
    </div>
    <footer class="page-footer" style="background-color: #67C23A;">Copyright © 2019 极客学院体验技术部出品</footer>
  </div>

    {% block js %}
    <script src="/javascripts/jquery-3.3.1.min.js"></script>
    {% endblock %}
  <script src="/javascripts/admin_layout.js"></script>
</body>
</html>