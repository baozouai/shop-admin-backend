// 引入自定义数据库模块
const db = require('./db')
module.exports = {
    //辅助方法获取分页总条数
    execQueryCount(req, sql, callback) {
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
        // skipCount为从索引skipCount开始查询pageSize条数据
        let skipCount = (pageIndex - 1) * (pageSize - 0);
        db.query(sql, (err, data) => {
            if (err) {
                // 回调错误
                callback(err)
            }
            //回调继续处理其他业务
            callback(null, { totalcount: data[0].count, pageIndex, pageSize, skipCount })
        });
    }
}