'use strict'
const accountModel = require('../model/accountModel')
const SUCCESSCODE = 0;
const ERRORCODE = 1;

//1.0 用户登录验证
exports.login = (req, res) => {
	
	accountModel.login(req, (err, data) => {
		if (err) {
			return res.end(JSON.stringify({status: ERRORCODE, message: err.message}))
		}
		if (data.length == 0) {
			return res.end(JSON.stringify({status: ERRORCODE, message: '用户名或密码错误'}))
		}
		var data = data[0];
		var user = { uid: data.id, uname: data.user_name, realname: data.real_name }
		req.session.admin_user = user;
		res.end(JSON.stringify({status: SUCCESSCODE, message: user}))

	})
}

// 注销
exports.logout = (req, res) => {
	if (req.session && req.session.admin_user) {
		req.session.admin_user = null;
	}

	res.end(JSON.stringify({status: SUCCESSCODE, message: '用户已注销'}))
}

// 用户列表 
exports.getList = (req, res) => {
	accountModel.getList(req, (err, data) => {
		if (err) {
			res.end(JSON.stringify({status: ERRORCODE, message: err.message}))
		}
		res.end(JSON.stringify({status: SUCCESSCODE, ...data}))
	})
}
