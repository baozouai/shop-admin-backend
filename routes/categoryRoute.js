'use strict'

const express = require('express');

let route = express.Router();

const cateCtrl = require('../controllers/categoryController.js');

// 1.0 获取频道下的分类数据
route.get('/category/getlist', cateCtrl.getlist);

module.exports = route;
