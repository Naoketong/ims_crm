const Article = require('./../models/article.js');
const Classify = require('./../models/classify.js');
const { formatTime } = require('./../utils/date.js');

const pageControllers = {
	show: async function(req,res,next) {
    try{
      const id = req.params.id;
      const articles = await Article
      .where({'article.id':id})
      .leftJoin('classify', 'article.classify_id', '=', 'classify.id')
      .select('article.title',{classify_name: 'classify.name'},{classify_id: 'classify.id'},'article.created_time','article.id','article.content',)
      articles.map(data=>{
				data.created_time = formatTime(data.created_time)
			})
      let article = articles[0];
			let classify = await Classify.all();
			res.locals.classify = classify;
      res.locals.article = article;
			res.render('displayPage/pageDetails.tpl',res.locals);
      // res.json({
      //   code:200,
      //   data: article
      // })
    }catch(err){
      // console.log(err)
      // res.json({ 
      //   code: 0,
      //   message: '内部错误'
      // })
    }
  },
	list: async function(req,res,next) {
		try{
			let article = await Article
			.all()
			.leftJoin('classify', 'article.classify_id', '=', 'classify.id')
      .select('article.title',{classify_name: 'classify.name'},'article.created_time','article.id','article.content',)
			.orderBy('id', 'desc');
			article.map(data=>{
				data.created_time = formatTime(data.created_time)
			})
			res.locals.article = article;
			let classify = await Classify.all();
			res.locals.classify = classify;
			res.render('displayPage/pageArticle.tpl',res.locals);
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
  classify: async function(req,res,next) {
  	let id = req.params.id;
		try{
			const classify = await Classify.all();
			res.locals.classify = classify;
			res.render('displayPage/page.tpl',res.locals);
			// res.json({
			// 	code:200,
			// 	message:'获取成功',
			// 	data:classify,
			// })
		}catch(err){
			console.log(err);
			res.json({
				code:0,
				message:'获取失败', 
			})
		}
	},
	classifyArticle: async function(req,res,next){
		let id = req.params.id;
		try{
			const classifyContent = await Classify
			.where({'classify.id':id})
			.leftJoin('article', 'article.classify_id', '=', 'classify.id')
      .select('article.title',{classify_name: 'classify.name'},'article.created_time','article.id','article.content',)
      classifyContent.map(data=>{
				data.created_time = formatTime(data.created_time)
			})

			let classify = await Classify.all();
			res.locals.classify = classify;


			res.locals.classifyContent = classifyContent;
			res.render('displayPage/pageClassify.tpl',res.locals);
			// res.json({
			// 	ceshi:id,
			// 	code:200,
			// 	message:'获取成功',
			// 	data:classifyContent,
			// })
		}catch(err){
			console.log(err);
			res.json({
				code:0,
				message:'获取失败', 
			})
		}
	},
	
	
}

module.exports = pageControllers;