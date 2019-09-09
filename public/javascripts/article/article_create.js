const PAGE = {
  data:{
    classify_id:'',
  },
  init: function() {
    this.bind();
  },
  bind: function() {
    $('#articleSubmit').bind('click',this.handleSubmit);
    $('#option_id').bind('click',this.handOption);
  },
  handOption:function(e){
    $('#option_id').change(function(){
     let classify_id =  $('#option_id').val();
     PAGE.data.classify_id = classify_id;
    }) 
  },
  handleSubmit: function() {
    let title = $('#articleTitle').val();  
    let classify_id =  PAGE.data.classify_id;
    let content = CKEDITOR.instances.editor1.getData();

    if(!title || !classify_id || !content){
      alert('请输入必要参数a');
      return
    }

    $.ajax({
        url: '/api/article/',
        data: { title, classify_id, content },
        type: 'POST',
        beforeSend: function() {
          $("#articleSubmit").attr("disabled",true);
        },
        success: function(data) {
          if(data.code === 200){
            alert('添加成功！')
            location.href = '/admin/article'
          }else{
            alert(data.message)
          }
        },
        error: function(err) {
          console.log(err)
        },
        complete: function() {
          $("#articleSubmit").attr("disabled",false);
        }
    })
  }
}

PAGE.init();