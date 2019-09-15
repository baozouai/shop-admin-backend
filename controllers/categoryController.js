'use strict'
const categoryModel  = require('../model/categoryModel')
const SUCCESSCODE = 0;
const ERRORCODE = 1;

//1 获取商品列表
exports.getlist = (req, res) => {
	categoryModel.getlist(req, (err, data) => {
		if (err) {
			console.log(err)
			return res.end(JSON.stringify({status: ERRORCODE, message: err.message}))
		}

		console.log(data)
		res.end(JSON.stringify({status: SUCCESSCODE, message: data}))
	})
}
