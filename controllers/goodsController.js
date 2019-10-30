'use strict'
const goodsModel = require('../model/goodsModel')
const kits = require('../kits/kits.js');
const urlobj = require('url');
const multiparty = require('multiparty');
const SUCCESSCODE = 0;
const ERRORCODE = 1;

module.exports = {
	//1 获取商品列表
	getlist(req, res) {
		goodsModel.getlist(req, (err, data) => {
			if (err) {
				// 返回错误状态码和错误信息
				return res.json({ status: ERRORCODE, message: err.message })
			}
			// 成功响应数据
			res.json({ status: SUCCESSCODE, ...data })
		})
	},
	// 2 上传商品封面图片
	uploadimg(req, res) {
		// 创建文件上传对象
		let formUpload = new multiparty.Form();
		// 设置文件上传存储路径
		formUpload.uploadDir = './upload/imgs';
		// 调用parse函数实现文件上传
		formUpload.parse(req, (err, fields, files) => {
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
			if (err) {
				// 上传失败，返回错误信息
				return res.json({
					status: ERRORCODE,
					message: '文件上传失败'
				})
			}
			let resObj = {};
			// 遍历上传的文件
			for (let i = 0; i < files.file.length; i++) {
				let item = files.file[i];
				let path = item.path
				resObj = { name: item.originalFilename, url: urlobj.resolve(kits.nodeServerDomain, path), shorturl: '/' + path };
			};
			// 成功响应数据
			res.json(resObj);
		});
	},
	// 3 新增商品
	add(req, res) {
		goodsModel.add(req, err => {
			if (err) {
				// 返回错误状态码和错误信息
				return res.json({ status: ERRORCODE, message: err.message })
			}
			// 数据插入成功
			res.json({ status: SUCCESSCODE, message: '数据插入成功' })
		})
	},
	// 4 获取商品数据
	getgoodsmodel(req, res) {
		goodsModel.getgoodsmodel(req, (err, data) => {
			if (err) {
				// 返回错误状态码和错误信息
				return res.json({ status: ERRORCODE, message: err.message })
			}
			// 成功响应数据
			res.json({ status: SUCCESSCODE, message: data })
		})
	},
	// 5 编辑商品
	edit(req, res) {
		goodsModel.edit(req, err => {
			if (err) {
				// 返回错误状态码和错误信息
				return res.json({ status: ERRORCODE, message: err.message })
			}
			// 成功响应
			res.json({ status: SUCCESSCODE, message: '数据更新成功' })
		})
	},
	// 6 删除数据
	del(req, res) {

		goodsModel.del(req, err => {
			if (err) {
				// 返回错误状态码和错误信息
				return res.json({ status: ERRORCODE, message: err.message })
			}

			// 成功响应
			return res.json({ status: SUCCESSCODE, message: '数据删除成功' })
		})
	}
}

