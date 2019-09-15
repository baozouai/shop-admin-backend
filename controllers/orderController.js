'use strict'
const orderModel = require('../model/orderModel')
const SUCCESSCODE = 0;
const ERRORCODE = 1;

// 1 获取订单
exports.getorderlist = (req,res)=>{
	orderModel.getorderlist(req, (err, data) => {
		if (err) {
			return res.end(JSON.stringify({status: ERRORCODE, message: err.message})) 
		} 
		res.end(JSON.stringify({status: SUCCESSCODE,  ...data}))
	})
}

