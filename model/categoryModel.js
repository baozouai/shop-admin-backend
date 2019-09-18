'use strict'
// 导入数据库模块
const db = require('./db')

module.exports = {
	//1 获取商品分类列表
	getlist(callback) {
		// 创建查询语句 获取分类的id，title即分类名以及其父id
		let sql = `select id as category_id,title,parent_id from category order by category_id `;
		db.query(sql, (err, data) => {
			if (err) {
				// 回调错误
				return callback(err)
			}
			// 成功返回数据
			callback(null, data)
		});
	}
}
