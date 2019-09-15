'use strict'
const express = require('express');
const orm = require('orm');
const session = require('express-session');
const accountRoute = require('./routes/accountRoute.js');
const categoryRoute = require('./routes/categoryRoute.js');
const goodsRoute = require('./routes/goodsRoute.js');
const orderRoute = require('./routes/orderRoute.js');
// 创建服务器对象
let app = express();
// 监听端口
app.listen(8899, () => {
	console.log('api服务已启动, :8899');
});
// 设置静态资源路径
app.use('/upload', express.static('upload'));
//1.0 初始化orm
// 对象关系映射
app.use(orm.express('mysql://root:root@127.0.0.1:3306/newshop', {
	define: function (db, models, next) {
		next();
	}
}));
// 自动解析请求报文
var bodyParser = require('body-parser');
app.use(bodyParser());
// 设置session (后台管理页面专用)
app.use(session({
	name:'vueadmin',
	secret: 'vueadmin',  // 用来对session id相关的cookie进行签名，加密的秘钥，可以随便写
	saveUninitialized: false,  // 是否自动保存未初始化的会话，建议false
	resave: false,  // 是否每次都重新保存会话，建议false
}));

app.all('*', (req, res, next) => {
	//设置允许跨域响应报文头
	//设置跨域
	// 启用 Node 服务器端的 cors 跨域
	res.header("Access-Control-Allow-Origin", "http://localhost:8080");
	res.header("Access-Control-Allow-Headers", "X-Requested-With, Accept,OPTIONS, Content-Type, Authorization");
	res.header("Access-Control-Allow-Methods", "*");
	res.header("Access-Control-Allow-Credentials", "true");
	res.setHeader('Content-Type', 'application/json;charset=utf-8');
	next();
  });
//2.0 设置管理后台路由规则
app.use('/admin', accountRoute);
app.use('/admin', categoryRoute);
app.use('/admin', goodsRoute);
app.use('/admin', orderRoute);

