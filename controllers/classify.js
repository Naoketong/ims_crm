const Classify = require('./../models/classify.js');

const classifyController = {
	insert: async function(req,res,next){
    let name = req.body.name;
    if(!name){
      res.json({ code: 0, message: '缺少必要参数' });
      return
    }

    try{
      const classify = await Classify.insert({ name });
      let id = classify[0];
      res.json({ 
        code: 200, 
        message: '添加成功',
        data: { id }
      })
    }catch(e){
      console.log(e)
      res.json({ 
        code: 0,
        message: '内部错误'
      })
    }
  },
  list: async function(req,res,next){
    try{
      const classifys = await Classify.all();
      res.locals.classifys = classifys;
      res.render('admin/classify.tpl',res.locals);
      // res.json({
      //   code:200,
      //   data: classifys
      // })
    }catch(e){
      console.log(e)
      res.json({ 
        code: 0,
        message: '内部错误'
      })
    }
  },
  updata: async function(req,res,next) {
    let name = req.body.name;
    let id = req.params.id;
    
    if(!name){
      res.json({ code: 0, message: '缺少必要参数' });
      return
    }

    try{
      const classify = await Classify.update( id ,{  name });
      res.json({ 
        code: 200, 
        message: '修改成功',
        data: classify
      })
    }catch(err){
      console.log(err)
      res.json({ 
        code: 0,
        message: '内部错误'
      })
    }
  },
  delete: async function(req,res,next){
    let id = req.params.id;
    try{
      await Classify.delete(id);
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
  }
}

module.exports = classifyController;