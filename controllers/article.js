const Article = require('./../models/article.js');
const Classify = require('./../models/classify.js');
const { formatTime } = require('./../utils/date.js');

const articleControllers = {
	insert: async function(req,res,next) {
		let title = req.body.title;
		let classify_id = req.body.classify_id;
		let content = req.body.content;
		let created_time = new Date();
		try{
			const article = await Article.insert({ 
        title, classify_id, content, created_time
      });
      let id = article[0];

			res.json({
				code:200,
				message:'添加成功',
				data:article,
			})
		}catch(err){
			console.log(err);
			res.json({
				code:0,
				message:'添加失败', 
			})
		}
	},
	show: async function(req,res,next) {
    try{
      const id = req.params.id;
      const articles = await Article.select({ id });
      const article = articles[0];
      res.json({
        code:200,
        data: article
      })
    }catch(e){
      console.log(e)
      res.json({ 
        code: 0,
        message: '内部错误'
      })
    }
  },
	list: async function(req,res,next) {
		let pageSize = req.query.page_size || 10;
    let currentPage = req.query.current_page || 1; 
    // let params = [{pageSize,  currentPage}];
    let count = await Article.count();
    let sum = count[0].sum;
    let pageNumber = Math.ceil(sum / pageSize);
    // let pageArrayNew = new Array(pageNumber).fill('').map((data,index)=> index + 1);
    let pageArray = new Array(pageNumber).fill('').map((data,index)=> index + 1);
   




// let pageArray = pageArrayNew.map((data, index)=> {
// 	return {data}
// });

    res.locals.pagination = {
    	total: sum,
    	pageSize: pageSize,
    	current:currentPage,
    	pageArray: pageArray
    }
    console.log(res.locals.pagination)
		try{
			let article = await Article
			.pagination(pageSize, currentPage)
			.leftJoin('classify', 'article.classify_id', '=', 'classify.id')
      .select('article.title',{classify_name: 'classify.name'},'article.created_time','article.id')
			.orderBy('id', 'desc');
			res.locals.article = article;
			res.render('admin/article.tpl',res.locals);
			// res.json({
			// 	code:200,
			// 	message:'获取成功',
			// 	data:article,
			// })
		}catch(err){
			console.log(err);
			// res.json({
			// 	code:0,
			// 	message:'获取失败', 
			// })
		}
	},
	updata: async function(req,res,next) {
		let id = req.params.id;
		let title = req.body.title;
		let classify_id = req.body.classify_id;
		let content = req.body.content;
		let params = { title, classify_id, content}

		if(!title || !classify_id || !content){
			res.json({code:0, message:'参数缺少'});
			return
		}
		try{

			let article = await Article.update(id,params);

			res.json({
				code:200,
				message:'修改成功',
				data:article,
			})

		}
		catch(err){
			console.log(err);
			res.json({
				code:0,
				message:'修改失败', 
			})
		}
	},
  delete: async function(req,res,next){
    let id = req.params.id;
    try{
      await Article.delete(id);
      res.json({ 
        code: 200, 
        message: '删除成功'
      })
    }catch(e){
      console.log(e)
      res.json({ 
        code: 0,
        message: '内部错误'
      })
    }
  },
  classify: async function(req,res,next) {
  	let id = req.params.id;
		try{
			const article = await Classify.all();
			// let article = await Article.all()
			// .where({})
			// .leftJoin('classify', 'article.classify_id', '=', 'classify.id')
   //    .select('article.title',{classify_name: 'classify.name'},'article.created_time','article.id')
			res.locals.article = article;
			res.render('admin/article_edit.tpl',res.locals);
			// res.json({
			// 	code:200,
			// 	message:'获取成功',
			// 	data:article,
			// })
		}catch(err){
			console.log(err);
			res.json({
				code:0,
				message:'获取失败', 
			})
		}
	},
	addArticle: async function(req,res,next){
		try{
			const article = await Classify.all();
			res.locals.article = article;
			res.render('admin/article_create.tpl',res.locals);
		}catch(err){
			console.log(err);
			res.json({
				code:0,
				message:'获取失败', 
			})
		}
	},
	
}

module.exports = articleControllers;