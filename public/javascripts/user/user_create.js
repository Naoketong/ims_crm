const PAGE = {
  init: function() {
    this.bind();
  },
  bind: function() {
    $('#userSubmit').bind('click',this.handleSubmit);
  },
  handleSubmit: function() {
    let name = $('#userName').val();
    let phone = $('#userPhone').val();
    let password = $('#userPassword').val();
    if(!name || !phone || !password){
      alert('请输入必要参数a');
      return
    }
    console.log(name, phone, password)
    $.ajax({
        url: '/api/user/',
        data: { name, phone, password },
        type: 'POST',
        beforeSend: function() {
          $("#userSubmit").attr("disabled",true);
        },
        success: function(data) {
          if(data.code === 200){
            alert('添加成功！')
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