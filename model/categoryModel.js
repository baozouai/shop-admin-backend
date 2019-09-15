'use strict'

//1 获取商品列表
exports.getlist = (req, callback) => {
	let sql = `select id as category_id,title,parent_id
				 from category order by category_id `;
	req.db.driver.execQuery(sql, (err, data) => {
		if (err) {
			return callback(err)
		}
		callback(null, data)
	});
}
