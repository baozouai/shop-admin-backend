'use strict'
const categoryModel  = require('../model/categoryModel')
const SUCCESSCODE = 0;
const ERRORCODE = 1;

//1 获取商品列表
exports.getlist = (req, res) => {
	categoryModel.getlist((err, data) => {
		if (err) {
			return res.end(JSON.stringify({status: ERRORCODE, message: err.message}))
		}
		res.end(JSON.stringify({status: SUCCESSCODE, message: data}))
	})
}
