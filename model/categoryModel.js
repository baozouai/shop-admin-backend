'use strict'
const db = require('./db')
//1 获取商品列表
exports.getlist = (callback) => {
	let sql = `select id as category_id,title,parent_id from category order by category_id `;
	db.query(sql, (err, data) => {
		if (err) {
			return callback(err)
		}
		callback(null, data)
	});
}
