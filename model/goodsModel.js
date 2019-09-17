'use strict'
const kits = require('../kits/kits.js');
const path = require('path');
const urlobj = require('url');
const db = require('./db')
let tbname = 'goods';
//1 获取商品列表
exports.getlist = (req, callback) => {

	let searchValue = req.query.searchvalue;
	let sqlCount = `select count(1) as count from ${tbname}`;

	if (searchValue) {
		sqlCount += ` where title like '%${searchValue}%' `;
	}
	//执行分页数据处理
	execQueryCount(req, sqlCount, (err, data) => {
		if (err) {
			return callback(err)
		}
		let sql = `select a.*,CONCAT('${kits.nodeServerDomain}',a.img_url) as imgurl,
		c.title as categoryname from ${tbname} as a
		inner join category c on (a.category_id = c.id)`;
		if (searchValue) {
			sql += ` where a.title like '%${searchValue}%' `;
		}
		sql += `order by id desc limit ${data.skipCount},${data.pageSize} `;
		db.query(sql, (err, data1) => {
			if (err) {
				callback(err)
			}
			callback(null, { ...data, message: data1 })
		});
	});
}

// 5 新增 商品
exports.add = (req, callback) => {
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
	let sql = `
				INSERT INTO ${tbname}
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
				 ,'admin' /* user_name - VARCHAR(100)*/			
				 ,NOW() /* add_time - DATETIME*/
				 ,NOW() /* update_time - DATETIME*/
				 ,'${req.body.sub_title}' /* sub_title - VARCHAR(255)*/
				 ,'${req.body.goods_no}' /* goods_no - VARCHAR(100)*/
				 ,${req.body.stock_quantity} /* stock_quantity - INT(10)*/
				 ,${req.body.market_price} /* market_price - DECIMAL(9, 2)*/
				 ,${req.body.sell_price} /* sell_price - DECIMAL(9, 2)*/
				);`;

	db.query(sql, (err,data) => {
		if (err) {
			return callback(err);
		}

		if (fileList.length <= 0) {
			return callback(null)
		}

		// 实现附件的插入
		let splitChar = ','; //values(),()多条数据之间的分隔符
		let sqlValues = '';
		let flng = fileList.length;
		for (var i = 0; i < flng; i++) {
			let item = fileList[i];
			if (i >= flng - 1) {
				splitChar = ';'; //最后一条数据结束插入sql语句语法
			}
			sqlValues += `
		 					(
							 ${data.insertId} /* goods_id - INT(10)*/
							 ,'${item.shorturl}' /* thumb_path - VARCHAR(255)*/
							 ,NOW() /* add_time - DATETIME*/
							)${splitChar}
		 					`;
		};

		let albumSql = `INSERT INTO albums
							(
							 goods_id
							 ,thumb_path
							 ,add_time
							)
							VALUES
							${sqlValues}`;

		db.query(albumSql, err => {
			if (err) {
				return callback(err);
			}
			callback(null)
		});

	});
}

// 编辑文章，获取老数据
exports.getgoodsmodel = (req, callback) => {
	// 获取参数	
	let id = req.params.id;
	// 查询商品sql语句
	let articleSql = `select * from ${tbname} where id=${id}`;
	db.query(articleSql, (err1, data1) => {
		if (err1) {
			return callback(err1);
		}

		// 判断是否有数据
		if (data1.length == 0) {
			return callback({ message: '参数异常，请检查传入参数的正确性' })
		}

		// 查询附件sql语句
		let attacheSql = `select * from albums where goods_id=${id}`;
		db.query(attacheSql, (err2, data2) => {
			if (err2) {
				return callback(err2);
			}

			let model = {};
			let artmodel = data1[0];
			let fileList = [];
			for (var i = 0; i < data2.length; i++) {
				let attache = data2[i];
				fileList.push({
					uid: attache.id,
					name: path.basename(attache.thumb_path),
					url: urlobj.resolve(kits.nodeServerDomain, attache.thumb_path),
					shorturl: attache.thumb_path
				});
			};

			//组合返回对象
			model.title = artmodel.title;
			model.sub_title = artmodel.sub_title;
			model.goods_no = artmodel.goods_no;
			model.category_id = artmodel.category_id.toString();
			model.stock_quantity = artmodel.stock_quantity;
			model.market_price = artmodel.market_price;
			model.sell_price = artmodel.sell_price;
			model.status = artmodel.status == 1;
			model.is_top = artmodel.is_top == 1;
			model.is_hot = artmodel.is_hot == 1;
			model.zhaiyao = artmodel.zhaiyao;
			model.content = artmodel.content;
			model.imgList = [{
				name: path.basename(artmodel.img_url)
				, url: urlobj.resolve(kits.nodeServerDomain, artmodel.img_url)
				, shorturl: artmodel.img_url
			}];
			model.fileList = fileList;

			callback(null, model)

		}); //attache查询回调结束

	}); //article查询回调结束
}

// 7 编辑商品
exports.edit = (req, callback) => {

	let artid = req.params.id;
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
	let sql = `UPDATE ${tbname} 
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
				  id = ${artid};`;
	db.query(sql, (err, data) => {
		if (err) {
			return callback(err);
		}
		let delsql = `delete from albums 
		 					where goods_id =${artid};`;
		db.query(delsql, err1 => {
			if (err1) {
				return callback(err1);
			}
			// 实现相册的更新
			let splitChar = ','; //values(),()多条数据之间的分隔符
			let sqlValues = '';
			let flng = fileList.length;
			for (var i = 0; i < flng; i++) {
				let item = fileList[i];
				if (i >= flng - 1) {
					splitChar = ';'; //最后一数据结束插入sql语句语法
				}
				sqlValues += `(
							 ${artid} /* goods_id - INT(10)*/
							 ,'${item.shorturl}' /* thumb_path - VARCHAR(255)*/
							 ,NOW() /* add_time - DATETIME*/
							)${splitChar}`;
			};

			let attacheSql = `
		 					INSERT INTO albums
							(
							 goods_id
							 ,thumb_path
							 ,add_time
							)
							VALUES
							${sqlValues}`;

			db.query(attacheSql, err2 => {
				if (err2) {
					return callback(err2);
				}

				callback(null)
			});

		});
	});
}

// 5 删除数据
exports.del = (req, callback) => {
	let goodsIds = req.params.ids;
	let sql = `delete from ${tbname} where id in(${goodsIds})`;
	db.query(sql, err => {
		if (err) {
			return callback(err);
		}
		let delsql = `delete from albums 
		 					where goods_id in (${goodsIds});`;
		db.query(delsql, err => {
			if (err) {
				return callback(err);
			}
		})

		callback(null)
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
	db.query(sql, (err, data) => {
		if (err) {
			callback(err)
		}
		//回调继续处理其他业务
		callback(null, { totalcount: data[0].count, pageIndex, pageSize, skipCount })
	});
}


