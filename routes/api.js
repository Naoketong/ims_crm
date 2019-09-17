var express = require('express');
var router = express.Router();

let userControllers = require('./../controllers/user')
let articleControllers = require('./../controllers/article')
let classifyControllers = require('./../controllers/classify')
let authController = require('./../controllers/auth.js');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

// 管理员
router.post('/user' ,userControllers.insert);
router.get('/user' ,userControllers.list);
router.put('/user/:id' ,userControllers.updata);
router.delete('/user/:id' ,userControllers.delete);

// 文章article
router.post('/article' ,articleControllers.insert);
router.get('/article' ,articleControllers.list);
router.get('/article/:id' ,articleControllers.show)
router.put('/article/:id' ,articleControllers.updata);
router.delete('/article/:id' ,articleControllers.delete);

// 分类

router.post('/classify' ,classifyControllers.insert);
router.get('/classify' ,classifyControllers.list);
router.put('/classify/:id' ,classifyControllers.updata);
// router.get('/classify/:id' ,classifyControllers.show)

router.delete('/classify/:id' ,classifyControllers.delete);

// 登录
router.post('/login',authController.login )



module.exports = router;
