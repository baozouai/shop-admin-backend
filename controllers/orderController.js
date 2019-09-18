'use strict'
const orderModel = require('../model/orderModel')
const SUCCESSCODE = 0;
const ERRORCODE = 1;

module.exports = {
	// 1 获取订单
	getorderlist(req, res) {
		orderModel.getorderlist(req, (err, data) => {
			if (err) {
				// 返回错误状态码和错误信息
				return res.end(JSON.stringify({ status: ERRORCODE, message: err.message }))
			}
			// 成功响应数据
			res.end(JSON.stringify({ status: SUCCESSCODE, ...data }))
		})
	}
}

