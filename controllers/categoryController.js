'use strict'
const categoryModel  = require('../model/categoryModel')
const SUCCESSCODE = 0;
const ERRORCODE = 1;

//1 获取商品列表
exports.getlist = (req, res) => {
	categoryModel.getlist((err, data) => {
		if (err) {
			// 返回错误状态码和错误信息
			return res.end(JSON.stringify({status: ERRORCODE, message: err.message}))
		}
		// 成功返回数据
		res.end(JSON.stringify({status: SUCCESSCODE, message: data}))
	})
}
