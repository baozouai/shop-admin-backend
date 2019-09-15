'use strict'

const express = require('express');

let route = express.Router();

const accountCtrl = require('../controllers/accountController.js');

// 1.0 验证登录
route.post('/account/login', accountCtrl.login);

route.get('/account/logout', accountCtrl.logout);

// 用户列表
route.get('/account/getlist', accountCtrl.getList);


module.exports = route;
