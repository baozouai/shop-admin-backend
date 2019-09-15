'use strict'

// 1 获取订单
exports.getorderlist = (req, callback) => {

	let sqlCount = `select count(1) as count from orders where 1=1 `;
	let sqlQuery = `select orders.*,case orders.status when 1 then '待付款' when 2 then '已付款待发货'
	 when 3 then '已发货待签收' when 4 then '已签收' when 5 then '已取消' end as statusName
	,p.title as paymentTitle,e.title as expressTitle from orders 
	left join payment p on (orders.payment_id = p.id)
	left join express e on (orders.express_id = e.id)
	where 1=1 `;

	/*
		orderstatus:
		1:订单已经生成（待付款）
		2:已付款等待发货
		3:已发货，待完成
		4:已签收，已完成
		5:已取消
	 */
	let orderstatus = (req.query.orderstatus - 0);
	if (orderstatus > 0) {
		sqlCount += ` and status=${orderstatus}`;
		sqlQuery += ` and orders.status=${orderstatus}`;
	}

	let vipname = req.query.vipname;
	if (vipname) {
		sqlCount += ` and user_name like '%${vipname}%'`;
		sqlQuery += ` and orders.user_name like '%${vipname}%'`;
	}

	//执行分页数据处理
	execQueryCount(req, sqlCount, (err, data) => {
		if (err) {
			return callback(err)
		}
		sqlQuery += ` order by id desc 
		limit ${data.skipCount},${data.pageSize} `;
		execQuery(req, sqlQuery, (err, data1) => {
			if (err) {
				callback(err)
			}
			callback(null, { ...data, message: data1 })
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
		callback(null, { totalcount: data[0].count, pageIndex, pageSize, skipCount })
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

