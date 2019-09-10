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
				<a class="items-operation del" data-index="{{val.id}}">删除</a>
			</div>
		</li>
		{% endfor %}
	</ul>

<!-- 	<ul class="paging-list">
		{% for val in params %}
		<li class="paging-item" data-index="{{val.currentPage}}">{{val.currentPage }}</li>
		{% endfor %}
	</ul> -->
	{% for val in pagination.pageArray.length   %}
		<ul class="paging-list">
			{% for val in pagination.pageArray  %}
			<li class="paging-item">{{pagination.pageArray}}</li>
			{% endfor %}}
		</ul>
		{% endfor %}
</div>
{% endblock %}

{% block js %}
<script src="/javascripts/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	const PAGE = {
		data:{
			// pagination: {
   //      total: 0,
   //      currentPage: 1,
   //      pageSize: 10
   //    },
		},
	  init: function() {
	    this.bind();
	    // this.paging();
	  },
	  bind: function() {
	    $('.items-operation.del').bind('click',this.handleDel);
	    $('.paging-item').bind('click',this.paging)
	  },
	  // paging: function(e){
	  // 	let arr = e.target.dataset.index;
	  // 	PAGE.data.currentPage = arr;
	  // 	console.log(PAGE.data.currentPage)

	  // },
	  handleDel: function(e) {
	    let id = e.target.dataset.index;
	    id = Number(id);
	    $.ajax({
	      url: '/api/article/' + id,
	      data: {},
	      type: 'DELETE',
	      beforeSend: function() {
	        // $("#userSubmit").attr("disabled",true);
	      },
	      success: function(data) {
	        if(data.code === 200){
	          alert('删除成功！')
	          location.href = '/admin/article'
	        }else{
	          alert(data.message)
	        }
	      },
	      error: function(err) {
	        console.log(err)
	      },
	      complete: function() {
	        // $("#userSubmit").attr("disabled",false);
	      }
	    })
	  }
	}
	PAGE.init();
</script>
{% endblock %}