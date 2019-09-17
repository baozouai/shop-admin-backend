'use strict'
const express = require('express');
const accountCtrl = require('../controllers/accountController.js');

let route = express.Router();
// 验证登录
route.post('/account/login', accountCtrl.login);
// 退出
route.get('/account/logout', accountCtrl.logout);
// 用户列表
route.get('/account/getlist', accountCtrl.getList);

module.exports = route;
