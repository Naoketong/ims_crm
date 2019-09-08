var express = require('express');
var router = express.Router();
var userController = require('./../controllers/user.js');
var classifyrController = require('./../controllers/classify.js');
var articleController = require('./../controllers/article.js');


/* GET users listing. */
router.get('/', function(req, res, next) {
  res.render('index');
});
router.get('/layout', function(req, res, next) {
  res.render('admin_layout');
});


router.get('/admin/login', function(req, res, next) {
  res.render('admin/login');
});

router.get('/admin/user',userController.list);
router.get('/admin/user/:id/edit',/*authMiddleware.mustLogin,*/ function(req, res, next) {
  res.render('admin/user_edit');
});
router.get('/admin/user/create',/*authMiddleware.mustLogin,*/ function(req, res, next) {
  res.render('admin/user_create');
});



router.get('/admin/classify', classifyrController.list);
router.get('/admin/classify/:id/edit',/*authMiddleware.mustLogin,*/ function(req, res, next) {
  res.render('admin/classify_edit');
});
router.get('/admin/classify/create',/*authMiddleware.mustLogin,*/ function(req, res, next) {
  res.render('admin/classify_create');
});




router.get('/admin/article',articleController.list);
router.get('/admin/article/create', function(req, res, next) {
  res.render('admin/article_create');
});
router.get('/admin/article/:id/edit',articleController.classify);

module.exports = router;
