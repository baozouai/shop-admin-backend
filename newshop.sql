/*
 Navicat Premium Data Transfer

 Source Server         : qianduan29
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : 127.0.0.1:3306
 Source Schema         : newshop

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 15/09/2019 21:51:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for albums
-- ----------------------------
DROP TABLE IF EXISTS `albums`;
CREATE TABLE `albums` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) DEFAULT NULL,
  `thumb_path` varchar(255) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2730 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of albums
-- ----------------------------
BEGIN;
INSERT INTO `albums` VALUES (174, 152, '/upload/imgs/_9nUwJLwKd3sYI55bhGJ-WnW.jpg', '2019-09-15 13:48:27');
INSERT INTO `albums` VALUES (175, 152, '/upload/imgs/62VzFRQ8IGj6CsJ-ZQxTmtZn.jpg', '2019-09-15 13:48:27');
INSERT INTO `albums` VALUES (176, 152, '/upload/imgs/aLkd84SqnH9nIQYsT-Up3e20.jpg', '2019-09-15 13:48:27');
INSERT INTO `albums` VALUES (177, 152, '/upload/imgs/2fGZnT3XwtckfjSL3dasam8M.jpg', '2019-09-15 13:48:27');
INSERT INTO `albums` VALUES (178, 153, '/upload/imgs/MMUL5o7N1I2370yUSPcTMJKJ.jpg', '2019-09-15 13:52:34');
INSERT INTO `albums` VALUES (179, 154, '/upload/imgs/cogcF7MxPAS7PE-GNmepThz_.jpg', '2019-09-15 13:55:54');
INSERT INTO `albums` VALUES (180, 155, '/upload/imgs/kfrq9MZ4HyISUUSfavafHhBX.jpg', '2019-09-15 13:58:35');
INSERT INTO `albums` VALUES (181, 156, '/upload/imgs/ZzuX8MBy_Lh4rXE79dRruF3m.jpg', '2019-09-15 14:02:28');
INSERT INTO `albums` VALUES (182, 157, '/upload/imgs/IhebHaBH4uTAr4fF-FPUvJrz.jpg', '2019-09-15 14:05:18');
INSERT INTO `albums` VALUES (189, 158, '/upload/imgs/eATmOGKz0n_Li3xo7IWSONDy.jpg', '2019-09-15 14:17:35');
INSERT INTO `albums` VALUES (190, 159, '/upload/imgs/Sq9h3AUDkkdvyxb9PLHrzsJO.jpg', '2019-09-15 14:17:49');
COMMIT;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `parent_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=162 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO `category` VALUES (40, '手机数码', 0);
INSERT INTO `category` VALUES (41, '电脑办公', 0);
INSERT INTO `category` VALUES (42, '影音娱乐', 0);
INSERT INTO `category` VALUES (43, '手机通讯', 40);
INSERT INTO `category` VALUES (44, '摄影摄像', 40);
INSERT INTO `category` VALUES (45, '存储设备', 40);
INSERT INTO `category` VALUES (46, '电脑整机', 41);
INSERT INTO `category` VALUES (47, '外设产品', 41);
INSERT INTO `category` VALUES (48, '办公打印', 41);
INSERT INTO `category` VALUES (49, '平板电视', 42);
INSERT INTO `category` VALUES (50, '音响DVD', 42);
INSERT INTO `category` VALUES (51, '影音配件', 42);
INSERT INTO `category` VALUES (150, '服装类', 0);
INSERT INTO `category` VALUES (151, '男装', 150);
INSERT INTO `category` VALUES (152, '女装', 150);
INSERT INTO `category` VALUES (153, '夏装', 152);
INSERT INTO `category` VALUES (154, '西装', 151);
INSERT INTO `category` VALUES (155, '休闲西装', 154);
INSERT INTO `category` VALUES (156, '冬装', 150);
INSERT INTO `category` VALUES (157, '小米手机', 43);
INSERT INTO `category` VALUES (158, '华为', 43);
INSERT INTO `category` VALUES (159, '魅族大哥大', 43);
INSERT INTO `category` VALUES (160, '大米手机', 43);
COMMIT;

-- ----------------------------
-- Table structure for express
-- ----------------------------
DROP TABLE IF EXISTS `express`;
CREATE TABLE `express` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `express_fee` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of express
-- ----------------------------
BEGIN;
INSERT INTO `express` VALUES (1, '顺丰快递', 20.00);
INSERT INTO `express` VALUES (2, '圆通快递', 10.00);
INSERT INTO `express` VALUES (3, '韵达快递', 8.00);
COMMIT;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `category_id` int(10) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `zhaiyao` varchar(255) DEFAULT NULL,
  `content` text,
  `status` int(10) DEFAULT NULL,
  `is_top` int(10) DEFAULT NULL,
  `is_hot` int(10) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `sub_title` varchar(255) DEFAULT NULL,
  `goods_no` varchar(100) DEFAULT NULL,
  `stock_quantity` int(10) DEFAULT NULL,
  `market_price` decimal(9,2) DEFAULT NULL,
  `sell_price` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=7168 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of goods
-- ----------------------------
BEGIN;
INSERT INTO `goods` VALUES (152, 158, '【到手价3588 6期免息】HUAWEI/华为P10 Plus ', '/upload/imgs/2OwoxHAc0hygU6V52zZI4UHV.jpg', '【到手价3588 6期免息】HUAWEI/华为P10 Plus 6GB+64GB 曜石黑 移动联通电信手机', '<p><a href=\"https://product.suning.com/0000000000/762758751.html\" target=\"_blank\" style=\"color: rgb(37, 43, 66);\"><img src=\"https://image.suning.cn/uimg/sop/commodity/201814109448239356941100_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></a><a href=\"https://product.suning.com/0000000000/762758521.html\" target=\"_blank\" style=\"color: rgb(37, 43, 66);\"><img src=\"https://image.suning.cn/uimg/sop/commodity/742689856347804008902600_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></a><a href=\"https://product.suning.com/0000000000/861242843.html\" target=\"_blank\" style=\"color: rgb(37, 43, 66);\"><img src=\"https://image.suning.cn/uimg/sop/commodity/145978136719857808111865_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></a></p><p><img src=\"//image.suning.cn/uimg/sop/commodity/969312262581959416786000_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"//image.suning.cn/uimg/sop/commodity/199847898761407960746900_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"//image.suning.cn/uimg/sop/commodity/186713573913779842155456_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"//image.suning.cn/uimg/sop/commodity/191894093330480714128770_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"//image.suning.cn/uimg/sop/commodity/338924984145367266233990_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"//image.suning.cn/uimg/sop/commodity/880575514114148515096960_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"//image.suning.cn/uimg/sop/commodity/941110310170835174031510_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"//image.suning.cn/uimg/sop/commodity/332614183151943830284500_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"//image.suning.cn/uimg/sop/commodity/665199031605339432313900_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"//image.suning.cn/uimg/sop/commodity/116422016815101410789271_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"//image.suning.cn/uimg/sop/commodity/186468005171670529297210_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p>1</p><p><img src=\"//image.suning.cn/uimg/sop/commodity/320602489974514815373000_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p>', 1, 1, 1, 'admin', '2019-08-15 13:48:27', '2019-09-15 13:48:27', '6GB+64GB 曜石黑 移动联通电信手机', '26948', 100, 3988.00, 3899.00);
INSERT INTO `goods` VALUES (153, 49, '海信(Hisense)LED55MU9600X3DUC ', '/upload/imgs/LAPGOFZtm64rx8rCTTvqbh39.jpg', '海信(Hisense)LED55MU9600X3DUC 55英寸 4K超高清量子点电视 ULED画质 VIDAA系统', '<p><a href=\"https://shop.suning.com/30000011/index.html\" target=\"_blank\" style=\"color: rgb(37, 43, 66);\"><img src=\"https://image.suning.cn/uimg/sop/commodity/152418403963754690151350_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></a></p><p><a href=\"https://product.suning.com/0000000000/721034170.html\" target=\"_blank\" style=\"color: rgb(37, 43, 66);\"><img src=\"https://image.suning.cn/uimg/sop/commodity/674265889569958711135500_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></a><a href=\"https://product.suning.com/0030000011/659973806.html\" target=\"_blank\" style=\"color: rgb(37, 43, 66);\"><img src=\"https://image.suning.cn/uimg/sop/commodity/580804888269630832171600_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></a><a href=\"https://product.suning.com/0000000000/646332415.html\" target=\"_blank\" style=\"color: rgb(37, 43, 66);\"><img src=\"https://image.suning.cn/uimg/sop/commodity/164947314370596747459900_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></a><a href=\"https://product.suning.com/0030000011/719579209.html\" target=\"_blank\" style=\"color: rgb(37, 43, 66);\"><img src=\"https://image.suning.cn/uimg/sop/commodity/109859084335308009815860_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></a><a href=\"https://product.suning.com/0000000000/154158097.html\" target=\"_blank\" style=\"color: rgb(37, 43, 66);\"><img src=\"https://image.suning.cn/uimg/sop/commodity/139086270826280834777770_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></a><a href=\"https://product.suning.com/0000000000/683246685.html\" target=\"_blank\" style=\"color: rgb(37, 43, 66);\"><img src=\"https://image.suning.cn/uimg/sop/commodity/212695348731710262086520_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></a></p><p><img src=\"//image.suning.cn/uimg/sop/commodity/323128866134590684049660_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><a href=\"https://sale.suning.com/shfw/cdaz/index.html#suning\" target=\"_blank\" style=\"color: rgb(37, 43, 66);\"><img src=\"https://sale.suning.com/shfw/cdazpic/images/all.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></a></p>', 1, 1, 0, 'admin', '2019-08-15 13:52:34', '2019-09-15 13:52:34', '55英寸 4K超高清量子点电视 ULED画质 VIDAA系统', '43986', 100, 13999.00, 13799.00);
INSERT INTO `goods` VALUES (154, 44, '【官方旗舰店】佳能 EOS M6 18-150mm f/3.5-6.3 IS STM镜头套装 ', '/upload/imgs/Jxs5m5sf01S5kxdNnvA3kDw5.jpg', '【官方旗舰店】佳能 EOS M6 18-150mm f/3.5-6.3 IS STM镜头套装 数码微单相机 黑色 礼包版', '<p><img src=\"https://image.suning.cn/uimg/sop/commodity/115851822811245019766608_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\">&nbsp;<img src=\"https://image.suning.cn/uimg/sop/commodity/552238108849856600711100_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/commodity/136215131397481640477790_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/commodity/171720802236829381378900_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"https://image.suning.cn/uimg/sop/commodity/113269669711901464896218_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"https://image.suning.cn/uimg/sop/commodity/198120719164590285569630_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"https://image.suning.cn/uimg/sop/commodity/171037238016505018862070_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"https://image.suning.cn/uimg/sop/commodity/125457756521522477578340_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"https://image.suning.cn/uimg/sop/commodity/186479954821041973692110_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p>.</p><p>.</p><p>&nbsp;<img src=\"https://image.suning.cn/uimg/sop/commodity/114463159892501305832820_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><strong>为避免同行炒货或者恶意订单，同一个ID 或者同一个收货地址 同一个订单 超过3个数量 请联系在线客服，否则有权利不发货</strong>！</p><p><img src=\"//image.suning.cn/uimg/sop/commodity/676175902182329786994570_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p>', 1, 1, 1, 'admin', '2019-08-15 13:55:54', '2019-09-15 13:55:54', '数码微单相机 黑色 礼包版', '28135', 100, 5388.00, 5288.00);
INSERT INTO `goods` VALUES (155, 41, '联想（Lenovo）AIO510升级款AIO520-22 ', '/upload/imgs/hVW_H2lQ4goH7wBw1EmSQBOk.jpg', '联想（Lenovo）AIO510升级款AIO520-22 21.5英寸致美一体机电脑（E2-9010 4G 1T 黑色）', '<p><img src=\"//image.suning.cn/uimg/sop/richtext/108564604752405091515600.gif?from=mobile\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/commodity/245050653193601323644880_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"900\" height=\"auto\" width=\"100%\">&nbsp;<img src=\"https://image.suning.cn/uimg/sop/commodity/713038144725005586971900_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"899\" height=\"auto\" width=\"100%\">&nbsp;<img src=\"https://image.suning.cn/uimg/sop/commodity/132653922757959167456940_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"888\" height=\"auto\" width=\"100%\">&nbsp;<img src=\"https://image.suning.cn/uimg/sop/commodity/212829472719061449748313_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"887\" height=\"auto\" width=\"100%\">&nbsp;<img src=\"https://image.suning.cn/uimg/sop/commodity/150204762524465323441250_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"886\" height=\"auto\" width=\"100%\"><img src=\"https://image.suning.cn/uimg/sop/commodity/683474213145645942992520_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"885\" height=\"auto\" width=\"100%\">&nbsp;<img src=\"https://image.suning.cn/uimg/sop/commodity/544171333935464572133100_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"884\" height=\"auto\" width=\"100%\">&nbsp;<img src=\"https://image.suning.cn/uimg/sop/commodity/151975407812514700727882_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"883\" height=\"auto\" width=\"100%\">&nbsp;<img src=\"https://image.suning.cn/uimg/sop/commodity/262888895372810623655000_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"882\" height=\"auto\" width=\"100%\">&nbsp;<img src=\"https://image.suning.cn/uimg/sop/commodity/884445350803686933362700_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"881\" height=\"auto\" width=\"100%\">&nbsp;<img src=\"https://image.suning.cn/uimg/sop/commodity/709218758307999612107400_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"880\" height=\"auto\" width=\"100%\">&nbsp;<img src=\"https://image.suning.cn/uimg/sop/commodity/103774404014609278774190_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"879\" height=\"auto\" width=\"100%\">&nbsp;<img src=\"https://image.suning.cn/uimg/sop/commodity/210566754419324303674996_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"876\" height=\"auto\" width=\"100%\">&nbsp;<img src=\"https://image.suning.cn/uimg/sop/commodity/133346073488269948550300_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"875\" height=\"auto\" width=\"100%\">&nbsp;<img src=\"https://image.suning.cn/uimg/sop/commodity/502751711469734938884200_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"874\" height=\"auto\" width=\"100%\">&nbsp;<img src=\"https://image.suning.cn/uimg/sop/commodity/114614226818578404199463_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"873\" height=\"auto\" width=\"100%\"></p><p><strong>全国联保</strong></p><p><img src=\"//image.suning.cn/uimg/sop/commodity/617107433170665522753100_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p>', 1, 1, 1, 'admin', '2019-08-15 13:58:35', '2019-09-15 13:58:35', '21.5英寸致美一体机电脑（E2-9010 4G 1T 黑色）', '30007', 100, 3199.00, 2999.00);
INSERT INTO `goods` VALUES (156, 42, '明基（BenQ）i720 ', '/upload/imgs/JFrf9qcCAtozdXe446gY8hol.jpg', '明基（BenQ）i720 家用 投影机 投影仪（1080P分辨率 2200流明 左右梯形校正 手机投影）', '<p><img src=\"https://image.suning.cn/uimg/sop/commodity/623897015639368374122200_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"晒单\" height=\"auto\" width=\"100%\">&nbsp;<a href=\"http://product.suning.com/147844757.html\" target=\"_blank\" style=\"color: rgb(37, 43, 66);\"><img src=\"//image.suning.cn/uimg/sop/commodity/113382803117483214104843_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></a></p><p><img src=\"https://image.suning.cn/uimg/sop/commodity/162277371791052364365400_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"I720_01\" height=\"auto\" width=\"100%\">&nbsp;<img src=\"https://image.suning.cn/uimg/sop/commodity/240288497187573919162470_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"I720_02\" height=\"auto\" width=\"100%\">&nbsp;<img src=\"https://image.suning.cn/uimg/sop/commodity/197568399718847910656101_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"I720_03\" height=\"auto\" width=\"100%\">&nbsp;<img src=\"https://image.suning.cn/uimg/sop/commodity/893078768100642021965600_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"I720_04\" height=\"auto\" width=\"100%\">&nbsp;<img src=\"https://image.suning.cn/uimg/sop/commodity/662423599219169193320000_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"I720_05\" height=\"auto\" width=\"100%\">&nbsp;<img src=\"https://image.suning.cn/uimg/sop/commodity/249059404892870013358800_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"I720_06\" height=\"auto\" width=\"100%\">&nbsp;<img src=\"https://image.suning.cn/uimg/sop/commodity/818706763971229081203000_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"I720_07\" height=\"auto\" width=\"100%\">&nbsp;<img src=\"https://image.suning.cn/uimg/sop/commodity/127515991516386888583398_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"I720_08\" height=\"auto\" width=\"100%\">&nbsp;<img src=\"https://image.suning.cn/uimg/sop/commodity/193949389418568275083541_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"I720_09\" height=\"auto\" width=\"100%\">&nbsp;<img src=\"https://image.suning.cn/uimg/sop/commodity/479706966200856510184100_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"I720_10\" height=\"auto\" width=\"100%\">&nbsp;<img src=\"https://image.suning.cn/uimg/sop/commodity/141949741137682376951000_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"I720_11\" height=\"auto\" width=\"100%\">&nbsp;<img src=\"https://image.suning.cn/uimg/sop/commodity/241677862535742368637300_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"公告\" height=\"auto\" width=\"100%\">&nbsp;<img src=\"https://image.suning.cn/uimg/sop/commodity/110706308755760239347200_x.jpg?from=mobile&amp;format=80q.webp\" alt=\"详情页说明\" height=\"auto\" width=\"100%\"></p>', 1, 1, 0, 'admin', '2019-08-15 14:02:28', '2019-09-15 14:02:28', '家用 投影机 投影仪（1080P分辨率 2200流明 左右梯形校正 手机投影）', '31160', 100, 6788.00, 6578.00);
INSERT INTO `goods` VALUES (157, 151, '勎霸 男装皮衣冬装新款皮毛一体皮衣男 中长款加绒皮风衣 ', '/upload/imgs/fpVFAdUODArNY1JDlrGYqn2x.jpg', '勎霸 男装皮衣冬装新款皮毛一体皮衣男 中长款加绒皮风衣 中老年加厚爸爸装外套商务休闲仿真皮皮大衣', '<p><a href=\"http://quan.suning.com/lqzxmiddle_201712080001881649_8P4ZXbwPomIXREfHCXEKGl2w_1.htm\" target=\"_blank\" style=\"color: rgb(37, 43, 66);\">&nbsp;</a></p><p><img src=\"https://image.suning.cn/uimg/sop/commodity/580895167144335611689420_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/commodity/321451169142591780697030_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"https://image.suning.cn/uimg/sop/commodity/176408817915326132067941_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"https://image.suning.cn/uimg/sop/commodity/687791601142520766551040_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"https://image.suning.cn/uimg/sop/commodity/181225588321208843837814_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"https://image.suning.cn/uimg/sop/commodity/167562092019169963221680_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/commodity/190898333125201397969100_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/commodity/103688446316629645062335_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/commodity/107311802764603627562620_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"https://image.suning.cn/uimg/sop/commodity/184376023214712174857319_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"https://image.suning.cn/uimg/sop/commodity/134197888813705677592331_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"https://image.suning.cn/uimg/sop/commodity/203426205845244865649510_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"https://image.suning.cn/uimg/sop/commodity/764218176211142342816540_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"https://image.suning.cn/uimg/sop/commodity/698050635113394682356580_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"https://image.suning.cn/uimg/sop/commodity/135756047310529977273612_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"https://image.suning.cn/uimg/sop/commodity/135368439148692942033690_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"https://image.suning.cn/uimg/sop/commodity/163015819960396690171810_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"https://image.suning.cn/uimg/sop/commodity/452998900761374666223300_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"https://image.suning.cn/uimg/sop/commodity/163257036960436117343730_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"//image.suning.cn/uimg/sop/commodity/115077307212445651413060_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p>', 1, 1, 1, 'admin', '2019-08-15 14:05:18', '2019-09-15 14:05:18', '中老年加厚爸爸装外套商务休闲仿真皮皮大衣', '53079', 100, 329.00, 299.00);
INSERT INTO `goods` VALUES (158, 50, '热卖推荐【送蓝牙适配器】', '/upload/imgs/KRypQbcsvE8h1kvcnFoDHvoH.jpg', '热卖推荐【送蓝牙适配器】Yamaha/雅马哈YHT-299卫星家庭影院音箱组合音响套装数字5.1声道家用客厅可壁挂', '<p><img src=\"https://image.suning.cn/uimg/sop/commodity/227254664295987176448300_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"//image.suning.cn/uimg/sop/commodity/154176940810850604561715_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"//image.suning.cn/uimg/sop/commodity/194927213315763462546114_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"//image.suning.cn/uimg/sop/commodity/190173918369205263136710_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"//image.suning.cn/uimg/sop/commodity/198224216321191198893158_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"//image.suning.cn/uimg/sop/commodity/250890175331600087655800_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"//image.suning.cn/uimg/sop/commodity/193510260815724091161212_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"//image.suning.cn/uimg/sop/commodity/297475072155424822093060_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"//image.suning.cn/uimg/sop/commodity/207223860812805756745478_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"//image.suning.cn/uimg/sop/commodity/173734905140946513368370_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"//image.suning.cn/uimg/sop/commodity/151614612127643883881990_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"//image.suning.cn/uimg/sop/commodity/290510631138316943473150_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"//image.suning.cn/uimg/sop/commodity/352399363206305042849360_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"//image.suning.cn/uimg/sop/commodity/106154515203601500863470_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"//image.suning.cn/uimg/sop/commodity/141253107112886714746470_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"//image.suning.cn/uimg/sop/commodity/198634893087699974992430_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"//image.suning.cn/uimg/sop/commodity/146950228514460884969840_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"//image.suning.cn/uimg/sop/commodity/933677471513697056797000_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"><img src=\"//image.suning.cn/uimg/sop/commodity/697013035757222753572100_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p>本商家商品保证正品行货，严格按照国家三包政策提供售后服务，因质量问题或实物与描述不符产生的退换货服务运费由本店承担。</p><p><img src=\"//image.suning.cn/uimg/sop/commodity/195607369187291529016910_x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p>', 1, 1, 1, 'admin', '2019-08-15 14:07:29', '2019-09-15 14:17:35', 'Yamaha/雅马哈YHT-299卫星家庭影院音箱组合音响套装数字5.1声道家用客厅可壁挂', '27283', 100, 2880.00, 2799.00);
INSERT INTO `goods` VALUES (159, 152, '伴娘服2017新款韩版女长款姐妹裙冬季长袖', '/upload/imgs/17N3ju-pQIEZvv1t-i8yjJNR.jpg', '伴娘服2017新款韩版女长款姐妹裙冬季长袖伴娘团派对小礼服连衣裙', '<p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/902077059126269522760560_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/640393887690362830861900_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/900741752159532659548900_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/187929311416409757397259_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/209573185136670835599030_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/146272470215082005212606_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/365323433114586153960570_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/174571167137676253056890_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/200704303883267123715770_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/130050507143973661310440_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/159195462820091234922740_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/181022240783311913917390_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/132288512413246601326763_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/186762262666458165936310_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/164702354621214922644752_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/437996964123965016132220_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/701941255181723277718910_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/344437412414581258230000_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/122683993355559632755250_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/145171740319909537884573_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/113109587018612258262914_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/940081632248705450530800_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/362888686210408579495190_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/205541225420147026137741_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/140449390015439416325134_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/102629104545202515733720_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/412202934518703046227300_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/822959819859234924168300_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/146964675640262087134820_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/908957864428734374640700_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/208427817619062898624236_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/583893588942378532385600_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/141277827214404516797502_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/123843014214807583425770_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/135424499117485776085916_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/598967941454279321153600_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/228619908184189299668670_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p><p><img src=\"https://image.suning.cn/uimg/sop/phonecomm/168996016850123555137500_640x.jpg?from=mobile&amp;format=80q.webp\" height=\"auto\" width=\"100%\"></p>', 1, 1, 1, 'admin', '2019-08-15 14:10:16', '2019-09-15 14:17:49', '伴娘团派对小礼服连衣裙', '55177', 100, 75.00, 67.00);
COMMIT;

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `real_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=910 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of manager
-- ----------------------------
BEGIN;
INSERT INTO `manager` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '超级管理员');
COMMIT;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(100) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `express_id` int(10) DEFAULT NULL,
  `express_fee` decimal(9,2) DEFAULT NULL,
  `express_status` tinyint(3) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `address` text,
  `status` tinyint(3) DEFAULT NULL,
  `payment_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
BEGIN;
INSERT INTO `orders` VALUES (21, 'BD20191129161940624', 9, '小红', 1, 20.00, 1, '18667654355', '河北省,秦皇岛市,北戴河区', '城区', 1, 1);
INSERT INTO `orders` VALUES (22, 'BD20190829162037486', 12, '小白', 2, 20.00, 1, '18667654355', '山西省,太原市,尖草坪区', '城区', 2, 2);
INSERT INTO `orders` VALUES (23, 'BD20171130152234965', 9, '小黑', 3, 8.00, 1, '18667654355', '江西省,萍乡市,莲花县', '城区', 4, 3);
INSERT INTO `orders` VALUES (24, 'BD20181126171848182', 9, '小黄', 1, 20.00, 2, '13876546787', '湖北省,恩施土家族苗族自治州,咸丰县', '城区', 3, 4);
COMMIT;

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=3276 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of payment
-- ----------------------------
BEGIN;
INSERT INTO `payment` VALUES (1, '货到付款');
INSERT INTO `payment` VALUES (2, '账户余额');
INSERT INTO `payment` VALUES (3, '支付宝支付');
INSERT INTO `payment` VALUES (4, '财付通支付');
INSERT INTO `payment` VALUES (5, '网银在线支付');
INSERT INTO `payment` VALUES (6, '在线支付');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `reg_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2048 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (2, 'ivanyb', '18665711978', 'ivanyb@qq.com', '2019-08-21 10:37:18');
INSERT INTO `users` VALUES (5, 'wolaile000', '18667326666', '18667326666@qq.com', '2019-08-21 10:37:18');
INSERT INTO `users` VALUES (6, 'eizo2200', '18776038733', 'eizo2200@qq.com', '2019-08-21 10:37:18');
INSERT INTO `users` VALUES (7, '17674750727', '15197465820', '243020934@qq.com', '2019-08-21 10:37:18');
INSERT INTO `users` VALUES (8, 'kong', '18565287095', '986734973@qq.com', '2019-08-21 10:37:18');
INSERT INTO `users` VALUES (9, 'ivanyb1', '13987654321', 'ivanyb1@qq.com', '2019-08-21 10:37:18');
INSERT INTO `users` VALUES (10, 'ivanyb2', '13987654321', 'ivanyb2@qq.com', '2019-08-21 10:37:18');
INSERT INTO `users` VALUES (11, 'ivanyb3', '13987654321', 'ivanyb3@qq.com', '2019-08-21 10:37:18');
INSERT INTO `users` VALUES (12, 'ivanyb4', '13898765432', 'ivanyb4@qq.com', '2019-08-21 10:37:18');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
