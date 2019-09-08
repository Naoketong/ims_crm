const User = require('./../models/user.js');
const { formatTime } = require('./../utils/date.js');

const UserControllers = {
	insert: async function(req,res,next) {
		let name = req.body.name;
		let phone = req.body.phone;
		let password = req.body.password;
		let created_time = new Date();
		try{
			const user = await User.insert({ 
        name, phone, password, created_time
      });
      let id = user[0];

			res.json({
				code:200,
				message:'新增成功',
			})
		}catch(err){
			console.log(err);
			res.json({
				code:0,
				message:'新增失败', 
			})
		}
	},
	list: async function(req,res,next) {
		try{
			const user = await User.all();
			res.locals.user = user;
			res.render('admin/user.tpl',res.locals);
			// res.json({
			// 	code:200,
			// 	message:'获取成功',
			// 	data:user,
			// })
		}catch(err){
			console.log(err);
			res.json({
				code:0,
				message:'获取失败', 
			})
			res.locals.error = err;
      res.render('error',res.locals);
		}
	},
	
	updata: async function(req,res,next) {
		let id = req.params.id;
		let name = req.body.name;
		let phone = req.body.phone;
		let password = req.body.password;
		let params = { name, phone, password}

		if(!name || !phone || !password){
			res.json({code:0, message:'参数缺少'});
			return
		}
		try{

			let user = await User.update(id,params);

			res.json({
				code:200,
				message:'修改成功',
				data:user,
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
	delete:async function(req,res,next) {
		let id = req.params.id;
		try{
			let user = await User.delete(id);
			res.json({
				code:200,
				message:'修改成功',
				data:user,
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
	
}

module.exports = UserControllers;