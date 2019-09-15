'use strict'

const express = require('express');

let route = express.Router();

const orderCtrl = require('../controllers/orderController.js');

// 1 获取订单
route.get('/order/getorderlist',orderCtrl.getorderlist);

module.exports = route;
