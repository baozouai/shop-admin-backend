'use strict'
const accountModel = require('../model/accountModel')
// 成功status
const SUCCESSCODE = 0;
// 失败status
const ERRORCODE = 1;
module.exports = {
	// 用户登录验证
	login(req, res) {
		accountModel.login(req, (err, data) => {
			if (err) {
				// 返回错误状态码和错误信息
				return res.end(JSON.stringify({ status: ERRORCODE, message: err.message }))
			}
			// 如果返回data为空，以为这数据库中没有请求登录的账号
			if (data.length == 0) {
				// 返回错误状态码和错误信息：用户名或密码错误
				return res.end(JSON.stringify({ status: ERRORCODE, message: '用户名或密码错误' }))
			}
			// 这里返回的data格式为数组：
			// [ RowDataPacket {
			// 	id: 1,
			// 	user_name: 'admin',
			// 	password: 'e10adc3949ba59abbe56e057f20f883e',
			// 	real_name: '超级管理员' } ]
			// 所以要用data[0]
			let user = { uid: data[0].id, uname: data[0].user_name, realname: data[0].real_name }
			// 登录成功后将用户信息存储在session中
			req.session.admin_user = user;
			res.end(JSON.stringify({ status: SUCCESSCODE, message: user }))

		})
	},
	// 注销
	logout(req, res) {
		// 将admin_user设为null
		if (req.session && req.session.admin_user) {
			req.session.admin_user = null;
		}
		// 成功退出
		res.end(JSON.stringify({ status: SUCCESSCODE, message: '用户已注销' }))
	},
	// 用户列表 
	getList(req, res) {
		accountModel.getList(req, (err, data) => {
			if (err) {
				// 返回错误状态码和错误信息
				res.end(JSON.stringify({ status: ERRORCODE, message: err.message }))
			}
			// 成功响应数据
			res.end(JSON.stringify({ status: SUCCESSCODE, ...data }))
		})
	}
}

