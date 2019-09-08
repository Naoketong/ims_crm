{% extends './../admin_layout.tpl' %}

{% block content %}
<div class="user-section">
	<a href="/admin/user/create" class="user-add_button">添加用户</a>
	<ul class="user-list">
		<li class="user-item top">
			<div class="user-items">代号</div>
			<div class="user-items">姓名</div>
			<div class="user-items">电话</div>
			<div class="user-items">操作</div>
		</li>

		{% for val in user %}
    <li class="user-item">
			<div class="user-items id" data-index="">{{val.id}}</div>
			<div class="user-items">{{val.name}}</div>
			<div class="user-items">{{val.phone}}</div>
			<div class="user-items operation">
				<a class="items-operation" href="/admin/user/{{val.id}}/edit">编辑</a>
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
	      url: '/api/user/' + id,
	      data: {},
	      type: 'DELETE',
	      beforeSend: function() {
	        $("#userSubmit").attr("disabled",true);
	      },
	      success: function(data) {
	        if(data.code === 200){
	          alert('删除成功！')
	          location.href = '/admin/user'
	        }else{
	          alert(data.message)
	        }
	      },
	      error: function(err) {
	        console.log(err)
	      },
	      complete: function() {
	        $("#userSubmit").attr("disabled",false);
	      }
	    })
	  }
	}
	PAGE.init();
</script>
{% endblock %}