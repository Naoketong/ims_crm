const PAGE = {
  init: function() {
    this.bind();
  },
  bind: function() {
    $('#classifySubmit').bind('click',this.handleSubmit);
  },
  handleSubmit: function() {
    console.log(123)
    let name = $('#classifyName').val();
    if(!name){
      alert('请输入必要参数a');
      return
    }
    console.log(name)
    $.ajax({
        url: '/api/classify/',
        data: { name },
        type: 'POST',
        beforeSend: function() {
          $("#userSubmit").attr("disabled",true);
        },
        success: function(data) {
          if(data.code === 200){
            alert('添加成功！')
            location.href = '/admin/classify'
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