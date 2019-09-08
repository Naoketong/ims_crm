{% extends './../admin_layout.tpl' %}

{% block content %}
<div class="user-section">
	<a href="/admin/classify/create" class="user-add_button">添加分类</a>
	<ul class="user-list">
		<li class="user-item top">
			<div class="user-items" style="width: 33.33%;">代号</div>
			<div class="user-items" style="width: 33.33%;">分类名称</div>
			<div class="user-items" style="width: 33.33%;">操作</div>
		</li>
		{% for val in classifys %}
		<li class="user-item">
			<div class="clsssify-items">{{val.id}}</div>
			<div class="clsssify-items">{{val.name}}</div>
			<div class="clsssify-items operation">
				<a class="items-operation" href="/admin/classify/{{val.id}}/edit">编辑</a>
				<a class="items-operation del" data-index="{{val.id}}">删除</a>
			</div>
		</li>
		{% endfor %}
	</ul>
</div>
{% endblock %}

{% block js %}
<script src="/javascripts/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	const PAGE = {
	  init: function() {
	    this.bind();
	  },
	  bind: function() {
	    $('.items-operation.del').bind('click',this.handleDel);
	  },
	  handleDel: function(e) {
	    let id = e.target.dataset.index;
	    id = Number(id);
	    $.ajax({
	      url: '/api/classify/' + id,
	      data: {},
	      type: 'DELETE',
	      beforeSend: function() {
	      },
	      success: function(data) {
	        if(data.code === 200){
	          alert('删除成功！')
	          location.href = '/admin/classify'
	        }else{
	          alert(data.message)
	        }
	      },
	      error: function(err) {
	        console.log(err)
	      },
	      complete: function() {
	      }
	    })
	  }
	}
	PAGE.init();
</script>
{% endblock %}