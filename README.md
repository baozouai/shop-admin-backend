# Vue后台管理项目的后台

## 说明

```js
app.js:
  1.项目入口文件，此入口文件不做具体的业务代码,需要加载其它模块的话，需要引入进来执行

  2.在此入口文件开启服务器，监听请求，如果有请求过来，会调用router模块中的路由来进行路径的判断，进而进行业务的分发

  3.当前入口文件里面，启动了服务器，有两个对象,req res
```

```js
router：与路径相关的模块
 1.此路由只管路径的判断，不管具体业务的执行

 2.所有发送过来的请求路径都在此处进行判断，进而进入下一步的业务处理
```

```js
controller: 与业务处理相关的模块
1.在此模块当中，要负责具体的业务逻辑，比如说，向浏览器端返回具体的数据

2.控制器里面不与数据库直接打交道

3.如果用到了某些数据的话，得使用model模块来提供具体的数据
```

```js
model:
1.负责与数据相关的操作，即CRUD
```

## 目录结构

```js
.
├── README.md
├── app.js // 项目入口文件
├── controllers // 控制器 与业务处理相关的模块
│   ├── accountController.js // 账户控制器
│   ├── categoryController.js // 分类控制器
│   ├── goodsController.js // 商品控制器
│   └── orderController.js // 订单控制器
├── kits
│   └── kits.js // 存放node服务器主域名
├── model  // 与数据处理相关的模块 负责与mysql交互
    ├── db.js // 数据库连接相关
│   ├── accountModel.js // 账户model
│   ├── categoryModel.js // 分类model
│   ├── goodsModel.js // 商品model
│   └── orderModel.js // 订单model
├── newshop.sql // 后台资源的mysql文件
├── package-lock.json
├── package.json
├── node_modules // 存放相关的依赖
├── routes // 路由 与路径相关的模块
│   ├── accountRoute.js // 账户路由
│   ├── categoryRoute.js // 分类路由
│   ├── goodsRoute.js // 商品路由
│   └── orderRoute.js // 订单路由
└── upload // 商品封面、相册上传存放的文件夹
    └── imgs // 存入商品图片
```

## 部署

### 环境

- mysql 5.6
- nodejs 8 +

### 克隆代码

```js
git clone git@github.com:baozouai/shop-admin-backend.git
```

### 导入数据

使用`navicat`，把项目根目录中的`newshop.sql`文件导入到数据库

### 安装依赖

```js
cd shop-admin-backend

npm install
```

### 启动

```
npm start
```

测试接口，使用浏览器访问 http://127.0.0.1:8899/admin/account/getlist?pageIndex=1&pageSize=5

如果页面由数据返回代表后台安装成功

#### 数据库账号密码

默认链接数据库的账号密码是`phpstudy`的初始账户密码 `root/root`，如果是其他账号密码需要在`app.js`第`19`行中修改



