// 引入mysql核心模块
const mysql = require('mysql')
// 创建数据库连接对象
const db = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: 'root',
    database: 'newshop'
})
// 连接数据库
db.connect()
module.exports = db