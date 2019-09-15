'use strict'
const md5 = require('md5');

//1.0 用户登录验证
exports.login = (req, callback) => {
	// 获取用户名和密码
	let uname = req.body.uname;
	let upwd = md5(req.body.upwd);
	let sql = `select * from manager where user_name='${uname}' and password='${upwd}'`;
	req.db.driver.execQuery(sql, (err, data) => {
		if (err) {
			return callback(err)
		}
		callback(null, data)
	})
}

// 用户列表 
exports.getList = (req, callback) => {
	let { searchValue } = req.query
	let sqlCount = `select count(1) as count from users`;
	//执行分页数据处理
	execQueryCount(req, sqlCount, (err, data) => {
		if (err) {
			return callback(err)
		}
		let sql = `select * from users`;
		if (searchValue) {
			sql += ` where user_name like '%${searchValue}%' `;
		}
		sql += ` order by id desc limit ${data.skipCount},${data.pageSize}`;
		execQuery(req, sql, (err, data1) => {
			if (err) {
				callback(err)
			}
			callback(null, {...data, message: data1})
		});
	});
}

//辅助方法获取分页总条数
function execQueryCount(req, sql, callback) {
	// 先设置默认值
	let pageIndex = 1;
	let pageSize = 10;
	// 判断是否有页码
	if (req.query.pageIndex) {
		pageIndex = parseInt(req.query.pageIndex);
	}
	// 判断是否有每页数量
	if (req.query.pageSize) {
		pageSize = parseInt(req.query.pageSize);
	}
	// 如果是空值的话，返回错误
	if (isNaN(req.query.pageIndex) || isNaN(req.query.pageSize)) {
		callback({ message: '参数错误：分页参数pageIndex和pageSize必须是数字' })
		return;
	}
	let skipCount = (pageIndex - 1) * (pageSize - 0);
	req.db.driver.execQuery(sql, (err, data) => {
		if (err) {
			callback(err)
		}
		//回调继续处理其他业务
		callback(null, {totalcount:data[0].count, pageIndex, pageSize, skipCount })
	});
}

//执行sql语句，完成逻辑
function execQuery(req, sql, callback) {
	req.db.driver.execQuery(sql, (err, data) => {
		if (err) {
			return callback(err)
		}
		callback(null, data)
	});

};