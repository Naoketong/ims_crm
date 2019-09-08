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
    let strUrl = window.location.href;
    let arrUrl = strUrl.split("/");
    let id = arrUrl[arrUrl.length-2];

    let title = $('#articleTitle').val();  
    let classify_id =  PAGE.data.classify_id;
    console.log(title,classify_id)


    // let content = CKEDITOR.instances.editor2.getData();
    // console.log(classify_id)
    // let password = $('#userPassword').val();
    // if(!name || !phone || !password){
    //   alert('请输入必要参数a');
    //   return
    // }

    // console.log(name, phone, password)

    // $.ajax({
    //     url: '/api/user/' + id,
    //     data: { name, phone, password },
    //     type: 'PUT',
    //     beforeSend: function() {
    //       $("#userSubmit").attr("disabled",true);
    //     },

    //     success: function(data) {
    //       if(data.code === 200){
    //         alert('编辑成功！')
    //         location.href = '/admin/user'
    //       }else{
    //         alert(data.message)
    //       }
    //     },
    //     error: function(err) {
    //       console.log(err)
    //     },
    //     complete: function() {
    //       $("#userSubmit").attr("disabled",false);
    //     }
    // })
  }
}

PAGE.init();