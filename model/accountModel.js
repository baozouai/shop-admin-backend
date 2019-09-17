'use strict'
const md5 = require('md5');
const db = require('./db')
const { execQueryCount } = require('./execQueryCount')
//1.0 用户登录验证
exports.login = (req, callback) => {
	// 获取用户名和密码
	let uname = req.body.uname;
	// 数据库中密码是md5格式，所以这里请求登录的密码转换为md5格式
	let upwd = md5(req.body.upwd);
	// 创建查询语句
	let sql = `select * from manager where user_name='${uname}' and password='${upwd}'`;
	db.query(sql, (err, data) => {
		if (err) {
			// 如果查询错误，回调返回错误
			return callback(err)
		}
		// 成功的话回调数据信息
		callback(null, data)
	})
}

// 用户列表 
exports.getList = (req, callback) => {
	// 解构出查找的值
	let { username } = req.query
	// 为了优化性能，这里不用count(*)
	let sqlCount = `select count(1) as count from users`;
	//执行分页数据处理
	execQueryCount(req, sqlCount, (err, data) => {
		if (err) {
			// 回调错误
			return callback(err)
		}
		// 创建查询语句
		let sql = `select * from users`;
		if (username) {
			// 如果有查找值，则加上以下语句，即查找用户名类似username的
			sql += ` where user_name like '%${username}%' `;
		}
		// 按降序排列，skipCount为从索引skipCount开始查询pageSize条数据
		sql += ` order by id desc limit ${data.skipCount},${data.pageSize}`;
		db.query(sql, (err, data1) => {
			if (err) {
				// 回调错误
				callback(err)
			}
			// 错误为null，并回调数据，这里需要将data先解构
			callback(null, { ...data, message: data1 })
		});
	});
}


