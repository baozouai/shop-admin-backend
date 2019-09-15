'use strict'
const goodsModel = require('../model/goodsModel')
const kits = require('../kits/kits.js');
const urlobj = require('url');
const multiparty = require('multiparty');
const SUCCESSCODE = 0;
const ERRORCODE = 1;

//1 获取商品列表
exports.getlist = (req, res) => {
	goodsModel.getlist(req, (err, data) => {
		if (err) {
			res.end(JSON.stringify({ status: ERRORCODE, message: err.message }))
		}
		res.end(JSON.stringify({ status: SUCCESSCODE, ...data }))
	})
}

// 2 上传商品封面图片
exports.uploadimg = (req, res) => {
	// 初始化文件解析对象
	let form = new multiparty.Form();
	form.uploadDir = './upload/imgs'; //设置文件保存的相对路径
	form.parse(req, (err, fields, files) => {
		/*
		{ file:
		   [ { fieldName: 'file',
		       originalFilename: 'Web.png',
		       path: 'upload\\imgs\\-_zChYuXflE6tCfrx9T-ea7C.png',
		       headers: [Object],
		       size: 45108 } 
		    ] 
		}
		 */
		let resObj = {};
		for (let i = 0; i < files.file.length; i++) {
			let item = files.file[i];
			let path = item.path
			resObj = { name: item.originalFilename, url: urlobj.resolve(kits.nodeServerDomain, path), shorturl: '/' + path };
		};
		res.end(JSON.stringify(resObj));
	});
}

// 3 新增商品
exports.add = (req, res) => {
	goodsModel.add(req, err => {
		if (err) {
			return res.end(JSON.stringify({ status: ERRORCODE, message: err.message }))
		}
		res.end(JSON.stringify({ status: SUCCESSCODE, message: '数据插入成功' }))
	})
}


// 4 获取商品数据
exports.getgoodsmodel = (req, res) => {
	goodsModel.getgoodsmodel(req, (err, data) => {
		if (err) {
			return res.end(JSON.stringify({ status: ERRORCODE, message: err.message }))
		}
		res.end(JSON.stringify({ status: SUCCESSCODE, message: data }))
	})
}

// 5 编辑商品
exports.edit = (req, res) => {
	goodsModel.edit(req, err => {
		if (err) {
			return res.end(JSON.stringify({ status: ERRORCODE, message: err.message }))
		}
		res.end(JSON.stringify({ status: SUCCESSCODE, message: '数据更新成功' }))
	})
}

// 6 删除数据
exports.del = (req, res) => {
	goodsModel.del(req, err => {
		if (err) {
			return res.end(JSON.stringify({ status: ERRORCODE, message: err.message }))
		}
		return res.end(JSON.stringify({ status: SUCCESSCODE, message: '数据删除成功' }))
	})
}

