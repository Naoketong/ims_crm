const PAGE = {
  init: function() {
    this.bind();
  },
  bind: function() {
    $('#classifySubmit').bind('click',this.handleSubmit);
    // $('#pahe-user-tuichu').bind('click',this.pahe);
  },
  //  pahe:function(){
  //   location.href = '/admin/login'
  // },
  handleSubmit: function() {
    let strUrl = window.location.href;
    let arrUrl = strUrl.split("/");
    let id = arrUrl[arrUrl.length-2];

    let name = $('#classifyName').val();
    // let phone = $('#userPhone').val();
    // let password = $('#userPassword').val();
    // if(!name || !phone || !password){
    //   alert('请输入必要参数a');
    //   return
    // }

    console.log(name)

    $.ajax({
        url: '/api/classify/' + id,
        data: { name },
        type: 'PUT',
        beforeSend: function() {
          $("#classifySubmit").attr("disabled",true);
        },

        success: function(data) {
          if(data.code === 200){
            alert('编辑成功！')
            location.href = '/admin/classify'
          }else{
            alert(data.message)
          }
        },
        error: function(err) {
          console.log(err)
        },
        complete: function() {
          $("#classifySubmit").attr("disabled",false);
        }
    })
  }
}

PAGE.init();