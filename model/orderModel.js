'use strict'
// 导入自自定义数据库模块
const db = require('./db')
const { execQueryCount } = require('./execQueryCount')

module.exports = {
	// 1 获取订单
	getorderlist(req, callback){
		// 获取订单数据语句
		let sqlCount = `select count(1) as count from orders where 1=1 `;
		// 查询订单语句 订单状态码(status) => 状态名(statusName)
		let sqlQuery = `select orders.*,
	case orders.status when 1 then '待付款' when 2 then '已付款待发货'
	when 3 then '已发货待签收' when 4 then '已签收' when 5 then '已取消' end as statusName,
	payment.title as paymentTitle,
	express.title as expressTitle 
	from orders 
	left join payment on (orders.payment_id = payment.id)
	left join express on (orders.express_id = express.id)
	where 1=1 `;
		/*
			orderstatus:
			1:订单已经生成（待付款）
			2:已付款等待发货
			3:已发货，待完成
			4:已签收，已完成
			5:已取消
		 */
		// 获取会员名
		let vipname = req.query.vipname;
		if (vipname) {
			// 如果有会员名的话，检索包含会员名的数据
			sqlCount += ` and user_name like '%${vipname}%'`;
			sqlQuery += ` and orders.user_name like '%${vipname}%'`;
		}

		//执行分页数据处理
		execQueryCount(req, sqlCount, (err, data) => {
			if (err) {
				// 回调错误
				return callback(err)
			}
			// 将数据从大倒小排列，skipCount为从索引skipCount开始查询pageSize条数据
			sqlQuery += ` order by id desc limit ${data.skipCount},${data.pageSize} `;
			db.query(sqlQuery, (err, data1) => {
				if (err) {
					// 回调错误
					callback(err)
				}
				// 成功回调数据
				callback(null, { ...data, message: data1 })
			});
		});
	}
}