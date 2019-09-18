'use strict'
const kits = require('../kits/kits.js');
const path = require('path');
const urlobj = require('url');
const db = require('./db')
const { execQueryCount } = require('./execQueryCount')

module.exports = {
	// 获取商品列表
	getlist(req, callback) {
		// 获取搜索商品名
		let searchValue = req.query.searchvalue;
		// 创建数量查询语句
		let sqlCount = `select count(1) as count from goods`;
		// 如果有商品名
		if (searchValue) {
			// 根据商品名检索数据
			sqlCount += ` where title like '%${searchValue}%' `;
		}
		//执行分页数据处理
		execQueryCount(req, sqlCount, (err, data) => {
			if (err) {
				// 回调错误信息
				return callback(err)
			}
			// imgurl为主域名加上段路径 http://127.0.0.1:8899 + /upload/imgs/17N3ju-pQIEZvv1t-i8yjJNR.jpg
			let sql = `select goods.*,
				   CONCAT('${kits.nodeServerDomain}',goods.img_url) as imgurl,
				   c.title as categoryname
				   from goods
				   inner join category c 
				   on (goods.category_id = c.id)`;
			// 如果有商品名
			if (searchValue) {
				// 根据商品名检索数据
				sql += ` where goods.title like '%${searchValue}%' `;
			}
			// 将数据从大倒小排列，skipCount为从索引skipCount开始查询pageSize条数据
			sql += `order by id desc limit ${data.skipCount},${data.pageSize} `;
			db.query(sql, (err, data1) => {
				if (err) {
					// 回调错误
					callback(err)
				}
				// 成功回调数据
				callback(null, { ...data, message: data1 })
			});
		});
	},
	// 新增商品
	add(req, callback) {
		// 初始化图片短路径
		let shorturl = '';
		// 封面图片
		if (req.body.imgList && req.body.imgList.length > 0) {
			shorturl = req.body.imgList[0].shorturl;
		}
		//相册列表
		let fileList = [];
		if (req.body.fileList && req.body.fileList.length > 0) {
			fileList = req.body.fileList;
		}
		// 创建插入语句
		let sql = `
				INSERT INTO goods
				(				 
				 category_id
				 ,title
				 ,img_url
				 ,zhaiyao
				 ,content
				 ,status
				 ,is_top
				 ,is_hot
				 ,user_name
				 ,add_time
				 ,update_time
				 ,sub_title
				 ,goods_no
				 ,stock_quantity
				 ,market_price
				 ,sell_price
				)
				VALUES
				(
				 ${req.body.category_id} /* category_id - INT(10)*/				 
				 ,'${req.body.title}' /* title - VARCHAR(100)*/
				 ,'${shorturl}' /* img_url - VARCHAR(255)*/				
				 ,'${req.body.zhaiyao}' /* zhaiyao - VARCHAR(255)*/
				 ,'${req.body.content}' /* content - TEXT*/
				 ,${req.body.status} /* status - INT(10)*/
				 ,${req.body.is_top} /* is_top - INT(10)*/
				 ,${req.body.is_hot} /* is_hot - INT(10)*/
				 ,'${req.session.admin_user.uname}' /* user_name - VARCHAR(100)*/			
				 ,NOW() /* add_time - DATETIME*/
				 ,NOW() /* update_time - DATETIME*/
				 ,'${req.body.sub_title}' /* sub_title - VARCHAR(255)*/
				 ,'${req.body.goods_no}' /* goods_no - VARCHAR(100)*/
				 ,${req.body.stock_quantity} /* stock_quantity - INT(10)*/
				 ,${req.body.market_price} /* market_price - DECIMAL(9, 2)*/
				 ,${req.body.sell_price} /* sell_price - DECIMAL(9, 2)*/
				);`;
		// 插入商品数据
		db.query(sql, (err, data) => {
			if (err) {
				// 回调错误信息
				return callback(err);
			}
			if (fileList.length === 0) {
				// 如果没有相册 直接返回
				return callback(null)
			}
			// 实现相册的插入
			let splitChar = ','; //values(),()多条数据之间的分隔符
			// 初始化插入相册数据的字符串
			let sqlValues = '';
			// 获取相册数量
			let length = fileList.length;
			// 拼接查询语句 最后要加上;
			for (var i = 0; i < length; i++) {
				let item = fileList[i];
				if (i >= length - 1) {
					splitChar = ';'; //最后一条数据结束插入sql语句语法
				}
				// insertId是插入后返回的id
				sqlValues += `
		 					(
							 ${data.insertId} /* goods_id - INT(10)*/
							 ,'${item.shorturl}' /* thumb_path - VARCHAR(255)*/
							 ,NOW() /* add_time - DATETIME*/
							)${splitChar}
		 					`;
			};
			// 创建插入相册的语句
			let albumSql = `INSERT INTO albums
							(
							 goods_id
							 ,thumb_path
							 ,add_time
							)
							VALUES
							${sqlValues}`;
			// 插入相册数据库
			db.query(albumSql, err => {
				if (err) {
					// 回调错误信息
					return callback(err);
				}
				// 没有错误则直接返回null
				callback(null)
			});

		});
	},
	// 获取已存在的商品数据
	getgoodsmodel(req, callback) {
		// 获取商品id
		let id = req.params.id;
		// 查询商品sql语句
		let goodsSql = `select * from goods where id=${id}`;
		db.query(goodsSql, (err, data) => {
			if (err) {
				// 回调错误
				return callback(err);
			}
			// 判断是否有数据
			if (data.length == 0) {
				// 回调错误
				return callback({ message: '参数异常，请检查传入参数的正确性' })
			}
			// 查询相册sql语句
			let albumsSql = `select * from albums where goods_id=${id}`;
			// 查询相册
			db.query(albumsSql, (err, data1) => {
				if (err) {
					// 回调错误
					return callback(err);
				}
				let model = {};
				let goodsmodel = data[0];
				let fileList = [];
				// 组合fileList
				data1.forEach(album => {
					fileList.push({
						uid: album.id,
						name: path.basename(album.thumb_path),
						url: urlobj.resolve(kits.nodeServerDomain, album.thumb_path),
						shorturl: album.thumb_path
					})
				})
				//组合返回对象
				model.title = goodsmodel.title;
				model.sub_title = goodsmodel.sub_title;
				model.goods_no = goodsmodel.goods_no;
				model.category_id = goodsmodel.category_id.toString();
				model.stock_quantity = goodsmodel.stock_quantity;
				model.market_price = goodsmodel.market_price;
				model.sell_price = goodsmodel.sell_price;
				model.status = goodsmodel.status === 1;
				model.is_top = goodsmodel.is_top === 1;
				model.is_hot = goodsmodel.is_hot === 1;
				model.zhaiyao = goodsmodel.zhaiyao;
				model.content = goodsmodel.content;
				model.imgList = [{
					name: path.basename(goodsmodel.img_url)
					, url: urlobj.resolve(kits.nodeServerDomain, goodsmodel.img_url)
					, shorturl: goodsmodel.img_url
				}];
				model.fileList = fileList;
				// 成功回调数据
				callback(null, model)

			}); //albums查询回调结束

		}); //goods查询回调结束
	},
	// 编辑商品
	edit(req, callback) {
		// 获取商品id
		let goodsid = req.params.id;
		// 初始化短路径
		let shorturl = '';
		// 封面图片
		if (req.body.imgList && req.body.imgList.length > 0) {
			shorturl = req.body.imgList[0].shorturl;
		}
		//附件列表
		let fileList = [];
		if (req.body.fileList && req.body.fileList.length > 0) {
			fileList = req.body.fileList;
		}
		// 创建更新语句
		let sql = `UPDATE goods 
				SET				  
				  category_id = ${req.body.category_id}
				 ,title = '${req.body.title}'	
				 ,sub_title='${req.body.sub_title}'
				 ,goods_no='${req.body.goods_no}'
				 ,stock_quantity=${req.body.stock_quantity}
				 ,market_price=${req.body.market_price}
				 ,sell_price=${req.body.sell_price}
				 ,goods_no='${req.body.goods_no}'
				 ,img_url = '${shorturl}' 
				 ,zhaiyao = '${req.body.zhaiyao}' 
				 ,content = '${req.body.content}' 
				 ,status = ${req.body.status}
				 ,is_top = ${req.body.is_top}				 
				 ,is_hot = ${req.body.is_hot} 
				 ,update_time = NOW() 				 		
				WHERE
				  id = ${goodsid};`;
		db.query(sql, err => {
			if (err) {
				// 回调错误
				return callback(err);
			}
			// 创建删除语句
			let delsql = `delete from albums where goods_id =${goodsid};`;
			db.query(delsql, err1 => {
				if (err1) {
					// 回调错误
					return callback(err1);
				}
				// 实现相册的更新
				let splitChar = ','; //values(),()多条数据之间的分隔符
				let sqlValues = '';
				let length = fileList.length;
				for (var i = 0; i < length; i++) {
					let item = fileList[i];
					if (i >= length - 1) {
						splitChar = ';'; //最后一数据结束插入sql语句语法
					}
					sqlValues += `(
							 ${goodsid} /* goods_id - INT(10)*/
							 ,'${item.shorturl}' /* thumb_path - VARCHAR(255)*/
							 ,NOW() /* add_time - DATETIME*/
							)${splitChar}`;
				};
				// 创建相册插入语句
				let albumsSql = `
		 					INSERT INTO albums
							(
							 goods_id
							 ,thumb_path
							 ,add_time
							)
							VALUES
							${sqlValues}`;
				// 插入相册
				db.query(albumsSql, err2 => {
					if (err2) {
						// 回调错误
						return callback(err2);
					}
					// 成功回调
					callback(null)
				});
			});
		});
	},
	// 删除数据
	del(req, callback) {
		// 获取所有商品id
		let goodsIds = req.params.ids;
		// 创建删除语句
		let sql = `delete from goods where id in(${goodsIds})`;
		// 删除商品
		db.query(sql, err => {
			if (err) {
				// 回调错误
				return callback(err);
			}
			// 创建删除相册语句
			let delsql = `delete from albums where goods_id in (${goodsIds});`;
			// 删除对应相册
			db.query(delsql, err => {
				if (err) {
					// 回调错误
					return callback(err);
				}
			})
			// 删除成功
			callback(null)
		});
	}
}



