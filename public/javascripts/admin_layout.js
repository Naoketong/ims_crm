const PAGES = {
  init: function() {
    this.bind();
  },
  bind: function() {
    $('.page-nav-item.button').bind('click',this.handleActive);
    $('.page-quit').bind('click', this.handquit)
  },
  handleActive: function(e) {
   $('.page-nav').toggleClass("active")
  },
  handquit: function(){
    // console.log(13)
    location.href = '/admin/login'
  },
}
PAGES.init();