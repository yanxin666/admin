/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : xinlangleju

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2016-07-06 17:32:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for oa_admin
-- ----------------------------
DROP TABLE IF EXISTS `oa_admin`;
CREATE TABLE `oa_admin` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '管理员表主键id',
  `email` varchar(50) DEFAULT '' COMMENT '管理员邮箱',
  `password` varchar(50) DEFAULT '' COMMENT '登录密码',
  `department` varchar(50) DEFAULT '' COMMENT '所属部门',
  `is_notify` tinyint(4) DEFAULT '0' COMMENT '发通知权限: 1->有权限  2->无权限',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_admin
-- ----------------------------
INSERT INTO `oa_admin` VALUES ('1', '2443430792@qq.com', '7fa8282ad93047a4d6fe6111c93b308a', '超级管理员', '1', '2015-11-12 19:15:44');
INSERT INTO `oa_admin` VALUES ('2', '1396909386@qq.com', '7fa8282ad93047a4d6fe6111c93b308a', '格斗天王', '0', '2015-11-13 18:14:12');
INSERT INTO `oa_admin` VALUES ('3', 'test@11.coms', '7fa8282ad93047a4d6fe6111c93b308a', '德玛西亚', '2', '2015-11-24 16:32:00');

-- ----------------------------
-- Table structure for oa_administrative
-- ----------------------------
DROP TABLE IF EXISTS `oa_administrative`;
CREATE TABLE `oa_administrative` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '行政联系表主键id',
  `number` int(10) DEFAULT '0' COMMENT '序号',
  `area` varchar(30) DEFAULT '' COMMENT '大区',
  `city` varchar(30) DEFAULT '' COMMENT '城市',
  `position` varchar(50) DEFAULT '' COMMENT '职位',
  `name` varchar(30) DEFAULT '' COMMENT '姓名',
  `zjlemail` varchar(50) DEFAULT '' COMMENT '总经理邮箱',
  `linkman` varchar(30) DEFAULT '' COMMENT '行政联系人',
  `tel` varchar(20) DEFAULT '' COMMENT '座机',
  `ipphone` varchar(20) DEFAULT '' COMMENT 'IP电话',
  `mobile` varchar(30) DEFAULT '' COMMENT '手机',
  `xzemail` varchar(50) DEFAULT '' COMMENT '行政邮箱',
  `address` varchar(255) DEFAULT '' COMMENT '公司地址',
  `code` int(10) DEFAULT NULL COMMENT '邮编',
  `note` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_administrative
-- ----------------------------
INSERT INTO `oa_administrative` VALUES ('1', '1', '1', '北京', '区域总经理兼北京总经理\r\n区域总经理兼北京总经理', '邢彪', 'xingbiao@leju.com', '陈文芹', '57327174', '7174', '1501009093', 'wenqin@leju.com', '北京市东城区广渠家园5号楼首东国际11层', '100022', '');
INSERT INTO `oa_administrative` VALUES ('2', '2', '1', '西安', '总经理', '南楠', 'nannan2@leju.com', '唐毓繁', '029-68766997', '无', '15091635045', 'yufan1@leju.com', '西安市曲江新区雁南五路1868号曲江影视大厦2403室', '710060', '无');
INSERT INTO `oa_administrative` VALUES ('3', '3', '1', '太原', '总经理', '袁晓龙', 'xiaolong3@leju.com', '陈海军', '0351-5269571', '无', '18935107373', 'haijun2@leju.com', '山西省太原市小店区平阳路1号金茂大厦B座12层C户', '30012', '无');
INSERT INTO `oa_administrative` VALUES ('4', '4', '1', '石家庄', '总经理', '梁志伟', 'zhiwei@leju.com', '张美玥', '0311-85868238', '无', '15133155889', 'meiyue@leju.com', '石家庄槐安东路145号西美五洲SOHO  1901', '50081', '无');
INSERT INTO `oa_administrative` VALUES ('5', '5', '1', '秦皇岛', '总经理', '王永兵', 'yongbing@leju.com', '单雪媛', '0335-3256809', '无', '15933504783', 'xueyuan4@leju.com', '河北省秦皇岛市海港区金原国际商务大厦25B05', '12345', '无');
INSERT INTO `oa_administrative` VALUES ('6', '6', '2', '天津', '区域总兼天津总经理', '蒋琳', 'jianglin@leju.com', '李宜萌', '022-88375888-8030', '1611', '13821138439', 'yimeng@leju.com', '天津市南开区南开三马路与长江道交口融汇广场B座17层', '300199', '无');
INSERT INTO `oa_administrative` VALUES ('7', '7', '2', '烟台', '总经理', '宫照栋', 'zhaodong1@leju.com', '刘静', '0535-4088029', '1958', '13853508887', 'liujing1@leju.com', '山东省烟台市芝罘区南大街市长大厦2406', '264000', '无');
INSERT INTO `oa_administrative` VALUES ('8', '8', '2', '青岛', '总经理', '洪兰兰', 'lanlan@leju.com', '蔡明', '13335036805', '1324', '13335036805', 'caiming@leju.com', '青岛市市南区延安三路234号海航万邦中心1106室', '266000', '无');
INSERT INTO `oa_administrative` VALUES ('9', '9', '2', '济南', '总经理', '杨定坤', 'dingkun@leju.com', '林玲', '0531-86102685', '1087', '15054115214', 'linling@leju.com', '山东省济南市历下区山大路157号华强国际中心A-2705', '250014', '无');
INSERT INTO `oa_administrative` VALUES ('10', '10', '3', '沈阳', '区域总兼沈阳总经理', '侯振龙', 'zhenlong@leju.com', '庞倩', '024-31912633', '无', '13940210925', 'pangqian@leju.com', '沈阳市和平区和盛巷6甲长白万科中心3楼', '110003', '行政经理（兼管沈阳乐居周刊行政）');
INSERT INTO `oa_administrative` VALUES ('11', '11', '3', '沈阳', '区域总兼沈阳总经理', '侯振龙', 'zhenlong@leju.com', '李霏绯', '024-31912610', '无', '15840412118', 'feifei12@leju.com', '沈阳市和平区和盛巷6甲长白万科中心3楼', '110003', '专员');
INSERT INTO `oa_administrative` VALUES ('12', '12', '3', '鞍山', '总经理', '陈毓家', 'yujia@leju.com', '赵若彤', '0412-8770886', '无', '15042223248', 'ruotong@leju.com', '辽宁省鞍山市铁东区建国南路英伦汇6号楼1903室', '114000', '无');
INSERT INTO `oa_administrative` VALUES ('13', '13', '3', '长春', '总经理', '刘旭', 'liuxu@leju.com', '姜宝丽', '0431-88960645', '1419', '13944085204', 'baoli@leju.com', '吉林省长春市朝阳区西安大路727号中银大厦A座7层', '130000', '无');
INSERT INTO `oa_administrative` VALUES ('14', '14', '3', '哈尔滨', '总经理', '储继苹', 'jihua@leju.com', '荆莹', '0451-51800201', '1426', '18504519629', 'hongxu@leju.com', '哈尔滨市南岗区东大直街320号秋林国际23层', '150001', '无');
INSERT INTO `oa_administrative` VALUES ('15', '15', '4', '华南区', '华南区总经理', '李咏涛', 'yongtao@leju.com', '张雯', '0755-66839690-622', '无', '15817439219', 'zhangwen1@leju.com', '深圳市福田区深南大道与新洲路交汇处航天大厦A座1501', '518048', '无');
INSERT INTO `oa_administrative` VALUES ('16', '16', '4', '深圳', '执行总经理', '徐勇辉', 'yonghui@leju.com', '刘琪', '0755-66839690-854', '无', '13823589183', 'liuqi@leju.com', '深圳市福田区深南大道与新洲路交汇处航天大厦A座1501', '518048', '无');
INSERT INTO `oa_administrative` VALUES ('17', '17', '4', '广州', '总经理', '王合群', 'hequn@leju.com', '崔琦霞', '020－66809800-8840', '1544', '15800230223', 'qixia@leju.com', '广州天河区珠江新城珠江西路8号高德置地广场D座14楼01室', '510620', '无');
INSERT INTO `oa_administrative` VALUES ('18', '18', '4', '东莞', '总经理', '吕志洪', 'zhihong2@leju.com', '李多利', '0769-22850125-8002', '1397', '15820774116', 'duoli@leju.com', '东莞市南城区鸿福路华凯广场A座1702号', '523082', '无');
INSERT INTO `oa_administrative` VALUES ('19', '19', '4', '惠州', '总经理', '刘敏', 'liumin1@leju.com', '曾珍', '0752-7777426-8014', '7400', '15816477830', 'zengzhen1@leju.com', '惠州市江北文明一路三号中信城市时代2单元5层03号', '516000', '无');
INSERT INTO `oa_administrative` VALUES ('20', '20', '4', '佛山', '总经理', '卢华俊', 'huajun@leju.com', '林燕妮', '0757-82292253-8018', '1339', '13600011066', 'yanni@leju.com', '佛山市禅城区季华五路55号佛山万科广场二期19楼05-09室', '528000', '无');
INSERT INTO `oa_administrative` VALUES ('21', '21', '4', '珠海', '总经理', '王小英', 'xiaoying@leju.com', '陈子馨', '0756-3334113', '1481', '18818659101', 'zixin2@leju.com', '珠海市九洲大道西2021号中海大厦A座1802', '519000', '无');
INSERT INTO `oa_administrative` VALUES ('22', '22', '4', '中山', '总经理', '王小英', 'xiaoying@leju.com', '陈子馨', '0756-3334113', '1481', '18818659101', 'zixin2@leju.com', '中山市东区中山四路88号尚峰金融商务中心2座15层01卡', '528400', '无');
INSERT INTO `oa_administrative` VALUES ('23', '23', '5', '杭州', '区域总兼杭州总经理', '斯海洲', 'haizhou@leju.com', '金燕', '0571-85839202', '1306', '18668180586', 'jinyan@leju.com', '杭州市杭大路9号聚龙大厦东15A', '310007', '无');
INSERT INTO `oa_administrative` VALUES ('24', '24', '5', '厦门', '总经理', '刘耀', 'liuyao@leju.com', '柳蓉', '5925913877', '无', '15872380592', 'liurong2@leju.com', '厦门市思明区软件园二期观日路58号204室', '361000', '无');
INSERT INTO `oa_administrative` VALUES ('25', '25', '5', '福州', '总经理', '郑利香', 'lixiang8@leju.com', '陈颖', '0591-87515821', '无', '13306930001', 'xiaojin@leju.com', '福建省福州市东街43号新都会财经广场7层乐居', '350001', '无');
INSERT INTO `oa_administrative` VALUES ('26', '26', '5', '宁波', '总经理', '何海源', 'haiyuan@leju.com', '吕丽锦', '0574-89018247', '无', '13819813212', 'lijin4@leju.com', '浙江省宁波市鄞州区鄞县大道中段1357号广博国贸605室', '315100', '无');
INSERT INTO `oa_administrative` VALUES ('27', '27', '6', '苏州', '区域总兼苏州总经理', '徐静乐', 'jingle@leju.com', '刘珺', '0512-62623306-8003', '1972', '13913688116', 'liujun@leju.com', '苏州市工业园区金鸡湖大道1355号国际科技园三期20A', '215000', '无');
INSERT INTO `oa_administrative` VALUES ('28', '28', '6', '昆山', '总经理', '李求实', 'qiushi1@leju.com ', '黄玎颖', '0512-57118670-609', '1591', '15850311255', 'dingying1@leju.com ', '江苏省昆山市伟业路8号现代广场B座2001室', '215300', '无');
INSERT INTO `oa_administrative` VALUES ('29', '29', '6', '南通', '总经理', '俞育新', 'yuxin1@leju.com', '龙姣姣', '51387108316', '无', '13186599002', 'jiaojiao@leju.com', '南通市开发区创业外包服务中心D座12层', '226009', '无');
INSERT INTO `oa_administrative` VALUES ('30', '30', '7', '芜湖', '总经理', '吴国金', 'guojin@leju.com', '程华', '0553-5815788-8063', '无', '13955318495', 'chenghua@leju.com', '安徽省芜湖市镜湖区吉和南路26号雨耕山酒文化创意产业园F幢3楼', '241000', '无');
INSERT INTO `oa_administrative` VALUES ('31', '31', '7', '徐州', '总经理', '谭勇', 'tanyong@leju.com', '佟萱远', '0516-83817788', '无', '15026937622', '524273006@qq.com', '徐州市云龙区和平路64号帝都大厦407室', '221000', '1.28日入职行政');
INSERT INTO `oa_administrative` VALUES ('32', '32', '7', '常州', '总经理', '徐斌', 'xubin@leju.com', '周婷', '0519-85199363', '7437', '13775077838', 'zhouting1@leju.com', '常州市新北区太湖东路9号 常州创意产业基地E号楼1411-1', '213022', '无');
INSERT INTO `oa_administrative` VALUES ('33', '33', '7', '威海', '总经理', '丛丽萍', 'liping@leju.com', '林美华', '0631-5162800', '无', '15163196253', 'meihua@leju.com', '威海市经区海滨南路51号A503室', '264400', '无');
INSERT INTO `oa_administrative` VALUES ('34', '34', '7', '无锡', '总经理', '邵雯', 'shaowen@leju.com', '季希玥', '0510-85224242', '1404', '15261532763', 'xiyue@leju.com', '无锡市新区龙山路4号（旺庄科技创业中心）B栋302室 ', '214028', '无');
INSERT INTO `oa_administrative` VALUES ('35', '35', '8', '郑州', '区域总经理', '陈煜森', 'yusen@leju.com', '马雅', '0371-55686631', '无', '18695828617', 'maya@leju.com', '河南省郑州市郑东新区商务外环西二街新芒果大厦1303', '450000', '无');
INSERT INTO `oa_administrative` VALUES ('36', '35', '8', '郑州', '总经理', '周洋', 'zhouyang@leju.com', '马雅', '0371-55686631', '无', '18695828617', 'maya@leju.com', '河南省郑州市郑东新区商务外环西二街新芒果大厦1303室', '450000', '无');
INSERT INTO `oa_administrative` VALUES ('37', '36', '8', '南昌', '总经理', '崔宏', 'cuihong@leju.com', '章翠', '0791-83896757', '无', '15170498717', 'zhangcui@leju.com', '江西省南昌市红谷中大道1326号江报传媒大厦9F', '330038', '无');
INSERT INTO `oa_administrative` VALUES ('38', '37', '8', '云南', '总经理', '李显峰', 'xianfeng1@leju.com', '陈睿', '无', '无', '15987112840', 'chenrui2@leju.com', '昆明市五华区学府路690号金鼎科技园18号平台B坐307', '650031', '无');
INSERT INTO `oa_administrative` VALUES ('39', '38', '8', '银川', '总经理', '牛志峰', 'zhifeng@leju.com', '王宁', '0951-6040305', '无', '18795163532', 'wangning3@leju.com', '银川金凤区北京中路尹家渠北街金海明月小区12号楼1-801', '75000', '无');
INSERT INTO `oa_administrative` VALUES ('40', '39', '8', '广西-南宁', '总经理', '杜欣', 'duxin1@leju.com', '吴旭', '0771-5382775', '无', '13471039254', 'wuxu@leju.com', '广西南宁市金湖路59号地王国际商务中心16楼乐居办公室', '530022', '无');
INSERT INTO `oa_administrative` VALUES ('41', '40', '8', '贵阳', '总经理', '陈阳', 'chenyang@leju.com', '吴昌琦', '0851-88589010', '无', '18808921155', 'changqi1@leju.com', '贵阳市南明区花果园国际金融街3号（E9栋）24-3', '550000', '(出租旧址-贵阳市南明区都司路中天广场1组团B栋22-3室)');
INSERT INTO `oa_administrative` VALUES ('42', '41', '8', '乌鲁木齐', '总经理', '吴永', 'wuyong1@leju.com', '梁琰', '0991-4596350', '无', '13999257001', 'liangyan2@leju.com', '乌鲁木齐市沙依巴克区河滩北路153号', '830000', '无');
INSERT INTO `oa_administrative` VALUES ('43', '42', '8', '呼和浩特', '总经理', '王洁', 'wangjie3@leju.com', '刘裕霞', '0471—6213492', '无', '18547109025', 'yuxia1@leju.con', '呼和浩特市乌兰察布东街甲106号兴安丽景2号楼1101室', '10010', '无');

-- ----------------------------
-- Table structure for oa_appmenu
-- ----------------------------
DROP TABLE IF EXISTS `oa_appmenu`;
CREATE TABLE `oa_appmenu` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '乐居菜单表主键id',
  `title` varchar(225) DEFAULT '' COMMENT '菜单项',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态：1->显示 2->隐藏',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_appmenu
-- ----------------------------
INSERT INTO `oa_appmenu` VALUES ('1', '邮件', '1', '2015-12-23 20:51:18');
INSERT INTO `oa_appmenu` VALUES ('2', '活动', '1', '2015-12-26 16:02:47');
INSERT INTO `oa_appmenu` VALUES ('3', 'HR助手', '1', '2016-01-21 17:48:57');
INSERT INTO `oa_appmenu` VALUES ('5', '行政帮助', '1', '2015-12-26 16:19:15');
INSERT INTO `oa_appmenu` VALUES ('6', '举贤纳才', '2', '2015-12-26 19:56:19');
INSERT INTO `oa_appmenu` VALUES ('7', '销售通', '1', '2015-12-26 16:19:59');

-- ----------------------------
-- Table structure for oa_auth
-- ----------------------------
DROP TABLE IF EXISTS `oa_auth`;
CREATE TABLE `oa_auth` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '权限表主键id',
  `cname` varchar(50) DEFAULT '' COMMENT '权限',
  `ename` varchar(50) DEFAULT '' COMMENT '权限拼音简称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_auth
-- ----------------------------
INSERT INTO `oa_auth` VALUES ('1', '用户管理', 'YHGL');
INSERT INTO `oa_auth` VALUES ('2', '用户权限管理', 'YHQXGL');
INSERT INTO `oa_auth` VALUES ('3', '后台通知管理', 'HTTZGL');
INSERT INTO `oa_auth` VALUES ('4', '人事通知管理', 'RSTZGL');
INSERT INTO `oa_auth` VALUES ('5', '发布轮播图', 'LBTGL');
INSERT INTO `oa_auth` VALUES ('6', '问候语管理', 'WHYGL');
INSERT INTO `oa_auth` VALUES ('8', '发卡行管理', 'FKHGL');
INSERT INTO `oa_auth` VALUES ('9', '办理流程管理', 'BLLCGL');
INSERT INTO `oa_auth` VALUES ('10', '考勤管理', 'KQGL');
INSERT INTO `oa_auth` VALUES ('12', '后台联系组管理', 'HTLXZGL');
INSERT INTO `oa_auth` VALUES ('14', '行政联系管理', 'XZLXGL');
INSERT INTO `oa_auth` VALUES ('15', '组织机构管理', 'ZZJGGL');
INSERT INTO `oa_auth` VALUES ('16', '意见反馈管理', 'YJFKGL');
INSERT INTO `oa_auth` VALUES ('17', '招聘职位管理', 'ZPZWGL');
INSERT INTO `oa_auth` VALUES ('18', '网址推荐管理', 'WZTJGL');
INSERT INTO `oa_auth` VALUES ('19', '推荐好友管理', 'TJHYGL');
INSERT INTO `oa_auth` VALUES ('20', '工作沟通管理', 'GZGTGL');
INSERT INTO `oa_auth` VALUES ('21', '更多问题管理', 'GDWTGL');
INSERT INTO `oa_auth` VALUES ('22', '使用帮助管理', 'SYBZGL');
INSERT INTO `oa_auth` VALUES ('23', '乐居菜单管理', 'LJCDGL');
INSERT INTO `oa_auth` VALUES ('24', '人事菜单管理', 'RSCDGL');
INSERT INTO `oa_auth` VALUES ('25', '班车线路管理', 'BCXLGL');
INSERT INTO `oa_auth` VALUES ('26', '服务支持管理', 'FWZCGL');
INSERT INTO `oa_auth` VALUES ('27', '版本管理', 'BBGL');

-- ----------------------------
-- Table structure for oa_bank
-- ----------------------------
DROP TABLE IF EXISTS `oa_bank`;
CREATE TABLE `oa_bank` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '发卡行主键id',
  `name` varchar(50) DEFAULT '' COMMENT '发卡行名称',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_bank
-- ----------------------------
INSERT INTO `oa_bank` VALUES ('4', '中国人民银行', '2016-02-22 14:56:59');

-- ----------------------------
-- Table structure for oa_bus
-- ----------------------------
DROP TABLE IF EXISTS `oa_bus`;
CREATE TABLE `oa_bus` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '乐居班车线路表主键id',
  `line` varchar(255) DEFAULT '' COMMENT '班车线路',
  `sno` varchar(30) DEFAULT '' COMMENT '班车编号',
  `start` varchar(100) DEFAULT '' COMMENT '班车始发地',
  `driver` varchar(30) DEFAULT '' COMMENT '司机名称',
  `dmobile` varchar(20) DEFAULT '' COMMENT '司机手机号',
  `busnumber` varchar(20) DEFAULT '' COMMENT '车牌号',
  `team` varchar(30) DEFAULT '' COMMENT '班车长',
  `tmobile` varchar(20) DEFAULT '' COMMENT '班车长手机号',
  `temail` varchar(50) DEFAULT '' COMMENT '班车长邮箱',
  `nightstart` varchar(100) DEFAULT '' COMMENT '晚班始发站点',
  `nighttime` varchar(30) DEFAULT '' COMMENT '晚班停车时间',
  `nightadd` varchar(255) DEFAULT '' COMMENT '晚班停车位置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_bus
-- ----------------------------
INSERT INTO `oa_bus` VALUES ('1', '马甸桥-首东国际大厦', '1号班车', '马甸桥', '周丙强', '15801038166', '京AL2865', '宋冬奇', '13911571107', 'dongqi1@leju.com', '', '', '');

-- ----------------------------
-- Table structure for oa_busline
-- ----------------------------
DROP TABLE IF EXISTS `oa_busline`;
CREATE TABLE `oa_busline` (
  `lineid` int(10) NOT NULL AUTO_INCREMENT COMMENT '乐居班车线路表主键id',
  `linename` varchar(30) DEFAULT '' COMMENT '线路名称',
  `line` varchar(100) DEFAULT '' COMMENT '班车线路',
  `sno` varchar(30) DEFAULT '' COMMENT '班车编号',
  `linetime` varchar(100) DEFAULT '' COMMENT '班车早晚发车时间',
  `driver` varchar(30) DEFAULT '' COMMENT '司机',
  `dmobile` varchar(20) DEFAULT '' COMMENT '司机手机号',
  `busnumber` varchar(20) DEFAULT '' COMMENT '车牌号',
  `teamer` varchar(30) DEFAULT '' COMMENT '班车长',
  `tmobile` varchar(20) DEFAULT '' COMMENT '班车长手机号',
  `temail` varchar(50) DEFAULT '' COMMENT '班车长邮箱',
  `nightstart` varchar(100) DEFAULT '' COMMENT '晚班始发站点',
  `nighttime` varchar(30) DEFAULT '' COMMENT '晚班停车时间',
  `nightadd` varchar(100) DEFAULT '' COMMENT '晚班停车位置',
  `showimg` varchar(80) DEFAULT NULL,
  `createtime` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`lineid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_busline
-- ----------------------------
INSERT INTO `oa_busline` VALUES ('1', '马甸桥线', '马甸桥-首东国际大厦-马甸桥', '1', '7:50-18:20', '周丙强', '15801038166', '京AL2865', '宋冬奇', '13911571107', 'dongqi1@leju.com', '首东国际大厦', '18:20', '首东国际大厦北门路边', null, '2016-01-07 17:45:10');
INSERT INTO `oa_busline` VALUES ('2', '天通苑线', '天通苑-首东国际大厦-天通苑', '2', '6:55-18:20', '常师傅', '13683260495', '京AL2869', '梁国栋', '18515385141', 'guodong4@leju.com', '首东国际大厦', '18:20', '首东国际大厦北门马路对面地铁站', null, '2016-01-07 17:47:13');
INSERT INTO `oa_busline` VALUES ('3', '通州班车东线', '通州土桥城铁站\r\n—首东国际大厦—通州土桥城铁站', '3', '7:15-18:15', '赵洪伟', '18611203296', '京AJ7024', '赵轩', '18618267134', 'zhaoxuan@leju.com', '首东国际大厦', '18:15', '首东国际大厦北门马路对面\r\n（力力豆花庄饭店门前）', null, '2016-01-07 17:49:56');
INSERT INTO `oa_busline` VALUES ('4', '大兴班车南线', '大兴清源路地铁站—首东国际大厦—大兴清源路地铁站', '4', '7:10-18:20', '李师傅', '13716852853', '京AJ7304', '郭蕊', '15001230151', 'guorui@leju.com', '首东国际大厦', '18:20', '首东国际大厦北门路边', null, '2016-01-07 17:52:09');

-- ----------------------------
-- Table structure for oa_busline_station
-- ----------------------------
DROP TABLE IF EXISTS `oa_busline_station`;
CREATE TABLE `oa_busline_station` (
  `stationid` int(10) NOT NULL AUTO_INCREMENT COMMENT '班车站点主键id',
  `lineid` int(10) DEFAULT '0' COMMENT '班车线路id',
  `get_station` varchar(50) DEFAULT '' COMMENT '早班车上车站点',
  `send_time` varchar(30) DEFAULT '' COMMENT '发车时间',
  `stop_address` varchar(100) DEFAULT '' COMMENT '停车位置',
  `createtime` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`stationid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_busline_station
-- ----------------------------
INSERT INTO `oa_busline_station` VALUES ('1', '1', '马甸桥', '7:50', '马甸桥东侧辅路（德胜饭店往东50米）', '2016-01-07 17:44:33');
INSERT INTO `oa_busline_station` VALUES ('2', '1', '安贞桥', '7:56', '安贞桥辅路木偶剧院北门', '2016-01-07 17:44:36');
INSERT INTO `oa_busline_station` VALUES ('3', '1', '光熙门', '8:00', '光熙门地铁站', '2016-01-07 17:44:40');
INSERT INTO `oa_busline_station` VALUES ('4', '1', '三元桥', '8:10', '三元桥主路公交车站', '2016-01-07 17:45:28');
INSERT INTO `oa_busline_station` VALUES ('5', '1', '呼家楼', '8:20', '呼家楼地铁站', '2016-01-07 17:45:54');
INSERT INTO `oa_busline_station` VALUES ('6', '1', '双井桥西', '8:30', '双井桥西公交车站', '2016-01-07 17:46:15');
INSERT INTO `oa_busline_station` VALUES ('7', '1', '首东国际大厦', '8:50', '首东国际大厦北门', '2016-01-07 17:46:37');
INSERT INTO `oa_busline_station` VALUES ('8', '2', '天通苑', '6:55', '天通苑地铁站西北口,安立路辅路西侧天桥下', '2016-01-07 17:46:59');
INSERT INTO `oa_busline_station` VALUES ('9', '2', '立水桥', '7:05', '立水桥地铁站B1口出口，安立路主路路西天桥下', '2016-01-07 17:47:21');
INSERT INTO `oa_busline_station` VALUES ('10', '2', '首东国际大厦', '8:45', '首东国际大厦北门', '2016-01-07 17:47:53');
INSERT INTO `oa_busline_station` VALUES ('11', '3', '通州土桥城铁站', '7：15', '土桥城铁站北过街天桥东侧', '2016-01-07 17:48:19');
INSERT INTO `oa_busline_station` VALUES ('12', '3', '梨园城铁站', '7：20', '梨园城铁站路北主路公交车站', '2016-01-07 17:48:42');
INSERT INTO `oa_busline_station` VALUES ('13', '3', '北苑城铁站', '7：30', '北苑城铁站南，北苑小学北侧红绿灯向北809车站“玉带路西口', '2016-01-07 17:49:03');
INSERT INTO `oa_busline_station` VALUES ('14', '3', '管庄城铁站', '7：40', '管庄城铁站B出口', '2016-01-07 17:49:26');
INSERT INTO `oa_busline_station` VALUES ('15', '3', '双桥', '7：45', '双桥路口向西150米', '2016-01-07 17:49:44');
INSERT INTO `oa_busline_station` VALUES ('16', '3', '传媒大学', '7：50', '传媒大学南门往西30米过街桥下', '2016-01-07 17:50:03');
INSERT INTO `oa_busline_station` VALUES ('17', '3', '首东国际大厦', '8：40', '首东国际大厦', '2016-01-07 17:50:26');
INSERT INTO `oa_busline_station` VALUES ('18', '4', '大兴清源路地铁站', '7: 10', '东南出口', '2016-01-07 17:50:49');
INSERT INTO `oa_busline_station` VALUES ('19', '4', '大兴二中', '7：15', '京开辅路，西边能看到康庄公园，对面福海路路口南，过街天桥下公交车站', '2016-01-07 17:51:11');
INSERT INTO `oa_busline_station` VALUES ('20', '4', '西红门', '7：20', '京开辅路，东侧西红门镇政府，鸿福路口南', '2016-01-07 17:51:32');
INSERT INTO `oa_busline_station` VALUES ('21', '4', '新发地', '7：30', '京开辅路，过街天桥下，九龙山庄公交站牌', '2016-01-07 17:51:54');
INSERT INTO `oa_busline_station` VALUES ('22', '4', '草桥', '7：40', '草桥三环主路公交车站出站口（方便停车）', '2016-01-07 17:52:12');
INSERT INTO `oa_busline_station` VALUES ('23', '4', '木樨园', '7：50', '木樨园桥东三环主路公交车站出站口\r\n（方便停车）', '2016-01-07 17:52:33');
INSERT INTO `oa_busline_station` VALUES ('24', '4', '首东国际大厦', '8：40', '首东国际大厦', '2016-01-07 17:53:08');

-- ----------------------------
-- Table structure for oa_expense
-- ----------------------------
DROP TABLE IF EXISTS `oa_expense`;
CREATE TABLE `oa_expense` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '报销表主键id',
  `expense_code` varchar(30) DEFAULT '' COMMENT '报销单号',
  `author_user` tinyint(10) DEFAULT '0' COMMENT '申请人',
  `author_dept` tinyint(10) DEFAULT '0' COMMENT '申请人所属部门',
  `draft_time` datetime DEFAULT NULL COMMENT '起草时间',
  `total_expense` varchar(20) DEFAULT '' COMMENT '报销金额',
  `had_act_user` varchar(15) DEFAULT '' COMMENT '当前节点人',
  `budget_year` varchar(10) DEFAULT '0' COMMENT '预算年份',
  `budget_month` varchar(5) DEFAULT '0' COMMENT '预算月份',
  `activityos` tinyint(3) DEFAULT '0' COMMENT '审批状态： 1->待审核 2->已审核',
  `islk` tinyint(3) DEFAULT '0' COMMENT '是否领款: 1->未领取 2->已领取',
  `gz_no` varchar(20) DEFAULT '' COMMENT '申请人工号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_expense
-- ----------------------------
INSERT INTO `oa_expense` VALUES ('7', '222', '2', '1', '2016-02-18 11:16:23', '22.222', '哈哈', '2016', '2', '1', '1', '22222');

-- ----------------------------
-- Table structure for oa_greetings
-- ----------------------------
DROP TABLE IF EXISTS `oa_greetings`;
CREATE TABLE `oa_greetings` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '问候语表主键id',
  `img` varchar(50) DEFAULT '' COMMENT '背景图片地址',
  `content` text COMMENT '问候语内容',
  `color` varchar(30) DEFAULT '' COMMENT '字体颜色',
  `state` tinyint(4) DEFAULT '0' COMMENT '状态:1->显示 2->隐藏',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_greetings
-- ----------------------------
INSERT INTO `oa_greetings` VALUES ('1', '111', '亲爱的乐居人儿: 这是您加入乐居大家庭的第天 爱生活,爱乐居! 让我们一起加油吧~', '绿', '1', '2015-12-18 11:57:08');
INSERT INTO `oa_greetings` VALUES ('2', 'images/201601/1453023759.jpg', '测试', '#371f28', '0', '2016-01-17 17:47:58');

-- ----------------------------
-- Table structure for oa_jobtalk
-- ----------------------------
DROP TABLE IF EXISTS `oa_jobtalk`;
CREATE TABLE `oa_jobtalk` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '工作沟通表主键id',
  `title` varchar(50) DEFAULT '' COMMENT '标题',
  `content` text COMMENT '详情',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_jobtalk
-- ----------------------------
INSERT INTO `oa_jobtalk` VALUES ('1', '工作沟通1', '工作沟通1', '2015-12-24 20:22:46');
INSERT INTO `oa_jobtalk` VALUES ('2', '工作沟通2', '工作沟通2', '2015-12-24 20:22:57');
INSERT INTO `oa_jobtalk` VALUES ('3', '工作沟通3', '工作沟通3', '2015-12-24 20:23:09');
INSERT INTO `oa_jobtalk` VALUES ('4', '工作沟通4', '工作沟通4', '2015-12-24 20:23:20');

-- ----------------------------
-- Table structure for oa_kaoqin
-- ----------------------------
DROP TABLE IF EXISTS `oa_kaoqin`;
CREATE TABLE `oa_kaoqin` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '销售打卡主键id',
  `lejuid` int(10) DEFAULT NULL COMMENT '打卡人的lejuid',
  `address` text COMMENT '打卡地址',
  `latitude` decimal(10,7) DEFAULT '0.0000000' COMMENT '打卡经度',
  `longtitude` decimal(10,7) DEFAULT '0.0000000' COMMENT '打卡纬度',
  `kqtime` datetime DEFAULT NULL COMMENT '打卡时间',
  `date` varchar(20) DEFAULT '' COMMENT '打卡日期',
  `week` varchar(20) DEFAULT '' COMMENT '星期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_kaoqin
-- ----------------------------
INSERT INTO `oa_kaoqin` VALUES ('1', '3', '上海', '0.0000000', '0.0000000', '2016-01-24 06:11:08', '20160124', '');
INSERT INTO `oa_kaoqin` VALUES ('2', '1', '上海', '0.0000000', '0.0000000', '2016-01-24 06:14:44', '20160124', '');
INSERT INTO `oa_kaoqin` VALUES ('3', '2', '上海', '0.0000000', '0.0000000', '2016-01-24 06:14:56', '20160124', '');
INSERT INTO `oa_kaoqin` VALUES ('4', '2', '上海', '0.0000000', '0.0000000', '2016-01-24 06:15:04', '20160124', '');
INSERT INTO `oa_kaoqin` VALUES ('5', '3', '上海', '0.0000000', '0.0000000', '2016-01-24 06:15:14', '20160124', '');
INSERT INTO `oa_kaoqin` VALUES ('6', '4', '乐居', '0.0000000', '0.0000000', '2016-01-24 06:15:23', '20160124', '');
INSERT INTO `oa_kaoqin` VALUES ('7', '3', 'LOL', '0.0000000', '0.0000000', '2016-01-24 06:15:32', '20160124', '');
INSERT INTO `oa_kaoqin` VALUES ('8', '4', '上海', '0.0000000', '0.0000000', '2016-01-24 06:15:42', '20160124', '');
INSERT INTO `oa_kaoqin` VALUES ('9', '1', 'LOL', '0.0000000', '0.0000000', '2016-01-24 06:15:54', '20160124', '');
INSERT INTO `oa_kaoqin` VALUES ('10', '3', '上海', '0.0000000', '0.0000000', '2016-01-24 06:16:09', '20160124', '');
INSERT INTO `oa_kaoqin` VALUES ('11', '3', '乐居', '0.0000000', '0.0000000', '2016-01-24 06:16:18', '20160124', '');
INSERT INTO `oa_kaoqin` VALUES ('12', '2', '乐居', '0.0000000', '0.0000000', '2016-01-24 06:16:29', '20160124', '');

-- ----------------------------
-- Table structure for oa_linkman
-- ----------------------------
DROP TABLE IF EXISTS `oa_linkman`;
CREATE TABLE `oa_linkman` (
  `userid` int(10) NOT NULL COMMENT '联系人表主键id',
  `userlist` text COMMENT '用户id集',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_linkman
-- ----------------------------
INSERT INTO `oa_linkman` VALUES ('1', '2,3,4');
INSERT INTO `oa_linkman` VALUES ('2', null);
INSERT INTO `oa_linkman` VALUES ('3', null);
INSERT INTO `oa_linkman` VALUES ('4', null);
INSERT INTO `oa_linkman` VALUES ('7', null);
INSERT INTO `oa_linkman` VALUES ('252', null);
INSERT INTO `oa_linkman` VALUES ('3875', null);
INSERT INTO `oa_linkman` VALUES ('4033', null);
INSERT INTO `oa_linkman` VALUES ('5752', null);
INSERT INTO `oa_linkman` VALUES ('7062', null);
INSERT INTO `oa_linkman` VALUES ('8474', null);
INSERT INTO `oa_linkman` VALUES ('8581', null);
INSERT INTO `oa_linkman` VALUES ('8837', null);
INSERT INTO `oa_linkman` VALUES ('8893', null);
INSERT INTO `oa_linkman` VALUES ('10460', null);
INSERT INTO `oa_linkman` VALUES ('10567', null);
INSERT INTO `oa_linkman` VALUES ('10745', null);
INSERT INTO `oa_linkman` VALUES ('11290', null);
INSERT INTO `oa_linkman` VALUES ('12307', null);
INSERT INTO `oa_linkman` VALUES ('12345', null);
INSERT INTO `oa_linkman` VALUES ('12791', null);
INSERT INTO `oa_linkman` VALUES ('13185', null);
INSERT INTO `oa_linkman` VALUES ('13376', null);
INSERT INTO `oa_linkman` VALUES ('13575', null);
INSERT INTO `oa_linkman` VALUES ('13840', null);
INSERT INTO `oa_linkman` VALUES ('14510', null);
INSERT INTO `oa_linkman` VALUES ('14980', null);
INSERT INTO `oa_linkman` VALUES ('14986', null);

-- ----------------------------
-- Table structure for oa_menu
-- ----------------------------
DROP TABLE IF EXISTS `oa_menu`;
CREATE TABLE `oa_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '菜单组主键id',
  `menu` varchar(30) DEFAULT '' COMMENT '菜单名称',
  `pmenuid` int(10) DEFAULT NULL COMMENT '父菜单id',
  `alias` varchar(30) DEFAULT '' COMMENT '菜单别名用于跳转',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_menu
-- ----------------------------

-- ----------------------------
-- Table structure for oa_notify
-- ----------------------------
DROP TABLE IF EXISTS `oa_notify`;
CREATE TABLE `oa_notify` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '通知表主键id',
  `target_address` varchar(255) DEFAULT '' COMMENT '目标邮件帐号地址',
  `sender_address` varchar(100) DEFAULT '' COMMENT '发通知人的帐号地址',
  `sender_id` int(10) DEFAULT NULL COMMENT '发通知人的id',
  `send_dept` varchar(50) DEFAULT '' COMMENT '发通知部门',
  `notify_type` tinyint(4) DEFAULT '0' COMMENT '通知对象类型: 1->部分员工 2->全体员工',
  `notify_man` text COMMENT '通知对象',
  `listid` text COMMENT '通知对象id集',
  `title` varchar(255) DEFAULT '' COMMENT '通知标题',
  `content` text COMMENT '通知内容',
  `time` datetime DEFAULT NULL COMMENT '通知时间',
  `img` varchar(200) DEFAULT '' COMMENT '图片URL地址',
  `device` varchar(200) DEFAULT NULL COMMENT '设备',
  `state` tinyint(3) DEFAULT '0' COMMENT '状态：0->未发送 1->已发送',
  `viewcount` int(10) DEFAULT '0' COMMENT '通知详情浏览次数',
  `whose` int(4) DEFAULT '0' COMMENT '通知归属： 1->管理员 2->普通用户 3->人事',
  `islook` text COMMENT '通知查看人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_notify
-- ----------------------------
INSERT INTO `oa_notify` VALUES ('1', '', '', '0', '总裁办', '1', 'xinlei6 ', null, '测试1', '测试1', '2016-01-21 22:41:14', 'images/201601/1453387274.jpg', null, '1', '0', '1', null);
INSERT INTO `oa_notify` VALUES ('2', '', '', '0', '总裁办', '1', 'lixia8', null, '测试2', '测试2', '2016-01-21 22:41:33', 'images/201601/1453387293.jpg', null, '1', '0', '1', null);
INSERT INTO `oa_notify` VALUES ('3', '', '', '0', '总裁办', '1', 'xiangmin', null, '测试3', '测试3', '2016-01-21 22:41:53', 'images/201601/1453387313.jpg', null, '1', '0', '1', null);
INSERT INTO `oa_notify` VALUES ('4', '', '', '0', '总裁办', '1', 'aiwen', null, '测试4', '测试4', '2016-01-21 22:42:12', 'images/201601/1453387332.jpg', null, '1', '0', '1', null);
INSERT INTO `oa_notify` VALUES ('6', '', '', '0', '总裁办', '1', 'xinlei6 ', null, '测试5', '测试5', '2016-01-21 22:49:56', 'images/201601/1453387796.jpg', null, '1', '0', '1', null);
INSERT INTO `oa_notify` VALUES ('7', '', '', '0', '总裁办', '1', 'xinlei6 ', null, '测试6', '测试6', '2016-01-21 23:07:10', 'images/201601/1453388830.jpg', null, '1', '0', '1', null);
INSERT INTO `oa_notify` VALUES ('8', '', '', '0', '总裁办', '1', 'xinlei6 ', '2', '乐居通知测试2', '乐居通知测试2', '2016-01-22 00:29:45', 'images/201601/1453393785.jpg', null, '1', '0', '1', null);
INSERT INTO `oa_notify` VALUES ('9', '', '', '0', '总裁办', '1', 'xinlei6 ', null, '乐居通知测试1', '乐居通知测试1', '2016-01-22 00:33:06', 'images/201601/1453393986.jpg', null, '0', '0', '3', null);
INSERT INTO `oa_notify` VALUES ('10', '', '', '0', '总裁办', '1', 'zijian ', null, '测试', '测试', '2016-02-19 10:44:55', 'images/201602/1455849895.jpg', null, '0', '0', '3', null);
INSERT INTO `oa_notify` VALUES ('11', '', '', '0', '总裁办', '1', 'liuran', '1', '乐居通知测试1', '乐居通知测试1', '2016-02-22 17:49:42', '', null, '0', '0', '1', null);
INSERT INTO `oa_notify` VALUES ('12', '', '', '0', '总裁办', '1', 'xinlei6 ', '1', '乐居通知测试2', '乐居通知测试2', '2016-03-01 17:49:00', '', null, '0', '0', '1', null);
INSERT INTO `oa_notify` VALUES ('13', '', '', '0', '总裁办', '1', 'lixia8', '2', '乐居通知测试5', '乐居通知测试5', '2016-03-01 18:12:12', '', null, '0', '0', '1', null);
INSERT INTO `oa_notify` VALUES ('14', '', '', '0', '总裁办', '1', 'xiangmin ', '3', '乐居通知测试1', '乐居通知测试1', '2016-03-01 18:32:06', '', null, '0', '0', '1', null);
INSERT INTO `oa_notify` VALUES ('15', '', '', '0', '总裁办', '1', 'xinlei6 ', '1', '乐居通知测试4', '乐居通知测试4', '2016-03-01 18:35:40', '', null, '0', '0', '1', null);
INSERT INTO `oa_notify` VALUES ('16', '', '', '0', '总裁办', '1', 'xinlei6,lixia8 ', '1,2', '乐居通知测试1', '乐居通知测试1', '2016-03-01 18:36:07', '', null, '0', '0', '1', null);
INSERT INTO `oa_notify` VALUES ('17', '', '', '0', '总裁办', '1', 'xinlei6 ', '1', '乐居通知测试1', '乐居通知测试1', '2016-03-01 21:09:41', '', null, '1', '0', '1', null);
INSERT INTO `oa_notify` VALUES ('18', '', '', '0', '总裁办', '1', 'zhangyan19 ', '13840', '乐居通知测试1', '乐居通知测试1', '2016-03-01 21:17:27', '', null, '1', '0', '1', null);
INSERT INTO `oa_notify` VALUES ('19', '', '', '0', '总裁办', '1', 'xinlei6,lixia8 ', '1,2', '乐居通知测试1', '乐居通知测试1', '2016-03-02 16:06:21', '', null, '1', '0', '1', null);
INSERT INTO `oa_notify` VALUES ('20', '', '', '0', '总裁办', '1', 'xinlei6', '1', '乐居通知测试1', '乐居通知测试1', '2016-03-03 09:32:54', '', null, '1', '0', '1', null);
INSERT INTO `oa_notify` VALUES ('21', '', '', '0', '总裁办', '1', 'xinlei6 ', '1', '乐居通知测试1', '乐居通知测试1', '2016-03-03 09:33:27', 'images/201603/1456968807.jpg', null, '1', '0', '3', null);
INSERT INTO `oa_notify` VALUES ('22', '', '', '0', '总裁办', '1', 'xinlei6 ', '1', '乐居通知测试1', '乐居通知测试1', '2016-03-03 09:35:52', '', null, '0', '0', '3', null);
INSERT INTO `oa_notify` VALUES ('23', '', '', '0', '总裁办', '1', 'zijian', '4', '如何借助JPush即时向客户端推送消息', '应用内消息。或者称作：自定义消息，透传消息。\r\n此部分内容不会展示到通知栏上，JPush SDK 收到消息内容后透传给 App。App 需要自行处理。\r\niOS 平台上，有此部分内容，才会推送应用内消息通道。\r\nWindows Phone 平台上，暂时不支持应用内消息。', '2016-03-22 18:19:08', '', null, '1', '0', '1', null);
INSERT INTO `oa_notify` VALUES ('24', '', '', '0', '总裁办', '1', 'zijian', '4', '如何借助JPush即时向客户端推送消息', 'Android 1.6.2及以下版本 接收notification 与 message 并存（即本次api调用同时推送通知和消息）的离线推送， 只能收到通知部分，message 部分没有透传给 App。 Android 1.6.3及以上SDK 版本已做相应调整，能正常接收同时推送通知和消息的离线记录。', '2016-03-22 18:26:37', '', null, '1', '0', '1', null);
INSERT INTO `oa_notify` VALUES ('25', '', '', '0', '总裁办', '1', 'zijian', '4', '如何借助JPush即时向客户端推送消息', 'Android 1.6.2及以下版本 接收notification 与 message 并存（即本次api调用同时推送通知和消息）的离线推送， 只能收到通知部分，message 部分没有透传给 App。 Android 1.6.3及以上SDK 版本已做相应调整，能正常接收同时推送通知和消息的离线记录。', '2016-03-22 18:29:01', '', null, '1', '0', '1', null);
INSERT INTO `oa_notify` VALUES ('26', '', '', '0', '总裁办', '1', 'zijian', '4', '如何借助JPush即时向客户端推送消息', 'Android 1.6.2及以下版本 接收notification 与 message 并存（即本次api调用同时推送通知和消息）的离线推送， 只能收到通知部分，message 部分没有透传给 App。 Android 1.6.3及以上SDK 版本已做相应调整，能正常接收同时推送通知和消息的离线记录。', '2016-03-22 18:30:59', '', null, '1', '0', '1', null);
INSERT INTO `oa_notify` VALUES ('27', '', '', '0', '总裁办', '1', 'zijian', '4', '如何借助JPush即时向客户端推送消息', 'Android 1.6.2及以下版本 接收notification 与 message 并存（即本次api调用同时推送通知和消息）的离线推送， 只能收到通知部分，message 部分没有透传给 App。 Android 1.6.3及以上SDK 版本已做相应调整，能正常接收同时推送通知和消息的离线记录。', '2016-03-23 09:19:05', '', null, '1', '0', '1', null);
INSERT INTO `oa_notify` VALUES ('28', '', '', '0', '总裁办', '1', 'zijian', '4', '如何借助JPush即时向客户端推送消息', 'Android 1.6.2及以下版本 接收notification 与 message 并存（即本次api调用同时推送通知和消息）的离线推送， 只能收到通知部分，message 部分没有透传给 App。 Android 1.6.3及以上SDK 版本已做相应调整，能正常接收同时推送通知和消息的离线记录。', '2016-03-23 09:23:21', '', null, '1', '0', '1', null);
INSERT INTO `oa_notify` VALUES ('29', '', '', '0', '总裁办', '1', 'zijian', '4', '如何借助JPush即时向客户端推送消息', 'Android 1.6.2及以下版本 接收notification 与 message 并存（即本次api调用同时推送通知和消息）的离线推送， 只能收到通知部分，message 部分没有透传给 App。 Android 1.6.3及以上SDK 版本已做相应调整，能正常接收同时推送通知和消息的离线记录。', '2016-03-23 09:35:34', '', null, '1', '0', '1', null);
INSERT INTO `oa_notify` VALUES ('30', '', '', '0', '总裁办', '1', 'zijian ', '4', '如何借助JPush即时向客户端推送消息', 'Android 1.6.2及以下版本 接收notification 与 message 并存（即本次api调用同时推送通知和消息）的离线推送， 只能收到通知部分，message 部分没有透传给 App。 Android 1.6.3及以上SDK 版本已做相应调整，能正常接收同时推送通知和消息的离线记录。', '2016-03-23 09:36:13', '', null, '1', '0', '3', null);
INSERT INTO `oa_notify` VALUES ('31', '', '', '0', '总裁办', '1', 'zijian', '4', '如何借助JPush即时向客户端推送消息', 'Android 1.6.2及以下版本 接收notification 与 message 并存（即本次api调用同时推送通知和消息）的离线推送， 只能收到通知部分，message 部分没有透传给 App。 Android 1.6.3及以上SDK 版本已做相应调整，能正常接收同时推送通知和消息的离线记录。', '2016-03-23 09:56:52', '', null, '1', '0', '1', null);
INSERT INTO `oa_notify` VALUES ('32', '', '', '0', '总裁办', '1', 'zijian', '4', '如何借助JPush即时向客户端推送消息', 'Android 1.6.2及以下版本 接收notification 与 message 并存（即本次api调用同时推送通知和消息）的离线推送， 只能收到通知部分，message 部分没有透传给 App。 Android 1.6.3及以上SDK 版本已做相应调整，能正常接收同时推送通知和消息的离线记录。', '2016-03-23 09:57:02', '', null, '1', '0', '1', null);
INSERT INTO `oa_notify` VALUES ('33', '', '', '0', '总裁办', '1', 'zijian', '4', '如何借助JPush即时向客户端推送消息', 'Android 1.6.2及以下版本 接收notification 与 message 并存（即本次api调用同时推送通知和消息）的离线推送， 只能收到通知部分，message 部分没有透传给 App。 Android 1.6.3及以上SDK 版本已做相应调整，能正常接收同时推送通知和消息的离线记录。', '2016-03-23 09:57:11', '', null, '1', '0', '1', null);
INSERT INTO `oa_notify` VALUES ('34', '', '', '0', '总裁办', '1', 'yiyuan1', '3', '判断通知类型', '能读取到通知类型参数sendtype吗', '2016-03-30 13:53:23', '', null, '1', '0', '1', null);

-- ----------------------------
-- Table structure for oa_notify_senduser
-- ----------------------------
DROP TABLE IF EXISTS `oa_notify_senduser`;
CREATE TABLE `oa_notify_senduser` (
  `notifysendid` int(10) NOT NULL AUTO_INCREMENT COMMENT '通知明细表主键id',
  `notify_id` int(11) DEFAULT '0' COMMENT '关联通知表主键',
  `user_id` int(11) DEFAULT '0' COMMENT '关联用户表id',
  `notify_status` tinyint(1) DEFAULT '0' COMMENT '通知状态0->未发送，1->已发送， 2->已送达，3->发送失败，4->未登录,未发送',
  `read_status` tinyint(1) DEFAULT '0' COMMENT '0->未读,1->已读',
  `sendtime` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '发送时间',
  `updatetime` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `createtime` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`notifysendid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='通知明细表';

-- ----------------------------
-- Records of oa_notify_senduser
-- ----------------------------
INSERT INTO `oa_notify_senduser` VALUES ('1', '1', '1', '1', '0', '0000-00-00 00:00:00', '2016-01-21 23:05:46', '2016-01-21 22:41:14');
INSERT INTO `oa_notify_senduser` VALUES ('2', '2', '2', '1', '0', '0000-00-00 00:00:00', '2016-01-21 23:05:47', '2016-01-21 22:41:33');
INSERT INTO `oa_notify_senduser` VALUES ('3', '3', '3', '1', '0', '0000-00-00 00:00:00', '2016-01-21 23:05:48', '2016-01-21 22:41:53');
INSERT INTO `oa_notify_senduser` VALUES ('4', '4', '4', '1', '0', '0000-00-00 00:00:00', '2016-01-21 23:05:48', '2016-01-21 22:42:12');
INSERT INTO `oa_notify_senduser` VALUES ('5', '6', '1', '1', '0', '0000-00-00 00:00:00', '2016-01-21 23:05:51', '2016-01-21 22:49:56');
INSERT INTO `oa_notify_senduser` VALUES ('6', '7', '1', '1', '0', '0000-00-00 00:00:00', '2016-01-21 23:07:15', '2016-01-21 23:07:10');
INSERT INTO `oa_notify_senduser` VALUES ('7', '7', '2', '1', '0', '0000-00-00 00:00:00', '2016-01-21 23:07:17', '2016-01-21 23:07:10');
INSERT INTO `oa_notify_senduser` VALUES ('8', '8', '2', '4', '0', '0000-00-00 00:00:00', '2016-03-01 17:41:09', '2016-01-22 00:29:45');
INSERT INTO `oa_notify_senduser` VALUES ('9', '9', '4', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2016-01-22 00:33:06');
INSERT INTO `oa_notify_senduser` VALUES ('10', '10', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2016-02-19 10:44:55');
INSERT INTO `oa_notify_senduser` VALUES ('11', '11', '1', '1', '0', '2016-03-01 17:47:14', '2016-03-01 17:47:15', '2016-02-22 17:49:42');
INSERT INTO `oa_notify_senduser` VALUES ('12', '12', '1', '4', '0', '0000-00-00 00:00:00', '2016-03-01 17:49:10', '2016-03-01 17:49:00');
INSERT INTO `oa_notify_senduser` VALUES ('13', '13', '2', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2016-03-01 18:12:12');
INSERT INTO `oa_notify_senduser` VALUES ('14', '14', '3', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2016-03-01 18:32:06');
INSERT INTO `oa_notify_senduser` VALUES ('15', '15', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2016-03-01 18:35:40');
INSERT INTO `oa_notify_senduser` VALUES ('16', '16', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2016-03-01 18:36:07');
INSERT INTO `oa_notify_senduser` VALUES ('17', '16', '2', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2016-03-01 18:36:07');
INSERT INTO `oa_notify_senduser` VALUES ('18', '17', '1', '1', '0', '2016-03-01 22:02:41', '2016-03-01 22:02:41', '2016-03-01 21:09:41');
INSERT INTO `oa_notify_senduser` VALUES ('19', '18', '13840', '4', '0', '2016-03-01 22:03:03', '2016-03-01 22:03:03', '2016-03-01 21:17:27');
INSERT INTO `oa_notify_senduser` VALUES ('20', '19', '1', '1', '0', '2016-03-02 16:07:03', '2016-03-02 16:07:03', '2016-03-02 16:06:21');
INSERT INTO `oa_notify_senduser` VALUES ('21', '19', '2', '1', '0', '2016-03-02 16:07:03', '2016-03-02 16:07:03', '2016-03-02 16:06:21');
INSERT INTO `oa_notify_senduser` VALUES ('22', '20', '1', '1', '0', '2016-03-03 09:33:02', '2016-03-03 09:33:02', '2016-03-03 09:32:54');
INSERT INTO `oa_notify_senduser` VALUES ('23', '21', '1', '1', '0', '2016-03-03 09:33:37', '2016-03-03 09:33:37', '2016-03-03 09:33:27');
INSERT INTO `oa_notify_senduser` VALUES ('24', '22', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2016-03-03 09:35:52');
INSERT INTO `oa_notify_senduser` VALUES ('25', '23', '4', '1', '0', '2016-03-22 18:24:04', '2016-03-22 18:24:04', '2016-03-22 18:19:08');
INSERT INTO `oa_notify_senduser` VALUES ('26', '24', '4', '1', '0', '2016-03-22 18:26:49', '2016-03-22 18:26:49', '2016-03-22 18:26:37');
INSERT INTO `oa_notify_senduser` VALUES ('27', '25', '4', '1', '0', '2016-03-22 18:29:06', '2016-03-22 18:29:06', '2016-03-22 18:29:01');
INSERT INTO `oa_notify_senduser` VALUES ('28', '26', '4', '1', '0', '2016-03-23 09:17:06', '2016-03-23 09:17:06', '2016-03-22 18:30:59');
INSERT INTO `oa_notify_senduser` VALUES ('29', '27', '4', '1', '0', '2016-03-23 09:20:35', '2016-03-23 09:20:35', '2016-03-23 09:19:05');
INSERT INTO `oa_notify_senduser` VALUES ('30', '28', '4', '1', '0', '2016-03-23 09:24:29', '2016-03-23 09:24:29', '2016-03-23 09:23:21');
INSERT INTO `oa_notify_senduser` VALUES ('31', '29', '4', '1', '0', '2016-03-23 09:35:40', '2016-03-23 09:35:40', '2016-03-23 09:35:34');
INSERT INTO `oa_notify_senduser` VALUES ('32', '30', '4', '1', '0', '2016-03-23 09:36:19', '2016-03-23 09:36:19', '2016-03-23 09:36:13');
INSERT INTO `oa_notify_senduser` VALUES ('33', '31', '4', '1', '0', '2016-03-23 09:57:16', '2016-03-23 09:57:16', '2016-03-23 09:56:52');
INSERT INTO `oa_notify_senduser` VALUES ('34', '32', '4', '1', '0', '2016-03-23 09:57:20', '2016-03-23 09:57:20', '2016-03-23 09:57:02');
INSERT INTO `oa_notify_senduser` VALUES ('35', '33', '4', '1', '0', '2016-03-23 09:57:24', '2016-03-23 09:57:24', '2016-03-23 09:57:11');
INSERT INTO `oa_notify_senduser` VALUES ('36', '34', '3', '1', '0', '2016-03-30 13:55:01', '2016-03-30 13:55:01', '2016-03-30 13:53:23');

-- ----------------------------
-- Table structure for oa_org
-- ----------------------------
DROP TABLE IF EXISTS `oa_org`;
CREATE TABLE `oa_org` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '组织机构表主键id',
  `parent_id` int(10) DEFAULT '0' COMMENT '父id',
  `depart_name` varchar(50) DEFAULT '' COMMENT '部门信息名称',
  `parent_path` varchar(30) DEFAULT '0' COMMENT '父id范围',
  `order_id` int(10) DEFAULT '0' COMMENT '顺序id',
  `level` tinyint(3) DEFAULT '0' COMMENT '等级',
  `old_exits_id` int(10) DEFAULT '0' COMMENT '部门信息编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5308 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_org
-- ----------------------------
INSERT INTO `oa_org` VALUES ('1', '0', '新房总办', '0,', '108', '0', '1');
INSERT INTO `oa_org` VALUES ('2', '0', '新房业务中心', '0,', '117', '0', '5000');
INSERT INTO `oa_org` VALUES ('4', '5000', '市场部', '0,5000,', '187', '1', '3002');
INSERT INTO `oa_org` VALUES ('5', '5000', '策划部', '0,5000,', '197', '1', '5019');
INSERT INTO `oa_org` VALUES ('13', '0', '网站运维中心', '0,', '217', '0', '5002');
INSERT INTO `oa_org` VALUES ('14', '5002', '综合管理', '0,5002,', '227', '1', '5023');
INSERT INTO `oa_org` VALUES ('18', '5002', '移动运营部', '0,5002,', '277', '1', '5043');
INSERT INTO `oa_org` VALUES ('22', '5002', '新闻管理部', '0,5002,', '247', '1', '5047');
INSERT INTO `oa_org` VALUES ('35', '0', '运营中心', '0,', '338', '0', '5005');
INSERT INTO `oa_org` VALUES ('36', '5005', '信息系统部', '0,5005,', '418', '1', '5032');
INSERT INTO `oa_org` VALUES ('37', '5005', '销售绩效部', '0,5005,', '358', '1', '5033');
INSERT INTO `oa_org` VALUES ('42', '5149', '人力资源部', '0,5149,', '76', '1', '3012');
INSERT INTO `oa_org` VALUES ('43', '5149', '财务部', '0,5149,', '66', '1', '3011');
INSERT INTO `oa_org` VALUES ('44', '5000', '支付结算部', '0,5000,', '207', '1', '5007');
INSERT INTO `oa_org` VALUES ('45', '5149', '行政部', '0,5149,', '86', '1', '3013');
INSERT INTO `oa_org` VALUES ('47', '5135', '北京公司', '0,5135,', '489', '1', '3016');
INSERT INTO `oa_org` VALUES ('48', '5135', '唐山公司', '0,5135,', '519', '1', '5009');
INSERT INTO `oa_org` VALUES ('49', '0', '上海公司', '0,', '1049', '0', '3018');
INSERT INTO `oa_org` VALUES ('50', '5155', '昆山公司', '0,5155,', '829', '1', '3047');
INSERT INTO `oa_org` VALUES ('51', '0', '东北区', '0,', '599', '0', '3019');
INSERT INTO `oa_org` VALUES ('52', '3019', '沈阳公司', '0,3019,', '619', '1', '3020');
INSERT INTO `oa_org` VALUES ('53', '0', '大连公司', '0,', '1119', '0', '3042');
INSERT INTO `oa_org` VALUES ('54', '3019', '哈尔滨公司', '0,3019,', '629', '1', '3022');
INSERT INTO `oa_org` VALUES ('55', '3019', '长春公司', '0,3019,', '639', '1', '3021');
INSERT INTO `oa_org` VALUES ('56', '0', '华北区', '0,', '559', '0', '5011');
INSERT INTO `oa_org` VALUES ('57', '5011', '天津公司', '0,5011,', '569', '1', '3017');
INSERT INTO `oa_org` VALUES ('58', '5135', '石家庄公司', '0,5135,', '499', '1', '3052');
INSERT INTO `oa_org` VALUES ('59', '5135', '太原公司', '0,5135,', '539', '1', '3051');
INSERT INTO `oa_org` VALUES ('60', '5011', '青岛公司', '0,5011,', '589', '1', '3040');
INSERT INTO `oa_org` VALUES ('61', '5011', '济南公司', '0,5011,', '579', '1', '3039');
INSERT INTO `oa_org` VALUES ('62', '5179', '烟台公司', '0,5179,', '1029', '1', '3041');
INSERT INTO `oa_org` VALUES ('63', '5179', '威海公司', '0,5179,', '1039', '1', '3053');
INSERT INTO `oa_org` VALUES ('65', '0', '武汉公司', '0,', '1069', '0', '3035');
INSERT INTO `oa_org` VALUES ('66', '0', '长沙公司', '0,', '1109', '0', '3044');
INSERT INTO `oa_org` VALUES ('67', '5016', '南昌公司', '0,5016,', '929', '1', '3080');
INSERT INTO `oa_org` VALUES ('69', '0', '南京公司', '0,', '1099', '0', '3033');
INSERT INTO `oa_org` VALUES ('70', '0', '无锡公司', '0,', '1129', '0', '3045');
INSERT INTO `oa_org` VALUES ('71', '5179', '常州公司', '0,5179,', '999', '1', '3046');
INSERT INTO `oa_org` VALUES ('72', '5155', '南通公司', '0,5155,', '839', '1', '3101');
INSERT INTO `oa_org` VALUES ('73', '0', '合肥公司', '0,', '1139', '0', '3048');
INSERT INTO `oa_org` VALUES ('74', '5179', '芜湖公司', '0,5179,', '1019', '1', '3049');
INSERT INTO `oa_org` VALUES ('75', '0', '浙闽区', '0,', '669', '0', '3023');
INSERT INTO `oa_org` VALUES ('76', '3023', '杭州公司', '0,3023,', '679', '1', '3024');
INSERT INTO `oa_org` VALUES ('77', '3023', '宁波公司', '0,3023,', '689', '1', '3100');
INSERT INTO `oa_org` VALUES ('79', '0', '华南区', '0,', '719', '0', '3026');
INSERT INTO `oa_org` VALUES ('80', '3026', '华南区管理部', '0,3026,', '729', '1', '5050');
INSERT INTO `oa_org` VALUES ('81', '3026', '广州公司', '0,3026,', '739', '1', '3027');
INSERT INTO `oa_org` VALUES ('82', '3026', '深圳公司', '0,3026,', '749', '1', '3028');
INSERT INTO `oa_org` VALUES ('83', '3026', '惠州公司', '0,3026,', '769', '1', '5014');
INSERT INTO `oa_org` VALUES ('84', '3026', '东莞公司', '0,3026,', '779', '1', '3029');
INSERT INTO `oa_org` VALUES ('85', '3026', '佛山公司', '0,3026,', '759', '1', '3030');
INSERT INTO `oa_org` VALUES ('86', '3026', '珠海中山公司', '0,3026,', '789', '1', '3032');
INSERT INTO `oa_org` VALUES ('88', '0', '联合区', '0,', '849', '0', '5016');
INSERT INTO `oa_org` VALUES ('89', '5135', '西安公司', '0,5135,', '509', '1', '3043');
INSERT INTO `oa_org` VALUES ('90', '5016', '河南公司', '0,5016,', '869', '1', '3050');
INSERT INTO `oa_org` VALUES ('91', '5016', '广西公司', '0,5016,', '899', '1', '3102');
INSERT INTO `oa_org` VALUES ('92', '5016', '云南公司', '0,5016,', '879', '1', '5017');
INSERT INTO `oa_org` VALUES ('93', '5016', '呼和浩特公司', '0,5016,', '949', '1', '3103');
INSERT INTO `oa_org` VALUES ('95', '0', '成都公司', '0,', '1089', '0', '3037');
INSERT INTO `oa_org` VALUES ('96', '0', '重庆公司', '0,', '1059', '0', '3036');
INSERT INTO `oa_org` VALUES ('97', '0', '海南公司', '0,', '1079', '0', '3038');
INSERT INTO `oa_org` VALUES ('98', '5108', '总办', '0,5108,', '1384', '1', '37');
INSERT INTO `oa_org` VALUES ('99', '5108', '财务部', '0,5108,', '1390', '1', '600');
INSERT INTO `oa_org` VALUES ('100', '5108', '行政部', '0,5108,', '1391', '1', '601');
INSERT INTO `oa_org` VALUES ('129', '0', '二手房集团', '0,', '1143', '0', '5102');
INSERT INTO `oa_org` VALUES ('131', '5102', '媒体策划部', '0,5102,', '1173', '1', '5104');
INSERT INTO `oa_org` VALUES ('133', '5102', '总办', '0,5102,', '1145', '1', '5106');
INSERT INTO `oa_org` VALUES ('134', '5016', '贵阳公司', '0,5016,', '889', '1', '5107');
INSERT INTO `oa_org` VALUES ('135', '0', '家居集团', '0,', '1383', '0', '5108');
INSERT INTO `oa_org` VALUES ('136', '5005', '运营管理部', '0,5005,', '348', '1', '5109');
INSERT INTO `oa_org` VALUES ('137', '5179', '徐州公司', '0,5179,', '1009', '1', '5110');
INSERT INTO `oa_org` VALUES ('138', '5179', '东部区管理部', '0,5179,', '989', '1', '5111');
INSERT INTO `oa_org` VALUES ('139', '5016', '联合区管理部', '0,5016,', '859', '1', '5112');
INSERT INTO `oa_org` VALUES ('140', '5016', '银川公司', '0,5016,', '909', '1', '5113');
INSERT INTO `oa_org` VALUES ('141', '3023', '厦门公司', '0,3023,', '709', '1', '5114');
INSERT INTO `oa_org` VALUES ('142', '3023', '福州公司', '0,3023,', '699', '1', '5115');
INSERT INTO `oa_org` VALUES ('148', '5102', '人事行政部', '0,5102,', '1203', '1', '5118');
INSERT INTO `oa_org` VALUES ('150', '5102', '财务部', '0,5102,', '1193', '1', '5120');
INSERT INTO `oa_org` VALUES ('152', '5102', '客服部', '0,5102,', '1183', '1', '5122');
INSERT INTO `oa_org` VALUES ('156', '5000', '电商及大客户本部', '0,5000,', '147', '1', '5126');
INSERT INTO `oa_org` VALUES ('157', '5000', '电商部', '0,5000,', '157', '1', '5127');
INSERT INTO `oa_org` VALUES ('158', '5000', '大客户部', '0,5000,', '167', '1', '5128');
INSERT INTO `oa_org` VALUES ('163', '5002', '楼盘社区部', '0,5002,', '267', '1', '5133');
INSERT INTO `oa_org` VALUES ('164', '5002', '会员数据部', '0,5002,', '237', '1', '5134');
INSERT INTO `oa_org` VALUES ('165', '0', '北方区', '0,', '479', '0', '5135');
INSERT INTO `oa_org` VALUES ('167', '5135', '秦皇岛公司', '0,5135,', '529', '1', '5137');
INSERT INTO `oa_org` VALUES ('169', '3019', '东北区管理部', '0,3019,', '609', '1', '5138');
INSERT INTO `oa_org` VALUES ('170', '3019', '鞍山公司', '0,3019,', '649', '1', '5139');
INSERT INTO `oa_org` VALUES ('171', '3019', '乐居周刊', '0,3019,', '659', '1', '5140');
INSERT INTO `oa_org` VALUES ('172', '5016', '渠道电商', '0,5016,', '969', '1', '5141');
INSERT INTO `oa_org` VALUES ('180', '0', '集团机构', '0,', '26', '0', '5149');
INSERT INTO `oa_org` VALUES ('181', '5149', '总裁办', '0,5149,', '36', '1', '5150');
INSERT INTO `oa_org` VALUES ('182', '5149', '内控部', '0,5149,', '46', '1', '5151');
INSERT INTO `oa_org` VALUES ('183', '5149', '市场部', '0,5149,', '56', '1', '5152');
INSERT INTO `oa_org` VALUES ('184', '5149', '投资者关系部', '0,5149,', '96', '1', '5153');
INSERT INTO `oa_org` VALUES ('186', '0', '苏南区', '0,', '809', '0', '5155');
INSERT INTO `oa_org` VALUES ('187', '5155', '苏州公司', '0,5155,', '819', '1', '5156');
INSERT INTO `oa_org` VALUES ('189', '5102', '网盟', '0,5102,', '1223', '1', '5158');
INSERT INTO `oa_org` VALUES ('192', '0', '实惠', '0,', '1803', '0', '5159');
INSERT INTO `oa_org` VALUES ('193', '5177', 'PC产品技术部', '0,5177,', '429', '1', '5160');
INSERT INTO `oa_org` VALUES ('196', '5177', '平台与运维技术部', '0,5177', '458', '1', '5163');
INSERT INTO `oa_org` VALUES ('198', '5102', '产品技术中心', '0,5102,', '1164', '1', '5165');
INSERT INTO `oa_org` VALUES ('201', '5000', '创新业务部', '0,5000,', '127', '1', '5167');
INSERT INTO `oa_org` VALUES ('202', '5016', '乌鲁木齐公司', '0,5016,', '919', '1', '5168');
INSERT INTO `oa_org` VALUES ('204', '5016', '兰州公司', '0,5016,', '939', '1', '5170');
INSERT INTO `oa_org` VALUES ('205', '5016', '包头公司', '0,5016,', '959', '1', '5171');
INSERT INTO `oa_org` VALUES ('206', '5000', '资产管理部', '0,5000,', '137', '1', '5172');
INSERT INTO `oa_org` VALUES ('5149', '5002', '要闻部', '0,5002,', '257', '1', '5042');
INSERT INTO `oa_org` VALUES ('5150', '5002', '网友服务部', '0,5002,', '287', '1', '5174');
INSERT INTO `oa_org` VALUES ('5151', '5005', '运营服务部', '0,5005,', '368', '1', '5175');
INSERT INTO `oa_org` VALUES ('5152', '5005', '广告运营部', '0,5005,', '378', '1', '5176');
INSERT INTO `oa_org` VALUES ('5153', '0', '产品技术中心', '0,', '428', '0', '5177');
INSERT INTO `oa_org` VALUES ('5154', '5135', '保定公司', '0,5135,', '549', '1', '5178');
INSERT INTO `oa_org` VALUES ('5155', '0', '东部区', '0,', '979', '0', '5179');
INSERT INTO `oa_org` VALUES ('5156', '5102', '全国销售管控中心', '0,5102,', '1153', '1', '5180');
INSERT INTO `oa_org` VALUES ('5157', '5102', '上海公司', '0,5102,', '1233', '1', '5181');
INSERT INTO `oa_org` VALUES ('5158', '5102', '广州公司', '0,5102,', '1243', '1', '5182');
INSERT INTO `oa_org` VALUES ('5159', '5102', '深圳公司', '0,5102,', '1253', '1', '5183');
INSERT INTO `oa_org` VALUES ('5160', '5102', '杭州公司', '0,5102,', '1263', '1', '5184');
INSERT INTO `oa_org` VALUES ('5161', '5102', '成都公司', '0,5102,', '1273', '1', '5185');
INSERT INTO `oa_org` VALUES ('5162', '5102', '重庆公司', '0,5102,', '1283', '1', '5186');
INSERT INTO `oa_org` VALUES ('5163', '5102', '青岛公司', '0,5102,', '1293', '1', '5187');
INSERT INTO `oa_org` VALUES ('5164', '5102', '西安公司', '0,5102,', '1303', '1', '5188');
INSERT INTO `oa_org` VALUES ('5165', '5102', '石家庄公司', '0,5102,', '1313', '1', '5189');
INSERT INTO `oa_org` VALUES ('5166', '5102', '河南公司', '0,5102,', '1323', '1', '5190');
INSERT INTO `oa_org` VALUES ('5167', '5102', '南京公司', '0,5102,', '1333', '1', '5191');
INSERT INTO `oa_org` VALUES ('5168', '5102', '苏州公司', '0,5102,', '1343', '1', '5192');
INSERT INTO `oa_org` VALUES ('5169', '5102', '武汉公司', '0,5102,', '1353', '1', '5193');
INSERT INTO `oa_org` VALUES ('5170', '5102', '长沙公司', '0,5102,', '1363', '1', '5194');
INSERT INTO `oa_org` VALUES ('5171', '5102', '济南公司', '0,5102,', '1373', '1', '5195');
INSERT INTO `oa_org` VALUES ('5172', '5108', '产品技术部', '0,5108,', '1385', '1', '5196');
INSERT INTO `oa_org` VALUES ('5173', '5108', '平台运营部', '0,5108,', '1386', '1', '5197');
INSERT INTO `oa_org` VALUES ('5174', '5108', '支付结算部', '0,5108,', '1387', '1', '5198');
INSERT INTO `oa_org` VALUES ('5175', '5108', '供应链', '0,5108,', '1388', '1', '5199');
INSERT INTO `oa_org` VALUES ('5176', '5108', '市场部', '0,5108,', '1389', '1', '5200');
INSERT INTO `oa_org` VALUES ('5178', '5108', '家居媒体-总编室', '0,5108,', '1399', '1', '5202');
INSERT INTO `oa_org` VALUES ('5179', '5108', '家居媒体-营销部', '0,5108,', '1400', '1', '5203');
INSERT INTO `oa_org` VALUES ('5180', '5108', '家居媒体-华北区', '0,5108,', '1401', '1', '5204');
INSERT INTO `oa_org` VALUES ('5181', '5108', '家居媒体-华东区', '0,5108,', '1402', '1', '5205');
INSERT INTO `oa_org` VALUES ('5182', '5108', '家居媒体-华南区', '0,5108,', '1403', '1', '5206');
INSERT INTO `oa_org` VALUES ('5183', '5108', '家居媒体-成都', '0,5108,', '1404', '1', '5207');
INSERT INTO `oa_org` VALUES ('5184', '5108', '家居媒体-深圳', '0,5108,', '1405', '1', '5208');
INSERT INTO `oa_org` VALUES ('5185', '5108', '家居媒体-天津', '0,5108,', '1406', '1', '5209');
INSERT INTO `oa_org` VALUES ('5186', '5108', '家居媒体-武汉', '0,5108,', '1407', '1', '5210');
INSERT INTO `oa_org` VALUES ('5187', '5108', '装修电商-总部', '0,5108,', '1408', '1', '5211');
INSERT INTO `oa_org` VALUES ('5188', '5108', '装修电商-北京', '0,5108,', '1409', '1', '5212');
INSERT INTO `oa_org` VALUES ('5189', '5108', '装修电商-上海', '0,5108,', '1410', '1', '5213');
INSERT INTO `oa_org` VALUES ('5190', '5108', '装修电商-广州', '0,5108,', '1411', '1', '5214');
INSERT INTO `oa_org` VALUES ('5191', '5108', '装修电商-深圳', '0,5108,', '1412', '1', '5215');
INSERT INTO `oa_org` VALUES ('5192', '5108', '装修电商-成都', '0,5108,', '1413', '1', '5216');
INSERT INTO `oa_org` VALUES ('5193', '5108', '装修电商-大连', '0,5108,', '1414', '1', '5217');
INSERT INTO `oa_org` VALUES ('5194', '5108', '装修电商-杭州', '0,5108,', '1415', '1', '5218');
INSERT INTO `oa_org` VALUES ('5195', '5108', '装修电商-南京', '0,5108,', '1416', '1', '5219');
INSERT INTO `oa_org` VALUES ('5196', '5108', '装修电商-青岛', '0,5108,', '1417', '1', '5220');
INSERT INTO `oa_org` VALUES ('5197', '5108', '装修电商-沈阳', '0,5108,', '1418', '1', '5221');
INSERT INTO `oa_org` VALUES ('5198', '5108', '装修电商-石家庄', '0,5108,', '1419', '1', '5222');
INSERT INTO `oa_org` VALUES ('5199', '5108', '装修电商-苏州', '0,5108,', '1420', '1', '5223');
INSERT INTO `oa_org` VALUES ('5200', '5108', '装修电商-太原', '0,5108,', '1421', '1', '5224');
INSERT INTO `oa_org` VALUES ('5201', '5108', '装修电商-天津', '0,5108,', '1422', '1', '5225');
INSERT INTO `oa_org` VALUES ('5202', '5108', '装修电商-无锡', '0,5108,', '1423', '1', '5226');
INSERT INTO `oa_org` VALUES ('5203', '5108', '装修电商-武汉', '0,5108,', '1424', '1', '5227');
INSERT INTO `oa_org` VALUES ('5204', '5108', '装修电商-西安', '0,5108,', '1425', '1', '5228');
INSERT INTO `oa_org` VALUES ('5205', '5108', '装修电商-长沙', '0,5108,', '1426', '1', '5229');
INSERT INTO `oa_org` VALUES ('5206', '5108', '装修电商-郑州', '0,5108,', '1427', '1', '5230');
INSERT INTO `oa_org` VALUES ('5207', '5108', '装修电商-重庆', '0,5108,', '1428', '1', '5231');
INSERT INTO `oa_org` VALUES ('5208', '5108', 'B2C平台', '0,5108,', '1429', '1', '5232');
INSERT INTO `oa_org` VALUES ('5209', '5177', '移动产品技术部', '0,5177,', '430', '1', '5161');
INSERT INTO `oa_org` VALUES ('5210', '5149', '法务部', '0,5149,', '97', '1', '5173');
INSERT INTO `oa_org` VALUES ('5258', '5108', '装修电商-哈尔滨', '0,5108,', '1430', '1', '5233');
INSERT INTO `oa_org` VALUES ('5259', '5108', '装修电商-长春', '0,5108,', '1431', '1', '5234');
INSERT INTO `oa_org` VALUES ('5260', '5108', '装修电商-济南', '0,5108,', '1432', '1', '5235');
INSERT INTO `oa_org` VALUES ('5261', '5108', '装修电商-呼和浩特', '0,5108,', '1433', '1', '5236');
INSERT INTO `oa_org` VALUES ('5262', '5108', '装修电商-包头', '0,5108,', '1434', '1', '5237');
INSERT INTO `oa_org` VALUES ('5263', '5108', '装修电商-南昌', '0,5108,', '1435', '1', '5238');
INSERT INTO `oa_org` VALUES ('5264', '5108', '装修电商-宁波', '0,5108,', '1436', '1', '5239');
INSERT INTO `oa_org` VALUES ('5265', '5108', '装修电商-合肥', '0,5108,', '1437', '1', '5240');
INSERT INTO `oa_org` VALUES ('5266', '5108', '装修电商-南通', '0,5108,', '1438', '1', '5241');
INSERT INTO `oa_org` VALUES ('5267', '5108', '装修电商-福州', '0,5108,', '1439', '1', '5242');
INSERT INTO `oa_org` VALUES ('5268', '5108', '装修电商-厦门', '0,5108,', '1440', '1', '5243');
INSERT INTO `oa_org` VALUES ('5269', '5108', '装修电商-南宁', '0,5108,', '1441', '1', '5244');
INSERT INTO `oa_org` VALUES ('5270', '5108', '装修电商-昆明', '0,5108,', '1442', '1', '5245');
INSERT INTO `oa_org` VALUES ('5271', '5108', '装修电商-乌鲁木齐', '0,5108,', '1443', '1', '5246');
INSERT INTO `oa_org` VALUES ('5272', '5108', '装修电商-贵阳', '0,5108,', '1444', '1', '5247');
INSERT INTO `oa_org` VALUES ('5273', '5108', '装修电商-银川', '0,5108,', '1445', '1', '5248');
INSERT INTO `oa_org` VALUES ('5274', '5108', '装修电商-兰州', '0,5108,', '1446', '1', '5249');
INSERT INTO `oa_org` VALUES ('5275', '5108', '装修电商-唐山', '0,5108,', '1447', '1', '5250');
INSERT INTO `oa_org` VALUES ('5276', '5108', '装修电商-保定', '0,5108,', '1448', '1', '5251');
INSERT INTO `oa_org` VALUES ('5277', '5108', '装修电商-烟台', '0,5108,', '1449', '1', '5252');
INSERT INTO `oa_org` VALUES ('5278', '5108', '装修电商-威海', '0,5108,', '1450', '1', '5253');
INSERT INTO `oa_org` VALUES ('5279', '5108', '装修电商-淄博', '0,5108,', '1451', '1', '5254');
INSERT INTO `oa_org` VALUES ('5280', '5108', '装修电商-邯郸', '0,5108,', '1452', '1', '5255');
INSERT INTO `oa_org` VALUES ('5281', '5108', '装修电商-东营', '0,5108,', '1453', '1', '5256');
INSERT INTO `oa_org` VALUES ('5282', '5108', '装修电商-秦皇岛', '0,5108,', '1454', '1', '5257');
INSERT INTO `oa_org` VALUES ('5283', '5108', '装修电商-衡水', '0,5108,', '1455', '1', '5258');
INSERT INTO `oa_org` VALUES ('5284', '5108', '装修电商-晋城', '0,5108,', '1456', '1', '5259');
INSERT INTO `oa_org` VALUES ('5285', '5108', '装修电商-济宁', '0,5108,', '1457', '1', '5260');
INSERT INTO `oa_org` VALUES ('5286', '5108', '装修电商-昆山', '0,5108,', '1458', '1', '5261');
INSERT INTO `oa_org` VALUES ('5287', '5108', '装修电商-芜湖', '0,5108,', '1459', '1', '5262');
INSERT INTO `oa_org` VALUES ('5288', '5108', '装修电商-徐州', '0,5108,', '1460', '1', '5263');
INSERT INTO `oa_org` VALUES ('5289', '5108', '装修电商-泰州', '0,5108,', '1461', '1', '5264');
INSERT INTO `oa_org` VALUES ('5290', '5108', '装修电商-阜阳', '0,5108,', '1462', '1', '5265');
INSERT INTO `oa_org` VALUES ('5291', '5108', '装修电商-江阴', '0,5108,', '1463', '1', '5266');
INSERT INTO `oa_org` VALUES ('5292', '5108', '装修电商-佛山', '0,5108,', '1464', '1', '5267');
INSERT INTO `oa_org` VALUES ('5293', '5108', '装修电商-中山', '0,5108,', '1465', '1', '5268');
INSERT INTO `oa_org` VALUES ('5294', '5108', '装修电商-珠海', '0,5108,', '1466', '1', '5269');
INSERT INTO `oa_org` VALUES ('5295', '5108', '装修电商-惠州', '0,5108,', '1467', '1', '5270');
INSERT INTO `oa_org` VALUES ('5296', '5108', '装修电商-东莞', '0,5108,', '1468', '1', '5271');
INSERT INTO `oa_org` VALUES ('5297', '5108', '装修电商-海口', '0,5108,', '1469', '1', '5272');
INSERT INTO `oa_org` VALUES ('5298', '5108', '装修电商-桂林', '0,5108,', '1470', '1', '5273');
INSERT INTO `oa_org` VALUES ('5299', '5108', '装修电商-三亚', '0,5108,', '1471', '1', '5274');
INSERT INTO `oa_org` VALUES ('5300', '5108', '装修电商-琼海', '0,5108,', '1472', '1', '5275');
INSERT INTO `oa_org` VALUES ('5301', '5108', '装修电商-昌吉', '0,5108,', '1473', '1', '5276');
INSERT INTO `oa_org` VALUES ('5302', '5108', '装修电商-洛阳', '0,5108,', '1474', '1', '5277');
INSERT INTO `oa_org` VALUES ('5303', '5108', '装修电商-焦作', '0,5108,', '1475', '1', '5278');
INSERT INTO `oa_org` VALUES ('5304', '0', '金融', '0,', '1804', '0', '5279');
INSERT INTO `oa_org` VALUES ('5305', '5002', '移动运维部', '0,5002,', '288', '1', '5280');
INSERT INTO `oa_org` VALUES ('5306', '0', '后台测试1', '0', '0', '0', '6666');
INSERT INTO `oa_org` VALUES ('5307', '0', '后台测试2', '0', '0', '0', '8888');

-- ----------------------------
-- Table structure for oa_orgstr
-- ----------------------------
DROP TABLE IF EXISTS `oa_orgstr`;
CREATE TABLE `oa_orgstr` (
  `orgstrid` int(10) NOT NULL AUTO_INCREMENT COMMENT '销售组员表主键id',
  `user_id` varchar(30) DEFAULT NULL COMMENT '销售组员id',
  `user_name` varchar(30) DEFAULT NULL COMMENT '销售组员名称',
  `user_sn` varchar(30) DEFAULT NULL COMMENT '销售组员工号',
  `role` varchar(30) DEFAULT NULL COMMENT '角色',
  `role_id` tinyint(4) DEFAULT NULL COMMENT '角色id',
  `orgstr_id` int(11) DEFAULT NULL COMMENT '组织架构id',
  `orgstr_tree` varchar(255) DEFAULT NULL COMMENT '组织架构树',
  PRIMARY KEY (`orgstrid`)
) ENGINE=InnoDB AUTO_INCREMENT=2100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_orgstr
-- ----------------------------
INSERT INTO `oa_orgstr` VALUES ('1', 'FF4BEAD27CA9', '马晶晶', '30666', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `oa_orgstr` VALUES ('2', '151457E5BB24', '付佳', '30149', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `oa_orgstr` VALUES ('3', '9E51A5391C2A', '寇屾', '30478', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `oa_orgstr` VALUES ('4', '8B538D27A279', '周思', '30510', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `oa_orgstr` VALUES ('5', '0281DBC3F636', '黄薇', '30088', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `oa_orgstr` VALUES ('6', 'B0AB0FA5D712', '贺芳', '31560', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `oa_orgstr` VALUES ('7', 'A4B6AF257919', '徐婷', '33065', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `oa_orgstr` VALUES ('8', '7BB7F73C4942', '武鑫', '34888', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `oa_orgstr` VALUES ('9', 'C43B5FB56756', '王元', '30143', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `oa_orgstr` VALUES ('10', '6D25D1971693', '王沛', '56180', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `oa_orgstr` VALUES ('11', '2F95E61FBDD3', '吴晓珂', '55106', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `oa_orgstr` VALUES ('12', '9E3C4959D683', '安建周', '56237', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `oa_orgstr` VALUES ('13', '3A07FEBB2463', '吕鑫', '31071', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `oa_orgstr` VALUES ('14', '01EEF7B6D1C4', '肖鹏', '30824', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `oa_orgstr` VALUES ('15', '837AE8092B09', '范晶晶', '58405', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `oa_orgstr` VALUES ('16', '837AF287B047', '于洪国', '58409', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `oa_orgstr` VALUES ('17', '837AF72FEF76', '陈成宙', '58412', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `oa_orgstr` VALUES ('18', '4716A0AD4D2B', '李昂', '32327', '销售', '0', '868', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包电商-组员');
INSERT INTO `oa_orgstr` VALUES ('19', '01EF0B37B532', '叶明刚', '37132', '销售', '0', '868', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包电商-组员');
INSERT INTO `oa_orgstr` VALUES ('20', '0ACAA9E5A4E1', '牛志峰', '31588', '销售', '0', '868', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包电商-组员');
INSERT INTO `oa_orgstr` VALUES ('21', '2F95EB21F0B5', '王奎宇', '55101', '销售', '0', '868', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包电商-组员');
INSERT INTO `oa_orgstr` VALUES ('22', 'E79E0F434131', '吴濠见33371', '33371', '销售', '0', '868', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包电商-组员');
INSERT INTO `oa_orgstr` VALUES ('23', 'C10999F378E3', '李妮', '32182', '销售', '0', '868', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包电商-组员');
INSERT INTO `oa_orgstr` VALUES ('24', '9FA003043CF9', '张世棋', '51099', '销售', '0', '868', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包电商-组员');
INSERT INTO `oa_orgstr` VALUES ('25', 'A65B3E9B8FDE', '周晶', '32750', '销售', '0', '868', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包电商-组员');
INSERT INTO `oa_orgstr` VALUES ('26', '76321869602A', '明静', '33498', '销售', '0', '870', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-渠道销售二组（停）-组员');
INSERT INTO `oa_orgstr` VALUES ('27', '397C0478B6CB', '陶然', '34817', '销售', '0', '2266', '互联网板块-房产-营销中心-营销中心-营销中心-营销中心');
INSERT INTO `oa_orgstr` VALUES ('28', '805FB069794A', '逄格强', '33567', '销售', '0', '2266', '互联网板块-房产-营销中心-营销中心-营销中心-营销中心');
INSERT INTO `oa_orgstr` VALUES ('29', 'C6BC48FCAEDD', '俞志强', '30654', '销售', '0', '2266', '互联网板块-房产-营销中心-营销中心-营销中心-营销中心');
INSERT INTO `oa_orgstr` VALUES ('30', '87F98F69591F', '何涛', '30547', '销售', '0', '2267', '互联网板块-房产-大客户部-大客户部-大客户部-大客户部');
INSERT INTO `oa_orgstr` VALUES ('31', 'F6FD78BE402E', '何靖', '33459', '销售', '0', '2267', '互联网板块-房产-大客户部-大客户部-大客户部-大客户部');
INSERT INTO `oa_orgstr` VALUES ('32', 'B286DB41F616', '张涵', '34531', '销售', '0', '2267', '互联网板块-房产-大客户部-大客户部-大客户部-大客户部');
INSERT INTO `oa_orgstr` VALUES ('33', 'B28756E520D2', '李丕业', '33968', '销售', '0', '2267', '互联网板块-房产-大客户部-大客户部-大客户部-大客户部');
INSERT INTO `oa_orgstr` VALUES ('34', '3C528AA6DFB7', '陈阳', '30587', '销售', '0', '2267', '互联网板块-房产-大客户部-大客户部-大客户部-大客户部');
INSERT INTO `oa_orgstr` VALUES ('35', '2ED60F624C47', '陈时光', '30130', '销售', '0', '2267', '互联网板块-房产-大客户部-大客户部-大客户部-大客户部');
INSERT INTO `oa_orgstr` VALUES ('36', 'A0C7FB28AFB4', '庞岩', '31506', '销售', '0', '2304', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-运营组（停）-组员');
INSERT INTO `oa_orgstr` VALUES ('37', '6706F241B961', '潘博', '33682', '销售', '0', '2304', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-运营组（停）-组员');
INSERT INTO `oa_orgstr` VALUES ('38', 'C73AC9CC0C5A', '易居武汉', 'B9910', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `oa_orgstr` VALUES ('39', '463FB99A0CD5', '尤一雅', '32583', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `oa_orgstr` VALUES ('40', 'F8ADCF3A87EE', '李彬彬', '32818', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `oa_orgstr` VALUES ('41', 'B5F6BB6FCD05', '李翠33295', '33295', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `oa_orgstr` VALUES ('42', 'B177C47B6B31', '梁志宏', '31211', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `oa_orgstr` VALUES ('43', '7F8A5FC2C380', '张健', '31703', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `oa_orgstr` VALUES ('44', 'B2C7C35890B5', '刘显财', '30548', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `oa_orgstr` VALUES ('45', '6DCC124798DB', '刘永春', '30285', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `oa_orgstr` VALUES ('46', 'C696C413F6BA', '张鹏', '30318', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `oa_orgstr` VALUES ('47', '9F638174E0D1', '朱帮伟35092', '35092', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `oa_orgstr` VALUES ('48', 'FF9DF330C5C2', '曾荣平', '30224', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `oa_orgstr` VALUES ('49', '9A59558EB7F4', '曾晓艳', '30372', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `oa_orgstr` VALUES ('50', '9C1F4474EF32', '李磊', '30118', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `oa_orgstr` VALUES ('51', '5C4AE1C5F512', '梁星炜', '30183', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `oa_orgstr` VALUES ('52', '6232DA995F9E', '刘小文', '30067', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `oa_orgstr` VALUES ('53', 'C07BD562A3FC', '盛雅凤', '30494', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `oa_orgstr` VALUES ('54', '77CF357353BB', '宋强', '30117', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `oa_orgstr` VALUES ('55', '26FDA75A0986', '凃莹洁', '30175', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `oa_orgstr` VALUES ('56', 'EB5DA3DC0E5C', '涂然', '30327', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `oa_orgstr` VALUES ('57', '925D3B505641', '王洪波', '30569', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `oa_orgstr` VALUES ('58', '34EF6C4580B0', '王欣', 'F0251', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `oa_orgstr` VALUES ('59', '4D2343065E9B', '王一', '30264', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `oa_orgstr` VALUES ('60', '6971DEC2C095', '于化龙', '30375', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `oa_orgstr` VALUES ('61', '738DA052F7A3', '张揆', '30555', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `oa_orgstr` VALUES ('62', '164F5AF0DDA5', '周小军', '30738', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `oa_orgstr` VALUES ('63', 'B0D1FA84A929', '康新丽', '37208', '销售', '0', '2450', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('64', '20E8DCD4C8F6', '田地', '36351', '销售', '0', '2450', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('65', 'B0D2551625F7', '周欣凯', '36732', '销售', '0', '2450', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('66', 'B93093862613', '高晴晴', '53870', '销售', '0', '2450', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('67', '6E6D46D97352', '任克强', '56175', '销售', '0', '2450', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('68', 'B0CD4973DAD1', '杨雯静', '36988', '销售', '0', '2450', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('69', '3408FA908A28', '孙艳彬', '35865', '销售', '0', '2450', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('70', 'F78ABD240B91', '贺兢', '56284', '销售', '0', '2450', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('71', 'B0CF4137C665', '徐莎1', '36987', '销售', '0', '2450', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('72', 'B932BDDFED92', '杨新沂', '51388', '销售', '0', '2450', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('73', 'BCDFA92F5AF1', '石勃', '53304', '销售', '0', '2668', '互联网板块-房产-联合区');
INSERT INTO `oa_orgstr` VALUES ('74', '840998A83FEF', '管理员（资源锁定、第三方预订跟踪）', 'ADMIN', '销售', '0', '2675', '互联网板块-房产-北方区-北方-北京-北京');
INSERT INTO `oa_orgstr` VALUES ('75', '0A6821AED1B2', '庄景鹏', '54538', '销售', '0', '2675', '互联网板块-房产-北方区-北方-北京-北京');
INSERT INTO `oa_orgstr` VALUES ('76', '06180E64DFA2', '曹庆禹', '34611', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('77', '23244961DE36', '徐满', '35782', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('78', '25DA0B43C0B5', '郭建华', '37089', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('79', '6AC58BA84E11', '陈正龙', '34262', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('80', '512141FCD719', '邱晨', '30915', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('81', '187DE0317AC9', '蓝雪莉', '30046', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('82', '5A15D9692031', '北京嘉华', 'B9701', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('83', 'A03ECE4123A2', '汪洋', '30576', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('84', '4BCF1D47E246', '陶涛', '31028', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('85', '791D7E0BBF78', '王凯', '30060', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('86', 'D05B6B3EB0B2', '温浩安', '37406', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('87', '30783BB22039', '王甜', '32444', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('88', 'D05CC0C32C15', '胡春晓', '33962', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('89', '070D21E98D25', '李志强', '33175', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('90', '18FFB9660A35', '刘丹52602', '52602', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('91', '9EC1FBD1CB52', '宋歌', '32461', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('92', 'B6317DA8ED74', '蒋宪君', '36696', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('93', '37DE755730E5', '吴科香', '30200', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('94', 'A3E9FB4D3F75', '刘娜', '30068', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('95', '13EAD86D3B74', '段立伟', '30746', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('96', '307A45DC05E3', '李杰', '30021', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('97', '1F6DB6C42E1B', '王小月', '30490', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('98', '4A070C1DAE81', '牛志明', '30040', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('99', '1C131ABDFE51', '李哲', '30003', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('100', '6AD38638B2E3', '张钰', '30013', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('101', '88CC5A563467', '李菲菲', '30172', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('102', '44491F756426', '李敏熙', '30015', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('103', 'C33D742B9770', '陈孟龙', '51083', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('104', 'C157050E4C96', '罗士凯36763', '36763', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('105', '4057891E52CF', '张振河', '32459', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('106', '268B8BAD6229', '滕腾', '38996', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('107', 'D05D7AC4E1C5', '张成龙', '52664', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('108', '36200223C49A', '娜敏', '35679', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('109', 'A16D0EB46FF5', '高志敏', '32468', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('110', 'D3BCD8500A2C', '李坤W1003', '32443', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('111', '76B5B5ACF458', '刘雪松', '32460', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('112', '25D6ECE95359', '邓虹', '37200', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('113', '9C4CA3197073', '胡沛宜', '38240', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('114', '636CCC796A13', '孙笑宇', '38120', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('115', '46F294A29A67', '曹雪丽', '36655', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('116', '636BB29B22F7', '宋德坤', '38119', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('117', 'A2D611041373', '谢亚锋', '38145', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('118', '25D67554C374', '唐玉婷', '37187', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('119', '605F37EB14D4', '伍丹婷', '50428', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('120', '8D8858BFC0D4', '刘珺芝', '50335', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('121', 'F94640133291', '黄榆晴', '54635', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('122', 'C088A227A900', '饶萃', '50472', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('123', '9E016A1D6541', '程伟强', '56490', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('124', '9992F275C265', '张涛', '30671', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('125', '0104B75EDD00', '马勋', '56570', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('126', 'F0C20CC99990', '赵秀娟', '30532', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('127', '1423A18EDB71', '张俊财', '50314', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('128', 'B65999749092', '董俊', '50480', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('129', '0CC4A05C45F9', '陈国雄', '34936', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('130', '2CB4884311EA', '赖浩城', '30759', '销售', '0', '2827', '互联网板块-房产-华南区-华南区-广州-广州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('131', '061A54EC7FE2', '吴佳妮', '37131', '销售', '0', '2827', '互联网板块-房产-华南区-华南区-广州-广州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('132', 'FFB4A1E80850', '陈桂林', '32663', '销售', '0', '2827', '互联网板块-房产-华南区-华南区-广州-广州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('133', '95BEC72B3A90', '陈寒', '32137', '销售', '0', '2827', '互联网板块-房产-华南区-华南区-广州-广州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('134', '9AD7747712A6', '杨彬成', '34685', '销售', '0', '2827', '互联网板块-房产-华南区-华南区-广州-广州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('135', '142456D507D9', '郎秋悦', '50313', '销售', '0', '2827', '互联网板块-房产-华南区-华南区-广州-广州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('136', '1D5BDEDD7E63', '柳蜀筠', '50334', '销售', '0', '2827', '互联网板块-房产-华南区-华南区-广州-广州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('137', '2DFE2072E988', '詹碧云', '55586', '销售', '0', '2827', '互联网板块-房产-华南区-华南区-广州-广州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('138', '4B0279D581B9', '梁泳丝', '55629', '销售', '0', '2827', '互联网板块-房产-华南区-华南区-广州-广州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('139', '631819BE5D01', '张松', '54376', '销售', '0', '2827', '互联网板块-房产-华南区-华南区-广州-广州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('140', 'BA72DD9A1D19', '张业家', '52751', '销售', '0', '2827', '互联网板块-房产-华南区-华南区-广州-广州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('141', 'BF305E13C913', '罗文静', '32995', '销售', '0', '2827', '互联网板块-房产-华南区-华南区-广州-广州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('142', 'FF6CA00FA819', '李思玥', '38178', '销售', '0', '2827', '互联网板块-房产-华南区-华南区-广州-广州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('143', '0D6C74EE9AC4', '黎志新', '38292', '销售', '0', '2827', '互联网板块-房产-华南区-华南区-广州-广州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('144', 'FF6D09B8F7B8', '朱媛媛', '38184', '销售', '0', '2829', '互联网板块-房产-华南区-华南区-广州-广州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('145', '9B72C783F7BA', '周素红', '34686', '销售', '0', '2829', '互联网板块-房产-华南区-华南区-广州-广州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('146', '7FE79DF4036F', '李超33773', '33773', '销售', '0', '2829', '互联网板块-房产-华南区-华南区-广州-广州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('147', '970FEDD8C3F2', '吴雪娟36863', '36863', '销售', '0', '2829', '互联网板块-房产-华南区-华南区-广州-广州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('148', '7E1985E07052', '李坤', '30271', '销售', '0', '2829', '互联网板块-房产-华南区-华南区-广州-广州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('149', '81E2CA798316', '樊强', '33348', '销售', '0', '2829', '互联网板块-房产-华南区-华南区-广州-广州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('150', 'FB40B699FE97', '林煜程', '37205', '销售', '0', '2829', '互联网板块-房产-华南区-华南区-广州-广州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('151', '51D54A9E7197', '唐亚芳', '50473', '销售', '0', '2829', '互联网板块-房产-华南区-华南区-广州-广州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('152', '5BEB9D37C4D2', '黄俊', '55637', '销售', '0', '2829', '互联网板块-房产-华南区-华南区-广州-广州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('153', '23437A68C700', '黄嘉莹', '31467', '销售', '0', '2829', '互联网板块-房产-华南区-华南区-广州-广州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('154', '099BE7ACD126', '陈佳锐', '38193', '销售', '0', '2829', '互联网板块-房产-华南区-华南区-广州-广州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('155', '25D7AFBE57E0', '张剑', '37188', '销售', '0', '2829', '互联网板块-房产-华南区-华南区-广州-广州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('156', '9C4CCBC85618', '梁学尧', '38239', '销售', '0', '2829', '互联网板块-房产-华南区-华南区-广州-广州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('157', 'F0D66BE72A52', '陈佳56569', '56569', '销售', '0', '2829', '互联网板块-房产-华南区-华南区-广州-广州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('158', '3D6FED6B60F8', '胡芳', '37390', '销售', '0', '2831', '互联网板块-房产-华南区-华南区-广州-广州-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('159', 'A2D6A201DEC0', '李健', '38143', '销售', '0', '2831', '互联网板块-房产-华南区-华南区-广州-广州-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('160', '1CCE0716C81C', '董育红', '31667', '销售', '0', '2831', '互联网板块-房产-华南区-华南区-广州-广州-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('161', 'A27B21013407', '岳黎', '30531', '销售', '0', '2831', '互联网板块-房产-华南区-华南区-广州-广州-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('162', '48BE9A0E3E70', '宫新宇', '33076', '销售', '0', '2831', '互联网板块-房产-华南区-华南区-广州-广州-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('163', '72B4A7DCAA2A', '程夷', '30560', '销售', '0', '2831', '互联网板块-房产-华南区-华南区-广州-广州-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('164', '1A591E00DD57', '邱国燕', '52835', '销售', '0', '2831', '互联网板块-房产-华南区-华南区-广州-广州-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('165', '8137CAE9DD65', '周游', '56464', '销售', '0', '2831', '互联网板块-房产-华南区-华南区-广州-广州-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('166', '079ECB7CBFD7', '林永洪', '55551', '销售', '0', '2831', '互联网板块-房产-华南区-华南区-广州-广州-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('167', '439B286F13A4', '韩笑', '30647', '销售', '0', '2831', '互联网板块-房产-华南区-华南区-广州-广州-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('168', 'F76BD90F0053', '庞丹', '32661', '销售', '0', '2831', '互联网板块-房产-华南区-华南区-广州-广州-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('169', '64880CB7BA21', '陈文剑', '38227', '销售', '0', '2831', '互联网板块-房产-华南区-华南区-广州-广州-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('170', '2F0CE8496759', '汪潇', '34837', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('171', '62C804608BBD', '陈毅峰', '30455', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('172', '36E00459B607', '邓柏欣', '30428', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('173', 'BD71E1F158E1', '何凌燕', '30107', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('174', '0D1D14ACB5F2', '陈夏璐', '33029', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('175', '34ECA945D226', '杨大宇', '54334', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('176', '079EC7195083', '唐婧', '54642', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('177', '29A33B0DAC99', '林燃', '56607', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('178', '65A54F6A8844', '刘丽50429', '50429', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('179', '82FAB8E3CF90', '朱勇', '50453', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('180', '19298EA3A825', '吴桐', '54308', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('181', 'B6BB5A4F37A6', '杨东亮', '35355', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('182', 'EB2E8CD5AA8A', '熊辉', '30090', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('183', 'DCEC6FCEEDF8', '夏敏', '38287', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('184', 'C120978E6B15', '欧阳星', '30027', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('185', '25D75F0122B3', '甘冠期', '37186', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('186', '4AB18A47EC68', '郭辉', '37130', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('187', '91DC4E073AC2', '吴奇', '38137', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('188', '5678B15F7FC1', '张暘', '36653', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('189', '4AB5197D97E4', '袁菱曼', '38106', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('190', '735279F0BD37', '岳洁钰', '33666', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('191', '73CCC9547AAC', '杨弋', '34664', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('192', '4CA6F3634762', '李建', '32117', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('193', 'F5ABCF4C72B0', '陈文鑫', '30535', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('194', '29C6F32E9B41', '李美琤', '31799', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('195', '6F5D57A27266', '唐青', '30768', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('196', '4CFE32E54149', '雷英', '50393', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('197', '3CD627B551D8', '黄文杰54344', '54344', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('198', 'F7BFF2C21D53', '吕想', '54625', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('199', '079EC2791CD9', '赵翠', '54640', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('200', '079EBB564687', '林立', '54648', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('201', '1F1405B30D88', '欧阳文波', '56580', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('202', 'D9A71EB18926', '朱江', '52797', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('203', 'C553CDC0BFAF', '李佳32189', '32189', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('204', '46AD0515F729', '李志伟', '36494', '销售', '0', '2837', '互联网板块-房产-华南区-华南区-深圳-深圳-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('205', '4AB42D242AF8', '李义刚', '37231', '销售', '0', '2837', '互联网板块-房产-华南区-华南区-深圳-深圳-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('206', '43CEDC855D40', '李逸', '31448', '销售', '0', '2837', '互联网板块-房产-华南区-华南区-深圳-深圳-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('207', 'B597D826113E', '宋映红', '30056', '销售', '0', '2837', '互联网板块-房产-华南区-华南区-深圳-深圳-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('208', 'FB2BFE7655D4', '王璞', '30811', '销售', '0', '2837', '互联网板块-房产-华南区-华南区-深圳-深圳-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('209', '9CB781DA5F86', '许艳茹', '30709', '销售', '0', '2837', '互联网板块-房产-华南区-华南区-深圳-深圳-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('210', 'F8F62EDA4B9C', '贺今朝', '30534', '销售', '0', '2837', '互联网板块-房产-华南区-华南区-深圳-深圳-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('211', '93067C11B119', '李雪峰', '30577', '销售', '0', '2837', '互联网板块-房产-华南区-华南区-深圳-深圳-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('212', 'E657C3E64371', '汲祥', '38166', '销售', '0', '2837', '互联网板块-房产-华南区-华南区-深圳-深圳-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('213', 'B94B7AFEE9C1', '钟璐璐', '33179', '销售', '0', '2837', '互联网板块-房产-华南区-华南区-深圳-深圳-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('214', '3CF5C43EBA14', '王凯30832', '30832', '销售', '0', '2837', '互联网板块-房产-华南区-华南区-深圳-深圳-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('215', '7846E3E1FEF4', '牟丹33899', '33899', '销售', '0', '2837', '互联网板块-房产-华南区-华南区-深圳-深圳-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('216', '382023453AC9', '张丽38195', '38195', '销售', '0', '2839', '互联网板块-房产-华南区-华南区-深圳-深圳-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('217', '37DE75B958C6', '孙萍', '30054', '销售', '0', '2839', '互联网板块-房产-华南区-华南区-深圳-深圳-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('218', '381FE63ABC55', '任树蔚', '38173', '销售', '0', '2839', '互联网板块-房产-华南区-华南区-深圳-深圳-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('219', '05D832C7F157', '卢志敏', '50308', '销售', '0', '2839', '互联网板块-房产-华南区-华南区-深圳-深圳-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('220', '05B7C0D98CB1', '陈亮50307', '50307', '销售', '0', '2839', '互联网板块-房产-华南区-华南区-深圳-深圳-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('221', '1F140ABFD3F7', '杨雪琴', '56532', '销售', '0', '2839', '互联网板块-房产-华南区-华南区-深圳-深圳-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('222', '140A01F7CC63', '严泽亮', '35828', '销售', '0', '2841', '互联网板块-房产-华南区-华南区-惠州-惠州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('223', '8ADF8AE05F47', '夏传锋', '38258', '销售', '0', '2841', '互联网板块-房产-华南区-华南区-惠州-惠州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('224', 'C10693834C74', '陈秀云', '38150', '销售', '0', '2841', '互联网板块-房产-华南区-华南区-惠州-惠州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('225', 'CF13011BE183', '刘志强34201', '34201', '销售', '0', '2841', '互联网板块-房产-华南区-华南区-惠州-惠州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('226', 'F97659035CB9', '姚利', '30518', '销售', '0', '2841', '互联网板块-房产-华南区-华南区-惠州-惠州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('227', 'FB86D2E32AA8', '黄海婷', '38123', '销售', '0', '2841', '互联网板块-房产-华南区-华南区-惠州-惠州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('228', '6C6AA1C595C6', '于鑫昌', '54567', '销售', '0', '2841', '互联网板块-房产-华南区-华南区-惠州-惠州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('229', 'AC3EA4013AD7', '赵志武36952', '36952', '销售', '0', '2841', '互联网板块-房产-华南区-华南区-惠州-惠州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('230', '803A7E20BFB7', '覃盈', '54590', '销售', '0', '2841', '互联网板块-房产-华南区-华南区-惠州-惠州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('231', '045D159D3CC4', '陈爱国', '50302', '销售', '0', '2841', '互联网板块-房产-华南区-华南区-惠州-惠州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('232', '7F15D68A96E3', '黄奕校', '50459', '销售', '0', '2841', '互联网板块-房产-华南区-华南区-惠州-惠州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('233', 'F993D52040F2', '甘淑君', '56503', '销售', '0', '2841', '互联网板块-房产-华南区-华南区-惠州-惠州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('234', 'BD0D3D29AA32', '熊威52764', '52764', '销售', '0', '2841', '互联网板块-房产-华南区-华南区-惠州-惠州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('235', 'A2EDD1ACF231', '林周强36893', '36893', '销售', '0', '2841', '互联网板块-房产-华南区-华南区-惠州-惠州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('236', '6A19499B9411', '黄虎', '38213', '销售', '0', '2841', '互联网板块-房产-华南区-华南区-惠州-惠州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('237', 'EA2ED9429DA2', '赵宝华37014', '37014', '销售', '0', '2844', '互联网板块-房产-华南区-华南区-东莞-东莞-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('238', 'F88CAE57E391', '沈力力', '38288', '销售', '0', '2844', '互联网板块-房产-华南区-华南区-东莞-东莞-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('239', 'BE3F930DE7F2', '杨德甘', '50395', '销售', '0', '2844', '互联网板块-房产-华南区-华南区-东莞-东莞-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('240', 'C09B9940FE17', '廖芩', '37219', '销售', '0', '2844', '互联网板块-房产-华南区-华南区-东莞-东莞-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('241', 'BE3F6A3BDF50', '冯强', '50387', '销售', '0', '2844', '互联网板块-房产-华南区-华南区-东莞-东莞-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('242', '385CAF393F34', '梁敏丝', '55560', '销售', '0', '2844', '互联网板块-房产-华南区-华南区-东莞-东莞-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('243', '0A1EA0E79BF7', '张俊青', '37136', '销售', '0', '2844', '互联网板块-房产-华南区-华南区-东莞-东莞-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('244', '0849ED721AF9', '阮春晖', '38183', '销售', '0', '2844', '互联网板块-房产-华南区-华南区-东莞-东莞-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('245', '17B055ED808E', '程怡芳31872', '31872', '销售', '0', '2845', '互联网板块-房产-华南区-华南区-东莞-东莞-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('246', 'B22F4ECDE783', '郝璐', '33692', '销售', '0', '2845', '互联网板块-房产-华南区-华南区-东莞-东莞-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('247', '4953E7BF6A48', '庄平涛', '37423', '销售', '0', '2845', '互联网板块-房产-华南区-华南区-东莞-东莞-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('248', 'AA5555911E61', '王楠楠', '30470', '销售', '0', '2845', '互联网板块-房产-华南区-华南区-东莞-东莞-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('249', '5F7BF914EE73', '黄英', '50415', '销售', '0', '2845', '互联网板块-房产-华南区-华南区-东莞-东莞-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('250', 'BE3F3DEB6F76', '张倩倩', '50386', '销售', '0', '2845', '互联网板块-房产-华南区-华南区-东莞-东莞-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('251', '1AA50C1A9C43', '黄洁玲', '52766', '销售', '0', '2845', '互联网板块-房产-华南区-华南区-东莞-东莞-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('252', 'C8D54B123DF7', '杨婷52781', '52781', '销售', '0', '2845', '互联网板块-房产-华南区-华南区-东莞-东莞-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('253', '0A78A04DCE12', '石湘雅', '55561', '销售', '0', '2845', '互联网板块-房产-华南区-华南区-东莞-东莞-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('254', '3ED1BB8DA26D', '温晓存', '32036', '销售', '0', '2845', '互联网板块-房产-华南区-华南区-东莞-东莞-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('255', '94C96EFEBD9A', '马贝斯', '34943', '销售', '0', '2847', '互联网板块-房产-华南区-华南区-佛山-佛山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('256', '1C251EFFB416', '林成名', '35952', '销售', '0', '2847', '互联网板块-房产-华南区-华南区-佛山-佛山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('257', '60814BC07B70', '曹彩霞', '32038', '销售', '0', '2847', '互联网板块-房产-华南区-华南区-佛山-佛山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('258', '44DCC7994E05', '余美娟-停用', '528401', '销售', '0', '2847', '互联网板块-房产-华南区-华南区-佛山-佛山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('259', 'F3D9683A78F2', '余美娟-停用', '528402', '销售', '0', '2847', '互联网板块-房产-华南区-华南区-佛山-佛山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('260', 'A2B755970837', '陈旻', '50486', '销售', '0', '2847', '互联网板块-房产-华南区-华南区-佛山-佛山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('261', '0C63F5277719', '梁文浩', '37223', '销售', '0', '2847', '互联网板块-房产-华南区-华南区-佛山-佛山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('262', '27B00612CD64', '余碧', '38180', '销售', '0', '2847', '互联网板块-房产-华南区-华南区-佛山-佛山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('263', '8703FC9CFE53', '施光强', '38108', '销售', '0', '2849', '互联网板块-房产-华南区-华南区-佛山-佛山-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('264', '44DCA89983C0', '余美娟', '52840', '销售', '0', '2849', '互联网板块-房产-华南区-华南区-佛山-佛山-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('265', '6E41C2D14BD9', '李求送', '38110', '销售', '0', '2853', '互联网板块-房产-华南区-华南区-中珠-中山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('266', '4CA5224419E9', '梁靖怡', '50413', '销售', '0', '2853', '互联网板块-房产-华南区-华南区-中珠-中山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('267', 'C65EAF86A837', '成芳容', '52778', '销售', '0', '2853', '互联网板块-房产-华南区-华南区-中珠-中山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('268', 'D73A803EBC37', '谷政朝', '34838', '销售', '0', '2853', '互联网板块-房产-华南区-华南区-中珠-中山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('269', '88183E1D9F60', '岑锦安', '50466', '销售', '0', '2853', '互联网板块-房产-华南区-华南区-中珠-中山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('270', 'CA866021B43D', '阙祖传', '35833', '销售', '0', '2853', '互联网板块-房产-华南区-华南区-中珠-中山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('271', 'CBF468DA3403', '郑丽丽', '56539', '销售', '0', '2853', '互联网板块-房产-华南区-华南区-中珠-中山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('272', '4D64EDA2A6B4', '邱彦霖', '56633', '销售', '0', '2853', '互联网板块-房产-华南区-华南区-中珠-中山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('273', 'FB5089E84C08', '候梦怡', '38186', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('274', '1EC1144D4A78', '李石秀', '38199', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('275', 'D4E0FEC956E9', '王思瑶', '37248', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('276', '5FB3F32882D8', '陈喜杰', '35663', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('277', '9986BE487261', '邓江渝', '38136', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('278', 'D14E6A390F9A', '申鹏', '35357', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('279', '3154D2006C41', '荀洪丽', '35016', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('280', '291553A37049', '杨渠艳', '54326', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('281', 'D9D5F1F3BA49', '刘长波', '38188', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('282', 'B80529BC13D3', '周高翔36895', '36895', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('283', '202B210C08A7', '莫介析', '38298', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('284', '202B4C911A25', '湛博坦', '50342', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('285', '4A73438A9434', '王先荣', '37424', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('286', '08FBED1310D7', '李玲55553', '55553', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('287', '202B39B91D88', '丁国进', '38299', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('288', 'D3F6C4218698', '王钧', '56552', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('289', '0AC3544AE152', '王晓乐', '38257', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('290', '80E01164A092', '赵雄', '55645', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('291', '4131ED781A24', '熊昌桐', '37433', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('292', '6F58BE996CB6', '王蓉38311', '38311', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('293', '6E753CEDD920', '黄远秀', '36748', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('294', '40446D329871', '伍传连', '37434', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('295', '1F21BFE24BE4', '李尚勇', '32257', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('296', '4049D1ED1413', '董正玉', '37414', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('297', 'B18688275157', '刘丹34673', '34673', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('298', 'C6E00ADCE7C8', '何聪37003', '37003', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('299', 'D3925785CFF2', '段挺秀', '38417', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('300', 'A38A943B0097', '林子', '30565', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('301', '0C53E4B7A560', '王小玲', '38435', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('302', '2FDBCF0C8EB6', '丁小玲', '38448', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('303', 'BF565405BDC2', '成思', '38484', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('304', '8BD217585988', '董雅文', '31824', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('305', '9EA0E0E5E743', '张婉君', '32726', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('306', '15265E7B62E0', '胡梁', '50548', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('307', 'D88089AC0A26', '殷乐凌', '50533', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('308', '016E8E9E8429', '陈亮35361', '35361', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('309', '4B03207ACA50', '李君35419', '35419', '销售', '0', '2875', '互联网板块-房产-长沙-长沙-长沙-长沙-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('310', '2A6BECECB01D', '詹婕', '35420', '销售', '0', '2875', '互联网板块-房产-长沙-长沙-长沙-长沙-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('311', '9F196EE4BA84', '龙柏桦36888', '36888', '销售', '0', '2875', '互联网板块-房产-长沙-长沙-长沙-长沙-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('312', '7016ADDFE670', '甘海涛', '34898', '销售', '0', '2875', '互联网板块-房产-长沙-长沙-长沙-长沙-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('313', '70BA52815091', '郭灿', '30541', '销售', '0', '2875', '互联网板块-房产-长沙-长沙-长沙-长沙-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('314', '771CDBB648D0', '黄雨轩', '34144', '销售', '0', '2875', '互联网板块-房产-长沙-长沙-长沙-长沙-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('315', 'CD09D56BB1A8', '宁钦', '38419', '销售', '0', '2875', '互联网板块-房产-长沙-长沙-长沙-长沙-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('316', '50FAA7031F42', '黄秋娟', '51921', '销售', '0', '2875', '互联网板块-房产-长沙-长沙-长沙-长沙-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('317', '54ABC1DF0233', '李辰玉', '38381', '销售', '0', '2875', '互联网板块-房产-长沙-长沙-长沙-长沙-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('318', '153CAF740AD3', '杨坤51904', '51904', '销售', '0', '2875', '互联网板块-房产-长沙-长沙-长沙-长沙-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('319', '2E0C3357B3C4', '陈颖', '54207', '销售', '0', '2875', '互联网板块-房产-长沙-长沙-长沙-长沙-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('320', '2E0C3E91B940', '张梅', '54200', '销售', '0', '2875', '互联网板块-房产-长沙-长沙-长沙-长沙-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('321', '9F193A20E1C7', '陈柳36810', '36810', '销售', '0', '2875', '互联网板块-房产-长沙-长沙-长沙-长沙-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('322', 'B4242621D3E3', '曹丹', '30485', '销售', '0', '2875', '互联网板块-房产-长沙-长沙-长沙-长沙-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('323', 'BB32A3FFD42F', '薛叶果', '32322', '销售', '0', '2875', '互联网板块-房产-长沙-长沙-长沙-长沙-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('324', '9E276B27856F', '杨名高', '35738', '销售', '0', '2877', '互联网板块-房产-长沙-长沙-长沙-长沙-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('325', 'A386B2058401', '王浩华', '30743', '销售', '0', '2877', '互联网板块-房产-长沙-长沙-长沙-长沙-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('326', '4246D96D3EA9', '黄智青', '38342', '销售', '0', '2877', '互联网板块-房产-长沙-长沙-长沙-长沙-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('327', '89A63C399681', '杨亮', '38391', '销售', '0', '2877', '互联网板块-房产-长沙-长沙-长沙-长沙-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('328', '4AD19082D3CD', '文慧梅', '30822', '销售', '0', '2877', '互联网板块-房产-长沙-长沙-长沙-长沙-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('329', '53C1E70957AA', '易居长沙', 'B9915', '销售', '0', '2877', '互联网板块-房产-长沙-长沙-长沙-长沙-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('330', '3E49A3F117A5', '罗安利33477', '33477', '销售', '0', '2877', '互联网板块-房产-长沙-长沙-长沙-长沙-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('331', 'EFC7B4C56DC6', '汤晓雯', '36704', '销售', '0', '2877', '互联网板块-房产-长沙-长沙-长沙-长沙-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('332', 'DD1563801AC5', '杨翔', '38343', '销售', '0', '2877', '互联网板块-房产-长沙-长沙-长沙-长沙-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('333', 'A9688E441124', '夏青', '38404', '销售', '0', '2877', '互联网板块-房产-长沙-长沙-长沙-长沙-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('334', '4AC882E982B9', '罗安利', '30286', '销售', '0', '2877', '互联网板块-房产-长沙-长沙-长沙-长沙-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('335', '892B2980F3A6', '张婉', '51981', '销售', '0', '2877', '互联网板块-房产-长沙-长沙-长沙-长沙-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('336', '1B970C0A9FF6', '陈琦', '36417', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('337', 'B1055028EB75', '刘芳', '30287', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('338', '2D8B0230B972', '赵征', '32571', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('339', 'CD0CC441BF15', '覃业精', '35875', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('340', '89A65BAD4240', '刘文', '38394', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('341', 'D9AF3116EC38', '张宇婷', '51955', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('342', '045A03C33E99', '刘鸣', '38423', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('343', '25216D051937', '杨娇38407', '38407', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('344', '153C61B79C67', '廖义龙', '38436', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('345', '483285EDD156', '周文', '54210', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('346', '51BB4EDBAD92', '刘霞玲', '32963', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('347', '800E45478534', '罗健', '54225', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('348', '800DFDC6AC20', '唐亚男', '54224', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('349', 'C0553195D5F3', '易婷', '54239', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('350', '217482B74422', '周奕彤', '33125', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('351', 'CD0CB351F637', '熊芳', '34859', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('352', 'C0889A625D05', '李可娟', '54232', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('353', 'AC550BA43094', '夏冰', '54237', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('354', '153C842A0108', '秦乐', '51905', '销售', '0', '2881', '互联网板块-房产-长沙-长沙-长沙-长沙-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('355', 'CD09EB21B2D8', '周丽', '38420', '销售', '0', '2881', '互联网板块-房产-长沙-长沙-长沙-长沙-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('356', '89A61FA68F88', '刘旭东', '38397', '销售', '0', '2881', '互联网板块-房产-长沙-长沙-长沙-长沙-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('357', '90D4C6386B96', '赵钰', '51980', '销售', '0', '2881', '互联网板块-房产-长沙-长沙-长沙-长沙-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('358', '09E61FC4B9CC', '李毅波', '30893', '销售', '0', '2881', '互联网板块-房产-长沙-长沙-长沙-长沙-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('359', '800E01902894', '曾亮', '54215', '销售', '0', '2881', '互联网板块-房产-长沙-长沙-长沙-长沙-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('360', '14715DCA9342', '雷鑫', '38365', '销售', '0', '2881', '互联网板块-房产-长沙-长沙-长沙-长沙-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('361', '190FE23E4810', '谢文阳', '35971', '销售', '0', '2883', '互联网板块-房产-联合区-联合区-南昌-南昌-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('362', 'A31A6F89B5B3', '曾小强', '38324', '销售', '0', '2883', '互联网板块-房产-联合区-联合区-南昌-南昌-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('363', '5CFDDEAE0351', '金扬', '38379', '销售', '0', '2883', '互联网板块-房产-联合区-联合区-南昌-南昌-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('364', '5CFDF7440010', '黄丽娜', '38387', '销售', '0', '2883', '互联网板块-房产-联合区-联合区-南昌-南昌-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('365', '720B15724172', '李星颖', '38392', '销售', '0', '2883', '互联网板块-房产-联合区-联合区-南昌-南昌-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('366', '190E07E48C12', '胡德真南', '35981', '销售', '0', '2883', '互联网板块-房产-联合区-联合区-南昌-南昌-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('367', '19101363F411', '涂娜娜', '35970', '销售', '0', '2883', '互联网板块-房产-联合区-联合区-南昌-南昌-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('368', '190F6193FFF1', '韩杨扬', '36094', '销售', '0', '2883', '互联网板块-房产-联合区-联合区-南昌-南昌-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('369', '26B3240F4B93', '杨有忠', '38314', '销售', '0', '2883', '互联网板块-房产-联合区-联合区-南昌-南昌-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('370', '26B3383F4A05', '丁龙', '51214', '销售', '0', '2883', '互联网板块-房产-联合区-联合区-南昌-南昌-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('371', '3408FA908A28', '孙艳彬', '35865', '销售', '0', '2883', '互联网板块-房产-联合区-联合区-南昌-南昌-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('372', '0CCCC141E6B4', '邹昕玲', '35972', '销售', '0', '2883', '互联网板块-房产-联合区-联合区-南昌-南昌-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('373', 'A3B4E985DDFB', '何鑫35299', '35299', '销售', '0', '2885', '互联网板块-房产-南京-南京-南京-南京-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('374', '4.04802E+11', '吴佳男', '36367', '销售', '0', '2885', '互联网板块-房产-南京-南京-南京-南京-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('375', 'D74DF21A8CAA', '姚耀', '34635', '销售', '0', '2885', '互联网板块-房产-南京-南京-南京-南京-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('376', '4D156204DB9A', '刘晓霞', '35212', '销售', '0', '2885', '互联网板块-房产-南京-南京-南京-南京-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('377', '8C109BBFA54A', '居婷婷', '34621', '销售', '0', '2885', '互联网板块-房产-南京-南京-南京-南京-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('378', 'F61EAAB422B2', '江辰', '37127', '销售', '0', '2885', '互联网板块-房产-南京-南京-南京-南京-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('379', 'F8104D87FF73', '石淑彦', '55456', '销售', '0', '2885', '互联网板块-房产-南京-南京-南京-南京-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('380', 'F8102AE76D46', '张文枢', '55455', '销售', '0', '2885', '互联网板块-房产-南京-南京-南京-南京-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('381', '21CB45AB1C36', '陈亮宇', '37184', '销售', '0', '2885', '互联网板块-房产-南京-南京-南京-南京-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('382', 'DF8BD4772020', '黄坤英', '39083', '销售', '0', '2885', '互联网板块-房产-南京-南京-南京-南京-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('383', 'FBD9B2F2CE18', '李璇', '52880', '销售', '0', '2885', '互联网板块-房产-南京-南京-南京-南京-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('384', '4047D51C0E65', '糜年强', '34297', '销售', '0', '2885', '互联网板块-房产-南京-南京-南京-南京-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('385', '18BDBDD3AFE2', '沙泽宇', '55660', '销售', '0', '2885', '互联网板块-房产-南京-南京-南京-南京-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('386', '2FED99BE6CB1', '张罡翊', '39004', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('387', '4C0EE5A520E3', '赵绍峰', '35300', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('388', '831520040A1E', '刘佳', '32026', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('389', '4D359588102C', '易居南京', 'B9909', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('390', '33D7D8031B72', '郭剑', '51125', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('391', '2FC4C9945F5F', '钱庆', '30573', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('392', '575A51422BE7', '徐青青', '51152', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('393', '04557D12DB56', '徐桐', '39090', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('394', '9110312B3419', '赵远建', '55671', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('395', '3C110F8A9C67', '王兴元55710', '55710', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('396', 'F2238AA86570', '张业君', '55700', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('397', '6173F7E05000', '陈馨亚', '52914', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('398', '820D983F4700', '王蕾34633', '34633', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('399', '9135221EEFB3', '倪天明', '51177', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('400', '98127EC8B877', '胡波', '39077', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('401', '9DA7C65F6791', '杨育懿', '39050', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('402', 'A5B6132AEDB5', '李芯36929', '36929', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('403', '3A247E3FB9E2', '陈园', '51134', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('404', '01D620F21048', '朱孟园', '39087', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('405', '961F3498300E', '孙博', '32747', '销售', '0', '2889', '互联网板块-房产-南京-南京-南京-南京-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('406', '281B956D6BB1', '文萍', '51110', '销售', '0', '2889', '互联网板块-房产-南京-南京-南京-南京-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('407', 'E1111FB7D440', '郑静', '32187', '销售', '0', '2889', '互联网板块-房产-南京-南京-南京-南京-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('408', 'D32BC16DCC93', '廖云', '55453', '销售', '0', '2889', '互联网板块-房产-南京-南京-南京-南京-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('409', '5C417689B876', '刘宏卫', '55667', '销售', '0', '2889', '互联网板块-房产-南京-南京-南京-南京-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('410', '5E5997534763', '周彦梅', '34634', '销售', '0', '2889', '互联网板块-房产-南京-南京-南京-南京-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('411', '761BFF051BC4', '丁奇', '35561', '销售', '0', '2889', '互联网板块-房产-南京-南京-南京-南京-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('412', 'BD3D34792DB8', '杨露', '34522', '销售', '0', '2889', '互联网板块-房产-南京-南京-南京-南京-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('413', 'D2F1DA72C765', '夏凡', '30373', '销售', '0', '2889', '互联网板块-房产-南京-南京-南京-南京-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('414', 'ED2665B4A671', '张立37110', '37110', '销售', '0', '2889', '互联网板块-房产-南京-南京-南京-南京-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('415', '21F041C0A363', '郑敏', '30801', '销售', '0', '2889', '互联网板块-房产-南京-南京-南京-南京-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('416', '211E38206AB1', '张硕51176', '51176', '销售', '0', '2889', '互联网板块-房产-南京-南京-南京-南京-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('417', '211E2F199B79', '窦思远', '52875', '销售', '0', '2889', '互联网板块-房产-南京-南京-南京-南京-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('418', '1561CFB7CF5B', '王旭', '31489', '销售', '0', '2889', '互联网板块-房产-南京-南京-南京-南京-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('419', 'A352F1B732E5', '陈劲宇', '32715', '销售', '0', '2889', '互联网板块-房产-南京-南京-南京-南京-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('420', '89E4518FFDF0', '李智39030', '39030', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('421', '9DA8097D85E5', '金帆璐', '39051', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('422', '0455B87F3667', '段盼盼', '39091', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('423', '33D7F2A53058', '庄呈', '51126', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('424', '7C46604968D5', '徐佳佳', '39024', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('425', '49E65045E596', '许慧', '55665', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('426', 'ADDF94978C85', '潘若颖', '52947', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('427', '4E09A4986722', '窦思清', '52908', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('428', 'A368FF7BD0F2', '田月', '55677', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('429', '160C752C1250', '张骏', '55707', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('430', 'B8732A9A6653', '佘思思', '55688', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('431', 'DDEED5DE4675', '邹恩福39078', '39078', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('432', '0104B135D619', '张俊', '55691', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('433', '9290EEA65C03', '马进', '52943', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('434', 'B4C3C9036A92', '朱挚卿', '52852', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('435', 'BAACCD83D705', '陈靖', '39063', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('436', '404506BAB848', '孙文静', '37420', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('437', '281BAB080C89', '杨青青', '51109', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('438', '55183659CAD4', '赵雪', '39013', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('439', '08F3F9B64285', '张帆55654', '55654', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('440', 'B13CFF6C17B3', '徐浩军', '30484', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('441', 'F81021A88862', '吴新叶', '55454', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('442', '18BDC4C269C6', '刘晨昱', '33283', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('443', '2F78D2CACA00', '袁爱霞', '55662', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('444', '904BE6967140', '谢迎东', '38922', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('445', '9110291072B9', '夏天', '55673', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('446', '18BDB7CAB276', '夏孝升', '55659', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('447', '160C6BD1D670', '陆夕', '55702', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('448', '6FE878C46AB4', '费晓翔', '55668', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('449', 'A5A15C348394', '王兴元', '38935', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('450', '36E5BD3F8204', '金叶丹', '37372', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('451', '04559C94C766', '杭婷', '39089', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('452', '022A4975D491', '刘佳34631', '34631', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('453', '2FEDCB71BFD9', '叶军', '39005', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('454', '25AF1704A964', '王超', '31784', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('455', '998B1709FFC2', '徐秀程', '38931', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('456', 'A980A0478DE4', '王敏36940', '36940', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('457', 'A98088380A33', '石海丽36939', '36939', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('458', 'A09EBE574F64', '余伯前', '36892', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('459', '207B28603D92', '陆一翔', '31420', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('460', '440773DCA15D', '史雯雯', '30886', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('461', 'E69FEE9C946A', '侯永平', '31875', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('462', '9C4A0A1E6EC6', '沈珉蕙', '32025', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('463', 'E656C05221AE', '易居无锡', 'B9913', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('464', '48E390C10187', '陈丽花', '30885', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('465', 'E79FF79565A2', '李杨33450', '33450', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('466', '2965BCA9AE35', '唐敏', '51127', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('467', 'F62B31C66C79', '倪露', '38963', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('468', 'AE0F3054DBF7', '季言梁', '55959', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('469', 'B65C59C77035', '钱坤', '52856', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('470', '66A66825C1C6', '仲明', '55964', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('471', '3593D800A40C', '胡楚琳', '32245', '销售', '0', '2897', '互联网板块-房产-无锡-无锡-无锡-无锡-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('472', '16A2EB600087', '任童霏', '39097', '销售', '0', '2897', '互联网板块-房产-无锡-无锡-无锡-无锡-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('473', '3ECDA75D0A61', '陶阳洋', '37373', '销售', '0', '2897', '互联网板块-房产-无锡-无锡-无锡-无锡-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('474', '4E42CE837EE8', '李祥光', '51150', '销售', '0', '2897', '互联网板块-房产-无锡-无锡-无锡-无锡-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('475', '7C22F768DD96', '侯维文', '51169', '销售', '0', '2897', '互联网板块-房产-无锡-无锡-无锡-无锡-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('476', '8EF162E9E170', '叶一飞', '51120', '销售', '0', '2897', '互联网板块-房产-无锡-无锡-无锡-无锡-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('477', '95B188C43848', '陈雯湘39041', '39041', '销售', '0', '2897', '互联网板块-房产-无锡-无锡-无锡-无锡-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('478', 'BE3D8B6F03E6', '赵锋', '52870', '销售', '0', '2897', '互联网板块-房产-无锡-无锡-无锡-无锡-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('479', '98182F5C1B25', '曾喆', '51186', '销售', '0', '2897', '互联网板块-房产-无锡-无锡-无锡-无锡-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('480', '14213EBBD644', '陆宏伟', '39099', '销售', '0', '2897', '互联网板块-房产-无锡-无锡-无锡-无锡-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('481', '877D7DEA4A98', '徐宏军', '36842', '销售', '0', '2897', '互联网板块-房产-无锡-无锡-无锡-无锡-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('482', 'A7646EB07817', '胡韵', '55957', '销售', '0', '2897', '互联网板块-房产-无锡-无锡-无锡-无锡-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('483', '10FE592007D3', '杨琳菡', '52891', '销售', '0', '2897', '互联网板块-房产-无锡-无锡-无锡-无锡-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('484', 'DD6981696EA3', '孔令韦', '55962', '销售', '0', '2897', '互联网板块-房产-无锡-无锡-无锡-无锡-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('485', 'F1CB712EF879', '任虹', '33854', '销售', '0', '2899', '互联网板块-房产-无锡-无锡-无锡-无锡-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('486', 'A98044505260', '陈思嘉36937', '36937', '销售', '0', '2899', '互联网板块-房产-无锡-无锡-无锡-无锡-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('487', '7C22DF772C42', '潘杰', '51168', '销售', '0', '2899', '互联网板块-房产-无锡-无锡-无锡-无锡-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('488', '16A2D54E0254', '杨鹏远', '39098', '销售', '0', '2899', '互联网板块-房产-无锡-无锡-无锡-无锡-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('489', '7CB94BD8C657', '陈世杰', '39027', '销售', '0', '2899', '互联网板块-房产-无锡-无锡-无锡-无锡-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('490', 'A9806BA959C3', '范碧莹36938', '36938', '销售', '0', '2899', '互联网板块-房产-无锡-无锡-无锡-无锡-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('491', '92A6699664F9', '尤骏', '52934', '销售', '0', '2899', '互联网板块-房产-无锡-无锡-无锡-无锡-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('492', '71E11B6A3B46', '董俊森', '51160', '销售', '0', '2899', '互联网板块-房产-无锡-无锡-无锡-无锡-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('493', '5C2F640D8622', '施海峰', '55954', '销售', '0', '2899', '互联网板块-房产-无锡-无锡-无锡-无锡-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('494', 'A764798AA7A5', '季梦婷', '55958', '销售', '0', '2899', '互联网板块-房产-无锡-无锡-无锡-无锡-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('495', '4E42BA3AEF11', '朱理进', '51148', '销售', '0', '2899', '互联网板块-房产-无锡-无锡-无锡-无锡-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('496', 'DD0F2A2994E4', '陈金伟', '55961', '销售', '0', '2899', '互联网板块-房产-无锡-无锡-无锡-无锡-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('497', 'CCE5D33BDEC2', '杨坤民', '38947', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('498', '4C09A02DF7E0', '韦泱', '38901', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('499', '92E7B85E0122', '徐一凯', '34564', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('500', '59BB1C967472', '任心一', '32551', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('501', '244472EBF711', '张磊32527', '32527', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('502', '46E5A66F94DE', '易居常州', 'B9914', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('503', '155F5C59AE9B', '康飞', '30969', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('504', 'D7AA8222FD21', '赵海萍', '39067', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('505', '092267E75022', '薛冠华', '52885', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('506', '7E2653826D7F', '肖栋', '32920', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('507', '2CF789BD75F4', '李飞55472', '55472', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('508', '4052E89B8299', '李莉55477', '55477', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('509', '7EBFA0B45DD2', '黄程', '51166', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('510', '12383215858F', '薛园', '33489', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('511', '3AEF8A11DA56', '史羽孜', '55523', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('512', '497C8F10DAF5', '施杨', '55480', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('513', '417BCA5E1C07', '吴莹', '37418', '销售', '0', '2903', '互联网板块-房产-东部区-锡常-常州-常州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('514', '8EC486C34184', '路磊', '39031', '销售', '0', '2903', '互联网板块-房产-东部区-锡常-常州-常州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('515', '6456E9ECBA7E', '吴震', '32919', '销售', '0', '2903', '互联网板块-房产-东部区-锡常-常州-常州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('516', '182F0879F453', '王孜', '51100', '销售', '0', '2903', '互联网板块-房产-东部区-锡常-常州-常州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('517', '182F1D4FBA41', '安木丛', '51101', '销售', '0', '2903', '互联网板块-房产-东部区-锡常-常州-常州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('518', '743CADB07276', '倪蓓蓓', '52922', '销售', '0', '2903', '互联网板块-房产-东部区-锡常-常州-常州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('519', '77D710AEFF72', '谈鑫峰', '52927', '销售', '0', '2903', '互联网板块-房产-东部区-锡常-常州-常州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('520', '395B6D671829', '严惠', '37394', '销售', '0', '2903', '互联网板块-房产-东部区-锡常-常州-常州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('521', '9A667A42C217', '陈烨', '51185', '销售', '0', '2903', '互联网板块-房产-东部区-锡常-常州-常州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('522', '6C04FC090342', '吴乐', '52918', '销售', '0', '2903', '互联网板块-房产-东部区-锡常-常州-常州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('523', '3171B63B1FA6', '丁强', '55520', '销售', '0', '2903', '互联网板块-房产-东部区-锡常-常州-常州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('524', 'ADBA7E049E97', '王齐雅', '38938', '销售', '0', '2905', '互联网板块-房产-东部区-锡常-常州-常州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('525', '3A9465BAD724', '徐友文', '51136', '销售', '0', '2905', '互联网板块-房产-东部区-锡常-常州-常州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('526', '8EC4A70B1C98', '顾博崴', '39029', '销售', '0', '2905', '互联网板块-房产-东部区-锡常-常州-常州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('527', '9A5686314C49', '陈一', '51171', '销售', '0', '2905', '互联网板块-房产-东部区-锡常-常州-常州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('528', 'BBB120B13278', '仲进萍', '52851', '销售', '0', '2905', '互联网板块-房产-东部区-锡常-常州-常州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('529', '0FFF12CECAC8', '金伟', '52889', '销售', '0', '2905', '互联网板块-房产-东部区-锡常-常州-常州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('530', '8A63BCAF7FB5', '周锋52936', '52936', '销售', '0', '2905', '互联网板块-房产-东部区-锡常-常州-常州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('531', 'C5FBC1A17F65', '胡明刚', '55450', '销售', '0', '2905', '互联网板块-房产-东部区-锡常-常州-常州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('532', 'D6F067147839', '李坚', '55499', '销售', '0', '2905', '互联网板块-房产-东部区-锡常-常州-常州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('533', '3171BBD58319', '潘震宇', '55521', '销售', '0', '2905', '互联网板块-房产-东部区-锡常-常州-常州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('534', 'E778381942C6', '裴冬冬37036', '37036', '销售', '0', '2907', '互联网板块-房产-苏南区-苏南-南通-南通-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('535', 'E7788421E2C1', '胡新星37038', '37038', '销售', '0', '2907', '互联网板块-房产-苏南区-苏南-南通-南通-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('536', 'E778C2A880E4', '缪迎春37065', '37065', '销售', '0', '2907', '互联网板块-房产-苏南区-苏南-南通-南通-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('537', 'A3FDDDE56FC5', '孙国强', '51763', '销售', '0', '2907', '互联网板块-房产-苏南区-苏南-南通-南通-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('538', 'C894F764E5D7', '欧捷', '54854', '销售', '0', '2907', '互联网板块-房产-苏南区-苏南-南通-南通-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('539', '2DBEC2375BC1', '宋瑶', '37047', '销售', '0', '2907', '互联网板块-房产-苏南区-苏南-南通-南通-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('540', '6E1F080D8340', '王海剑', '38974', '销售', '0', '2907', '互联网板块-房产-苏南区-苏南-南通-南通-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('541', '3151C6EFEEE7', '曹雯雯', '39691', '销售', '0', '2907', '互联网板块-房产-苏南区-苏南-南通-南通-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('542', 'E7780ECB7A31', '吴伟37035', '37035', '销售', '0', '2907', '互联网板块-房产-苏南区-苏南-南通-南通-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('543', '2C2B9062DF11', '王旭光', '37066', '销售', '0', '2909', '互联网板块-房产-合肥-合肥-合肥-合肥-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('544', '9039C764A166', '钱燕', '35265', '销售', '0', '2909', '互联网板块-房产-合肥-合肥-合肥-合肥-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('545', '390EC62F1B31', '夏志远', '34658', '销售', '0', '2909', '互联网板块-房产-合肥-合肥-合肥-合肥-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('546', '373400816F49', '李光', '37329', '销售', '0', '2909', '互联网板块-房产-合肥-合肥-合肥-合肥-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('547', 'BCE24F074044', '杨森52017', '52017', '销售', '0', '2909', '互联网板块-房产-合肥-合肥-合肥-合肥-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('548', 'B74F3B8A0B10', '梅烁', '52031', '销售', '0', '2909', '互联网板块-房产-合肥-合肥-合肥-合肥-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('549', '5.58E+10', '张申欣', '52053', '销售', '0', '2909', '互联网板块-房产-合肥-合肥-合肥-合肥-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('550', '3F80AEC136D5', '杨简', '52021', '销售', '0', '2909', '互联网板块-房产-合肥-合肥-合肥-合肥-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('551', '374720540ECE', '李娟f5712', '35712', '销售', '0', '2909', '互联网板块-房产-合肥-合肥-合肥-合肥-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('552', '9042694ED718', '盛茜', '38930', '销售', '0', '2909', '互联网板块-房产-合肥-合肥-合肥-合肥-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('553', 'EF93A99893E6', '程吉义', '52071', '销售', '0', '2909', '互联网板块-房产-合肥-合肥-合肥-合肥-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('554', '373C28E96209', '王静52046', '52046', '销售', '0', '2909', '互联网板块-房产-合肥-合肥-合肥-合肥-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('555', '799F583B6E96', '范世婷', '52008', '销售', '0', '2909', '互联网板块-房产-合肥-合肥-合肥-合肥-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('556', '459D9211ADFD', '杜新超', '35919', '销售', '0', '2911', '互联网板块-房产-东部区-芜湖-芜湖-芜湖-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('557', '10D26CB21284', '陈新', '36397', '销售', '0', '2911', '互联网板块-房产-东部区-芜湖-芜湖-芜湖-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('558', 'F837AFC010E0', '蔡罕', '34730', '销售', '0', '2911', '互联网板块-房产-东部区-芜湖-芜湖-芜湖-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('559', '08CD28E84007', '王亚玲', '35893', '销售', '0', '2911', '互联网板块-房产-东部区-芜湖-芜湖-芜湖-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('560', 'DDEECBB6B0B6', '章成', '34814', '销售', '0', '2911', '互联网板块-房产-东部区-芜湖-芜湖-芜湖-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('561', '30786E1F99FA', '徐伏海', '33275', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('562', '71C1BAEC3CA9', '王璐瑶', '39475', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('563', 'DBB88CA4FA83', '龚丽雄', '31808', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('564', 'BC723D498007', '赵李宁', '34513', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('565', 'A45A895ED2C7', '陈芋竹', '39418', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('566', '41F5E6254350', '廖红', '34996', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('567', '349388FAAAFF', '王冉', '34930', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('568', 'A94CCC381B66', '龙洋', '39492', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('569', 'CD05B5BDDA33', '罗刚', '51503', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('570', 'EFA158A9D569', '陈炎莹', '39439', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('571', '647F7BC9FED4', '谢育恒', '54051', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('572', '10B65727A6B3', '范佳', '36308', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('573', 'BF810F4C2014', '李霞', '51583', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('574', '5FFFBEE473F7', '杨嘉', '32948', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('575', 'E9803A955E34', '邓巧媚', '54006', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('576', '3F5BAF49E5F9', '许楠', '55378', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('577', '001A503CA001', '杨行', '54021', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('578', 'A7D361A964E4', '宋亚军', '34177', '销售', '0', '2917', '互联网板块-房产-东部区-芜湖-芜湖-黄山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('579', 'B3D511E5641F', '黄晓芳', '31662', '销售', '0', '2917', '互联网板块-房产-东部区-芜湖-芜湖-黄山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('580', '459D9211ADFD', '杜新超', '35919', '销售', '0', '2917', '互联网板块-房产-东部区-芜湖-芜湖-黄山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('581', '15D373D47C32', '罗方', '39457', '销售', '0', '2926', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('582', '8DDCF0178070', '王执', '39487', '销售', '0', '2926', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('583', 'A9DCE6C3A803', '丁朵36922', '36922', '销售', '0', '2926', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('584', 'ABEE31EA68F5', '罗丽苹', '39423', '销售', '0', '2926', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('585', 'C34A6E671C1F', '刘力', '35421', '销售', '0', '2926', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('586', '7D554D98D877', '苟吉玲', '39410', '销售', '0', '2926', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('587', '1BA085542729', '吴春梅', '35702', '销售', '0', '2926', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('588', '51C3894C2070', '李雪55364', '55364', '销售', '0', '2926', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('589', '07FF01C8FCA4', '吴蔚', '54024', '销售', '0', '2926', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('590', '5E99421B5A37', '栗宇超', '55384', '销售', '0', '2926', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('591', 'F736F3E9A861', '鲜红', '39432', '销售', '0', '2926', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('592', '3EA9D9F20759', '杨茜', '39465', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('593', 'CDF40EE38F99', '石博', '32309', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('594', '8C883AAD0CA9', '李星雨', '39485', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('595', '4F84A3386D02', '王珏51537', '51537', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('596', 'E9803F471071', '程小娇', '54007', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('597', '3BD47660D242', '张瀚', '51530', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('598', '647F80CD41B6', '张程通', '54051', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('599', '647F99B43A92', '朱川', '54049', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('600', 'F73639E3BC42', '汤绍谦', '39442', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('601', 'C3F35CDF3439', '魏茜', '34560', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('602', '17AB60E7B266', '杨彬', '33274', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('603', 'F6E994AD01B0', '徐元仪', '54094', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('604', '07FF1739FFD4', '王可珂', '54022', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('605', '5E98F2C64A91', '张婷', '51535', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('606', '0A78BA387E85', '华晓鹏', '55357', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('607', '2754BE30F925', '夏宇', '55441', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('608', '5B79D8346F95', '杨千里', '34466', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('609', '58EFF9CBF751', '杨珊珊', '39550', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('610', '0E651A596C60', '周懋', '31741', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('611', '903F0CDE68F1', '罗丹', '39515', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('612', '65311D2F0749', '江俊', '39505', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('613', '6.39E+72', '李晶', '31194', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('614', '8737E6B6075F', '周妮拉', '31084', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('615', '4C50E619065B', '张翔', '32788', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('616', 'F4BB90DC3D4A', '罗颖', '36033', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('617', 'B13E152E04F8', '王翠', '39581', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('618', '1FEE81638C02', '王玲51693', '51693', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('619', 'D962247B42B7', '朱凌杞', '54819', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('620', 'F6AE49508DF4', '刁磊', '30856', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('621', '2730ADD75419', '李畅', '54837', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('622', 'ECBD7DA7A4E4', '胡兴玲32065', '32065', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('623', '8FF6E03EE103', '辛美庆', '54128', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('624', '911F5E767F07', '洪亮', '51654', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('625', 'ECBDEEABEAE9', '宋大海37083', '37083', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('626', 'C266FC41A915', '刘晓静', '30821', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('627', 'BCCD281638D7', '范鹏', '54791', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('628', 'D88BEC1489A4', '田娥', '39264', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('629', '06A4DD3612CF', '肖雄', '32129', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('630', '77B3C430F324', '蒋瑜', '30838', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('631', '853E3E97B8D9', '张杨', '31817', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('632', 'B3EFB3D3CE99', '邢莞毓', '31720', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('633', '25CFDD2FD093', '荆豪亮', '37206', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('634', 'A2B7968B6855', '周珂', '39419', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('635', 'CD05799DD5B7', '王烈伟', '39495', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('636', '3BD408A45F96', '何琪', '51524', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('637', '3BD44B0D5367', '廖洪玲', '51525', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('638', '7D54BF5892F4', '罗蓓', '51549', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('639', '7D54FC89E728', '许俊', '51553', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('640', '7D5511324C26', '余婷', '51554', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('641', 'BF80987EFF59', '陈荣', '51576', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('642', 'D5AD22292F01', '王洪', '51596', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('643', 'D5ADC4B0E664', '陈涛', '51598', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('644', 'D5AE3D444F30', '田鹏', '51597', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('645', '1AB6D91D7300', '赵霆雨', '54027', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('646', '7D54D3773AE3', '米成君', '51550', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('647', '24E366901B36', '唐国娟', '54034', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('648', '647F8A6A2308', '何翔', '54044', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('649', '16B66DD549A7', '罗伟', '54026', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('650', '0AD277EA895E', '刘斯年', '35947', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('651', '5087B85CC307', '田兴华', '54038', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('652', 'B75041596AC1', '刘军54085', '54085', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('653', '2848FAD8BF9D', '王兴峰', '33886', '销售', '0', '2942', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('654', '0A78A77E3066', '余伟', '55356', '销售', '0', '2942', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('655', '912ED12D64F1', '谢竞', '54076', '销售', '0', '2942', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('656', '0A0A221DE640', '张庆', '55426', '销售', '0', '2942', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('657', 'DA4AAAE2EACB', '任小龙', '34973', '销售', '0', '2944', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('658', '7C93427B8BA6', '陈阳39476', '39476', '销售', '0', '2944', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('659', 'B933AAB3DDE0', '马力榆', '39498', '销售', '0', '2944', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('660', '5A5297DA5603', '李杰34049', '34049', '销售', '0', '2944', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('661', 'A0F19FD03866', '李晨曦', '51545', '销售', '0', '2944', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('662', 'D5AEBA50E783', '王小梅', '51599', '销售', '0', '2944', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('663', '003E99588327', '徐秋林', '54018', '销售', '0', '2944', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('664', '1451D2470C32', '苏家冉', '31665', '销售', '0', '2944', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('665', '7D5538614243', '陈立', '51559', '销售', '0', '2944', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('666', '27EE7873BDB9', '魏能', '51518', '销售', '0', '2944', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('667', '509EB7CD332B', '徐辉', '35196', '销售', '0', '2946', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('668', '7C938524E652', '周军', '39477', '销售', '0', '2946', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('669', 'FC4221779685', '张应超', '54014', '销售', '0', '2946', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('670', '1AB6F46DD330', '庞洪', '54030', '销售', '0', '2946', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('671', '7D54E7E7B364', '吴芃梅', '51552', '销售', '0', '2946', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('672', '09175F754201', '蒋永婷', '36262', '销售', '0', '2946', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('673', 'B6BF60CEA383', '杨洪', '32947', '销售', '0', '2946', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('674', '4A802611CCF3', '明小圣', '39401', '销售', '0', '2946', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('675', '0A0A2DE36FD7', '冯镓', '55430', '销售', '0', '2946', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('676', 'A1A222C995F0', '王璐36558', '36558', '销售', '0', '2948', '互联网板块-房产-重庆-重庆-重庆-重庆');
INSERT INTO `oa_orgstr` VALUES ('677', '45766139C14E', '李翔', '34464', '销售', '0', '2948', '互联网板块-房产-重庆-重庆-重庆-重庆');
INSERT INTO `oa_orgstr` VALUES ('678', 'AE94B2F83EBB', '袁斌', '33455', '销售', '0', '2948', '互联网板块-房产-重庆-重庆-重庆-重庆');
INSERT INTO `oa_orgstr` VALUES ('679', 'C80AAC9B696E', '杨婧', '33678', '销售', '0', '2948', '互联网板块-房产-重庆-重庆-重庆-重庆');
INSERT INTO `oa_orgstr` VALUES ('680', 'CD8691044679', '何沁燕', '34463', '销售', '0', '2948', '互联网板块-房产-重庆-重庆-重庆-重庆');
INSERT INTO `oa_orgstr` VALUES ('681', 'B0ADC2846706', '刘毅', '34465', '销售', '0', '2948', '互联网板块-房产-重庆-重庆-重庆-重庆');
INSERT INTO `oa_orgstr` VALUES ('682', '478511EF5F95', '葛念', '32673', '销售', '0', '2948', '互联网板块-房产-重庆-重庆-重庆-重庆');
INSERT INTO `oa_orgstr` VALUES ('683', '4F0B69697E48', '陈文静', '30786', '销售', '0', '2948', '互联网板块-房产-重庆-重庆-重庆-重庆');
INSERT INTO `oa_orgstr` VALUES ('684', '9D27D68EA236', '黄娜', '32303', '销售', '0', '2950', '互联网板块-房产-重庆-重庆-重庆-重庆');
INSERT INTO `oa_orgstr` VALUES ('685', '2998DB0F1DB8', '潘欣', '31786', '销售', '0', '2950', '互联网板块-房产-重庆-重庆-重庆-重庆');
INSERT INTO `oa_orgstr` VALUES ('686', 'B71FC597CB8B', '赵妍', '31228', '销售', '0', '2950', '互联网板块-房产-重庆-重庆-重庆-重庆');
INSERT INTO `oa_orgstr` VALUES ('687', 'D4F2F270D6D1', '姜军', '30252', '销售', '0', '2950', '互联网板块-房产-重庆-重庆-重庆-重庆');
INSERT INTO `oa_orgstr` VALUES ('688', '01EA7A645F57', '崔霞39536', '39536', '销售', '0', '2950', '互联网板块-房产-重庆-重庆-重庆-重庆');
INSERT INTO `oa_orgstr` VALUES ('689', '33A9B718173C', '彭胜昔', '30321', '销售', '0', '2950', '互联网板块-房产-重庆-重庆-重庆-重庆');
INSERT INTO `oa_orgstr` VALUES ('690', 'DB5FA940F460', '古金玉', '51685', '销售', '0', '2952', '互联网板块-房产-重庆-重庆-重庆-重庆-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('691', '00AA99342E59', '王卓秋', '30858', '销售', '0', '2953', '互联网板块-房产-重庆-重庆-重庆-重庆-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('692', 'CCE3C296B3F7', '杨易', '37293', '销售', '0', '2953', '互联网板块-房产-重庆-重庆-重庆-重庆-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('693', '2935A2D91C70', '唐昆', '51623', '销售', '0', '2953', '互联网板块-房产-重庆-重庆-重庆-重庆-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('694', '34BB663C3935', '张扬', '54841', '销售', '0', '2953', '互联网板块-房产-重庆-重庆-重庆-重庆-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('695', '130BC0327453', '李雪峰32500', '32500', '销售', '0', '2953', '互联网板块-房产-重庆-重庆-重庆-重庆-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('696', '31D6FDADBBE8', '张丽35709', '35709', '销售', '0', '2953', '互联网板块-房产-重庆-重庆-重庆-重庆-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('697', 'D96228B73D26', '雷华娟', '36238', '销售', '0', '2953', '互联网板块-房产-重庆-重庆-重庆-重庆-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('698', 'D961B0C3BBB0', '殷浩然', '54808', '销售', '0', '2953', '互联网板块-房产-重庆-重庆-重庆-重庆-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('699', '7B4CB8A60BA2', '黄章印', '39559', '销售', '0', '2953', '互联网板块-房产-重庆-重庆-重庆-重庆-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('700', 'ED7F59DAD522', '万利娟', '31226', '销售', '0', '2962', '互联网板块-房产-重庆-重庆-重庆-重庆-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('701', '6C6ABAD743C8', '冉茜', '54115', '销售', '0', '2962', '互联网板块-房产-重庆-重庆-重庆-重庆-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('702', '0E8E2603881B', '包伟', '35220', '销售', '0', '2962', '互联网板块-房产-重庆-重庆-重庆-重庆-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('703', '6374303BD332', '杨姝', '39500', '销售', '0', '2962', '互联网板块-房产-重庆-重庆-重庆-重庆-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('704', '71C33D658418', '黄展', '39555', '销售', '0', '2962', '互联网板块-房产-重庆-重庆-重庆-重庆-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('705', 'C9523C0D14F3', '李红', '38336', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('706', '2D14BD07CE62', '宫婷', '33250', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('707', 'FBB45E1B63C9', '周全', '32530', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('708', 'B809D62637B8', '张冷蓓', '32144', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('709', 'B3DDC0D3B56D', '张媛', '32668', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('710', '99B605867451', '王琴', '31501', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('711', 'C61650CAD777', '肖屹洲', '31007', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('712', 'DDC26B6E774E', '卜慧君', '30298', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('713', '5AFFED248444', '卜慧君32807', '32807', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('714', 'BB9E964353B7', '王帅', '38410', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('715', 'DF4A532BC122', '王超38427', '38427', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('716', '07FCD4984292', '董玉强', '50538', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('717', '2CF774F03083', '文舒', '50549', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('718', 'FF5576D39E81', '王晶睛', '38455', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('719', '2FE2EE2BC236', '祝捷', '32670', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('720', 'D2B0C7736517', '陈睿', '31202', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('721', '05837B48DFDB', '肖挺', '36045', '销售', '0', '2966', '互联网板块-房产-武汉-武汉-武汉-武汉-销售五组（停）-组员');
INSERT INTO `oa_orgstr` VALUES ('722', '371F008B7BC0', '何大晶', '36560', '销售', '0', '2966', '互联网板块-房产-武汉-武汉-武汉-武汉-销售五组（停）-组员');
INSERT INTO `oa_orgstr` VALUES ('723', '1D6320857CDC', '杨文娟', '33677', '销售', '0', '2966', '互联网板块-房产-武汉-武汉-武汉-武汉-销售五组（停）-组员');
INSERT INTO `oa_orgstr` VALUES ('724', '6F5D27A87B44', '郭雯', '38308', '销售', '0', '2968', '互联网板块-房产-武汉-武汉-武汉-武汉-销售六组（停）-组员');
INSERT INTO `oa_orgstr` VALUES ('725', 'F76EDA006781', '张艳星', '38345', '销售', '0', '2968', '互联网板块-房产-武汉-武汉-武汉-武汉-销售六组（停）-组员');
INSERT INTO `oa_orgstr` VALUES ('726', 'CE35FFEE00D6', '张辉', '38496', '销售', '0', '2968', '互联网板块-房产-武汉-武汉-武汉-武汉-销售六组（停）-组员');
INSERT INTO `oa_orgstr` VALUES ('727', '3840C24B6125', '罗磊', '37367', '销售', '0', '2970', '互联网板块-房产-武汉-武汉-武汉-武汉-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('728', '737D1E8F3599', '陈宁', '38393', '销售', '0', '2970', '互联网板块-房产-武汉-武汉-武汉-武汉-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('729', 'AA974D4E3821', '付章?', '38482', '销售', '0', '2970', '互联网板块-房产-武汉-武汉-武汉-武汉-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('730', 'D61D12A543B4', '秦莎菲', '38495', '销售', '0', '2970', '互联网板块-房产-武汉-武汉-武汉-武汉-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('731', '4F84098915B8', '徐崇文', '38469', '销售', '0', '2970', '互联网板块-房产-武汉-武汉-武汉-武汉-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('732', 'E33342925F55', '赵颖', '50500', '销售', '0', '2970', '互联网板块-房产-武汉-武汉-武汉-武汉-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('733', 'E4B9B92ADF38', '陈仁', '36044', '销售', '0', '2970', '互联网板块-房产-武汉-武汉-武汉-武汉-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('734', '6886C9BB8A73', '孙黎', '31699', '销售', '0', '2970', '互联网板块-房产-武汉-武汉-武汉-武汉-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('735', 'E64D276F6186', '文珣', '38348', '销售', '0', '2971', '互联网板块-房产-武汉-武汉-武汉-武汉-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('736', '9A58F7383FC0', '王璐', '38474', '销售', '0', '2971', '互联网板块-房产-武汉-武汉-武汉-武汉-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('737', 'D61D12A543B4', '秦莎菲', '38495', '销售', '0', '2971', '互联网板块-房产-武汉-武汉-武汉-武汉-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('738', 'E3334B1819F7', '凌媛', '50501', '销售', '0', '2971', '互联网板块-房产-武汉-武汉-武汉-武汉-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('739', '0BDBA525864D', '冉超', '33219', '销售', '0', '2971', '互联网板块-房产-武汉-武汉-武汉-武汉-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('740', '8223CB2D84A6', '高晶', '32865', '销售', '0', '2971', '互联网板块-房产-武汉-武汉-武汉-武汉-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('741', '6C3BFE7F38C8', '贺微', '50516', '销售', '0', '2971', '互联网板块-房产-武汉-武汉-武汉-武汉-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('742', 'AE9269310C2C', '易丹', '32062', '销售', '0', '2971', '互联网板块-房产-武汉-武汉-武汉-武汉-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('743', '7964434680ED', '杨光', '31134', '销售', '0', '2971', '互联网板块-房产-武汉-武汉-武汉-武汉-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('744', 'CCE34C557DB3', '路燕', '31962', '销售', '0', '2971', '互联网板块-房产-武汉-武汉-武汉-武汉-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('745', '5E92F3645BF1', '丁峥嵘', '31273', '销售', '0', '2975', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('746', '4268B2B551AB', '汪青青', '30968', '销售', '0', '2975', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('747', 'D0C4B0D99DD6', '吴晨雷', '53509', '销售', '0', '2975', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('748', 'A957B58879A4', '朱能浩', '39660', '销售', '0', '2975', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('749', '9643EB594781', '华夏', '35023', '销售', '0', '2975', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('750', '8CE66F1CF0EA', '赵丹', '32722', '销售', '0', '2975', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('751', '91316BE42088', '仇正冬', '51764', '销售', '0', '2975', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('752', '77DC8A9D02C5', '周智', '36774', '销售', '0', '2975', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('753', '192A603AD0A8', '华国梁', '53565', '销售', '0', '2975', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('754', 'C29AB94F035F', '吴玲君', '31155', '销售', '0', '2975', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('755', '398A25A9AEB7', '周威', '31088', '销售', '0', '2975', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('756', '62E79D898048', '赵晓阳', '35486', '销售', '0', '2983', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('757', '0559122CA044', '刘顺鹏', '35696', '销售', '0', '2983', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('758', 'CEACADA94DA6', '蔡东宇', '35488', '销售', '0', '2983', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('759', '97078D19C910', '郭建龙', '36797', '销售', '0', '2983', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('760', 'AA2ABD05E146', '张林兴', '53254', '销售', '0', '2983', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('761', '06959778DB18', '杜建章', '53289', '销售', '0', '2983', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('762', 'BDD92D948A61', '许媛', '32453', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('763', '0617F4A67103', '臧海', '35634', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('764', '4D117362B308', '王晶晶33044', '33044', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('765', '7F1935C2114D', '王海波', 'W1012', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('766', '1FC513EC7E27', '刘芸', '32439', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('767', '63D1EB757A48', '张雯璐', '33048', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('768', '2C9AF1CBDA3C', '王萍', '32451', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('769', '0DE804267D9A', '宋彦', '32456', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('770', 'D70393A03C64', '王明坤', '32463', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('771', '0C31FA17D4F1', '邢媛', '30740', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('772', '7F0F71E61971', '杨杨', '32449', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('773', '18EE3F10A186', '王亚波', '38824', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('774', 'D3A872EF606E', '李达', '32812', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('775', '5D0066DCC273', '杨佳艺', '38848', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('776', '5722986DD278', '张岩', '50980', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('777', '25273B731D84', '卢恒', '32450', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('778', '88055F4C2624', '王海波32474', '32474', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('779', '555B564CB075', '王小磊', '32406', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('780', '0717C952DFDC', '张跃31947', '31947', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('781', '29FC443A3D62', '张羽泽', '33415', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('782', '26AD4BBD3F33', '孔倩', '30322', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('783', 'BFFDF19596FE', '李刚', 'W1017', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('784', '89E4B622ACB9', '姜丹', 'W1005', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('785', '3BC9B1CFED40', '廉础宁', '32445', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('786', '628F34B15B64', '牛国平', '32437', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('787', '04140A866CE7', '宋爽', '31621', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('788', '5BDDA361E5FA', '李睿娜', '32452', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('789', 'C8879FDE50D6', '沈彪', '30735', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('790', 'CDD95EA73DD8', '北京商拓', 'B9702', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('791', 'E5FBF7E707BA', '郭从谏', '31643', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('792', '904D36E9E508', '王辉', '32434', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('793', '827D58EA94C9', '石秀兵', '32438', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('794', '8702B3687636', '南宝玲32470', '32470', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('795', '8BFAE8F145D0', '韩峰', '30043', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('796', '08024BCF45F0', '李作', '32448', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('797', '13748242A406', '杨皓月', '32435', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('798', 'E48625ABB14E', '曹爱民', '30498', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('799', '637F1160CC5A', '刘艾', '32076', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('800', 'E6AA49AF8D5D', '张秋瑾', '32436', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('801', '8777BDAAC8EC', '刘艳英', '32464', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('802', '06177BE7AAD6', '朱宇', '32402', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('803', '6E14AA0B5138', '丰宝超', '39855', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('804', '9F685F151191', '李金强', '32457', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('805', '056295DBEE20', '谭钠丹', '37319', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('806', 'E65031A11659', '万晴', '38781', '销售', '0', '2993', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('807', '54114A2F04F3', '金剑锋', '38711', '销售', '0', '2993', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('808', 'FB38E7970E50', '林丹', '30955', '销售', '0', '2993', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('809', '3280626DD6E7', '苟敏菲', '31414', '销售', '0', '2993', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('810', '234C8159B475', '王瑛浔', '36926', '销售', '0', '2993', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('811', '7A3752969533', '曹丽丽', '31390', '销售', '0', '2993', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('812', 'F791A3A14F52', '张卉', '36681', '销售', '0', '2993', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('813', 'C7A0E57C2511', '常琦', '36565', '销售', '0', '2993', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('814', 'E6500A474328', '桂玲', '38780', '销售', '0', '2993', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('815', 'C76F25077F71', '徐际涵', '50760', '销售', '0', '2993', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('816', '483269312EC6', '杜楠', '50848', '销售', '0', '2993', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('817', 'C76ECF6DCF87', '温彪', '50758', '销售', '0', '2993', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('818', 'A6F9A3D0275F', '邹志环', '35886', '销售', '0', '2993', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('819', 'D6C9890DF6C9', '王雪', '50880', '销售', '0', '2993', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('820', 'FF9F3E1AC6A8', '卢正君', '50886', '销售', '0', '2993', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('821', 'EF9F5CCE21F1', '刘雅丽', '38772', '销售', '0', '2995', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('822', 'EF9FD2BC59D5', '管苏诘', '33213', '销售', '0', '2995', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('823', 'DF3F2D1549DD', '杜鹏飞', '31123', '销售', '0', '2995', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('824', '2F48B34D70F8', '赵淑平34726', '34726', '销售', '0', '2995', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('825', '5D10DDC9CE1B', '周騄俊', '32524', '销售', '0', '2995', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('826', 'CF43133377B2', '胡新楠', '33168', '销售', '0', '2995', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('827', 'C296B339FB81', '测试帐号', 'F0000-测试', '销售', '0', '2995', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('828', 'E32844418927', '吕梦靥', '30949', '销售', '0', '2995', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('829', '30D4B6AACA15', '孙娴', '50845', '销售', '0', '2995', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('830', '59A7FA669559', '申姣姣', '50853', '销售', '0', '2995', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('831', '3D842E2D67C6', '金丹', '60244', '销售', '0', '2995', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('832', '5BA4DAC51F98', '庄炜樱', '38717', '销售', '0', '2995', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('833', 'CC255FA22559', '殷瑛', '32982', '销售', '0', '2995', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('834', '7F9604201211', '王泽青', '50857', '销售', '0', '2995', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('835', '8AE3EFB2E963', '李菊玲', '30946', '销售', '0', '2997', '互联网板块-房产-上海-上海-上海-上海-销售一部3组（停用）-组员');
INSERT INTO `oa_orgstr` VALUES ('836', '02D8E365432D', '姜依萌', '30960', '销售', '0', '2997', '互联网板块-房产-上海-上海-上海-上海-销售一部3组（停用）-组员');
INSERT INTO `oa_orgstr` VALUES ('837', '81D474EA9500', '施炜', '38737', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('838', '6373C6858841', '陈震', '35215', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('839', '4534EA29EBA8', '孙可仰', '33242', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('840', 'FE73FAE450E0', '李明峰', '31270', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('841', 'C6773F2273FD', '路荣华', '31575', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('842', '053548A44C54', '李慧洁', '32775', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('843', '254D5603BD51', '胡翌飞', '31269', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('844', '620E5FA4EE01', '符晨晨', '32916', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('845', '2558E543D849', '董俊', '38798', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('846', '81D3F42E6B71', '后玲', '38725', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('847', '9143A3BCA257', '徐俊', '50809', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('848', '63186C81DD64', '陈婉菲', '50803', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('849', '3CD9AB627B88', '陈勇', '50790', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('850', '54085291D8C2', '陈剑秋', '50852', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('851', 'CDB1257526D9', '王晴波', '50876', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('852', '41969174B3A9', '李娜37416', '37416', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('853', '3CC733050AA0', '冯子安', '50765', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('854', 'AFF99DBA9375', '刘冬敏', '39748', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('855', 'FA03685B0E27', '陈腾飞', '38773', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('856', '4293C9C81868', '钱凤', '37316', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('857', '650A1E2CE305', '张静懿', '38715', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('858', 'F7918DC15E64', '高玉贵', '37126', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('859', 'C1D299AC09F7', '蒋一辰', '31958', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('860', '4519134445CB', '殷雅薇', '31974', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('861', '59594FEFA2BA', '姜敏', '31780', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('862', '0214ADFA769F', '王汉徵', '30944', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('863', '59D03722C7BC', '赵敏', '30948', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('864', '3A781B960148', '易居上海', 'B9908', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('865', 'B11332FE31E1', '陆晓松', '30963', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('866', 'D4C14142C2AE', '郭常林', '31602', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('867', '22CCC8926752', '江一然', '30959', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('868', '0430D80FA8A6', '毛玫琳', '50761', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('869', '281C477EE914', '陈教亮', '39783', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('870', 'E43F37CB48DB', '罗龙', '50866', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('871', '9E0D6B2E32A0', '崔国力', '50871', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('872', '1B95E2855F15', '姜辰明', '50834', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('873', '3D3CD65719C9', '袁麟', '37195', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('874', '5256EB96CB71', '郑羡于', '38701', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('875', 'D2E9A5F7652C', '袁杰', '31804', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('876', 'B2573B83C3E6', '王伟伟', '39722', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('877', 'FA01CB603A44', '陈曼', '38783', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('878', 'FA0108ACB945', '耿俪姣', '38763', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('879', 'BA023C3CB2B2', '戴玮', '50728', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('880', '0C31648AB4D4', '刘云鹏', '38734', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('881', '72666D343738', '胡黎', '31029', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('882', '998731A871C3', '李正洁', '30952', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('883', 'D5AC9D99065A', '葛岚', '30950', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('884', '2E984507A06A', '杨柳', '30951', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('885', '6E5BD2032751', '倪娜38700', '38700', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('886', '8FEA42C415B2', '陆春燕', '32716', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('887', '647F668AD1F6', '费雯丽', '50703', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('888', 'A30E24722167', '葛彩云', '50872', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('889', 'A8D505A65F96', '李玉楠', '50823', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('890', 'DFEA6865755D', '茅一欣', '30954', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('891', '9ADB000B6613', '王丽清', '50736', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('892', '9ADBAC157156', '赵法巍', '50740', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('893', 'A8D50ED22706', '陆方清', '50800', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('894', 'A3DA112098C4', '李书平', '33350', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('895', 'FF9F4D1404C8', '徐亚辉', '50897', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('896', '5F4ADD501408', '孙一梦', '39714', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('897', '22A3082D5882', '马艺瑄', '39782', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('898', '6C4EB1020407', '叶海燕', '50717', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('899', '042FFB4EE395', '殷亚利', '50767', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('900', '1696B694BC13', '蒋竺君', '50772', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('901', '742F65D964F4', '陈滔', '31603', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('902', '6E59D47AA276', '姜甄侃', '50891', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('903', '294F6D998029', '袁华亮', '39792', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('904', '647F7462E116', '王星城', '50795', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('905', 'C80346D59294', '朱敏杰', '38764', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('906', '6EE1CAE5E141', '杨艳', '50782', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('907', 'EF2F6EEF2F33', '杨婷', '32594', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('908', 'ADA687659E26', '赵永嗣', '33243', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('909', '26EE2008A209', '沈吉媛', '53905', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('910', 'FF556E632C84', '徐影50899', '50899', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('911', 'DD663512CE92', '秦溢文', '37080', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('912', 'ADF08FB2C7C3', '侯如艳', '50770', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `oa_orgstr` VALUES ('913', 'D1AB671224A9', '杨伊宁', '31601', '销售', '0', '3011', '互联网板块-房产-上海-上海-上海-上海-销售三部3组（停用）-组员');
INSERT INTO `oa_orgstr` VALUES ('914', '9B8C56EC447E', '魏大朋', '34655', '销售', '0', '3013', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('915', 'A2B5290BB495', '徐洁38752', '38752', '销售', '0', '3013', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('916', '2B5F1D8F7667', '范阳阳', '36516', '销售', '0', '3013', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('917', '7BA488AFB782', '周鹏', '36775', '销售', '0', '3013', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('918', 'FF4DCF5ED048', '潘勇钢', '37145', '销售', '0', '3013', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('919', 'CD15C8B2FA98', '周云佳', '39764', '销售', '0', '3013', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('920', '69FE840FB547', '罗杰', '51749', '销售', '0', '3013', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('921', '44F7A7199B34', '李煦泉', '51729', '销售', '0', '3013', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('922', '226D7A727342', '王琳琳', '53543', '销售', '0', '3013', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('923', 'DB43030167F4', '孙鹏', '54855', '销售', '0', '3013', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('924', 'BA714ED20A39', '王文', '51708', '销售', '0', '3013', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('925', '0FD5FD5B0DB0', '刘海博', '54868', '销售', '0', '3013', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('926', 'E5412174DE64', '徐海荣', '54938', '销售', '0', '3013', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('927', '2B6CA5246C55', '卜阳', '54879', '销售', '0', '3013', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('928', '1BC721B39CB5', '潘扬扬', '35409', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('929', '6E40606AAC53', '刘沫含', '38837', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('930', '03CF727C03D0', '李蕾', '53138', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('931', '68B820B4B2A8', '张浩39850', '39850', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('932', '68B97E9F5E20', '姜桐', '39849', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('933', '26B7D10DDF41', '张菲', '50959', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('934', '6E3E99262295', '杨扬', '38836', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('935', '166319E9221C', '李征', '35408', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('936', '03CF5EE80394', '蒋春华', '53137', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('937', '27CB4BA85627', '陈智', '53177', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('938', '71DF149F0559', '李伟51048', '51048', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('939', '814ADC3A6AF8', '李超53232', '53232', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('940', '35F86AD37036', '宣艳丽', '53281', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('941', '41A24A5EADE6', '李明', '55166', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('942', '41A250BBEA77', '王星龙', '55164', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('943', '67C2E03FE1D0', '姜旭', '55176', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('944', 'C992A133C682', '梁涛', '55241', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('945', 'D74A119E86A7', '高超', '52696', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('946', '160C5A5E8CB1', '王荣', '55284', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('947', '41A256B43609', '刘璐雨', '55165', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('948', '44EB4E8F7409', '尹士臣', '50987', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('949', '44EB64BB7214', '郝雷', '50973', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('950', '4BBD4A6F17D3', '朱静50994', '50994', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('951', '814A937BBCF5', '李斌', '53238', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('952', '411246657FE7', '何杰', '32458', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('953', '2934F1C88BE4', '可佳', '35859', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('954', '347F36381810', '刘晶', '30791', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('955', '5421C6CC7631', '刘燕', '30913', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('956', 'E66AF7BE9A5D', '常杰', '30846', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('957', 'BE475FC7C4F5', '韩金', '33598', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('958', '1A5F15429D6B', '张晓丹', '31344', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('959', 'C5F2DD5FA217', '李国强', '32650', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('960', '71C909350127', '龚建辉', '30075', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('961', '766148DBA3ED', '李秀玲', '30789', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('962', '99FEC90860B2', '刘翠', '30083', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('963', 'DF7BE55332BE', '从林', '31651', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('964', 'D691A88D4866', '完颜先锋', '30076', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('965', '96BE4CFF05C6', '李立舫', '32581', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('966', '9BCC85C19F20', '裴禹龙', '30908', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('967', 'B372993BDA02', '邢杰', '32554', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('968', 'CFFEAFB43AC6', '林雷', '35248', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('969', 'A5B5FB050065', '张超37925', '37925', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('970', '5F49CE94A451', '刘佳37983', '37983', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('971', '44AE0825D391', '满育妃', '38082', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('972', '881C692E76D7', '曹娉', '50215', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('973', '981939C4A8C7', '陈昆', '50220', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('974', '1BCF66F0A761', '靳凯', '50298', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('975', '9863EF1677E7', '李昕', '36813', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('976', '9D7D5AEB6C23', '刘洺妤', '35352', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('977', 'D61F0E2D10B2', '刘燕宁', '30814', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('978', '05D913E735D0', '张培青', '38029', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('979', 'E916708F97A4', '刘佳37952', '37952', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('980', 'B55EFABA9C61', '王冠', '32205', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('981', '05D900C0BC59', '王亮', '38028', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('982', 'EA37F1B57A9B', '李心如', '30844', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('983', 'D0D860400002', '孙兼善', '50261', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('984', 'FE7D52DFF943', '徐惠慧', '31713', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('985', '11AF251371CF', '董晶婕', '32510', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('986', 'DB49B34C4844', '李智', '30237', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('987', '89FD456A0EE0', '段谟洪', '30057', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('988', '6C78F274F98C', '魏立佳', '30097', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('989', '711458C6B979', '焦柳鸣', '30101', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('990', 'BE1463C6FACE', '姚莉莉', '30792', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('991', '4F9E2A9126D2', '曾蕊', '30815', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('992', 'F8AA44E18F8C', '石媛媛', '32221', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('993', 'A1D1BAE0C66E', '马爽', '30850', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('994', '0091E2DCCA58', '石雨辰', '35825', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('995', '05361A90340D', '罗思源', '30543', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('996', '17A4EACC2445', '张欣', '50294', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('997', '440A31BBF064', '张羽', '36541', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('998', 'E9164922C200', '刘鹏', '37954', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('999', 'F1036695B3C0', '王启明37958', '37958', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1000', '4B8C13E75F30', '张鑫龙', '38075', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1001', '69FF6E5ACF51', '冯楠', '50207', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1002', 'BD0E8909F355', '李梦龙', '50241', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1003', '69FF587D7311', '凌洪宇', '50206', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1004', 'C7718437BC40', '李怡婷', '50253', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1005', 'EACD237D3437', '汤南杉', '50278', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1006', '600FC219BDD0', '李靖赟', '53620', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1007', 'B08EC5252847', '曹凤津', '56671', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1008', 'EE44F0C0C890', '吕金炎', '56693', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1009', 'EE44F57DECC1', '王岩', '56683', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1010', '8ECD3B760594', '闫靖', '37996', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1011', 'C7716DF0D164', '周利杨', '50255', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1012', 'EE44E9E5FCD1', '宋坤', '56691', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1013', '08E518C07E95', '李正也', '37125', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1014', '5EF2AD50AB57', '张磊53688', '53688', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1015', 'E81B82809CB3', '宋景然', '30848', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1016', 'EEEFF851AD53', '闫佳庆', '30911', '销售', '0', '3025', '互联网板块-房产-华北区-华北区-天津-天津-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('1017', 'F2232B0BEBF1', '赵志虹', '36590', '销售', '0', '3033', '互联网板块-房产-北方区-北方-太原-太原-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1018', '3DBBE24BBC64', '阎涛', '36579', '销售', '0', '3033', '互联网板块-房产-北方区-北方-太原-太原-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1019', '11DB0653BC57', '方炜', '37964', '销售', '0', '3033', '互联网板块-房产-北方区-北方-太原-太原-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1020', 'D628C04390E2', '李洁', '38016', '销售', '0', '3033', '互联网板块-房产-北方区-北方-太原-太原-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1021', '8137B5ECE7D6', '路瑞健', '55178', '销售', '0', '3033', '互联网板块-房产-北方区-北方-太原-太原-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1022', '9F7F5A101049', '赵丹55216', '55216', '销售', '0', '3033', '互联网板块-房产-北方区-北方-太原-太原-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1023', 'E0223683B2E3', '周志敏', '55239', '销售', '0', '3033', '互联网板块-房产-北方区-北方-太原-太原-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1024', 'FB618920A325', '杨磊', '55273', '销售', '0', '3033', '互联网板块-房产-北方区-北方-太原-太原-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1025', '3DBB9F44F162', '周毅', '36578', '销售', '0', '3033', '互联网板块-房产-北方区-北方-太原-太原-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1026', '41B890FF599F', '艾莲', '31339', '销售', '0', '3035', '互联网板块-房产-华北区-华北区-济南-济南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1027', 'F60B6DE15E06', '王鹏37921', '37921', '销售', '0', '3035', '互联网板块-房产-华北区-华北区-济南-济南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1028', 'B81B055CD4CD', '崔晓明', '34386', '销售', '0', '3035', '互联网板块-房产-华北区-华北区-济南-济南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1029', '70163255B630', '林鹤薇', '35582', '销售', '0', '3035', '互联网板块-房产-华北区-华北区-济南-济南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1030', '64A8843424CA', '郑勇山', '33206', '销售', '0', '3035', '互联网板块-房产-华北区-华北区-济南-济南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1031', '3A89CA5B45FA', '唐堂', '31010', '销售', '0', '3035', '互联网板块-房产-华北区-华北区-济南-济南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1032', '732D65807138', '郝东宁', '31261', '销售', '0', '3035', '互联网板块-房产-华北区-华北区-济南-济南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1033', '49D31E61B507', '李志浩', '53678', '销售', '0', '3035', '互联网板块-房产-华北区-华北区-济南-济南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1034', 'B82C7AC1B6E3', '刘芳50214', '50214', '销售', '0', '3035', '互联网板块-房产-华北区-华北区-济南-济南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1035', '295959FCE2FD', '张晶晶', '34385', '销售', '0', '3035', '互联网板块-房产-华北区-华北区-济南-济南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1036', '5886E150C793', '刘子钰', '38077', '销售', '0', '3035', '互联网板块-房产-华北区-华北区-济南-济南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1037', '2AA09B46C2C4', '秦超', '38058', '销售', '0', '3035', '互联网板块-房产-华北区-华北区-济南-济南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1038', '5886C9D0E261', '王淼', '38027', '销售', '0', '3035', '互联网板块-房产-华北区-华北区-济南-济南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1039', 'C9D83E530280', '颜丙亮', '33972', '销售', '0', '3035', '互联网板块-房产-华北区-华北区-济南-济南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1040', '1260843BCE54', '石静', '32667', '销售', '0', '3037', '互联网板块-房产-华北区-华北区-济南-济南-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1041', 'C5F9135C6E00', '陈艳琳', '31725', '销售', '0', '3037', '互联网板块-房产-华北区-华北区-济南-济南-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1042', 'AAA5F53E98F2', '吴善强', '30757', '销售', '0', '3037', '互联网板块-房产-华北区-华北区-济南-济南-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1043', 'ECB69AF65DCE', '张卫东', '30211', '销售', '0', '3037', '互联网板块-房产-华北区-华北区-济南-济南-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1044', '512291E3C137', '曹龙', '35003', '销售', '0', '3037', '互联网板块-房产-华北区-华北区-济南-济南-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1045', 'BB781AB45DF8', '郭雪婷', '32348', '销售', '0', '3037', '互联网板块-房产-华北区-华北区-济南-济南-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1046', '7B2F63906A84', '杨立鑫', '35751', '销售', '0', '3037', '互联网板块-房产-华北区-华北区-济南-济南-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1047', '47D48FA425E0', '姚春凯', '30874', '销售', '0', '3037', '互联网板块-房产-华北区-华北区-济南-济南-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1048', '4149BE6B0AB4', '董雪青', '37325', '销售', '0', '3039', '互联网板块-房产-华北区-华北区-济南-济南-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1049', 'D63CB10D9515', '张立腾', '37927', '销售', '0', '3039', '互联网板块-房产-华北区-华北区-济南-济南-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1050', '0919EDC0B736', '刘奇奇', '36082', '销售', '0', '3039', '互联网板块-房产-华北区-华北区-济南-济南-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1051', '9DD6AE519F73', '张金', '37919', '销售', '0', '3039', '互联网板块-房产-华北区-华北区-济南-济南-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1052', '96CAD66265B3', '胡娜娜35005', '35005', '销售', '0', '3039', '互联网板块-房产-华北区-华北区-济南-济南-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1053', '2016C5F60599', '陈丽萍', '35353', '销售', '0', '3042', '互联网板块-房产-东部区-威海-威海-威海');
INSERT INTO `oa_orgstr` VALUES ('1054', 'A8FF7630B8A0', '丁良腾', '33165', '销售', '0', '3042', '互联网板块-房产-东部区-威海-威海-威海');
INSERT INTO `oa_orgstr` VALUES ('1055', 'BFC3210ABA90', '杨颂', '37913', '销售', '0', '3042', '互联网板块-房产-东部区-威海-威海-威海');
INSERT INTO `oa_orgstr` VALUES ('1056', '63A54BA3DBB0', '郭栋', '36757', '销售', '0', '3042', '互联网板块-房产-东部区-威海-威海-威海');
INSERT INTO `oa_orgstr` VALUES ('1057', 'EAD1A5E582C7', '杨欣', '32613', '销售', '0', '3042', '互联网板块-房产-东部区-威海-威海-威海');
INSERT INTO `oa_orgstr` VALUES ('1058', '44EDDDD21464', '王晨阳', '38083', '销售', '0', '3042', '互联网板块-房产-东部区-威海-威海-威海');
INSERT INTO `oa_orgstr` VALUES ('1059', '0C805A063B49', '王忠库', '31492', '销售', '0', '3042', '互联网板块-房产-东部区-威海-威海-威海');
INSERT INTO `oa_orgstr` VALUES ('1060', '69DA15B83D78', '王世范', '37960', '销售', '0', '3042', '互联网板块-房产-东部区-威海-威海-威海');
INSERT INTO `oa_orgstr` VALUES ('1061', '222DD30A1C19', '张庆昕', '53602', '销售', '0', '3042', '互联网板块-房产-东部区-威海-威海-威海');
INSERT INTO `oa_orgstr` VALUES ('1062', '429EEA2EB621', '徐鹏飞', '55526', '销售', '0', '3042', '互联网板块-房产-东部区-威海-威海-威海');
INSERT INTO `oa_orgstr` VALUES ('1063', '0A67ED63738E', '孙志鑫', '32612', '销售', '0', '3042', '互联网板块-房产-东部区-威海-威海-威海');
INSERT INTO `oa_orgstr` VALUES ('1064', '2436D8E7F959', '庄福磊', '37904', '销售', '0', '3042', '互联网板块-房产-东部区-威海-威海-威海');
INSERT INTO `oa_orgstr` VALUES ('1065', 'AA87E518312C', '丛丽萍', '30875', '销售', '0', '3042', '互联网板块-房产-东部区-威海-威海-威海');
INSERT INTO `oa_orgstr` VALUES ('1066', '26A4FCDACC05', '韩睿', '36076', '销售', '0', '3044', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户1组-组员');
INSERT INTO `oa_orgstr` VALUES ('1067', '26A5183D8149', '王思梦', '36717', '销售', '0', '3044', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户1组-组员');
INSERT INTO `oa_orgstr` VALUES ('1068', 'F07DE1695CBC', '李俊杰', '31536', '销售', '0', '3044', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户1组-组员');
INSERT INTO `oa_orgstr` VALUES ('1069', '20F05E37EB53', '孔芳', '35198', '销售', '0', '3044', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户1组-组员');
INSERT INTO `oa_orgstr` VALUES ('1070', '5E850CF95278', '于晓璐', '32220', '销售', '0', '3044', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户1组-组员');
INSERT INTO `oa_orgstr` VALUES ('1071', '4609F83FCA1E', '刘建辉', '30823', '销售', '0', '3044', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户1组-组员');
INSERT INTO `oa_orgstr` VALUES ('1072', 'A67A293374BB', '李延雷', '31596', '销售', '0', '3044', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户1组-组员');
INSERT INTO `oa_orgstr` VALUES ('1073', 'C296B339FB81', '测试帐号', 'F0000-测试', '销售', '0', '3044', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户1组-组员');
INSERT INTO `oa_orgstr` VALUES ('1074', '0F7B13FF6C0F', '魏胜震', '30764', '销售', '0', '3044', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户1组-组员');
INSERT INTO `oa_orgstr` VALUES ('1075', '5A4094A0354E', '郭佳', '33770', '销售', '0', '3044', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户1组-组员');
INSERT INTO `oa_orgstr` VALUES ('1076', '3408FA908A28', '孙艳彬', '35865', '销售', '0', '3044', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户1组-组员');
INSERT INTO `oa_orgstr` VALUES ('1077', '321A3AB83B73', '王鹏33587', '33587', '销售', '0', '3044', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户1组-组员');
INSERT INTO `oa_orgstr` VALUES ('1078', '12C56672264E', '韩运双', '32285', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1079', 'C33386B43A64', '宗纪宇', '33890', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1080', '4A11E07A2EFE', '唐晓辉', '34792', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1081', '91C3598BA7C9', '张正宇', '35823', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1082', '191B79F3BC11', '刘磊35745', '35745', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1083', '407D8A6AC123', '杨光33311', '33311', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1084', '80C6F77C2A3B', '岳君', '35351', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1085', 'D49A95ED4034', '谢文雅', '33891', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1086', 'C551953DFF25', '张丹凤', '32294', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1087', '10E6F02D4438', '孙海英', '32288', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1088', 'B957C429AD0B', '邹晓宁', '33162', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1089', '3126BC6D1DA0', '吴建平', '37772', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1090', '31269DA46578', '刘莹滨', '37363', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1091', '35E9E9B4F901', '王政37832', '37832', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1092', '8784DE11D175', '曹鹏', '35744', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1093', '8747F92100E6', '王晓玲', '32290', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1094', '312684B6FCC7', '王程', '36951', '销售', '0', '3048', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1095', '68473D6394EC', '孙艳婷', '35746', '销售', '0', '3048', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1096', '74EDD8D8AFA3', '刘天博', '36770', '销售', '0', '3050', '互联网板块-房产-东北区-东北区-长春-长春-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1097', '9DB40BD6F458', '苏亚明', '37777', '销售', '0', '3050', '互联网板块-房产-东北区-东北区-长春-长春-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1098', '8E18695DF458', '陈奥南', '32652', '销售', '0', '3050', '互联网板块-房产-东北区-东北区-长春-长春-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1099', 'CD18AC34FE32', '冯超', '37789', '销售', '0', '3050', '互联网板块-房产-东北区-东北区-长春-长春-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1100', '781F24605EE6', '张菁楠', '37882', '销售', '0', '3050', '互联网板块-房产-东北区-东北区-长春-长春-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1101', '40DE44D51815', '彭艳君', '37850', '销售', '0', '3050', '互联网板块-房产-东北区-东北区-长春-长春-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1102', '5C3E64E53CB9', '张钟月', '50117', '销售', '0', '3050', '互联网板块-房产-东北区-东北区-长春-长春-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1103', '94A61241DCF1', '梁雪', '50130', '销售', '0', '3050', '互联网板块-房产-东北区-东北区-长春-长春-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1104', '3418AB03A577', '黄浩32949', '32949', '销售', '0', '3050', '互联网板块-房产-东北区-东北区-长春-长春-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1105', '22AF759494B7', '曲楠', '37756', '销售', '0', '3052', '互联网板块-房产-大连-大连-大连-大连-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1106', '0F81DF41D160', '刘宏亭', '52113', '销售', '0', '3052', '互联网板块-房产-大连-大连-大连-大连-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1107', '12EEBC7A7E19', '闫洪亮', '30540', '销售', '0', '3052', '互联网板块-房产-大连-大连-大连-大连-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1108', 'BF948D07A3C7', '姜鉴航', '37720', '销售', '0', '3052', '互联网板块-房产-大连-大连-大连-大连-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1109', 'B2D4FE6D47DB', '朱健', '32993', '销售', '0', '3054', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1110', '9DC6E6048EE0', '秦琳', '38503', '销售', '0', '3054', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1111', '7066A2ECF2BB', '周威34646', '34646', '销售', '0', '3054', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1112', 'D22A66ED2DC5', '汪力强', '37271', '销售', '0', '3054', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1113', 'BCB6B03F3096', '杨啸笙', '34904', '销售', '0', '3054', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1114', 'EFA1C9785037', '程浩', '32841', '销售', '0', '3054', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1115', '48CC336E84D5', '陈玲', '50652', '销售', '0', '3054', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1116', 'A5D8AF577257', '薛志平34303', '34303', '销售', '0', '3054', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1117', '59054F7AB2D7', '张晓杭', '30867', '销售', '0', '3054', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1118', 'D5A8051D4F58', '吴元辉', '38678', '销售', '0', '3054', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1119', '3D740A18A292', '孙艳霞', '32278', '销售', '0', '3054', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1120', '28CC84522898', '邢庆晨', '32279', '销售', '0', '3056', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1121', 'AF5134FE1794', '蒋建林', '34543', '销售', '0', '3056', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1122', 'C9E4BA017F8E', '陶丽佳', '33956', '销售', '0', '3056', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1123', '9CB6B0B1CC77', '易居杭州', 'B9911', '销售', '0', '3056', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1124', 'E81F1E4D6089', '吴丽丹', '30465', '销售', '0', '3056', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1125', '3E2E5A4AF9C1', '史雨蒙', '50659', '销售', '0', '3056', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1126', '1343E00CD593', '吴妮', '32904', '销售', '0', '3056', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1127', 'FDA4A914CE09', '何平', '34523', '销售', '0', '3056', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1128', '1C07C14FDC92', '董俊杰', '30407', '销售', '0', '3056', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1129', '807765478EA2', '林贤耀', '32490', '销售', '0', '3058', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1130', '9DC6CF180AB4', '徐燕', '38514', '销售', '0', '3058', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1131', 'DE3D9B5291A0', '袁倩', '38535', '销售', '0', '3058', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1132', '42966CE349EB', '马彩红', '31434', '销售', '0', '3058', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1133', 'D2EDD337D1CC', '陈熨', '34647', '销售', '0', '3060', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1134', 'AC3B36B92065', '李蕊', '35496', '销售', '0', '3060', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1135', '6610963D9705', '姜双双', '34769', '销售', '0', '3060', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1136', '657515CBDF99', '冯霁雯', '30866', '销售', '0', '3060', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1137', '7CB8C2AF8138', '凌萍萍', '36773', '销售', '0', '3062', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('1138', '579815B522E5', '单静波', '38562', '销售', '0', '3062', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('1139', '1BCF07A09386', '葛鸿飞', '50644', '销售', '0', '3062', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('1140', 'CE5D2D23EDE2', '洪秋华', '30527', '销售', '0', '3062', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('1141', '34B12A545DA7', '袁铨', '54716', '销售', '0', '3062', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('1142', '0AB0C96E81C9', '凤维维', '54682', '销售', '0', '3062', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('1143', 'FC989C6A48D9', '张营', '38598', '销售', '0', '3062', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('1144', 'D5A9C8E65A26', '章亮', '50625', '销售', '0', '3064', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1145', 'A2B51D086102', '邵思羽', '38699', '销售', '0', '3064', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1146', '6D7A1D606714', '叶靓', '30408', '销售', '0', '3064', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1147', 'CE28DE5FB6C3', '施赟', '30469', '销售', '0', '3066', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1148', '0AB0D2628B97', '江唅', '38660', '销售', '0', '3066', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1149', 'EBCE35267863', '董梅', '32275', '销售', '0', '3066', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1150', '54D92A9A80C4', '郑程元', '38563', '销售', '0', '3066', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1151', 'A2B493BBD0B6', '姜瑜', '50600', '销售', '0', '3066', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1152', '1B149EC00C55', '周马鑫', '38550', '销售', '0', '3068', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售八组-组员');
INSERT INTO `oa_orgstr` VALUES ('1153', '3819B7D5D381', '罗宏达', '32277', '销售', '0', '3068', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售八组-组员');
INSERT INTO `oa_orgstr` VALUES ('1154', '001FEFD5F0F8', '黄洁翔', '32276', '销售', '0', '3068', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售八组-组员');
INSERT INTO `oa_orgstr` VALUES ('1155', 'E77A5AA7D0E4', '张龙37031', '37031', '销售', '0', '3070', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1156', 'E77AC26FCF06', '胡丹丹37081', '37081', '销售', '0', '3070', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1157', '9A61FBB56F44', '王一格', '50609', '销售', '0', '3070', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1158', 'FF7BAA398215', '张雷', '37109', '销售', '0', '3070', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1159', 'D76813EB3139', '詹腾', '50648', '销售', '0', '3070', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1160', '306E71D3C861', '李雪茹', '37197', '销售', '0', '3072', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1161', '3E66E9481175', '朱以晨', '38528', '销售', '0', '3072', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1162', '4B3ADE528215', '蔡丹桂', '38518', '销售', '0', '3072', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1163', '8CCBCCA0F4D9', '王燚', '54748', '销售', '0', '3072', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1164', 'C67964242099', '边王迪', '33347', '销售', '0', '3074', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1165', 'E77AA45A6D47', '黄张37056', '37056', '销售', '0', '3074', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1166', 'FF7B4A784E20', '陈珏翰', '37129', '销售', '0', '3074', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1167', 'AA8BB8778273', '董奇', '34951', '销售', '0', '3075', '互联网板块-房产-浙闽区-浙江区-嘉兴-嘉兴-销售组-销售组');
INSERT INTO `oa_orgstr` VALUES ('1168', '37334D169052', '方伟', '37375', '销售', '0', '3076', '互联网板块-房产-浙闽区-浙江区-嘉兴-嘉兴-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('1169', '01ED04B20845', '张智媛', '38549', '销售', '0', '3076', '互联网板块-房产-浙闽区-浙江区-嘉兴-嘉兴-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('1170', '2203AE8EB1CB', '谢小英', '35955', '销售', '0', '3076', '互联网板块-房产-浙闽区-浙江区-嘉兴-嘉兴-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('1171', '981A2E6C9BF0', '孙洁', '50610', '销售', '0', '3076', '互联网板块-房产-浙闽区-浙江区-嘉兴-嘉兴-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('1172', 'AA8BB8778273', '董奇', '34951', '销售', '0', '3076', '互联网板块-房产-浙闽区-浙江区-嘉兴-嘉兴-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('1173', '71BFCCAA6FD0', '李卫川', '34561', '销售', '0', '3076', '互联网板块-房产-浙闽区-浙江区-嘉兴-嘉兴-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('1174', '3448FFB25177', '李春雷', '36549', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1175', 'DCC078C399D9', '陈述峰', '39135', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1176', '6CA5B9167774', '唐修捷', '39108', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1177', '8F2BF5AC1282', '谢薇', '39234', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1178', '8F2BD29874B7', '张婷39235', '39235', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1179', '344F86C70203', '吕婧譞', '36569', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1180', '2AC2B57C75B4', '吴玉璐', '35753', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1181', 'C42C4F32C80C', '尹雪34883', '34883', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1182', 'F21940CF4C34', '刘娴', '39143', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1183', '50FFB79D9D70', '保思燕', '33004', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1184', 'E1DA1104D927', '李欣', '51374', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1185', 'E1DA1B6A28C7', '姜英丽', '53808', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1186', 'B65625A68204', '邓静', '51337', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1187', '3CD15159CBA7', '曾娇', '51262', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1188', '0BD8969D3F82', '陈林元', '55094', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1189', '0BD89D83C696', '麻芳芳', '55095', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1190', '34491C4FD760', '赵亚锋', '36550', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1191', 'A2B29E0B0C36', '胡彤', '39107', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1192', '468838A66954', '刘正蓉', '51275', '销售', '0', '3092', '互联网板块-房产-联合区-联合区-云南-云南-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1193', '46882270B903', '杨梦琳', '51274', '销售', '0', '3092', '互联网板块-房产-联合区-联合区-云南-云南-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1194', 'FFB211BD27B1', '苏丽君37012', '37012', '销售', '0', '3092', '互联网板块-房产-联合区-联合区-云南-云南-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1195', 'ED3DDE276A99', '黄丝丝37100', '37100', '销售', '0', '3094', '互联网板块-房产-联合区-联合区-广西-南宁-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1196', '8C720CE29343', '麦伟丹', '39222', '销售', '0', '3094', '互联网板块-房产-联合区-联合区-广西-南宁-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1197', '61E3C7AE7632', '王永健', '53858', '销售', '0', '3094', '互联网板块-房产-联合区-联合区-广西-南宁-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1198', '3D22F0193A11', '黄少超', '51253', '销售', '0', '3094', '互联网板块-房产-联合区-联合区-广西-南宁-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1199', 'C44ECB84B6B0', '刘莹', '56271', '销售', '0', '3094', '互联网板块-房产-联合区-联合区-广西-南宁-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1200', 'EC65ADBF20F3', '何凤林', '53811', '销售', '0', '3094', '互联网板块-房产-联合区-联合区-广西-南宁-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1201', 'ED3E37BEF0A7', '陈万燕37101', '37101', '销售', '0', '3096', '互联网板块-房产-联合区-联合区-广西-南宁-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1202', 'ED3E9CE0D333', '文霁37103', '37103', '销售', '0', '3096', '互联网板块-房产-联合区-联合区-广西-南宁-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1203', '3E2EACD711F6', '吴秋月', '53850', '销售', '0', '3096', '互联网板块-房产-联合区-联合区-广西-南宁-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1204', '3E2E8AB6DF18', '雷树彬', '53849', '销售', '0', '3096', '互联网板块-房产-联合区-联合区-广西-南宁-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1205', 'ED3E617C0A24', '何钰琦37102', '37102', '销售', '0', '3098', '互联网板块-房产-联合区-联合区-广西-南宁-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1206', 'AFFBD01A6356', '黄科', '39244', '销售', '0', '3098', '互联网板块-房产-联合区-联合区-广西-南宁-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1207', 'D4231203ECC6', '刘菁37050', '37050', '销售', '0', '3098', '互联网板块-房产-联合区-联合区-广西-南宁-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1208', 'ED3E0DDF2167', '黄念飞37099', '37099', '销售', '0', '3098', '互联网板块-房产-联合区-联合区-广西-南宁-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1209', '4C119EEF19E4', '叶东昇', '56349', '销售', '0', '3098', '互联网板块-房产-联合区-联合区-广西-南宁-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1210', 'FD3F355599FF', '杨宪振34882', '34882', '销售', '0', '3100', '互联网板块-房产-联合区-联合区-广西-北海-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('1211', '5100D6015121', '廖大利', '37353', '销售', '0', '3100', '互联网板块-房产-联合区-联合区-广西-北海-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('1212', 'E4BB483046F6', '刘显注', '39124', '销售', '0', '3100', '互联网板块-房产-联合区-联合区-广西-北海-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('1213', '0DA10E2ECA71', '宁力争', '39145', '销售', '0', '3102', '互联网板块-房产-联合区-联合区-广西-桂林-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1214', '7C80833CF454', '黄林松', '51288', '销售', '0', '3102', '互联网板块-房产-联合区-联合区-广西-桂林-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1215', '3EBFCC76B319', '班振', '36615', '销售', '0', '3102', '互联网板块-房产-联合区-联合区-广西-桂林-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1216', '3EBFF0A60178', '周唯', '36631', '销售', '0', '3102', '互联网板块-房产-联合区-联合区-广西-桂林-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1217', '3EBF3F327461', '谭玉榕', '36611', '销售', '0', '3102', '互联网板块-房产-联合区-联合区-广西-桂林-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1218', '9340AB47F3C0', '王子文', '34347', '销售', '0', '3106', '互联网板块-房产-海南-海南-海南-海口-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1219', '7E498176E92D', '潘媛35054', '35054', '销售', '0', '3106', '互联网板块-房产-海南-海南-海南-海口-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1220', '35B9FFAE7699', '李智南', '30622', '销售', '0', '3106', '互联网板块-房产-海南-海南-海南-海口-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1221', '0EDD85F3DFCA', '郑薇30192', '30192', '销售', '0', '3106', '互联网板块-房产-海南-海南-海南-海口-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1222', '4D1BB75546B4', '潘媛-停用', '33838', '销售', '0', '3106', '互联网板块-房产-海南-海南-海南-海口-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1223', 'F452EB901E72', '范艳兰', '39374', '销售', '0', '3106', '互联网板块-房产-海南-海南-海南-海口-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1224', '661D2DA4BF62', '邱俊勇', '39358', '销售', '0', '3106', '互联网板块-房产-海南-海南-海南-海口-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1225', 'F4530A9A6E81', '章彬彬', '39377', '销售', '0', '3106', '互联网板块-房产-海南-海南-海南-海口-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1226', 'D780F2BDD46A', '王智', '30374', '销售', '0', '3106', '互联网板块-房产-海南-海南-海南-海口-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1227', '811B27C7F018', '王迪', '36747', '销售', '0', '3106', '互联网板块-房产-海南-海南-海南-海口-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1228', '661C2540A046', '陈飘云', '39357', '销售', '0', '3106', '互联网板块-房产-海南-海南-海南-海口-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1229', '5F94D2556168', '苏峻平', '39317', '销售', '0', '3106', '互联网板块-房产-海南-海南-海南-海口-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1230', '09638C780B15', '梁伟', '39388', '销售', '0', '3106', '互联网板块-房产-海南-海南-海南-海口-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1231', '45E0C731D88D', '李翠35052', '35052', '销售', '0', '3106', '互联网板块-房产-海南-海南-海南-海口-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1232', '0A7790342ECB', '李智南35046', '35046', '销售', '0', '3106', '互联网板块-房产-海南-海南-海南-海口-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1233', 'D88A6BF1FFF7', '王智鹏35056', '35056', '销售', '0', '3108', '互联网板块-房产-海南-海南-海南-海口-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1234', '23842AD7DDAF', '姚力萌35049', '35049', '销售', '0', '3108', '互联网板块-房产-海南-海南-海南-海口-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1235', '0565AB12A0A2', '夏祎-停用', '34469', '销售', '0', '3108', '互联网板块-房产-海南-海南-海南-海口-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1236', 'BFD258CE7A34', '姚力萌', '30621', '销售', '0', '3108', '互联网板块-房产-海南-海南-海南-海口-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1237', '05414EF2792F', '苏丽君', '30625', '销售', '0', '3108', '互联网板块-房产-海南-海南-海南-海口-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1238', '100EF783E8DD', '叶铮霓35051', '35051', '销售', '0', '3108', '互联网板块-房产-海南-海南-海南-海口-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1239', 'F452D515CA31', '郑晓龙', '39375', '销售', '0', '3108', '互联网板块-房产-海南-海南-海南-海口-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1240', 'C5D998569C86', '周磊35048', '35048', '销售', '0', '3108', '互联网板块-房产-海南-海南-海南-海口-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1241', '65F7A666495C', '夏祎35057', '35057', '销售', '0', '3110', '互联网板块-房产-海南-海南-海南-海口-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1242', '1DAFB5F81941', '卢正飞', '31670', '销售', '0', '3110', '互联网板块-房产-海南-海南-海南-海口-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1243', '011AAC5A15D9', '丁波', '30445', '销售', '0', '3110', '互联网板块-房产-海南-海南-海南-海口-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1244', '90C3F37D0D54', '孙玉婷35055', '35055', '销售', '0', '3110', '互联网板块-房产-海南-海南-海南-海口-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1245', '1DBE4C226EB8', '王晶晶', '51472', '销售', '0', '3110', '互联网板块-房产-海南-海南-海南-海口-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1246', 'B20D20DCEF06', '洪睿宇', '31990', '销售', '0', '3110', '互联网板块-房产-海南-海南-海南-海口-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1247', '031D3E759403', '邓杜35050', '35050', '销售', '0', '3110', '互联网板块-房产-海南-海南-海南-海口-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1248', '6A1BCABE8B7A', '郭静35047', '35047', '销售', '0', '3110', '互联网板块-房产-海南-海南-海南-海口-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1249', '813F92930652', '胡婷35068', '35068', '销售', '0', '3112', '互联网板块-房产-海南-海南-海南-三亚-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1250', 'E803C3A451E3', '钟春雨', '30624', '销售', '0', '3112', '互联网板块-房产-海南-海南-海南-三亚-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1251', '18D9A1701807', '施诺', '39381', '销售', '0', '3112', '互联网板块-房产-海南-海南-海南-三亚-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1252', 'F11ABEB345D2', '卜珊珊', '35070', '销售', '0', '3112', '互联网板块-房产-海南-海南-海南-三亚-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1253', '3E21D1DADDC0', '李大', '39390', '销售', '0', '3112', '互联网板块-房产-海南-海南-海南-三亚-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1254', '8A825A5B45B7', '钟春雨35063', '35063', '销售', '0', '3112', '互联网板块-房产-海南-海南-海南-三亚-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1255', '4E48D44D52F6', '吴涛', '39349', '销售', '0', '3112', '互联网板块-房产-海南-海南-海南-三亚-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1256', '1F73ED8300F7', '云隆', '51475', '销售', '0', '3112', '互联网板块-房产-海南-海南-海南-三亚-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1257', '7B4D636385A9', '李星35064', '35064', '销售', '0', '3114', '互联网板块-房产-海南-海南-海南-三亚-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1258', '4E48BFE96E54', '褚婷', '39347', '销售', '0', '3114', '互联网板块-房产-海南-海南-海南-三亚-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1259', '80D7273237C1', '马冰51434', '51434', '销售', '0', '3114', '互联网板块-房产-海南-海南-海南-三亚-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1260', '276DC8B0FD15', '张天朋', '39320', '销售', '0', '3114', '互联网板块-房产-海南-海南-海南-三亚-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1261', '2AA14BF20093', '韩燕', '39340', '销售', '0', '3114', '互联网板块-房产-海南-海南-海南-三亚-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1262', '396D0EC507A7', '郭莉莎', '51477', '销售', '0', '3114', '互联网板块-房产-海南-海南-海南-三亚-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1263', '637D7EC04605', '张奥', '39301', '销售', '0', '3114', '互联网板块-房产-海南-海南-海南-三亚-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1264', '276DACE70699', '宋浩铭', '39312', '销售', '0', '3114', '互联网板块-房产-海南-海南-海南-三亚-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1265', '276DBE585610', '黄维欣', '39316', '销售', '0', '3114', '互联网板块-房产-海南-海南-海南-三亚-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1266', '0F043300DA81', '于浩洋', '39334', '销售', '0', '3114', '互联网板块-房产-海南-海南-海南-三亚-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1267', '276DB635F387', '任远', '39302', '销售', '0', '3114', '互联网板块-房产-海南-海南-海南-三亚-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1268', '27751C5D9A15', '王冰', '35144', '销售', '0', '3114', '互联网板块-房产-海南-海南-海南-三亚-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1269', '80D721D6D0C6', '吴玲', '51433', '销售', '0', '3116', '互联网板块-房产-海南-海南-海南-三亚-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1270', 'ED08873AD324', '刘鑫51468', '51468', '销售', '0', '3116', '互联网板块-房产-海南-海南-海南-三亚-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1271', '0A0A19B01846', '邢文哲', '51414', '销售', '0', '3116', '互联网板块-房产-海南-海南-海南-三亚-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1272', 'ED088E2C18B2', '蔡深儒', '51469', '销售', '0', '3116', '互联网板块-房产-海南-海南-海南-三亚-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1273', 'A5CF755D001F', '贾维康35065', '35065', '销售', '0', '3116', '互联网板块-房产-海南-海南-海南-三亚-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1274', '18D9B024A207', '刘彬', '39386', '销售', '0', '3116', '互联网板块-房产-海南-海南-海南-三亚-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1275', '18D9A727DA51', '徐翔', '39385', '销售', '0', '3116', '互联网板块-房产-海南-海南-海南-三亚-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1276', '504DF1C4ED62', '杨碧莹', '39396', '销售', '0', '3116', '互联网板块-房产-海南-海南-海南-三亚-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1277', '04CB94C662F5', '许龙飞', '36017', '销售', '0', '3116', '互联网板块-房产-海南-海南-海南-三亚-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1278', 'F48E036720BF', '孟祥飞35067', '35067', '销售', '0', '3116', '互联网板块-房产-海南-海南-海南-三亚-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1279', '2DF7468E99F7', '许蕊35076', '35076', '销售', '0', '3118', '互联网板块-房产-海南-海南-海南-琼海-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1280', '6F5E661F81A0', '李拔锦', '39305', '销售', '0', '3118', '互联网板块-房产-海南-海南-海南-琼海-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1281', '1132AFF7D557', '李楠35849', '35849', '销售', '0', '3118', '互联网板块-房产-海南-海南-海南-琼海-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1282', '268EBBF12C79', '洪燕35075', '35075', '销售', '0', '3118', '互联网板块-房产-海南-海南-海南-琼海-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1283', '723B312E7AE1', '邢冬瑜', '30443', '销售', '0', '3118', '互联网板块-房产-海南-海南-海南-琼海-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1284', '4A96C120FBAE', '邢冬瑜35072', '35072', '销售', '0', '3118', '互联网板块-房产-海南-海南-海南-琼海-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1285', '6405EED0B425', '车剑', '39397', '销售', '0', '3118', '互联网板块-房产-海南-海南-海南-琼海-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1286', '62CA7A38BB94', '李晓飞', '51403', '销售', '0', '3118', '互联网板块-房产-海南-海南-海南-琼海-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1287', '2F0A8A8E3D55', '席岳琛', '37111', '销售', '0', '3118', '互联网板块-房产-海南-海南-海南-琼海-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1288', '62C6BF820F45', '尚大群', '51404', '销售', '0', '3118', '互联网板块-房产-海南-海南-海南-琼海-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1289', '94F9B77A75E6', '黄丹', '30388', '销售', '0', '3118', '互联网板块-房产-海南-海南-海南-琼海-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1290', '6105DADACFC3', '胡帆', '36657', '销售', '0', '3118', '互联网板块-房产-海南-海南-海南-琼海-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1291', 'F6246D871ECE', '李彬彬35074', '35074', '销售', '0', '3120', '互联网板块-房产-海南-海南-海南-琼海-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1292', '74DD46FFF4F2', '洪燕', '31388', '销售', '0', '3120', '互联网板块-房产-海南-海南-海南-琼海-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1293', 'F166A73203D0', '陈彦博', '30444', '销售', '0', '3120', '互联网板块-房产-海南-海南-海南-琼海-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1294', '0475A1DAD8B1', '荆玉', '39333', '销售', '0', '3120', '互联网板块-房产-海南-海南-海南-琼海-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1295', '18D9BA26FAB3', '陈利君', '39389', '销售', '0', '3120', '互联网板块-房产-海南-海南-海南-琼海-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1296', 'F4532391B2C6', '黄怡', '39378', '销售', '0', '3120', '互联网板块-房产-海南-海南-海南-琼海-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1297', 'F453185B3337', '翁海钧', '39376', '销售', '0', '3120', '互联网板块-房产-海南-海南-海南-琼海-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1298', '6F5FE8BCEEB3', '李明子', '39306', '销售', '0', '3120', '互联网板块-房产-海南-海南-海南-琼海-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1299', '2ACAA7672005', '高玲', '39784', '销售', '0', '3122', '互联网板块-房产-上海-上海-上海-上海-销售二部3组（停用）-组员');
INSERT INTO `oa_orgstr` VALUES ('1300', '4CA34A7D23B3', '颜静', '50700', '销售', '0', '3122', '互联网板块-房产-上海-上海-上海-上海-销售二部3组（停用）-组员');
INSERT INTO `oa_orgstr` VALUES ('1301', '6728EA802726', '李雅洁', '50706', '销售', '0', '3122', '互联网板块-房产-上海-上海-上海-上海-销售二部3组（停用）-组员');
INSERT INTO `oa_orgstr` VALUES ('1302', 'AA9412BA43B5', '李波34872', '34872', '销售', '0', '3124', '互联网板块-房产-联合区-联合区-云南-云南-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1303', '15D4C58AC913', '吴俣薇39164', '39164', '销售', '0', '3124', '互联网板块-房产-联合区-联合区-云南-云南-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1304', '1DAA69353314', '田斌', '39175', '销售', '0', '3124', '互联网板块-房产-联合区-联合区-云南-云南-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1305', '68784BD6B532', '黄晓芳34871', '34871', '销售', '0', '3124', '互联网板块-房产-联合区-联合区-云南-云南-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1306', 'BCE1828962D6', '李琼', '51292', '销售', '0', '3124', '互联网板块-房产-联合区-联合区-云南-云南-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1307', '2014958DC093', '陈梦维', '51232', '销售', '0', '3124', '互联网板块-房产-联合区-联合区-云南-云南-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1308', '1DA9D52C8763', '徐佑', '39174', '销售', '0', '3124', '互联网板块-房产-联合区-联合区-云南-云南-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1309', '828F6A7AE9A3', '赵世翠', '56152', '销售', '0', '3124', '互联网板块-房产-联合区-联合区-云南-云南-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1310', '3E1F8D46FC86', '阮婵媛', '53817', '销售', '0', '3124', '互联网板块-房产-联合区-联合区-云南-云南-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1311', '0F9EBD25BAA3', '韩佩均', '35754', '销售', '0', '3124', '互联网板块-房产-联合区-联合区-云南-云南-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1312', '828F6F03E769', '何边宏', '51370', '销售', '0', '3124', '互联网板块-房产-联合区-联合区-云南-云南-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1313', '9E01F6B62087', '李玲（5622）', '56222', '销售', '0', '3124', '互联网板块-房产-联合区-联合区-云南-云南-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1314', '2CF760B8FEF8', '孙艳青', '55129', '销售', '0', '3124', '互联网板块-房产-联合区-联合区-云南-云南-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1315', 'A0E74F6BF9F9', '陈彦博35071', '35071', '销售', '0', '3124', '互联网板块-房产-联合区-联合区-云南-云南-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1316', '67D440276BE0', '罗慧忠', '56340', '销售', '0', '3124', '互联网板块-房产-联合区-联合区-云南-云南-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1317', 'CD15DE7688E6', '冯超达', '38796', '销售', '0', '3126', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1318', '3E55C0EB9436', '刘燕39721', '39721', '销售', '0', '3126', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1319', '226D6FEBF7E3', '庞云杰', '53544', '销售', '0', '3126', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1320', 'D3E8E6D28E56', '王丹妮', '54924', '销售', '0', '3126', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1321', 'CD15AE4EBBA7', '黄婵', '39759', '销售', '0', '3126', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1322', '79FF5AE20660', '章美玲', '39747', '销售', '0', '3126', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1323', '2ECDAECB9E11', '石单阳', '34494', '销售', '0', '3138', '互联网板块-房产-网盟业务中心-网盟业务中心-网盟业务中心-网盟业务中心');
INSERT INTO `oa_orgstr` VALUES ('1324', '47CCA52D4FD0', '吴洋', '34916', '销售', '0', '3138', '互联网板块-房产-网盟业务中心-网盟业务中心-网盟业务中心-网盟业务中心');
INSERT INTO `oa_orgstr` VALUES ('1325', '05BFA1C04650', '郑佩佩', '38297', '销售', '0', '3140', '互联网板块-房产-华南区-华南区-佛山-佛山-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1326', 'EC4B31B0BF91', '颜艳蜂', '32491', '销售', '0', '3140', '互联网板块-房产-华南区-华南区-佛山-佛山-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1327', '8B1474245D1F', '苏成', '34944', '销售', '0', '3140', '互联网板块-房产-华南区-华南区-佛山-佛山-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1328', 'CCF4742BE5C8', '丘陈冰', '52783', '销售', '0', '3140', '互联网板块-房产-华南区-华南区-佛山-佛山-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1329', '8E81B527DC47', '李骏星', '54391', '销售', '0', '3140', '互联网板块-房产-华南区-华南区-佛山-佛山-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1330', '508367A20721', '原劲培', '50015', '销售', '0', '3140', '互联网板块-房产-华南区-华南区-佛山-佛山-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1331', '938DCFB5EA38', '陈霞', '56478', '销售', '0', '3140', '互联网板块-房产-华南区-华南区-佛山-佛山-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1332', '178C729EA225', '黄彩琴', '56588', '销售', '0', '3140', '互联网板块-房产-华南区-华南区-佛山-佛山-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1333', '96639FA8D8F4', '李秋海', '32469', '销售', '0', '3142', '互联网板块-房产-北方区-北方-北京-北京-百度乐居运营部-组员');
INSERT INTO `oa_orgstr` VALUES ('1334', 'B8858F126007', '李刚32472', '32472', '销售', '0', '3142', '互联网板块-房产-北方区-北方-北京-北京-百度乐居运营部-组员');
INSERT INTO `oa_orgstr` VALUES ('1335', 'E6E64728A41A', '赵宏', '32881', '销售', '0', '3142', '互联网板块-房产-北方区-北方-北京-北京-百度乐居运营部-组员');
INSERT INTO `oa_orgstr` VALUES ('1336', 'BCE26E536922', '张世超', '52016', '销售', '0', '3147', '互联网板块-房产-合肥-合肥-合肥-合肥-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1337', '4E52D07620D7', '陆彦华', '52002', '销售', '0', '3147', '互联网板块-房产-合肥-合肥-合肥-合肥-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1338', 'EF93A5E36A44', '李超52070', '52070', '销售', '0', '3147', '互联网板块-房产-合肥-合肥-合肥-合肥-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1339', '82FBD0C4F669', '李小云', '39325', '销售', '0', '3166', '互联网板块-房产-海南-海南-海南-琼海-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1340', '97F815070736', '马增辉', '39726', '销售', '0', '3682', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `oa_orgstr` VALUES ('1341', '97F7F4F17DA7', '陈保亮', '39727', '销售', '0', '3682', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `oa_orgstr` VALUES ('1342', '06BCB7BD0E34', '刘蒙蒙', '39776', '销售', '0', '3682', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `oa_orgstr` VALUES ('1343', '944DEFE8F663', '冯晔', '35611', '销售', '0', '3682', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `oa_orgstr` VALUES ('1344', 'ADF0A69954A3', '张冬生', '50827', '销售', '0', '3682', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `oa_orgstr` VALUES ('1345', 'DE2A0742BBA7', '尚露', '39775', '销售', '0', '3682', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `oa_orgstr` VALUES ('1346', '3CC604A8A9E5', '戴云飞50783', '50783', '销售', '0', '3682', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `oa_orgstr` VALUES ('1347', '5CE2BCBD8415', '王峰', '35596', '销售', '0', '3682', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `oa_orgstr` VALUES ('1348', '944E4A18B4F5', '崔鹏', '31078', '销售', '0', '3682', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `oa_orgstr` VALUES ('1349', 'DE2A3E797F11', '卓雅', '39770', '销售', '0', '3682', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `oa_orgstr` VALUES ('1350', 'D205B6E05958', '徐斌', '50762', '销售', '0', '3682', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `oa_orgstr` VALUES ('1351', 'DE29EA1E2571', '付凯', '38716', '销售', '0', '3682', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `oa_orgstr` VALUES ('1352', 'DE2ACB1B3D08', '单萌', '39769', '销售', '0', '3682', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `oa_orgstr` VALUES ('1353', '1D5A3FD28DF2', '梁苹苹', '39779', '销售', '0', '3683', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `oa_orgstr` VALUES ('1354', '578E3421EBC4', '吴彦妮', '50709', '销售', '0', '3683', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `oa_orgstr` VALUES ('1355', '2CF77E575AD7', '周晓春', '50844', '销售', '0', '3683', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `oa_orgstr` VALUES ('1356', '800DF5C52212', '储嘉杰', '50846', '销售', '0', '3683', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `oa_orgstr` VALUES ('1357', 'BBA70B57FDD6', '叶婷', '50752', '销售', '0', '3683', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `oa_orgstr` VALUES ('1358', '3CC5EF332E48', '付磊', '50773', '销售', '0', '3683', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `oa_orgstr` VALUES ('1359', '75735766C3C5', '朱晓可', '50718', '销售', '0', '3683', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `oa_orgstr` VALUES ('1360', 'DE2A2613D6C2', '胥家栋', '39774', '销售', '0', '3683', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `oa_orgstr` VALUES ('1361', 'FF9F44EF50C1', '陈震50894', '50894', '销售', '0', '3683', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `oa_orgstr` VALUES ('1362', '1B6F0E1FD497', '凌忠网', '50727', '销售', '0', '3684', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `oa_orgstr` VALUES ('1363', '6EE1E7768A50', '孙俪娜', '50802', '销售', '0', '3684', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `oa_orgstr` VALUES ('1364', '59E5C009B340', '马骏', '35302', '销售', '0', '3691', '互联网板块-房产-东部区-芜湖-芜湖-芜湖-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1365', '1656ADD4A309', '刘梅', '52890', '销售', '0', '3691', '互联网板块-房产-东部区-芜湖-芜湖-芜湖-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1366', '6822239DF370', '赵文娟', '55486', '销售', '0', '3691', '互联网板块-房产-东部区-芜湖-芜湖-芜湖-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1367', '41914CE95347', '刘璐', '55478', '销售', '0', '3691', '互联网板块-房产-东部区-芜湖-芜湖-芜湖-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1368', 'AE0F4642D831', '张娟', '55487', '销售', '0', '3691', '互联网板块-房产-东部区-芜湖-芜湖-芜湖-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1369', '6B2C8748A693', '屈溶', '51145', '销售', '0', '3691', '互联网板块-房产-东部区-芜湖-芜湖-芜湖-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1370', 'CCE7993E6B13', '卜林君', '38948', '销售', '0', '3691', '互联网板块-房产-东部区-芜湖-芜湖-芜湖-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1371', '650891ADF199', '陈莉37908', '37908', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1372', '6508D89C7AB0', '张伟37907', '37907', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1373', '223A22B7523A', '刘霞', '35354', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1374', '771956F911F9', '孙艳萍', '31625', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1375', 'AB3CAEA1DC42', '杨坤', '34665', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1376', 'ABAE6236E2F4', '宛建伟', '30515', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1377', '479BB460BC37', '张芳', '37975', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1378', 'C1ABC6179B88', '王丽萌', '34666', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1379', '9A6A73563D11', '连云峰', '50223', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1380', '048714AFA228', '孙潜', '38018', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1381', 'DF5543CFCAE2', '于宗甲', '50263', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1382', '90A4751B13C9', '张达56657', '56657', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1383', 'CB1640864FB9', '刘旋', '50291', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1384', '62FC5198D817', '王滨', '53622', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1385', 'F156FADDF685', '周莹涵', '50277', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1386', '803A9ACF6C98', '崔茗涵', '53632', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1387', 'E882B66181A5', '郭典', '50274', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1388', 'E1EC07750517', '李婕', '50273', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1389', '0669A14651B5', '于忠礼', '53660', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1390', '449E1EB9FBE8', '曾秀丹', '53600', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1391', '66C20C084E69', '迟盛超', '56651', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1392', '527736A4C965', '李宁', '56820', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1393', '7F2705F7C663', '翟叔晓', '31534', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1394', 'F6ACD1E9179C', '吴敏娜', '31776', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1395', '44EF1885A60B', '易居青岛', 'B9902', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1396', '33C9A3DB50BB', '克而瑞青岛', 'B9802', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1397', '14F8FD91A657', '孙海洋', '34667', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1398', '410E941993FD', '祝勇', '30508', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1399', '6F5531A789D4', '赵沛', '37988', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1400', '4875AB82EBB2', '车振', '36545', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1401', '98172DD03A35', '罗鹏', '50218', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1402', '4D15BC935A96', '张丰选', '38085', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1403', '130ECF8A6B56', '张震', '37963', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1404', 'F773CDB3D571', '齐艳艳', '34841', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1405', '4278ACE45E24', '尤一雅34670', '34670', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1406', '04F1A445DECC', '高悦', '33774', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1407', 'B82C6EF11159', '张鑫', '56680', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1408', 'B86D62E29375', '宋凯琳', '56679', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1409', '1710B79F32E2', '冯正浩', '56709', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1410', 'C3954EB12D45', '侯欣馨', '50230', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1411', 'B82C1C7828E4', '丁磊', '56676', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1412', 'CF625EC00F78', '王锋', '34988', '销售', '0', '3770', '互联网板块-房产-产品中心-产品中心-外联合作部-外联合作部');
INSERT INTO `oa_orgstr` VALUES ('1413', '3BADA24F3096', '王宇', '34545', '销售', '0', '3770', '互联网板块-房产-产品中心-产品中心-外联合作部-外联合作部');
INSERT INTO `oa_orgstr` VALUES ('1414', '26ED50C47C80', '李文彬', '39815', '销售', '0', '3810', '互联网板块-房产-北方区-北方-北京-北京-商业地产组（停）-组员');
INSERT INTO `oa_orgstr` VALUES ('1415', '00F51FEED6E6', '盖保军', '35483', '销售', '0', '3834', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1416', '94454FFDABD0', '尚会乐', '35484', '销售', '0', '3834', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1417', '5A53CB000EF7', '潘龙志', '37903', '销售', '0', '3834', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1418', '3E269F2E6138', '于浩阳', '50961', '销售', '0', '3834', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1419', 'B88E45D98169', '刘馨羽', '55234', '销售', '0', '3834', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1420', '1CFEBFD7BA65', '程铁桢', '53294', '销售', '0', '3834', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1421', '98156D60D798', '张阳51053', '51053', '销售', '0', '3834', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1422', 'B670B8C68B55', '黄蕾蕾', '52657', '销售', '0', '3834', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1423', '3E26B5E56DB4', '锡凯同', '50984', '销售', '0', '3834', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1424', '567DA97F55F2', '李曙光', '55315', '销售', '0', '3834', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1425', '567DAD9A4488', '高惠生', '55319', '销售', '0', '3834', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1426', 'ECE68153D6F2', '孔德君37078', '37078', '销售', '0', '3842', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户3组-组员');
INSERT INTO `oa_orgstr` VALUES ('1427', 'F601EE8D1224', '申湛', '32969', '销售', '0', '3842', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户3组-组员');
INSERT INTO `oa_orgstr` VALUES ('1428', '0330D1C06DD2', '杨春雨', '37702', '销售', '0', '3842', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户3组-组员');
INSERT INTO `oa_orgstr` VALUES ('1429', 'FE446AE62902', '王晓磊', '30546', '销售', '0', '3842', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户3组-组员');
INSERT INTO `oa_orgstr` VALUES ('1430', 'D5F3C6E04EC9', '崔恺', '33543', '销售', '0', '3842', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户3组-组员');
INSERT INTO `oa_orgstr` VALUES ('1431', 'B76C58CA2387', '张锦菲', '37871', '销售', '0', '3842', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户3组-组员');
INSERT INTO `oa_orgstr` VALUES ('1432', '6BAB15F8C90D', '陈晓霞', '31698', '销售', '0', '3842', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户3组-组员');
INSERT INTO `oa_orgstr` VALUES ('1433', '4E0A6D77FD74', '于海晶', '31539', '销售', '0', '3843', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户2组-组员');
INSERT INTO `oa_orgstr` VALUES ('1434', '253A705679F9', '夏莹', '37303', '销售', '0', '3843', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户2组-组员');
INSERT INTO `oa_orgstr` VALUES ('1435', '26A4B7BF6871', '王瑞雪', '35655', '销售', '0', '3843', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户2组-组员');
INSERT INTO `oa_orgstr` VALUES ('1436', '39431305F9A4', '张栩斌', '37757', '销售', '0', '3843', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户2组-组员');
INSERT INTO `oa_orgstr` VALUES ('1437', 'FD0560C1CDB5', '刘微', '32051', '销售', '0', '3843', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户2组-组员');
INSERT INTO `oa_orgstr` VALUES ('1438', '525414E5C47F', '盛中原', '30217', '销售', '0', '3843', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户2组-组员');
INSERT INTO `oa_orgstr` VALUES ('1439', '0CC53F99EC4E', '李晓东', '30215', '销售', '0', '3843', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户2组-组员');
INSERT INTO `oa_orgstr` VALUES ('1440', 'B26B289F2AD0', '佟彤', '35197', '销售', '0', '3843', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户2组-组员');
INSERT INTO `oa_orgstr` VALUES ('1441', 'B6C6BB0B20B6', '朱兴邦', '31072', '销售', '0', '3843', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户2组-组员');
INSERT INTO `oa_orgstr` VALUES ('1442', 'D77DDA940B2D', '王磊', '31216', '销售', '0', '3843', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户2组-组员');
INSERT INTO `oa_orgstr` VALUES ('1443', '335C136BC234', '邱晓华', '36077', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `oa_orgstr` VALUES ('1444', '15ADB1269880', '王维丹', '37746', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `oa_orgstr` VALUES ('1445', '41315004F9A4', '宋晓双', '31190', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `oa_orgstr` VALUES ('1446', '41312EA54FA9', '张月', '33388', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `oa_orgstr` VALUES ('1447', '34ECB5AE8A24', '郑雪', '37875', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `oa_orgstr` VALUES ('1448', '8DB5F8D210C7', '闫旭', '37783', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `oa_orgstr` VALUES ('1449', '891A3D4A56A5', '郝光', '32239', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `oa_orgstr` VALUES ('1450', 'D531819E8222', '孟庆庆', '36180', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `oa_orgstr` VALUES ('1451', '1CC9CF9F8E40', '徐东旭', '37785', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `oa_orgstr` VALUES ('1452', '1CC9CA2CB501', '潘艳莉', '37893', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `oa_orgstr` VALUES ('1453', 'D5313A301CF2', '王苏卓', '37729', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `oa_orgstr` VALUES ('1454', '938DD5AD1A78', '周旭50106', '50106', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `oa_orgstr` VALUES ('1455', '1CC9D90EF2C0', '关闯', '37894', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `oa_orgstr` VALUES ('1456', 'CD80D3067A38', '孙慧宇', '31127', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `oa_orgstr` VALUES ('1457', '465234B50335', '刘芳31961', '31961', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `oa_orgstr` VALUES ('1458', '210E6E355BFD', '邹德莹', '32971', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `oa_orgstr` VALUES ('1459', 'E3C5E456E8A3', '李健37922', '37922', '销售', '0', '3847', '互联网板块-房产-华北区-华北区-济南-济南-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1460', 'C067CBFAC882', '高鑫', '37962', '销售', '0', '3847', '互联网板块-房产-华北区-华北区-济南-济南-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1461', '42A0057B0DD7', '文敬荣', '39938', '销售', '0', '3849', '互联网板块-房产-华北区-华北区-济南-济南-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('1462', '8EBCDE1D5934', '郭瑞', '37997', '销售', '0', '3867', '互联网板块-房产-北方区-北方-太原-太原-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1463', '8137A0933322', '邢琛', '55189', '销售', '0', '3867', '互联网板块-房产-北方区-北方-太原-太原-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1464', '4E4B7955DC39', '张鹏51256', '51256', '销售', '0', '3875', '互联网板块-房产-联合区-联合区-银川-银川-销售组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1465', '01CF8157B5D8', '李世明', '39284', '销售', '0', '3875', '互联网板块-房产-联合区-联合区-银川-银川-销售组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1466', '4E4BB768B627', '王蓓', '51267', '销售', '0', '3875', '互联网板块-房产-联合区-联合区-银川-银川-销售组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1467', '6056D8F32005', '王海娟', '53851', '销售', '0', '3875', '互联网板块-房产-联合区-联合区-银川-银川-销售组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1468', '5280C4B917A4', '杜祎凡', '56347', '销售', '0', '3875', '互联网板块-房产-联合区-联合区-银川-银川-销售组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1469', 'D76A7737C6F8', '姜韶帅', '51362', '销售', '0', '3877', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `oa_orgstr` VALUES ('1470', '1D5BF30C73F1', '陈旭海', '50333', '销售', '0', '3879', '互联网板块-房产-华南区-华南区-广州-广州-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1471', '214AB82C2DA9', '刘红旗', '50360', '销售', '0', '3879', '互联网板块-房产-华南区-华南区-广州-广州-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1472', '47ADFDE436E4', '周志胜', '50401', '销售', '0', '3879', '互联网板块-房产-华南区-华南区-广州-广州-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1473', '1747C2385898', '范欧阳', '36269', '销售', '0', '3879', '互联网板块-房产-华南区-华南区-广州-广州-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1474', '0B53A93A8A89', '万婷', '56591', '销售', '0', '3879', '互联网板块-房产-华南区-华南区-广州-广州-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1475', '4AFAA6F37C66', '陈志亮', '56627', '销售', '0', '3879', '互联网板块-房产-华南区-华南区-广州-广州-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1476', 'F97004866428', '刘晓冰', '54634', '销售', '0', '3879', '互联网板块-房产-华南区-华南区-广州-广州-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1477', '6F86EBDE31E5', '侯霞', '38232', '销售', '0', '3879', '互联网板块-房产-华南区-华南区-广州-广州-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1478', '32996688B5A0', '林益亮', '50379', '销售', '0', '3879', '互联网板块-房产-华南区-华南区-广州-广州-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1479', 'BCF3CC8E330B', '庄泽伟', '35207', '销售', '0', '3879', '互联网板块-房产-华南区-华南区-广州-广州-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1480', '56A3BD1CBAF7', '刘静静', '52063', '销售', '0', '3886', '互联网板块-房产-合肥-合肥-合肥-合肥-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1481', '9052ACBEE910', '杨洋37124', '37124', '销售', '0', '3891', '互联网板块-房产-东北区-东北区-长春-长春-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1482', '3CFDC94C4C78', '张佳南', '37808', '销售', '0', '3891', '互联网板块-房产-东北区-东北区-长春-长春-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1483', '01EFCCC177C2', '王丹37801', '37801', '销售', '0', '3891', '互联网板块-房产-东北区-东北区-长春-长春-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1484', '9DB3F279A684', '邹宇辰', '37743', '销售', '0', '3891', '互联网板块-房产-东北区-东北区-长春-长春-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1485', 'B4C301B160E2', '王文君', '37816', '销售', '0', '3891', '互联网板块-房产-东北区-东北区-长春-长春-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1486', '9232850F0441', '王喆', '37883', '销售', '0', '3891', '互联网板块-房产-东北区-东北区-长春-长春-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1487', '1DAF2FF246D3', '肖玉祥', '33520', '销售', '0', '3891', '互联网板块-房产-东北区-东北区-长春-长春-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1488', '865FE26F0F46', '吴海波', '37881', '销售', '0', '3891', '互联网板块-房产-东北区-东北区-长春-长春-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1489', '5C4DCEE74611', '王彦启', '50118', '销售', '0', '3891', '互联网板块-房产-东北区-东北区-长春-长春-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1490', 'C7BC24EADFC2', '刘丹33141', '33141', '销售', '0', '3891', '互联网板块-房产-东北区-东北区-长春-长春-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1491', 'AF0465CEE887', '夏远芳', '50143', '销售', '0', '3891', '互联网板块-房产-东北区-东北区-长春-长春-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1492', 'CD18BC729E29', '王桂敏', '37762', '销售', '0', '3893', '互联网板块-房产-东北区-东北区-长春-长春-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1493', '01EFA6868FD8', '顾丹阳', '37798', '销售', '0', '3893', '互联网板块-房产-东北区-东北区-长春-长春-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1494', '10A5FD8FAE86', '顾明', '32330', '销售', '0', '3893', '互联网板块-房产-东北区-东北区-长春-长春-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1495', 'B74FA3A78038', '陈荣斌', '37890', '销售', '0', '3893', '互联网板块-房产-东北区-东北区-长春-长春-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1496', '01EFE603DBC4', '李明阳', '37800', '销售', '0', '3893', '互联网板块-房产-东北区-东北区-长春-长春-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1497', 'CD18CF8198F8', '董泽地', '37790', '销售', '0', '3895', '互联网板块-房产-东北区-东北区-长春-长春-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1498', 'F5908CBF4FF2', '王东旭', '37859', '销售', '0', '3895', '互联网板块-房产-东北区-东北区-长春-长春-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1499', 'A75150524357', '柳赵明', '50136', '销售', '0', '3895', '互联网板块-房产-东北区-东北区-长春-长春-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1500', 'F11B5D886233', '唐闻', '50159', '销售', '0', '3895', '互联网板块-房产-东北区-东北区-长春-长春-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1501', 'F11B63BB8B92', '张太岩', '50158', '销售', '0', '3895', '互联网板块-房产-东北区-东北区-长春-长春-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1502', 'D41B7A743B91', '林丹57400', '57400', '销售', '0', '3898', '互联网板块-房产-浙闽区-福建-福州-福州-销售一组-销售一组');
INSERT INTO `oa_orgstr` VALUES ('1503', 'D77204A51556', '王琦50904', '50904', '销售', '0', '3905', '互联网板块-房产-北方区-北方-秦皇岛-秦皇岛-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('1504', 'D84FEC7C2D14', '焦有昆', '52687', '销售', '0', '3905', '互联网板块-房产-北方区-北方-秦皇岛-秦皇岛-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('1505', 'D7722F901C56', '王琳', '50912', '销售', '0', '3905', '互联网板块-房产-北方区-北方-秦皇岛-秦皇岛-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('1506', 'D771EB89B488', '张海钢', '50903', '销售', '0', '3905', '互联网板块-房产-北方区-北方-秦皇岛-秦皇岛-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('1507', 'D84F004F31C5', '韩帅', '51066', '销售', '0', '3905', '互联网板块-房产-北方区-北方-秦皇岛-秦皇岛-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('1508', 'D8503E70F753', '宁蒙', '52688', '销售', '0', '3905', '互联网板块-房产-北方区-北方-秦皇岛-秦皇岛-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('1509', 'D84B0BE32ED2', '张子威', '51090', '销售', '0', '3905', '互联网板块-房产-北方区-北方-秦皇岛-秦皇岛-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('1510', 'F67A986F5754', '李帅', '55274', '销售', '0', '3905', '互联网板块-房产-北方区-北方-秦皇岛-秦皇岛-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('1511', '90455C85E9A0', '刘旭', '31378', '销售', '0', '3910', '互联网板块-房产-联合区-联合区-贵阳-贵阳-销售一组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1512', 'D88C1E292430', '何薇39261', '39261', '销售', '0', '3910', '互联网板块-房产-联合区-联合区-贵阳-贵阳-销售一组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1513', 'D88A70B70741', '叶红', '39260', '销售', '0', '3910', '互联网板块-房产-联合区-联合区-贵阳-贵阳-销售一组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1514', 'D88C7DBFD4A6', '邹金鹏', '39272', '销售', '0', '3912', '互联网板块-房产-联合区-联合区-贵阳-贵阳-销售二组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1515', 'D88BB8C2D9B7', '袁健虹', '39263', '销售', '0', '3912', '互联网板块-房产-联合区-联合区-贵阳-贵阳-销售二组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1516', 'D88C5488C0F6', '温红霞', '39265', '销售', '0', '3912', '互联网板块-房产-联合区-联合区-贵阳-贵阳-销售二组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1517', 'BBA7972A2421', '何晨冬', '39278', '销售', '0', '3914', '互联网板块-房产-联合区-联合区-贵阳-贵阳-销售三组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1518', 'D88CA1C93318', '陶智', '39286', '销售', '0', '3914', '互联网板块-房产-联合区-联合区-贵阳-贵阳-销售三组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1519', '26DF7A5C0758', '刘海龙', '37160', '销售', '0', '3942', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售一组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1520', '4F7C3ADFE0E7', '李鑫', '51257', '销售', '0', '3942', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售一组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1521', '9A3D3DE94080', '刘阔', '56198', '销售', '0', '3942', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售一组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1522', '9A3D55C30967', '魏斌', '56217', '销售', '0', '3942', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售一组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1523', '79A24F270002', '张闻', '39229', '销售', '0', '3942', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售一组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1524', '3E3F9D485651', '贾叶', '53838', '销售', '0', '3942', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售一组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1525', 'B655666BD5B9', '赵红阳', '51279', '销售', '0', '3942', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售一组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1526', 'E4EEACF0D460', '莎莉', '39122', '销售', '0', '3942', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售一组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1527', '87E012C8D1D2', '张亚鹏', '35485', '销售', '0', '4001', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1528', '4CA44B6716A6', '王晓亮', '51000', '销售', '0', '4001', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1529', '2B33F9D27C66', '苏萍萍', '37194', '销售', '0', '4001', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1530', '1CFEC55B2EC3', '马子龙', '53299', '销售', '0', '4001', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1531', 'E609922C0B25', '马洁', '37989', '销售', '0', '4001', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1532', '5455BBB322C8', '侯伟昆', '55153', '销售', '0', '4001', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1533', '1611A6AE9CF7', '郭伟达', '55282', '销售', '0', '4001', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1534', '9642B086C3DB', '陈国强', '35490', '销售', '0', '4001', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1535', '43F1EBD49B15', '王军55295', '55295', '销售', '0', '4001', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1536', '49869BEAA692', '田学文', '55293', '销售', '0', '4001', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1537', '9C05D8E48915', '曹祖南', '39489', '销售', '0', '4003', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1538', '3BD461973ED7', '王藤', '51523', '销售', '0', '4003', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1539', '9A6BBA6D4F94', '吕悠悠', '51567', '销售', '0', '4003', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1540', '7D5523DC4FB3', '崔源', '51557', '销售', '0', '4003', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1541', '664979CAA581', '孙梦婕', '36738', '销售', '0', '4003', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1542', '86148F9D087F', '张茜', '31022', '销售', '0', '4003', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1543', '5087AFAC7C70', '余晓蕾', '54037', '销售', '0', '4003', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1544', '000B494BB7C8', '闫冬冬', '55352', '销售', '0', '4003', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1545', '6519A4E88C55', '王明之', '55376', '销售', '0', '4003', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1546', '0A78C7750E69', '许玲', '55360', '销售', '0', '4003', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1547', 'F6E9C6E038B8', '张晋', '54093', '销售', '0', '4003', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1548', '2754C27C8E19', '郑涛', '55440', '销售', '0', '4003', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1549', 'FC4235521CD9', '王春艳', '54015', '销售', '0', '4003', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1550', '21E425963840', '陈琳琳', '37076', '销售', '0', '4009', '互联网板块-房产-东北区-东北区-乐居周刊-乐居周刊-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('1551', 'B44F3252D281', '隋怡', '32337', '销售', '0', '4009', '互联网板块-房产-东北区-东北区-乐居周刊-乐居周刊-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('1552', '9F7766F28738', '孙阳', '50134', '销售', '0', '4009', '互联网板块-房产-东北区-东北区-乐居周刊-乐居周刊-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('1553', '7F166395B050', '隋文静', '50208', '销售', '0', '4010', '互联网板块-房产-东部区-烟台-烟台-烟台-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1554', '2B643E40122A', '初晓凤', '33897', '销售', '0', '4010', '互联网板块-房产-东部区-烟台-烟台-烟台-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1555', '80D185584767', '巩溯南', '55491', '销售', '0', '4010', '互联网板块-房产-东部区-烟台-烟台-烟台-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1556', '07D197B54FE9', '刘凯50290', '50290', '销售', '0', '4010', '互联网板块-房产-东部区-烟台-烟台-烟台-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1557', '97304A5320E2', '郭超', '36877', '销售', '0', '4010', '互联网板块-房产-东部区-烟台-烟台-烟台-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1558', '722B0C4692FF', '杨春敏', '33390', '销售', '0', '4010', '互联网板块-房产-东部区-烟台-烟台-烟台-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1559', '1D0AC67A8D4A', '田胜豹', '30876', '销售', '0', '4010', '互联网板块-房产-东部区-烟台-烟台-烟台-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1560', '4951D9C9BE59', '李俊良', '37900', '销售', '0', '4010', '互联网板块-房产-东部区-烟台-烟台-烟台-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1561', 'C17E46C182E9', '朱壮壮', '31694', '销售', '0', '4010', '互联网板块-房产-东部区-烟台-烟台-烟台-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1562', 'F9BE755F1B8F', '焦子新', '35826', '销售', '0', '4010', '互联网板块-房产-东部区-烟台-烟台-烟台-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1563', 'BD82ED3BD1FF', '祝蕾', '31628', '销售', '0', '4010', '互联网板块-房产-东部区-烟台-烟台-烟台-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1564', '5833D6A2EB66', '张馨月', '53618', '销售', '0', '4010', '互联网板块-房产-东部区-烟台-烟台-烟台-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1565', '33849D06E136', '于晓燕', '35996', '销售', '0', '4012', '互联网板块-房产-东部区-烟台-烟台-烟台-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1566', '081762790DA9', '安谨', '50292', '销售', '0', '4012', '互联网板块-房产-东部区-烟台-烟台-烟台-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1567', '1B15D10C02E6', '米根平', '37967', '销售', '0', '4012', '互联网板块-房产-东部区-烟台-烟台-烟台-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1568', 'F7BFFC98A0B9', '陈晨', '53662', '销售', '0', '4012', '互联网板块-房产-东部区-烟台-烟台-烟台-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1569', 'DE06E1971AA5', '程杰', '37942', '销售', '0', '4012', '互联网板块-房产-东部区-烟台-烟台-烟台-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1570', '80D17C6F5816', '张小岩', '55492', '销售', '0', '4012', '互联网板块-房产-东部区-烟台-烟台-烟台-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1571', '3F2FA6572803', '王璐53605', '53605', '销售', '0', '4014', '互联网板块-房产-东部区-烟台-烟台-烟台-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1572', '1D5C05A26EB6', '何少坤', '50332', '销售', '0', '4016', '互联网板块-房产-华南区-华南区-广州-广州-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1573', '892B6329C9A3', '曹佳', '54598', '销售', '0', '4016', '互联网板块-房产-华南区-华南区-广州-广州-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1574', '214AD34A7484', '刘涛50361', '50361', '销售', '0', '4016', '互联网板块-房产-华南区-华南区-广州-广州-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1575', '9C74DF835B70', '刘清雯', '56493', '销售', '0', '4016', '互联网板块-房产-华南区-华南区-广州-广州-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1576', 'E54164B3C9E4', '贾源', '56564', '销售', '0', '4016', '互联网板块-房产-华南区-华南区-广州-广州-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1577', '82FACE66BAD5', '魏琳', '50454', '销售', '0', '4016', '互联网板块-房产-华南区-华南区-广州-广州-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1578', '051F22ED0FC9', '赵万能', '36117', '销售', '0', '4016', '互联网板块-房产-华南区-华南区-广州-广州-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1579', 'C3B47EED6558', '洪莉娜', '52768', '销售', '0', '4016', '互联网板块-房产-华南区-华南区-广州-广州-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1580', '0D6C945F04B7', '伍世勇', '38291', '销售', '0', '4016', '互联网板块-房产-华南区-华南区-广州-广州-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1581', 'FB4097D7D6D3', '钟洪', '38113', '销售', '0', '4018', '互联网板块-房产-华南区-华南区-广州-广州-销售八组-组员');
INSERT INTO `oa_orgstr` VALUES ('1582', '2DFE2CC9CED4', '梁彩珍', '55603', '销售', '0', '4018', '互联网板块-房产-华南区-华南区-广州-广州-销售八组-组员');
INSERT INTO `oa_orgstr` VALUES ('1583', '47ADEA5CFA83', '卢思敏', '50400', '销售', '0', '4018', '互联网板块-房产-华南区-华南区-广州-广州-销售八组-组员');
INSERT INTO `oa_orgstr` VALUES ('1584', 'B88E3E3AFD05', '廖巧茹', '56517', '销售', '0', '4018', '互联网板块-房产-华南区-华南区-广州-广州-销售八组-组员');
INSERT INTO `oa_orgstr` VALUES ('1585', '82FAE1B0CC41', '姚振生', '50458', '销售', '0', '4018', '互联网板块-房产-华南区-华南区-广州-广州-销售八组-组员');
INSERT INTO `oa_orgstr` VALUES ('1586', '3DD7E1180D51', '黄源周', '54355', '销售', '0', '4018', '互联网板块-房产-华南区-华南区-广州-广州-销售八组-组员');
INSERT INTO `oa_orgstr` VALUES ('1587', '0BBAF3823163', '刘帅廷', '34795', '销售', '0', '4018', '互联网板块-房产-华南区-华南区-广州-广州-销售八组-组员');
INSERT INTO `oa_orgstr` VALUES ('1588', '0D6CAC3CA191', '戴云飞', '38290', '销售', '0', '4018', '互联网板块-房产-华南区-华南区-广州-广州-销售八组-组员');
INSERT INTO `oa_orgstr` VALUES ('1589', '7D1EF9586EB7', '潘明君', '54393', '销售', '0', '4022', '互联网板块-房产-华南区-华南区-深圳-深圳-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1590', 'C5042EEFC95C', '叶昭雪', '34341', '销售', '0', '4022', '互联网板块-房产-华南区-华南区-深圳-深圳-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1591', 'FF6DDC499EC1', '邓小亮56541', '56541', '销售', '0', '4022', '互联网板块-房产-华南区-华南区-深圳-深圳-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1592', 'FB246ED13EBD', '黄银卿', '33129', '销售', '0', '4022', '互联网板块-房产-华南区-华南区-深圳-深圳-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1593', '5CDFB0B0F1A1', '瞿斌', '38190', '销售', '0', '4024', '互联网板块-房产-华南区-华南区-深圳-深圳-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('1594', '64FA0102EEE9', '徐秋实', '35319', '销售', '0', '4024', '互联网板块-房产-华南区-华南区-深圳-深圳-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('1595', '05B71FC73F12', '李志伟38296', '38296', '销售', '0', '4024', '互联网板块-房产-华南区-华南区-深圳-深圳-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('1596', '05B7AD532299', '毛维成', '50304', '销售', '0', '4024', '互联网板块-房产-华南区-华南区-深圳-深圳-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('1597', '1A9FF138DFD6', '于海涛', '54313', '销售', '0', '4024', '互联网板块-房产-华南区-华南区-深圳-深圳-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('1598', '04988E7EA540', '刘丹', '32086', '销售', '0', '4024', '互联网板块-房产-华南区-华南区-深圳-深圳-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('1599', '26B44C708301', '章伟', '50324', '销售', '0', '4026', '互联网板块-房产-华南区-华南区-深圳-深圳-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1600', '4CFE48A6D382', '吴让前', '50394', '销售', '0', '4026', '互联网板块-房产-华南区-华南区-深圳-深圳-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1601', 'E09AD6B02CE0', '王思瑶38254', '38254', '销售', '0', '4026', '互联网板块-房产-华南区-华南区-深圳-深圳-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1602', '7FFC9EA4FDC2', '齐文洁', '55634', '销售', '0', '4026', '互联网板块-房产-华南区-华南区-深圳-深圳-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1603', '3CD740D3CB46', '徐卓瑶', '54342', '销售', '0', '4026', '互联网板块-房产-华南区-华南区-深圳-深圳-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1604', 'DE195FA1D924', '安伟松', '39282', '销售', '0', '4027', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `oa_orgstr` VALUES ('1605', 'A3A82B58FE31', '卢林', '35525', '销售', '0', '4027', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `oa_orgstr` VALUES ('1606', '246B51B9BACF', '张阳', '35521', '销售', '0', '4027', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `oa_orgstr` VALUES ('1607', 'A09E5A7BB381', '刘振35694', '35694', '销售', '0', '4027', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `oa_orgstr` VALUES ('1608', 'AC48488A3106', '雷玉梅', '35522', '销售', '0', '4027', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `oa_orgstr` VALUES ('1609', '0A1F5C26CC11', '邓弘立', '35516', '销售', '0', '4027', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `oa_orgstr` VALUES ('1610', '9F12DDA57CF2', '王燕飞39100', '39100', '销售', '0', '4027', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `oa_orgstr` VALUES ('1611', '3B889CEBA4D3', '秦亚楠', '51234', '销售', '0', '4029', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `oa_orgstr` VALUES ('1612', '21299E599092', '田丽53809', '53809', '销售', '0', '4030', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `oa_orgstr` VALUES ('1613', 'EFA977875AA5', '陈军进', '37112', '销售', '0', '4030', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `oa_orgstr` VALUES ('1614', '520D853CCAB9', '张家彬', '53855', '销售', '0', '4030', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `oa_orgstr` VALUES ('1615', '2EAD89DDF641', '顾巍巍', '39151', '销售', '0', '4030', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `oa_orgstr` VALUES ('1616', 'DD11BF584DF5', '王晓芳', '39136', '销售', '0', '4030', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `oa_orgstr` VALUES ('1617', '1326FD2D34D4', '刘泽波', '39154', '销售', '0', '4032', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `oa_orgstr` VALUES ('1618', 'A012F4A1D205', '张德玉', '39232', '销售', '0', '4032', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `oa_orgstr` VALUES ('1619', '3B8901C90FD7', '郝伟', '51254', '销售', '0', '4032', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `oa_orgstr` VALUES ('1620', '4F7C6A8016E7', '孟艳荣', '51249', '销售', '0', '4037', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1621', '4F7C514DE452', '高慧', '51259', '销售', '0', '4037', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1622', '9A3D3436F997', '王丹丹', '56155', '销售', '0', '4037', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1623', '9A3D4C49E140', '邢强', '56199', '销售', '0', '4037', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1624', '3E3F97DC2D06', '特日根', '53831', '销售', '0', '4037', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1625', '613B06E772D8', '张晓娜', '37161', '销售', '0', '4037', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1626', '192AAB61BF68', '孙文', '53816', '销售', '0', '4037', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1627', 'E09D7C6F5B96', '马国超', '39255', '销售', '0', '4037', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1628', 'E4EEC5588461', '张晓迪', '39128', '销售', '0', '4037', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1629', '2FA8EE6CA155', '武建军', '51220', '销售', '0', '4039', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1630', 'B5E89CD06EB6', '刘杰瑞', '55052', '销售', '0', '4039', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1631', '191044EFFAD6', '付梦云', '35982', '销售', '0', '4041', '互联网板块-房产-联合区-联合区-南昌-南昌-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1632', '495138000CF3', '朱明富', '37154', '销售', '0', '4041', '互联网板块-房产-联合区-联合区-南昌-南昌-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1633', '5A4205A6C211', '鲁志亮', '38305', '销售', '0', '4041', '互联网板块-房产-联合区-联合区-南昌-南昌-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1634', '2665F7DF0201', '张伟伟', '54875', '销售', '0', '4043', '互联网板块-房产-苏南区-苏南-南通-南通-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1635', '90FF788E0398', '吕松霖', '53576', '销售', '0', '4043', '互联网板块-房产-苏南区-苏南-南通-南通-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1636', '71E7B533E114', '龚成成', '51744', '销售', '0', '4043', '互联网板块-房产-苏南区-苏南-南通-南通-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1637', '2DBF0783AC64', '吴倩', '37332', '销售', '0', '4043', '互联网板块-房产-苏南区-苏南-南通-南通-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1638', '3151B026C969', '成志祥', '51720', '销售', '0', '4043', '互联网板块-房产-苏南区-苏南-南通-南通-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1639', '912E95DA7E62', '徐轩', '53594', '销售', '0', '4043', '互联网板块-房产-苏南区-苏南-南通-南通-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1640', '508323661C15', '钱江', '54892', '销售', '0', '4047', '互联网板块-房产-苏南区-苏南-南通-南通-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1641', '181144CBB3A2', '王露37039', '37039', '销售', '0', '4047', '互联网板块-房产-苏南区-苏南-南通-南通-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1642', 'BD0BBA480E89', '陈彦均', '51792', '销售', '0', '4047', '互联网板块-房产-苏南区-苏南-南通-南通-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1643', 'DD69941ADD81', '韩佳玢', '54937', '销售', '0', '4047', '互联网板块-房产-苏南区-苏南-南通-南通-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1644', '6C784E464B71', '曹长青', '51734', '销售', '0', '4047', '互联网板块-房产-苏南区-苏南-南通-南通-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1645', 'AD1718CC7E68', '华竹佳', '51193', '销售', '0', '4049', '互联网板块-房产-无锡-无锡-无锡-无锡-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1646', 'B65CE6ACB300', '蒋纯文', '52857', '销售', '0', '4049', '互联网板块-房产-无锡-无锡-无锡-无锡-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1647', 'C393B5784560', '惠津桦', '51155', '销售', '0', '4049', '互联网板块-房产-无锡-无锡-无锡-无锡-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1648', 'BE3D26BD3434', '秦汉', '52869', '销售', '0', '4049', '互联网板块-房产-无锡-无锡-无锡-无锡-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1649', '06553BF333A3', '郑江明', '36223', '销售', '0', '4049', '互联网板块-房产-无锡-无锡-无锡-无锡-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1650', '81E4994B7D62', '于学仕', '34985', '销售', '0', '4052', '互联网板块-房产-武汉-武汉-武汉-武汉-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1651', '22D41D4B3ED5', '胡时佳', '38445', '销售', '0', '4052', '互联网板块-房产-武汉-武汉-武汉-武汉-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1652', '26B2A7ACF0A3', '郭冰琤', '38326', '销售', '0', '4052', '互联网板块-房产-武汉-武汉-武汉-武汉-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1653', '103BCF936C91', '王晶', '50503', '销售', '0', '4052', '互联网板块-房产-武汉-武汉-武汉-武汉-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1654', '13E6F011EF51', '沈来源', '50543', '销售', '0', '4052', '互联网板块-房产-武汉-武汉-武汉-武汉-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1655', '31CDCBE8F603', '艾敬', '58105', '销售', '0', '4052', '互联网板块-房产-武汉-武汉-武汉-武汉-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1656', '37CE5E66A503', '田刚', '34675', '销售', '0', '4052', '互联网板块-房产-武汉-武汉-武汉-武汉-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1657', '2911758896B4', '刘明洁', '38447', '销售', '0', '4052', '互联网板块-房产-武汉-武汉-武汉-武汉-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1658', '145C53077032', '张泰秋　', '38367', '销售', '0', '4054', '互联网板块-房产-武汉-武汉-武汉-武汉-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1659', 'BD2C2249E5B5', '曹佳思', '38413', '销售', '0', '4054', '互联网板块-房产-武汉-武汉-武汉-武汉-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1660', '878C6A9AE95D', '韩莉娟', '32081', '销售', '0', '4054', '互联网板块-房产-武汉-武汉-武汉-武汉-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1661', '1F3256788B47', '徐静', '32120', '销售', '0', '4054', '互联网板块-房产-武汉-武汉-武汉-武汉-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1662', 'C4A4151820D9', '晏丹', '31199', '销售', '0', '4054', '互联网板块-房产-武汉-武汉-武汉-武汉-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1663', 'C3A7D95DA444', '邹雅雪', '38334', '销售', '0', '4056', '互联网板块-房产-武汉-武汉-武汉-武汉-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1664', '46F01F783874', '张莉36621', '36621', '销售', '0', '4056', '互联网板块-房产-武汉-武汉-武汉-武汉-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1665', 'CE35FFEE00D6', '张辉', '38496', '销售', '0', '4056', '互联网板块-房产-武汉-武汉-武汉-武汉-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1666', '530173960D96', '王舒伟', '50512', '销售', '0', '4056', '互联网板块-房产-武汉-武汉-武汉-武汉-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1667', '13E6F9E9D358', '吴霄', '50544', '销售', '0', '4056', '互联网板块-房产-武汉-武汉-武汉-武汉-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1668', 'D6284E8DAD94', '孙文涛', '33078', '销售', '0', '4056', '互联网板块-房产-武汉-武汉-武汉-武汉-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1669', 'AC551EE7FCE6', '陈金文', '50568', '销售', '0', '4056', '互联网板块-房产-武汉-武汉-武汉-武汉-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1670', 'C2C91FDFD4F8', '王冶青', '34312', '销售', '0', '4056', '互联网板块-房产-武汉-武汉-武汉-武汉-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1671', '9A550EDA8A51', '叶华英', '38477', '销售', '0', '4056', '互联网板块-房产-武汉-武汉-武汉-武汉-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1672', '7.37516E+11', '黄冠', '36749', '销售', '0', '4056', '互联网板块-房产-武汉-武汉-武汉-武汉-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1673', '37CE2A6D1FD0', '朱彧', '38368', '销售', '0', '4056', '互联网板块-房产-武汉-武汉-武汉-武汉-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1674', '80E385E257FA', '王宽', '32858', '销售', '0', '4056', '互联网板块-房产-武汉-武汉-武汉-武汉-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1675', 'B28E6536D528', '杨望', '51936', '销售', '0', '4058', '互联网板块-房产-长沙-长沙-长沙-长沙-销售五组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1676', '732BA95540D5', '董国彬', '51928', '销售', '0', '4058', '互联网板块-房产-长沙-长沙-长沙-长沙-销售五组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1677', '732B8A3429B0', '肖鸣', '51926', '销售', '0', '4058', '互联网板块-房产-长沙-长沙-长沙-长沙-销售五组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1678', '3A9404F12FB8', '魏凯51915', '51915', '销售', '0', '4058', '互联网板块-房产-长沙-长沙-长沙-长沙-销售五组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1679', '732BBF3330A5', '邓孟', '51929', '销售', '0', '4058', '互联网板块-房产-长沙-长沙-长沙-长沙-销售五组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1680', '800E099CF2D5', '陈淡淡', '54218', '销售', '0', '4058', '互联网板块-房产-长沙-长沙-长沙-长沙-销售五组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1681', '9E3083B398B8', '袁湘', '54227', '销售', '0', '4058', '互联网板块-房产-长沙-长沙-长沙-长沙-销售五组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1682', 'C61CC814D623', '曾申', '38412', '销售', '0', '4058', '互联网板块-房产-长沙-长沙-长沙-长沙-销售五组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1683', '800E05BBEF06', '曾丰', '54216', '销售', '0', '4058', '互联网板块-房产-长沙-长沙-长沙-长沙-销售五组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1684', '1F73F9E54F64', '石曼', '54260', '销售', '0', '4058', '互联网板块-房产-长沙-长沙-长沙-长沙-销售五组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1685', '778EDA484F42', '覃文涛', '38313', '销售', '0', '4058', '互联网板块-房产-长沙-长沙-长沙-长沙-销售五组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1686', '1F73F6EFB163', '李想', '54257', '销售', '0', '4058', '互联网板块-房产-长沙-长沙-长沙-长沙-销售五组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1687', '911CC63BA656', '丁青云', '51933', '销售', '0', '4060', '互联网板块-房产-长沙-长沙-长沙-长沙-销售六组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1688', 'D9AFD36E5582', '肖金元', '51956', '销售', '0', '4060', '互联网板块-房产-长沙-长沙-长沙-长沙-销售六组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1689', '90D5A558CCC7', '刘潇荻', '51978', '销售', '0', '4060', '互联网板块-房产-长沙-长沙-长沙-长沙-销售六组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1690', '02052571A420', '谭妙红', '54251', '销售', '0', '4060', '互联网板块-房产-长沙-长沙-长沙-长沙-销售六组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1691', '020528CFE958', '曹菁', '54243', '销售', '0', '4060', '互联网板块-房产-长沙-长沙-长沙-长沙-销售六组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1692', '39266F238530', '邓胡娟', '33386', '销售', '0', '4060', '互联网板块-房产-长沙-长沙-长沙-长沙-销售六组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1693', 'A5B517B2E327', '刘江', '54235', '销售', '0', '4060', '互联网板块-房产-长沙-长沙-长沙-长沙-销售六组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1694', '02052C4823F1', '侯志宏', '54249', '销售', '0', '4060', '互联网板块-房产-长沙-长沙-长沙-长沙-销售六组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1695', 'C6382A2FBCA8', '王曙煜', '38582', '销售', '0', '4062', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售四组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1696', '9A61152757E5', '楼霖', '38664', '销售', '0', '4062', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售四组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1697', '10265CE0C0C7', '王成君', '38603', '销售', '0', '4063', '互联网板块-房产-浙闽区-福建-福州-福州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1698', '1026A490C9B4', '范丽琴', '38606', '销售', '0', '4063', '互联网板块-房产-浙闽区-福建-福州-福州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1699', '10268D9CEA58', '王陶', '38605', '销售', '0', '4063', '互联网板块-房产-浙闽区-福建-福州-福州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1700', 'FFE58745C2B5', '倪婷', '54691', '销售', '0', '4063', '互联网板块-房产-浙闽区-福建-福州-福州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1701', 'D41B8E283701', '陈晓林', '57430', '销售', '0', '4063', '互联网板块-房产-浙闽区-福建-福州-福州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1702', '1026736A1BD7', '洪瑜舒', '38604', '销售', '0', '4063', '互联网板块-房产-浙闽区-福建-福州-福州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1703', '10273833EE87', '陈渊', '38608', '销售', '0', '4063', '互联网板块-房产-浙闽区-福建-福州-福州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1704', '1026BD61C694', '林建立', '38607', '销售', '0', '4065', '互联网板块-房产-浙闽区-福建-福州-福州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1705', 'D207CBDFEC90', '施向薇', '50637', '销售', '0', '4065', '互联网板块-房产-浙闽区-福建-福州-福州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1706', '26CBDBB301D8', '杨碧兰', '38637', '销售', '0', '4068', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1707', '26CBC8C7B718', '林宝琴', '38638', '销售', '0', '4068', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1708', '9ADA31DCF795', '黄国铭', '38692', '销售', '0', '4068', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1709', 'ABC43F451F61', '王文欣', '50612', '销售', '0', '4068', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1710', '6A8C590434C6', '卓宜旭', '57472', '销售', '0', '4068', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1711', '38A35CD8A890', '肖佳佳', '54719', '销售', '0', '4070', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1712', '8FEDB32651C3', '谢涛', '38688', '销售', '0', '4070', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1713', 'CB1C55BC5E80', '黄志钦', '57431', '销售', '0', '4070', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1714', 'CD17F7AE2AD8', '陈翠', '39589', '销售', '0', '4072', '互联网板块-房产-重庆-重庆-重庆-重庆-销售四组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1715', '70C7C99E8EA0', '曾婷', '34555', '销售', '0', '4072', '互联网板块-房产-重庆-重庆-重庆-重庆-销售四组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1716', '9B95F3DBC837', '王娟1', '56076', '销售', '0', '4072', '互联网板块-房产-重庆-重庆-重庆-重庆-销售四组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1717', 'D961E81C2029', '陈利', '36133', '销售', '0', '4072', '互联网板块-房产-重庆-重庆-重庆-重庆-销售四组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1718', '7B4CD675B7E3', '陶佳', '39561', '销售', '0', '4072', '互联网板块-房产-重庆-重庆-重庆-重庆-销售四组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1719', '34BC3B45D1E9', '罗颖1', '54840', '销售', '0', '4072', '互联网板块-房产-重庆-重庆-重庆-重庆-销售四组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1720', 'DB6E45300B63', '陆莉', '34733', '销售', '0', '4072', '互联网板块-房产-重庆-重庆-重庆-重庆-销售四组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1721', 'B13E5534F5B2', '胡蓉', '39586', '销售', '0', '4072', '互联网板块-房产-重庆-重庆-重庆-重庆-销售四组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1722', '26E6066BD4F9', '谭巧君', '39544', '销售', '0', '4074', '互联网板块-房产-重庆-重庆-重庆-重庆-销售五组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1723', '17985666F004', '左涛', '36127', '销售', '0', '4074', '互联网板块-房产-重庆-重庆-重庆-重庆-销售五组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1724', 'CCE35B2A4277', '杨菲', '51691', '销售', '0', '4074', '互联网板块-房产-重庆-重庆-重庆-重庆-销售五组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1725', 'A816CDC412B0', '谢燕林39582', '39582', '销售', '0', '4074', '互联网板块-房产-重庆-重庆-重庆-重庆-销售五组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1726', '8FF6B02B55F0', '谢谭阳', '54182', '销售', '0', '4074', '互联网板块-房产-重庆-重庆-重庆-重庆-销售五组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1727', '045B274B2D82', '敖琴', '51600', '销售', '0', '4074', '互联网板块-房产-重庆-重庆-重庆-重庆-销售五组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1728', '7882121A7A30', '刘守彥', '39513', '销售', '0', '4074', '互联网板块-房产-重庆-重庆-重庆-重庆-销售五组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1729', 'FB61A3A00AA0', '谢溧琦', '56100', '销售', '0', '4074', '互联网板块-房产-重庆-重庆-重庆-重庆-销售五组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1730', '8FF66D7719D9', '胡腾', '54189', '销售', '0', '4076', '互联网板块-房产-重庆-重庆-重庆-重庆-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1731', '63C8549D2954', '王雅萱', '56057', '销售', '0', '4076', '互联网板块-房产-重庆-重庆-重庆-重庆-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1732', '9E016E593725', '杨峻烨', '56068', '销售', '0', '4076', '互联网板块-房产-重庆-重庆-重庆-重庆-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1733', 'D961A045E686', '郭昭红', '54817', '销售', '0', '4076', '互联网板块-房产-重庆-重庆-重庆-重庆-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1734', '482F6AF38199', '陈应', '37384', '销售', '0', '4076', '互联网板块-房产-重庆-重庆-重庆-重庆-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1735', '1DA5A7EE6510', '唐宇', '39541', '销售', '0', '4076', '互联网板块-房产-重庆-重庆-重庆-重庆-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1736', '1FEE66E2B4E3', '黄念', '51694', '销售', '0', '4076', '互联网板块-房产-重庆-重庆-重庆-重庆-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1737', '804DF7D94BAD', '张凯', '33360', '销售', '0', '4076', '互联网板块-房产-重庆-重庆-重庆-重庆-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1738', '3B722970B2C2', '袁静', '51640', '销售', '0', '4076', '互联网板块-房产-重庆-重庆-重庆-重庆-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1739', 'D5FF28A35FA1', '杜双', '51679', '销售', '0', '4076', '互联网板块-房产-重庆-重庆-重庆-重庆-销售六组-组员');
INSERT INTO `oa_orgstr` VALUES ('1740', '3B7215A8BE23', '李超36683', '36683', '销售', '0', '4078', '互联网板块-房产-重庆-重庆-重庆-重庆-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1741', '617E31A9E64A', '王莲莲', '35840', '销售', '0', '4078', '互联网板块-房产-重庆-重庆-重庆-重庆-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1742', '71C35C32B7B0', '颜欣', '39557', '销售', '0', '4078', '互联网板块-房产-重庆-重庆-重庆-重庆-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1743', '86C85F1EEA45', '周雯霞', '51655', '销售', '0', '4078', '互联网板块-房产-重庆-重庆-重庆-重庆-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1744', '8FF6D6B6C318', '刘纲', '54114', '销售', '0', '4078', '互联网板块-房产-重庆-重庆-重庆-重庆-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1745', 'CC00AC5BEB38', '张琴', '56091', '销售', '0', '4078', '互联网板块-房产-重庆-重庆-重庆-重庆-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1746', 'ECBDD0094C16', '吴晓薇36559', '36559', '销售', '0', '4078', '互联网板块-房产-重庆-重庆-重庆-重庆-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1747', 'E4023DCB8BF2', '周娅', '56094', '销售', '0', '4078', '互联网板块-房产-重庆-重庆-重庆-重庆-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1748', '8FF66963D098', '周径竹', '54751', '销售', '0', '4078', '互联网板块-房产-重庆-重庆-重庆-重庆-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1749', '9C07FD462234', '魏兴利', '39574', '销售', '0', '4078', '互联网板块-房产-重庆-重庆-重庆-重庆-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1750', 'D9619A5B61A6', '谭丽娟', '54816', '销售', '0', '4080', '互联网板块-房产-重庆-重庆-重庆-重庆-销售八组-组员');
INSERT INTO `oa_orgstr` VALUES ('1751', 'C866F6B4C976', '张爱迪', '32734', '销售', '0', '4080', '互联网板块-房产-重庆-重庆-重庆-重庆-销售八组-组员');
INSERT INTO `oa_orgstr` VALUES ('1752', 'FD955B1E1C87', '彭维', '51681', '销售', '0', '4080', '互联网板块-房产-重庆-重庆-重庆-重庆-销售八组-组员');
INSERT INTO `oa_orgstr` VALUES ('1753', 'CC00B606FDD7', '曾涛', '56092', '销售', '0', '4080', '互联网板块-房产-重庆-重庆-重庆-重庆-销售八组-组员');
INSERT INTO `oa_orgstr` VALUES ('1754', '8FF6A3D15153', '宋文芳', '54113', '销售', '0', '4080', '互联网板块-房产-重庆-重庆-重庆-重庆-销售八组-组员');
INSERT INTO `oa_orgstr` VALUES ('1755', 'CCE397C43FF8', '李阳', '37292', '销售', '0', '4080', '互联网板块-房产-重庆-重庆-重庆-重庆-销售八组-组员');
INSERT INTO `oa_orgstr` VALUES ('1756', 'BFA63624B236', '廖红英', '51677', '销售', '0', '4080', '互联网板块-房产-重庆-重庆-重庆-重庆-销售八组-组员');
INSERT INTO `oa_orgstr` VALUES ('1757', 'BBE276D2C552', '邓世伟', '39584', '销售', '0', '4080', '互联网板块-房产-重庆-重庆-重庆-重庆-销售八组-组员');
INSERT INTO `oa_orgstr` VALUES ('1758', 'A6A7234F9CD3', '郭莉', '39577', '销售', '0', '4080', '互联网板块-房产-重庆-重庆-重庆-重庆-销售八组-组员');
INSERT INTO `oa_orgstr` VALUES ('1759', '2935B6639BC7', '赵莹莹', '34987', '销售', '0', '4082', '互联网板块-房产-重庆-重庆-重庆-重庆-销售九组-组员');
INSERT INTO `oa_orgstr` VALUES ('1760', '5C3035E0C6A6', '若扎·木哈什', '54112', '销售', '0', '4082', '互联网板块-房产-重庆-重庆-重庆-重庆-销售九组-组员');
INSERT INTO `oa_orgstr` VALUES ('1761', '6B7A3DED6CDE', '杨富裕', '32671', '销售', '0', '4082', '互联网板块-房产-重庆-重庆-重庆-重庆-销售九组-组员');
INSERT INTO `oa_orgstr` VALUES ('1762', '732C6CE1B799', '刘念', '51645', '销售', '0', '4082', '互联网板块-房产-重庆-重庆-重庆-重庆-销售九组-组员');
INSERT INTO `oa_orgstr` VALUES ('1763', '86C8488725D8', '袁可欣', '51653', '销售', '0', '4082', '互联网板块-房产-重庆-重庆-重庆-重庆-销售九组-组员');
INSERT INTO `oa_orgstr` VALUES ('1764', '86C873DB9858', '刘岚', '51656', '销售', '0', '4082', '互联网板块-房产-重庆-重庆-重庆-重庆-销售九组-组员');
INSERT INTO `oa_orgstr` VALUES ('1765', '8EF1CFCFE193', '梁艳', '39570', '销售', '0', '4082', '互联网板块-房产-重庆-重庆-重庆-重庆-销售九组-组员');
INSERT INTO `oa_orgstr` VALUES ('1766', 'FD95A175F956', '周子航', '51682', '销售', '0', '4082', '互联网板块-房产-重庆-重庆-重庆-重庆-销售九组-组员');
INSERT INTO `oa_orgstr` VALUES ('1767', 'FB3FD320D2D1', '刘亚玲', '32929', '销售', '0', '4082', '互联网板块-房产-重庆-重庆-重庆-重庆-销售九组-组员');
INSERT INTO `oa_orgstr` VALUES ('1768', '36316D8FAA34', '李念', '54111', '销售', '0', '4082', '互联网板块-房产-重庆-重庆-重庆-重庆-销售九组-组员');
INSERT INTO `oa_orgstr` VALUES ('1769', '63C83425B462', '李卫川1', '54846', '销售', '0', '4082', '互联网板块-房产-重庆-重庆-重庆-重庆-销售九组-组员');
INSERT INTO `oa_orgstr` VALUES ('1770', 'B13E35AED679', '向婷婷', '39585', '销售', '0', '4082', '互联网板块-房产-重庆-重庆-重庆-重庆-销售九组-组员');
INSERT INTO `oa_orgstr` VALUES ('1771', 'A6A73964FF70', '叶小龙', '39578', '销售', '0', '4082', '互联网板块-房产-重庆-重庆-重庆-重庆-销售九组-组员');
INSERT INTO `oa_orgstr` VALUES ('1772', '98291D2FA1A8', '邵帅', '51660', '销售', '0', '4082', '互联网板块-房产-重庆-重庆-重庆-重庆-销售九组-组员');
INSERT INTO `oa_orgstr` VALUES ('1773', '6792DC14A7F2', '谭娜', '56106', '销售', '0', '4082', '互联网板块-房产-重庆-重庆-重庆-重庆-销售九组-组员');
INSERT INTO `oa_orgstr` VALUES ('1774', '3FA4E8020CE7', '刘兰佳', '39547', '销售', '0', '4084', '互联网板块-房产-重庆-重庆-重庆-重庆-销售十组-组员');
INSERT INTO `oa_orgstr` VALUES ('1775', 'FB3F5A0FD089', '李娟39594', '39594', '销售', '0', '4084', '互联网板块-房产-重庆-重庆-重庆-重庆-销售十组-组员');
INSERT INTO `oa_orgstr` VALUES ('1776', '5BEB94723D18', '郭琴', '54834', '销售', '0', '4084', '互联网板块-房产-重庆-重庆-重庆-重庆-销售十组-组员');
INSERT INTO `oa_orgstr` VALUES ('1777', '751296437D88', '杨成红', '56064', '销售', '0', '4084', '互联网板块-房产-重庆-重庆-重庆-重庆-销售十组-组员');
INSERT INTO `oa_orgstr` VALUES ('1778', '9E0172A2E080', '冯佳', '56080', '销售', '0', '4084', '互联网板块-房产-重庆-重庆-重庆-重庆-销售十组-组员');
INSERT INTO `oa_orgstr` VALUES ('1779', '34BC34E74FF7', '向梦妮', '54838', '销售', '0', '4084', '互联网板块-房产-重庆-重庆-重庆-重庆-销售十组-组员');
INSERT INTO `oa_orgstr` VALUES ('1780', '6375467CC355', '曾于兰', '33174', '销售', '0', '4084', '互联网板块-房产-重庆-重庆-重庆-重庆-销售十组-组员');
INSERT INTO `oa_orgstr` VALUES ('1781', 'FB3F83470414', '甘玲', '39595', '销售', '0', '4084', '互联网板块-房产-重庆-重庆-重庆-重庆-销售十组-组员');
INSERT INTO `oa_orgstr` VALUES ('1782', 'FB3FAF4F49D8', '周程然39597', '39597', '销售', '0', '4084', '互联网板块-房产-重庆-重庆-重庆-重庆-销售十组-组员');
INSERT INTO `oa_orgstr` VALUES ('1783', 'D96127882A24', '李巍', '54753', '销售', '0', '4084', '互联网板块-房产-重庆-重庆-重庆-重庆-销售十组-组员');
INSERT INTO `oa_orgstr` VALUES ('1784', 'D95F667A9875', '蒋蕊宇', '54790', '销售', '0', '4084', '互联网板块-房产-重庆-重庆-重庆-重庆-销售十组-组员');
INSERT INTO `oa_orgstr` VALUES ('1785', 'A6A6C1E87381', '刘雨念', '39573', '销售', '0', '4084', '互联网板块-房产-重庆-重庆-重庆-重庆-销售十组-组员');
INSERT INTO `oa_orgstr` VALUES ('1786', '451A697C8871', '黄伟50985', '50985', '销售', '0', '4085', '互联网板块-房产-北方区-北方-北京-北京-销售三部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('1787', '606FBF750F63', '廖巍', '51035', '销售', '0', '4085', '互联网板块-房产-北方区-北方-北京-北京-销售三部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('1788', 'C76DA2BDDA81', '赵峥', '52679', '销售', '0', '4085', '互联网板块-房产-北方区-北方-北京-北京-销售三部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('1789', '6AABFE4594C9', '刘鼎奇', '53223', '销售', '0', '4085', '互联网板块-房产-北方区-北方-北京-北京-销售三部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('1790', 'E87D44AC4D56', '高强', '30483', '销售', '0', '4085', '互联网板块-房产-北方区-北方-北京-北京-销售三部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('1791', 'F15205E8FF34', '贾春生', '33225', '销售', '0', '4085', '互联网板块-房产-北方区-北方-北京-北京-销售三部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('1792', 'A1668872C976', '王彩虹', '39880', '销售', '0', '4085', '互联网板块-房产-北方区-北方-北京-北京-销售三部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('1793', '14CBB77EF35F', '白秀娟', '32467', '销售', '0', '4085', '互联网板块-房产-北方区-北方-北京-北京-销售三部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('1794', '235F15636876', '郭玥', '32446', '销售', '0', '4085', '互联网板块-房产-北方区-北方-北京-北京-销售三部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('1795', 'A16664822FD5', '曲云玲', '39873', '销售', '0', '4085', '互联网板块-房产-北方区-北方-北京-北京-销售三部1组-组员');
INSERT INTO `oa_orgstr` VALUES ('1796', 'DC39DE21F3B8', '马冬雪', '55264', '销售', '0', '4087', '互联网板块-房产-北方区-北方-北京-北京-销售三部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('1797', '26ED97B88E55', '张跃39838', '39838', '销售', '0', '4087', '互联网板块-房产-北方区-北方-北京-北京-销售三部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('1798', '0BFEB63DA031', '王万丽', '50918', '销售', '0', '4087', '互联网板块-房产-北方区-北方-北京-北京-销售三部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('1799', '9263D39BC486', '陈羽', '32417', '销售', '0', '4087', '互联网板块-房产-北方区-北方-北京-北京-销售三部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('1800', '038A3EEF2616', '马红园', '32465', '销售', '0', '4087', '互联网板块-房产-北方区-北方-北京-北京-销售三部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('1801', 'B0E36BCEF037', '张永斌', '32401', '销售', '0', '4087', '互联网板块-房产-北方区-北方-北京-北京-销售三部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('1802', '2A186C58E219', '管如龙', '32466', '销售', '0', '4087', '互联网板块-房产-北方区-北方-北京-北京-销售三部2组-组员');
INSERT INTO `oa_orgstr` VALUES ('1803', '197753FD1A92', '莫玲', '31809', '销售', '0', '4089', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1804', '24E36B6E7B47', '古玲', '54033', '销售', '0', '4089', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1805', '912EE00E30B7', '蒋彪', '54070', '销售', '0', '4089', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1806', '045B7895F200', '唐珏', '51601', '销售', '0', '4096', '互联网板块-房产-重庆-重庆-重庆-重庆-销售十一组（停）-组员');
INSERT INTO `oa_orgstr` VALUES ('1807', '1811BDF2D439', '唐晓', '51612', '销售', '0', '4096', '互联网板块-房产-重庆-重庆-重庆-重庆-销售十一组（停）-组员');
INSERT INTO `oa_orgstr` VALUES ('1808', 'D5FFFDBBBCD1', '徐香', '51680', '销售', '0', '4096', '互联网板块-房产-重庆-重庆-重庆-重庆-销售十一组（停）-组员');
INSERT INTO `oa_orgstr` VALUES ('1809', '372232C51AF5', '吕晓青36495', '36495', '销售', '0', '4182', '互联网板块-房产-北方区-北方-西安-西安-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1810', '46666A7774D5', '张超50981', '50981', '销售', '0', '4182', '互联网板块-房产-北方区-北方-西安-西安-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1811', '001A1B218807', '陈立智', '53143', '销售', '0', '4182', '互联网板块-房产-北方区-北方-西安-西安-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1812', '88ABCABE4B37', '李牧', '39111', '销售', '0', '4182', '互联网板块-房产-北方区-北方-西安-西安-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1813', 'BCE0D55AE6B3', '侯晓亮', '52682', '销售', '0', '4182', '互联网板块-房产-北方区-北方-西安-西安-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1814', 'CCE12A9762AD', '袁震', '32614', '销售', '0', '4182', '互联网板块-房产-北方区-北方-西安-西安-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1815', '27F7B9027A7A', '禹龙', '32314', '销售', '0', '4184', '互联网板块-房产-北方区-北方-西安-西安-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1816', 'CE60EF205941', '黄文祺', '33328', '销售', '0', '4184', '互联网板块-房产-北方区-北方-西安-西安-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1817', 'E40CFA14107F', '张小龙', '30779', '销售', '0', '4184', '互联网板块-房产-北方区-北方-西安-西安-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1818', '8518E26833B7', '李璐', '53239', '销售', '0', '4184', '互联网板块-房产-北方区-北方-西安-西安-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1819', '3C8A27795313', '苏劲男', '53174', '销售', '0', '4184', '互联网板块-房产-北方区-北方-西安-西安-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1820', '5A3DFDB5F264', '杨哲', '37202', '销售', '0', '4184', '互联网板块-房产-北方区-北方-西安-西安-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1821', '50812083ECFC', '程洋阳', '35225', '销售', '0', '4214', '互联网板块-房产-北方区-北方-西安-西安-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1822', '4E5E32213D08', '贾晓鹏', '51010', '销售', '0', '4214', '互联网板块-房产-北方区-北方-西安-西安-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1823', '001A415DCAB8', '薛昉', '53142', '销售', '0', '4214', '互联网板块-房产-北方区-北方-西安-西安-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1824', '114832AC8F16', '王静36093', '36093', '销售', '0', '4214', '互联网板块-房产-北方区-北方-西安-西安-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1825', '3B2B5F4A5DB6', '邸堃53191', '53191', '销售', '0', '4214', '互联网板块-房产-北方区-北方-西安-西安-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1826', '1147F5E2E8F1', '薛峰', '36049', '销售', '0', '4214', '互联网板块-房产-北方区-北方-西安-西安-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1827', '0E4D58781F65', '潘玮', '32173', '销售', '0', '4214', '互联网板块-房产-北方区-北方-西安-西安-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1828', 'BAAAED80D752', '周涛', '31014', '销售', '0', '4215', '互联网板块-房产-北方区-北方-西安-西安-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1829', '48C254B47485', '满广济', '34258', '销售', '0', '4215', '互联网板块-房产-北方区-北方-西安-西安-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1830', '3721E25D6694', '姬萌轩', '36519', '销售', '0', '4215', '互联网板块-房产-北方区-北方-西安-西安-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1831', '9A57E3158334', '韩永强', '52601', '销售', '0', '4216', '互联网板块-房产-北方区-北方-西安-西安-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('1832', 'BA739BB12E84', '张璐', '52669', '销售', '0', '4216', '互联网板块-房产-北方区-北方-西安-西安-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('1833', 'FD73DCEF5036', '张阵', '51210', '销售', '0', '4216', '互联网板块-房产-北方区-北方-西安-西安-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('1834', '1299E90E3E85', '蔺俐', '53163', '销售', '0', '4216', '互联网板块-房产-北方区-北方-西安-西安-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('1835', '5A3E48025314', '宋寒冰', '32198', '销售', '0', '4216', '互联网板块-房产-北方区-北方-西安-西安-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('1836', '5A3CFFB86DE8', '童文', '39101', '销售', '0', '4216', '互联网板块-房产-北方区-北方-西安-西安-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('1837', 'E6951A1B7A8A', '王雅婷', '34379', '销售', '0', '4218', '互联网板块-房产-华南区-华南区-惠州-惠州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1838', '184F5628B590', '胡军', '50341', '销售', '0', '4218', '互联网板块-房产-华南区-华南区-惠州-惠州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1839', 'BD0DC2107C83', '郑凯帆', '52765', '销售', '0', '4218', '互联网板块-房产-华南区-华南区-惠州-惠州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1840', '2EF1006E40E4', '卢卫民', '37201', '销售', '0', '4221', '互联网板块-房产-华南区-华南区-佛山-佛山-销售四组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1841', '656B26B57F3E', '付欢欢', '32590', '销售', '0', '4221', '互联网板块-房产-华南区-华南区-佛山-佛山-销售四组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1842', '27AFFE2BDE97', '王哲', '55583', '销售', '0', '4221', '互联网板块-房产-华南区-华南区-佛山-佛山-销售四组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1843', '27B00B9AC139', '陈国键', '36416', '销售', '0', '4221', '互联网板块-房产-华南区-华南区-佛山-佛山-销售四组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1844', '0C640C887E65', '梁木材', '38155', '销售', '0', '4221', '互联网板块-房产-华南区-华南区-佛山-佛山-销售四组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1845', '3D39E673BBF3', '谭健冬', '37370', '销售', '0', '4221', '互联网板块-房产-华南区-华南区-佛山-佛山-销售四组-销售员');
INSERT INTO `oa_orgstr` VALUES ('1846', 'D628A7978570', '董嘉', '38014', '销售', '0', '4232', '互联网板块-房产-北方区-北方-太原-太原-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1847', 'B528118E3940', '杨瑞', '52608', '销售', '0', '4232', '互联网板块-房产-北方区-北方-太原-太原-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1848', '3BBEB8446D40', '薛建锋', '50978', '销售', '0', '4232', '互联网板块-房产-北方区-北方-太原-太原-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1849', 'E7A9F2115033', '武卫', '37944', '销售', '0', '4232', '互联网板块-房产-北方区-北方-太原-太原-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1850', '4E51C99F2091', '彭鹏', '51151', '销售', '0', '4234', '互联网板块-房产-东部区-徐州-徐州-徐州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1851', '911EFEB78A86', '郑玉皛', '51182', '销售', '0', '4234', '互联网板块-房产-东部区-徐州-徐州-徐州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1852', '121DE3AF8BE6', '车燕', '55466', '销售', '0', '4234', '互联网板块-房产-东部区-徐州-徐州-徐州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1853', '121DE7BE17B1', '王喃', '55465', '销售', '0', '4234', '互联网板块-房产-东部区-徐州-徐州-徐州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1854', '121DF0378FE2', '武可', '55463', '销售', '0', '4234', '互联网板块-房产-东部区-徐州-徐州-徐州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1855', 'DAC8562E8C89', '徐冉55504', '55504', '销售', '0', '4234', '互联网板块-房产-东部区-徐州-徐州-徐州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1856', 'DF47BE2D70A1', '罗迪', '39079', '销售', '0', '4234', '互联网板块-房产-东部区-徐州-徐州-徐州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1857', '3D048E7FDDB6', '于晓娟', '39094', '销售', '0', '4236', '互联网板块-房产-东部区-徐州-徐州-徐州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1858', 'E51493639358', '赵晖', '38962', '销售', '0', '4236', '互联网板块-房产-东部区-徐州-徐州-徐州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1859', 'AE0F7644DE87', '赵憧', '52899', '销售', '0', '4236', '互联网板块-房产-东部区-徐州-徐州-徐州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1860', '121DEB6A3D19', '陈杰菲', '55464', '销售', '0', '4236', '互联网板块-房产-东部区-徐州-徐州-徐州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1861', '1D6112AE5FA1', '许园', '38993', '销售', '0', '4236', '互联网板块-房产-东部区-徐州-徐州-徐州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1862', '9A69C08B4EB5', '李 伟', '50222', '销售', '0', '4254', '互联网板块-房产-华北区-华北区-青岛-青岛-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1863', '0FF5E39DE646', '邓山平', '50286', '销售', '0', '4254', '互联网板块-房产-华北区-华北区-青岛-青岛-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1864', '363C5FB3DF38', '郭青', '35322', '销售', '0', '4254', '互联网板块-房产-华北区-华北区-青岛-青岛-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1865', '4D15A899FA53', '胡伟', '38086', '销售', '0', '4254', '互联网板块-房产-华北区-华北区-青岛-青岛-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1866', '4E1B72D18C40', '潘翔', '51277', '销售', '0', '4256', '互联网板块-房产-联合区-联合区-南昌-南昌-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1867', '08D51F986B31', '彭敏', '55088', '销售', '0', '4256', '互联网板块-房产-联合区-联合区-南昌-南昌-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1868', '5C94825B2792', '吴松', '53861', '销售', '0', '4256', '互联网板块-房产-联合区-联合区-南昌-南昌-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1869', '395A7C023B55', '熊丹丹', '56342', '销售', '0', '4256', '互联网板块-房产-联合区-联合区-南昌-南昌-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1870', '88BB981C5949', '黄文兰', '35392', '销售', '0', '4260', '互联网板块-房产-华南区-华南区-广州-广州-电商组-组员');
INSERT INTO `oa_orgstr` VALUES ('1871', '578FD81752B9', '彭议徵', '34455', '销售', '0', '4265', '互联网板块-房产-武汉-武汉-武汉-武汉-销售八组-组员');
INSERT INTO `oa_orgstr` VALUES ('1872', '9A5A22265DE2', '张磊', '38476', '销售', '0', '4265', '互联网板块-房产-武汉-武汉-武汉-武汉-销售八组-组员');
INSERT INTO `oa_orgstr` VALUES ('1873', '510A75DD5425', '陈婉芬', '31135', '销售', '0', '4265', '互联网板块-房产-武汉-武汉-武汉-武汉-销售八组-组员');
INSERT INTO `oa_orgstr` VALUES ('1874', 'F3CCCD325CE7', '舒智', '50534', '销售', '0', '4265', '互联网板块-房产-武汉-武汉-武汉-武汉-销售八组-组员');
INSERT INTO `oa_orgstr` VALUES ('1875', '75B89C257A04', '邬哲超', '32856', '销售', '0', '4265', '互联网板块-房产-武汉-武汉-武汉-武汉-销售八组-组员');
INSERT INTO `oa_orgstr` VALUES ('1876', '3E5795E360E2', '尹婧', '38560', '销售', '0', '4267', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-电商组-组员');
INSERT INTO `oa_orgstr` VALUES ('1877', '60A829819860', '方智钢', '34423', '销售', '0', '4267', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-电商组-组员');
INSERT INTO `oa_orgstr` VALUES ('1878', '18D9921E0761', '周鸿钧', '50656', '销售', '0', '4296', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1879', '9143AC166BF6', '陈剑清', '54656', '销售', '0', '4296', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1880', '64801393C738', '涂锐烽', '50689', '销售', '0', '4296', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1881', '265589C41D11', '陈晨琳', '38601', '销售', '0', '4296', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1882', '7E3A6787E1F5', '黄艺娟', '54741', '销售', '0', '4296', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1883', '36B3100F8251', '宫玺', '57455', '销售', '0', '4296', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1884', 'A7DF3C74DDD6', '金瑞', '30916', '销售', '0', '4299', '互联网板块-房产-市场部-市场部-市场部-市场部');
INSERT INTO `oa_orgstr` VALUES ('1885', '03D3D7E0A631', '杜婧', '31429', '销售', '0', '4299', '互联网板块-房产-市场部-市场部-市场部-市场部');
INSERT INTO `oa_orgstr` VALUES ('1886', 'B0D29F922003', '张惠', '36346', '销售', '0', '4301', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1887', '20E8BF018B94', '李明明', '36350', '销售', '0', '4301', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1888', '20E8F7CC29A1', '索涛', '36352', '销售', '0', '4301', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1889', '3E39320C4020', '陈琰', '51384', '销售', '0', '4301', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1890', 'B0D2E4DF6397', '曹月', '36985', '销售', '0', '4301', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1891', 'C21E7A448033', '侯名娜', '55062', '销售', '0', '4301', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1892', 'A232BF9FEA22', '郭扬斐', '53886', '销售', '0', '4301', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1893', '581B41436143', '顾健健', '34624', '销售', '0', '4318', '互联网板块-房产-东部区-锡常-常州-常州-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1894', '1AFAEEE435A0', '沈琛', '34797', '销售', '0', '4318', '互联网板块-房产-东部区-锡常-常州-常州-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1895', '79C4A66280D8', '丁爽', '51163', '销售', '0', '4318', '互联网板块-房产-东部区-锡常-常州-常州-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1896', '00CAADF26618', '周锋', '35590', '销售', '0', '4318', '互联网板块-房产-东部区-锡常-常州-常州-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1897', '0A0A08BA0CA6', '王慧萍', '55516', '销售', '0', '4318', '互联网板块-房产-东部区-锡常-常州-常州-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1898', '1710B08BB1F1', '马贵勤', '55518', '销售', '0', '4318', '互联网板块-房产-东部区-锡常-常州-常州-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1899', '4D0D8D4FC07C', '姜犇', '33354', '销售', '0', '4320', '互联网板块-房产-东部区-锡常-常州-常州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('1900', 'BF8A212881F1', '涂轩维', '50621', '销售', '0', '4322', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1901', '3B7C280632E4', '周伟', '50670', '销售', '0', '4322', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1902', '0941F2DE36F1', '苏鑫磊', '54964', '销售', '0', '4322', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1903', 'BF8A86E6CD26', '胡颖芬', '50620', '销售', '0', '4322', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1904', '90BAFCE77B73', '傅溶溶', '54749', '销售', '0', '4322', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1905', '193970BC2570', '顾逸舟', '35591', '销售', '0', '4430', '互联网板块-房产-数据结算部-数据结算部-数据结算部-数据结算部');
INSERT INTO `oa_orgstr` VALUES ('1906', '0FF6072117F8', '徐彬彬', '50285', '销售', '0', '4433', '互联网板块-房产-华北区-华北区-青岛-青岛-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1907', '0FF5F24E1081', '杨汉臣', '50287', '销售', '0', '4433', '互联网板块-房产-华北区-华北区-青岛-青岛-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('1908', 'EFE45C6356B8', '周保鹤', '52121', '销售', '0', '4435', '互联网板块-房产-大连-大连-大连-大连-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1909', '2E204B0B36D6', '张惠惠', '52124', '销售', '0', '4435', '互联网板块-房产-大连-大连-大连-大连-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1910', 'EE74F4A45358', '王博52136', '52136', '销售', '0', '4435', '互联网板块-房产-大连-大连-大连-大连-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1911', 'E13820FD42A8', '潘宇', '30619', '销售', '0', '4435', '互联网板块-房产-大连-大连-大连-大连-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1912', '57D0CFBDF02D', '王翠翠31724', '31724', '销售', '0', '4437', '互联网板块-房产-大连-大连-大连-大连-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1913', 'EE74EE3538E5', '石磊', '52133', '销售', '0', '4437', '互联网板块-房产-大连-大连-大连-大连-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1914', '171E7555B273', '郑伟', '52143', '销售', '0', '4437', '互联网板块-房产-大连-大连-大连-大连-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('1915', '09D52052F170', '梁宇阳', '37151', '销售', '0', '4456', '互联网板块-房产-华南区-华南区-中珠-中山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1916', '88198A3B24F9', '全伟豪', '50440', '销售', '0', '4456', '互联网板块-房产-华南区-华南区-中珠-中山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1917', 'C65F1284E972', '潘大鹏', '52779', '销售', '0', '4456', '互联网板块-房产-华南区-华南区-中珠-中山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1918', '6AB80D9DCDB8', '曾建波', '54379', '销售', '0', '4456', '互联网板块-房产-华南区-华南区-中珠-中山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1919', '8819A0A1F9C8', '李静镰', '50424', '销售', '0', '4456', '互联网板块-房产-华南区-华南区-中珠-中山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1920', 'A3928115F592', '梁伟进', '54618', '销售', '0', '4456', '互联网板块-房产-华南区-华南区-中珠-中山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1921', '55578B82EFE7', '李淇琦', '55604', '销售', '0', '4456', '互联网板块-房产-华南区-华南区-中珠-中山-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1922', '71626D277684', '田江涛', '55595', '销售', '0', '4458', '互联网板块-房产-华南区-华南区-深圳-深圳-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1923', '716271D6D5D4', '王鲲鹏', '55623', '销售', '0', '4458', '互联网板块-房产-华南区-华南区-深圳-深圳-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1924', 'F681FE1DC607', '郑凯帆56559', '56559', '销售', '0', '4458', '互联网板块-房产-华南区-华南区-深圳-深圳-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1925', '419A0ECFA780', '刘军56535', '56535', '销售', '0', '4458', '互联网板块-房产-华南区-华南区-深圳-深圳-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1926', '7BC31B65D293', '张永峰', '38171', '销售', '0', '4481', '互联网板块-房产-大客户部-大客户部-华南大客户部-华南大客户部');
INSERT INTO `oa_orgstr` VALUES ('1927', 'B8AAC858DD06', '徐武胜', '54088', '销售', '0', '4487', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1928', '17917786E901', '冯盈盈', '35946', '销售', '0', '4487', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1929', '9E0223AB5AB0', '孙珍珍', '55393', '销售', '0', '4487', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1930', 'C83D3656C8F2', '冯筱婕', '55407', '销售', '0', '4487', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1931', 'C83D3D9D6EF3', '马练', '55406', '销售', '0', '4487', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1932', '0A0A1E3483A7', '王玉霞', '55427', '销售', '0', '4487', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1933', '4D9F6805CC55', '张莉55445', '55445', '销售', '0', '4487', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1934', '66E6170AAD27', '宋健', '56168', '销售', '0', '4495', '互联网板块-房产-联合区-联合区-包头-包头-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1935', '0A9781AC7CC4', '刘旭55071', '55071', '销售', '0', '4495', '互联网板块-房产-联合区-联合区-包头-包头-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1936', '3E3F8FEF7B59', '张云峰', '53840', '销售', '0', '4495', '互联网板块-房产-联合区-联合区-包头-包头-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1937', '1E59CCBA8849', '火花', '55098', '销售', '0', '4499', '互联网板块-房产-联合区-联合区-兰州-兰州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1938', 'BEFB18CB0C92', '马千', '55057', '销售', '0', '4499', '互联网板块-房产-联合区-联合区-兰州-兰州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1939', '2F2A45B67C25', '王骏', '55112', '销售', '0', '4499', '互联网板块-房产-联合区-联合区-兰州-兰州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1940', '657642EB46B6', '赵武', '56191', '销售', '0', '4499', '互联网板块-房产-联合区-联合区-兰州-兰州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1941', '2F2A3B9CB398', '韩超', '55140', '销售', '0', '4499', '互联网板块-房产-联合区-联合区-兰州-兰州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1942', '1925EF2A5410', '林丽55078', '55078', '销售', '0', '4499', '互联网板块-房产-联合区-联合区-兰州-兰州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1943', 'C6F2BA422505', '王兰', '35536', '销售', '0', '4499', '互联网板块-房产-联合区-联合区-兰州-兰州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1944', '2F2A36D6AD19', '陈强', '55143', '销售', '0', '4499', '互联网板块-房产-联合区-联合区-兰州-兰州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1945', 'B77FCC52D5F4', '文洁', '36606', '销售', '0', '4522', '互联网板块-房产-长沙-长沙-长沙-长沙-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1946', '14711BCF1168', '孙乐', '38364', '销售', '0', '4522', '互联网板块-房产-长沙-长沙-长沙-长沙-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1947', 'B7817E52EA63', '雷飞飞', '51994', '销售', '0', '4522', '互联网板块-房产-长沙-长沙-长沙-长沙-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1948', '800DF9EECFE9', '余得水', '54217', '销售', '0', '4522', '互联网板块-房产-长沙-长沙-长沙-长沙-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1949', '1F73F3E740F5', '彭楚', '54258', '销售', '0', '4522', '互联网板块-房产-长沙-长沙-长沙-长沙-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1950', '8585A499C199', '黄梦曦', '51963', '销售', '0', '4522', '互联网板块-房产-长沙-长沙-长沙-长沙-销售七组-组员');
INSERT INTO `oa_orgstr` VALUES ('1951', '8DB58E65B1C4', '刘家良', '37780', '销售', '0', '4535', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售5组-组员');
INSERT INTO `oa_orgstr` VALUES ('1952', 'AFE51CC0A4B3', '巴文香', '31128', '销售', '0', '4535', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售5组-组员');
INSERT INTO `oa_orgstr` VALUES ('1953', 'F5AACEC60B66', '唐龙53540', '53540', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `oa_orgstr` VALUES ('1954', 'FD44833EB759', '陈丹54856', '54856', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `oa_orgstr` VALUES ('1955', '17789AEED816', '庄晔', '36222', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `oa_orgstr` VALUES ('1956', '9C957ADA6841', '沙莎', '39610', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `oa_orgstr` VALUES ('1957', '9937CB9DA505', '吕阔', '吕阔', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `oa_orgstr` VALUES ('1958', 'E1D9247B9C33', '赵烨', '53525', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `oa_orgstr` VALUES ('1959', 'D2AC685AE339', '沈伟37054', '37054', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `oa_orgstr` VALUES ('1960', 'D0C55D426250', '蒋云蔚', '53510', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `oa_orgstr` VALUES ('1961', 'B6BF04502939', '石雍', '33030', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `oa_orgstr` VALUES ('1962', 'AFF818723AF9', '沈忆岑', '31906', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `oa_orgstr` VALUES ('1963', '7DD820C32FEC', '张彦春', '31277', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `oa_orgstr` VALUES ('1964', '66B3C750DD6E', '张莹', '32850', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `oa_orgstr` VALUES ('1965', '62BE10549588', '关天华', '53590', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `oa_orgstr` VALUES ('1966', '6008125674AC', '袁海静', '32955', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `oa_orgstr` VALUES ('1967', '5AAD41E81038', '王梦辰', '39602', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `oa_orgstr` VALUES ('1968', '56B3C8BFCFD5', '刘磊', '32593', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `oa_orgstr` VALUES ('1969', '4BBED727C446', '周一林', '51726', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `oa_orgstr` VALUES ('1970', '2F0C08A570A7', '岳增猛', '37337', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `oa_orgstr` VALUES ('1971', 'CD06FD8A4714', '李萍F9667', '39667', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `oa_orgstr` VALUES ('1972', '2537E45C3E07', '廖志强', '53570', '销售', '0', '4538', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第2小组-组员');
INSERT INTO `oa_orgstr` VALUES ('1973', '09396889DE00', '任益', '54864', '销售', '0', '4538', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第2小组-组员');
INSERT INTO `oa_orgstr` VALUES ('1974', 'C70C9860A6D9', '严立栋', '54853', '销售', '0', '4538', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第2小组-组员');
INSERT INTO `oa_orgstr` VALUES ('1975', '59A7F027BF93', '陆原', '54898', '销售', '0', '4538', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第2小组-组员');
INSERT INTO `oa_orgstr` VALUES ('1976', 'CD06EAC466A8', '杨艳洁', '39666', '销售', '0', '4538', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第2小组-组员');
INSERT INTO `oa_orgstr` VALUES ('1977', 'CCD9567980F2', '龚平', '35835', '销售', '0', '4540', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第3小组-组员');
INSERT INTO `oa_orgstr` VALUES ('1978', 'DCC8218BD2B8', '丁峥嵘39668', '39668', '销售', '0', '4540', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第3小组-组员');
INSERT INTO `oa_orgstr` VALUES ('1979', 'B528ECBB3DB0', '芦天鑫', '51787', '销售', '0', '4542', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第4小组-组员');
INSERT INTO `oa_orgstr` VALUES ('1980', '3CF4470BFFE4', '马晓威', '53580', '销售', '0', '4544', '互联网板块-房产-苏南区-苏南-苏州-苏州');
INSERT INTO `oa_orgstr` VALUES ('1981', '9C9CE7709C83', '季吕敏', '54912', '销售', '0', '4545', '互联网板块-房产-苏南区-苏南-苏州-苏州');
INSERT INTO `oa_orgstr` VALUES ('1982', 'B529046C4E22', '李庭鋆', '51788', '销售', '0', '4545', '互联网板块-房产-苏南区-苏南-苏州-苏州');
INSERT INTO `oa_orgstr` VALUES ('1983', '5AADC483EF16', '陈静39605', '39605', '销售', '0', '4545', '互联网板块-房产-苏南区-苏南-苏州-苏州');
INSERT INTO `oa_orgstr` VALUES ('1984', '3B9FA1B2B587', '朱杰', '34905', '销售', '0', '4545', '互联网板块-房产-苏南区-苏南-苏州-苏州');
INSERT INTO `oa_orgstr` VALUES ('1985', 'FD48689D7561', '范思思', '54857', '销售', '0', '4547', '互联网板块-房产-苏南区-苏南-苏州-苏州');
INSERT INTO `oa_orgstr` VALUES ('1986', '3E126FB63C30', '王之夏', '53579', '销售', '0', '4547', '互联网板块-房产-苏南区-苏南-苏州-苏州');
INSERT INTO `oa_orgstr` VALUES ('1987', 'DD698B2CB7F2', '赵琦54869', '54869', '销售', '0', '4547', '互联网板块-房产-苏南区-苏南-苏州-苏州');
INSERT INTO `oa_orgstr` VALUES ('1988', '1BA4FBC07E37', '俞春荣', '54877', '销售', '0', '4547', '互联网板块-房产-苏南区-苏南-苏州-苏州');
INSERT INTO `oa_orgstr` VALUES ('1989', 'A8D4FD0E86B0', '陈路', '54080', '销售', '0', '4562', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1990', 'BF60B9CBFAA4', '邓娇娇', '54091', '销售', '0', '4562', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1991', 'BDC2B5CA6384', '杨颖', '54086', '销售', '0', '4562', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1992', '2B85E11C8E58', '姚彩霞', '55366', '销售', '0', '4562', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1993', '5E994CEE9957', '吴晓波', '55381', '销售', '0', '4562', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1994', '3F5BB55C6DA9', '邓琦', '55379', '销售', '0', '4562', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1995', '0A78C02A1769', '岳黎55358', '55358', '销售', '0', '4562', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1996', '5E99395C1BE3', '曾平西', '55383', '销售', '0', '4562', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1997', '2754C683AA68', '罗峰', '55435', '销售', '0', '4562', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('1998', '5E9915311495', '童雷', '55382', '销售', '0', '4564', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('1999', '2754CA9C68D0', '周维', '55438', '销售', '0', '4564', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('2000', '2754CE26F104', '唐颖', '55437', '销售', '0', '4564', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('2001', '0A0A319B6285', '解强', '55421', '销售', '0', '4564', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('2002', '0783A9DD7041', '张媛50537', '50537', '销售', '0', '4568', '互联网板块-房产-武汉-武汉-武汉-武汉-销售九组-组员');
INSERT INTO `oa_orgstr` VALUES ('2003', '3067B45CEAB5', '吴佳璐', '50598', '销售', '0', '4568', '互联网板块-房产-武汉-武汉-武汉-武汉-销售九组-组员');
INSERT INTO `oa_orgstr` VALUES ('2004', '9301C9802AB8', '李扬38322', '38322', '销售', '0', '4568', '互联网板块-房产-武汉-武汉-武汉-武汉-销售九组-组员');
INSERT INTO `oa_orgstr` VALUES ('2005', '3845EE70AE44', '祝星星', '37365', '销售', '0', '4568', '互联网板块-房产-武汉-武汉-武汉-武汉-销售九组-组员');
INSERT INTO `oa_orgstr` VALUES ('2006', 'B71F5200375E', '茹花', '31201', '销售', '0', '4568', '互联网板块-房产-武汉-武汉-武汉-武汉-销售九组-组员');
INSERT INTO `oa_orgstr` VALUES ('2007', '1AA94994F182', '陈伍玲', '52825', '销售', '0', '4572', '互联网板块-房产-华南区-华南区-东莞-东莞-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('2008', '5241277AD1D3', '陈苏娟', '33999', '销售', '0', '4572', '互联网板块-房产-华南区-华南区-东莞-东莞-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('2009', 'B8A75DDB3FD0', '何勇', '39141', '销售', '0', '4573', '互联网板块-房产-联合区-联合区-贵阳-贵阳-销售四组-销售四组');
INSERT INTO `oa_orgstr` VALUES ('2010', 'C76E551FEBC5', '苏志明', '50759', '销售', '0', '4652', '互联网板块-房产-上海-上海-上海-上海-销售三部3组-组员');
INSERT INTO `oa_orgstr` VALUES ('2011', '57CC3A91AAA5', '杨明洲', '35994', '销售', '0', '4654', '互联网板块-房产-华南区-华南区-东莞-东莞-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('2012', '49543BD62F62', '魏海辉', '35626', '销售', '0', '4654', '互联网板块-房产-华南区-华南区-东莞-东莞-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('2013', '306E4EE6C657', '廖豫川', '37198', '销售', '0', '4820', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售五组-销售员');
INSERT INTO `oa_orgstr` VALUES ('2014', '306E85040968', '张振东', '37199', '销售', '0', '4822', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售六组-销售员');
INSERT INTO `oa_orgstr` VALUES ('2015', '77A94FF334C8', '禤永建', '56460', '销售', '0', '4824', '互联网板块-房产-华南区-华南区-中珠-中山-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('2016', 'CBF4A7D83565', '唐碧健', '56538', '销售', '0', '4824', '互联网板块-房产-华南区-华南区-中珠-中山-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('2017', '668A43472E71', '杨杰', '55649', '销售', '0', '4824', '互联网板块-房产-华南区-华南区-中珠-中山-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('2018', '272317CF05E6', '冯亮', '56608', '销售', '0', '4824', '互联网板块-房产-华南区-华南区-中珠-中山-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('2019', '0F8A42073821', '聂凯', '55563', '销售', '0', '4826', '互联网板块-房产-华南区-华南区-中珠-珠海-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('2020', 'AF6FD4064376', '李森', '56522', '销售', '0', '4826', '互联网板块-房产-华南区-华南区-中珠-珠海-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('2021', '80E01942A4D0', '吴敏清', '55644', '销售', '0', '4826', '互联网板块-房产-华南区-华南区-中珠-珠海-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('2022', 'FC99866ADC98', '张琼', '30741', '销售', '0', '4831', '互联网板块-房产-网站运维中心-网站运维中心-网站运维中心-网站运维中心');
INSERT INTO `oa_orgstr` VALUES ('2023', '0010FD8544F9', '谢永雷', '52284', '销售', '0', '4833', '互联网板块-房产-联合区-联合区-郑州-郑州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('2024', '39F6928EC803', '胡珂', '53856', '销售', '0', '4833', '互联网板块-房产-联合区-联合区-郑州-郑州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('2025', 'F92949453977', '王应龙', '56311', '销售', '0', '4833', '互联网板块-房产-联合区-联合区-郑州-郑州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('2026', 'AA9CCF62E4B7', '董靖姣', '51330', '销售', '0', '4833', '互联网板块-房产-联合区-联合区-郑州-郑州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('2027', 'ACE96F937818', '陈珊珊', '35537', '销售', '0', '4833', '互联网板块-房产-联合区-联合区-郑州-郑州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('2028', 'BBA457E10D53', '史义敏', '39185', '销售', '0', '4833', '互联网板块-房产-联合区-联合区-郑州-郑州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('2029', 'DE199556C2A2', '郭翠', '39249', '销售', '0', '4833', '互联网板块-房产-联合区-联合区-郑州-郑州-销售一组-组员');
INSERT INTO `oa_orgstr` VALUES ('2030', 'DE197E5923D8', '马新杰', '51209', '销售', '0', '4835', '互联网板块-房产-联合区-联合区-郑州-郑州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('2031', 'E401F09DC362', '尹雪56289', '56289', '销售', '0', '4835', '互联网板块-房产-联合区-联合区-郑州-郑州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('2032', '715007C7F269', '谭超军', '56187', '销售', '0', '4835', '互联网板块-房产-联合区-联合区-郑州-郑州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('2033', '272311EA4AB4', '吕二兵', '56328', '销售', '0', '4835', '互联网板块-房产-联合区-联合区-郑州-郑州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('2034', 'E64B3A514117', '周丽洁35497', '35497', '销售', '0', '4835', '互联网板块-房产-联合区-联合区-郑州-郑州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('2035', '44F382E31A50', '耿婷', '39211', '销售', '0', '4835', '互联网板块-房产-联合区-联合区-郑州-郑州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('2036', 'A014E60A67F3', '赵兰倩', '51318', '销售', '0', '4835', '互联网板块-房产-联合区-联合区-郑州-郑州-销售二组-组员');
INSERT INTO `oa_orgstr` VALUES ('2037', 'C0E2912AA7A7', '肜娟娟', '35526', '销售', '0', '4837', '互联网板块-房产-联合区-联合区-郑州-郑州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('2038', 'ACF00C630846', '左梦琳', '36979', '销售', '0', '4837', '互联网板块-房产-联合区-联合区-郑州-郑州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('2039', 'E87879F234F6', '王旭峰', '51357', '销售', '0', '4837', '互联网板块-房产-联合区-联合区-郑州-郑州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('2040', 'EFAEF4E51D73', '万君静', '37118', '销售', '0', '4837', '互联网板块-房产-联合区-联合区-郑州-郑州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('2041', '2E0C2E8F2B36', '叶梦园', '55111', '销售', '0', '4837', '互联网板块-房产-联合区-联合区-郑州-郑州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('2042', '5E8CF41A3944', '巴文娟', '58403', '销售', '0', '4837', '互联网板块-房产-联合区-联合区-郑州-郑州-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('2043', 'ACE59EB721D4', '杨菲53889', '53889', '销售', '0', '4839', '互联网板块-房产-联合区-联合区-郑州-郑州-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('2044', 'E476897D6229', '栾硕', '51381', '销售', '0', '4839', '互联网板块-房产-联合区-联合区-郑州-郑州-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('2045', '13268C506D95', '赵国风', '39155', '销售', '0', '4839', '互联网板块-房产-联合区-联合区-郑州-郑州-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('2046', '0BF35D2FB3C3', '徐麟', '55096', '销售', '0', '4841', '互联网板块-房产-联合区-联合区-郑州-郑州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('2047', 'AE0F1528E262', '吴童麟', '56253', '销售', '0', '4841', '互联网板块-房产-联合区-联合区-郑州-郑州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('2048', 'E401F932AA32', '李艳', '56270', '销售', '0', '4841', '互联网板块-房产-联合区-联合区-郑州-郑州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('2049', '7774F7A53AC8', '邵冰冰', '39116', '销售', '0', '4841', '互联网板块-房产-联合区-联合区-郑州-郑州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('2050', '362392C4A021', '崔磊', '35527', '销售', '0', '4841', '互联网板块-房产-联合区-联合区-郑州-郑州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('2051', '5E0D78EB0095', '张淑慧', '37115', '销售', '0', '4841', '互联网板块-房产-联合区-联合区-郑州-郑州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('2052', 'B8D0A7D57D36', '王宁53835', '53835', '销售', '0', '4841', '互联网板块-房产-联合区-联合区-郑州-郑州-销售五组-组员');
INSERT INTO `oa_orgstr` VALUES ('2053', 'D769F25AF904', '赵安琪', '51361', '销售', '0', '4844', '互联网板块-房产-联合区-联合区-郑州-郑州-销售六组销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('2054', 'C32BB75FD348', '马明路', '56278', '销售', '0', '4844', '互联网板块-房产-联合区-联合区-郑州-郑州-销售六组销售一部-组员');
INSERT INTO `oa_orgstr` VALUES ('2055', '911AC04B3A56', '尤晓珂', '51300', '销售', '0', '4846', '互联网板块-房产-联合区-联合区-郑州-郑州-销售六组销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('2056', '911AA90BED24', '申晨', '51312', '销售', '0', '4846', '互联网板块-房产-联合区-联合区-郑州-郑州-销售六组销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('2057', 'E0A92AE7E809', '陈灿娜', '51364', '销售', '0', '4846', '互联网板块-房产-联合区-联合区-郑州-郑州-销售六组销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('2058', 'B4DCF5A66DB5', '王俊霞', '35523', '销售', '0', '4846', '互联网板块-房产-联合区-联合区-郑州-郑州-销售六组销售二部-组员');
INSERT INTO `oa_orgstr` VALUES ('2059', '27B01335FEC2', '黄培冬', '55582', '销售', '0', '4891', '互联网板块-房产-华南区-华南区-佛山-佛山-销售五组-销售员');
INSERT INTO `oa_orgstr` VALUES ('2060', '6EDAD58BE996', '储俊峰', '55636', '销售', '0', '4891', '互联网板块-房产-华南区-华南区-佛山-佛山-销售五组-销售员');
INSERT INTO `oa_orgstr` VALUES ('2061', '7162665BD251', '全小辉', '55568', '销售', '0', '4907', '互联网板块-房产-华南区-华南区-深圳-深圳-销售八组-组员');
INSERT INTO `oa_orgstr` VALUES ('2062', '7162608582A4', '郑训辉', '32846', '销售', '0', '4907', '互联网板块-房产-华南区-华南区-深圳-深圳-销售八组-组员');
INSERT INTO `oa_orgstr` VALUES ('2063', 'AD0ECB99A1F4', '徐晓燕', '53596', '销售', '0', '4915', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('2064', '2F20E530C355', '万慧', '54889', '销售', '0', '4915', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售三组-组员');
INSERT INTO `oa_orgstr` VALUES ('2065', 'AA965D33FB68', '苏艺', '51307', '销售', '0', '5063', '互联网板块-房产-联合区-联合区-广西-南宁-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('2066', 'FF557DD1E6C3', '莫剑萍', '56316', '销售', '0', '5063', '互联网板块-房产-联合区-联合区-广西-南宁-销售四组-组员');
INSERT INTO `oa_orgstr` VALUES ('2067', 'BAE8ADC525C1', '周洪维', '54923', '销售', '0', '5084', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第5小组-组员');
INSERT INTO `oa_orgstr` VALUES ('2068', 'CAFB1078E514', '袁泉', '54928', '销售', '0', '5086', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第6小组-组员');
INSERT INTO `oa_orgstr` VALUES ('2069', '3C24FDE0F6B5', '邓小亮', '31272', '销售', '0', '5086', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第6小组-组员');
INSERT INTO `oa_orgstr` VALUES ('2070', 'D0C3E2F3A132', '刘辰', '53508', '销售', '0', '5087', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售三组第1小组-组员');
INSERT INTO `oa_orgstr` VALUES ('2071', 'AF701B814617', '杨雪54921', '54921', '销售', '0', '5087', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售三组第1小组-组员');
INSERT INTO `oa_orgstr` VALUES ('2072', 'DCC88BE60AD2', '俞振', '39669', '销售', '0', '5087', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售三组第1小组-组员');
INSERT INTO `oa_orgstr` VALUES ('2073', 'CD06D5B62AB5', '夏文通', '39665', '销售', '0', '5087', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售三组第1小组-组员');
INSERT INTO `oa_orgstr` VALUES ('2074', '8CF9436EB527', '刘坚54905', '54905', '销售', '0', '5087', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售三组第1小组-组员');
INSERT INTO `oa_orgstr` VALUES ('2075', '60A24E1C5A70', '吴志华', '39651', '销售', '0', '5087', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售三组第1小组-组员');
INSERT INTO `oa_orgstr` VALUES ('2076', '372C5D50ABA0', '孔建成', '35758', '销售', '0', '5087', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售三组第1小组-组员');
INSERT INTO `oa_orgstr` VALUES ('2077', '24D5C7B6ABB6', '钱辰好', '54880', '销售', '0', '5089', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售三组第2小组-组员');
INSERT INTO `oa_orgstr` VALUES ('2078', 'A93638396810', '王子健', '31932', '销售', '0', '5089', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售三组第2小组-组员');
INSERT INTO `oa_orgstr` VALUES ('2079', '2F0B77588659', '钟亦夫', '37336', '销售', '0', '5091', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售三组第3小组-组员');
INSERT INTO `oa_orgstr` VALUES ('2080', 'F2225D79DC00', '仇杰', '39628', '销售', '0', '5093', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售三组第4小组-组员');
INSERT INTO `oa_orgstr` VALUES ('2081', 'DCC89FB44051', '丁晨燕', '39670', '销售', '0', '5095', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售三组第5小组-组员');
INSERT INTO `oa_orgstr` VALUES ('2082', '6063768006B8', '高长升', '37879', '销售', '0', '5106', '互联网板块-房产-东北区-东北区-鞍山-鞍山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('2083', '9F7F6892CB53', '李雪37841', '37841', '销售', '0', '5106', '互联网板块-房产-东北区-东北区-鞍山-鞍山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('2084', '83C47E96AD61', '蔡雯雯', '37862', '销售', '0', '5106', '互联网板块-房产-东北区-东北区-鞍山-鞍山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('2085', '49C25BA17166', '马也', '50107', '销售', '0', '5106', '互联网板块-房产-东北区-东北区-鞍山-鞍山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('2086', '89B2FF137991', '王迪37708', '37708', '销售', '0', '5106', '互联网板块-房产-东北区-东北区-鞍山-鞍山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('2087', '6064698A97D0', '吴献', '37880', '销售', '0', '5106', '互联网板块-房产-东北区-东北区-鞍山-鞍山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('2088', 'FCFA09222208', '陈毓家', '30152', '销售', '0', '5106', '互联网板块-房产-东北区-东北区-鞍山-鞍山-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('2089', '6.87E+75', '曹枭琰', '32016', '销售', '0', '5112', '互联网板块-房产-上海-上海-上海-上海-公用组-组员');
INSERT INTO `oa_orgstr` VALUES ('2090', 'E15FF9DF6AB7', '张峪', '31006', '销售', '0', '5113', '互联网板块-房产-武汉-武汉-武汉-武汉-销售二部（停）-组员');
INSERT INTO `oa_orgstr` VALUES ('2091', 'B041399E1B0F', '李雪', '30156', '销售', '0', '5115', '互联网板块-房产-东北区-东北区-沈阳-沈阳-公用组-组员');
INSERT INTO `oa_orgstr` VALUES ('2092', 'B63E7DCE0EB5', '杨志', '53268', '销售', '0', '5117', '互联网板块-房产-北方区-北方-保定-保定-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('2093', '9C92722C3817', '高颖', '36282', '销售', '0', '5117', '互联网板块-房产-北方区-北方-保定-保定-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('2094', '4986E87AB619', '杨小娟', '55312', '销售', '0', '5117', '互联网板块-房产-北方区-北方-保定-保定-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('2095', '498616A327B6', '秦英', '55313', '销售', '0', '5117', '互联网板块-房产-北方区-北方-保定-保定-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('2096', '1CFEBABF7538', '李腾飞', '53290', '销售', '0', '5117', '互联网板块-房产-北方区-北方-保定-保定-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('2097', 'B63E9030E3D5', '刘骏', '53244', '销售', '0', '5117', '互联网板块-房产-北方区-北方-保定-保定-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('2098', '1CFEAF0050C1', '刘允飞', '53288', '销售', '0', '5117', '互联网板块-房产-北方区-北方-保定-保定-销售组-组员');
INSERT INTO `oa_orgstr` VALUES ('2099', '4986E3B159B1', '张文凤', '55314', '销售', '0', '5117', '互联网板块-房产-北方区-北方-保定-保定-销售组-组员');

-- ----------------------------
-- Table structure for oa_payment
-- ----------------------------
DROP TABLE IF EXISTS `oa_payment`;
CREATE TABLE `oa_payment` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '查看薪酬登录表主键id',
  `email` varchar(20) DEFAULT '' COMMENT '用户登录帐号',
  `password` varchar(50) DEFAULT '' COMMENT '登录密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_payment
-- ----------------------------
INSERT INTO `oa_payment` VALUES ('1', 'chenjuan@leju.com', '');
INSERT INTO `oa_payment` VALUES ('2', 'chenjuan1@leju.com', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO `oa_payment` VALUES ('3', 'chenjuan@leju.com', '81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO `oa_payment` VALUES ('4', 'chenjuan@leju.com', '81dc9bdb52d04dc20036dbd8313ed055');

-- ----------------------------
-- Table structure for oa_process
-- ----------------------------
DROP TABLE IF EXISTS `oa_process`;
CREATE TABLE `oa_process` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '办理流程表主键id',
  `title` varchar(50) DEFAULT '' COMMENT '标题',
  `content` text COMMENT '详情',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_process
-- ----------------------------
INSERT INTO `oa_process` VALUES ('1', '加班', '继续加班', '2015-12-19 15:21:48');
INSERT INTO `oa_process` VALUES ('2', '加班吗', '加啊，你真天真', '2015-12-19 15:54:08');
INSERT INTO `oa_process` VALUES ('3', '', '', '2015-12-27 14:15:39');

-- ----------------------------
-- Table structure for oa_question
-- ----------------------------
DROP TABLE IF EXISTS `oa_question`;
CREATE TABLE `oa_question` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '更多问题表主键id',
  `title` varchar(50) DEFAULT '' COMMENT '标题',
  `content` text COMMENT '详情',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_question
-- ----------------------------
INSERT INTO `oa_question` VALUES ('1', '呵呵', '呵呵', '2015-12-26 14:44:50');
INSERT INTO `oa_question` VALUES ('2', '呵呵1', '哈哈哈', '2015-12-26 14:46:23');

-- ----------------------------
-- Table structure for oa_rsappmenu
-- ----------------------------
DROP TABLE IF EXISTS `oa_rsappmenu`;
CREATE TABLE `oa_rsappmenu` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '乐居菜单表主键id',
  `title` varchar(225) DEFAULT '' COMMENT '菜单项',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态：1->显示 2->隐藏',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_rsappmenu
-- ----------------------------
INSERT INTO `oa_rsappmenu` VALUES ('1', '考勤', '1', '2015-12-23 20:51:18');
INSERT INTO `oa_rsappmenu` VALUES ('2', '休假', '1', '2015-12-26 16:02:47');
INSERT INTO `oa_rsappmenu` VALUES ('3', '公出/出差', '1', '2015-12-26 16:08:45');
INSERT INTO `oa_rsappmenu` VALUES ('6', '加班', '1', '2015-12-26 16:20:28');
INSERT INTO `oa_rsappmenu` VALUES ('7', '薪资', '2', '2015-12-26 19:58:27');
INSERT INTO `oa_rsappmenu` VALUES ('8', '实用工具', '1', '2015-12-26 16:20:55');
INSERT INTO `oa_rsappmenu` VALUES ('9', '审批', '1', '2015-12-26 16:21:08');

-- ----------------------------
-- Table structure for oa_savenote
-- ----------------------------
DROP TABLE IF EXISTS `oa_savenote`;
CREATE TABLE `oa_savenote` (
  `userid` int(10) NOT NULL COMMENT '保存已读通知表主键id',
  `list` text COMMENT '通知id集',
  `rslist` text COMMENT '人事通知id集',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_savenote
-- ----------------------------

-- ----------------------------
-- Table structure for oa_service
-- ----------------------------
DROP TABLE IF EXISTS `oa_service`;
CREATE TABLE `oa_service` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '服务与支持表主键id',
  `city` varchar(50) DEFAULT '' COMMENT '城市',
  `jstel` varchar(20) DEFAULT '' COMMENT '技术支持电话',
  `xztel` varchar(20) DEFAULT '' COMMENT '行政支持电话',
  `rltel` varchar(20) DEFAULT '' COMMENT '人力支持电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_service
-- ----------------------------
INSERT INTO `oa_service` VALUES ('1', '北京', '11111111111', '11111111111', '11111111111');
INSERT INTO `oa_service` VALUES ('2', '西安', '1111111', '1111111', '1111111');
INSERT INTO `oa_service` VALUES ('3', '太原', '58952346111', '87224920111', '14465161111');
INSERT INTO `oa_service` VALUES ('4', '石家庄', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('5', '秦皇岛', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('6', '天津', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('7', '烟台', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('8', '青岛', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('9', '济南', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('10', '沈阳', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('11', '鞍山', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('12', '长春', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('13', '烟台', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('14', '青岛', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('15', '济南', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('16', '沈阳', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('17', '鞍山', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('18', '长春', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('19', '烟台', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('20', '青岛', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('21', '济南', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('22', '沈阳', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('23', '鞍山', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('24', '长春', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('25', '鞍山', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('26', '沈阳', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('27', '鞍山', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('28', '长春', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('29', '烟台', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('30', '青岛', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('31', '济南', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('32', '沈阳', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('33', '鞍山', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('34', '长春', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('35', '长春', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('36', '烟台', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('37', '青岛', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('38', '济南', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('39', '烟台', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('40', '青岛', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('41', '济南', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('42', '沈阳', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('43', '鞍山', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('44', '长春', '58952346111', '87224920111', '58952292111');
INSERT INTO `oa_service` VALUES ('45', '哈尔滨', '58952346111', '87224920111', '58952292111');

-- ----------------------------
-- Table structure for oa_slide
-- ----------------------------
DROP TABLE IF EXISTS `oa_slide`;
CREATE TABLE `oa_slide` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '轮播图表主键id',
  `title` varchar(50) DEFAULT '' COMMENT '轮播图标题',
  `img` varchar(100) DEFAULT '' COMMENT '轮播图图片地址',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态： 1->显示  2->隐藏',
  `content` text COMMENT '轮播图详情',
  `deptname` varchar(30) DEFAULT '' COMMENT '发布部门',
  `viewcount` int(10) DEFAULT '0' COMMENT '浏览次数',
  `createtime` datetime DEFAULT NULL COMMENT '轮播图创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_slide
-- ----------------------------
INSERT INTO `oa_slide` VALUES ('1', '轮播图三', 'images/201601/1453394449.jpg', '0', '轮播图三', '总裁办', '0', '2016-01-22 00:44:15');

-- ----------------------------
-- Table structure for oa_station
-- ----------------------------
DROP TABLE IF EXISTS `oa_station`;
CREATE TABLE `oa_station` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '班车站点主键id',
  `lineid` int(10) DEFAULT '0' COMMENT '班车线路id',
  `station` varchar(50) DEFAULT '' COMMENT '早班车上车站点',
  `time` varchar(30) DEFAULT '' COMMENT '发车时间',
  `address` varchar(255) DEFAULT '' COMMENT '停车位置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_station
-- ----------------------------
INSERT INTO `oa_station` VALUES ('1', '1', '马甸桥', '7:50', '马甸桥东侧辅路（德胜饭店往东50米）');
INSERT INTO `oa_station` VALUES ('2', '1', '安贞桥', '7:56', '安贞桥辅路木偶剧院北门');
INSERT INTO `oa_station` VALUES ('3', '1', '光熙门', '8:00', '光熙门地铁站');

-- ----------------------------
-- Table structure for oa_team
-- ----------------------------
DROP TABLE IF EXISTS `oa_team`;
CREATE TABLE `oa_team` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '联系组表主键id',
  `team_name` varchar(100) DEFAULT '' COMMENT '组名称',
  `team_mails` varchar(100) DEFAULT '' COMMENT '组邮件地址',
  `createrid` int(10) DEFAULT '0' COMMENT '组创建id',
  `listid` text COMMENT '组成员id集',
  `team_man` text COMMENT '组成员',
  `type` tinyint(3) DEFAULT '0' COMMENT '组类型：1->收藏组 2->邮件组 3->自定义组',
  `whose` int(4) DEFAULT '0' COMMENT '联系组归属： 1->管理员 2->用户',
  `is_shoucang` int(4) DEFAULT '0' COMMENT '是否被收藏：1->是 2->否',
  `linkid` int(10) DEFAULT '0' COMMENT '收藏组关联id',
  `creatertime` datetime DEFAULT NULL COMMENT '组创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_team
-- ----------------------------
INSERT INTO `oa_team` VALUES ('1', '测试1', '', '0', ',1', ',xinlei6', '2', '1', '2', '0', '2016-01-24 17:42:51');
INSERT INTO `oa_team` VALUES ('2', '测试2', '', '0', '', '', '2', '1', '2', '0', '2016-01-26 11:14:31');
INSERT INTO `oa_team` VALUES ('3', '测试3', '', '0', '1,2', 'xinlei6,lixia8', '2', '1', '2', '0', '2016-03-02 16:04:37');

-- ----------------------------
-- Table structure for oa_tuijian
-- ----------------------------
DROP TABLE IF EXISTS `oa_tuijian`;
CREATE TABLE `oa_tuijian` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '推荐好友表主键id',
  `position_id` int(10) DEFAULT '0' COMMENT '推荐职位id',
  `lejumail` varchar(30) DEFAULT '' COMMENT '推荐人邮箱前缀',
  `name` varchar(30) DEFAULT '' COMMENT '被推荐人姓名',
  `sex` varchar(20) DEFAULT '' COMMENT '性别',
  `femail` varchar(50) DEFAULT '' COMMENT '被推荐人邮箱',
  `fmobile` varchar(20) DEFAULT '0' COMMENT '被推荐人电话',
  `workhistory` text COMMENT '工作经验',
  `content` text COMMENT '工作内容',
  `feducation` varchar(20) DEFAULT '' COMMENT '被推荐人学历',
  `createtime` datetime DEFAULT NULL COMMENT '推荐时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_tuijian
-- ----------------------------

-- ----------------------------
-- Table structure for oa_url
-- ----------------------------
DROP TABLE IF EXISTS `oa_url`;
CREATE TABLE `oa_url` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '网址推荐表主键id',
  `url` varchar(225) DEFAULT '' COMMENT '网址',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态：1->显示 2->隐藏',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_url
-- ----------------------------
INSERT INTO `oa_url` VALUES ('1', 'http://lejutong.leju.com/index.php?c=resume&m=index', '1', '2015-12-28 13:51:46');

-- ----------------------------
-- Table structure for oa_usehelp
-- ----------------------------
DROP TABLE IF EXISTS `oa_usehelp`;
CREATE TABLE `oa_usehelp` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '使用帮助表主键id',
  `title` varchar(50) DEFAULT '' COMMENT '标题',
  `content` text COMMENT '详情',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_usehelp
-- ----------------------------

-- ----------------------------
-- Table structure for oa_user
-- ----------------------------
DROP TABLE IF EXISTS `oa_user`;
CREATE TABLE `oa_user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表主键',
  `id` int(10) NOT NULL COMMENT '乐居人员信息表主键id',
  `username` varchar(64) DEFAULT '' COMMENT '用户名',
  `password` varchar(50) DEFAULT '' COMMENT '超级管理员登录密码',
  `sex` tinyint(3) DEFAULT '0' COMMENT '性别: 0->保密 1->男 2->女',
  `lejumail` varchar(64) DEFAULT '' COMMENT '邮箱前缀',
  `sno` varchar(32) DEFAULT '' COMMENT '员工编号',
  `fullname` varchar(64) DEFAULT '' COMMENT '全称（中文名称）',
  `city` varchar(128) DEFAULT '' COMMENT '城市',
  `dept` int(11) DEFAULT NULL COMMENT '组织机构编号',
  `lft` int(11) DEFAULT '0' COMMENT '左范围（区分上下级，类似pid）',
  `rgt` int(11) DEFAULT '0' COMMENT '右范围（区分上下级，类似pid）',
  `wtype` tinyint(4) DEFAULT '0' COMMENT '周报类型: 1->个人 2->部门',
  `tel` varchar(64) DEFAULT '' COMMENT '座机电话',
  `mobile` varchar(32) DEFAULT '' COMMENT '手机号码',
  `ctype` tinyint(4) DEFAULT '0' COMMENT '职务: 0->未知 1->员工 2->主管 3->经理',
  `position` varchar(128) DEFAULT '北京' COMMENT '位置',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态：1->显示  2->隐藏',
  `birthday` varchar(25) DEFAULT NULL COMMENT '生日',
  `entrytime` varchar(25) DEFAULT NULL COMMENT '入职时间',
  `work_position` varchar(10) DEFAULT '' COMMENT '工作信息',
  `city_true` varchar(10) DEFAULT '' COMMENT '工作地点',
  `mailname` varchar(128) DEFAULT '' COMMENT '邮箱地址',
  `role_id` int(10) DEFAULT '0' COMMENT '角色',
  `is_notify` tinyint(4) DEFAULT '0' COMMENT '发通知权限：1->有权限 2->无权限',
  `is_ok` tinyint(4) DEFAULT '0' COMMENT '是否有后台权限：1->是 2->否',
  `is_exists` tinyint(4) DEFAULT '0' COMMENT '存在状态：1->存在 2->不存在',
  `wmh` varchar(11) DEFAULT '' COMMENT '微米号',
  `depart_name` varchar(20) DEFAULT '' COMMENT '组织机构名称',
  `linkman` text COMMENT '常用联系人id',
  `weibo` varchar(100) DEFAULT '' COMMENT '微博地址',
  `pic_path` varchar(100) DEFAULT '' COMMENT '图片地址',
  `plat_form` varchar(20) DEFAULT NULL COMMENT '用户使用平台',
  `is_login` tinyint(3) DEFAULT '0' COMMENT '是否登录: 0->未登录 1->已登录',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `sno` (`sno`) COMMENT '员工编号',
  KEY `lejumail` (`lejumail`,`mailname`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_user
-- ----------------------------
INSERT INTO `oa_user` VALUES ('1', '0', 'chaojiguanli', '21232f297a57a5a743894a0e4a801fc3', '0', 'chaojiguanli', '000000', '超级管理', '北京', '1111', '1', '2', '1', '1111111', '11111111111', '1', '北京', '2', '2015-12-15', '2015-12-13', '2', '2', '@leju.com', '2', '1', '1', '1', '2', '总裁办', null, '2', '', null, '0');
INSERT INTO `oa_user` VALUES ('2', '1', 'xinlei6', '', '0', 'xinlei6', '000031', '新雷', '北京', '1', '1', '2', '1', '1111111', '11111111111', '1', '北京', '1', '2016-01-21', null, '1', '1', '@leju.com', '1', '1', '1', '1', '1', '新房总办', null, '1', 'images/201601/1453364708.jpg', 'Android', '1');
INSERT INTO `oa_user` VALUES ('3', '2', 'lixia8', '', '0', 'lixia8', '000032', '李夏', '北京', '37', '1', '2', '1', '1111111', '11111111111', '1', '北京', '1', '2016-01-21', '', '1', '1', '@leju.com', '1', '1', '1', '1', '1', '总办', '', '1', 'images/201601/1453364708.jpg', 'Android', '1');
INSERT INTO `oa_user` VALUES ('4', '3', 'yiyuan1', '', '0', 'yiyuan1', '000033', '易园', '北京', '600', '1', '2', '1', '1111111', '11111111111', '1', '北京', '1', '2016-01-21', '', '1', '1', '@leju.com', '1', '1', '1', '1', '1', '财务部', '', '1', 'images/201601/1453364708.jpg', 'Android', '1');
INSERT INTO `oa_user` VALUES ('5', '4', 'zijian', '', '0', 'zijian', '000034', '王子健', '北京', '601', '1', '2', '1', '1111111', '11111111111', '1', '北京', '1', '2016-01-21', '', '1', '1', '@leju.com', '1', '1', '1', '1', '1', '行政部', '', '1', 'images/201601/1453364708.jpg', null, '1');
INSERT INTO `oa_user` VALUES ('6', '13840', 'zhangyan19', '', '0', 'zhangyan19', '56252', '张岩', '', '3103', '8684', '8685', '0', '', '15248123474', '0', '', '0', '1994-04-02', null, '3', '515', '@leju.com', '0', '0', '0', '0', '', '呼和浩特公司', null, '', 'D:/wamp/www/xinlangleju/images/thumb_img/14538933773426.jpg', null, '0');
INSERT INTO `oa_user` VALUES ('7', '12307', 'tianyu2', '', '0', 'tianyu2', '52626', '田宇', '', '3016', '425', '426', '1', '', '13601234132', '0', '', '0', '1979-08-15', null, '4', '29', '@leju.com', '0', '0', '0', '0', '', '北京公司', null, '', 'D:/wamp/www/xinlangleju/images/thumb_img/14538933779829.jpg', null, '0');
INSERT INTO `oa_user` VALUES ('8', '8581', 'qifeng', '', '0', 'qifeng', '39998', '骆奇峰', '', '5160', '25554', '25555', '1', '7468', '18612346489', '0', '', '1', '1989-11-18', null, '4', '29', '@leju.com', '0', '0', '0', '0', '', 'PC产品技术部', null, '', 'D:/wamp/www/xinlangleju/images/thumb_img/14538933779002.jpg', null, '0');
INSERT INTO `oa_user` VALUES ('9', '8837', 'zhaojing7', '', '0', 'zhaojing7', '52218', '赵晶', '', '3011', '2376', '2377', '1', '1441', '18612345856', '0', '', '1', '1987-01-30', null, '4', '29', '@leju.com', '0', '0', '0', '0', '', '财务部', null, '', 'D:/wamp/www/xinlangleju/images/thumb_img/14538933771406.jpg', null, '0');
INSERT INTO `oa_user` VALUES ('10', '10460', 'yanxin4', '', '0', 'yanxin4', '52251', '王焱鑫', '', '5181', '164', '165', '0', '021-60868914', '15502112341', '0', '', '0', '1988-03-30', null, '4', '30', '@leju.com', '0', '0', '0', '0', '', '上海公司', null, '', 'D:/wamp/www/xinlangleju/images/thumb_img/14538933778087.jpg', null, '0');
INSERT INTO `oa_user` VALUES ('11', '2', 'liuran', '', '0', 'liuran', '30002', '刘然', '1', '5152', '25666', '25783', '2', '1218', '13501247601', '3', '', '1', '1977-04-06', null, '4', '29', '@leju.com', '0', '0', '0', '0', '', '市场部', null, '', 'D:/wamp/www/xinlangleju/images/thumb_img/14538934027745.jpg', null, '0');
INSERT INTO `oa_user` VALUES ('12', '3', 'yangxi', '', '0', 'yangxi', '30004', '杨熙', '1', '5150', '25214', '25665', '2', '1088', '13511016818', '2', '', '1', '1979-10-24', null, '4', '29', '@leju.com', '0', '0', '0', '0', '', '总裁办', null, '', 'D:/wamp/www/xinlangleju/images/thumb_img/14538934027397.jpg', null, '0');
INSERT INTO `oa_user` VALUES ('13', '4', 'linxi', '', '0', 'linxi', '30005', '谢林曦', '1', '5109', '25910', '26207', '2', '1116', '15810893207', '3', '', '1', '1984-06-07', null, '4', '29', '@leju.com', '0', '0', '0', '0', '1082941', '运营管理部', null, '', 'D:/wamp/www/xinlangleju/images/thumb_img/14538934024763.jpg', null, '0');
INSERT INTO `oa_user` VALUES ('14', '7', 'zhouyou', '', '0', 'zhouyou', '30009', '周游', '1', '3012', '25786', '25909', '2', '1008', '13621116446', '3', '', '1', '1977-10-21', null, '4', '29', '@leju.com', '0', '0', '0', '0', '978162', '人力资源部', null, '', 'D:/wamp/www/xinlangleju/images/thumb_img/14538934039989.jpg', null, '0');
INSERT INTO `oa_user` VALUES ('15', '4033', 'zengting1', '', '0', 'zengting1', '34555', '曾婷', '', '3036', '14517', '14544', '1', '023-63018868-8011', '18623000311', '0', '', '1', '1983-11-18', null, '2', '7', '@leju.com', '0', '0', '0', '0', '987391', '重庆公司', null, '', 'D:/wamp/www/xinlangleju/images/thumb_img/14538934031846.jpg', null, '0');
INSERT INTO `oa_user` VALUES ('16', '14986', 'wenjuan15', '', '0', 'wenjuan15', '58403', '巴文娟', '', '3050', '8154', '8155', '0', '0371-55686631', '18530000214', '0', '', '0', '1992-04-01', null, '2', '309', '@leju.com', '0', '0', '0', '0', '', '河南公司', null, '', '', null, '0');
INSERT INTO `oa_user` VALUES ('17', '8893', 'lulu7', '', '0', 'lulu7', '51130', '陈露露', '', '3049', '23635', '23636', '0', '0553-5815788-8029', '18725530006', '0', '', '0', '1991-09-25', null, '4', '306', '@leju.com', '0', '0', '0', '0', '', '芜湖公司', null, '', 'D:/wamp/www/xinlangleju/images/thumb_img/14538934034016.jpg', null, '0');
INSERT INTO `oa_user` VALUES ('18', '13376', 'yitong2', '', '0', 'yitong2', '55203', '朱奕彤', '', '3016', '210', '211', '1', '7729', '18643803000', '0', '', '0', '1994-05-15', null, '3', '29', '@leju.com', '0', '0', '0', '0', '', '北京公司', null, '', 'D:/wamp/www/xinlangleju/images/thumb_img/14538934033601.jpg', null, '0');
INSERT INTO `oa_user` VALUES ('19', '12345', 'jianheng', '', '0', 'jianheng', '53151', '李建恒', '', '3016', '220', '221', '1', '', '15330000613', '0', '', '0', '1991-08-18', null, '4', '29', '@leju.com', '0', '0', '0', '0', '', '北京公司', null, '', 'D:/wamp/www/xinlangleju/images/thumb_img/14538934035475.jpg', null, '0');
INSERT INTO `oa_user` VALUES ('20', '11290', 'lixia5', '', '0', 'lixia5', '54357', '万丽霞', '', '3027', '18094', '18095', '0', '020-66809800', '15013271255', '0', '', '0', '1989-10-12', null, '4', '8', '@leju.com', '0', '0', '0', '0', '', '广州公司', null, '', 'D:/wamp/www/xinlangleju/images/thumb_img/14538935801825.jpg', null, '0');
INSERT INTO `oa_user` VALUES ('21', '3875', 'lixiang2', '', '0', 'lixiang2', '34351', '李想', '', '5184', '21223', '21224', '1', '0571-85839212', '13588701500', '0', '', '1', '1989-10-04', null, '4', '4', '@leju.com', '0', '0', '0', '0', '918576', '杭州公司', null, '', 'D:/wamp/www/xinlangleju/images/thumb_img/14538935817929.jpg', null, '0');
INSERT INTO `oa_user` VALUES ('22', '7062', 'lixia2', '', '0', 'lixia2', '37532', '刘丽霞', '', '600', '10310', '10311', '1', '1463', '18612170413', '0', '', '1', '1983-12-20', null, '4', '29', '@jiaju.com', '0', '0', '0', '0', '1609845', '财务部', null, '', '', null, '0');
INSERT INTO `oa_user` VALUES ('23', '5752', 'lixia1', '', '0', 'lixia1', '36166', '王利霞', '', '3024', '20948', '20949', '1', '89807494', '15968173434', '0', '', '0', '1990-02-11', null, '4', '4', '@leju.com', '0', '0', '0', '0', '942515', '杭州公司', null, '', 'D:/wamp/www/xinlangleju/images/thumb_img/14538935816472.jpg', null, '0');
INSERT INTO `oa_user` VALUES ('24', '10567', 'lixia4', '', '0', 'lixia4', '51583', '李霞', '', '3037', '14821', '14822', '2', '028-86210700-617', '18208173962', '0', '', '0', '1988-06-12', null, '2', '10', '@leju.com', '0', '0', '0', '0', '', '成都公司', null, '', 'D:/wamp/www/xinlangleju/images/thumb_img/14538935825072.jpg', null, '0');
INSERT INTO `oa_user` VALUES ('25', '10745', 'lixiang9', '', '0', 'lixiang9', '37649', '李响', '', '5211', '349', '350', '0', '58957572', '18612310494', '0', '', '0', '1984-03-12', null, '0', '29', '@jiaju.com', '0', '0', '0', '0', '', '装修电商-总部', null, '', 'D:/wamp/www/xinlangleju/images/thumb_img/14538935823591.jpg', null, '0');
INSERT INTO `oa_user` VALUES ('26', '12791', 'lixia6', '', '0', 'lixia6', '55632', '李丽霞', '', '3027', '18078', '18079', '0', '020-66809800', '15013084928', '0', '', '0', '1975-08-05', null, '3', '8', '@leju.com', '0', '0', '0', '0', '', '广州公司', null, '', 'D:/wamp/www/xinlangleju/images/thumb_img/14538935822931.jpg', null, '0');
INSERT INTO `oa_user` VALUES ('27', '14980', 'lixiao1', '', '0', 'lixiao1', '56729', '李晓', '', '3040', '11923', '11924', '0', '', '18053219221', '0', '', '0', '0000-00-00', null, '3', '24', '@leju.com', '0', '0', '0', '0', '', '青岛公司', null, '', '', null, '0');
INSERT INTO `oa_user` VALUES ('28', '8474', 'lixiang8', '', '0', 'lixiang8', '38596', '郑利香', '', '5115', '20726', '20859', '0', '0591-87514749', '13609558389', '3', '', '0', '1976-03-22', null, '4', '524', '@leju.com', '0', '0', '0', '0', '', '福州公司', null, '', 'D:/wamp/www/xinlangleju/images/thumb_img/14538935829037.jpg', null, '0');
INSERT INTO `oa_user` VALUES ('29', '14510', 'lixiang12', '', '0', 'lixiang12', '57718', '李翔', '', '5212', '5487', '5488', '1', '', '18810725683', '0', '', '0', '0000-00-00', null, '4', '29', '@jiaju.com', '0', '0', '0', '0', '', '装修电商-北京', null, '', '', null, '0');
INSERT INTO `oa_user` VALUES ('31', '13185', 'lixia7', '', '0', 'lixia7', '56789', '张丽霞', '', '5211', '5762', '5763', '1', '', '13436871762', '0', '', '0', '1988-12-22', null, '4', '29', '@jiaju.com', '0', '0', '0', '0', '', '装修电商-总部', null, '', '', null, '0');
INSERT INTO `oa_user` VALUES ('32', '13575', 'lixia8', '', '0', 'lixia8', '56992', '李夏', '', '5032', '25911', '25926', '1', '7927', '18501232951', '2', '', '1', '1981-05-18', null, '5', '29', '@leju.com', '0', '0', '0', '0', '', '信息系统部', null, '', 'D:/wamp/www/xinlangleju/images/thumb_img/14538936114636.jpg', null, '0');
INSERT INTO `oa_user` VALUES ('33', '252', 'naiwen', '', '0', 'naiwen', '30463', '陈乃文', '4', '3024', '21093', '21108', '1', '0571-87359281', '15888869185', '0', 'F0463', '1', '1984-09-15', null, '4', '4', '@leju.com', '0', '0', '0', '0', '919202', '杭州公司', null, 'http://weibo.com/diordesign', 'D:/wamp/www/xinlangleju/images/thumb_img/14543203879775.jpg', null, '0');

-- ----------------------------
-- Table structure for oa_userauth
-- ----------------------------
DROP TABLE IF EXISTS `oa_userauth`;
CREATE TABLE `oa_userauth` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户权限表主键id',
  `userid` int(10) DEFAULT '0' COMMENT '用户id',
  `auth` varchar(255) DEFAULT '' COMMENT '用户权限集',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_userauth
-- ----------------------------
INSERT INTO `oa_userauth` VALUES ('5', '3', '发布轮播图');
INSERT INTO `oa_userauth` VALUES ('7', '4', '报销管理');
INSERT INTO `oa_userauth` VALUES ('9', '1', '用户权限管理');
INSERT INTO `oa_userauth` VALUES ('12', '2', '用户权限管理,后台通知管理');

-- ----------------------------
-- Table structure for oa_version
-- ----------------------------
DROP TABLE IF EXISTS `oa_version`;
CREATE TABLE `oa_version` (
  `versionid` int(10) NOT NULL AUTO_INCREMENT COMMENT '版本表主键id',
  `plat_form` varchar(20) DEFAULT '' COMMENT '平台: Android  IOS',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `downloadurl` varchar(100) DEFAULT '' COMMENT '版本更新下载地址',
  `status` tinyint(3) DEFAULT '0' COMMENT '状态： 0->历史版本 1->当前版本',
  `createtime` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`versionid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_version
-- ----------------------------
INSERT INTO `oa_version` VALUES ('1', 'Android', '1.0', 'www.baidu.com', '0', '2016-02-18 17:07:28');
INSERT INTO `oa_version` VALUES ('2', 'Android', '1.1', 'www.baidu.com', '0', '2016-02-18 17:12:45');
INSERT INTO `oa_version` VALUES ('4', 'Android', '1.2', 'www.baidu.com', '0', '2016-02-18 17:20:48');
INSERT INTO `oa_version` VALUES ('5', 'Android', '1.3', 'www.baidu.com', '0', '2016-02-18 17:22:00');
INSERT INTO `oa_version` VALUES ('6', 'Android', '1.4', 'www.baidu.com', '1', '2016-02-18 17:22:53');

-- ----------------------------
-- Table structure for oa_view
-- ----------------------------
DROP TABLE IF EXISTS `oa_view`;
CREATE TABLE `oa_view` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '意见反馈表主键id',
  `email` varchar(30) DEFAULT '' COMMENT '用户邮箱',
  `content` text COMMENT '意见内容',
  `createtime` datetime DEFAULT NULL COMMENT '意见反馈时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_view
-- ----------------------------

-- ----------------------------
-- Table structure for oa_zhaopin
-- ----------------------------
DROP TABLE IF EXISTS `oa_zhaopin`;
CREATE TABLE `oa_zhaopin` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '招聘职位表之间id',
  `position` varchar(30) DEFAULT '' COMMENT '职位名称',
  `num` int(10) DEFAULT '0' COMMENT '需求人数',
  `address` varchar(50) DEFAULT '' COMMENT '工作地点',
  `time` varchar(25) DEFAULT '' COMMENT '发布时间',
  `limittime` varchar(20) DEFAULT '' COMMENT '工作年限',
  `edu` varchar(50) DEFAULT '' COMMENT '学历',
  `bonus` int(10) DEFAULT '0' COMMENT '推荐奖励金额',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态：1->显示 2->隐藏',
  `jobduty` text COMMENT '工作职责',
  `jobneed` text COMMENT '职位需求',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_zhaopin
-- ----------------------------
INSERT INTO `oa_zhaopin` VALUES ('1', 'CEO', '1', '中南海', '', '', '', '10000', '1', '2015-12-08 11:44:47', null);
INSERT INTO `oa_zhaopin` VALUES ('2', 'CTO', '1', '上海', '', '', '', '1000', '2', '2015-12-08 14:45:00', null);
INSERT INTO `oa_zhaopin` VALUES ('3', 'COO', '2', '深圳', '2016-02-17', '3', '本科', '1000', '1', '领导', '领导');
INSERT INTO `oa_zhaopin` VALUES ('6', '召唤师', '1', '上海', '2015-12-17', '1', '小学生', '1000', '1', 'aaa\r\nsss\r\nddd', 'fff\r\nggg\r\nhhh');
INSERT INTO `oa_zhaopin` VALUES ('7', '总经理', '1', '上海', '2016-02-17', '', '', '1000', '1', '', '');

-- ----------------------------
-- Table structure for table 33
-- ----------------------------
DROP TABLE IF EXISTS `table 33`;
CREATE TABLE `table 33` (
  `COL 1` varchar(12) DEFAULT NULL,
  `COL 2` varchar(51) DEFAULT NULL,
  `COL 3` varchar(12) DEFAULT NULL,
  `COL 4` varchar(6) DEFAULT NULL,
  `COL 5` varchar(7) DEFAULT NULL,
  `COL 6` varchar(9) DEFAULT NULL,
  `COL 7` varchar(103) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table 33
-- ----------------------------
INSERT INTO `table 33` VALUES ('user_id', 'user_name', 'user_sn', 'role', 'role_id', 'orgstr_id', 'orgstr_tree');
INSERT INTO `table 33` VALUES ('FF4BEAD27CA9', '马晶晶', '30666', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `table 33` VALUES ('151457E5BB24', '付佳', '30149', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `table 33` VALUES ('9E51A5391C2A', '寇屾', '30478', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `table 33` VALUES ('8B538D27A279', '周思', '30510', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `table 33` VALUES ('0281DBC3F636', '黄薇', '30088', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `table 33` VALUES ('B0AB0FA5D712', '贺芳', '31560', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `table 33` VALUES ('A4B6AF257919', '徐婷', '33065', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `table 33` VALUES ('7BB7F73C4942', '武鑫', '34888', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `table 33` VALUES ('C43B5FB56756', '王元', '30143', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `table 33` VALUES ('6D25D1971693', '王沛', '56180', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `table 33` VALUES ('2F95E61FBDD3', '吴晓珂', '55106', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `table 33` VALUES ('9E3C4959D683', '安建周', '56237', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `table 33` VALUES ('3A07FEBB2463', '吕鑫', '31071', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `table 33` VALUES ('01EEF7B6D1C4', '肖鹏', '30824', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `table 33` VALUES ('837AE8092B09', '范晶晶', '58405', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `table 33` VALUES ('837AF287B047', '于洪国', '58409', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `table 33` VALUES ('837AF72FEF76', '陈成宙', '58412', '销售', '0', '866', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包渠道-组员');
INSERT INTO `table 33` VALUES ('4716A0AD4D2B', '李昂', '32327', '销售', '0', '868', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包电商-组员');
INSERT INTO `table 33` VALUES ('01EF0B37B532', '叶明刚', '37132', '销售', '0', '868', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包电商-组员');
INSERT INTO `table 33` VALUES ('0ACAA9E5A4E1', '牛志峰', '31588', '销售', '0', '868', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包电商-组员');
INSERT INTO `table 33` VALUES ('2F95EB21F0B5', '王奎宇', '55101', '销售', '0', '868', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包电商-组员');
INSERT INTO `table 33` VALUES ('E79E0F434131', '吴濠见33371', '33371', '销售', '0', '868', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包电商-组员');
INSERT INTO `table 33` VALUES ('C10999F378E3', '李妮', '32182', '销售', '0', '868', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包电商-组员');
INSERT INTO `table 33` VALUES ('9FA003043CF9', '张世棋', '51099', '销售', '0', '868', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包电商-组员');
INSERT INTO `table 33` VALUES ('A65B3E9B8FDE', '周晶', '32750', '销售', '0', '868', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-外包电商-组员');
INSERT INTO `table 33` VALUES ('76321869602A', '明静', '33498', '销售', '0', '870', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-渠道销售二组（停）-组员');
INSERT INTO `table 33` VALUES ('397C0478B6CB', '陶然', '34817', '销售', '0', '2266', '互联网板块-房产-营销中心-营销中心-营销中心-营销中心');
INSERT INTO `table 33` VALUES ('805FB069794A', '逄格强', '33567', '销售', '0', '2266', '互联网板块-房产-营销中心-营销中心-营销中心-营销中心');
INSERT INTO `table 33` VALUES ('C6BC48FCAEDD', '俞志强', '30654', '销售', '0', '2266', '互联网板块-房产-营销中心-营销中心-营销中心-营销中心');
INSERT INTO `table 33` VALUES ('87F98F69591F', '何涛', '30547', '销售', '0', '2267', '互联网板块-房产-大客户部-大客户部-大客户部-大客户部');
INSERT INTO `table 33` VALUES ('F6FD78BE402E', '何靖', '33459', '销售', '0', '2267', '互联网板块-房产-大客户部-大客户部-大客户部-大客户部');
INSERT INTO `table 33` VALUES ('B286DB41F616', '张涵', '34531', '销售', '0', '2267', '互联网板块-房产-大客户部-大客户部-大客户部-大客户部');
INSERT INTO `table 33` VALUES ('B28756E520D2', '李丕业', '33968', '销售', '0', '2267', '互联网板块-房产-大客户部-大客户部-大客户部-大客户部');
INSERT INTO `table 33` VALUES ('3C528AA6DFB7', '陈阳', '30587', '销售', '0', '2267', '互联网板块-房产-大客户部-大客户部-大客户部-大客户部');
INSERT INTO `table 33` VALUES ('2ED60F624C47', '陈时光', '30130', '销售', '0', '2267', '互联网板块-房产-大客户部-大客户部-大客户部-大客户部');
INSERT INTO `table 33` VALUES ('A0C7FB28AFB4', '庞岩', '31506', '销售', '0', '2304', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-运营组（停）-组员');
INSERT INTO `table 33` VALUES ('6706F241B961', '潘博', '33682', '销售', '0', '2304', '互联网板块-房产-联合区-联合区-外包渠道-外包渠道-运营组（停）-组员');
INSERT INTO `table 33` VALUES ('C73AC9CC0C5A', '易居武汉', 'B9910', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `table 33` VALUES ('463FB99A0CD5', '尤一雅', '32583', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `table 33` VALUES ('F8ADCF3A87EE', '李彬彬', '32818', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `table 33` VALUES ('B5F6BB6FCD05', '李翠33295', '33295', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `table 33` VALUES ('B177C47B6B31', '梁志宏', '31211', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `table 33` VALUES ('7F8A5FC2C380', '张健', '31703', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `table 33` VALUES ('B2C7C35890B5', '刘显财', '30548', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `table 33` VALUES ('6DCC124798DB', '刘永春', '30285', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `table 33` VALUES ('C696C413F6BA', '张鹏', '30318', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `table 33` VALUES ('9F638174E0D1', '朱帮伟35092', '35092', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `table 33` VALUES ('FF9DF330C5C2', '曾荣平', '30224', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `table 33` VALUES ('9A59558EB7F4', '曾晓艳', '30372', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `table 33` VALUES ('9C1F4474EF32', '李磊', '30118', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `table 33` VALUES ('5C4AE1C5F512', '梁星炜', '30183', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `table 33` VALUES ('6232DA995F9E', '刘小文', '30067', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `table 33` VALUES ('C07BD562A3FC', '盛雅凤', '30494', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `table 33` VALUES ('77CF357353BB', '宋强', '30117', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `table 33` VALUES ('26FDA75A0986', '凃莹洁', '30175', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `table 33` VALUES ('EB5DA3DC0E5C', '涂然', '30327', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `table 33` VALUES ('925D3B505641', '王洪波', '30569', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `table 33` VALUES ('34EF6C4580B0', '王欣', 'F0251', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `table 33` VALUES ('4D2343065E9B', '王一', '30264', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `table 33` VALUES ('6971DEC2C095', '于化龙', '30375', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `table 33` VALUES ('738DA052F7A3', '张揆', '30555', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `table 33` VALUES ('164F5AF0DDA5', '周小军', '30738', '销售', '0', '2405', '互联网板块-房产-历史报备-历史报备-历史报备-历史报备');
INSERT INTO `table 33` VALUES ('B0D1FA84A929', '康新丽', '37208', '销售', '0', '2450', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售一组-组员');
INSERT INTO `table 33` VALUES ('20E8DCD4C8F6', '田地', '36351', '销售', '0', '2450', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售一组-组员');
INSERT INTO `table 33` VALUES ('B0D2551625F7', '周欣凯', '36732', '销售', '0', '2450', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售一组-组员');
INSERT INTO `table 33` VALUES ('B93093862613', '高晴晴', '53870', '销售', '0', '2450', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售一组-组员');
INSERT INTO `table 33` VALUES ('6E6D46D97352', '任克强', '56175', '销售', '0', '2450', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售一组-组员');
INSERT INTO `table 33` VALUES ('B0CD4973DAD1', '杨雯静', '36988', '销售', '0', '2450', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售一组-组员');
INSERT INTO `table 33` VALUES ('3408FA908A28', '孙艳彬', '35865', '销售', '0', '2450', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售一组-组员');
INSERT INTO `table 33` VALUES ('F78ABD240B91', '贺兢', '56284', '销售', '0', '2450', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售一组-组员');
INSERT INTO `table 33` VALUES ('B0CF4137C665', '徐莎1', '36987', '销售', '0', '2450', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售一组-组员');
INSERT INTO `table 33` VALUES ('B932BDDFED92', '杨新沂', '51388', '销售', '0', '2450', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售一组-组员');
INSERT INTO `table 33` VALUES ('BCDFA92F5AF1', '石勃', '53304', '销售', '0', '2668', '互联网板块-房产-联合区');
INSERT INTO `table 33` VALUES ('840998A83FEF', '管理员（资源锁定、第三方预订跟踪）', 'ADMIN', '销售', '0', '2675', '互联网板块-房产-北方区-北方-北京-北京');
INSERT INTO `table 33` VALUES ('0A6821AED1B2', '庄景鹏', '54538', '销售', '0', '2675', '互联网板块-房产-北方区-北方-北京-北京');
INSERT INTO `table 33` VALUES ('06180E64DFA2', '曹庆禹', '34611', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `table 33` VALUES ('23244961DE36', '徐满', '35782', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `table 33` VALUES ('25DA0B43C0B5', '郭建华', '37089', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `table 33` VALUES ('6AC58BA84E11', '陈正龙', '34262', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `table 33` VALUES ('512141FCD719', '邱晨', '30915', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `table 33` VALUES ('187DE0317AC9', '蓝雪莉', '30046', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `table 33` VALUES ('5A15D9692031', '北京嘉华', 'B9701', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `table 33` VALUES ('A03ECE4123A2', '汪洋', '30576', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `table 33` VALUES ('4BCF1D47E246', '陶涛', '31028', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `table 33` VALUES ('791D7E0BBF78', '王凯', '30060', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `table 33` VALUES ('D05B6B3EB0B2', '温浩安', '37406', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `table 33` VALUES ('30783BB22039', '王甜', '32444', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `table 33` VALUES ('D05CC0C32C15', '胡春晓', '33962', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `table 33` VALUES ('070D21E98D25', '李志强', '33175', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `table 33` VALUES ('18FFB9660A35', '刘丹52602', '52602', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `table 33` VALUES ('9EC1FBD1CB52', '宋歌', '32461', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `table 33` VALUES ('B6317DA8ED74', '蒋宪君', '36696', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `table 33` VALUES ('37DE755730E5', '吴科香', '30200', '销售', '0', '2821', '互联网板块-房产-北方区-北方-北京-北京-销售一部1组-组员');
INSERT INTO `table 33` VALUES ('A3E9FB4D3F75', '刘娜', '30068', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `table 33` VALUES ('13EAD86D3B74', '段立伟', '30746', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `table 33` VALUES ('307A45DC05E3', '李杰', '30021', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `table 33` VALUES ('1F6DB6C42E1B', '王小月', '30490', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `table 33` VALUES ('4A070C1DAE81', '牛志明', '30040', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `table 33` VALUES ('1C131ABDFE51', '李哲', '30003', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `table 33` VALUES ('6AD38638B2E3', '张钰', '30013', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `table 33` VALUES ('88CC5A563467', '李菲菲', '30172', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `table 33` VALUES ('44491F756426', '李敏熙', '30015', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `table 33` VALUES ('C33D742B9770', '陈孟龙', '51083', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `table 33` VALUES ('C157050E4C96', '罗士凯36763', '36763', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `table 33` VALUES ('4057891E52CF', '张振河', '32459', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `table 33` VALUES ('268B8BAD6229', '滕腾', '38996', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `table 33` VALUES ('D05D7AC4E1C5', '张成龙', '52664', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `table 33` VALUES ('36200223C49A', '娜敏', '35679', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `table 33` VALUES ('A16D0EB46FF5', '高志敏', '32468', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `table 33` VALUES ('D3BCD8500A2C', '李坤W1003', '32443', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `table 33` VALUES ('76B5B5ACF458', '刘雪松', '32460', '销售', '0', '2823', '互联网板块-房产-北方区-北方-北京-北京-销售一部2组-组员');
INSERT INTO `table 33` VALUES ('25D6ECE95359', '邓虹', '37200', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `table 33` VALUES ('9C4CA3197073', '胡沛宜', '38240', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `table 33` VALUES ('636CCC796A13', '孙笑宇', '38120', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `table 33` VALUES ('46F294A29A67', '曹雪丽', '36655', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `table 33` VALUES ('636BB29B22F7', '宋德坤', '38119', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `table 33` VALUES ('A2D611041373', '谢亚锋', '38145', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `table 33` VALUES ('25D67554C374', '唐玉婷', '37187', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `table 33` VALUES ('605F37EB14D4', '伍丹婷', '50428', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `table 33` VALUES ('8D8858BFC0D4', '刘珺芝', '50335', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `table 33` VALUES ('F94640133291', '黄榆晴', '54635', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `table 33` VALUES ('C088A227A900', '饶萃', '50472', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `table 33` VALUES ('9E016A1D6541', '程伟强', '56490', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `table 33` VALUES ('9992F275C265', '张涛', '30671', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `table 33` VALUES ('0104B75EDD00', '马勋', '56570', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `table 33` VALUES ('F0C20CC99990', '赵秀娟', '30532', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `table 33` VALUES ('1423A18EDB71', '张俊财', '50314', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `table 33` VALUES ('B65999749092', '董俊', '50480', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `table 33` VALUES ('0CC4A05C45F9', '陈国雄', '34936', '销售', '0', '2825', '互联网板块-房产-华南区-华南区-广州-广州-销售一组-组员');
INSERT INTO `table 33` VALUES ('2CB4884311EA', '赖浩城', '30759', '销售', '0', '2827', '互联网板块-房产-华南区-华南区-广州-广州-销售二组-组员');
INSERT INTO `table 33` VALUES ('061A54EC7FE2', '吴佳妮', '37131', '销售', '0', '2827', '互联网板块-房产-华南区-华南区-广州-广州-销售二组-组员');
INSERT INTO `table 33` VALUES ('FFB4A1E80850', '陈桂林', '32663', '销售', '0', '2827', '互联网板块-房产-华南区-华南区-广州-广州-销售二组-组员');
INSERT INTO `table 33` VALUES ('95BEC72B3A90', '陈寒', '32137', '销售', '0', '2827', '互联网板块-房产-华南区-华南区-广州-广州-销售二组-组员');
INSERT INTO `table 33` VALUES ('9AD7747712A6', '杨彬成', '34685', '销售', '0', '2827', '互联网板块-房产-华南区-华南区-广州-广州-销售二组-组员');
INSERT INTO `table 33` VALUES ('142456D507D9', '郎秋悦', '50313', '销售', '0', '2827', '互联网板块-房产-华南区-华南区-广州-广州-销售二组-组员');
INSERT INTO `table 33` VALUES ('1D5BDEDD7E63', '柳蜀筠', '50334', '销售', '0', '2827', '互联网板块-房产-华南区-华南区-广州-广州-销售二组-组员');
INSERT INTO `table 33` VALUES ('2DFE2072E988', '詹碧云', '55586', '销售', '0', '2827', '互联网板块-房产-华南区-华南区-广州-广州-销售二组-组员');
INSERT INTO `table 33` VALUES ('4B0279D581B9', '梁泳丝', '55629', '销售', '0', '2827', '互联网板块-房产-华南区-华南区-广州-广州-销售二组-组员');
INSERT INTO `table 33` VALUES ('631819BE5D01', '张松', '54376', '销售', '0', '2827', '互联网板块-房产-华南区-华南区-广州-广州-销售二组-组员');
INSERT INTO `table 33` VALUES ('BA72DD9A1D19', '张业家', '52751', '销售', '0', '2827', '互联网板块-房产-华南区-华南区-广州-广州-销售二组-组员');
INSERT INTO `table 33` VALUES ('BF305E13C913', '罗文静', '32995', '销售', '0', '2827', '互联网板块-房产-华南区-华南区-广州-广州-销售二组-组员');
INSERT INTO `table 33` VALUES ('FF6CA00FA819', '李思玥', '38178', '销售', '0', '2827', '互联网板块-房产-华南区-华南区-广州-广州-销售二组-组员');
INSERT INTO `table 33` VALUES ('0D6C74EE9AC4', '黎志新', '38292', '销售', '0', '2827', '互联网板块-房产-华南区-华南区-广州-广州-销售二组-组员');
INSERT INTO `table 33` VALUES ('FF6D09B8F7B8', '朱媛媛', '38184', '销售', '0', '2829', '互联网板块-房产-华南区-华南区-广州-广州-销售三组-组员');
INSERT INTO `table 33` VALUES ('9B72C783F7BA', '周素红', '34686', '销售', '0', '2829', '互联网板块-房产-华南区-华南区-广州-广州-销售三组-组员');
INSERT INTO `table 33` VALUES ('7FE79DF4036F', '李超33773', '33773', '销售', '0', '2829', '互联网板块-房产-华南区-华南区-广州-广州-销售三组-组员');
INSERT INTO `table 33` VALUES ('970FEDD8C3F2', '吴雪娟36863', '36863', '销售', '0', '2829', '互联网板块-房产-华南区-华南区-广州-广州-销售三组-组员');
INSERT INTO `table 33` VALUES ('7E1985E07052', '李坤', '30271', '销售', '0', '2829', '互联网板块-房产-华南区-华南区-广州-广州-销售三组-组员');
INSERT INTO `table 33` VALUES ('81E2CA798316', '樊强', '33348', '销售', '0', '2829', '互联网板块-房产-华南区-华南区-广州-广州-销售三组-组员');
INSERT INTO `table 33` VALUES ('FB40B699FE97', '林煜程', '37205', '销售', '0', '2829', '互联网板块-房产-华南区-华南区-广州-广州-销售三组-组员');
INSERT INTO `table 33` VALUES ('51D54A9E7197', '唐亚芳', '50473', '销售', '0', '2829', '互联网板块-房产-华南区-华南区-广州-广州-销售三组-组员');
INSERT INTO `table 33` VALUES ('5BEB9D37C4D2', '黄俊', '55637', '销售', '0', '2829', '互联网板块-房产-华南区-华南区-广州-广州-销售三组-组员');
INSERT INTO `table 33` VALUES ('23437A68C700', '黄嘉莹', '31467', '销售', '0', '2829', '互联网板块-房产-华南区-华南区-广州-广州-销售三组-组员');
INSERT INTO `table 33` VALUES ('099BE7ACD126', '陈佳锐', '38193', '销售', '0', '2829', '互联网板块-房产-华南区-华南区-广州-广州-销售三组-组员');
INSERT INTO `table 33` VALUES ('25D7AFBE57E0', '张剑', '37188', '销售', '0', '2829', '互联网板块-房产-华南区-华南区-广州-广州-销售三组-组员');
INSERT INTO `table 33` VALUES ('9C4CCBC85618', '梁学尧', '38239', '销售', '0', '2829', '互联网板块-房产-华南区-华南区-广州-广州-销售三组-组员');
INSERT INTO `table 33` VALUES ('F0D66BE72A52', '陈佳56569', '56569', '销售', '0', '2829', '互联网板块-房产-华南区-华南区-广州-广州-销售三组-组员');
INSERT INTO `table 33` VALUES ('3D6FED6B60F8', '胡芳', '37390', '销售', '0', '2831', '互联网板块-房产-华南区-华南区-广州-广州-销售四组-组员');
INSERT INTO `table 33` VALUES ('A2D6A201DEC0', '李健', '38143', '销售', '0', '2831', '互联网板块-房产-华南区-华南区-广州-广州-销售四组-组员');
INSERT INTO `table 33` VALUES ('1CCE0716C81C', '董育红', '31667', '销售', '0', '2831', '互联网板块-房产-华南区-华南区-广州-广州-销售四组-组员');
INSERT INTO `table 33` VALUES ('A27B21013407', '岳黎', '30531', '销售', '0', '2831', '互联网板块-房产-华南区-华南区-广州-广州-销售四组-组员');
INSERT INTO `table 33` VALUES ('48BE9A0E3E70', '宫新宇', '33076', '销售', '0', '2831', '互联网板块-房产-华南区-华南区-广州-广州-销售四组-组员');
INSERT INTO `table 33` VALUES ('72B4A7DCAA2A', '程夷', '30560', '销售', '0', '2831', '互联网板块-房产-华南区-华南区-广州-广州-销售四组-组员');
INSERT INTO `table 33` VALUES ('1A591E00DD57', '邱国燕', '52835', '销售', '0', '2831', '互联网板块-房产-华南区-华南区-广州-广州-销售四组-组员');
INSERT INTO `table 33` VALUES ('8137CAE9DD65', '周游', '56464', '销售', '0', '2831', '互联网板块-房产-华南区-华南区-广州-广州-销售四组-组员');
INSERT INTO `table 33` VALUES ('079ECB7CBFD7', '林永洪', '55551', '销售', '0', '2831', '互联网板块-房产-华南区-华南区-广州-广州-销售四组-组员');
INSERT INTO `table 33` VALUES ('439B286F13A4', '韩笑', '30647', '销售', '0', '2831', '互联网板块-房产-华南区-华南区-广州-广州-销售四组-组员');
INSERT INTO `table 33` VALUES ('F76BD90F0053', '庞丹', '32661', '销售', '0', '2831', '互联网板块-房产-华南区-华南区-广州-广州-销售四组-组员');
INSERT INTO `table 33` VALUES ('64880CB7BA21', '陈文剑', '38227', '销售', '0', '2831', '互联网板块-房产-华南区-华南区-广州-广州-销售四组-组员');
INSERT INTO `table 33` VALUES ('2F0CE8496759', '汪潇', '34837', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `table 33` VALUES ('62C804608BBD', '陈毅峰', '30455', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `table 33` VALUES ('36E00459B607', '邓柏欣', '30428', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `table 33` VALUES ('BD71E1F158E1', '何凌燕', '30107', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `table 33` VALUES ('0D1D14ACB5F2', '陈夏璐', '33029', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `table 33` VALUES ('34ECA945D226', '杨大宇', '54334', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `table 33` VALUES ('079EC7195083', '唐婧', '54642', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `table 33` VALUES ('29A33B0DAC99', '林燃', '56607', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `table 33` VALUES ('65A54F6A8844', '刘丽50429', '50429', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `table 33` VALUES ('82FAB8E3CF90', '朱勇', '50453', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `table 33` VALUES ('19298EA3A825', '吴桐', '54308', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `table 33` VALUES ('B6BB5A4F37A6', '杨东亮', '35355', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `table 33` VALUES ('EB2E8CD5AA8A', '熊辉', '30090', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `table 33` VALUES ('DCEC6FCEEDF8', '夏敏', '38287', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `table 33` VALUES ('C120978E6B15', '欧阳星', '30027', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `table 33` VALUES ('25D75F0122B3', '甘冠期', '37186', '销售', '0', '2833', '互联网板块-房产-华南区-华南区-广州-广州-销售五组-组员');
INSERT INTO `table 33` VALUES ('4AB18A47EC68', '郭辉', '37130', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `table 33` VALUES ('91DC4E073AC2', '吴奇', '38137', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `table 33` VALUES ('5678B15F7FC1', '张暘', '36653', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `table 33` VALUES ('4AB5197D97E4', '袁菱曼', '38106', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `table 33` VALUES ('735279F0BD37', '岳洁钰', '33666', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `table 33` VALUES ('73CCC9547AAC', '杨弋', '34664', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `table 33` VALUES ('4CA6F3634762', '李建', '32117', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `table 33` VALUES ('F5ABCF4C72B0', '陈文鑫', '30535', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `table 33` VALUES ('29C6F32E9B41', '李美琤', '31799', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `table 33` VALUES ('6F5D57A27266', '唐青', '30768', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `table 33` VALUES ('4CFE32E54149', '雷英', '50393', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `table 33` VALUES ('3CD627B551D8', '黄文杰54344', '54344', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `table 33` VALUES ('F7BFF2C21D53', '吕想', '54625', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `table 33` VALUES ('079EC2791CD9', '赵翠', '54640', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `table 33` VALUES ('079EBB564687', '林立', '54648', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `table 33` VALUES ('1F1405B30D88', '欧阳文波', '56580', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `table 33` VALUES ('D9A71EB18926', '朱江', '52797', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `table 33` VALUES ('C553CDC0BFAF', '李佳32189', '32189', '销售', '0', '2835', '互联网板块-房产-华南区-华南区-深圳-深圳-销售一组-组员');
INSERT INTO `table 33` VALUES ('46AD0515F729', '李志伟', '36494', '销售', '0', '2837', '互联网板块-房产-华南区-华南区-深圳-深圳-销售二组-组员');
INSERT INTO `table 33` VALUES ('4AB42D242AF8', '李义刚', '37231', '销售', '0', '2837', '互联网板块-房产-华南区-华南区-深圳-深圳-销售二组-组员');
INSERT INTO `table 33` VALUES ('43CEDC855D40', '李逸', '31448', '销售', '0', '2837', '互联网板块-房产-华南区-华南区-深圳-深圳-销售二组-组员');
INSERT INTO `table 33` VALUES ('B597D826113E', '宋映红', '30056', '销售', '0', '2837', '互联网板块-房产-华南区-华南区-深圳-深圳-销售二组-组员');
INSERT INTO `table 33` VALUES ('FB2BFE7655D4', '王璞', '30811', '销售', '0', '2837', '互联网板块-房产-华南区-华南区-深圳-深圳-销售二组-组员');
INSERT INTO `table 33` VALUES ('9CB781DA5F86', '许艳茹', '30709', '销售', '0', '2837', '互联网板块-房产-华南区-华南区-深圳-深圳-销售二组-组员');
INSERT INTO `table 33` VALUES ('F8F62EDA4B9C', '贺今朝', '30534', '销售', '0', '2837', '互联网板块-房产-华南区-华南区-深圳-深圳-销售二组-组员');
INSERT INTO `table 33` VALUES ('93067C11B119', '李雪峰', '30577', '销售', '0', '2837', '互联网板块-房产-华南区-华南区-深圳-深圳-销售二组-组员');
INSERT INTO `table 33` VALUES ('E657C3E64371', '汲祥', '38166', '销售', '0', '2837', '互联网板块-房产-华南区-华南区-深圳-深圳-销售二组-组员');
INSERT INTO `table 33` VALUES ('B94B7AFEE9C1', '钟璐璐', '33179', '销售', '0', '2837', '互联网板块-房产-华南区-华南区-深圳-深圳-销售二组-组员');
INSERT INTO `table 33` VALUES ('3CF5C43EBA14', '王凯30832', '30832', '销售', '0', '2837', '互联网板块-房产-华南区-华南区-深圳-深圳-销售二组-组员');
INSERT INTO `table 33` VALUES ('7846E3E1FEF4', '牟丹33899', '33899', '销售', '0', '2837', '互联网板块-房产-华南区-华南区-深圳-深圳-销售二组-组员');
INSERT INTO `table 33` VALUES ('382023453AC9', '张丽38195', '38195', '销售', '0', '2839', '互联网板块-房产-华南区-华南区-深圳-深圳-销售三组-组员');
INSERT INTO `table 33` VALUES ('37DE75B958C6', '孙萍', '30054', '销售', '0', '2839', '互联网板块-房产-华南区-华南区-深圳-深圳-销售三组-组员');
INSERT INTO `table 33` VALUES ('381FE63ABC55', '任树蔚', '38173', '销售', '0', '2839', '互联网板块-房产-华南区-华南区-深圳-深圳-销售三组-组员');
INSERT INTO `table 33` VALUES ('05D832C7F157', '卢志敏', '50308', '销售', '0', '2839', '互联网板块-房产-华南区-华南区-深圳-深圳-销售三组-组员');
INSERT INTO `table 33` VALUES ('05B7C0D98CB1', '陈亮50307', '50307', '销售', '0', '2839', '互联网板块-房产-华南区-华南区-深圳-深圳-销售三组-组员');
INSERT INTO `table 33` VALUES ('1F140ABFD3F7', '杨雪琴', '56532', '销售', '0', '2839', '互联网板块-房产-华南区-华南区-深圳-深圳-销售三组-组员');
INSERT INTO `table 33` VALUES ('140A01F7CC63', '严泽亮', '35828', '销售', '0', '2841', '互联网板块-房产-华南区-华南区-惠州-惠州-销售一组-组员');
INSERT INTO `table 33` VALUES ('8ADF8AE05F47', '夏传锋', '38258', '销售', '0', '2841', '互联网板块-房产-华南区-华南区-惠州-惠州-销售一组-组员');
INSERT INTO `table 33` VALUES ('C10693834C74', '陈秀云', '38150', '销售', '0', '2841', '互联网板块-房产-华南区-华南区-惠州-惠州-销售一组-组员');
INSERT INTO `table 33` VALUES ('CF13011BE183', '刘志强34201', '34201', '销售', '0', '2841', '互联网板块-房产-华南区-华南区-惠州-惠州-销售一组-组员');
INSERT INTO `table 33` VALUES ('F97659035CB9', '姚利', '30518', '销售', '0', '2841', '互联网板块-房产-华南区-华南区-惠州-惠州-销售一组-组员');
INSERT INTO `table 33` VALUES ('FB86D2E32AA8', '黄海婷', '38123', '销售', '0', '2841', '互联网板块-房产-华南区-华南区-惠州-惠州-销售一组-组员');
INSERT INTO `table 33` VALUES ('6C6AA1C595C6', '于鑫昌', '54567', '销售', '0', '2841', '互联网板块-房产-华南区-华南区-惠州-惠州-销售一组-组员');
INSERT INTO `table 33` VALUES ('AC3EA4013AD7', '赵志武36952', '36952', '销售', '0', '2841', '互联网板块-房产-华南区-华南区-惠州-惠州-销售一组-组员');
INSERT INTO `table 33` VALUES ('803A7E20BFB7', '覃盈', '54590', '销售', '0', '2841', '互联网板块-房产-华南区-华南区-惠州-惠州-销售一组-组员');
INSERT INTO `table 33` VALUES ('045D159D3CC4', '陈爱国', '50302', '销售', '0', '2841', '互联网板块-房产-华南区-华南区-惠州-惠州-销售一组-组员');
INSERT INTO `table 33` VALUES ('7F15D68A96E3', '黄奕校', '50459', '销售', '0', '2841', '互联网板块-房产-华南区-华南区-惠州-惠州-销售一组-组员');
INSERT INTO `table 33` VALUES ('F993D52040F2', '甘淑君', '56503', '销售', '0', '2841', '互联网板块-房产-华南区-华南区-惠州-惠州-销售一组-组员');
INSERT INTO `table 33` VALUES ('BD0D3D29AA32', '熊威52764', '52764', '销售', '0', '2841', '互联网板块-房产-华南区-华南区-惠州-惠州-销售一组-组员');
INSERT INTO `table 33` VALUES ('A2EDD1ACF231', '林周强36893', '36893', '销售', '0', '2841', '互联网板块-房产-华南区-华南区-惠州-惠州-销售一组-组员');
INSERT INTO `table 33` VALUES ('6A19499B9411', '黄虎', '38213', '销售', '0', '2841', '互联网板块-房产-华南区-华南区-惠州-惠州-销售一组-组员');
INSERT INTO `table 33` VALUES ('EA2ED9429DA2', '赵宝华37014', '37014', '销售', '0', '2844', '互联网板块-房产-华南区-华南区-东莞-东莞-销售二组-组员');
INSERT INTO `table 33` VALUES ('F88CAE57E391', '沈力力', '38288', '销售', '0', '2844', '互联网板块-房产-华南区-华南区-东莞-东莞-销售二组-组员');
INSERT INTO `table 33` VALUES ('BE3F930DE7F2', '杨德甘', '50395', '销售', '0', '2844', '互联网板块-房产-华南区-华南区-东莞-东莞-销售二组-组员');
INSERT INTO `table 33` VALUES ('C09B9940FE17', '廖芩', '37219', '销售', '0', '2844', '互联网板块-房产-华南区-华南区-东莞-东莞-销售二组-组员');
INSERT INTO `table 33` VALUES ('BE3F6A3BDF50', '冯强', '50387', '销售', '0', '2844', '互联网板块-房产-华南区-华南区-东莞-东莞-销售二组-组员');
INSERT INTO `table 33` VALUES ('385CAF393F34', '梁敏丝', '55560', '销售', '0', '2844', '互联网板块-房产-华南区-华南区-东莞-东莞-销售二组-组员');
INSERT INTO `table 33` VALUES ('0A1EA0E79BF7', '张俊青', '37136', '销售', '0', '2844', '互联网板块-房产-华南区-华南区-东莞-东莞-销售二组-组员');
INSERT INTO `table 33` VALUES ('0849ED721AF9', '阮春晖', '38183', '销售', '0', '2844', '互联网板块-房产-华南区-华南区-东莞-东莞-销售二组-组员');
INSERT INTO `table 33` VALUES ('17B055ED808E', '程怡芳31872', '31872', '销售', '0', '2845', '互联网板块-房产-华南区-华南区-东莞-东莞-销售一组-组员');
INSERT INTO `table 33` VALUES ('B22F4ECDE783', '郝璐', '33692', '销售', '0', '2845', '互联网板块-房产-华南区-华南区-东莞-东莞-销售一组-组员');
INSERT INTO `table 33` VALUES ('4953E7BF6A48', '庄平涛', '37423', '销售', '0', '2845', '互联网板块-房产-华南区-华南区-东莞-东莞-销售一组-组员');
INSERT INTO `table 33` VALUES ('AA5555911E61', '王楠楠', '30470', '销售', '0', '2845', '互联网板块-房产-华南区-华南区-东莞-东莞-销售一组-组员');
INSERT INTO `table 33` VALUES ('5F7BF914EE73', '黄英', '50415', '销售', '0', '2845', '互联网板块-房产-华南区-华南区-东莞-东莞-销售一组-组员');
INSERT INTO `table 33` VALUES ('BE3F3DEB6F76', '张倩倩', '50386', '销售', '0', '2845', '互联网板块-房产-华南区-华南区-东莞-东莞-销售一组-组员');
INSERT INTO `table 33` VALUES ('1AA50C1A9C43', '黄洁玲', '52766', '销售', '0', '2845', '互联网板块-房产-华南区-华南区-东莞-东莞-销售一组-组员');
INSERT INTO `table 33` VALUES ('C8D54B123DF7', '杨婷52781', '52781', '销售', '0', '2845', '互联网板块-房产-华南区-华南区-东莞-东莞-销售一组-组员');
INSERT INTO `table 33` VALUES ('0A78A04DCE12', '石湘雅', '55561', '销售', '0', '2845', '互联网板块-房产-华南区-华南区-东莞-东莞-销售一组-组员');
INSERT INTO `table 33` VALUES ('3ED1BB8DA26D', '温晓存', '32036', '销售', '0', '2845', '互联网板块-房产-华南区-华南区-东莞-东莞-销售一组-组员');
INSERT INTO `table 33` VALUES ('94C96EFEBD9A', '马贝斯', '34943', '销售', '0', '2847', '互联网板块-房产-华南区-华南区-佛山-佛山-销售一组-组员');
INSERT INTO `table 33` VALUES ('1C251EFFB416', '林成名', '35952', '销售', '0', '2847', '互联网板块-房产-华南区-华南区-佛山-佛山-销售一组-组员');
INSERT INTO `table 33` VALUES ('60814BC07B70', '曹彩霞', '32038', '销售', '0', '2847', '互联网板块-房产-华南区-华南区-佛山-佛山-销售一组-组员');
INSERT INTO `table 33` VALUES ('44DCC7994E05', '余美娟-停用', '528401', '销售', '0', '2847', '互联网板块-房产-华南区-华南区-佛山-佛山-销售一组-组员');
INSERT INTO `table 33` VALUES ('F3D9683A78F2', '余美娟-停用', '528402', '销售', '0', '2847', '互联网板块-房产-华南区-华南区-佛山-佛山-销售一组-组员');
INSERT INTO `table 33` VALUES ('A2B755970837', '陈旻', '50486', '销售', '0', '2847', '互联网板块-房产-华南区-华南区-佛山-佛山-销售一组-组员');
INSERT INTO `table 33` VALUES ('0C63F5277719', '梁文浩', '37223', '销售', '0', '2847', '互联网板块-房产-华南区-华南区-佛山-佛山-销售一组-组员');
INSERT INTO `table 33` VALUES ('27B00612CD64', '余碧', '38180', '销售', '0', '2847', '互联网板块-房产-华南区-华南区-佛山-佛山-销售一组-组员');
INSERT INTO `table 33` VALUES ('8703FC9CFE53', '施光强', '38108', '销售', '0', '2849', '互联网板块-房产-华南区-华南区-佛山-佛山-销售三组-组员');
INSERT INTO `table 33` VALUES ('44DCA89983C0', '余美娟', '52840', '销售', '0', '2849', '互联网板块-房产-华南区-华南区-佛山-佛山-销售三组-组员');
INSERT INTO `table 33` VALUES ('6E41C2D14BD9', '李求送', '38110', '销售', '0', '2853', '互联网板块-房产-华南区-华南区-中珠-中山-销售一组-组员');
INSERT INTO `table 33` VALUES ('4CA5224419E9', '梁靖怡', '50413', '销售', '0', '2853', '互联网板块-房产-华南区-华南区-中珠-中山-销售一组-组员');
INSERT INTO `table 33` VALUES ('C65EAF86A837', '成芳容', '52778', '销售', '0', '2853', '互联网板块-房产-华南区-华南区-中珠-中山-销售一组-组员');
INSERT INTO `table 33` VALUES ('D73A803EBC37', '谷政朝', '34838', '销售', '0', '2853', '互联网板块-房产-华南区-华南区-中珠-中山-销售一组-组员');
INSERT INTO `table 33` VALUES ('88183E1D9F60', '岑锦安', '50466', '销售', '0', '2853', '互联网板块-房产-华南区-华南区-中珠-中山-销售一组-组员');
INSERT INTO `table 33` VALUES ('CA866021B43D', '阙祖传', '35833', '销售', '0', '2853', '互联网板块-房产-华南区-华南区-中珠-中山-销售一组-组员');
INSERT INTO `table 33` VALUES ('CBF468DA3403', '郑丽丽', '56539', '销售', '0', '2853', '互联网板块-房产-华南区-华南区-中珠-中山-销售一组-组员');
INSERT INTO `table 33` VALUES ('4D64EDA2A6B4', '邱彦霖', '56633', '销售', '0', '2853', '互联网板块-房产-华南区-华南区-中珠-中山-销售一组-组员');
INSERT INTO `table 33` VALUES ('FB5089E84C08', '候梦怡', '38186', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `table 33` VALUES ('1EC1144D4A78', '李石秀', '38199', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `table 33` VALUES ('D4E0FEC956E9', '王思瑶', '37248', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `table 33` VALUES ('5FB3F32882D8', '陈喜杰', '35663', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `table 33` VALUES ('9986BE487261', '邓江渝', '38136', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `table 33` VALUES ('D14E6A390F9A', '申鹏', '35357', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `table 33` VALUES ('3154D2006C41', '荀洪丽', '35016', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `table 33` VALUES ('291553A37049', '杨渠艳', '54326', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `table 33` VALUES ('D9D5F1F3BA49', '刘长波', '38188', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `table 33` VALUES ('B80529BC13D3', '周高翔36895', '36895', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `table 33` VALUES ('202B210C08A7', '莫介析', '38298', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `table 33` VALUES ('202B4C911A25', '湛博坦', '50342', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `table 33` VALUES ('4A73438A9434', '王先荣', '37424', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `table 33` VALUES ('08FBED1310D7', '李玲55553', '55553', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `table 33` VALUES ('202B39B91D88', '丁国进', '38299', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `table 33` VALUES ('D3F6C4218698', '王钧', '56552', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `table 33` VALUES ('0AC3544AE152', '王晓乐', '38257', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `table 33` VALUES ('80E01164A092', '赵雄', '55645', '销售', '0', '2855', '互联网板块-房产-华南区-华南区-中珠-珠海-销售一组-组员');
INSERT INTO `table 33` VALUES ('4131ED781A24', '熊昌桐', '37433', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `table 33` VALUES ('6F58BE996CB6', '王蓉38311', '38311', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `table 33` VALUES ('6E753CEDD920', '黄远秀', '36748', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `table 33` VALUES ('40446D329871', '伍传连', '37434', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `table 33` VALUES ('1F21BFE24BE4', '李尚勇', '32257', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `table 33` VALUES ('4049D1ED1413', '董正玉', '37414', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `table 33` VALUES ('B18688275157', '刘丹34673', '34673', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `table 33` VALUES ('C6E00ADCE7C8', '何聪37003', '37003', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `table 33` VALUES ('D3925785CFF2', '段挺秀', '38417', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `table 33` VALUES ('A38A943B0097', '林子', '30565', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `table 33` VALUES ('0C53E4B7A560', '王小玲', '38435', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `table 33` VALUES ('2FDBCF0C8EB6', '丁小玲', '38448', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `table 33` VALUES ('BF565405BDC2', '成思', '38484', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `table 33` VALUES ('8BD217585988', '董雅文', '31824', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `table 33` VALUES ('9EA0E0E5E743', '张婉君', '32726', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `table 33` VALUES ('15265E7B62E0', '胡梁', '50548', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `table 33` VALUES ('D88089AC0A26', '殷乐凌', '50533', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `table 33` VALUES ('016E8E9E8429', '陈亮35361', '35361', '销售', '0', '2858', '互联网板块-房产-武汉-武汉-武汉-武汉-销售一组-组员');
INSERT INTO `table 33` VALUES ('4B03207ACA50', '李君35419', '35419', '销售', '0', '2875', '互联网板块-房产-长沙-长沙-长沙-长沙-销售一组-组员');
INSERT INTO `table 33` VALUES ('2A6BECECB01D', '詹婕', '35420', '销售', '0', '2875', '互联网板块-房产-长沙-长沙-长沙-长沙-销售一组-组员');
INSERT INTO `table 33` VALUES ('9F196EE4BA84', '龙柏桦36888', '36888', '销售', '0', '2875', '互联网板块-房产-长沙-长沙-长沙-长沙-销售一组-组员');
INSERT INTO `table 33` VALUES ('7016ADDFE670', '甘海涛', '34898', '销售', '0', '2875', '互联网板块-房产-长沙-长沙-长沙-长沙-销售一组-组员');
INSERT INTO `table 33` VALUES ('70BA52815091', '郭灿', '30541', '销售', '0', '2875', '互联网板块-房产-长沙-长沙-长沙-长沙-销售一组-组员');
INSERT INTO `table 33` VALUES ('771CDBB648D0', '黄雨轩', '34144', '销售', '0', '2875', '互联网板块-房产-长沙-长沙-长沙-长沙-销售一组-组员');
INSERT INTO `table 33` VALUES ('CD09D56BB1A8', '宁钦', '38419', '销售', '0', '2875', '互联网板块-房产-长沙-长沙-长沙-长沙-销售一组-组员');
INSERT INTO `table 33` VALUES ('50FAA7031F42', '黄秋娟', '51921', '销售', '0', '2875', '互联网板块-房产-长沙-长沙-长沙-长沙-销售一组-组员');
INSERT INTO `table 33` VALUES ('54ABC1DF0233', '李辰玉', '38381', '销售', '0', '2875', '互联网板块-房产-长沙-长沙-长沙-长沙-销售一组-组员');
INSERT INTO `table 33` VALUES ('153CAF740AD3', '杨坤51904', '51904', '销售', '0', '2875', '互联网板块-房产-长沙-长沙-长沙-长沙-销售一组-组员');
INSERT INTO `table 33` VALUES ('2E0C3357B3C4', '陈颖', '54207', '销售', '0', '2875', '互联网板块-房产-长沙-长沙-长沙-长沙-销售一组-组员');
INSERT INTO `table 33` VALUES ('2E0C3E91B940', '张梅', '54200', '销售', '0', '2875', '互联网板块-房产-长沙-长沙-长沙-长沙-销售一组-组员');
INSERT INTO `table 33` VALUES ('9F193A20E1C7', '陈柳36810', '36810', '销售', '0', '2875', '互联网板块-房产-长沙-长沙-长沙-长沙-销售一组-组员');
INSERT INTO `table 33` VALUES ('B4242621D3E3', '曹丹', '30485', '销售', '0', '2875', '互联网板块-房产-长沙-长沙-长沙-长沙-销售一组-组员');
INSERT INTO `table 33` VALUES ('BB32A3FFD42F', '薛叶果', '32322', '销售', '0', '2875', '互联网板块-房产-长沙-长沙-长沙-长沙-销售一组-组员');
INSERT INTO `table 33` VALUES ('9E276B27856F', '杨名高', '35738', '销售', '0', '2877', '互联网板块-房产-长沙-长沙-长沙-长沙-销售二组-组员');
INSERT INTO `table 33` VALUES ('A386B2058401', '王浩华', '30743', '销售', '0', '2877', '互联网板块-房产-长沙-长沙-长沙-长沙-销售二组-组员');
INSERT INTO `table 33` VALUES ('4246D96D3EA9', '黄智青', '38342', '销售', '0', '2877', '互联网板块-房产-长沙-长沙-长沙-长沙-销售二组-组员');
INSERT INTO `table 33` VALUES ('89A63C399681', '杨亮', '38391', '销售', '0', '2877', '互联网板块-房产-长沙-长沙-长沙-长沙-销售二组-组员');
INSERT INTO `table 33` VALUES ('4AD19082D3CD', '文慧梅', '30822', '销售', '0', '2877', '互联网板块-房产-长沙-长沙-长沙-长沙-销售二组-组员');
INSERT INTO `table 33` VALUES ('53C1E70957AA', '易居长沙', 'B9915', '销售', '0', '2877', '互联网板块-房产-长沙-长沙-长沙-长沙-销售二组-组员');
INSERT INTO `table 33` VALUES ('3E49A3F117A5', '罗安利33477', '33477', '销售', '0', '2877', '互联网板块-房产-长沙-长沙-长沙-长沙-销售二组-组员');
INSERT INTO `table 33` VALUES ('EFC7B4C56DC6', '汤晓雯', '36704', '销售', '0', '2877', '互联网板块-房产-长沙-长沙-长沙-长沙-销售二组-组员');
INSERT INTO `table 33` VALUES ('DD1563801AC5', '杨翔', '38343', '销售', '0', '2877', '互联网板块-房产-长沙-长沙-长沙-长沙-销售二组-组员');
INSERT INTO `table 33` VALUES ('A9688E441124', '夏青', '38404', '销售', '0', '2877', '互联网板块-房产-长沙-长沙-长沙-长沙-销售二组-组员');
INSERT INTO `table 33` VALUES ('4AC882E982B9', '罗安利', '30286', '销售', '0', '2877', '互联网板块-房产-长沙-长沙-长沙-长沙-销售二组-组员');
INSERT INTO `table 33` VALUES ('892B2980F3A6', '张婉', '51981', '销售', '0', '2877', '互联网板块-房产-长沙-长沙-长沙-长沙-销售二组-组员');
INSERT INTO `table 33` VALUES ('1B970C0A9FF6', '陈琦', '36417', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `table 33` VALUES ('B1055028EB75', '刘芳', '30287', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `table 33` VALUES ('2D8B0230B972', '赵征', '32571', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `table 33` VALUES ('CD0CC441BF15', '覃业精', '35875', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `table 33` VALUES ('89A65BAD4240', '刘文', '38394', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `table 33` VALUES ('D9AF3116EC38', '张宇婷', '51955', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `table 33` VALUES ('045A03C33E99', '刘鸣', '38423', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `table 33` VALUES ('25216D051937', '杨娇38407', '38407', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `table 33` VALUES ('153C61B79C67', '廖义龙', '38436', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `table 33` VALUES ('483285EDD156', '周文', '54210', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `table 33` VALUES ('51BB4EDBAD92', '刘霞玲', '32963', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `table 33` VALUES ('800E45478534', '罗健', '54225', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `table 33` VALUES ('800DFDC6AC20', '唐亚男', '54224', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `table 33` VALUES ('C0553195D5F3', '易婷', '54239', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `table 33` VALUES ('217482B74422', '周奕彤', '33125', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `table 33` VALUES ('CD0CB351F637', '熊芳', '34859', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `table 33` VALUES ('C0889A625D05', '李可娟', '54232', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `table 33` VALUES ('AC550BA43094', '夏冰', '54237', '销售', '0', '2879', '互联网板块-房产-长沙-长沙-长沙-长沙-销售三组-组员');
INSERT INTO `table 33` VALUES ('153C842A0108', '秦乐', '51905', '销售', '0', '2881', '互联网板块-房产-长沙-长沙-长沙-长沙-销售四组-组员');
INSERT INTO `table 33` VALUES ('CD09EB21B2D8', '周丽', '38420', '销售', '0', '2881', '互联网板块-房产-长沙-长沙-长沙-长沙-销售四组-组员');
INSERT INTO `table 33` VALUES ('89A61FA68F88', '刘旭东', '38397', '销售', '0', '2881', '互联网板块-房产-长沙-长沙-长沙-长沙-销售四组-组员');
INSERT INTO `table 33` VALUES ('90D4C6386B96', '赵钰', '51980', '销售', '0', '2881', '互联网板块-房产-长沙-长沙-长沙-长沙-销售四组-组员');
INSERT INTO `table 33` VALUES ('09E61FC4B9CC', '李毅波', '30893', '销售', '0', '2881', '互联网板块-房产-长沙-长沙-长沙-长沙-销售四组-组员');
INSERT INTO `table 33` VALUES ('800E01902894', '曾亮', '54215', '销售', '0', '2881', '互联网板块-房产-长沙-长沙-长沙-长沙-销售四组-组员');
INSERT INTO `table 33` VALUES ('14715DCA9342', '雷鑫', '38365', '销售', '0', '2881', '互联网板块-房产-长沙-长沙-长沙-长沙-销售四组-组员');
INSERT INTO `table 33` VALUES ('190FE23E4810', '谢文阳', '35971', '销售', '0', '2883', '互联网板块-房产-联合区-联合区-南昌-南昌-销售一组-组员');
INSERT INTO `table 33` VALUES ('A31A6F89B5B3', '曾小强', '38324', '销售', '0', '2883', '互联网板块-房产-联合区-联合区-南昌-南昌-销售一组-组员');
INSERT INTO `table 33` VALUES ('5CFDDEAE0351', '金扬', '38379', '销售', '0', '2883', '互联网板块-房产-联合区-联合区-南昌-南昌-销售一组-组员');
INSERT INTO `table 33` VALUES ('5CFDF7440010', '黄丽娜', '38387', '销售', '0', '2883', '互联网板块-房产-联合区-联合区-南昌-南昌-销售一组-组员');
INSERT INTO `table 33` VALUES ('720B15724172', '李星颖', '38392', '销售', '0', '2883', '互联网板块-房产-联合区-联合区-南昌-南昌-销售一组-组员');
INSERT INTO `table 33` VALUES ('190E07E48C12', '胡德真南', '35981', '销售', '0', '2883', '互联网板块-房产-联合区-联合区-南昌-南昌-销售一组-组员');
INSERT INTO `table 33` VALUES ('19101363F411', '涂娜娜', '35970', '销售', '0', '2883', '互联网板块-房产-联合区-联合区-南昌-南昌-销售一组-组员');
INSERT INTO `table 33` VALUES ('190F6193FFF1', '韩杨扬', '36094', '销售', '0', '2883', '互联网板块-房产-联合区-联合区-南昌-南昌-销售一组-组员');
INSERT INTO `table 33` VALUES ('26B3240F4B93', '杨有忠', '38314', '销售', '0', '2883', '互联网板块-房产-联合区-联合区-南昌-南昌-销售一组-组员');
INSERT INTO `table 33` VALUES ('26B3383F4A05', '丁龙', '51214', '销售', '0', '2883', '互联网板块-房产-联合区-联合区-南昌-南昌-销售一组-组员');
INSERT INTO `table 33` VALUES ('3408FA908A28', '孙艳彬', '35865', '销售', '0', '2883', '互联网板块-房产-联合区-联合区-南昌-南昌-销售一组-组员');
INSERT INTO `table 33` VALUES ('0CCCC141E6B4', '邹昕玲', '35972', '销售', '0', '2883', '互联网板块-房产-联合区-联合区-南昌-南昌-销售一组-组员');
INSERT INTO `table 33` VALUES ('A3B4E985DDFB', '何鑫35299', '35299', '销售', '0', '2885', '互联网板块-房产-南京-南京-南京-南京-销售一组-组员');
INSERT INTO `table 33` VALUES ('4.04802E+11', '吴佳男', '36367', '销售', '0', '2885', '互联网板块-房产-南京-南京-南京-南京-销售一组-组员');
INSERT INTO `table 33` VALUES ('D74DF21A8CAA', '姚耀', '34635', '销售', '0', '2885', '互联网板块-房产-南京-南京-南京-南京-销售一组-组员');
INSERT INTO `table 33` VALUES ('4D156204DB9A', '刘晓霞', '35212', '销售', '0', '2885', '互联网板块-房产-南京-南京-南京-南京-销售一组-组员');
INSERT INTO `table 33` VALUES ('8C109BBFA54A', '居婷婷', '34621', '销售', '0', '2885', '互联网板块-房产-南京-南京-南京-南京-销售一组-组员');
INSERT INTO `table 33` VALUES ('F61EAAB422B2', '江辰', '37127', '销售', '0', '2885', '互联网板块-房产-南京-南京-南京-南京-销售一组-组员');
INSERT INTO `table 33` VALUES ('F8104D87FF73', '石淑彦', '55456', '销售', '0', '2885', '互联网板块-房产-南京-南京-南京-南京-销售一组-组员');
INSERT INTO `table 33` VALUES ('F8102AE76D46', '张文枢', '55455', '销售', '0', '2885', '互联网板块-房产-南京-南京-南京-南京-销售一组-组员');
INSERT INTO `table 33` VALUES ('21CB45AB1C36', '陈亮宇', '37184', '销售', '0', '2885', '互联网板块-房产-南京-南京-南京-南京-销售一组-组员');
INSERT INTO `table 33` VALUES ('DF8BD4772020', '黄坤英', '39083', '销售', '0', '2885', '互联网板块-房产-南京-南京-南京-南京-销售一组-组员');
INSERT INTO `table 33` VALUES ('FBD9B2F2CE18', '李璇', '52880', '销售', '0', '2885', '互联网板块-房产-南京-南京-南京-南京-销售一组-组员');
INSERT INTO `table 33` VALUES ('4047D51C0E65', '糜年强', '34297', '销售', '0', '2885', '互联网板块-房产-南京-南京-南京-南京-销售一组-组员');
INSERT INTO `table 33` VALUES ('18BDBDD3AFE2', '沙泽宇', '55660', '销售', '0', '2885', '互联网板块-房产-南京-南京-南京-南京-销售一组-组员');
INSERT INTO `table 33` VALUES ('2FED99BE6CB1', '张罡翊', '39004', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `table 33` VALUES ('4C0EE5A520E3', '赵绍峰', '35300', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `table 33` VALUES ('831520040A1E', '刘佳', '32026', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `table 33` VALUES ('4D359588102C', '易居南京', 'B9909', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `table 33` VALUES ('33D7D8031B72', '郭剑', '51125', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `table 33` VALUES ('2FC4C9945F5F', '钱庆', '30573', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `table 33` VALUES ('575A51422BE7', '徐青青', '51152', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `table 33` VALUES ('04557D12DB56', '徐桐', '39090', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `table 33` VALUES ('9110312B3419', '赵远建', '55671', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `table 33` VALUES ('3C110F8A9C67', '王兴元55710', '55710', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `table 33` VALUES ('F2238AA86570', '张业君', '55700', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `table 33` VALUES ('6173F7E05000', '陈馨亚', '52914', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `table 33` VALUES ('820D983F4700', '王蕾34633', '34633', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `table 33` VALUES ('9135221EEFB3', '倪天明', '51177', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `table 33` VALUES ('98127EC8B877', '胡波', '39077', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `table 33` VALUES ('9DA7C65F6791', '杨育懿', '39050', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `table 33` VALUES ('A5B6132AEDB5', '李芯36929', '36929', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `table 33` VALUES ('3A247E3FB9E2', '陈园', '51134', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `table 33` VALUES ('01D620F21048', '朱孟园', '39087', '销售', '0', '2887', '互联网板块-房产-南京-南京-南京-南京-销售二组-组员');
INSERT INTO `table 33` VALUES ('961F3498300E', '孙博', '32747', '销售', '0', '2889', '互联网板块-房产-南京-南京-南京-南京-销售三组-组员');
INSERT INTO `table 33` VALUES ('281B956D6BB1', '文萍', '51110', '销售', '0', '2889', '互联网板块-房产-南京-南京-南京-南京-销售三组-组员');
INSERT INTO `table 33` VALUES ('E1111FB7D440', '郑静', '32187', '销售', '0', '2889', '互联网板块-房产-南京-南京-南京-南京-销售三组-组员');
INSERT INTO `table 33` VALUES ('D32BC16DCC93', '廖云', '55453', '销售', '0', '2889', '互联网板块-房产-南京-南京-南京-南京-销售三组-组员');
INSERT INTO `table 33` VALUES ('5C417689B876', '刘宏卫', '55667', '销售', '0', '2889', '互联网板块-房产-南京-南京-南京-南京-销售三组-组员');
INSERT INTO `table 33` VALUES ('5E5997534763', '周彦梅', '34634', '销售', '0', '2889', '互联网板块-房产-南京-南京-南京-南京-销售三组-组员');
INSERT INTO `table 33` VALUES ('761BFF051BC4', '丁奇', '35561', '销售', '0', '2889', '互联网板块-房产-南京-南京-南京-南京-销售三组-组员');
INSERT INTO `table 33` VALUES ('BD3D34792DB8', '杨露', '34522', '销售', '0', '2889', '互联网板块-房产-南京-南京-南京-南京-销售三组-组员');
INSERT INTO `table 33` VALUES ('D2F1DA72C765', '夏凡', '30373', '销售', '0', '2889', '互联网板块-房产-南京-南京-南京-南京-销售三组-组员');
INSERT INTO `table 33` VALUES ('ED2665B4A671', '张立37110', '37110', '销售', '0', '2889', '互联网板块-房产-南京-南京-南京-南京-销售三组-组员');
INSERT INTO `table 33` VALUES ('21F041C0A363', '郑敏', '30801', '销售', '0', '2889', '互联网板块-房产-南京-南京-南京-南京-销售三组-组员');
INSERT INTO `table 33` VALUES ('211E38206AB1', '张硕51176', '51176', '销售', '0', '2889', '互联网板块-房产-南京-南京-南京-南京-销售三组-组员');
INSERT INTO `table 33` VALUES ('211E2F199B79', '窦思远', '52875', '销售', '0', '2889', '互联网板块-房产-南京-南京-南京-南京-销售三组-组员');
INSERT INTO `table 33` VALUES ('1561CFB7CF5B', '王旭', '31489', '销售', '0', '2889', '互联网板块-房产-南京-南京-南京-南京-销售三组-组员');
INSERT INTO `table 33` VALUES ('A352F1B732E5', '陈劲宇', '32715', '销售', '0', '2889', '互联网板块-房产-南京-南京-南京-南京-销售三组-组员');
INSERT INTO `table 33` VALUES ('89E4518FFDF0', '李智39030', '39030', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `table 33` VALUES ('9DA8097D85E5', '金帆璐', '39051', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `table 33` VALUES ('0455B87F3667', '段盼盼', '39091', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `table 33` VALUES ('33D7F2A53058', '庄呈', '51126', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `table 33` VALUES ('7C46604968D5', '徐佳佳', '39024', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `table 33` VALUES ('49E65045E596', '许慧', '55665', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `table 33` VALUES ('ADDF94978C85', '潘若颖', '52947', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `table 33` VALUES ('4E09A4986722', '窦思清', '52908', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `table 33` VALUES ('A368FF7BD0F2', '田月', '55677', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `table 33` VALUES ('160C752C1250', '张骏', '55707', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `table 33` VALUES ('B8732A9A6653', '佘思思', '55688', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `table 33` VALUES ('DDEED5DE4675', '邹恩福39078', '39078', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `table 33` VALUES ('0104B135D619', '张俊', '55691', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `table 33` VALUES ('9290EEA65C03', '马进', '52943', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `table 33` VALUES ('B4C3C9036A92', '朱挚卿', '52852', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `table 33` VALUES ('BAACCD83D705', '陈靖', '39063', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `table 33` VALUES ('404506BAB848', '孙文静', '37420', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `table 33` VALUES ('281BAB080C89', '杨青青', '51109', '销售', '0', '2891', '互联网板块-房产-南京-南京-南京-南京-销售四组-组员');
INSERT INTO `table 33` VALUES ('55183659CAD4', '赵雪', '39013', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `table 33` VALUES ('08F3F9B64285', '张帆55654', '55654', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `table 33` VALUES ('B13CFF6C17B3', '徐浩军', '30484', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `table 33` VALUES ('F81021A88862', '吴新叶', '55454', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `table 33` VALUES ('18BDC4C269C6', '刘晨昱', '33283', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `table 33` VALUES ('2F78D2CACA00', '袁爱霞', '55662', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `table 33` VALUES ('904BE6967140', '谢迎东', '38922', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `table 33` VALUES ('9110291072B9', '夏天', '55673', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `table 33` VALUES ('18BDB7CAB276', '夏孝升', '55659', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `table 33` VALUES ('160C6BD1D670', '陆夕', '55702', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `table 33` VALUES ('6FE878C46AB4', '费晓翔', '55668', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `table 33` VALUES ('A5A15C348394', '王兴元', '38935', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `table 33` VALUES ('36E5BD3F8204', '金叶丹', '37372', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `table 33` VALUES ('04559C94C766', '杭婷', '39089', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `table 33` VALUES ('022A4975D491', '刘佳34631', '34631', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `table 33` VALUES ('2FEDCB71BFD9', '叶军', '39005', '销售', '0', '2893', '互联网板块-房产-南京-南京-南京-南京-销售五组-组员');
INSERT INTO `table 33` VALUES ('25AF1704A964', '王超', '31784', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `table 33` VALUES ('998B1709FFC2', '徐秀程', '38931', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `table 33` VALUES ('A980A0478DE4', '王敏36940', '36940', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `table 33` VALUES ('A98088380A33', '石海丽36939', '36939', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `table 33` VALUES ('A09EBE574F64', '余伯前', '36892', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `table 33` VALUES ('207B28603D92', '陆一翔', '31420', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `table 33` VALUES ('440773DCA15D', '史雯雯', '30886', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `table 33` VALUES ('E69FEE9C946A', '侯永平', '31875', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `table 33` VALUES ('9C4A0A1E6EC6', '沈珉蕙', '32025', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `table 33` VALUES ('E656C05221AE', '易居无锡', 'B9913', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `table 33` VALUES ('48E390C10187', '陈丽花', '30885', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `table 33` VALUES ('E79FF79565A2', '李杨33450', '33450', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `table 33` VALUES ('2965BCA9AE35', '唐敏', '51127', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `table 33` VALUES ('F62B31C66C79', '倪露', '38963', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `table 33` VALUES ('AE0F3054DBF7', '季言梁', '55959', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `table 33` VALUES ('B65C59C77035', '钱坤', '52856', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `table 33` VALUES ('66A66825C1C6', '仲明', '55964', '销售', '0', '2895', '互联网板块-房产-无锡-无锡-无锡-无锡-销售一组-组员');
INSERT INTO `table 33` VALUES ('3593D800A40C', '胡楚琳', '32245', '销售', '0', '2897', '互联网板块-房产-无锡-无锡-无锡-无锡-销售二组-组员');
INSERT INTO `table 33` VALUES ('16A2EB600087', '任童霏', '39097', '销售', '0', '2897', '互联网板块-房产-无锡-无锡-无锡-无锡-销售二组-组员');
INSERT INTO `table 33` VALUES ('3ECDA75D0A61', '陶阳洋', '37373', '销售', '0', '2897', '互联网板块-房产-无锡-无锡-无锡-无锡-销售二组-组员');
INSERT INTO `table 33` VALUES ('4E42CE837EE8', '李祥光', '51150', '销售', '0', '2897', '互联网板块-房产-无锡-无锡-无锡-无锡-销售二组-组员');
INSERT INTO `table 33` VALUES ('7C22F768DD96', '侯维文', '51169', '销售', '0', '2897', '互联网板块-房产-无锡-无锡-无锡-无锡-销售二组-组员');
INSERT INTO `table 33` VALUES ('8EF162E9E170', '叶一飞', '51120', '销售', '0', '2897', '互联网板块-房产-无锡-无锡-无锡-无锡-销售二组-组员');
INSERT INTO `table 33` VALUES ('95B188C43848', '陈雯湘39041', '39041', '销售', '0', '2897', '互联网板块-房产-无锡-无锡-无锡-无锡-销售二组-组员');
INSERT INTO `table 33` VALUES ('BE3D8B6F03E6', '赵锋', '52870', '销售', '0', '2897', '互联网板块-房产-无锡-无锡-无锡-无锡-销售二组-组员');
INSERT INTO `table 33` VALUES ('98182F5C1B25', '曾喆', '51186', '销售', '0', '2897', '互联网板块-房产-无锡-无锡-无锡-无锡-销售二组-组员');
INSERT INTO `table 33` VALUES ('14213EBBD644', '陆宏伟', '39099', '销售', '0', '2897', '互联网板块-房产-无锡-无锡-无锡-无锡-销售二组-组员');
INSERT INTO `table 33` VALUES ('877D7DEA4A98', '徐宏军', '36842', '销售', '0', '2897', '互联网板块-房产-无锡-无锡-无锡-无锡-销售二组-组员');
INSERT INTO `table 33` VALUES ('A7646EB07817', '胡韵', '55957', '销售', '0', '2897', '互联网板块-房产-无锡-无锡-无锡-无锡-销售二组-组员');
INSERT INTO `table 33` VALUES ('10FE592007D3', '杨琳菡', '52891', '销售', '0', '2897', '互联网板块-房产-无锡-无锡-无锡-无锡-销售二组-组员');
INSERT INTO `table 33` VALUES ('DD6981696EA3', '孔令韦', '55962', '销售', '0', '2897', '互联网板块-房产-无锡-无锡-无锡-无锡-销售二组-组员');
INSERT INTO `table 33` VALUES ('F1CB712EF879', '任虹', '33854', '销售', '0', '2899', '互联网板块-房产-无锡-无锡-无锡-无锡-销售三组-组员');
INSERT INTO `table 33` VALUES ('A98044505260', '陈思嘉36937', '36937', '销售', '0', '2899', '互联网板块-房产-无锡-无锡-无锡-无锡-销售三组-组员');
INSERT INTO `table 33` VALUES ('7C22DF772C42', '潘杰', '51168', '销售', '0', '2899', '互联网板块-房产-无锡-无锡-无锡-无锡-销售三组-组员');
INSERT INTO `table 33` VALUES ('16A2D54E0254', '杨鹏远', '39098', '销售', '0', '2899', '互联网板块-房产-无锡-无锡-无锡-无锡-销售三组-组员');
INSERT INTO `table 33` VALUES ('7CB94BD8C657', '陈世杰', '39027', '销售', '0', '2899', '互联网板块-房产-无锡-无锡-无锡-无锡-销售三组-组员');
INSERT INTO `table 33` VALUES ('A9806BA959C3', '范碧莹36938', '36938', '销售', '0', '2899', '互联网板块-房产-无锡-无锡-无锡-无锡-销售三组-组员');
INSERT INTO `table 33` VALUES ('92A6699664F9', '尤骏', '52934', '销售', '0', '2899', '互联网板块-房产-无锡-无锡-无锡-无锡-销售三组-组员');
INSERT INTO `table 33` VALUES ('71E11B6A3B46', '董俊森', '51160', '销售', '0', '2899', '互联网板块-房产-无锡-无锡-无锡-无锡-销售三组-组员');
INSERT INTO `table 33` VALUES ('5C2F640D8622', '施海峰', '55954', '销售', '0', '2899', '互联网板块-房产-无锡-无锡-无锡-无锡-销售三组-组员');
INSERT INTO `table 33` VALUES ('A764798AA7A5', '季梦婷', '55958', '销售', '0', '2899', '互联网板块-房产-无锡-无锡-无锡-无锡-销售三组-组员');
INSERT INTO `table 33` VALUES ('4E42BA3AEF11', '朱理进', '51148', '销售', '0', '2899', '互联网板块-房产-无锡-无锡-无锡-无锡-销售三组-组员');
INSERT INTO `table 33` VALUES ('DD0F2A2994E4', '陈金伟', '55961', '销售', '0', '2899', '互联网板块-房产-无锡-无锡-无锡-无锡-销售三组-组员');
INSERT INTO `table 33` VALUES ('CCE5D33BDEC2', '杨坤民', '38947', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `table 33` VALUES ('4C09A02DF7E0', '韦泱', '38901', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `table 33` VALUES ('92E7B85E0122', '徐一凯', '34564', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `table 33` VALUES ('59BB1C967472', '任心一', '32551', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `table 33` VALUES ('244472EBF711', '张磊32527', '32527', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `table 33` VALUES ('46E5A66F94DE', '易居常州', 'B9914', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `table 33` VALUES ('155F5C59AE9B', '康飞', '30969', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `table 33` VALUES ('D7AA8222FD21', '赵海萍', '39067', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `table 33` VALUES ('092267E75022', '薛冠华', '52885', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `table 33` VALUES ('7E2653826D7F', '肖栋', '32920', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `table 33` VALUES ('2CF789BD75F4', '李飞55472', '55472', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `table 33` VALUES ('4052E89B8299', '李莉55477', '55477', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `table 33` VALUES ('7EBFA0B45DD2', '黄程', '51166', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `table 33` VALUES ('12383215858F', '薛园', '33489', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `table 33` VALUES ('3AEF8A11DA56', '史羽孜', '55523', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `table 33` VALUES ('497C8F10DAF5', '施杨', '55480', '销售', '0', '2901', '互联网板块-房产-东部区-锡常-常州-常州-销售一组-组员');
INSERT INTO `table 33` VALUES ('417BCA5E1C07', '吴莹', '37418', '销售', '0', '2903', '互联网板块-房产-东部区-锡常-常州-常州-销售二组-组员');
INSERT INTO `table 33` VALUES ('8EC486C34184', '路磊', '39031', '销售', '0', '2903', '互联网板块-房产-东部区-锡常-常州-常州-销售二组-组员');
INSERT INTO `table 33` VALUES ('6456E9ECBA7E', '吴震', '32919', '销售', '0', '2903', '互联网板块-房产-东部区-锡常-常州-常州-销售二组-组员');
INSERT INTO `table 33` VALUES ('182F0879F453', '王孜', '51100', '销售', '0', '2903', '互联网板块-房产-东部区-锡常-常州-常州-销售二组-组员');
INSERT INTO `table 33` VALUES ('182F1D4FBA41', '安木丛', '51101', '销售', '0', '2903', '互联网板块-房产-东部区-锡常-常州-常州-销售二组-组员');
INSERT INTO `table 33` VALUES ('743CADB07276', '倪蓓蓓', '52922', '销售', '0', '2903', '互联网板块-房产-东部区-锡常-常州-常州-销售二组-组员');
INSERT INTO `table 33` VALUES ('77D710AEFF72', '谈鑫峰', '52927', '销售', '0', '2903', '互联网板块-房产-东部区-锡常-常州-常州-销售二组-组员');
INSERT INTO `table 33` VALUES ('395B6D671829', '严惠', '37394', '销售', '0', '2903', '互联网板块-房产-东部区-锡常-常州-常州-销售二组-组员');
INSERT INTO `table 33` VALUES ('9A667A42C217', '陈烨', '51185', '销售', '0', '2903', '互联网板块-房产-东部区-锡常-常州-常州-销售二组-组员');
INSERT INTO `table 33` VALUES ('6C04FC090342', '吴乐', '52918', '销售', '0', '2903', '互联网板块-房产-东部区-锡常-常州-常州-销售二组-组员');
INSERT INTO `table 33` VALUES ('3171B63B1FA6', '丁强', '55520', '销售', '0', '2903', '互联网板块-房产-东部区-锡常-常州-常州-销售二组-组员');
INSERT INTO `table 33` VALUES ('ADBA7E049E97', '王齐雅', '38938', '销售', '0', '2905', '互联网板块-房产-东部区-锡常-常州-常州-销售三组-组员');
INSERT INTO `table 33` VALUES ('3A9465BAD724', '徐友文', '51136', '销售', '0', '2905', '互联网板块-房产-东部区-锡常-常州-常州-销售三组-组员');
INSERT INTO `table 33` VALUES ('8EC4A70B1C98', '顾博崴', '39029', '销售', '0', '2905', '互联网板块-房产-东部区-锡常-常州-常州-销售三组-组员');
INSERT INTO `table 33` VALUES ('9A5686314C49', '陈一', '51171', '销售', '0', '2905', '互联网板块-房产-东部区-锡常-常州-常州-销售三组-组员');
INSERT INTO `table 33` VALUES ('BBB120B13278', '仲进萍', '52851', '销售', '0', '2905', '互联网板块-房产-东部区-锡常-常州-常州-销售三组-组员');
INSERT INTO `table 33` VALUES ('0FFF12CECAC8', '金伟', '52889', '销售', '0', '2905', '互联网板块-房产-东部区-锡常-常州-常州-销售三组-组员');
INSERT INTO `table 33` VALUES ('8A63BCAF7FB5', '周锋52936', '52936', '销售', '0', '2905', '互联网板块-房产-东部区-锡常-常州-常州-销售三组-组员');
INSERT INTO `table 33` VALUES ('C5FBC1A17F65', '胡明刚', '55450', '销售', '0', '2905', '互联网板块-房产-东部区-锡常-常州-常州-销售三组-组员');
INSERT INTO `table 33` VALUES ('D6F067147839', '李坚', '55499', '销售', '0', '2905', '互联网板块-房产-东部区-锡常-常州-常州-销售三组-组员');
INSERT INTO `table 33` VALUES ('3171BBD58319', '潘震宇', '55521', '销售', '0', '2905', '互联网板块-房产-东部区-锡常-常州-常州-销售三组-组员');
INSERT INTO `table 33` VALUES ('E778381942C6', '裴冬冬37036', '37036', '销售', '0', '2907', '互联网板块-房产-苏南区-苏南-南通-南通-销售一组-组员');
INSERT INTO `table 33` VALUES ('E7788421E2C1', '胡新星37038', '37038', '销售', '0', '2907', '互联网板块-房产-苏南区-苏南-南通-南通-销售一组-组员');
INSERT INTO `table 33` VALUES ('E778C2A880E4', '缪迎春37065', '37065', '销售', '0', '2907', '互联网板块-房产-苏南区-苏南-南通-南通-销售一组-组员');
INSERT INTO `table 33` VALUES ('A3FDDDE56FC5', '孙国强', '51763', '销售', '0', '2907', '互联网板块-房产-苏南区-苏南-南通-南通-销售一组-组员');
INSERT INTO `table 33` VALUES ('C894F764E5D7', '欧捷', '54854', '销售', '0', '2907', '互联网板块-房产-苏南区-苏南-南通-南通-销售一组-组员');
INSERT INTO `table 33` VALUES ('2DBEC2375BC1', '宋瑶', '37047', '销售', '0', '2907', '互联网板块-房产-苏南区-苏南-南通-南通-销售一组-组员');
INSERT INTO `table 33` VALUES ('6E1F080D8340', '王海剑', '38974', '销售', '0', '2907', '互联网板块-房产-苏南区-苏南-南通-南通-销售一组-组员');
INSERT INTO `table 33` VALUES ('3151C6EFEEE7', '曹雯雯', '39691', '销售', '0', '2907', '互联网板块-房产-苏南区-苏南-南通-南通-销售一组-组员');
INSERT INTO `table 33` VALUES ('E7780ECB7A31', '吴伟37035', '37035', '销售', '0', '2907', '互联网板块-房产-苏南区-苏南-南通-南通-销售一组-组员');
INSERT INTO `table 33` VALUES ('2C2B9062DF11', '王旭光', '37066', '销售', '0', '2909', '互联网板块-房产-合肥-合肥-合肥-合肥-销售一组-组员');
INSERT INTO `table 33` VALUES ('9039C764A166', '钱燕', '35265', '销售', '0', '2909', '互联网板块-房产-合肥-合肥-合肥-合肥-销售一组-组员');
INSERT INTO `table 33` VALUES ('390EC62F1B31', '夏志远', '34658', '销售', '0', '2909', '互联网板块-房产-合肥-合肥-合肥-合肥-销售一组-组员');
INSERT INTO `table 33` VALUES ('373400816F49', '李光', '37329', '销售', '0', '2909', '互联网板块-房产-合肥-合肥-合肥-合肥-销售一组-组员');
INSERT INTO `table 33` VALUES ('BCE24F074044', '杨森52017', '52017', '销售', '0', '2909', '互联网板块-房产-合肥-合肥-合肥-合肥-销售一组-组员');
INSERT INTO `table 33` VALUES ('B74F3B8A0B10', '梅烁', '52031', '销售', '0', '2909', '互联网板块-房产-合肥-合肥-合肥-合肥-销售一组-组员');
INSERT INTO `table 33` VALUES ('5.58E+10', '张申欣', '52053', '销售', '0', '2909', '互联网板块-房产-合肥-合肥-合肥-合肥-销售一组-组员');
INSERT INTO `table 33` VALUES ('3F80AEC136D5', '杨简', '52021', '销售', '0', '2909', '互联网板块-房产-合肥-合肥-合肥-合肥-销售一组-组员');
INSERT INTO `table 33` VALUES ('374720540ECE', '李娟f5712', '35712', '销售', '0', '2909', '互联网板块-房产-合肥-合肥-合肥-合肥-销售一组-组员');
INSERT INTO `table 33` VALUES ('9042694ED718', '盛茜', '38930', '销售', '0', '2909', '互联网板块-房产-合肥-合肥-合肥-合肥-销售一组-组员');
INSERT INTO `table 33` VALUES ('EF93A99893E6', '程吉义', '52071', '销售', '0', '2909', '互联网板块-房产-合肥-合肥-合肥-合肥-销售一组-组员');
INSERT INTO `table 33` VALUES ('373C28E96209', '王静52046', '52046', '销售', '0', '2909', '互联网板块-房产-合肥-合肥-合肥-合肥-销售一组-组员');
INSERT INTO `table 33` VALUES ('799F583B6E96', '范世婷', '52008', '销售', '0', '2909', '互联网板块-房产-合肥-合肥-合肥-合肥-销售一组-组员');
INSERT INTO `table 33` VALUES ('459D9211ADFD', '杜新超', '35919', '销售', '0', '2911', '互联网板块-房产-东部区-芜湖-芜湖-芜湖-销售一组-组员');
INSERT INTO `table 33` VALUES ('10D26CB21284', '陈新', '36397', '销售', '0', '2911', '互联网板块-房产-东部区-芜湖-芜湖-芜湖-销售一组-组员');
INSERT INTO `table 33` VALUES ('F837AFC010E0', '蔡罕', '34730', '销售', '0', '2911', '互联网板块-房产-东部区-芜湖-芜湖-芜湖-销售一组-组员');
INSERT INTO `table 33` VALUES ('08CD28E84007', '王亚玲', '35893', '销售', '0', '2911', '互联网板块-房产-东部区-芜湖-芜湖-芜湖-销售一组-组员');
INSERT INTO `table 33` VALUES ('DDEECBB6B0B6', '章成', '34814', '销售', '0', '2911', '互联网板块-房产-东部区-芜湖-芜湖-芜湖-销售一组-组员');
INSERT INTO `table 33` VALUES ('30786E1F99FA', '徐伏海', '33275', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('71C1BAEC3CA9', '王璐瑶', '39475', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('DBB88CA4FA83', '龚丽雄', '31808', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('BC723D498007', '赵李宁', '34513', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('A45A895ED2C7', '陈芋竹', '39418', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('41F5E6254350', '廖红', '34996', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('349388FAAAFF', '王冉', '34930', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('A94CCC381B66', '龙洋', '39492', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('CD05B5BDDA33', '罗刚', '51503', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('EFA158A9D569', '陈炎莹', '39439', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('647F7BC9FED4', '谢育恒', '54051', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('10B65727A6B3', '范佳', '36308', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('BF810F4C2014', '李霞', '51583', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('5FFFBEE473F7', '杨嘉', '32948', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('E9803A955E34', '邓巧媚', '54006', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('3F5BAF49E5F9', '许楠', '55378', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('001A503CA001', '杨行', '54021', '销售', '0', '2915', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('A7D361A964E4', '宋亚军', '34177', '销售', '0', '2917', '互联网板块-房产-东部区-芜湖-芜湖-黄山-销售组-组员');
INSERT INTO `table 33` VALUES ('B3D511E5641F', '黄晓芳', '31662', '销售', '0', '2917', '互联网板块-房产-东部区-芜湖-芜湖-黄山-销售组-组员');
INSERT INTO `table 33` VALUES ('459D9211ADFD', '杜新超', '35919', '销售', '0', '2917', '互联网板块-房产-东部区-芜湖-芜湖-黄山-销售组-组员');
INSERT INTO `table 33` VALUES ('15D373D47C32', '罗方', '39457', '销售', '0', '2926', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('8DDCF0178070', '王执', '39487', '销售', '0', '2926', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('A9DCE6C3A803', '丁朵36922', '36922', '销售', '0', '2926', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('ABEE31EA68F5', '罗丽苹', '39423', '销售', '0', '2926', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('C34A6E671C1F', '刘力', '35421', '销售', '0', '2926', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('7D554D98D877', '苟吉玲', '39410', '销售', '0', '2926', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('1BA085542729', '吴春梅', '35702', '销售', '0', '2926', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('51C3894C2070', '李雪55364', '55364', '销售', '0', '2926', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('07FF01C8FCA4', '吴蔚', '54024', '销售', '0', '2926', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('5E99421B5A37', '栗宇超', '55384', '销售', '0', '2926', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('F736F3E9A861', '鲜红', '39432', '销售', '0', '2926', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('3EA9D9F20759', '杨茜', '39465', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('CDF40EE38F99', '石博', '32309', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('8C883AAD0CA9', '李星雨', '39485', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('4F84A3386D02', '王珏51537', '51537', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('E9803F471071', '程小娇', '54007', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('3BD47660D242', '张瀚', '51530', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('647F80CD41B6', '张程通', '54051', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('647F99B43A92', '朱川', '54049', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('F73639E3BC42', '汤绍谦', '39442', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('C3F35CDF3439', '魏茜', '34560', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('17AB60E7B266', '杨彬', '33274', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('F6E994AD01B0', '徐元仪', '54094', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('07FF1739FFD4', '王可珂', '54022', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('5E98F2C64A91', '张婷', '51535', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('0A78BA387E85', '华晓鹏', '55357', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('2754BE30F925', '夏宇', '55441', '销售', '0', '2935', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('5B79D8346F95', '杨千里', '34466', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `table 33` VALUES ('58EFF9CBF751', '杨珊珊', '39550', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `table 33` VALUES ('0E651A596C60', '周懋', '31741', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `table 33` VALUES ('903F0CDE68F1', '罗丹', '39515', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `table 33` VALUES ('65311D2F0749', '江俊', '39505', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `table 33` VALUES ('6.39E+72', '李晶', '31194', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `table 33` VALUES ('8737E6B6075F', '周妮拉', '31084', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `table 33` VALUES ('4C50E619065B', '张翔', '32788', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `table 33` VALUES ('F4BB90DC3D4A', '罗颖', '36033', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `table 33` VALUES ('B13E152E04F8', '王翠', '39581', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `table 33` VALUES ('1FEE81638C02', '王玲51693', '51693', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `table 33` VALUES ('D962247B42B7', '朱凌杞', '54819', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `table 33` VALUES ('F6AE49508DF4', '刁磊', '30856', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `table 33` VALUES ('2730ADD75419', '李畅', '54837', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `table 33` VALUES ('ECBD7DA7A4E4', '胡兴玲32065', '32065', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `table 33` VALUES ('8FF6E03EE103', '辛美庆', '54128', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `table 33` VALUES ('911F5E767F07', '洪亮', '51654', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `table 33` VALUES ('ECBDEEABEAE9', '宋大海37083', '37083', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `table 33` VALUES ('C266FC41A915', '刘晓静', '30821', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `table 33` VALUES ('BCCD281638D7', '范鹏', '54791', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `table 33` VALUES ('D88BEC1489A4', '田娥', '39264', '销售', '0', '2938', '互联网板块-房产-重庆-重庆-重庆-重庆-销售一组-组员');
INSERT INTO `table 33` VALUES ('06A4DD3612CF', '肖雄', '32129', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('77B3C430F324', '蒋瑜', '30838', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('853E3E97B8D9', '张杨', '31817', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('B3EFB3D3CE99', '邢莞毓', '31720', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('25CFDD2FD093', '荆豪亮', '37206', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('A2B7968B6855', '周珂', '39419', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('CD05799DD5B7', '王烈伟', '39495', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('3BD408A45F96', '何琪', '51524', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('3BD44B0D5367', '廖洪玲', '51525', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('7D54BF5892F4', '罗蓓', '51549', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('7D54FC89E728', '许俊', '51553', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('7D5511324C26', '余婷', '51554', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('BF80987EFF59', '陈荣', '51576', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('D5AD22292F01', '王洪', '51596', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('D5ADC4B0E664', '陈涛', '51598', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('D5AE3D444F30', '田鹏', '51597', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('1AB6D91D7300', '赵霆雨', '54027', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('7D54D3773AE3', '米成君', '51550', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('24E366901B36', '唐国娟', '54034', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('647F8A6A2308', '何翔', '54044', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('16B66DD549A7', '罗伟', '54026', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('0AD277EA895E', '刘斯年', '35947', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('5087B85CC307', '田兴华', '54038', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('B75041596AC1', '刘军54085', '54085', '销售', '0', '2940', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('2848FAD8BF9D', '王兴峰', '33886', '销售', '0', '2942', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `table 33` VALUES ('0A78A77E3066', '余伟', '55356', '销售', '0', '2942', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `table 33` VALUES ('912ED12D64F1', '谢竞', '54076', '销售', '0', '2942', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `table 33` VALUES ('0A0A221DE640', '张庆', '55426', '销售', '0', '2942', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `table 33` VALUES ('DA4AAAE2EACB', '任小龙', '34973', '销售', '0', '2944', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('7C93427B8BA6', '陈阳39476', '39476', '销售', '0', '2944', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('B933AAB3DDE0', '马力榆', '39498', '销售', '0', '2944', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('5A5297DA5603', '李杰34049', '34049', '销售', '0', '2944', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('A0F19FD03866', '李晨曦', '51545', '销售', '0', '2944', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('D5AEBA50E783', '王小梅', '51599', '销售', '0', '2944', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('003E99588327', '徐秋林', '54018', '销售', '0', '2944', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('1451D2470C32', '苏家冉', '31665', '销售', '0', '2944', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('7D5538614243', '陈立', '51559', '销售', '0', '2944', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('27EE7873BDB9', '魏能', '51518', '销售', '0', '2944', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('509EB7CD332B', '徐辉', '35196', '销售', '0', '2946', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `table 33` VALUES ('7C938524E652', '周军', '39477', '销售', '0', '2946', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `table 33` VALUES ('FC4221779685', '张应超', '54014', '销售', '0', '2946', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `table 33` VALUES ('1AB6F46DD330', '庞洪', '54030', '销售', '0', '2946', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `table 33` VALUES ('7D54E7E7B364', '吴芃梅', '51552', '销售', '0', '2946', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `table 33` VALUES ('09175F754201', '蒋永婷', '36262', '销售', '0', '2946', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `table 33` VALUES ('B6BF60CEA383', '杨洪', '32947', '销售', '0', '2946', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `table 33` VALUES ('4A802611CCF3', '明小圣', '39401', '销售', '0', '2946', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `table 33` VALUES ('0A0A2DE36FD7', '冯镓', '55430', '销售', '0', '2946', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `table 33` VALUES ('A1A222C995F0', '王璐36558', '36558', '销售', '0', '2948', '互联网板块-房产-重庆-重庆-重庆-重庆');
INSERT INTO `table 33` VALUES ('45766139C14E', '李翔', '34464', '销售', '0', '2948', '互联网板块-房产-重庆-重庆-重庆-重庆');
INSERT INTO `table 33` VALUES ('AE94B2F83EBB', '袁斌', '33455', '销售', '0', '2948', '互联网板块-房产-重庆-重庆-重庆-重庆');
INSERT INTO `table 33` VALUES ('C80AAC9B696E', '杨婧', '33678', '销售', '0', '2948', '互联网板块-房产-重庆-重庆-重庆-重庆');
INSERT INTO `table 33` VALUES ('CD8691044679', '何沁燕', '34463', '销售', '0', '2948', '互联网板块-房产-重庆-重庆-重庆-重庆');
INSERT INTO `table 33` VALUES ('B0ADC2846706', '刘毅', '34465', '销售', '0', '2948', '互联网板块-房产-重庆-重庆-重庆-重庆');
INSERT INTO `table 33` VALUES ('478511EF5F95', '葛念', '32673', '销售', '0', '2948', '互联网板块-房产-重庆-重庆-重庆-重庆');
INSERT INTO `table 33` VALUES ('4F0B69697E48', '陈文静', '30786', '销售', '0', '2948', '互联网板块-房产-重庆-重庆-重庆-重庆');
INSERT INTO `table 33` VALUES ('9D27D68EA236', '黄娜', '32303', '销售', '0', '2950', '互联网板块-房产-重庆-重庆-重庆-重庆');
INSERT INTO `table 33` VALUES ('2998DB0F1DB8', '潘欣', '31786', '销售', '0', '2950', '互联网板块-房产-重庆-重庆-重庆-重庆');
INSERT INTO `table 33` VALUES ('B71FC597CB8B', '赵妍', '31228', '销售', '0', '2950', '互联网板块-房产-重庆-重庆-重庆-重庆');
INSERT INTO `table 33` VALUES ('D4F2F270D6D1', '姜军', '30252', '销售', '0', '2950', '互联网板块-房产-重庆-重庆-重庆-重庆');
INSERT INTO `table 33` VALUES ('01EA7A645F57', '崔霞39536', '39536', '销售', '0', '2950', '互联网板块-房产-重庆-重庆-重庆-重庆');
INSERT INTO `table 33` VALUES ('33A9B718173C', '彭胜昔', '30321', '销售', '0', '2950', '互联网板块-房产-重庆-重庆-重庆-重庆');
INSERT INTO `table 33` VALUES ('DB5FA940F460', '古金玉', '51685', '销售', '0', '2952', '互联网板块-房产-重庆-重庆-重庆-重庆-销售二组-组员');
INSERT INTO `table 33` VALUES ('00AA99342E59', '王卓秋', '30858', '销售', '0', '2953', '互联网板块-房产-重庆-重庆-重庆-重庆-销售二组-组员');
INSERT INTO `table 33` VALUES ('CCE3C296B3F7', '杨易', '37293', '销售', '0', '2953', '互联网板块-房产-重庆-重庆-重庆-重庆-销售二组-组员');
INSERT INTO `table 33` VALUES ('2935A2D91C70', '唐昆', '51623', '销售', '0', '2953', '互联网板块-房产-重庆-重庆-重庆-重庆-销售二组-组员');
INSERT INTO `table 33` VALUES ('34BB663C3935', '张扬', '54841', '销售', '0', '2953', '互联网板块-房产-重庆-重庆-重庆-重庆-销售二组-组员');
INSERT INTO `table 33` VALUES ('130BC0327453', '李雪峰32500', '32500', '销售', '0', '2953', '互联网板块-房产-重庆-重庆-重庆-重庆-销售二组-组员');
INSERT INTO `table 33` VALUES ('31D6FDADBBE8', '张丽35709', '35709', '销售', '0', '2953', '互联网板块-房产-重庆-重庆-重庆-重庆-销售二组-组员');
INSERT INTO `table 33` VALUES ('D96228B73D26', '雷华娟', '36238', '销售', '0', '2953', '互联网板块-房产-重庆-重庆-重庆-重庆-销售二组-组员');
INSERT INTO `table 33` VALUES ('D961B0C3BBB0', '殷浩然', '54808', '销售', '0', '2953', '互联网板块-房产-重庆-重庆-重庆-重庆-销售二组-组员');
INSERT INTO `table 33` VALUES ('7B4CB8A60BA2', '黄章印', '39559', '销售', '0', '2953', '互联网板块-房产-重庆-重庆-重庆-重庆-销售二组-组员');
INSERT INTO `table 33` VALUES ('ED7F59DAD522', '万利娟', '31226', '销售', '0', '2962', '互联网板块-房产-重庆-重庆-重庆-重庆-销售三组-组员');
INSERT INTO `table 33` VALUES ('6C6ABAD743C8', '冉茜', '54115', '销售', '0', '2962', '互联网板块-房产-重庆-重庆-重庆-重庆-销售三组-组员');
INSERT INTO `table 33` VALUES ('0E8E2603881B', '包伟', '35220', '销售', '0', '2962', '互联网板块-房产-重庆-重庆-重庆-重庆-销售三组-组员');
INSERT INTO `table 33` VALUES ('6374303BD332', '杨姝', '39500', '销售', '0', '2962', '互联网板块-房产-重庆-重庆-重庆-重庆-销售三组-组员');
INSERT INTO `table 33` VALUES ('71C33D658418', '黄展', '39555', '销售', '0', '2962', '互联网板块-房产-重庆-重庆-重庆-重庆-销售三组-组员');
INSERT INTO `table 33` VALUES ('C9523C0D14F3', '李红', '38336', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `table 33` VALUES ('2D14BD07CE62', '宫婷', '33250', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `table 33` VALUES ('FBB45E1B63C9', '周全', '32530', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `table 33` VALUES ('B809D62637B8', '张冷蓓', '32144', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `table 33` VALUES ('B3DDC0D3B56D', '张媛', '32668', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `table 33` VALUES ('99B605867451', '王琴', '31501', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `table 33` VALUES ('C61650CAD777', '肖屹洲', '31007', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `table 33` VALUES ('DDC26B6E774E', '卜慧君', '30298', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `table 33` VALUES ('5AFFED248444', '卜慧君32807', '32807', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `table 33` VALUES ('BB9E964353B7', '王帅', '38410', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `table 33` VALUES ('DF4A532BC122', '王超38427', '38427', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `table 33` VALUES ('07FCD4984292', '董玉强', '50538', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `table 33` VALUES ('2CF774F03083', '文舒', '50549', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `table 33` VALUES ('FF5576D39E81', '王晶睛', '38455', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `table 33` VALUES ('2FE2EE2BC236', '祝捷', '32670', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `table 33` VALUES ('D2B0C7736517', '陈睿', '31202', '销售', '0', '2964', '互联网板块-房产-武汉-武汉-武汉-武汉-销售四组-组员');
INSERT INTO `table 33` VALUES ('05837B48DFDB', '肖挺', '36045', '销售', '0', '2966', '互联网板块-房产-武汉-武汉-武汉-武汉-销售五组（停）-组员');
INSERT INTO `table 33` VALUES ('371F008B7BC0', '何大晶', '36560', '销售', '0', '2966', '互联网板块-房产-武汉-武汉-武汉-武汉-销售五组（停）-组员');
INSERT INTO `table 33` VALUES ('1D6320857CDC', '杨文娟', '33677', '销售', '0', '2966', '互联网板块-房产-武汉-武汉-武汉-武汉-销售五组（停）-组员');
INSERT INTO `table 33` VALUES ('6F5D27A87B44', '郭雯', '38308', '销售', '0', '2968', '互联网板块-房产-武汉-武汉-武汉-武汉-销售六组（停）-组员');
INSERT INTO `table 33` VALUES ('F76EDA006781', '张艳星', '38345', '销售', '0', '2968', '互联网板块-房产-武汉-武汉-武汉-武汉-销售六组（停）-组员');
INSERT INTO `table 33` VALUES ('CE35FFEE00D6', '张辉', '38496', '销售', '0', '2968', '互联网板块-房产-武汉-武汉-武汉-武汉-销售六组（停）-组员');
INSERT INTO `table 33` VALUES ('3840C24B6125', '罗磊', '37367', '销售', '0', '2970', '互联网板块-房产-武汉-武汉-武汉-武汉-销售七组-组员');
INSERT INTO `table 33` VALUES ('737D1E8F3599', '陈宁', '38393', '销售', '0', '2970', '互联网板块-房产-武汉-武汉-武汉-武汉-销售七组-组员');
INSERT INTO `table 33` VALUES ('AA974D4E3821', '付章?', '38482', '销售', '0', '2970', '互联网板块-房产-武汉-武汉-武汉-武汉-销售七组-组员');
INSERT INTO `table 33` VALUES ('D61D12A543B4', '秦莎菲', '38495', '销售', '0', '2970', '互联网板块-房产-武汉-武汉-武汉-武汉-销售七组-组员');
INSERT INTO `table 33` VALUES ('4F84098915B8', '徐崇文', '38469', '销售', '0', '2970', '互联网板块-房产-武汉-武汉-武汉-武汉-销售七组-组员');
INSERT INTO `table 33` VALUES ('E33342925F55', '赵颖', '50500', '销售', '0', '2970', '互联网板块-房产-武汉-武汉-武汉-武汉-销售七组-组员');
INSERT INTO `table 33` VALUES ('E4B9B92ADF38', '陈仁', '36044', '销售', '0', '2970', '互联网板块-房产-武汉-武汉-武汉-武汉-销售七组-组员');
INSERT INTO `table 33` VALUES ('6886C9BB8A73', '孙黎', '31699', '销售', '0', '2970', '互联网板块-房产-武汉-武汉-武汉-武汉-销售七组-组员');
INSERT INTO `table 33` VALUES ('E64D276F6186', '文珣', '38348', '销售', '0', '2971', '互联网板块-房产-武汉-武汉-武汉-武汉-销售五组-组员');
INSERT INTO `table 33` VALUES ('9A58F7383FC0', '王璐', '38474', '销售', '0', '2971', '互联网板块-房产-武汉-武汉-武汉-武汉-销售五组-组员');
INSERT INTO `table 33` VALUES ('D61D12A543B4', '秦莎菲', '38495', '销售', '0', '2971', '互联网板块-房产-武汉-武汉-武汉-武汉-销售五组-组员');
INSERT INTO `table 33` VALUES ('E3334B1819F7', '凌媛', '50501', '销售', '0', '2971', '互联网板块-房产-武汉-武汉-武汉-武汉-销售五组-组员');
INSERT INTO `table 33` VALUES ('0BDBA525864D', '冉超', '33219', '销售', '0', '2971', '互联网板块-房产-武汉-武汉-武汉-武汉-销售五组-组员');
INSERT INTO `table 33` VALUES ('8223CB2D84A6', '高晶', '32865', '销售', '0', '2971', '互联网板块-房产-武汉-武汉-武汉-武汉-销售五组-组员');
INSERT INTO `table 33` VALUES ('6C3BFE7F38C8', '贺微', '50516', '销售', '0', '2971', '互联网板块-房产-武汉-武汉-武汉-武汉-销售五组-组员');
INSERT INTO `table 33` VALUES ('AE9269310C2C', '易丹', '32062', '销售', '0', '2971', '互联网板块-房产-武汉-武汉-武汉-武汉-销售五组-组员');
INSERT INTO `table 33` VALUES ('7964434680ED', '杨光', '31134', '销售', '0', '2971', '互联网板块-房产-武汉-武汉-武汉-武汉-销售五组-组员');
INSERT INTO `table 33` VALUES ('CCE34C557DB3', '路燕', '31962', '销售', '0', '2971', '互联网板块-房产-武汉-武汉-武汉-武汉-销售五组-组员');
INSERT INTO `table 33` VALUES ('5E92F3645BF1', '丁峥嵘', '31273', '销售', '0', '2975', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售二组-组员');
INSERT INTO `table 33` VALUES ('4268B2B551AB', '汪青青', '30968', '销售', '0', '2975', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售二组-组员');
INSERT INTO `table 33` VALUES ('D0C4B0D99DD6', '吴晨雷', '53509', '销售', '0', '2975', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售二组-组员');
INSERT INTO `table 33` VALUES ('A957B58879A4', '朱能浩', '39660', '销售', '0', '2975', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售二组-组员');
INSERT INTO `table 33` VALUES ('9643EB594781', '华夏', '35023', '销售', '0', '2975', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售二组-组员');
INSERT INTO `table 33` VALUES ('8CE66F1CF0EA', '赵丹', '32722', '销售', '0', '2975', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售二组-组员');
INSERT INTO `table 33` VALUES ('91316BE42088', '仇正冬', '51764', '销售', '0', '2975', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售二组-组员');
INSERT INTO `table 33` VALUES ('77DC8A9D02C5', '周智', '36774', '销售', '0', '2975', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售二组-组员');
INSERT INTO `table 33` VALUES ('192A603AD0A8', '华国梁', '53565', '销售', '0', '2975', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售二组-组员');
INSERT INTO `table 33` VALUES ('C29AB94F035F', '吴玲君', '31155', '销售', '0', '2975', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售二组-组员');
INSERT INTO `table 33` VALUES ('398A25A9AEB7', '周威', '31088', '销售', '0', '2975', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售二组-组员');
INSERT INTO `table 33` VALUES ('62E79D898048', '赵晓阳', '35486', '销售', '0', '2983', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售一组-组员');
INSERT INTO `table 33` VALUES ('0559122CA044', '刘顺鹏', '35696', '销售', '0', '2983', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售一组-组员');
INSERT INTO `table 33` VALUES ('CEACADA94DA6', '蔡东宇', '35488', '销售', '0', '2983', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售一组-组员');
INSERT INTO `table 33` VALUES ('97078D19C910', '郭建龙', '36797', '销售', '0', '2983', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售一组-组员');
INSERT INTO `table 33` VALUES ('AA2ABD05E146', '张林兴', '53254', '销售', '0', '2983', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售一组-组员');
INSERT INTO `table 33` VALUES ('06959778DB18', '杜建章', '53289', '销售', '0', '2983', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售一组-组员');
INSERT INTO `table 33` VALUES ('BDD92D948A61', '许媛', '32453', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `table 33` VALUES ('0617F4A67103', '臧海', '35634', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `table 33` VALUES ('4D117362B308', '王晶晶33044', '33044', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `table 33` VALUES ('7F1935C2114D', '王海波', 'W1012', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `table 33` VALUES ('1FC513EC7E27', '刘芸', '32439', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `table 33` VALUES ('63D1EB757A48', '张雯璐', '33048', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `table 33` VALUES ('2C9AF1CBDA3C', '王萍', '32451', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `table 33` VALUES ('0DE804267D9A', '宋彦', '32456', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `table 33` VALUES ('D70393A03C64', '王明坤', '32463', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `table 33` VALUES ('0C31FA17D4F1', '邢媛', '30740', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `table 33` VALUES ('7F0F71E61971', '杨杨', '32449', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `table 33` VALUES ('18EE3F10A186', '王亚波', '38824', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `table 33` VALUES ('D3A872EF606E', '李达', '32812', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `table 33` VALUES ('5D0066DCC273', '杨佳艺', '38848', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `table 33` VALUES ('5722986DD278', '张岩', '50980', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `table 33` VALUES ('25273B731D84', '卢恒', '32450', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `table 33` VALUES ('88055F4C2624', '王海波32474', '32474', '销售', '0', '2986', '互联网板块-房产-北方区-北方-北京-北京-销售二部1组-组员');
INSERT INTO `table 33` VALUES ('555B564CB075', '王小磊', '32406', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `table 33` VALUES ('0717C952DFDC', '张跃31947', '31947', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `table 33` VALUES ('29FC443A3D62', '张羽泽', '33415', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `table 33` VALUES ('26AD4BBD3F33', '孔倩', '30322', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `table 33` VALUES ('BFFDF19596FE', '李刚', 'W1017', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `table 33` VALUES ('89E4B622ACB9', '姜丹', 'W1005', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `table 33` VALUES ('3BC9B1CFED40', '廉础宁', '32445', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `table 33` VALUES ('628F34B15B64', '牛国平', '32437', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `table 33` VALUES ('04140A866CE7', '宋爽', '31621', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `table 33` VALUES ('5BDDA361E5FA', '李睿娜', '32452', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `table 33` VALUES ('C8879FDE50D6', '沈彪', '30735', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `table 33` VALUES ('CDD95EA73DD8', '北京商拓', 'B9702', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `table 33` VALUES ('E5FBF7E707BA', '郭从谏', '31643', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `table 33` VALUES ('904D36E9E508', '王辉', '32434', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `table 33` VALUES ('827D58EA94C9', '石秀兵', '32438', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `table 33` VALUES ('8702B3687636', '南宝玲32470', '32470', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `table 33` VALUES ('8BFAE8F145D0', '韩峰', '30043', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `table 33` VALUES ('08024BCF45F0', '李作', '32448', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `table 33` VALUES ('13748242A406', '杨皓月', '32435', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `table 33` VALUES ('E48625ABB14E', '曹爱民', '30498', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `table 33` VALUES ('637F1160CC5A', '刘艾', '32076', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `table 33` VALUES ('E6AA49AF8D5D', '张秋瑾', '32436', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `table 33` VALUES ('8777BDAAC8EC', '刘艳英', '32464', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `table 33` VALUES ('06177BE7AAD6', '朱宇', '32402', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `table 33` VALUES ('6E14AA0B5138', '丰宝超', '39855', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `table 33` VALUES ('9F685F151191', '李金强', '32457', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `table 33` VALUES ('056295DBEE20', '谭钠丹', '37319', '销售', '0', '2988', '互联网板块-房产-北方区-北方-北京-北京-销售二部2组-组员');
INSERT INTO `table 33` VALUES ('E65031A11659', '万晴', '38781', '销售', '0', '2993', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `table 33` VALUES ('54114A2F04F3', '金剑锋', '38711', '销售', '0', '2993', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `table 33` VALUES ('FB38E7970E50', '林丹', '30955', '销售', '0', '2993', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `table 33` VALUES ('3280626DD6E7', '苟敏菲', '31414', '销售', '0', '2993', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `table 33` VALUES ('234C8159B475', '王瑛浔', '36926', '销售', '0', '2993', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `table 33` VALUES ('7A3752969533', '曹丽丽', '31390', '销售', '0', '2993', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `table 33` VALUES ('F791A3A14F52', '张卉', '36681', '销售', '0', '2993', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `table 33` VALUES ('C7A0E57C2511', '常琦', '36565', '销售', '0', '2993', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `table 33` VALUES ('E6500A474328', '桂玲', '38780', '销售', '0', '2993', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `table 33` VALUES ('C76F25077F71', '徐际涵', '50760', '销售', '0', '2993', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `table 33` VALUES ('483269312EC6', '杜楠', '50848', '销售', '0', '2993', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `table 33` VALUES ('C76ECF6DCF87', '温彪', '50758', '销售', '0', '2993', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `table 33` VALUES ('A6F9A3D0275F', '邹志环', '35886', '销售', '0', '2993', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `table 33` VALUES ('D6C9890DF6C9', '王雪', '50880', '销售', '0', '2993', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `table 33` VALUES ('FF9F3E1AC6A8', '卢正君', '50886', '销售', '0', '2993', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `table 33` VALUES ('EF9F5CCE21F1', '刘雅丽', '38772', '销售', '0', '2995', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `table 33` VALUES ('EF9FD2BC59D5', '管苏诘', '33213', '销售', '0', '2995', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `table 33` VALUES ('DF3F2D1549DD', '杜鹏飞', '31123', '销售', '0', '2995', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `table 33` VALUES ('2F48B34D70F8', '赵淑平34726', '34726', '销售', '0', '2995', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `table 33` VALUES ('5D10DDC9CE1B', '周騄俊', '32524', '销售', '0', '2995', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `table 33` VALUES ('CF43133377B2', '胡新楠', '33168', '销售', '0', '2995', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `table 33` VALUES ('C296B339FB81', '测试帐号', 'F0000-测试', '销售', '0', '2995', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `table 33` VALUES ('E32844418927', '吕梦靥', '30949', '销售', '0', '2995', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `table 33` VALUES ('30D4B6AACA15', '孙娴', '50845', '销售', '0', '2995', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `table 33` VALUES ('59A7FA669559', '申姣姣', '50853', '销售', '0', '2995', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `table 33` VALUES ('3D842E2D67C6', '金丹', '60244', '销售', '0', '2995', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `table 33` VALUES ('5BA4DAC51F98', '庄炜樱', '38717', '销售', '0', '2995', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `table 33` VALUES ('CC255FA22559', '殷瑛', '32982', '销售', '0', '2995', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `table 33` VALUES ('7F9604201211', '王泽青', '50857', '销售', '0', '2995', '互联网板块-房产-上海-上海-上海-上海-销售一部-组员');
INSERT INTO `table 33` VALUES ('8AE3EFB2E963', '李菊玲', '30946', '销售', '0', '2997', '互联网板块-房产-上海-上海-上海-上海-销售一部3组（停用）-组员');
INSERT INTO `table 33` VALUES ('02D8E365432D', '姜依萌', '30960', '销售', '0', '2997', '互联网板块-房产-上海-上海-上海-上海-销售一部3组（停用）-组员');
INSERT INTO `table 33` VALUES ('81D474EA9500', '施炜', '38737', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('6373C6858841', '陈震', '35215', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('4534EA29EBA8', '孙可仰', '33242', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('FE73FAE450E0', '李明峰', '31270', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('C6773F2273FD', '路荣华', '31575', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('053548A44C54', '李慧洁', '32775', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('254D5603BD51', '胡翌飞', '31269', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('620E5FA4EE01', '符晨晨', '32916', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('2558E543D849', '董俊', '38798', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('81D3F42E6B71', '后玲', '38725', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('9143A3BCA257', '徐俊', '50809', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('63186C81DD64', '陈婉菲', '50803', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('3CD9AB627B88', '陈勇', '50790', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('54085291D8C2', '陈剑秋', '50852', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('CDB1257526D9', '王晴波', '50876', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('41969174B3A9', '李娜37416', '37416', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('3CC733050AA0', '冯子安', '50765', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('AFF99DBA9375', '刘冬敏', '39748', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('FA03685B0E27', '陈腾飞', '38773', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('4293C9C81868', '钱凤', '37316', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('650A1E2CE305', '张静懿', '38715', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('F7918DC15E64', '高玉贵', '37126', '销售', '0', '3000', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('C1D299AC09F7', '蒋一辰', '31958', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('4519134445CB', '殷雅薇', '31974', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('59594FEFA2BA', '姜敏', '31780', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('0214ADFA769F', '王汉徵', '30944', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('59D03722C7BC', '赵敏', '30948', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('3A781B960148', '易居上海', 'B9908', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('B11332FE31E1', '陆晓松', '30963', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('D4C14142C2AE', '郭常林', '31602', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('22CCC8926752', '江一然', '30959', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('0430D80FA8A6', '毛玫琳', '50761', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('281C477EE914', '陈教亮', '39783', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('E43F37CB48DB', '罗龙', '50866', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('9E0D6B2E32A0', '崔国力', '50871', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('1B95E2855F15', '姜辰明', '50834', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('3D3CD65719C9', '袁麟', '37195', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('5256EB96CB71', '郑羡于', '38701', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('D2E9A5F7652C', '袁杰', '31804', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('B2573B83C3E6', '王伟伟', '39722', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('FA01CB603A44', '陈曼', '38783', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('FA0108ACB945', '耿俪姣', '38763', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('BA023C3CB2B2', '戴玮', '50728', '销售', '0', '3004', '互联网板块-房产-上海-上海-上海-上海-销售二部-组员');
INSERT INTO `table 33` VALUES ('0C31648AB4D4', '刘云鹏', '38734', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('72666D343738', '胡黎', '31029', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('998731A871C3', '李正洁', '30952', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('D5AC9D99065A', '葛岚', '30950', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('2E984507A06A', '杨柳', '30951', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('6E5BD2032751', '倪娜38700', '38700', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('8FEA42C415B2', '陆春燕', '32716', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('647F668AD1F6', '费雯丽', '50703', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('A30E24722167', '葛彩云', '50872', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('A8D505A65F96', '李玉楠', '50823', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('DFEA6865755D', '茅一欣', '30954', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('9ADB000B6613', '王丽清', '50736', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('9ADBAC157156', '赵法巍', '50740', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('A8D50ED22706', '陆方清', '50800', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('A3DA112098C4', '李书平', '33350', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('FF9F4D1404C8', '徐亚辉', '50897', '销售', '0', '3007', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('5F4ADD501408', '孙一梦', '39714', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('22A3082D5882', '马艺瑄', '39782', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('6C4EB1020407', '叶海燕', '50717', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('042FFB4EE395', '殷亚利', '50767', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('1696B694BC13', '蒋竺君', '50772', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('742F65D964F4', '陈滔', '31603', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('6E59D47AA276', '姜甄侃', '50891', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('294F6D998029', '袁华亮', '39792', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('647F7462E116', '王星城', '50795', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('C80346D59294', '朱敏杰', '38764', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('6EE1CAE5E141', '杨艳', '50782', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('EF2F6EEF2F33', '杨婷', '32594', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('ADA687659E26', '赵永嗣', '33243', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('26EE2008A209', '沈吉媛', '53905', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('FF556E632C84', '徐影50899', '50899', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('DD663512CE92', '秦溢文', '37080', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('ADF08FB2C7C3', '侯如艳', '50770', '销售', '0', '3009', '互联网板块-房产-上海-上海-上海-上海-销售三部-组员');
INSERT INTO `table 33` VALUES ('D1AB671224A9', '杨伊宁', '31601', '销售', '0', '3011', '互联网板块-房产-上海-上海-上海-上海-销售三部3组（停用）-组员');
INSERT INTO `table 33` VALUES ('9B8C56EC447E', '魏大朋', '34655', '销售', '0', '3013', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售一组-组员');
INSERT INTO `table 33` VALUES ('A2B5290BB495', '徐洁38752', '38752', '销售', '0', '3013', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售一组-组员');
INSERT INTO `table 33` VALUES ('2B5F1D8F7667', '范阳阳', '36516', '销售', '0', '3013', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售一组-组员');
INSERT INTO `table 33` VALUES ('7BA488AFB782', '周鹏', '36775', '销售', '0', '3013', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售一组-组员');
INSERT INTO `table 33` VALUES ('FF4DCF5ED048', '潘勇钢', '37145', '销售', '0', '3013', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售一组-组员');
INSERT INTO `table 33` VALUES ('CD15C8B2FA98', '周云佳', '39764', '销售', '0', '3013', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售一组-组员');
INSERT INTO `table 33` VALUES ('69FE840FB547', '罗杰', '51749', '销售', '0', '3013', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售一组-组员');
INSERT INTO `table 33` VALUES ('44F7A7199B34', '李煦泉', '51729', '销售', '0', '3013', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售一组-组员');
INSERT INTO `table 33` VALUES ('226D7A727342', '王琳琳', '53543', '销售', '0', '3013', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售一组-组员');
INSERT INTO `table 33` VALUES ('DB43030167F4', '孙鹏', '54855', '销售', '0', '3013', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售一组-组员');
INSERT INTO `table 33` VALUES ('BA714ED20A39', '王文', '51708', '销售', '0', '3013', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售一组-组员');
INSERT INTO `table 33` VALUES ('0FD5FD5B0DB0', '刘海博', '54868', '销售', '0', '3013', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售一组-组员');
INSERT INTO `table 33` VALUES ('E5412174DE64', '徐海荣', '54938', '销售', '0', '3013', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售一组-组员');
INSERT INTO `table 33` VALUES ('2B6CA5246C55', '卜阳', '54879', '销售', '0', '3013', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售一组-组员');
INSERT INTO `table 33` VALUES ('1BC721B39CB5', '潘扬扬', '35409', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `table 33` VALUES ('6E40606AAC53', '刘沫含', '38837', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `table 33` VALUES ('03CF727C03D0', '李蕾', '53138', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `table 33` VALUES ('68B820B4B2A8', '张浩39850', '39850', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `table 33` VALUES ('68B97E9F5E20', '姜桐', '39849', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `table 33` VALUES ('26B7D10DDF41', '张菲', '50959', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `table 33` VALUES ('6E3E99262295', '杨扬', '38836', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `table 33` VALUES ('166319E9221C', '李征', '35408', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `table 33` VALUES ('03CF5EE80394', '蒋春华', '53137', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `table 33` VALUES ('27CB4BA85627', '陈智', '53177', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `table 33` VALUES ('71DF149F0559', '李伟51048', '51048', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `table 33` VALUES ('814ADC3A6AF8', '李超53232', '53232', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `table 33` VALUES ('35F86AD37036', '宣艳丽', '53281', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `table 33` VALUES ('41A24A5EADE6', '李明', '55166', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `table 33` VALUES ('41A250BBEA77', '王星龙', '55164', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `table 33` VALUES ('67C2E03FE1D0', '姜旭', '55176', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `table 33` VALUES ('C992A133C682', '梁涛', '55241', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `table 33` VALUES ('D74A119E86A7', '高超', '52696', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `table 33` VALUES ('160C5A5E8CB1', '王荣', '55284', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `table 33` VALUES ('41A256B43609', '刘璐雨', '55165', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `table 33` VALUES ('44EB4E8F7409', '尹士臣', '50987', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `table 33` VALUES ('44EB64BB7214', '郝雷', '50973', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `table 33` VALUES ('4BBD4A6F17D3', '朱静50994', '50994', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `table 33` VALUES ('814A937BBCF5', '李斌', '53238', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `table 33` VALUES ('411246657FE7', '何杰', '32458', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `table 33` VALUES ('2934F1C88BE4', '可佳', '35859', '销售', '0', '3015', '互联网板块-房产-北方区-北方-唐山-唐山-销售组-组员');
INSERT INTO `table 33` VALUES ('347F36381810', '刘晶', '30791', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `table 33` VALUES ('5421C6CC7631', '刘燕', '30913', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `table 33` VALUES ('E66AF7BE9A5D', '常杰', '30846', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `table 33` VALUES ('BE475FC7C4F5', '韩金', '33598', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `table 33` VALUES ('1A5F15429D6B', '张晓丹', '31344', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `table 33` VALUES ('C5F2DD5FA217', '李国强', '32650', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `table 33` VALUES ('71C909350127', '龚建辉', '30075', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `table 33` VALUES ('766148DBA3ED', '李秀玲', '30789', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `table 33` VALUES ('99FEC90860B2', '刘翠', '30083', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `table 33` VALUES ('DF7BE55332BE', '从林', '31651', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `table 33` VALUES ('D691A88D4866', '完颜先锋', '30076', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `table 33` VALUES ('96BE4CFF05C6', '李立舫', '32581', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `table 33` VALUES ('9BCC85C19F20', '裴禹龙', '30908', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `table 33` VALUES ('B372993BDA02', '邢杰', '32554', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `table 33` VALUES ('CFFEAFB43AC6', '林雷', '35248', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `table 33` VALUES ('A5B5FB050065', '张超37925', '37925', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `table 33` VALUES ('5F49CE94A451', '刘佳37983', '37983', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `table 33` VALUES ('44AE0825D391', '满育妃', '38082', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `table 33` VALUES ('881C692E76D7', '曹娉', '50215', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `table 33` VALUES ('981939C4A8C7', '陈昆', '50220', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `table 33` VALUES ('1BCF66F0A761', '靳凯', '50298', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `table 33` VALUES ('9863EF1677E7', '李昕', '36813', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `table 33` VALUES ('9D7D5AEB6C23', '刘洺妤', '35352', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `table 33` VALUES ('D61F0E2D10B2', '刘燕宁', '30814', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `table 33` VALUES ('05D913E735D0', '张培青', '38029', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `table 33` VALUES ('E916708F97A4', '刘佳37952', '37952', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `table 33` VALUES ('B55EFABA9C61', '王冠', '32205', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `table 33` VALUES ('05D900C0BC59', '王亮', '38028', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `table 33` VALUES ('EA37F1B57A9B', '李心如', '30844', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `table 33` VALUES ('D0D860400002', '孙兼善', '50261', '销售', '0', '3017', '互联网板块-房产-华北区-华北区-天津-天津-销售一组-组员');
INSERT INTO `table 33` VALUES ('FE7D52DFF943', '徐惠慧', '31713', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('11AF251371CF', '董晶婕', '32510', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('DB49B34C4844', '李智', '30237', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('89FD456A0EE0', '段谟洪', '30057', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('6C78F274F98C', '魏立佳', '30097', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('711458C6B979', '焦柳鸣', '30101', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('BE1463C6FACE', '姚莉莉', '30792', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('4F9E2A9126D2', '曾蕊', '30815', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('F8AA44E18F8C', '石媛媛', '32221', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('A1D1BAE0C66E', '马爽', '30850', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('0091E2DCCA58', '石雨辰', '35825', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('05361A90340D', '罗思源', '30543', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('17A4EACC2445', '张欣', '50294', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('440A31BBF064', '张羽', '36541', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('E9164922C200', '刘鹏', '37954', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('F1036695B3C0', '王启明37958', '37958', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('4B8C13E75F30', '张鑫龙', '38075', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('69FF6E5ACF51', '冯楠', '50207', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('BD0E8909F355', '李梦龙', '50241', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('69FF587D7311', '凌洪宇', '50206', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('C7718437BC40', '李怡婷', '50253', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('EACD237D3437', '汤南杉', '50278', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('600FC219BDD0', '李靖赟', '53620', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('B08EC5252847', '曹凤津', '56671', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('EE44F0C0C890', '吕金炎', '56693', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('EE44F57DECC1', '王岩', '56683', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('8ECD3B760594', '闫靖', '37996', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('C7716DF0D164', '周利杨', '50255', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('EE44E9E5FCD1', '宋坤', '56691', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('08E518C07E95', '李正也', '37125', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('5EF2AD50AB57', '张磊53688', '53688', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('E81B82809CB3', '宋景然', '30848', '销售', '0', '3019', '互联网板块-房产-华北区-华北区-天津-天津-销售二组-组员');
INSERT INTO `table 33` VALUES ('EEEFF851AD53', '闫佳庆', '30911', '销售', '0', '3025', '互联网板块-房产-华北区-华北区-天津-天津-销售五组-组员');
INSERT INTO `table 33` VALUES ('F2232B0BEBF1', '赵志虹', '36590', '销售', '0', '3033', '互联网板块-房产-北方区-北方-太原-太原-销售一组-组员');
INSERT INTO `table 33` VALUES ('3DBBE24BBC64', '阎涛', '36579', '销售', '0', '3033', '互联网板块-房产-北方区-北方-太原-太原-销售一组-组员');
INSERT INTO `table 33` VALUES ('11DB0653BC57', '方炜', '37964', '销售', '0', '3033', '互联网板块-房产-北方区-北方-太原-太原-销售一组-组员');
INSERT INTO `table 33` VALUES ('D628C04390E2', '李洁', '38016', '销售', '0', '3033', '互联网板块-房产-北方区-北方-太原-太原-销售一组-组员');
INSERT INTO `table 33` VALUES ('8137B5ECE7D6', '路瑞健', '55178', '销售', '0', '3033', '互联网板块-房产-北方区-北方-太原-太原-销售一组-组员');
INSERT INTO `table 33` VALUES ('9F7F5A101049', '赵丹55216', '55216', '销售', '0', '3033', '互联网板块-房产-北方区-北方-太原-太原-销售一组-组员');
INSERT INTO `table 33` VALUES ('E0223683B2E3', '周志敏', '55239', '销售', '0', '3033', '互联网板块-房产-北方区-北方-太原-太原-销售一组-组员');
INSERT INTO `table 33` VALUES ('FB618920A325', '杨磊', '55273', '销售', '0', '3033', '互联网板块-房产-北方区-北方-太原-太原-销售一组-组员');
INSERT INTO `table 33` VALUES ('3DBB9F44F162', '周毅', '36578', '销售', '0', '3033', '互联网板块-房产-北方区-北方-太原-太原-销售一组-组员');
INSERT INTO `table 33` VALUES ('41B890FF599F', '艾莲', '31339', '销售', '0', '3035', '互联网板块-房产-华北区-华北区-济南-济南-销售一组-组员');
INSERT INTO `table 33` VALUES ('F60B6DE15E06', '王鹏37921', '37921', '销售', '0', '3035', '互联网板块-房产-华北区-华北区-济南-济南-销售一组-组员');
INSERT INTO `table 33` VALUES ('B81B055CD4CD', '崔晓明', '34386', '销售', '0', '3035', '互联网板块-房产-华北区-华北区-济南-济南-销售一组-组员');
INSERT INTO `table 33` VALUES ('70163255B630', '林鹤薇', '35582', '销售', '0', '3035', '互联网板块-房产-华北区-华北区-济南-济南-销售一组-组员');
INSERT INTO `table 33` VALUES ('64A8843424CA', '郑勇山', '33206', '销售', '0', '3035', '互联网板块-房产-华北区-华北区-济南-济南-销售一组-组员');
INSERT INTO `table 33` VALUES ('3A89CA5B45FA', '唐堂', '31010', '销售', '0', '3035', '互联网板块-房产-华北区-华北区-济南-济南-销售一组-组员');
INSERT INTO `table 33` VALUES ('732D65807138', '郝东宁', '31261', '销售', '0', '3035', '互联网板块-房产-华北区-华北区-济南-济南-销售一组-组员');
INSERT INTO `table 33` VALUES ('49D31E61B507', '李志浩', '53678', '销售', '0', '3035', '互联网板块-房产-华北区-华北区-济南-济南-销售一组-组员');
INSERT INTO `table 33` VALUES ('B82C7AC1B6E3', '刘芳50214', '50214', '销售', '0', '3035', '互联网板块-房产-华北区-华北区-济南-济南-销售一组-组员');
INSERT INTO `table 33` VALUES ('295959FCE2FD', '张晶晶', '34385', '销售', '0', '3035', '互联网板块-房产-华北区-华北区-济南-济南-销售一组-组员');
INSERT INTO `table 33` VALUES ('5886E150C793', '刘子钰', '38077', '销售', '0', '3035', '互联网板块-房产-华北区-华北区-济南-济南-销售一组-组员');
INSERT INTO `table 33` VALUES ('2AA09B46C2C4', '秦超', '38058', '销售', '0', '3035', '互联网板块-房产-华北区-华北区-济南-济南-销售一组-组员');
INSERT INTO `table 33` VALUES ('5886C9D0E261', '王淼', '38027', '销售', '0', '3035', '互联网板块-房产-华北区-华北区-济南-济南-销售一组-组员');
INSERT INTO `table 33` VALUES ('C9D83E530280', '颜丙亮', '33972', '销售', '0', '3035', '互联网板块-房产-华北区-华北区-济南-济南-销售一组-组员');
INSERT INTO `table 33` VALUES ('1260843BCE54', '石静', '32667', '销售', '0', '3037', '互联网板块-房产-华北区-华北区-济南-济南-销售二组-组员');
INSERT INTO `table 33` VALUES ('C5F9135C6E00', '陈艳琳', '31725', '销售', '0', '3037', '互联网板块-房产-华北区-华北区-济南-济南-销售二组-组员');
INSERT INTO `table 33` VALUES ('AAA5F53E98F2', '吴善强', '30757', '销售', '0', '3037', '互联网板块-房产-华北区-华北区-济南-济南-销售二组-组员');
INSERT INTO `table 33` VALUES ('ECB69AF65DCE', '张卫东', '30211', '销售', '0', '3037', '互联网板块-房产-华北区-华北区-济南-济南-销售二组-组员');
INSERT INTO `table 33` VALUES ('512291E3C137', '曹龙', '35003', '销售', '0', '3037', '互联网板块-房产-华北区-华北区-济南-济南-销售二组-组员');
INSERT INTO `table 33` VALUES ('BB781AB45DF8', '郭雪婷', '32348', '销售', '0', '3037', '互联网板块-房产-华北区-华北区-济南-济南-销售二组-组员');
INSERT INTO `table 33` VALUES ('7B2F63906A84', '杨立鑫', '35751', '销售', '0', '3037', '互联网板块-房产-华北区-华北区-济南-济南-销售二组-组员');
INSERT INTO `table 33` VALUES ('47D48FA425E0', '姚春凯', '30874', '销售', '0', '3037', '互联网板块-房产-华北区-华北区-济南-济南-销售二组-组员');
INSERT INTO `table 33` VALUES ('4149BE6B0AB4', '董雪青', '37325', '销售', '0', '3039', '互联网板块-房产-华北区-华北区-济南-济南-销售三组-组员');
INSERT INTO `table 33` VALUES ('D63CB10D9515', '张立腾', '37927', '销售', '0', '3039', '互联网板块-房产-华北区-华北区-济南-济南-销售三组-组员');
INSERT INTO `table 33` VALUES ('0919EDC0B736', '刘奇奇', '36082', '销售', '0', '3039', '互联网板块-房产-华北区-华北区-济南-济南-销售三组-组员');
INSERT INTO `table 33` VALUES ('9DD6AE519F73', '张金', '37919', '销售', '0', '3039', '互联网板块-房产-华北区-华北区-济南-济南-销售三组-组员');
INSERT INTO `table 33` VALUES ('96CAD66265B3', '胡娜娜35005', '35005', '销售', '0', '3039', '互联网板块-房产-华北区-华北区-济南-济南-销售三组-组员');
INSERT INTO `table 33` VALUES ('2016C5F60599', '陈丽萍', '35353', '销售', '0', '3042', '互联网板块-房产-东部区-威海-威海-威海');
INSERT INTO `table 33` VALUES ('A8FF7630B8A0', '丁良腾', '33165', '销售', '0', '3042', '互联网板块-房产-东部区-威海-威海-威海');
INSERT INTO `table 33` VALUES ('BFC3210ABA90', '杨颂', '37913', '销售', '0', '3042', '互联网板块-房产-东部区-威海-威海-威海');
INSERT INTO `table 33` VALUES ('63A54BA3DBB0', '郭栋', '36757', '销售', '0', '3042', '互联网板块-房产-东部区-威海-威海-威海');
INSERT INTO `table 33` VALUES ('EAD1A5E582C7', '杨欣', '32613', '销售', '0', '3042', '互联网板块-房产-东部区-威海-威海-威海');
INSERT INTO `table 33` VALUES ('44EDDDD21464', '王晨阳', '38083', '销售', '0', '3042', '互联网板块-房产-东部区-威海-威海-威海');
INSERT INTO `table 33` VALUES ('0C805A063B49', '王忠库', '31492', '销售', '0', '3042', '互联网板块-房产-东部区-威海-威海-威海');
INSERT INTO `table 33` VALUES ('69DA15B83D78', '王世范', '37960', '销售', '0', '3042', '互联网板块-房产-东部区-威海-威海-威海');
INSERT INTO `table 33` VALUES ('222DD30A1C19', '张庆昕', '53602', '销售', '0', '3042', '互联网板块-房产-东部区-威海-威海-威海');
INSERT INTO `table 33` VALUES ('429EEA2EB621', '徐鹏飞', '55526', '销售', '0', '3042', '互联网板块-房产-东部区-威海-威海-威海');
INSERT INTO `table 33` VALUES ('0A67ED63738E', '孙志鑫', '32612', '销售', '0', '3042', '互联网板块-房产-东部区-威海-威海-威海');
INSERT INTO `table 33` VALUES ('2436D8E7F959', '庄福磊', '37904', '销售', '0', '3042', '互联网板块-房产-东部区-威海-威海-威海');
INSERT INTO `table 33` VALUES ('AA87E518312C', '丛丽萍', '30875', '销售', '0', '3042', '互联网板块-房产-东部区-威海-威海-威海');
INSERT INTO `table 33` VALUES ('26A4FCDACC05', '韩睿', '36076', '销售', '0', '3044', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户1组-组员');
INSERT INTO `table 33` VALUES ('26A5183D8149', '王思梦', '36717', '销售', '0', '3044', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户1组-组员');
INSERT INTO `table 33` VALUES ('F07DE1695CBC', '李俊杰', '31536', '销售', '0', '3044', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户1组-组员');
INSERT INTO `table 33` VALUES ('20F05E37EB53', '孔芳', '35198', '销售', '0', '3044', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户1组-组员');
INSERT INTO `table 33` VALUES ('5E850CF95278', '于晓璐', '32220', '销售', '0', '3044', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户1组-组员');
INSERT INTO `table 33` VALUES ('4609F83FCA1E', '刘建辉', '30823', '销售', '0', '3044', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户1组-组员');
INSERT INTO `table 33` VALUES ('A67A293374BB', '李延雷', '31596', '销售', '0', '3044', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户1组-组员');
INSERT INTO `table 33` VALUES ('C296B339FB81', '测试帐号', 'F0000-测试', '销售', '0', '3044', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户1组-组员');
INSERT INTO `table 33` VALUES ('0F7B13FF6C0F', '魏胜震', '30764', '销售', '0', '3044', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户1组-组员');
INSERT INTO `table 33` VALUES ('5A4094A0354E', '郭佳', '33770', '销售', '0', '3044', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户1组-组员');
INSERT INTO `table 33` VALUES ('3408FA908A28', '孙艳彬', '35865', '销售', '0', '3044', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户1组-组员');
INSERT INTO `table 33` VALUES ('321A3AB83B73', '王鹏33587', '33587', '销售', '0', '3044', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户1组-组员');
INSERT INTO `table 33` VALUES ('12C56672264E', '韩运双', '32285', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `table 33` VALUES ('C33386B43A64', '宗纪宇', '33890', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `table 33` VALUES ('4A11E07A2EFE', '唐晓辉', '34792', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `table 33` VALUES ('91C3598BA7C9', '张正宇', '35823', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `table 33` VALUES ('191B79F3BC11', '刘磊35745', '35745', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `table 33` VALUES ('407D8A6AC123', '杨光33311', '33311', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `table 33` VALUES ('80C6F77C2A3B', '岳君', '35351', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `table 33` VALUES ('D49A95ED4034', '谢文雅', '33891', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `table 33` VALUES ('C551953DFF25', '张丹凤', '32294', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `table 33` VALUES ('10E6F02D4438', '孙海英', '32288', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `table 33` VALUES ('B957C429AD0B', '邹晓宁', '33162', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `table 33` VALUES ('3126BC6D1DA0', '吴建平', '37772', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `table 33` VALUES ('31269DA46578', '刘莹滨', '37363', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `table 33` VALUES ('35E9E9B4F901', '王政37832', '37832', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `table 33` VALUES ('8784DE11D175', '曹鹏', '35744', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `table 33` VALUES ('8747F92100E6', '王晓玲', '32290', '销售', '0', '3046', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售一组-组员');
INSERT INTO `table 33` VALUES ('312684B6FCC7', '王程', '36951', '销售', '0', '3048', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售二组-组员');
INSERT INTO `table 33` VALUES ('68473D6394EC', '孙艳婷', '35746', '销售', '0', '3048', '互联网板块-房产-东北区-东北区-哈尔滨-哈尔滨-销售二组-组员');
INSERT INTO `table 33` VALUES ('74EDD8D8AFA3', '刘天博', '36770', '销售', '0', '3050', '互联网板块-房产-东北区-东北区-长春-长春-销售一组-组员');
INSERT INTO `table 33` VALUES ('9DB40BD6F458', '苏亚明', '37777', '销售', '0', '3050', '互联网板块-房产-东北区-东北区-长春-长春-销售一组-组员');
INSERT INTO `table 33` VALUES ('8E18695DF458', '陈奥南', '32652', '销售', '0', '3050', '互联网板块-房产-东北区-东北区-长春-长春-销售一组-组员');
INSERT INTO `table 33` VALUES ('CD18AC34FE32', '冯超', '37789', '销售', '0', '3050', '互联网板块-房产-东北区-东北区-长春-长春-销售一组-组员');
INSERT INTO `table 33` VALUES ('781F24605EE6', '张菁楠', '37882', '销售', '0', '3050', '互联网板块-房产-东北区-东北区-长春-长春-销售一组-组员');
INSERT INTO `table 33` VALUES ('40DE44D51815', '彭艳君', '37850', '销售', '0', '3050', '互联网板块-房产-东北区-东北区-长春-长春-销售一组-组员');
INSERT INTO `table 33` VALUES ('5C3E64E53CB9', '张钟月', '50117', '销售', '0', '3050', '互联网板块-房产-东北区-东北区-长春-长春-销售一组-组员');
INSERT INTO `table 33` VALUES ('94A61241DCF1', '梁雪', '50130', '销售', '0', '3050', '互联网板块-房产-东北区-东北区-长春-长春-销售一组-组员');
INSERT INTO `table 33` VALUES ('3418AB03A577', '黄浩32949', '32949', '销售', '0', '3050', '互联网板块-房产-东北区-东北区-长春-长春-销售一组-组员');
INSERT INTO `table 33` VALUES ('22AF759494B7', '曲楠', '37756', '销售', '0', '3052', '互联网板块-房产-大连-大连-大连-大连-销售一组-组员');
INSERT INTO `table 33` VALUES ('0F81DF41D160', '刘宏亭', '52113', '销售', '0', '3052', '互联网板块-房产-大连-大连-大连-大连-销售一组-组员');
INSERT INTO `table 33` VALUES ('12EEBC7A7E19', '闫洪亮', '30540', '销售', '0', '3052', '互联网板块-房产-大连-大连-大连-大连-销售一组-组员');
INSERT INTO `table 33` VALUES ('BF948D07A3C7', '姜鉴航', '37720', '销售', '0', '3052', '互联网板块-房产-大连-大连-大连-大连-销售一组-组员');
INSERT INTO `table 33` VALUES ('B2D4FE6D47DB', '朱健', '32993', '销售', '0', '3054', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售一组-组员');
INSERT INTO `table 33` VALUES ('9DC6E6048EE0', '秦琳', '38503', '销售', '0', '3054', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售一组-组员');
INSERT INTO `table 33` VALUES ('7066A2ECF2BB', '周威34646', '34646', '销售', '0', '3054', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售一组-组员');
INSERT INTO `table 33` VALUES ('D22A66ED2DC5', '汪力强', '37271', '销售', '0', '3054', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售一组-组员');
INSERT INTO `table 33` VALUES ('BCB6B03F3096', '杨啸笙', '34904', '销售', '0', '3054', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售一组-组员');
INSERT INTO `table 33` VALUES ('EFA1C9785037', '程浩', '32841', '销售', '0', '3054', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售一组-组员');
INSERT INTO `table 33` VALUES ('48CC336E84D5', '陈玲', '50652', '销售', '0', '3054', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售一组-组员');
INSERT INTO `table 33` VALUES ('A5D8AF577257', '薛志平34303', '34303', '销售', '0', '3054', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售一组-组员');
INSERT INTO `table 33` VALUES ('59054F7AB2D7', '张晓杭', '30867', '销售', '0', '3054', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售一组-组员');
INSERT INTO `table 33` VALUES ('D5A8051D4F58', '吴元辉', '38678', '销售', '0', '3054', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售一组-组员');
INSERT INTO `table 33` VALUES ('3D740A18A292', '孙艳霞', '32278', '销售', '0', '3054', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售一组-组员');
INSERT INTO `table 33` VALUES ('28CC84522898', '邢庆晨', '32279', '销售', '0', '3056', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售二组-组员');
INSERT INTO `table 33` VALUES ('AF5134FE1794', '蒋建林', '34543', '销售', '0', '3056', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售二组-组员');
INSERT INTO `table 33` VALUES ('C9E4BA017F8E', '陶丽佳', '33956', '销售', '0', '3056', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售二组-组员');
INSERT INTO `table 33` VALUES ('9CB6B0B1CC77', '易居杭州', 'B9911', '销售', '0', '3056', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售二组-组员');
INSERT INTO `table 33` VALUES ('E81F1E4D6089', '吴丽丹', '30465', '销售', '0', '3056', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售二组-组员');
INSERT INTO `table 33` VALUES ('3E2E5A4AF9C1', '史雨蒙', '50659', '销售', '0', '3056', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售二组-组员');
INSERT INTO `table 33` VALUES ('1343E00CD593', '吴妮', '32904', '销售', '0', '3056', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售二组-组员');
INSERT INTO `table 33` VALUES ('FDA4A914CE09', '何平', '34523', '销售', '0', '3056', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售二组-组员');
INSERT INTO `table 33` VALUES ('1C07C14FDC92', '董俊杰', '30407', '销售', '0', '3056', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售二组-组员');
INSERT INTO `table 33` VALUES ('807765478EA2', '林贤耀', '32490', '销售', '0', '3058', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售三组-组员');
INSERT INTO `table 33` VALUES ('9DC6CF180AB4', '徐燕', '38514', '销售', '0', '3058', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售三组-组员');
INSERT INTO `table 33` VALUES ('DE3D9B5291A0', '袁倩', '38535', '销售', '0', '3058', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售三组-组员');
INSERT INTO `table 33` VALUES ('42966CE349EB', '马彩红', '31434', '销售', '0', '3058', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售三组-组员');
INSERT INTO `table 33` VALUES ('D2EDD337D1CC', '陈熨', '34647', '销售', '0', '3060', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售四组-组员');
INSERT INTO `table 33` VALUES ('AC3B36B92065', '李蕊', '35496', '销售', '0', '3060', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售四组-组员');
INSERT INTO `table 33` VALUES ('6610963D9705', '姜双双', '34769', '销售', '0', '3060', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售四组-组员');
INSERT INTO `table 33` VALUES ('657515CBDF99', '冯霁雯', '30866', '销售', '0', '3060', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售四组-组员');
INSERT INTO `table 33` VALUES ('7CB8C2AF8138', '凌萍萍', '36773', '销售', '0', '3062', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售五组-组员');
INSERT INTO `table 33` VALUES ('579815B522E5', '单静波', '38562', '销售', '0', '3062', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售五组-组员');
INSERT INTO `table 33` VALUES ('1BCF07A09386', '葛鸿飞', '50644', '销售', '0', '3062', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售五组-组员');
INSERT INTO `table 33` VALUES ('CE5D2D23EDE2', '洪秋华', '30527', '销售', '0', '3062', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售五组-组员');
INSERT INTO `table 33` VALUES ('34B12A545DA7', '袁铨', '54716', '销售', '0', '3062', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售五组-组员');
INSERT INTO `table 33` VALUES ('0AB0C96E81C9', '凤维维', '54682', '销售', '0', '3062', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售五组-组员');
INSERT INTO `table 33` VALUES ('FC989C6A48D9', '张营', '38598', '销售', '0', '3062', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售五组-组员');
INSERT INTO `table 33` VALUES ('D5A9C8E65A26', '章亮', '50625', '销售', '0', '3064', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售六组-组员');
INSERT INTO `table 33` VALUES ('A2B51D086102', '邵思羽', '38699', '销售', '0', '3064', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售六组-组员');
INSERT INTO `table 33` VALUES ('6D7A1D606714', '叶靓', '30408', '销售', '0', '3064', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售六组-组员');
INSERT INTO `table 33` VALUES ('CE28DE5FB6C3', '施赟', '30469', '销售', '0', '3066', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售七组-组员');
INSERT INTO `table 33` VALUES ('0AB0D2628B97', '江唅', '38660', '销售', '0', '3066', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售七组-组员');
INSERT INTO `table 33` VALUES ('EBCE35267863', '董梅', '32275', '销售', '0', '3066', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售七组-组员');
INSERT INTO `table 33` VALUES ('54D92A9A80C4', '郑程元', '38563', '销售', '0', '3066', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售七组-组员');
INSERT INTO `table 33` VALUES ('A2B493BBD0B6', '姜瑜', '50600', '销售', '0', '3066', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售七组-组员');
INSERT INTO `table 33` VALUES ('1B149EC00C55', '周马鑫', '38550', '销售', '0', '3068', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售八组-组员');
INSERT INTO `table 33` VALUES ('3819B7D5D381', '罗宏达', '32277', '销售', '0', '3068', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售八组-组员');
INSERT INTO `table 33` VALUES ('001FEFD5F0F8', '黄洁翔', '32276', '销售', '0', '3068', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-销售八组-组员');
INSERT INTO `table 33` VALUES ('E77A5AA7D0E4', '张龙37031', '37031', '销售', '0', '3070', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售一组-组员');
INSERT INTO `table 33` VALUES ('E77AC26FCF06', '胡丹丹37081', '37081', '销售', '0', '3070', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售一组-组员');
INSERT INTO `table 33` VALUES ('9A61FBB56F44', '王一格', '50609', '销售', '0', '3070', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售一组-组员');
INSERT INTO `table 33` VALUES ('FF7BAA398215', '张雷', '37109', '销售', '0', '3070', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售一组-组员');
INSERT INTO `table 33` VALUES ('D76813EB3139', '詹腾', '50648', '销售', '0', '3070', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售一组-组员');
INSERT INTO `table 33` VALUES ('306E71D3C861', '李雪茹', '37197', '销售', '0', '3072', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售二组-组员');
INSERT INTO `table 33` VALUES ('3E66E9481175', '朱以晨', '38528', '销售', '0', '3072', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售二组-组员');
INSERT INTO `table 33` VALUES ('4B3ADE528215', '蔡丹桂', '38518', '销售', '0', '3072', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售二组-组员');
INSERT INTO `table 33` VALUES ('8CCBCCA0F4D9', '王燚', '54748', '销售', '0', '3072', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售二组-组员');
INSERT INTO `table 33` VALUES ('C67964242099', '边王迪', '33347', '销售', '0', '3074', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售三组-组员');
INSERT INTO `table 33` VALUES ('E77AA45A6D47', '黄张37056', '37056', '销售', '0', '3074', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售三组-组员');
INSERT INTO `table 33` VALUES ('FF7B4A784E20', '陈珏翰', '37129', '销售', '0', '3074', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售三组-组员');
INSERT INTO `table 33` VALUES ('AA8BB8778273', '董奇', '34951', '销售', '0', '3075', '互联网板块-房产-浙闽区-浙江区-嘉兴-嘉兴-销售组-销售组');
INSERT INTO `table 33` VALUES ('37334D169052', '方伟', '37375', '销售', '0', '3076', '互联网板块-房产-浙闽区-浙江区-嘉兴-嘉兴-销售组-组员');
INSERT INTO `table 33` VALUES ('01ED04B20845', '张智媛', '38549', '销售', '0', '3076', '互联网板块-房产-浙闽区-浙江区-嘉兴-嘉兴-销售组-组员');
INSERT INTO `table 33` VALUES ('2203AE8EB1CB', '谢小英', '35955', '销售', '0', '3076', '互联网板块-房产-浙闽区-浙江区-嘉兴-嘉兴-销售组-组员');
INSERT INTO `table 33` VALUES ('981A2E6C9BF0', '孙洁', '50610', '销售', '0', '3076', '互联网板块-房产-浙闽区-浙江区-嘉兴-嘉兴-销售组-组员');
INSERT INTO `table 33` VALUES ('AA8BB8778273', '董奇', '34951', '销售', '0', '3076', '互联网板块-房产-浙闽区-浙江区-嘉兴-嘉兴-销售组-组员');
INSERT INTO `table 33` VALUES ('71BFCCAA6FD0', '李卫川', '34561', '销售', '0', '3076', '互联网板块-房产-浙闽区-浙江区-嘉兴-嘉兴-销售组-组员');
INSERT INTO `table 33` VALUES ('3448FFB25177', '李春雷', '36549', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `table 33` VALUES ('DCC078C399D9', '陈述峰', '39135', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `table 33` VALUES ('6CA5B9167774', '唐修捷', '39108', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `table 33` VALUES ('8F2BF5AC1282', '谢薇', '39234', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `table 33` VALUES ('8F2BD29874B7', '张婷39235', '39235', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `table 33` VALUES ('344F86C70203', '吕婧譞', '36569', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `table 33` VALUES ('2AC2B57C75B4', '吴玉璐', '35753', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `table 33` VALUES ('C42C4F32C80C', '尹雪34883', '34883', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `table 33` VALUES ('F21940CF4C34', '刘娴', '39143', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `table 33` VALUES ('50FFB79D9D70', '保思燕', '33004', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `table 33` VALUES ('E1DA1104D927', '李欣', '51374', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `table 33` VALUES ('E1DA1B6A28C7', '姜英丽', '53808', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `table 33` VALUES ('B65625A68204', '邓静', '51337', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `table 33` VALUES ('3CD15159CBA7', '曾娇', '51262', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `table 33` VALUES ('0BD8969D3F82', '陈林元', '55094', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `table 33` VALUES ('0BD89D83C696', '麻芳芳', '55095', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `table 33` VALUES ('34491C4FD760', '赵亚锋', '36550', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `table 33` VALUES ('A2B29E0B0C36', '胡彤', '39107', '销售', '0', '3090', '互联网板块-房产-联合区-联合区-云南-云南-销售一组-组员');
INSERT INTO `table 33` VALUES ('468838A66954', '刘正蓉', '51275', '销售', '0', '3092', '互联网板块-房产-联合区-联合区-云南-云南-销售二组-组员');
INSERT INTO `table 33` VALUES ('46882270B903', '杨梦琳', '51274', '销售', '0', '3092', '互联网板块-房产-联合区-联合区-云南-云南-销售二组-组员');
INSERT INTO `table 33` VALUES ('FFB211BD27B1', '苏丽君37012', '37012', '销售', '0', '3092', '互联网板块-房产-联合区-联合区-云南-云南-销售二组-组员');
INSERT INTO `table 33` VALUES ('ED3DDE276A99', '黄丝丝37100', '37100', '销售', '0', '3094', '互联网板块-房产-联合区-联合区-广西-南宁-销售一组-组员');
INSERT INTO `table 33` VALUES ('8C720CE29343', '麦伟丹', '39222', '销售', '0', '3094', '互联网板块-房产-联合区-联合区-广西-南宁-销售一组-组员');
INSERT INTO `table 33` VALUES ('61E3C7AE7632', '王永健', '53858', '销售', '0', '3094', '互联网板块-房产-联合区-联合区-广西-南宁-销售一组-组员');
INSERT INTO `table 33` VALUES ('3D22F0193A11', '黄少超', '51253', '销售', '0', '3094', '互联网板块-房产-联合区-联合区-广西-南宁-销售一组-组员');
INSERT INTO `table 33` VALUES ('C44ECB84B6B0', '刘莹', '56271', '销售', '0', '3094', '互联网板块-房产-联合区-联合区-广西-南宁-销售一组-组员');
INSERT INTO `table 33` VALUES ('EC65ADBF20F3', '何凤林', '53811', '销售', '0', '3094', '互联网板块-房产-联合区-联合区-广西-南宁-销售一组-组员');
INSERT INTO `table 33` VALUES ('ED3E37BEF0A7', '陈万燕37101', '37101', '销售', '0', '3096', '互联网板块-房产-联合区-联合区-广西-南宁-销售二组-组员');
INSERT INTO `table 33` VALUES ('ED3E9CE0D333', '文霁37103', '37103', '销售', '0', '3096', '互联网板块-房产-联合区-联合区-广西-南宁-销售二组-组员');
INSERT INTO `table 33` VALUES ('3E2EACD711F6', '吴秋月', '53850', '销售', '0', '3096', '互联网板块-房产-联合区-联合区-广西-南宁-销售二组-组员');
INSERT INTO `table 33` VALUES ('3E2E8AB6DF18', '雷树彬', '53849', '销售', '0', '3096', '互联网板块-房产-联合区-联合区-广西-南宁-销售二组-组员');
INSERT INTO `table 33` VALUES ('ED3E617C0A24', '何钰琦37102', '37102', '销售', '0', '3098', '互联网板块-房产-联合区-联合区-广西-南宁-销售三组-组员');
INSERT INTO `table 33` VALUES ('AFFBD01A6356', '黄科', '39244', '销售', '0', '3098', '互联网板块-房产-联合区-联合区-广西-南宁-销售三组-组员');
INSERT INTO `table 33` VALUES ('D4231203ECC6', '刘菁37050', '37050', '销售', '0', '3098', '互联网板块-房产-联合区-联合区-广西-南宁-销售三组-组员');
INSERT INTO `table 33` VALUES ('ED3E0DDF2167', '黄念飞37099', '37099', '销售', '0', '3098', '互联网板块-房产-联合区-联合区-广西-南宁-销售三组-组员');
INSERT INTO `table 33` VALUES ('4C119EEF19E4', '叶东昇', '56349', '销售', '0', '3098', '互联网板块-房产-联合区-联合区-广西-南宁-销售三组-组员');
INSERT INTO `table 33` VALUES ('FD3F355599FF', '杨宪振34882', '34882', '销售', '0', '3100', '互联网板块-房产-联合区-联合区-广西-北海-销售组-组员');
INSERT INTO `table 33` VALUES ('5100D6015121', '廖大利', '37353', '销售', '0', '3100', '互联网板块-房产-联合区-联合区-广西-北海-销售组-组员');
INSERT INTO `table 33` VALUES ('E4BB483046F6', '刘显注', '39124', '销售', '0', '3100', '互联网板块-房产-联合区-联合区-广西-北海-销售组-组员');
INSERT INTO `table 33` VALUES ('0DA10E2ECA71', '宁力争', '39145', '销售', '0', '3102', '互联网板块-房产-联合区-联合区-广西-桂林-销售一组-组员');
INSERT INTO `table 33` VALUES ('7C80833CF454', '黄林松', '51288', '销售', '0', '3102', '互联网板块-房产-联合区-联合区-广西-桂林-销售一组-组员');
INSERT INTO `table 33` VALUES ('3EBFCC76B319', '班振', '36615', '销售', '0', '3102', '互联网板块-房产-联合区-联合区-广西-桂林-销售一组-组员');
INSERT INTO `table 33` VALUES ('3EBFF0A60178', '周唯', '36631', '销售', '0', '3102', '互联网板块-房产-联合区-联合区-广西-桂林-销售一组-组员');
INSERT INTO `table 33` VALUES ('3EBF3F327461', '谭玉榕', '36611', '销售', '0', '3102', '互联网板块-房产-联合区-联合区-广西-桂林-销售一组-组员');
INSERT INTO `table 33` VALUES ('9340AB47F3C0', '王子文', '34347', '销售', '0', '3106', '互联网板块-房产-海南-海南-海南-海口-销售一组-组员');
INSERT INTO `table 33` VALUES ('7E498176E92D', '潘媛35054', '35054', '销售', '0', '3106', '互联网板块-房产-海南-海南-海南-海口-销售一组-组员');
INSERT INTO `table 33` VALUES ('35B9FFAE7699', '李智南', '30622', '销售', '0', '3106', '互联网板块-房产-海南-海南-海南-海口-销售一组-组员');
INSERT INTO `table 33` VALUES ('0EDD85F3DFCA', '郑薇30192', '30192', '销售', '0', '3106', '互联网板块-房产-海南-海南-海南-海口-销售一组-组员');
INSERT INTO `table 33` VALUES ('4D1BB75546B4', '潘媛-停用', '33838', '销售', '0', '3106', '互联网板块-房产-海南-海南-海南-海口-销售一组-组员');
INSERT INTO `table 33` VALUES ('F452EB901E72', '范艳兰', '39374', '销售', '0', '3106', '互联网板块-房产-海南-海南-海南-海口-销售一组-组员');
INSERT INTO `table 33` VALUES ('661D2DA4BF62', '邱俊勇', '39358', '销售', '0', '3106', '互联网板块-房产-海南-海南-海南-海口-销售一组-组员');
INSERT INTO `table 33` VALUES ('F4530A9A6E81', '章彬彬', '39377', '销售', '0', '3106', '互联网板块-房产-海南-海南-海南-海口-销售一组-组员');
INSERT INTO `table 33` VALUES ('D780F2BDD46A', '王智', '30374', '销售', '0', '3106', '互联网板块-房产-海南-海南-海南-海口-销售一组-组员');
INSERT INTO `table 33` VALUES ('811B27C7F018', '王迪', '36747', '销售', '0', '3106', '互联网板块-房产-海南-海南-海南-海口-销售一组-组员');
INSERT INTO `table 33` VALUES ('661C2540A046', '陈飘云', '39357', '销售', '0', '3106', '互联网板块-房产-海南-海南-海南-海口-销售一组-组员');
INSERT INTO `table 33` VALUES ('5F94D2556168', '苏峻平', '39317', '销售', '0', '3106', '互联网板块-房产-海南-海南-海南-海口-销售一组-组员');
INSERT INTO `table 33` VALUES ('09638C780B15', '梁伟', '39388', '销售', '0', '3106', '互联网板块-房产-海南-海南-海南-海口-销售一组-组员');
INSERT INTO `table 33` VALUES ('45E0C731D88D', '李翠35052', '35052', '销售', '0', '3106', '互联网板块-房产-海南-海南-海南-海口-销售一组-组员');
INSERT INTO `table 33` VALUES ('0A7790342ECB', '李智南35046', '35046', '销售', '0', '3106', '互联网板块-房产-海南-海南-海南-海口-销售一组-组员');
INSERT INTO `table 33` VALUES ('D88A6BF1FFF7', '王智鹏35056', '35056', '销售', '0', '3108', '互联网板块-房产-海南-海南-海南-海口-销售二组-组员');
INSERT INTO `table 33` VALUES ('23842AD7DDAF', '姚力萌35049', '35049', '销售', '0', '3108', '互联网板块-房产-海南-海南-海南-海口-销售二组-组员');
INSERT INTO `table 33` VALUES ('0565AB12A0A2', '夏祎-停用', '34469', '销售', '0', '3108', '互联网板块-房产-海南-海南-海南-海口-销售二组-组员');
INSERT INTO `table 33` VALUES ('BFD258CE7A34', '姚力萌', '30621', '销售', '0', '3108', '互联网板块-房产-海南-海南-海南-海口-销售二组-组员');
INSERT INTO `table 33` VALUES ('05414EF2792F', '苏丽君', '30625', '销售', '0', '3108', '互联网板块-房产-海南-海南-海南-海口-销售二组-组员');
INSERT INTO `table 33` VALUES ('100EF783E8DD', '叶铮霓35051', '35051', '销售', '0', '3108', '互联网板块-房产-海南-海南-海南-海口-销售二组-组员');
INSERT INTO `table 33` VALUES ('F452D515CA31', '郑晓龙', '39375', '销售', '0', '3108', '互联网板块-房产-海南-海南-海南-海口-销售二组-组员');
INSERT INTO `table 33` VALUES ('C5D998569C86', '周磊35048', '35048', '销售', '0', '3108', '互联网板块-房产-海南-海南-海南-海口-销售二组-组员');
INSERT INTO `table 33` VALUES ('65F7A666495C', '夏祎35057', '35057', '销售', '0', '3110', '互联网板块-房产-海南-海南-海南-海口-销售三组-组员');
INSERT INTO `table 33` VALUES ('1DAFB5F81941', '卢正飞', '31670', '销售', '0', '3110', '互联网板块-房产-海南-海南-海南-海口-销售三组-组员');
INSERT INTO `table 33` VALUES ('011AAC5A15D9', '丁波', '30445', '销售', '0', '3110', '互联网板块-房产-海南-海南-海南-海口-销售三组-组员');
INSERT INTO `table 33` VALUES ('90C3F37D0D54', '孙玉婷35055', '35055', '销售', '0', '3110', '互联网板块-房产-海南-海南-海南-海口-销售三组-组员');
INSERT INTO `table 33` VALUES ('1DBE4C226EB8', '王晶晶', '51472', '销售', '0', '3110', '互联网板块-房产-海南-海南-海南-海口-销售三组-组员');
INSERT INTO `table 33` VALUES ('B20D20DCEF06', '洪睿宇', '31990', '销售', '0', '3110', '互联网板块-房产-海南-海南-海南-海口-销售三组-组员');
INSERT INTO `table 33` VALUES ('031D3E759403', '邓杜35050', '35050', '销售', '0', '3110', '互联网板块-房产-海南-海南-海南-海口-销售三组-组员');
INSERT INTO `table 33` VALUES ('6A1BCABE8B7A', '郭静35047', '35047', '销售', '0', '3110', '互联网板块-房产-海南-海南-海南-海口-销售三组-组员');
INSERT INTO `table 33` VALUES ('813F92930652', '胡婷35068', '35068', '销售', '0', '3112', '互联网板块-房产-海南-海南-海南-三亚-销售一组-组员');
INSERT INTO `table 33` VALUES ('E803C3A451E3', '钟春雨', '30624', '销售', '0', '3112', '互联网板块-房产-海南-海南-海南-三亚-销售一组-组员');
INSERT INTO `table 33` VALUES ('18D9A1701807', '施诺', '39381', '销售', '0', '3112', '互联网板块-房产-海南-海南-海南-三亚-销售一组-组员');
INSERT INTO `table 33` VALUES ('F11ABEB345D2', '卜珊珊', '35070', '销售', '0', '3112', '互联网板块-房产-海南-海南-海南-三亚-销售一组-组员');
INSERT INTO `table 33` VALUES ('3E21D1DADDC0', '李大', '39390', '销售', '0', '3112', '互联网板块-房产-海南-海南-海南-三亚-销售一组-组员');
INSERT INTO `table 33` VALUES ('8A825A5B45B7', '钟春雨35063', '35063', '销售', '0', '3112', '互联网板块-房产-海南-海南-海南-三亚-销售一组-组员');
INSERT INTO `table 33` VALUES ('4E48D44D52F6', '吴涛', '39349', '销售', '0', '3112', '互联网板块-房产-海南-海南-海南-三亚-销售一组-组员');
INSERT INTO `table 33` VALUES ('1F73ED8300F7', '云隆', '51475', '销售', '0', '3112', '互联网板块-房产-海南-海南-海南-三亚-销售一组-组员');
INSERT INTO `table 33` VALUES ('7B4D636385A9', '李星35064', '35064', '销售', '0', '3114', '互联网板块-房产-海南-海南-海南-三亚-销售二组-组员');
INSERT INTO `table 33` VALUES ('4E48BFE96E54', '褚婷', '39347', '销售', '0', '3114', '互联网板块-房产-海南-海南-海南-三亚-销售二组-组员');
INSERT INTO `table 33` VALUES ('80D7273237C1', '马冰51434', '51434', '销售', '0', '3114', '互联网板块-房产-海南-海南-海南-三亚-销售二组-组员');
INSERT INTO `table 33` VALUES ('276DC8B0FD15', '张天朋', '39320', '销售', '0', '3114', '互联网板块-房产-海南-海南-海南-三亚-销售二组-组员');
INSERT INTO `table 33` VALUES ('2AA14BF20093', '韩燕', '39340', '销售', '0', '3114', '互联网板块-房产-海南-海南-海南-三亚-销售二组-组员');
INSERT INTO `table 33` VALUES ('396D0EC507A7', '郭莉莎', '51477', '销售', '0', '3114', '互联网板块-房产-海南-海南-海南-三亚-销售二组-组员');
INSERT INTO `table 33` VALUES ('637D7EC04605', '张奥', '39301', '销售', '0', '3114', '互联网板块-房产-海南-海南-海南-三亚-销售二组-组员');
INSERT INTO `table 33` VALUES ('276DACE70699', '宋浩铭', '39312', '销售', '0', '3114', '互联网板块-房产-海南-海南-海南-三亚-销售二组-组员');
INSERT INTO `table 33` VALUES ('276DBE585610', '黄维欣', '39316', '销售', '0', '3114', '互联网板块-房产-海南-海南-海南-三亚-销售二组-组员');
INSERT INTO `table 33` VALUES ('0F043300DA81', '于浩洋', '39334', '销售', '0', '3114', '互联网板块-房产-海南-海南-海南-三亚-销售二组-组员');
INSERT INTO `table 33` VALUES ('276DB635F387', '任远', '39302', '销售', '0', '3114', '互联网板块-房产-海南-海南-海南-三亚-销售二组-组员');
INSERT INTO `table 33` VALUES ('27751C5D9A15', '王冰', '35144', '销售', '0', '3114', '互联网板块-房产-海南-海南-海南-三亚-销售二组-组员');
INSERT INTO `table 33` VALUES ('80D721D6D0C6', '吴玲', '51433', '销售', '0', '3116', '互联网板块-房产-海南-海南-海南-三亚-销售三组-组员');
INSERT INTO `table 33` VALUES ('ED08873AD324', '刘鑫51468', '51468', '销售', '0', '3116', '互联网板块-房产-海南-海南-海南-三亚-销售三组-组员');
INSERT INTO `table 33` VALUES ('0A0A19B01846', '邢文哲', '51414', '销售', '0', '3116', '互联网板块-房产-海南-海南-海南-三亚-销售三组-组员');
INSERT INTO `table 33` VALUES ('ED088E2C18B2', '蔡深儒', '51469', '销售', '0', '3116', '互联网板块-房产-海南-海南-海南-三亚-销售三组-组员');
INSERT INTO `table 33` VALUES ('A5CF755D001F', '贾维康35065', '35065', '销售', '0', '3116', '互联网板块-房产-海南-海南-海南-三亚-销售三组-组员');
INSERT INTO `table 33` VALUES ('18D9B024A207', '刘彬', '39386', '销售', '0', '3116', '互联网板块-房产-海南-海南-海南-三亚-销售三组-组员');
INSERT INTO `table 33` VALUES ('18D9A727DA51', '徐翔', '39385', '销售', '0', '3116', '互联网板块-房产-海南-海南-海南-三亚-销售三组-组员');
INSERT INTO `table 33` VALUES ('504DF1C4ED62', '杨碧莹', '39396', '销售', '0', '3116', '互联网板块-房产-海南-海南-海南-三亚-销售三组-组员');
INSERT INTO `table 33` VALUES ('04CB94C662F5', '许龙飞', '36017', '销售', '0', '3116', '互联网板块-房产-海南-海南-海南-三亚-销售三组-组员');
INSERT INTO `table 33` VALUES ('F48E036720BF', '孟祥飞35067', '35067', '销售', '0', '3116', '互联网板块-房产-海南-海南-海南-三亚-销售三组-组员');
INSERT INTO `table 33` VALUES ('2DF7468E99F7', '许蕊35076', '35076', '销售', '0', '3118', '互联网板块-房产-海南-海南-海南-琼海-销售一组-组员');
INSERT INTO `table 33` VALUES ('6F5E661F81A0', '李拔锦', '39305', '销售', '0', '3118', '互联网板块-房产-海南-海南-海南-琼海-销售一组-组员');
INSERT INTO `table 33` VALUES ('1132AFF7D557', '李楠35849', '35849', '销售', '0', '3118', '互联网板块-房产-海南-海南-海南-琼海-销售一组-组员');
INSERT INTO `table 33` VALUES ('268EBBF12C79', '洪燕35075', '35075', '销售', '0', '3118', '互联网板块-房产-海南-海南-海南-琼海-销售一组-组员');
INSERT INTO `table 33` VALUES ('723B312E7AE1', '邢冬瑜', '30443', '销售', '0', '3118', '互联网板块-房产-海南-海南-海南-琼海-销售一组-组员');
INSERT INTO `table 33` VALUES ('4A96C120FBAE', '邢冬瑜35072', '35072', '销售', '0', '3118', '互联网板块-房产-海南-海南-海南-琼海-销售一组-组员');
INSERT INTO `table 33` VALUES ('6405EED0B425', '车剑', '39397', '销售', '0', '3118', '互联网板块-房产-海南-海南-海南-琼海-销售一组-组员');
INSERT INTO `table 33` VALUES ('62CA7A38BB94', '李晓飞', '51403', '销售', '0', '3118', '互联网板块-房产-海南-海南-海南-琼海-销售一组-组员');
INSERT INTO `table 33` VALUES ('2F0A8A8E3D55', '席岳琛', '37111', '销售', '0', '3118', '互联网板块-房产-海南-海南-海南-琼海-销售一组-组员');
INSERT INTO `table 33` VALUES ('62C6BF820F45', '尚大群', '51404', '销售', '0', '3118', '互联网板块-房产-海南-海南-海南-琼海-销售一组-组员');
INSERT INTO `table 33` VALUES ('94F9B77A75E6', '黄丹', '30388', '销售', '0', '3118', '互联网板块-房产-海南-海南-海南-琼海-销售一组-组员');
INSERT INTO `table 33` VALUES ('6105DADACFC3', '胡帆', '36657', '销售', '0', '3118', '互联网板块-房产-海南-海南-海南-琼海-销售一组-组员');
INSERT INTO `table 33` VALUES ('F6246D871ECE', '李彬彬35074', '35074', '销售', '0', '3120', '互联网板块-房产-海南-海南-海南-琼海-销售二组-组员');
INSERT INTO `table 33` VALUES ('74DD46FFF4F2', '洪燕', '31388', '销售', '0', '3120', '互联网板块-房产-海南-海南-海南-琼海-销售二组-组员');
INSERT INTO `table 33` VALUES ('F166A73203D0', '陈彦博', '30444', '销售', '0', '3120', '互联网板块-房产-海南-海南-海南-琼海-销售二组-组员');
INSERT INTO `table 33` VALUES ('0475A1DAD8B1', '荆玉', '39333', '销售', '0', '3120', '互联网板块-房产-海南-海南-海南-琼海-销售二组-组员');
INSERT INTO `table 33` VALUES ('18D9BA26FAB3', '陈利君', '39389', '销售', '0', '3120', '互联网板块-房产-海南-海南-海南-琼海-销售二组-组员');
INSERT INTO `table 33` VALUES ('F4532391B2C6', '黄怡', '39378', '销售', '0', '3120', '互联网板块-房产-海南-海南-海南-琼海-销售二组-组员');
INSERT INTO `table 33` VALUES ('F453185B3337', '翁海钧', '39376', '销售', '0', '3120', '互联网板块-房产-海南-海南-海南-琼海-销售二组-组员');
INSERT INTO `table 33` VALUES ('6F5FE8BCEEB3', '李明子', '39306', '销售', '0', '3120', '互联网板块-房产-海南-海南-海南-琼海-销售二组-组员');
INSERT INTO `table 33` VALUES ('2ACAA7672005', '高玲', '39784', '销售', '0', '3122', '互联网板块-房产-上海-上海-上海-上海-销售二部3组（停用）-组员');
INSERT INTO `table 33` VALUES ('4CA34A7D23B3', '颜静', '50700', '销售', '0', '3122', '互联网板块-房产-上海-上海-上海-上海-销售二部3组（停用）-组员');
INSERT INTO `table 33` VALUES ('6728EA802726', '李雅洁', '50706', '销售', '0', '3122', '互联网板块-房产-上海-上海-上海-上海-销售二部3组（停用）-组员');
INSERT INTO `table 33` VALUES ('AA9412BA43B5', '李波34872', '34872', '销售', '0', '3124', '互联网板块-房产-联合区-联合区-云南-云南-销售三组-组员');
INSERT INTO `table 33` VALUES ('15D4C58AC913', '吴俣薇39164', '39164', '销售', '0', '3124', '互联网板块-房产-联合区-联合区-云南-云南-销售三组-组员');
INSERT INTO `table 33` VALUES ('1DAA69353314', '田斌', '39175', '销售', '0', '3124', '互联网板块-房产-联合区-联合区-云南-云南-销售三组-组员');
INSERT INTO `table 33` VALUES ('68784BD6B532', '黄晓芳34871', '34871', '销售', '0', '3124', '互联网板块-房产-联合区-联合区-云南-云南-销售三组-组员');
INSERT INTO `table 33` VALUES ('BCE1828962D6', '李琼', '51292', '销售', '0', '3124', '互联网板块-房产-联合区-联合区-云南-云南-销售三组-组员');
INSERT INTO `table 33` VALUES ('2014958DC093', '陈梦维', '51232', '销售', '0', '3124', '互联网板块-房产-联合区-联合区-云南-云南-销售三组-组员');
INSERT INTO `table 33` VALUES ('1DA9D52C8763', '徐佑', '39174', '销售', '0', '3124', '互联网板块-房产-联合区-联合区-云南-云南-销售三组-组员');
INSERT INTO `table 33` VALUES ('828F6A7AE9A3', '赵世翠', '56152', '销售', '0', '3124', '互联网板块-房产-联合区-联合区-云南-云南-销售三组-组员');
INSERT INTO `table 33` VALUES ('3E1F8D46FC86', '阮婵媛', '53817', '销售', '0', '3124', '互联网板块-房产-联合区-联合区-云南-云南-销售三组-组员');
INSERT INTO `table 33` VALUES ('0F9EBD25BAA3', '韩佩均', '35754', '销售', '0', '3124', '互联网板块-房产-联合区-联合区-云南-云南-销售三组-组员');
INSERT INTO `table 33` VALUES ('828F6F03E769', '何边宏', '51370', '销售', '0', '3124', '互联网板块-房产-联合区-联合区-云南-云南-销售三组-组员');
INSERT INTO `table 33` VALUES ('9E01F6B62087', '李玲（5622）', '56222', '销售', '0', '3124', '互联网板块-房产-联合区-联合区-云南-云南-销售三组-组员');
INSERT INTO `table 33` VALUES ('2CF760B8FEF8', '孙艳青', '55129', '销售', '0', '3124', '互联网板块-房产-联合区-联合区-云南-云南-销售三组-组员');
INSERT INTO `table 33` VALUES ('A0E74F6BF9F9', '陈彦博35071', '35071', '销售', '0', '3124', '互联网板块-房产-联合区-联合区-云南-云南-销售三组-组员');
INSERT INTO `table 33` VALUES ('67D440276BE0', '罗慧忠', '56340', '销售', '0', '3124', '互联网板块-房产-联合区-联合区-云南-云南-销售三组-组员');
INSERT INTO `table 33` VALUES ('CD15DE7688E6', '冯超达', '38796', '销售', '0', '3126', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售二组-组员');
INSERT INTO `table 33` VALUES ('3E55C0EB9436', '刘燕39721', '39721', '销售', '0', '3126', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售二组-组员');
INSERT INTO `table 33` VALUES ('226D6FEBF7E3', '庞云杰', '53544', '销售', '0', '3126', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售二组-组员');
INSERT INTO `table 33` VALUES ('D3E8E6D28E56', '王丹妮', '54924', '销售', '0', '3126', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售二组-组员');
INSERT INTO `table 33` VALUES ('CD15AE4EBBA7', '黄婵', '39759', '销售', '0', '3126', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售二组-组员');
INSERT INTO `table 33` VALUES ('79FF5AE20660', '章美玲', '39747', '销售', '0', '3126', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售二组-组员');
INSERT INTO `table 33` VALUES ('2ECDAECB9E11', '石单阳', '34494', '销售', '0', '3138', '互联网板块-房产-网盟业务中心-网盟业务中心-网盟业务中心-网盟业务中心');
INSERT INTO `table 33` VALUES ('47CCA52D4FD0', '吴洋', '34916', '销售', '0', '3138', '互联网板块-房产-网盟业务中心-网盟业务中心-网盟业务中心-网盟业务中心');
INSERT INTO `table 33` VALUES ('05BFA1C04650', '郑佩佩', '38297', '销售', '0', '3140', '互联网板块-房产-华南区-华南区-佛山-佛山-销售二组-组员');
INSERT INTO `table 33` VALUES ('EC4B31B0BF91', '颜艳蜂', '32491', '销售', '0', '3140', '互联网板块-房产-华南区-华南区-佛山-佛山-销售二组-组员');
INSERT INTO `table 33` VALUES ('8B1474245D1F', '苏成', '34944', '销售', '0', '3140', '互联网板块-房产-华南区-华南区-佛山-佛山-销售二组-组员');
INSERT INTO `table 33` VALUES ('CCF4742BE5C8', '丘陈冰', '52783', '销售', '0', '3140', '互联网板块-房产-华南区-华南区-佛山-佛山-销售二组-组员');
INSERT INTO `table 33` VALUES ('8E81B527DC47', '李骏星', '54391', '销售', '0', '3140', '互联网板块-房产-华南区-华南区-佛山-佛山-销售二组-组员');
INSERT INTO `table 33` VALUES ('508367A20721', '原劲培', '50015', '销售', '0', '3140', '互联网板块-房产-华南区-华南区-佛山-佛山-销售二组-组员');
INSERT INTO `table 33` VALUES ('938DCFB5EA38', '陈霞', '56478', '销售', '0', '3140', '互联网板块-房产-华南区-华南区-佛山-佛山-销售二组-组员');
INSERT INTO `table 33` VALUES ('178C729EA225', '黄彩琴', '56588', '销售', '0', '3140', '互联网板块-房产-华南区-华南区-佛山-佛山-销售二组-组员');
INSERT INTO `table 33` VALUES ('96639FA8D8F4', '李秋海', '32469', '销售', '0', '3142', '互联网板块-房产-北方区-北方-北京-北京-百度乐居运营部-组员');
INSERT INTO `table 33` VALUES ('B8858F126007', '李刚32472', '32472', '销售', '0', '3142', '互联网板块-房产-北方区-北方-北京-北京-百度乐居运营部-组员');
INSERT INTO `table 33` VALUES ('E6E64728A41A', '赵宏', '32881', '销售', '0', '3142', '互联网板块-房产-北方区-北方-北京-北京-百度乐居运营部-组员');
INSERT INTO `table 33` VALUES ('BCE26E536922', '张世超', '52016', '销售', '0', '3147', '互联网板块-房产-合肥-合肥-合肥-合肥-销售二组-组员');
INSERT INTO `table 33` VALUES ('4E52D07620D7', '陆彦华', '52002', '销售', '0', '3147', '互联网板块-房产-合肥-合肥-合肥-合肥-销售二组-组员');
INSERT INTO `table 33` VALUES ('EF93A5E36A44', '李超52070', '52070', '销售', '0', '3147', '互联网板块-房产-合肥-合肥-合肥-合肥-销售二组-组员');
INSERT INTO `table 33` VALUES ('82FBD0C4F669', '李小云', '39325', '销售', '0', '3166', '互联网板块-房产-海南-海南-海南-琼海-销售三组-组员');
INSERT INTO `table 33` VALUES ('97F815070736', '马增辉', '39726', '销售', '0', '3682', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `table 33` VALUES ('97F7F4F17DA7', '陈保亮', '39727', '销售', '0', '3682', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `table 33` VALUES ('06BCB7BD0E34', '刘蒙蒙', '39776', '销售', '0', '3682', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `table 33` VALUES ('944DEFE8F663', '冯晔', '35611', '销售', '0', '3682', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `table 33` VALUES ('ADF0A69954A3', '张冬生', '50827', '销售', '0', '3682', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `table 33` VALUES ('DE2A0742BBA7', '尚露', '39775', '销售', '0', '3682', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `table 33` VALUES ('3CC604A8A9E5', '戴云飞50783', '50783', '销售', '0', '3682', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `table 33` VALUES ('5CE2BCBD8415', '王峰', '35596', '销售', '0', '3682', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `table 33` VALUES ('944E4A18B4F5', '崔鹏', '31078', '销售', '0', '3682', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `table 33` VALUES ('DE2A3E797F11', '卓雅', '39770', '销售', '0', '3682', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `table 33` VALUES ('D205B6E05958', '徐斌', '50762', '销售', '0', '3682', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `table 33` VALUES ('DE29EA1E2571', '付凯', '38716', '销售', '0', '3682', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `table 33` VALUES ('DE2ACB1B3D08', '单萌', '39769', '销售', '0', '3682', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `table 33` VALUES ('1D5A3FD28DF2', '梁苹苹', '39779', '销售', '0', '3683', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `table 33` VALUES ('578E3421EBC4', '吴彦妮', '50709', '销售', '0', '3683', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `table 33` VALUES ('2CF77E575AD7', '周晓春', '50844', '销售', '0', '3683', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `table 33` VALUES ('800DF5C52212', '储嘉杰', '50846', '销售', '0', '3683', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `table 33` VALUES ('BBA70B57FDD6', '叶婷', '50752', '销售', '0', '3683', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `table 33` VALUES ('3CC5EF332E48', '付磊', '50773', '销售', '0', '3683', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `table 33` VALUES ('75735766C3C5', '朱晓可', '50718', '销售', '0', '3683', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `table 33` VALUES ('DE2A2613D6C2', '胥家栋', '39774', '销售', '0', '3683', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `table 33` VALUES ('FF9F44EF50C1', '陈震50894', '50894', '销售', '0', '3683', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `table 33` VALUES ('1B6F0E1FD497', '凌忠网', '50727', '销售', '0', '3684', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `table 33` VALUES ('6EE1E7768A50', '孙俪娜', '50802', '销售', '0', '3684', '互联网板块-房产-上海-上海-上海-上海-销售四部-组员');
INSERT INTO `table 33` VALUES ('59E5C009B340', '马骏', '35302', '销售', '0', '3691', '互联网板块-房产-东部区-芜湖-芜湖-芜湖-销售二组-组员');
INSERT INTO `table 33` VALUES ('1656ADD4A309', '刘梅', '52890', '销售', '0', '3691', '互联网板块-房产-东部区-芜湖-芜湖-芜湖-销售二组-组员');
INSERT INTO `table 33` VALUES ('6822239DF370', '赵文娟', '55486', '销售', '0', '3691', '互联网板块-房产-东部区-芜湖-芜湖-芜湖-销售二组-组员');
INSERT INTO `table 33` VALUES ('41914CE95347', '刘璐', '55478', '销售', '0', '3691', '互联网板块-房产-东部区-芜湖-芜湖-芜湖-销售二组-组员');
INSERT INTO `table 33` VALUES ('AE0F4642D831', '张娟', '55487', '销售', '0', '3691', '互联网板块-房产-东部区-芜湖-芜湖-芜湖-销售二组-组员');
INSERT INTO `table 33` VALUES ('6B2C8748A693', '屈溶', '51145', '销售', '0', '3691', '互联网板块-房产-东部区-芜湖-芜湖-芜湖-销售二组-组员');
INSERT INTO `table 33` VALUES ('CCE7993E6B13', '卜林君', '38948', '销售', '0', '3691', '互联网板块-房产-东部区-芜湖-芜湖-芜湖-销售二组-组员');
INSERT INTO `table 33` VALUES ('650891ADF199', '陈莉37908', '37908', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `table 33` VALUES ('6508D89C7AB0', '张伟37907', '37907', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `table 33` VALUES ('223A22B7523A', '刘霞', '35354', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `table 33` VALUES ('771956F911F9', '孙艳萍', '31625', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `table 33` VALUES ('AB3CAEA1DC42', '杨坤', '34665', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `table 33` VALUES ('ABAE6236E2F4', '宛建伟', '30515', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `table 33` VALUES ('479BB460BC37', '张芳', '37975', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `table 33` VALUES ('C1ABC6179B88', '王丽萌', '34666', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `table 33` VALUES ('9A6A73563D11', '连云峰', '50223', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `table 33` VALUES ('048714AFA228', '孙潜', '38018', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `table 33` VALUES ('DF5543CFCAE2', '于宗甲', '50263', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `table 33` VALUES ('90A4751B13C9', '张达56657', '56657', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `table 33` VALUES ('CB1640864FB9', '刘旋', '50291', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `table 33` VALUES ('62FC5198D817', '王滨', '53622', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `table 33` VALUES ('F156FADDF685', '周莹涵', '50277', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `table 33` VALUES ('803A9ACF6C98', '崔茗涵', '53632', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `table 33` VALUES ('E882B66181A5', '郭典', '50274', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `table 33` VALUES ('E1EC07750517', '李婕', '50273', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `table 33` VALUES ('0669A14651B5', '于忠礼', '53660', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `table 33` VALUES ('449E1EB9FBE8', '曾秀丹', '53600', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `table 33` VALUES ('66C20C084E69', '迟盛超', '56651', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `table 33` VALUES ('527736A4C965', '李宁', '56820', '销售', '0', '3692', '互联网板块-房产-华北区-华北区-青岛-青岛-销售一组-组员');
INSERT INTO `table 33` VALUES ('7F2705F7C663', '翟叔晓', '31534', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `table 33` VALUES ('F6ACD1E9179C', '吴敏娜', '31776', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `table 33` VALUES ('44EF1885A60B', '易居青岛', 'B9902', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `table 33` VALUES ('33C9A3DB50BB', '克而瑞青岛', 'B9802', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `table 33` VALUES ('14F8FD91A657', '孙海洋', '34667', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `table 33` VALUES ('410E941993FD', '祝勇', '30508', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `table 33` VALUES ('6F5531A789D4', '赵沛', '37988', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `table 33` VALUES ('4875AB82EBB2', '车振', '36545', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `table 33` VALUES ('98172DD03A35', '罗鹏', '50218', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `table 33` VALUES ('4D15BC935A96', '张丰选', '38085', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `table 33` VALUES ('130ECF8A6B56', '张震', '37963', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `table 33` VALUES ('F773CDB3D571', '齐艳艳', '34841', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `table 33` VALUES ('4278ACE45E24', '尤一雅34670', '34670', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `table 33` VALUES ('04F1A445DECC', '高悦', '33774', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `table 33` VALUES ('B82C6EF11159', '张鑫', '56680', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `table 33` VALUES ('B86D62E29375', '宋凯琳', '56679', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `table 33` VALUES ('1710B79F32E2', '冯正浩', '56709', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `table 33` VALUES ('C3954EB12D45', '侯欣馨', '50230', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `table 33` VALUES ('B82C1C7828E4', '丁磊', '56676', '销售', '0', '3694', '互联网板块-房产-华北区-华北区-青岛-青岛-销售二组-组员');
INSERT INTO `table 33` VALUES ('CF625EC00F78', '王锋', '34988', '销售', '0', '3770', '互联网板块-房产-产品中心-产品中心-外联合作部-外联合作部');
INSERT INTO `table 33` VALUES ('3BADA24F3096', '王宇', '34545', '销售', '0', '3770', '互联网板块-房产-产品中心-产品中心-外联合作部-外联合作部');
INSERT INTO `table 33` VALUES ('26ED50C47C80', '李文彬', '39815', '销售', '0', '3810', '互联网板块-房产-北方区-北方-北京-北京-商业地产组（停）-组员');
INSERT INTO `table 33` VALUES ('00F51FEED6E6', '盖保军', '35483', '销售', '0', '3834', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售二组-组员');
INSERT INTO `table 33` VALUES ('94454FFDABD0', '尚会乐', '35484', '销售', '0', '3834', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售二组-组员');
INSERT INTO `table 33` VALUES ('5A53CB000EF7', '潘龙志', '37903', '销售', '0', '3834', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售二组-组员');
INSERT INTO `table 33` VALUES ('3E269F2E6138', '于浩阳', '50961', '销售', '0', '3834', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售二组-组员');
INSERT INTO `table 33` VALUES ('B88E45D98169', '刘馨羽', '55234', '销售', '0', '3834', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售二组-组员');
INSERT INTO `table 33` VALUES ('1CFEBFD7BA65', '程铁桢', '53294', '销售', '0', '3834', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售二组-组员');
INSERT INTO `table 33` VALUES ('98156D60D798', '张阳51053', '51053', '销售', '0', '3834', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售二组-组员');
INSERT INTO `table 33` VALUES ('B670B8C68B55', '黄蕾蕾', '52657', '销售', '0', '3834', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售二组-组员');
INSERT INTO `table 33` VALUES ('3E26B5E56DB4', '锡凯同', '50984', '销售', '0', '3834', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售二组-组员');
INSERT INTO `table 33` VALUES ('567DA97F55F2', '李曙光', '55315', '销售', '0', '3834', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售二组-组员');
INSERT INTO `table 33` VALUES ('567DAD9A4488', '高惠生', '55319', '销售', '0', '3834', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售二组-组员');
INSERT INTO `table 33` VALUES ('ECE68153D6F2', '孔德君37078', '37078', '销售', '0', '3842', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户3组-组员');
INSERT INTO `table 33` VALUES ('F601EE8D1224', '申湛', '32969', '销售', '0', '3842', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户3组-组员');
INSERT INTO `table 33` VALUES ('0330D1C06DD2', '杨春雨', '37702', '销售', '0', '3842', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户3组-组员');
INSERT INTO `table 33` VALUES ('FE446AE62902', '王晓磊', '30546', '销售', '0', '3842', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户3组-组员');
INSERT INTO `table 33` VALUES ('D5F3C6E04EC9', '崔恺', '33543', '销售', '0', '3842', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户3组-组员');
INSERT INTO `table 33` VALUES ('B76C58CA2387', '张锦菲', '37871', '销售', '0', '3842', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户3组-组员');
INSERT INTO `table 33` VALUES ('6BAB15F8C90D', '陈晓霞', '31698', '销售', '0', '3842', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户3组-组员');
INSERT INTO `table 33` VALUES ('4E0A6D77FD74', '于海晶', '31539', '销售', '0', '3843', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户2组-组员');
INSERT INTO `table 33` VALUES ('253A705679F9', '夏莹', '37303', '销售', '0', '3843', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户2组-组员');
INSERT INTO `table 33` VALUES ('26A4B7BF6871', '王瑞雪', '35655', '销售', '0', '3843', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户2组-组员');
INSERT INTO `table 33` VALUES ('39431305F9A4', '张栩斌', '37757', '销售', '0', '3843', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户2组-组员');
INSERT INTO `table 33` VALUES ('FD0560C1CDB5', '刘微', '32051', '销售', '0', '3843', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户2组-组员');
INSERT INTO `table 33` VALUES ('525414E5C47F', '盛中原', '30217', '销售', '0', '3843', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户2组-组员');
INSERT INTO `table 33` VALUES ('0CC53F99EC4E', '李晓东', '30215', '销售', '0', '3843', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户2组-组员');
INSERT INTO `table 33` VALUES ('B26B289F2AD0', '佟彤', '35197', '销售', '0', '3843', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户2组-组员');
INSERT INTO `table 33` VALUES ('B6C6BB0B20B6', '朱兴邦', '31072', '销售', '0', '3843', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户2组-组员');
INSERT INTO `table 33` VALUES ('D77DDA940B2D', '王磊', '31216', '销售', '0', '3843', '互联网板块-房产-东北区-东北区-沈阳-沈阳-大客户2组-组员');
INSERT INTO `table 33` VALUES ('335C136BC234', '邱晓华', '36077', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `table 33` VALUES ('15ADB1269880', '王维丹', '37746', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `table 33` VALUES ('41315004F9A4', '宋晓双', '31190', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `table 33` VALUES ('41312EA54FA9', '张月', '33388', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `table 33` VALUES ('34ECB5AE8A24', '郑雪', '37875', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `table 33` VALUES ('8DB5F8D210C7', '闫旭', '37783', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `table 33` VALUES ('891A3D4A56A5', '郝光', '32239', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `table 33` VALUES ('D531819E8222', '孟庆庆', '36180', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `table 33` VALUES ('1CC9CF9F8E40', '徐东旭', '37785', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `table 33` VALUES ('1CC9CA2CB501', '潘艳莉', '37893', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `table 33` VALUES ('D5313A301CF2', '王苏卓', '37729', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `table 33` VALUES ('938DD5AD1A78', '周旭50106', '50106', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `table 33` VALUES ('1CC9D90EF2C0', '关闯', '37894', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `table 33` VALUES ('CD80D3067A38', '孙慧宇', '31127', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `table 33` VALUES ('465234B50335', '刘芳31961', '31961', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `table 33` VALUES ('210E6E355BFD', '邹德莹', '32971', '销售', '0', '3845', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售4组-组员');
INSERT INTO `table 33` VALUES ('E3C5E456E8A3', '李健37922', '37922', '销售', '0', '3847', '互联网板块-房产-华北区-华北区-济南-济南-销售四组-组员');
INSERT INTO `table 33` VALUES ('C067CBFAC882', '高鑫', '37962', '销售', '0', '3847', '互联网板块-房产-华北区-华北区-济南-济南-销售四组-组员');
INSERT INTO `table 33` VALUES ('42A0057B0DD7', '文敬荣', '39938', '销售', '0', '3849', '互联网板块-房产-华北区-华北区-济南-济南-销售五组-组员');
INSERT INTO `table 33` VALUES ('8EBCDE1D5934', '郭瑞', '37997', '销售', '0', '3867', '互联网板块-房产-北方区-北方-太原-太原-销售二组-组员');
INSERT INTO `table 33` VALUES ('8137A0933322', '邢琛', '55189', '销售', '0', '3867', '互联网板块-房产-北方区-北方-太原-太原-销售二组-组员');
INSERT INTO `table 33` VALUES ('4E4B7955DC39', '张鹏51256', '51256', '销售', '0', '3875', '互联网板块-房产-联合区-联合区-银川-银川-销售组-销售员');
INSERT INTO `table 33` VALUES ('01CF8157B5D8', '李世明', '39284', '销售', '0', '3875', '互联网板块-房产-联合区-联合区-银川-银川-销售组-销售员');
INSERT INTO `table 33` VALUES ('4E4BB768B627', '王蓓', '51267', '销售', '0', '3875', '互联网板块-房产-联合区-联合区-银川-银川-销售组-销售员');
INSERT INTO `table 33` VALUES ('6056D8F32005', '王海娟', '53851', '销售', '0', '3875', '互联网板块-房产-联合区-联合区-银川-银川-销售组-销售员');
INSERT INTO `table 33` VALUES ('5280C4B917A4', '杜祎凡', '56347', '销售', '0', '3875', '互联网板块-房产-联合区-联合区-银川-银川-销售组-销售员');
INSERT INTO `table 33` VALUES ('D76A7737C6F8', '姜韶帅', '51362', '销售', '0', '3877', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `table 33` VALUES ('1D5BF30C73F1', '陈旭海', '50333', '销售', '0', '3879', '互联网板块-房产-华南区-华南区-广州-广州-销售六组-组员');
INSERT INTO `table 33` VALUES ('214AB82C2DA9', '刘红旗', '50360', '销售', '0', '3879', '互联网板块-房产-华南区-华南区-广州-广州-销售六组-组员');
INSERT INTO `table 33` VALUES ('47ADFDE436E4', '周志胜', '50401', '销售', '0', '3879', '互联网板块-房产-华南区-华南区-广州-广州-销售六组-组员');
INSERT INTO `table 33` VALUES ('1747C2385898', '范欧阳', '36269', '销售', '0', '3879', '互联网板块-房产-华南区-华南区-广州-广州-销售六组-组员');
INSERT INTO `table 33` VALUES ('0B53A93A8A89', '万婷', '56591', '销售', '0', '3879', '互联网板块-房产-华南区-华南区-广州-广州-销售六组-组员');
INSERT INTO `table 33` VALUES ('4AFAA6F37C66', '陈志亮', '56627', '销售', '0', '3879', '互联网板块-房产-华南区-华南区-广州-广州-销售六组-组员');
INSERT INTO `table 33` VALUES ('F97004866428', '刘晓冰', '54634', '销售', '0', '3879', '互联网板块-房产-华南区-华南区-广州-广州-销售六组-组员');
INSERT INTO `table 33` VALUES ('6F86EBDE31E5', '侯霞', '38232', '销售', '0', '3879', '互联网板块-房产-华南区-华南区-广州-广州-销售六组-组员');
INSERT INTO `table 33` VALUES ('32996688B5A0', '林益亮', '50379', '销售', '0', '3879', '互联网板块-房产-华南区-华南区-广州-广州-销售六组-组员');
INSERT INTO `table 33` VALUES ('BCF3CC8E330B', '庄泽伟', '35207', '销售', '0', '3879', '互联网板块-房产-华南区-华南区-广州-广州-销售六组-组员');
INSERT INTO `table 33` VALUES ('56A3BD1CBAF7', '刘静静', '52063', '销售', '0', '3886', '互联网板块-房产-合肥-合肥-合肥-合肥-销售三组-组员');
INSERT INTO `table 33` VALUES ('9052ACBEE910', '杨洋37124', '37124', '销售', '0', '3891', '互联网板块-房产-东北区-东北区-长春-长春-销售二组-组员');
INSERT INTO `table 33` VALUES ('3CFDC94C4C78', '张佳南', '37808', '销售', '0', '3891', '互联网板块-房产-东北区-东北区-长春-长春-销售二组-组员');
INSERT INTO `table 33` VALUES ('01EFCCC177C2', '王丹37801', '37801', '销售', '0', '3891', '互联网板块-房产-东北区-东北区-长春-长春-销售二组-组员');
INSERT INTO `table 33` VALUES ('9DB3F279A684', '邹宇辰', '37743', '销售', '0', '3891', '互联网板块-房产-东北区-东北区-长春-长春-销售二组-组员');
INSERT INTO `table 33` VALUES ('B4C301B160E2', '王文君', '37816', '销售', '0', '3891', '互联网板块-房产-东北区-东北区-长春-长春-销售二组-组员');
INSERT INTO `table 33` VALUES ('9232850F0441', '王喆', '37883', '销售', '0', '3891', '互联网板块-房产-东北区-东北区-长春-长春-销售二组-组员');
INSERT INTO `table 33` VALUES ('1DAF2FF246D3', '肖玉祥', '33520', '销售', '0', '3891', '互联网板块-房产-东北区-东北区-长春-长春-销售二组-组员');
INSERT INTO `table 33` VALUES ('865FE26F0F46', '吴海波', '37881', '销售', '0', '3891', '互联网板块-房产-东北区-东北区-长春-长春-销售二组-组员');
INSERT INTO `table 33` VALUES ('5C4DCEE74611', '王彦启', '50118', '销售', '0', '3891', '互联网板块-房产-东北区-东北区-长春-长春-销售二组-组员');
INSERT INTO `table 33` VALUES ('C7BC24EADFC2', '刘丹33141', '33141', '销售', '0', '3891', '互联网板块-房产-东北区-东北区-长春-长春-销售二组-组员');
INSERT INTO `table 33` VALUES ('AF0465CEE887', '夏远芳', '50143', '销售', '0', '3891', '互联网板块-房产-东北区-东北区-长春-长春-销售二组-组员');
INSERT INTO `table 33` VALUES ('CD18BC729E29', '王桂敏', '37762', '销售', '0', '3893', '互联网板块-房产-东北区-东北区-长春-长春-销售三组-组员');
INSERT INTO `table 33` VALUES ('01EFA6868FD8', '顾丹阳', '37798', '销售', '0', '3893', '互联网板块-房产-东北区-东北区-长春-长春-销售三组-组员');
INSERT INTO `table 33` VALUES ('10A5FD8FAE86', '顾明', '32330', '销售', '0', '3893', '互联网板块-房产-东北区-东北区-长春-长春-销售三组-组员');
INSERT INTO `table 33` VALUES ('B74FA3A78038', '陈荣斌', '37890', '销售', '0', '3893', '互联网板块-房产-东北区-东北区-长春-长春-销售三组-组员');
INSERT INTO `table 33` VALUES ('01EFE603DBC4', '李明阳', '37800', '销售', '0', '3893', '互联网板块-房产-东北区-东北区-长春-长春-销售三组-组员');
INSERT INTO `table 33` VALUES ('CD18CF8198F8', '董泽地', '37790', '销售', '0', '3895', '互联网板块-房产-东北区-东北区-长春-长春-销售四组-组员');
INSERT INTO `table 33` VALUES ('F5908CBF4FF2', '王东旭', '37859', '销售', '0', '3895', '互联网板块-房产-东北区-东北区-长春-长春-销售四组-组员');
INSERT INTO `table 33` VALUES ('A75150524357', '柳赵明', '50136', '销售', '0', '3895', '互联网板块-房产-东北区-东北区-长春-长春-销售四组-组员');
INSERT INTO `table 33` VALUES ('F11B5D886233', '唐闻', '50159', '销售', '0', '3895', '互联网板块-房产-东北区-东北区-长春-长春-销售四组-组员');
INSERT INTO `table 33` VALUES ('F11B63BB8B92', '张太岩', '50158', '销售', '0', '3895', '互联网板块-房产-东北区-东北区-长春-长春-销售四组-组员');
INSERT INTO `table 33` VALUES ('D41B7A743B91', '林丹57400', '57400', '销售', '0', '3898', '互联网板块-房产-浙闽区-福建-福州-福州-销售一组-销售一组');
INSERT INTO `table 33` VALUES ('D77204A51556', '王琦50904', '50904', '销售', '0', '3905', '互联网板块-房产-北方区-北方-秦皇岛-秦皇岛-销售组-组员');
INSERT INTO `table 33` VALUES ('D84FEC7C2D14', '焦有昆', '52687', '销售', '0', '3905', '互联网板块-房产-北方区-北方-秦皇岛-秦皇岛-销售组-组员');
INSERT INTO `table 33` VALUES ('D7722F901C56', '王琳', '50912', '销售', '0', '3905', '互联网板块-房产-北方区-北方-秦皇岛-秦皇岛-销售组-组员');
INSERT INTO `table 33` VALUES ('D771EB89B488', '张海钢', '50903', '销售', '0', '3905', '互联网板块-房产-北方区-北方-秦皇岛-秦皇岛-销售组-组员');
INSERT INTO `table 33` VALUES ('D84F004F31C5', '韩帅', '51066', '销售', '0', '3905', '互联网板块-房产-北方区-北方-秦皇岛-秦皇岛-销售组-组员');
INSERT INTO `table 33` VALUES ('D8503E70F753', '宁蒙', '52688', '销售', '0', '3905', '互联网板块-房产-北方区-北方-秦皇岛-秦皇岛-销售组-组员');
INSERT INTO `table 33` VALUES ('D84B0BE32ED2', '张子威', '51090', '销售', '0', '3905', '互联网板块-房产-北方区-北方-秦皇岛-秦皇岛-销售组-组员');
INSERT INTO `table 33` VALUES ('F67A986F5754', '李帅', '55274', '销售', '0', '3905', '互联网板块-房产-北方区-北方-秦皇岛-秦皇岛-销售组-组员');
INSERT INTO `table 33` VALUES ('90455C85E9A0', '刘旭', '31378', '销售', '0', '3910', '互联网板块-房产-联合区-联合区-贵阳-贵阳-销售一组-销售员');
INSERT INTO `table 33` VALUES ('D88C1E292430', '何薇39261', '39261', '销售', '0', '3910', '互联网板块-房产-联合区-联合区-贵阳-贵阳-销售一组-销售员');
INSERT INTO `table 33` VALUES ('D88A70B70741', '叶红', '39260', '销售', '0', '3910', '互联网板块-房产-联合区-联合区-贵阳-贵阳-销售一组-销售员');
INSERT INTO `table 33` VALUES ('D88C7DBFD4A6', '邹金鹏', '39272', '销售', '0', '3912', '互联网板块-房产-联合区-联合区-贵阳-贵阳-销售二组-销售员');
INSERT INTO `table 33` VALUES ('D88BB8C2D9B7', '袁健虹', '39263', '销售', '0', '3912', '互联网板块-房产-联合区-联合区-贵阳-贵阳-销售二组-销售员');
INSERT INTO `table 33` VALUES ('D88C5488C0F6', '温红霞', '39265', '销售', '0', '3912', '互联网板块-房产-联合区-联合区-贵阳-贵阳-销售二组-销售员');
INSERT INTO `table 33` VALUES ('BBA7972A2421', '何晨冬', '39278', '销售', '0', '3914', '互联网板块-房产-联合区-联合区-贵阳-贵阳-销售三组-销售员');
INSERT INTO `table 33` VALUES ('D88CA1C93318', '陶智', '39286', '销售', '0', '3914', '互联网板块-房产-联合区-联合区-贵阳-贵阳-销售三组-销售员');
INSERT INTO `table 33` VALUES ('26DF7A5C0758', '刘海龙', '37160', '销售', '0', '3942', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售一组-销售员');
INSERT INTO `table 33` VALUES ('4F7C3ADFE0E7', '李鑫', '51257', '销售', '0', '3942', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售一组-销售员');
INSERT INTO `table 33` VALUES ('9A3D3DE94080', '刘阔', '56198', '销售', '0', '3942', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售一组-销售员');
INSERT INTO `table 33` VALUES ('9A3D55C30967', '魏斌', '56217', '销售', '0', '3942', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售一组-销售员');
INSERT INTO `table 33` VALUES ('79A24F270002', '张闻', '39229', '销售', '0', '3942', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售一组-销售员');
INSERT INTO `table 33` VALUES ('3E3F9D485651', '贾叶', '53838', '销售', '0', '3942', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售一组-销售员');
INSERT INTO `table 33` VALUES ('B655666BD5B9', '赵红阳', '51279', '销售', '0', '3942', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售一组-销售员');
INSERT INTO `table 33` VALUES ('E4EEACF0D460', '莎莉', '39122', '销售', '0', '3942', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售一组-销售员');
INSERT INTO `table 33` VALUES ('87E012C8D1D2', '张亚鹏', '35485', '销售', '0', '4001', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售三组-组员');
INSERT INTO `table 33` VALUES ('4CA44B6716A6', '王晓亮', '51000', '销售', '0', '4001', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售三组-组员');
INSERT INTO `table 33` VALUES ('2B33F9D27C66', '苏萍萍', '37194', '销售', '0', '4001', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售三组-组员');
INSERT INTO `table 33` VALUES ('1CFEC55B2EC3', '马子龙', '53299', '销售', '0', '4001', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售三组-组员');
INSERT INTO `table 33` VALUES ('E609922C0B25', '马洁', '37989', '销售', '0', '4001', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售三组-组员');
INSERT INTO `table 33` VALUES ('5455BBB322C8', '侯伟昆', '55153', '销售', '0', '4001', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售三组-组员');
INSERT INTO `table 33` VALUES ('1611A6AE9CF7', '郭伟达', '55282', '销售', '0', '4001', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售三组-组员');
INSERT INTO `table 33` VALUES ('9642B086C3DB', '陈国强', '35490', '销售', '0', '4001', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售三组-组员');
INSERT INTO `table 33` VALUES ('43F1EBD49B15', '王军55295', '55295', '销售', '0', '4001', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售三组-组员');
INSERT INTO `table 33` VALUES ('49869BEAA692', '田学文', '55293', '销售', '0', '4001', '互联网板块-房产-北方区-北方-石家庄-石家庄-销售三组-组员');
INSERT INTO `table 33` VALUES ('9C05D8E48915', '曹祖南', '39489', '销售', '0', '4003', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('3BD461973ED7', '王藤', '51523', '销售', '0', '4003', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('9A6BBA6D4F94', '吕悠悠', '51567', '销售', '0', '4003', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('7D5523DC4FB3', '崔源', '51557', '销售', '0', '4003', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('664979CAA581', '孙梦婕', '36738', '销售', '0', '4003', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('86148F9D087F', '张茜', '31022', '销售', '0', '4003', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('5087AFAC7C70', '余晓蕾', '54037', '销售', '0', '4003', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('000B494BB7C8', '闫冬冬', '55352', '销售', '0', '4003', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('6519A4E88C55', '王明之', '55376', '销售', '0', '4003', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('0A78C7750E69', '许玲', '55360', '销售', '0', '4003', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('F6E9C6E038B8', '张晋', '54093', '销售', '0', '4003', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('2754C27C8E19', '郑涛', '55440', '销售', '0', '4003', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('FC4235521CD9', '王春艳', '54015', '销售', '0', '4003', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('21E425963840', '陈琳琳', '37076', '销售', '0', '4009', '互联网板块-房产-东北区-东北区-乐居周刊-乐居周刊-销售组-组员');
INSERT INTO `table 33` VALUES ('B44F3252D281', '隋怡', '32337', '销售', '0', '4009', '互联网板块-房产-东北区-东北区-乐居周刊-乐居周刊-销售组-组员');
INSERT INTO `table 33` VALUES ('9F7766F28738', '孙阳', '50134', '销售', '0', '4009', '互联网板块-房产-东北区-东北区-乐居周刊-乐居周刊-销售组-组员');
INSERT INTO `table 33` VALUES ('7F166395B050', '隋文静', '50208', '销售', '0', '4010', '互联网板块-房产-东部区-烟台-烟台-烟台-销售一组-组员');
INSERT INTO `table 33` VALUES ('2B643E40122A', '初晓凤', '33897', '销售', '0', '4010', '互联网板块-房产-东部区-烟台-烟台-烟台-销售一组-组员');
INSERT INTO `table 33` VALUES ('80D185584767', '巩溯南', '55491', '销售', '0', '4010', '互联网板块-房产-东部区-烟台-烟台-烟台-销售一组-组员');
INSERT INTO `table 33` VALUES ('07D197B54FE9', '刘凯50290', '50290', '销售', '0', '4010', '互联网板块-房产-东部区-烟台-烟台-烟台-销售一组-组员');
INSERT INTO `table 33` VALUES ('97304A5320E2', '郭超', '36877', '销售', '0', '4010', '互联网板块-房产-东部区-烟台-烟台-烟台-销售一组-组员');
INSERT INTO `table 33` VALUES ('722B0C4692FF', '杨春敏', '33390', '销售', '0', '4010', '互联网板块-房产-东部区-烟台-烟台-烟台-销售一组-组员');
INSERT INTO `table 33` VALUES ('1D0AC67A8D4A', '田胜豹', '30876', '销售', '0', '4010', '互联网板块-房产-东部区-烟台-烟台-烟台-销售一组-组员');
INSERT INTO `table 33` VALUES ('4951D9C9BE59', '李俊良', '37900', '销售', '0', '4010', '互联网板块-房产-东部区-烟台-烟台-烟台-销售一组-组员');
INSERT INTO `table 33` VALUES ('C17E46C182E9', '朱壮壮', '31694', '销售', '0', '4010', '互联网板块-房产-东部区-烟台-烟台-烟台-销售一组-组员');
INSERT INTO `table 33` VALUES ('F9BE755F1B8F', '焦子新', '35826', '销售', '0', '4010', '互联网板块-房产-东部区-烟台-烟台-烟台-销售一组-组员');
INSERT INTO `table 33` VALUES ('BD82ED3BD1FF', '祝蕾', '31628', '销售', '0', '4010', '互联网板块-房产-东部区-烟台-烟台-烟台-销售一组-组员');
INSERT INTO `table 33` VALUES ('5833D6A2EB66', '张馨月', '53618', '销售', '0', '4010', '互联网板块-房产-东部区-烟台-烟台-烟台-销售一组-组员');
INSERT INTO `table 33` VALUES ('33849D06E136', '于晓燕', '35996', '销售', '0', '4012', '互联网板块-房产-东部区-烟台-烟台-烟台-销售二组-组员');
INSERT INTO `table 33` VALUES ('081762790DA9', '安谨', '50292', '销售', '0', '4012', '互联网板块-房产-东部区-烟台-烟台-烟台-销售二组-组员');
INSERT INTO `table 33` VALUES ('1B15D10C02E6', '米根平', '37967', '销售', '0', '4012', '互联网板块-房产-东部区-烟台-烟台-烟台-销售二组-组员');
INSERT INTO `table 33` VALUES ('F7BFFC98A0B9', '陈晨', '53662', '销售', '0', '4012', '互联网板块-房产-东部区-烟台-烟台-烟台-销售二组-组员');
INSERT INTO `table 33` VALUES ('DE06E1971AA5', '程杰', '37942', '销售', '0', '4012', '互联网板块-房产-东部区-烟台-烟台-烟台-销售二组-组员');
INSERT INTO `table 33` VALUES ('80D17C6F5816', '张小岩', '55492', '销售', '0', '4012', '互联网板块-房产-东部区-烟台-烟台-烟台-销售二组-组员');
INSERT INTO `table 33` VALUES ('3F2FA6572803', '王璐53605', '53605', '销售', '0', '4014', '互联网板块-房产-东部区-烟台-烟台-烟台-销售三组-组员');
INSERT INTO `table 33` VALUES ('1D5C05A26EB6', '何少坤', '50332', '销售', '0', '4016', '互联网板块-房产-华南区-华南区-广州-广州-销售七组-组员');
INSERT INTO `table 33` VALUES ('892B6329C9A3', '曹佳', '54598', '销售', '0', '4016', '互联网板块-房产-华南区-华南区-广州-广州-销售七组-组员');
INSERT INTO `table 33` VALUES ('214AD34A7484', '刘涛50361', '50361', '销售', '0', '4016', '互联网板块-房产-华南区-华南区-广州-广州-销售七组-组员');
INSERT INTO `table 33` VALUES ('9C74DF835B70', '刘清雯', '56493', '销售', '0', '4016', '互联网板块-房产-华南区-华南区-广州-广州-销售七组-组员');
INSERT INTO `table 33` VALUES ('E54164B3C9E4', '贾源', '56564', '销售', '0', '4016', '互联网板块-房产-华南区-华南区-广州-广州-销售七组-组员');
INSERT INTO `table 33` VALUES ('82FACE66BAD5', '魏琳', '50454', '销售', '0', '4016', '互联网板块-房产-华南区-华南区-广州-广州-销售七组-组员');
INSERT INTO `table 33` VALUES ('051F22ED0FC9', '赵万能', '36117', '销售', '0', '4016', '互联网板块-房产-华南区-华南区-广州-广州-销售七组-组员');
INSERT INTO `table 33` VALUES ('C3B47EED6558', '洪莉娜', '52768', '销售', '0', '4016', '互联网板块-房产-华南区-华南区-广州-广州-销售七组-组员');
INSERT INTO `table 33` VALUES ('0D6C945F04B7', '伍世勇', '38291', '销售', '0', '4016', '互联网板块-房产-华南区-华南区-广州-广州-销售七组-组员');
INSERT INTO `table 33` VALUES ('FB4097D7D6D3', '钟洪', '38113', '销售', '0', '4018', '互联网板块-房产-华南区-华南区-广州-广州-销售八组-组员');
INSERT INTO `table 33` VALUES ('2DFE2CC9CED4', '梁彩珍', '55603', '销售', '0', '4018', '互联网板块-房产-华南区-华南区-广州-广州-销售八组-组员');
INSERT INTO `table 33` VALUES ('47ADEA5CFA83', '卢思敏', '50400', '销售', '0', '4018', '互联网板块-房产-华南区-华南区-广州-广州-销售八组-组员');
INSERT INTO `table 33` VALUES ('B88E3E3AFD05', '廖巧茹', '56517', '销售', '0', '4018', '互联网板块-房产-华南区-华南区-广州-广州-销售八组-组员');
INSERT INTO `table 33` VALUES ('82FAE1B0CC41', '姚振生', '50458', '销售', '0', '4018', '互联网板块-房产-华南区-华南区-广州-广州-销售八组-组员');
INSERT INTO `table 33` VALUES ('3DD7E1180D51', '黄源周', '54355', '销售', '0', '4018', '互联网板块-房产-华南区-华南区-广州-广州-销售八组-组员');
INSERT INTO `table 33` VALUES ('0BBAF3823163', '刘帅廷', '34795', '销售', '0', '4018', '互联网板块-房产-华南区-华南区-广州-广州-销售八组-组员');
INSERT INTO `table 33` VALUES ('0D6CAC3CA191', '戴云飞', '38290', '销售', '0', '4018', '互联网板块-房产-华南区-华南区-广州-广州-销售八组-组员');
INSERT INTO `table 33` VALUES ('7D1EF9586EB7', '潘明君', '54393', '销售', '0', '4022', '互联网板块-房产-华南区-华南区-深圳-深圳-销售四组-组员');
INSERT INTO `table 33` VALUES ('C5042EEFC95C', '叶昭雪', '34341', '销售', '0', '4022', '互联网板块-房产-华南区-华南区-深圳-深圳-销售四组-组员');
INSERT INTO `table 33` VALUES ('FF6DDC499EC1', '邓小亮56541', '56541', '销售', '0', '4022', '互联网板块-房产-华南区-华南区-深圳-深圳-销售四组-组员');
INSERT INTO `table 33` VALUES ('FB246ED13EBD', '黄银卿', '33129', '销售', '0', '4022', '互联网板块-房产-华南区-华南区-深圳-深圳-销售四组-组员');
INSERT INTO `table 33` VALUES ('5CDFB0B0F1A1', '瞿斌', '38190', '销售', '0', '4024', '互联网板块-房产-华南区-华南区-深圳-深圳-销售五组-组员');
INSERT INTO `table 33` VALUES ('64FA0102EEE9', '徐秋实', '35319', '销售', '0', '4024', '互联网板块-房产-华南区-华南区-深圳-深圳-销售五组-组员');
INSERT INTO `table 33` VALUES ('05B71FC73F12', '李志伟38296', '38296', '销售', '0', '4024', '互联网板块-房产-华南区-华南区-深圳-深圳-销售五组-组员');
INSERT INTO `table 33` VALUES ('05B7AD532299', '毛维成', '50304', '销售', '0', '4024', '互联网板块-房产-华南区-华南区-深圳-深圳-销售五组-组员');
INSERT INTO `table 33` VALUES ('1A9FF138DFD6', '于海涛', '54313', '销售', '0', '4024', '互联网板块-房产-华南区-华南区-深圳-深圳-销售五组-组员');
INSERT INTO `table 33` VALUES ('04988E7EA540', '刘丹', '32086', '销售', '0', '4024', '互联网板块-房产-华南区-华南区-深圳-深圳-销售五组-组员');
INSERT INTO `table 33` VALUES ('26B44C708301', '章伟', '50324', '销售', '0', '4026', '互联网板块-房产-华南区-华南区-深圳-深圳-销售六组-组员');
INSERT INTO `table 33` VALUES ('4CFE48A6D382', '吴让前', '50394', '销售', '0', '4026', '互联网板块-房产-华南区-华南区-深圳-深圳-销售六组-组员');
INSERT INTO `table 33` VALUES ('E09AD6B02CE0', '王思瑶38254', '38254', '销售', '0', '4026', '互联网板块-房产-华南区-华南区-深圳-深圳-销售六组-组员');
INSERT INTO `table 33` VALUES ('7FFC9EA4FDC2', '齐文洁', '55634', '销售', '0', '4026', '互联网板块-房产-华南区-华南区-深圳-深圳-销售六组-组员');
INSERT INTO `table 33` VALUES ('3CD740D3CB46', '徐卓瑶', '54342', '销售', '0', '4026', '互联网板块-房产-华南区-华南区-深圳-深圳-销售六组-组员');
INSERT INTO `table 33` VALUES ('DE195FA1D924', '安伟松', '39282', '销售', '0', '4027', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `table 33` VALUES ('A3A82B58FE31', '卢林', '35525', '销售', '0', '4027', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `table 33` VALUES ('246B51B9BACF', '张阳', '35521', '销售', '0', '4027', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `table 33` VALUES ('A09E5A7BB381', '刘振35694', '35694', '销售', '0', '4027', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `table 33` VALUES ('AC48488A3106', '雷玉梅', '35522', '销售', '0', '4027', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `table 33` VALUES ('0A1F5C26CC11', '邓弘立', '35516', '销售', '0', '4027', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `table 33` VALUES ('9F12DDA57CF2', '王燕飞39100', '39100', '销售', '0', '4027', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `table 33` VALUES ('3B889CEBA4D3', '秦亚楠', '51234', '销售', '0', '4029', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `table 33` VALUES ('21299E599092', '田丽53809', '53809', '销售', '0', '4030', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `table 33` VALUES ('EFA977875AA5', '陈军进', '37112', '销售', '0', '4030', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `table 33` VALUES ('520D853CCAB9', '张家彬', '53855', '销售', '0', '4030', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `table 33` VALUES ('2EAD89DDF641', '顾巍巍', '39151', '销售', '0', '4030', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `table 33` VALUES ('DD11BF584DF5', '王晓芳', '39136', '销售', '0', '4030', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `table 33` VALUES ('1326FD2D34D4', '刘泽波', '39154', '销售', '0', '4032', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `table 33` VALUES ('A012F4A1D205', '张德玉', '39232', '销售', '0', '4032', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `table 33` VALUES ('3B8901C90FD7', '郝伟', '51254', '销售', '0', '4032', '互联网板块-房产-联合区-联合区-郑州-郑州');
INSERT INTO `table 33` VALUES ('4F7C6A8016E7', '孟艳荣', '51249', '销售', '0', '4037', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售二组-组员');
INSERT INTO `table 33` VALUES ('4F7C514DE452', '高慧', '51259', '销售', '0', '4037', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售二组-组员');
INSERT INTO `table 33` VALUES ('9A3D3436F997', '王丹丹', '56155', '销售', '0', '4037', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售二组-组员');
INSERT INTO `table 33` VALUES ('9A3D4C49E140', '邢强', '56199', '销售', '0', '4037', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售二组-组员');
INSERT INTO `table 33` VALUES ('3E3F97DC2D06', '特日根', '53831', '销售', '0', '4037', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售二组-组员');
INSERT INTO `table 33` VALUES ('613B06E772D8', '张晓娜', '37161', '销售', '0', '4037', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售二组-组员');
INSERT INTO `table 33` VALUES ('192AAB61BF68', '孙文', '53816', '销售', '0', '4037', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售二组-组员');
INSERT INTO `table 33` VALUES ('E09D7C6F5B96', '马国超', '39255', '销售', '0', '4037', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售二组-组员');
INSERT INTO `table 33` VALUES ('E4EEC5588461', '张晓迪', '39128', '销售', '0', '4037', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售二组-组员');
INSERT INTO `table 33` VALUES ('2FA8EE6CA155', '武建军', '51220', '销售', '0', '4039', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售三组-组员');
INSERT INTO `table 33` VALUES ('B5E89CD06EB6', '刘杰瑞', '55052', '销售', '0', '4039', '互联网板块-房产-联合区-联合区-呼和浩特-呼和浩特-销售三组-组员');
INSERT INTO `table 33` VALUES ('191044EFFAD6', '付梦云', '35982', '销售', '0', '4041', '互联网板块-房产-联合区-联合区-南昌-南昌-销售二组-组员');
INSERT INTO `table 33` VALUES ('495138000CF3', '朱明富', '37154', '销售', '0', '4041', '互联网板块-房产-联合区-联合区-南昌-南昌-销售二组-组员');
INSERT INTO `table 33` VALUES ('5A4205A6C211', '鲁志亮', '38305', '销售', '0', '4041', '互联网板块-房产-联合区-联合区-南昌-南昌-销售二组-组员');
INSERT INTO `table 33` VALUES ('2665F7DF0201', '张伟伟', '54875', '销售', '0', '4043', '互联网板块-房产-苏南区-苏南-南通-南通-销售二组-组员');
INSERT INTO `table 33` VALUES ('90FF788E0398', '吕松霖', '53576', '销售', '0', '4043', '互联网板块-房产-苏南区-苏南-南通-南通-销售二组-组员');
INSERT INTO `table 33` VALUES ('71E7B533E114', '龚成成', '51744', '销售', '0', '4043', '互联网板块-房产-苏南区-苏南-南通-南通-销售二组-组员');
INSERT INTO `table 33` VALUES ('2DBF0783AC64', '吴倩', '37332', '销售', '0', '4043', '互联网板块-房产-苏南区-苏南-南通-南通-销售二组-组员');
INSERT INTO `table 33` VALUES ('3151B026C969', '成志祥', '51720', '销售', '0', '4043', '互联网板块-房产-苏南区-苏南-南通-南通-销售二组-组员');
INSERT INTO `table 33` VALUES ('912E95DA7E62', '徐轩', '53594', '销售', '0', '4043', '互联网板块-房产-苏南区-苏南-南通-南通-销售二组-组员');
INSERT INTO `table 33` VALUES ('508323661C15', '钱江', '54892', '销售', '0', '4047', '互联网板块-房产-苏南区-苏南-南通-南通-销售三组-组员');
INSERT INTO `table 33` VALUES ('181144CBB3A2', '王露37039', '37039', '销售', '0', '4047', '互联网板块-房产-苏南区-苏南-南通-南通-销售三组-组员');
INSERT INTO `table 33` VALUES ('BD0BBA480E89', '陈彦均', '51792', '销售', '0', '4047', '互联网板块-房产-苏南区-苏南-南通-南通-销售三组-组员');
INSERT INTO `table 33` VALUES ('DD69941ADD81', '韩佳玢', '54937', '销售', '0', '4047', '互联网板块-房产-苏南区-苏南-南通-南通-销售三组-组员');
INSERT INTO `table 33` VALUES ('6C784E464B71', '曹长青', '51734', '销售', '0', '4047', '互联网板块-房产-苏南区-苏南-南通-南通-销售三组-组员');
INSERT INTO `table 33` VALUES ('AD1718CC7E68', '华竹佳', '51193', '销售', '0', '4049', '互联网板块-房产-无锡-无锡-无锡-无锡-销售四组-组员');
INSERT INTO `table 33` VALUES ('B65CE6ACB300', '蒋纯文', '52857', '销售', '0', '4049', '互联网板块-房产-无锡-无锡-无锡-无锡-销售四组-组员');
INSERT INTO `table 33` VALUES ('C393B5784560', '惠津桦', '51155', '销售', '0', '4049', '互联网板块-房产-无锡-无锡-无锡-无锡-销售四组-组员');
INSERT INTO `table 33` VALUES ('BE3D26BD3434', '秦汉', '52869', '销售', '0', '4049', '互联网板块-房产-无锡-无锡-无锡-无锡-销售四组-组员');
INSERT INTO `table 33` VALUES ('06553BF333A3', '郑江明', '36223', '销售', '0', '4049', '互联网板块-房产-无锡-无锡-无锡-无锡-销售四组-组员');
INSERT INTO `table 33` VALUES ('81E4994B7D62', '于学仕', '34985', '销售', '0', '4052', '互联网板块-房产-武汉-武汉-武汉-武汉-销售二组-组员');
INSERT INTO `table 33` VALUES ('22D41D4B3ED5', '胡时佳', '38445', '销售', '0', '4052', '互联网板块-房产-武汉-武汉-武汉-武汉-销售二组-组员');
INSERT INTO `table 33` VALUES ('26B2A7ACF0A3', '郭冰琤', '38326', '销售', '0', '4052', '互联网板块-房产-武汉-武汉-武汉-武汉-销售二组-组员');
INSERT INTO `table 33` VALUES ('103BCF936C91', '王晶', '50503', '销售', '0', '4052', '互联网板块-房产-武汉-武汉-武汉-武汉-销售二组-组员');
INSERT INTO `table 33` VALUES ('13E6F011EF51', '沈来源', '50543', '销售', '0', '4052', '互联网板块-房产-武汉-武汉-武汉-武汉-销售二组-组员');
INSERT INTO `table 33` VALUES ('31CDCBE8F603', '艾敬', '58105', '销售', '0', '4052', '互联网板块-房产-武汉-武汉-武汉-武汉-销售二组-组员');
INSERT INTO `table 33` VALUES ('37CE5E66A503', '田刚', '34675', '销售', '0', '4052', '互联网板块-房产-武汉-武汉-武汉-武汉-销售二组-组员');
INSERT INTO `table 33` VALUES ('2911758896B4', '刘明洁', '38447', '销售', '0', '4052', '互联网板块-房产-武汉-武汉-武汉-武汉-销售二组-组员');
INSERT INTO `table 33` VALUES ('145C53077032', '张泰秋　', '38367', '销售', '0', '4054', '互联网板块-房产-武汉-武汉-武汉-武汉-销售三组-组员');
INSERT INTO `table 33` VALUES ('BD2C2249E5B5', '曹佳思', '38413', '销售', '0', '4054', '互联网板块-房产-武汉-武汉-武汉-武汉-销售三组-组员');
INSERT INTO `table 33` VALUES ('878C6A9AE95D', '韩莉娟', '32081', '销售', '0', '4054', '互联网板块-房产-武汉-武汉-武汉-武汉-销售三组-组员');
INSERT INTO `table 33` VALUES ('1F3256788B47', '徐静', '32120', '销售', '0', '4054', '互联网板块-房产-武汉-武汉-武汉-武汉-销售三组-组员');
INSERT INTO `table 33` VALUES ('C4A4151820D9', '晏丹', '31199', '销售', '0', '4054', '互联网板块-房产-武汉-武汉-武汉-武汉-销售三组-组员');
INSERT INTO `table 33` VALUES ('C3A7D95DA444', '邹雅雪', '38334', '销售', '0', '4056', '互联网板块-房产-武汉-武汉-武汉-武汉-销售六组-组员');
INSERT INTO `table 33` VALUES ('46F01F783874', '张莉36621', '36621', '销售', '0', '4056', '互联网板块-房产-武汉-武汉-武汉-武汉-销售六组-组员');
INSERT INTO `table 33` VALUES ('CE35FFEE00D6', '张辉', '38496', '销售', '0', '4056', '互联网板块-房产-武汉-武汉-武汉-武汉-销售六组-组员');
INSERT INTO `table 33` VALUES ('530173960D96', '王舒伟', '50512', '销售', '0', '4056', '互联网板块-房产-武汉-武汉-武汉-武汉-销售六组-组员');
INSERT INTO `table 33` VALUES ('13E6F9E9D358', '吴霄', '50544', '销售', '0', '4056', '互联网板块-房产-武汉-武汉-武汉-武汉-销售六组-组员');
INSERT INTO `table 33` VALUES ('D6284E8DAD94', '孙文涛', '33078', '销售', '0', '4056', '互联网板块-房产-武汉-武汉-武汉-武汉-销售六组-组员');
INSERT INTO `table 33` VALUES ('AC551EE7FCE6', '陈金文', '50568', '销售', '0', '4056', '互联网板块-房产-武汉-武汉-武汉-武汉-销售六组-组员');
INSERT INTO `table 33` VALUES ('C2C91FDFD4F8', '王冶青', '34312', '销售', '0', '4056', '互联网板块-房产-武汉-武汉-武汉-武汉-销售六组-组员');
INSERT INTO `table 33` VALUES ('9A550EDA8A51', '叶华英', '38477', '销售', '0', '4056', '互联网板块-房产-武汉-武汉-武汉-武汉-销售六组-组员');
INSERT INTO `table 33` VALUES ('7.37516E+11', '黄冠', '36749', '销售', '0', '4056', '互联网板块-房产-武汉-武汉-武汉-武汉-销售六组-组员');
INSERT INTO `table 33` VALUES ('37CE2A6D1FD0', '朱彧', '38368', '销售', '0', '4056', '互联网板块-房产-武汉-武汉-武汉-武汉-销售六组-组员');
INSERT INTO `table 33` VALUES ('80E385E257FA', '王宽', '32858', '销售', '0', '4056', '互联网板块-房产-武汉-武汉-武汉-武汉-销售六组-组员');
INSERT INTO `table 33` VALUES ('B28E6536D528', '杨望', '51936', '销售', '0', '4058', '互联网板块-房产-长沙-长沙-长沙-长沙-销售五组-销售员');
INSERT INTO `table 33` VALUES ('732BA95540D5', '董国彬', '51928', '销售', '0', '4058', '互联网板块-房产-长沙-长沙-长沙-长沙-销售五组-销售员');
INSERT INTO `table 33` VALUES ('732B8A3429B0', '肖鸣', '51926', '销售', '0', '4058', '互联网板块-房产-长沙-长沙-长沙-长沙-销售五组-销售员');
INSERT INTO `table 33` VALUES ('3A9404F12FB8', '魏凯51915', '51915', '销售', '0', '4058', '互联网板块-房产-长沙-长沙-长沙-长沙-销售五组-销售员');
INSERT INTO `table 33` VALUES ('732BBF3330A5', '邓孟', '51929', '销售', '0', '4058', '互联网板块-房产-长沙-长沙-长沙-长沙-销售五组-销售员');
INSERT INTO `table 33` VALUES ('800E099CF2D5', '陈淡淡', '54218', '销售', '0', '4058', '互联网板块-房产-长沙-长沙-长沙-长沙-销售五组-销售员');
INSERT INTO `table 33` VALUES ('9E3083B398B8', '袁湘', '54227', '销售', '0', '4058', '互联网板块-房产-长沙-长沙-长沙-长沙-销售五组-销售员');
INSERT INTO `table 33` VALUES ('C61CC814D623', '曾申', '38412', '销售', '0', '4058', '互联网板块-房产-长沙-长沙-长沙-长沙-销售五组-销售员');
INSERT INTO `table 33` VALUES ('800E05BBEF06', '曾丰', '54216', '销售', '0', '4058', '互联网板块-房产-长沙-长沙-长沙-长沙-销售五组-销售员');
INSERT INTO `table 33` VALUES ('1F73F9E54F64', '石曼', '54260', '销售', '0', '4058', '互联网板块-房产-长沙-长沙-长沙-长沙-销售五组-销售员');
INSERT INTO `table 33` VALUES ('778EDA484F42', '覃文涛', '38313', '销售', '0', '4058', '互联网板块-房产-长沙-长沙-长沙-长沙-销售五组-销售员');
INSERT INTO `table 33` VALUES ('1F73F6EFB163', '李想', '54257', '销售', '0', '4058', '互联网板块-房产-长沙-长沙-长沙-长沙-销售五组-销售员');
INSERT INTO `table 33` VALUES ('911CC63BA656', '丁青云', '51933', '销售', '0', '4060', '互联网板块-房产-长沙-长沙-长沙-长沙-销售六组-销售员');
INSERT INTO `table 33` VALUES ('D9AFD36E5582', '肖金元', '51956', '销售', '0', '4060', '互联网板块-房产-长沙-长沙-长沙-长沙-销售六组-销售员');
INSERT INTO `table 33` VALUES ('90D5A558CCC7', '刘潇荻', '51978', '销售', '0', '4060', '互联网板块-房产-长沙-长沙-长沙-长沙-销售六组-销售员');
INSERT INTO `table 33` VALUES ('02052571A420', '谭妙红', '54251', '销售', '0', '4060', '互联网板块-房产-长沙-长沙-长沙-长沙-销售六组-销售员');
INSERT INTO `table 33` VALUES ('020528CFE958', '曹菁', '54243', '销售', '0', '4060', '互联网板块-房产-长沙-长沙-长沙-长沙-销售六组-销售员');
INSERT INTO `table 33` VALUES ('39266F238530', '邓胡娟', '33386', '销售', '0', '4060', '互联网板块-房产-长沙-长沙-长沙-长沙-销售六组-销售员');
INSERT INTO `table 33` VALUES ('A5B517B2E327', '刘江', '54235', '销售', '0', '4060', '互联网板块-房产-长沙-长沙-长沙-长沙-销售六组-销售员');
INSERT INTO `table 33` VALUES ('02052C4823F1', '侯志宏', '54249', '销售', '0', '4060', '互联网板块-房产-长沙-长沙-长沙-长沙-销售六组-销售员');
INSERT INTO `table 33` VALUES ('C6382A2FBCA8', '王曙煜', '38582', '销售', '0', '4062', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售四组-销售员');
INSERT INTO `table 33` VALUES ('9A61152757E5', '楼霖', '38664', '销售', '0', '4062', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售四组-销售员');
INSERT INTO `table 33` VALUES ('10265CE0C0C7', '王成君', '38603', '销售', '0', '4063', '互联网板块-房产-浙闽区-福建-福州-福州-销售一组-组员');
INSERT INTO `table 33` VALUES ('1026A490C9B4', '范丽琴', '38606', '销售', '0', '4063', '互联网板块-房产-浙闽区-福建-福州-福州-销售一组-组员');
INSERT INTO `table 33` VALUES ('10268D9CEA58', '王陶', '38605', '销售', '0', '4063', '互联网板块-房产-浙闽区-福建-福州-福州-销售一组-组员');
INSERT INTO `table 33` VALUES ('FFE58745C2B5', '倪婷', '54691', '销售', '0', '4063', '互联网板块-房产-浙闽区-福建-福州-福州-销售一组-组员');
INSERT INTO `table 33` VALUES ('D41B8E283701', '陈晓林', '57430', '销售', '0', '4063', '互联网板块-房产-浙闽区-福建-福州-福州-销售一组-组员');
INSERT INTO `table 33` VALUES ('1026736A1BD7', '洪瑜舒', '38604', '销售', '0', '4063', '互联网板块-房产-浙闽区-福建-福州-福州-销售一组-组员');
INSERT INTO `table 33` VALUES ('10273833EE87', '陈渊', '38608', '销售', '0', '4063', '互联网板块-房产-浙闽区-福建-福州-福州-销售一组-组员');
INSERT INTO `table 33` VALUES ('1026BD61C694', '林建立', '38607', '销售', '0', '4065', '互联网板块-房产-浙闽区-福建-福州-福州-销售二组-组员');
INSERT INTO `table 33` VALUES ('D207CBDFEC90', '施向薇', '50637', '销售', '0', '4065', '互联网板块-房产-浙闽区-福建-福州-福州-销售二组-组员');
INSERT INTO `table 33` VALUES ('26CBDBB301D8', '杨碧兰', '38637', '销售', '0', '4068', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售一组-组员');
INSERT INTO `table 33` VALUES ('26CBC8C7B718', '林宝琴', '38638', '销售', '0', '4068', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售一组-组员');
INSERT INTO `table 33` VALUES ('9ADA31DCF795', '黄国铭', '38692', '销售', '0', '4068', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售一组-组员');
INSERT INTO `table 33` VALUES ('ABC43F451F61', '王文欣', '50612', '销售', '0', '4068', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售一组-组员');
INSERT INTO `table 33` VALUES ('6A8C590434C6', '卓宜旭', '57472', '销售', '0', '4068', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售一组-组员');
INSERT INTO `table 33` VALUES ('38A35CD8A890', '肖佳佳', '54719', '销售', '0', '4070', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售二组-组员');
INSERT INTO `table 33` VALUES ('8FEDB32651C3', '谢涛', '38688', '销售', '0', '4070', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售二组-组员');
INSERT INTO `table 33` VALUES ('CB1C55BC5E80', '黄志钦', '57431', '销售', '0', '4070', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售二组-组员');
INSERT INTO `table 33` VALUES ('CD17F7AE2AD8', '陈翠', '39589', '销售', '0', '4072', '互联网板块-房产-重庆-重庆-重庆-重庆-销售四组-销售员');
INSERT INTO `table 33` VALUES ('70C7C99E8EA0', '曾婷', '34555', '销售', '0', '4072', '互联网板块-房产-重庆-重庆-重庆-重庆-销售四组-销售员');
INSERT INTO `table 33` VALUES ('9B95F3DBC837', '王娟1', '56076', '销售', '0', '4072', '互联网板块-房产-重庆-重庆-重庆-重庆-销售四组-销售员');
INSERT INTO `table 33` VALUES ('D961E81C2029', '陈利', '36133', '销售', '0', '4072', '互联网板块-房产-重庆-重庆-重庆-重庆-销售四组-销售员');
INSERT INTO `table 33` VALUES ('7B4CD675B7E3', '陶佳', '39561', '销售', '0', '4072', '互联网板块-房产-重庆-重庆-重庆-重庆-销售四组-销售员');
INSERT INTO `table 33` VALUES ('34BC3B45D1E9', '罗颖1', '54840', '销售', '0', '4072', '互联网板块-房产-重庆-重庆-重庆-重庆-销售四组-销售员');
INSERT INTO `table 33` VALUES ('DB6E45300B63', '陆莉', '34733', '销售', '0', '4072', '互联网板块-房产-重庆-重庆-重庆-重庆-销售四组-销售员');
INSERT INTO `table 33` VALUES ('B13E5534F5B2', '胡蓉', '39586', '销售', '0', '4072', '互联网板块-房产-重庆-重庆-重庆-重庆-销售四组-销售员');
INSERT INTO `table 33` VALUES ('26E6066BD4F9', '谭巧君', '39544', '销售', '0', '4074', '互联网板块-房产-重庆-重庆-重庆-重庆-销售五组-销售员');
INSERT INTO `table 33` VALUES ('17985666F004', '左涛', '36127', '销售', '0', '4074', '互联网板块-房产-重庆-重庆-重庆-重庆-销售五组-销售员');
INSERT INTO `table 33` VALUES ('CCE35B2A4277', '杨菲', '51691', '销售', '0', '4074', '互联网板块-房产-重庆-重庆-重庆-重庆-销售五组-销售员');
INSERT INTO `table 33` VALUES ('A816CDC412B0', '谢燕林39582', '39582', '销售', '0', '4074', '互联网板块-房产-重庆-重庆-重庆-重庆-销售五组-销售员');
INSERT INTO `table 33` VALUES ('8FF6B02B55F0', '谢谭阳', '54182', '销售', '0', '4074', '互联网板块-房产-重庆-重庆-重庆-重庆-销售五组-销售员');
INSERT INTO `table 33` VALUES ('045B274B2D82', '敖琴', '51600', '销售', '0', '4074', '互联网板块-房产-重庆-重庆-重庆-重庆-销售五组-销售员');
INSERT INTO `table 33` VALUES ('7882121A7A30', '刘守彥', '39513', '销售', '0', '4074', '互联网板块-房产-重庆-重庆-重庆-重庆-销售五组-销售员');
INSERT INTO `table 33` VALUES ('FB61A3A00AA0', '谢溧琦', '56100', '销售', '0', '4074', '互联网板块-房产-重庆-重庆-重庆-重庆-销售五组-销售员');
INSERT INTO `table 33` VALUES ('8FF66D7719D9', '胡腾', '54189', '销售', '0', '4076', '互联网板块-房产-重庆-重庆-重庆-重庆-销售六组-组员');
INSERT INTO `table 33` VALUES ('63C8549D2954', '王雅萱', '56057', '销售', '0', '4076', '互联网板块-房产-重庆-重庆-重庆-重庆-销售六组-组员');
INSERT INTO `table 33` VALUES ('9E016E593725', '杨峻烨', '56068', '销售', '0', '4076', '互联网板块-房产-重庆-重庆-重庆-重庆-销售六组-组员');
INSERT INTO `table 33` VALUES ('D961A045E686', '郭昭红', '54817', '销售', '0', '4076', '互联网板块-房产-重庆-重庆-重庆-重庆-销售六组-组员');
INSERT INTO `table 33` VALUES ('482F6AF38199', '陈应', '37384', '销售', '0', '4076', '互联网板块-房产-重庆-重庆-重庆-重庆-销售六组-组员');
INSERT INTO `table 33` VALUES ('1DA5A7EE6510', '唐宇', '39541', '销售', '0', '4076', '互联网板块-房产-重庆-重庆-重庆-重庆-销售六组-组员');
INSERT INTO `table 33` VALUES ('1FEE66E2B4E3', '黄念', '51694', '销售', '0', '4076', '互联网板块-房产-重庆-重庆-重庆-重庆-销售六组-组员');
INSERT INTO `table 33` VALUES ('804DF7D94BAD', '张凯', '33360', '销售', '0', '4076', '互联网板块-房产-重庆-重庆-重庆-重庆-销售六组-组员');
INSERT INTO `table 33` VALUES ('3B722970B2C2', '袁静', '51640', '销售', '0', '4076', '互联网板块-房产-重庆-重庆-重庆-重庆-销售六组-组员');
INSERT INTO `table 33` VALUES ('D5FF28A35FA1', '杜双', '51679', '销售', '0', '4076', '互联网板块-房产-重庆-重庆-重庆-重庆-销售六组-组员');
INSERT INTO `table 33` VALUES ('3B7215A8BE23', '李超36683', '36683', '销售', '0', '4078', '互联网板块-房产-重庆-重庆-重庆-重庆-销售七组-组员');
INSERT INTO `table 33` VALUES ('617E31A9E64A', '王莲莲', '35840', '销售', '0', '4078', '互联网板块-房产-重庆-重庆-重庆-重庆-销售七组-组员');
INSERT INTO `table 33` VALUES ('71C35C32B7B0', '颜欣', '39557', '销售', '0', '4078', '互联网板块-房产-重庆-重庆-重庆-重庆-销售七组-组员');
INSERT INTO `table 33` VALUES ('86C85F1EEA45', '周雯霞', '51655', '销售', '0', '4078', '互联网板块-房产-重庆-重庆-重庆-重庆-销售七组-组员');
INSERT INTO `table 33` VALUES ('8FF6D6B6C318', '刘纲', '54114', '销售', '0', '4078', '互联网板块-房产-重庆-重庆-重庆-重庆-销售七组-组员');
INSERT INTO `table 33` VALUES ('CC00AC5BEB38', '张琴', '56091', '销售', '0', '4078', '互联网板块-房产-重庆-重庆-重庆-重庆-销售七组-组员');
INSERT INTO `table 33` VALUES ('ECBDD0094C16', '吴晓薇36559', '36559', '销售', '0', '4078', '互联网板块-房产-重庆-重庆-重庆-重庆-销售七组-组员');
INSERT INTO `table 33` VALUES ('E4023DCB8BF2', '周娅', '56094', '销售', '0', '4078', '互联网板块-房产-重庆-重庆-重庆-重庆-销售七组-组员');
INSERT INTO `table 33` VALUES ('8FF66963D098', '周径竹', '54751', '销售', '0', '4078', '互联网板块-房产-重庆-重庆-重庆-重庆-销售七组-组员');
INSERT INTO `table 33` VALUES ('9C07FD462234', '魏兴利', '39574', '销售', '0', '4078', '互联网板块-房产-重庆-重庆-重庆-重庆-销售七组-组员');
INSERT INTO `table 33` VALUES ('D9619A5B61A6', '谭丽娟', '54816', '销售', '0', '4080', '互联网板块-房产-重庆-重庆-重庆-重庆-销售八组-组员');
INSERT INTO `table 33` VALUES ('C866F6B4C976', '张爱迪', '32734', '销售', '0', '4080', '互联网板块-房产-重庆-重庆-重庆-重庆-销售八组-组员');
INSERT INTO `table 33` VALUES ('FD955B1E1C87', '彭维', '51681', '销售', '0', '4080', '互联网板块-房产-重庆-重庆-重庆-重庆-销售八组-组员');
INSERT INTO `table 33` VALUES ('CC00B606FDD7', '曾涛', '56092', '销售', '0', '4080', '互联网板块-房产-重庆-重庆-重庆-重庆-销售八组-组员');
INSERT INTO `table 33` VALUES ('8FF6A3D15153', '宋文芳', '54113', '销售', '0', '4080', '互联网板块-房产-重庆-重庆-重庆-重庆-销售八组-组员');
INSERT INTO `table 33` VALUES ('CCE397C43FF8', '李阳', '37292', '销售', '0', '4080', '互联网板块-房产-重庆-重庆-重庆-重庆-销售八组-组员');
INSERT INTO `table 33` VALUES ('BFA63624B236', '廖红英', '51677', '销售', '0', '4080', '互联网板块-房产-重庆-重庆-重庆-重庆-销售八组-组员');
INSERT INTO `table 33` VALUES ('BBE276D2C552', '邓世伟', '39584', '销售', '0', '4080', '互联网板块-房产-重庆-重庆-重庆-重庆-销售八组-组员');
INSERT INTO `table 33` VALUES ('A6A7234F9CD3', '郭莉', '39577', '销售', '0', '4080', '互联网板块-房产-重庆-重庆-重庆-重庆-销售八组-组员');
INSERT INTO `table 33` VALUES ('2935B6639BC7', '赵莹莹', '34987', '销售', '0', '4082', '互联网板块-房产-重庆-重庆-重庆-重庆-销售九组-组员');
INSERT INTO `table 33` VALUES ('5C3035E0C6A6', '若扎·木哈什', '54112', '销售', '0', '4082', '互联网板块-房产-重庆-重庆-重庆-重庆-销售九组-组员');
INSERT INTO `table 33` VALUES ('6B7A3DED6CDE', '杨富裕', '32671', '销售', '0', '4082', '互联网板块-房产-重庆-重庆-重庆-重庆-销售九组-组员');
INSERT INTO `table 33` VALUES ('732C6CE1B799', '刘念', '51645', '销售', '0', '4082', '互联网板块-房产-重庆-重庆-重庆-重庆-销售九组-组员');
INSERT INTO `table 33` VALUES ('86C8488725D8', '袁可欣', '51653', '销售', '0', '4082', '互联网板块-房产-重庆-重庆-重庆-重庆-销售九组-组员');
INSERT INTO `table 33` VALUES ('86C873DB9858', '刘岚', '51656', '销售', '0', '4082', '互联网板块-房产-重庆-重庆-重庆-重庆-销售九组-组员');
INSERT INTO `table 33` VALUES ('8EF1CFCFE193', '梁艳', '39570', '销售', '0', '4082', '互联网板块-房产-重庆-重庆-重庆-重庆-销售九组-组员');
INSERT INTO `table 33` VALUES ('FD95A175F956', '周子航', '51682', '销售', '0', '4082', '互联网板块-房产-重庆-重庆-重庆-重庆-销售九组-组员');
INSERT INTO `table 33` VALUES ('FB3FD320D2D1', '刘亚玲', '32929', '销售', '0', '4082', '互联网板块-房产-重庆-重庆-重庆-重庆-销售九组-组员');
INSERT INTO `table 33` VALUES ('36316D8FAA34', '李念', '54111', '销售', '0', '4082', '互联网板块-房产-重庆-重庆-重庆-重庆-销售九组-组员');
INSERT INTO `table 33` VALUES ('63C83425B462', '李卫川1', '54846', '销售', '0', '4082', '互联网板块-房产-重庆-重庆-重庆-重庆-销售九组-组员');
INSERT INTO `table 33` VALUES ('B13E35AED679', '向婷婷', '39585', '销售', '0', '4082', '互联网板块-房产-重庆-重庆-重庆-重庆-销售九组-组员');
INSERT INTO `table 33` VALUES ('A6A73964FF70', '叶小龙', '39578', '销售', '0', '4082', '互联网板块-房产-重庆-重庆-重庆-重庆-销售九组-组员');
INSERT INTO `table 33` VALUES ('98291D2FA1A8', '邵帅', '51660', '销售', '0', '4082', '互联网板块-房产-重庆-重庆-重庆-重庆-销售九组-组员');
INSERT INTO `table 33` VALUES ('6792DC14A7F2', '谭娜', '56106', '销售', '0', '4082', '互联网板块-房产-重庆-重庆-重庆-重庆-销售九组-组员');
INSERT INTO `table 33` VALUES ('3FA4E8020CE7', '刘兰佳', '39547', '销售', '0', '4084', '互联网板块-房产-重庆-重庆-重庆-重庆-销售十组-组员');
INSERT INTO `table 33` VALUES ('FB3F5A0FD089', '李娟39594', '39594', '销售', '0', '4084', '互联网板块-房产-重庆-重庆-重庆-重庆-销售十组-组员');
INSERT INTO `table 33` VALUES ('5BEB94723D18', '郭琴', '54834', '销售', '0', '4084', '互联网板块-房产-重庆-重庆-重庆-重庆-销售十组-组员');
INSERT INTO `table 33` VALUES ('751296437D88', '杨成红', '56064', '销售', '0', '4084', '互联网板块-房产-重庆-重庆-重庆-重庆-销售十组-组员');
INSERT INTO `table 33` VALUES ('9E0172A2E080', '冯佳', '56080', '销售', '0', '4084', '互联网板块-房产-重庆-重庆-重庆-重庆-销售十组-组员');
INSERT INTO `table 33` VALUES ('34BC34E74FF7', '向梦妮', '54838', '销售', '0', '4084', '互联网板块-房产-重庆-重庆-重庆-重庆-销售十组-组员');
INSERT INTO `table 33` VALUES ('6375467CC355', '曾于兰', '33174', '销售', '0', '4084', '互联网板块-房产-重庆-重庆-重庆-重庆-销售十组-组员');
INSERT INTO `table 33` VALUES ('FB3F83470414', '甘玲', '39595', '销售', '0', '4084', '互联网板块-房产-重庆-重庆-重庆-重庆-销售十组-组员');
INSERT INTO `table 33` VALUES ('FB3FAF4F49D8', '周程然39597', '39597', '销售', '0', '4084', '互联网板块-房产-重庆-重庆-重庆-重庆-销售十组-组员');
INSERT INTO `table 33` VALUES ('D96127882A24', '李巍', '54753', '销售', '0', '4084', '互联网板块-房产-重庆-重庆-重庆-重庆-销售十组-组员');
INSERT INTO `table 33` VALUES ('D95F667A9875', '蒋蕊宇', '54790', '销售', '0', '4084', '互联网板块-房产-重庆-重庆-重庆-重庆-销售十组-组员');
INSERT INTO `table 33` VALUES ('A6A6C1E87381', '刘雨念', '39573', '销售', '0', '4084', '互联网板块-房产-重庆-重庆-重庆-重庆-销售十组-组员');
INSERT INTO `table 33` VALUES ('451A697C8871', '黄伟50985', '50985', '销售', '0', '4085', '互联网板块-房产-北方区-北方-北京-北京-销售三部1组-组员');
INSERT INTO `table 33` VALUES ('606FBF750F63', '廖巍', '51035', '销售', '0', '4085', '互联网板块-房产-北方区-北方-北京-北京-销售三部1组-组员');
INSERT INTO `table 33` VALUES ('C76DA2BDDA81', '赵峥', '52679', '销售', '0', '4085', '互联网板块-房产-北方区-北方-北京-北京-销售三部1组-组员');
INSERT INTO `table 33` VALUES ('6AABFE4594C9', '刘鼎奇', '53223', '销售', '0', '4085', '互联网板块-房产-北方区-北方-北京-北京-销售三部1组-组员');
INSERT INTO `table 33` VALUES ('E87D44AC4D56', '高强', '30483', '销售', '0', '4085', '互联网板块-房产-北方区-北方-北京-北京-销售三部1组-组员');
INSERT INTO `table 33` VALUES ('F15205E8FF34', '贾春生', '33225', '销售', '0', '4085', '互联网板块-房产-北方区-北方-北京-北京-销售三部1组-组员');
INSERT INTO `table 33` VALUES ('A1668872C976', '王彩虹', '39880', '销售', '0', '4085', '互联网板块-房产-北方区-北方-北京-北京-销售三部1组-组员');
INSERT INTO `table 33` VALUES ('14CBB77EF35F', '白秀娟', '32467', '销售', '0', '4085', '互联网板块-房产-北方区-北方-北京-北京-销售三部1组-组员');
INSERT INTO `table 33` VALUES ('235F15636876', '郭玥', '32446', '销售', '0', '4085', '互联网板块-房产-北方区-北方-北京-北京-销售三部1组-组员');
INSERT INTO `table 33` VALUES ('A16664822FD5', '曲云玲', '39873', '销售', '0', '4085', '互联网板块-房产-北方区-北方-北京-北京-销售三部1组-组员');
INSERT INTO `table 33` VALUES ('DC39DE21F3B8', '马冬雪', '55264', '销售', '0', '4087', '互联网板块-房产-北方区-北方-北京-北京-销售三部2组-组员');
INSERT INTO `table 33` VALUES ('26ED97B88E55', '张跃39838', '39838', '销售', '0', '4087', '互联网板块-房产-北方区-北方-北京-北京-销售三部2组-组员');
INSERT INTO `table 33` VALUES ('0BFEB63DA031', '王万丽', '50918', '销售', '0', '4087', '互联网板块-房产-北方区-北方-北京-北京-销售三部2组-组员');
INSERT INTO `table 33` VALUES ('9263D39BC486', '陈羽', '32417', '销售', '0', '4087', '互联网板块-房产-北方区-北方-北京-北京-销售三部2组-组员');
INSERT INTO `table 33` VALUES ('038A3EEF2616', '马红园', '32465', '销售', '0', '4087', '互联网板块-房产-北方区-北方-北京-北京-销售三部2组-组员');
INSERT INTO `table 33` VALUES ('B0E36BCEF037', '张永斌', '32401', '销售', '0', '4087', '互联网板块-房产-北方区-北方-北京-北京-销售三部2组-组员');
INSERT INTO `table 33` VALUES ('2A186C58E219', '管如龙', '32466', '销售', '0', '4087', '互联网板块-房产-北方区-北方-北京-北京-销售三部2组-组员');
INSERT INTO `table 33` VALUES ('197753FD1A92', '莫玲', '31809', '销售', '0', '4089', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `table 33` VALUES ('24E36B6E7B47', '古玲', '54033', '销售', '0', '4089', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `table 33` VALUES ('912EE00E30B7', '蒋彪', '54070', '销售', '0', '4089', '互联网板块-房产-成都-成都-成都-成都-销售三组-组员');
INSERT INTO `table 33` VALUES ('045B7895F200', '唐珏', '51601', '销售', '0', '4096', '互联网板块-房产-重庆-重庆-重庆-重庆-销售十一组（停）-组员');
INSERT INTO `table 33` VALUES ('1811BDF2D439', '唐晓', '51612', '销售', '0', '4096', '互联网板块-房产-重庆-重庆-重庆-重庆-销售十一组（停）-组员');
INSERT INTO `table 33` VALUES ('D5FFFDBBBCD1', '徐香', '51680', '销售', '0', '4096', '互联网板块-房产-重庆-重庆-重庆-重庆-销售十一组（停）-组员');
INSERT INTO `table 33` VALUES ('372232C51AF5', '吕晓青36495', '36495', '销售', '0', '4182', '互联网板块-房产-北方区-北方-西安-西安-销售一组-组员');
INSERT INTO `table 33` VALUES ('46666A7774D5', '张超50981', '50981', '销售', '0', '4182', '互联网板块-房产-北方区-北方-西安-西安-销售一组-组员');
INSERT INTO `table 33` VALUES ('001A1B218807', '陈立智', '53143', '销售', '0', '4182', '互联网板块-房产-北方区-北方-西安-西安-销售一组-组员');
INSERT INTO `table 33` VALUES ('88ABCABE4B37', '李牧', '39111', '销售', '0', '4182', '互联网板块-房产-北方区-北方-西安-西安-销售一组-组员');
INSERT INTO `table 33` VALUES ('BCE0D55AE6B3', '侯晓亮', '52682', '销售', '0', '4182', '互联网板块-房产-北方区-北方-西安-西安-销售一组-组员');
INSERT INTO `table 33` VALUES ('CCE12A9762AD', '袁震', '32614', '销售', '0', '4182', '互联网板块-房产-北方区-北方-西安-西安-销售一组-组员');
INSERT INTO `table 33` VALUES ('27F7B9027A7A', '禹龙', '32314', '销售', '0', '4184', '互联网板块-房产-北方区-北方-西安-西安-销售四组-组员');
INSERT INTO `table 33` VALUES ('CE60EF205941', '黄文祺', '33328', '销售', '0', '4184', '互联网板块-房产-北方区-北方-西安-西安-销售四组-组员');
INSERT INTO `table 33` VALUES ('E40CFA14107F', '张小龙', '30779', '销售', '0', '4184', '互联网板块-房产-北方区-北方-西安-西安-销售四组-组员');
INSERT INTO `table 33` VALUES ('8518E26833B7', '李璐', '53239', '销售', '0', '4184', '互联网板块-房产-北方区-北方-西安-西安-销售四组-组员');
INSERT INTO `table 33` VALUES ('3C8A27795313', '苏劲男', '53174', '销售', '0', '4184', '互联网板块-房产-北方区-北方-西安-西安-销售四组-组员');
INSERT INTO `table 33` VALUES ('5A3DFDB5F264', '杨哲', '37202', '销售', '0', '4184', '互联网板块-房产-北方区-北方-西安-西安-销售四组-组员');
INSERT INTO `table 33` VALUES ('50812083ECFC', '程洋阳', '35225', '销售', '0', '4214', '互联网板块-房产-北方区-北方-西安-西安-销售二组-组员');
INSERT INTO `table 33` VALUES ('4E5E32213D08', '贾晓鹏', '51010', '销售', '0', '4214', '互联网板块-房产-北方区-北方-西安-西安-销售二组-组员');
INSERT INTO `table 33` VALUES ('001A415DCAB8', '薛昉', '53142', '销售', '0', '4214', '互联网板块-房产-北方区-北方-西安-西安-销售二组-组员');
INSERT INTO `table 33` VALUES ('114832AC8F16', '王静36093', '36093', '销售', '0', '4214', '互联网板块-房产-北方区-北方-西安-西安-销售二组-组员');
INSERT INTO `table 33` VALUES ('3B2B5F4A5DB6', '邸堃53191', '53191', '销售', '0', '4214', '互联网板块-房产-北方区-北方-西安-西安-销售二组-组员');
INSERT INTO `table 33` VALUES ('1147F5E2E8F1', '薛峰', '36049', '销售', '0', '4214', '互联网板块-房产-北方区-北方-西安-西安-销售二组-组员');
INSERT INTO `table 33` VALUES ('0E4D58781F65', '潘玮', '32173', '销售', '0', '4214', '互联网板块-房产-北方区-北方-西安-西安-销售二组-组员');
INSERT INTO `table 33` VALUES ('BAAAED80D752', '周涛', '31014', '销售', '0', '4215', '互联网板块-房产-北方区-北方-西安-西安-销售三组-组员');
INSERT INTO `table 33` VALUES ('48C254B47485', '满广济', '34258', '销售', '0', '4215', '互联网板块-房产-北方区-北方-西安-西安-销售三组-组员');
INSERT INTO `table 33` VALUES ('3721E25D6694', '姬萌轩', '36519', '销售', '0', '4215', '互联网板块-房产-北方区-北方-西安-西安-销售三组-组员');
INSERT INTO `table 33` VALUES ('9A57E3158334', '韩永强', '52601', '销售', '0', '4216', '互联网板块-房产-北方区-北方-西安-西安-销售五组-组员');
INSERT INTO `table 33` VALUES ('BA739BB12E84', '张璐', '52669', '销售', '0', '4216', '互联网板块-房产-北方区-北方-西安-西安-销售五组-组员');
INSERT INTO `table 33` VALUES ('FD73DCEF5036', '张阵', '51210', '销售', '0', '4216', '互联网板块-房产-北方区-北方-西安-西安-销售五组-组员');
INSERT INTO `table 33` VALUES ('1299E90E3E85', '蔺俐', '53163', '销售', '0', '4216', '互联网板块-房产-北方区-北方-西安-西安-销售五组-组员');
INSERT INTO `table 33` VALUES ('5A3E48025314', '宋寒冰', '32198', '销售', '0', '4216', '互联网板块-房产-北方区-北方-西安-西安-销售五组-组员');
INSERT INTO `table 33` VALUES ('5A3CFFB86DE8', '童文', '39101', '销售', '0', '4216', '互联网板块-房产-北方区-北方-西安-西安-销售五组-组员');
INSERT INTO `table 33` VALUES ('E6951A1B7A8A', '王雅婷', '34379', '销售', '0', '4218', '互联网板块-房产-华南区-华南区-惠州-惠州-销售二组-组员');
INSERT INTO `table 33` VALUES ('184F5628B590', '胡军', '50341', '销售', '0', '4218', '互联网板块-房产-华南区-华南区-惠州-惠州-销售二组-组员');
INSERT INTO `table 33` VALUES ('BD0DC2107C83', '郑凯帆', '52765', '销售', '0', '4218', '互联网板块-房产-华南区-华南区-惠州-惠州-销售二组-组员');
INSERT INTO `table 33` VALUES ('2EF1006E40E4', '卢卫民', '37201', '销售', '0', '4221', '互联网板块-房产-华南区-华南区-佛山-佛山-销售四组-销售员');
INSERT INTO `table 33` VALUES ('656B26B57F3E', '付欢欢', '32590', '销售', '0', '4221', '互联网板块-房产-华南区-华南区-佛山-佛山-销售四组-销售员');
INSERT INTO `table 33` VALUES ('27AFFE2BDE97', '王哲', '55583', '销售', '0', '4221', '互联网板块-房产-华南区-华南区-佛山-佛山-销售四组-销售员');
INSERT INTO `table 33` VALUES ('27B00B9AC139', '陈国键', '36416', '销售', '0', '4221', '互联网板块-房产-华南区-华南区-佛山-佛山-销售四组-销售员');
INSERT INTO `table 33` VALUES ('0C640C887E65', '梁木材', '38155', '销售', '0', '4221', '互联网板块-房产-华南区-华南区-佛山-佛山-销售四组-销售员');
INSERT INTO `table 33` VALUES ('3D39E673BBF3', '谭健冬', '37370', '销售', '0', '4221', '互联网板块-房产-华南区-华南区-佛山-佛山-销售四组-销售员');
INSERT INTO `table 33` VALUES ('D628A7978570', '董嘉', '38014', '销售', '0', '4232', '互联网板块-房产-北方区-北方-太原-太原-销售三组-组员');
INSERT INTO `table 33` VALUES ('B528118E3940', '杨瑞', '52608', '销售', '0', '4232', '互联网板块-房产-北方区-北方-太原-太原-销售三组-组员');
INSERT INTO `table 33` VALUES ('3BBEB8446D40', '薛建锋', '50978', '销售', '0', '4232', '互联网板块-房产-北方区-北方-太原-太原-销售三组-组员');
INSERT INTO `table 33` VALUES ('E7A9F2115033', '武卫', '37944', '销售', '0', '4232', '互联网板块-房产-北方区-北方-太原-太原-销售三组-组员');
INSERT INTO `table 33` VALUES ('4E51C99F2091', '彭鹏', '51151', '销售', '0', '4234', '互联网板块-房产-东部区-徐州-徐州-徐州-销售一组-组员');
INSERT INTO `table 33` VALUES ('911EFEB78A86', '郑玉皛', '51182', '销售', '0', '4234', '互联网板块-房产-东部区-徐州-徐州-徐州-销售一组-组员');
INSERT INTO `table 33` VALUES ('121DE3AF8BE6', '车燕', '55466', '销售', '0', '4234', '互联网板块-房产-东部区-徐州-徐州-徐州-销售一组-组员');
INSERT INTO `table 33` VALUES ('121DE7BE17B1', '王喃', '55465', '销售', '0', '4234', '互联网板块-房产-东部区-徐州-徐州-徐州-销售一组-组员');
INSERT INTO `table 33` VALUES ('121DF0378FE2', '武可', '55463', '销售', '0', '4234', '互联网板块-房产-东部区-徐州-徐州-徐州-销售一组-组员');
INSERT INTO `table 33` VALUES ('DAC8562E8C89', '徐冉55504', '55504', '销售', '0', '4234', '互联网板块-房产-东部区-徐州-徐州-徐州-销售一组-组员');
INSERT INTO `table 33` VALUES ('DF47BE2D70A1', '罗迪', '39079', '销售', '0', '4234', '互联网板块-房产-东部区-徐州-徐州-徐州-销售一组-组员');
INSERT INTO `table 33` VALUES ('3D048E7FDDB6', '于晓娟', '39094', '销售', '0', '4236', '互联网板块-房产-东部区-徐州-徐州-徐州-销售二组-组员');
INSERT INTO `table 33` VALUES ('E51493639358', '赵晖', '38962', '销售', '0', '4236', '互联网板块-房产-东部区-徐州-徐州-徐州-销售二组-组员');
INSERT INTO `table 33` VALUES ('AE0F7644DE87', '赵憧', '52899', '销售', '0', '4236', '互联网板块-房产-东部区-徐州-徐州-徐州-销售二组-组员');
INSERT INTO `table 33` VALUES ('121DEB6A3D19', '陈杰菲', '55464', '销售', '0', '4236', '互联网板块-房产-东部区-徐州-徐州-徐州-销售二组-组员');
INSERT INTO `table 33` VALUES ('1D6112AE5FA1', '许园', '38993', '销售', '0', '4236', '互联网板块-房产-东部区-徐州-徐州-徐州-销售二组-组员');
INSERT INTO `table 33` VALUES ('9A69C08B4EB5', '李 伟', '50222', '销售', '0', '4254', '互联网板块-房产-华北区-华北区-青岛-青岛-销售三组-组员');
INSERT INTO `table 33` VALUES ('0FF5E39DE646', '邓山平', '50286', '销售', '0', '4254', '互联网板块-房产-华北区-华北区-青岛-青岛-销售三组-组员');
INSERT INTO `table 33` VALUES ('363C5FB3DF38', '郭青', '35322', '销售', '0', '4254', '互联网板块-房产-华北区-华北区-青岛-青岛-销售三组-组员');
INSERT INTO `table 33` VALUES ('4D15A899FA53', '胡伟', '38086', '销售', '0', '4254', '互联网板块-房产-华北区-华北区-青岛-青岛-销售三组-组员');
INSERT INTO `table 33` VALUES ('4E1B72D18C40', '潘翔', '51277', '销售', '0', '4256', '互联网板块-房产-联合区-联合区-南昌-南昌-销售三组-组员');
INSERT INTO `table 33` VALUES ('08D51F986B31', '彭敏', '55088', '销售', '0', '4256', '互联网板块-房产-联合区-联合区-南昌-南昌-销售三组-组员');
INSERT INTO `table 33` VALUES ('5C94825B2792', '吴松', '53861', '销售', '0', '4256', '互联网板块-房产-联合区-联合区-南昌-南昌-销售三组-组员');
INSERT INTO `table 33` VALUES ('395A7C023B55', '熊丹丹', '56342', '销售', '0', '4256', '互联网板块-房产-联合区-联合区-南昌-南昌-销售三组-组员');
INSERT INTO `table 33` VALUES ('88BB981C5949', '黄文兰', '35392', '销售', '0', '4260', '互联网板块-房产-华南区-华南区-广州-广州-电商组-组员');
INSERT INTO `table 33` VALUES ('578FD81752B9', '彭议徵', '34455', '销售', '0', '4265', '互联网板块-房产-武汉-武汉-武汉-武汉-销售八组-组员');
INSERT INTO `table 33` VALUES ('9A5A22265DE2', '张磊', '38476', '销售', '0', '4265', '互联网板块-房产-武汉-武汉-武汉-武汉-销售八组-组员');
INSERT INTO `table 33` VALUES ('510A75DD5425', '陈婉芬', '31135', '销售', '0', '4265', '互联网板块-房产-武汉-武汉-武汉-武汉-销售八组-组员');
INSERT INTO `table 33` VALUES ('F3CCCD325CE7', '舒智', '50534', '销售', '0', '4265', '互联网板块-房产-武汉-武汉-武汉-武汉-销售八组-组员');
INSERT INTO `table 33` VALUES ('75B89C257A04', '邬哲超', '32856', '销售', '0', '4265', '互联网板块-房产-武汉-武汉-武汉-武汉-销售八组-组员');
INSERT INTO `table 33` VALUES ('3E5795E360E2', '尹婧', '38560', '销售', '0', '4267', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-电商组-组员');
INSERT INTO `table 33` VALUES ('60A829819860', '方智钢', '34423', '销售', '0', '4267', '互联网板块-房产-浙闽区-浙江区-杭州-杭州-电商组-组员');
INSERT INTO `table 33` VALUES ('18D9921E0761', '周鸿钧', '50656', '销售', '0', '4296', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售三组-组员');
INSERT INTO `table 33` VALUES ('9143AC166BF6', '陈剑清', '54656', '销售', '0', '4296', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售三组-组员');
INSERT INTO `table 33` VALUES ('64801393C738', '涂锐烽', '50689', '销售', '0', '4296', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售三组-组员');
INSERT INTO `table 33` VALUES ('265589C41D11', '陈晨琳', '38601', '销售', '0', '4296', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售三组-组员');
INSERT INTO `table 33` VALUES ('7E3A6787E1F5', '黄艺娟', '54741', '销售', '0', '4296', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售三组-组员');
INSERT INTO `table 33` VALUES ('36B3100F8251', '宫玺', '57455', '销售', '0', '4296', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售三组-组员');
INSERT INTO `table 33` VALUES ('A7DF3C74DDD6', '金瑞', '30916', '销售', '0', '4299', '互联网板块-房产-市场部-市场部-市场部-市场部');
INSERT INTO `table 33` VALUES ('03D3D7E0A631', '杜婧', '31429', '销售', '0', '4299', '互联网板块-房产-市场部-市场部-市场部-市场部');
INSERT INTO `table 33` VALUES ('B0D29F922003', '张惠', '36346', '销售', '0', '4301', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售二组-组员');
INSERT INTO `table 33` VALUES ('20E8BF018B94', '李明明', '36350', '销售', '0', '4301', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售二组-组员');
INSERT INTO `table 33` VALUES ('20E8F7CC29A1', '索涛', '36352', '销售', '0', '4301', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售二组-组员');
INSERT INTO `table 33` VALUES ('3E39320C4020', '陈琰', '51384', '销售', '0', '4301', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售二组-组员');
INSERT INTO `table 33` VALUES ('B0D2E4DF6397', '曹月', '36985', '销售', '0', '4301', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售二组-组员');
INSERT INTO `table 33` VALUES ('C21E7A448033', '侯名娜', '55062', '销售', '0', '4301', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售二组-组员');
INSERT INTO `table 33` VALUES ('A232BF9FEA22', '郭扬斐', '53886', '销售', '0', '4301', '互联网板块-房产-联合区-联合区-乌鲁木齐-乌鲁木齐-销售二组-组员');
INSERT INTO `table 33` VALUES ('581B41436143', '顾健健', '34624', '销售', '0', '4318', '互联网板块-房产-东部区-锡常-常州-常州-销售四组-组员');
INSERT INTO `table 33` VALUES ('1AFAEEE435A0', '沈琛', '34797', '销售', '0', '4318', '互联网板块-房产-东部区-锡常-常州-常州-销售四组-组员');
INSERT INTO `table 33` VALUES ('79C4A66280D8', '丁爽', '51163', '销售', '0', '4318', '互联网板块-房产-东部区-锡常-常州-常州-销售四组-组员');
INSERT INTO `table 33` VALUES ('00CAADF26618', '周锋', '35590', '销售', '0', '4318', '互联网板块-房产-东部区-锡常-常州-常州-销售四组-组员');
INSERT INTO `table 33` VALUES ('0A0A08BA0CA6', '王慧萍', '55516', '销售', '0', '4318', '互联网板块-房产-东部区-锡常-常州-常州-销售四组-组员');
INSERT INTO `table 33` VALUES ('1710B08BB1F1', '马贵勤', '55518', '销售', '0', '4318', '互联网板块-房产-东部区-锡常-常州-常州-销售四组-组员');
INSERT INTO `table 33` VALUES ('4D0D8D4FC07C', '姜犇', '33354', '销售', '0', '4320', '互联网板块-房产-东部区-锡常-常州-常州-销售五组-组员');
INSERT INTO `table 33` VALUES ('BF8A212881F1', '涂轩维', '50621', '销售', '0', '4322', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售四组-组员');
INSERT INTO `table 33` VALUES ('3B7C280632E4', '周伟', '50670', '销售', '0', '4322', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售四组-组员');
INSERT INTO `table 33` VALUES ('0941F2DE36F1', '苏鑫磊', '54964', '销售', '0', '4322', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售四组-组员');
INSERT INTO `table 33` VALUES ('BF8A86E6CD26', '胡颖芬', '50620', '销售', '0', '4322', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售四组-组员');
INSERT INTO `table 33` VALUES ('90BAFCE77B73', '傅溶溶', '54749', '销售', '0', '4322', '互联网板块-房产-浙闽区-福建-厦门-厦门-销售四组-组员');
INSERT INTO `table 33` VALUES ('193970BC2570', '顾逸舟', '35591', '销售', '0', '4430', '互联网板块-房产-数据结算部-数据结算部-数据结算部-数据结算部');
INSERT INTO `table 33` VALUES ('0FF6072117F8', '徐彬彬', '50285', '销售', '0', '4433', '互联网板块-房产-华北区-华北区-青岛-青岛-销售四组-组员');
INSERT INTO `table 33` VALUES ('0FF5F24E1081', '杨汉臣', '50287', '销售', '0', '4433', '互联网板块-房产-华北区-华北区-青岛-青岛-销售四组-组员');
INSERT INTO `table 33` VALUES ('EFE45C6356B8', '周保鹤', '52121', '销售', '0', '4435', '互联网板块-房产-大连-大连-大连-大连-销售二组-组员');
INSERT INTO `table 33` VALUES ('2E204B0B36D6', '张惠惠', '52124', '销售', '0', '4435', '互联网板块-房产-大连-大连-大连-大连-销售二组-组员');
INSERT INTO `table 33` VALUES ('EE74F4A45358', '王博52136', '52136', '销售', '0', '4435', '互联网板块-房产-大连-大连-大连-大连-销售二组-组员');
INSERT INTO `table 33` VALUES ('E13820FD42A8', '潘宇', '30619', '销售', '0', '4435', '互联网板块-房产-大连-大连-大连-大连-销售二组-组员');
INSERT INTO `table 33` VALUES ('57D0CFBDF02D', '王翠翠31724', '31724', '销售', '0', '4437', '互联网板块-房产-大连-大连-大连-大连-销售三组-组员');
INSERT INTO `table 33` VALUES ('EE74EE3538E5', '石磊', '52133', '销售', '0', '4437', '互联网板块-房产-大连-大连-大连-大连-销售三组-组员');
INSERT INTO `table 33` VALUES ('171E7555B273', '郑伟', '52143', '销售', '0', '4437', '互联网板块-房产-大连-大连-大连-大连-销售三组-组员');
INSERT INTO `table 33` VALUES ('09D52052F170', '梁宇阳', '37151', '销售', '0', '4456', '互联网板块-房产-华南区-华南区-中珠-中山-销售一组-组员');
INSERT INTO `table 33` VALUES ('88198A3B24F9', '全伟豪', '50440', '销售', '0', '4456', '互联网板块-房产-华南区-华南区-中珠-中山-销售一组-组员');
INSERT INTO `table 33` VALUES ('C65F1284E972', '潘大鹏', '52779', '销售', '0', '4456', '互联网板块-房产-华南区-华南区-中珠-中山-销售一组-组员');
INSERT INTO `table 33` VALUES ('6AB80D9DCDB8', '曾建波', '54379', '销售', '0', '4456', '互联网板块-房产-华南区-华南区-中珠-中山-销售一组-组员');
INSERT INTO `table 33` VALUES ('8819A0A1F9C8', '李静镰', '50424', '销售', '0', '4456', '互联网板块-房产-华南区-华南区-中珠-中山-销售一组-组员');
INSERT INTO `table 33` VALUES ('A3928115F592', '梁伟进', '54618', '销售', '0', '4456', '互联网板块-房产-华南区-华南区-中珠-中山-销售一组-组员');
INSERT INTO `table 33` VALUES ('55578B82EFE7', '李淇琦', '55604', '销售', '0', '4456', '互联网板块-房产-华南区-华南区-中珠-中山-销售一组-组员');
INSERT INTO `table 33` VALUES ('71626D277684', '田江涛', '55595', '销售', '0', '4458', '互联网板块-房产-华南区-华南区-深圳-深圳-销售七组-组员');
INSERT INTO `table 33` VALUES ('716271D6D5D4', '王鲲鹏', '55623', '销售', '0', '4458', '互联网板块-房产-华南区-华南区-深圳-深圳-销售七组-组员');
INSERT INTO `table 33` VALUES ('F681FE1DC607', '郑凯帆56559', '56559', '销售', '0', '4458', '互联网板块-房产-华南区-华南区-深圳-深圳-销售七组-组员');
INSERT INTO `table 33` VALUES ('419A0ECFA780', '刘军56535', '56535', '销售', '0', '4458', '互联网板块-房产-华南区-华南区-深圳-深圳-销售七组-组员');
INSERT INTO `table 33` VALUES ('7BC31B65D293', '张永峰', '38171', '销售', '0', '4481', '互联网板块-房产-大客户部-大客户部-华南大客户部-华南大客户部');
INSERT INTO `table 33` VALUES ('B8AAC858DD06', '徐武胜', '54088', '销售', '0', '4487', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('17917786E901', '冯盈盈', '35946', '销售', '0', '4487', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('9E0223AB5AB0', '孙珍珍', '55393', '销售', '0', '4487', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('C83D3656C8F2', '冯筱婕', '55407', '销售', '0', '4487', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('C83D3D9D6EF3', '马练', '55406', '销售', '0', '4487', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('0A0A1E3483A7', '王玉霞', '55427', '销售', '0', '4487', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('4D9F6805CC55', '张莉55445', '55445', '销售', '0', '4487', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('66E6170AAD27', '宋健', '56168', '销售', '0', '4495', '互联网板块-房产-联合区-联合区-包头-包头-销售一组-组员');
INSERT INTO `table 33` VALUES ('0A9781AC7CC4', '刘旭55071', '55071', '销售', '0', '4495', '互联网板块-房产-联合区-联合区-包头-包头-销售一组-组员');
INSERT INTO `table 33` VALUES ('3E3F8FEF7B59', '张云峰', '53840', '销售', '0', '4495', '互联网板块-房产-联合区-联合区-包头-包头-销售一组-组员');
INSERT INTO `table 33` VALUES ('1E59CCBA8849', '火花', '55098', '销售', '0', '4499', '互联网板块-房产-联合区-联合区-兰州-兰州-销售一组-组员');
INSERT INTO `table 33` VALUES ('BEFB18CB0C92', '马千', '55057', '销售', '0', '4499', '互联网板块-房产-联合区-联合区-兰州-兰州-销售一组-组员');
INSERT INTO `table 33` VALUES ('2F2A45B67C25', '王骏', '55112', '销售', '0', '4499', '互联网板块-房产-联合区-联合区-兰州-兰州-销售一组-组员');
INSERT INTO `table 33` VALUES ('657642EB46B6', '赵武', '56191', '销售', '0', '4499', '互联网板块-房产-联合区-联合区-兰州-兰州-销售一组-组员');
INSERT INTO `table 33` VALUES ('2F2A3B9CB398', '韩超', '55140', '销售', '0', '4499', '互联网板块-房产-联合区-联合区-兰州-兰州-销售一组-组员');
INSERT INTO `table 33` VALUES ('1925EF2A5410', '林丽55078', '55078', '销售', '0', '4499', '互联网板块-房产-联合区-联合区-兰州-兰州-销售一组-组员');
INSERT INTO `table 33` VALUES ('C6F2BA422505', '王兰', '35536', '销售', '0', '4499', '互联网板块-房产-联合区-联合区-兰州-兰州-销售一组-组员');
INSERT INTO `table 33` VALUES ('2F2A36D6AD19', '陈强', '55143', '销售', '0', '4499', '互联网板块-房产-联合区-联合区-兰州-兰州-销售一组-组员');
INSERT INTO `table 33` VALUES ('B77FCC52D5F4', '文洁', '36606', '销售', '0', '4522', '互联网板块-房产-长沙-长沙-长沙-长沙-销售七组-组员');
INSERT INTO `table 33` VALUES ('14711BCF1168', '孙乐', '38364', '销售', '0', '4522', '互联网板块-房产-长沙-长沙-长沙-长沙-销售七组-组员');
INSERT INTO `table 33` VALUES ('B7817E52EA63', '雷飞飞', '51994', '销售', '0', '4522', '互联网板块-房产-长沙-长沙-长沙-长沙-销售七组-组员');
INSERT INTO `table 33` VALUES ('800DF9EECFE9', '余得水', '54217', '销售', '0', '4522', '互联网板块-房产-长沙-长沙-长沙-长沙-销售七组-组员');
INSERT INTO `table 33` VALUES ('1F73F3E740F5', '彭楚', '54258', '销售', '0', '4522', '互联网板块-房产-长沙-长沙-长沙-长沙-销售七组-组员');
INSERT INTO `table 33` VALUES ('8585A499C199', '黄梦曦', '51963', '销售', '0', '4522', '互联网板块-房产-长沙-长沙-长沙-长沙-销售七组-组员');
INSERT INTO `table 33` VALUES ('8DB58E65B1C4', '刘家良', '37780', '销售', '0', '4535', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售5组-组员');
INSERT INTO `table 33` VALUES ('AFE51CC0A4B3', '巴文香', '31128', '销售', '0', '4535', '互联网板块-房产-东北区-东北区-沈阳-沈阳-销售5组-组员');
INSERT INTO `table 33` VALUES ('F5AACEC60B66', '唐龙53540', '53540', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `table 33` VALUES ('FD44833EB759', '陈丹54856', '54856', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `table 33` VALUES ('17789AEED816', '庄晔', '36222', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `table 33` VALUES ('9C957ADA6841', '沙莎', '39610', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `table 33` VALUES ('9937CB9DA505', '吕阔', '吕阔', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `table 33` VALUES ('E1D9247B9C33', '赵烨', '53525', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `table 33` VALUES ('D2AC685AE339', '沈伟37054', '37054', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `table 33` VALUES ('D0C55D426250', '蒋云蔚', '53510', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `table 33` VALUES ('B6BF04502939', '石雍', '33030', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `table 33` VALUES ('AFF818723AF9', '沈忆岑', '31906', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `table 33` VALUES ('7DD820C32FEC', '张彦春', '31277', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `table 33` VALUES ('66B3C750DD6E', '张莹', '32850', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `table 33` VALUES ('62BE10549588', '关天华', '53590', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `table 33` VALUES ('6008125674AC', '袁海静', '32955', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `table 33` VALUES ('5AAD41E81038', '王梦辰', '39602', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `table 33` VALUES ('56B3C8BFCFD5', '刘磊', '32593', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `table 33` VALUES ('4BBED727C446', '周一林', '51726', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `table 33` VALUES ('2F0C08A570A7', '岳增猛', '37337', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `table 33` VALUES ('CD06FD8A4714', '李萍F9667', '39667', '销售', '0', '4536', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第1小组-组员');
INSERT INTO `table 33` VALUES ('2537E45C3E07', '廖志强', '53570', '销售', '0', '4538', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第2小组-组员');
INSERT INTO `table 33` VALUES ('09396889DE00', '任益', '54864', '销售', '0', '4538', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第2小组-组员');
INSERT INTO `table 33` VALUES ('C70C9860A6D9', '严立栋', '54853', '销售', '0', '4538', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第2小组-组员');
INSERT INTO `table 33` VALUES ('59A7F027BF93', '陆原', '54898', '销售', '0', '4538', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第2小组-组员');
INSERT INTO `table 33` VALUES ('CD06EAC466A8', '杨艳洁', '39666', '销售', '0', '4538', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第2小组-组员');
INSERT INTO `table 33` VALUES ('CCD9567980F2', '龚平', '35835', '销售', '0', '4540', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第3小组-组员');
INSERT INTO `table 33` VALUES ('DCC8218BD2B8', '丁峥嵘39668', '39668', '销售', '0', '4540', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第3小组-组员');
INSERT INTO `table 33` VALUES ('B528ECBB3DB0', '芦天鑫', '51787', '销售', '0', '4542', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第4小组-组员');
INSERT INTO `table 33` VALUES ('3CF4470BFFE4', '马晓威', '53580', '销售', '0', '4544', '互联网板块-房产-苏南区-苏南-苏州-苏州');
INSERT INTO `table 33` VALUES ('9C9CE7709C83', '季吕敏', '54912', '销售', '0', '4545', '互联网板块-房产-苏南区-苏南-苏州-苏州');
INSERT INTO `table 33` VALUES ('B529046C4E22', '李庭鋆', '51788', '销售', '0', '4545', '互联网板块-房产-苏南区-苏南-苏州-苏州');
INSERT INTO `table 33` VALUES ('5AADC483EF16', '陈静39605', '39605', '销售', '0', '4545', '互联网板块-房产-苏南区-苏南-苏州-苏州');
INSERT INTO `table 33` VALUES ('3B9FA1B2B587', '朱杰', '34905', '销售', '0', '4545', '互联网板块-房产-苏南区-苏南-苏州-苏州');
INSERT INTO `table 33` VALUES ('FD48689D7561', '范思思', '54857', '销售', '0', '4547', '互联网板块-房产-苏南区-苏南-苏州-苏州');
INSERT INTO `table 33` VALUES ('3E126FB63C30', '王之夏', '53579', '销售', '0', '4547', '互联网板块-房产-苏南区-苏南-苏州-苏州');
INSERT INTO `table 33` VALUES ('DD698B2CB7F2', '赵琦54869', '54869', '销售', '0', '4547', '互联网板块-房产-苏南区-苏南-苏州-苏州');
INSERT INTO `table 33` VALUES ('1BA4FBC07E37', '俞春荣', '54877', '销售', '0', '4547', '互联网板块-房产-苏南区-苏南-苏州-苏州');
INSERT INTO `table 33` VALUES ('A8D4FD0E86B0', '陈路', '54080', '销售', '0', '4562', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('BF60B9CBFAA4', '邓娇娇', '54091', '销售', '0', '4562', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('BDC2B5CA6384', '杨颖', '54086', '销售', '0', '4562', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('2B85E11C8E58', '姚彩霞', '55366', '销售', '0', '4562', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('5E994CEE9957', '吴晓波', '55381', '销售', '0', '4562', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('3F5BB55C6DA9', '邓琦', '55379', '销售', '0', '4562', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('0A78C02A1769', '岳黎55358', '55358', '销售', '0', '4562', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('5E99395C1BE3', '曾平西', '55383', '销售', '0', '4562', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('2754C683AA68', '罗峰', '55435', '销售', '0', '4562', '互联网板块-房产-成都-成都-成都-成都-销售一组-组员');
INSERT INTO `table 33` VALUES ('5E9915311495', '童雷', '55382', '销售', '0', '4564', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('2754CA9C68D0', '周维', '55438', '销售', '0', '4564', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('2754CE26F104', '唐颖', '55437', '销售', '0', '4564', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('0A0A319B6285', '解强', '55421', '销售', '0', '4564', '互联网板块-房产-成都-成都-成都-成都-销售二组-组员');
INSERT INTO `table 33` VALUES ('0783A9DD7041', '张媛50537', '50537', '销售', '0', '4568', '互联网板块-房产-武汉-武汉-武汉-武汉-销售九组-组员');
INSERT INTO `table 33` VALUES ('3067B45CEAB5', '吴佳璐', '50598', '销售', '0', '4568', '互联网板块-房产-武汉-武汉-武汉-武汉-销售九组-组员');
INSERT INTO `table 33` VALUES ('9301C9802AB8', '李扬38322', '38322', '销售', '0', '4568', '互联网板块-房产-武汉-武汉-武汉-武汉-销售九组-组员');
INSERT INTO `table 33` VALUES ('3845EE70AE44', '祝星星', '37365', '销售', '0', '4568', '互联网板块-房产-武汉-武汉-武汉-武汉-销售九组-组员');
INSERT INTO `table 33` VALUES ('B71F5200375E', '茹花', '31201', '销售', '0', '4568', '互联网板块-房产-武汉-武汉-武汉-武汉-销售九组-组员');
INSERT INTO `table 33` VALUES ('1AA94994F182', '陈伍玲', '52825', '销售', '0', '4572', '互联网板块-房产-华南区-华南区-东莞-东莞-销售三组-组员');
INSERT INTO `table 33` VALUES ('5241277AD1D3', '陈苏娟', '33999', '销售', '0', '4572', '互联网板块-房产-华南区-华南区-东莞-东莞-销售三组-组员');
INSERT INTO `table 33` VALUES ('B8A75DDB3FD0', '何勇', '39141', '销售', '0', '4573', '互联网板块-房产-联合区-联合区-贵阳-贵阳-销售四组-销售四组');
INSERT INTO `table 33` VALUES ('C76E551FEBC5', '苏志明', '50759', '销售', '0', '4652', '互联网板块-房产-上海-上海-上海-上海-销售三部3组-组员');
INSERT INTO `table 33` VALUES ('57CC3A91AAA5', '杨明洲', '35994', '销售', '0', '4654', '互联网板块-房产-华南区-华南区-东莞-东莞-销售四组-组员');
INSERT INTO `table 33` VALUES ('49543BD62F62', '魏海辉', '35626', '销售', '0', '4654', '互联网板块-房产-华南区-华南区-东莞-东莞-销售四组-组员');
INSERT INTO `table 33` VALUES ('306E4EE6C657', '廖豫川', '37198', '销售', '0', '4820', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售五组-销售员');
INSERT INTO `table 33` VALUES ('306E85040968', '张振东', '37199', '销售', '0', '4822', '互联网板块-房产-浙闽区-浙江区-宁波-宁波-销售六组-销售员');
INSERT INTO `table 33` VALUES ('77A94FF334C8', '禤永建', '56460', '销售', '0', '4824', '互联网板块-房产-华南区-华南区-中珠-中山-销售二组-组员');
INSERT INTO `table 33` VALUES ('CBF4A7D83565', '唐碧健', '56538', '销售', '0', '4824', '互联网板块-房产-华南区-华南区-中珠-中山-销售二组-组员');
INSERT INTO `table 33` VALUES ('668A43472E71', '杨杰', '55649', '销售', '0', '4824', '互联网板块-房产-华南区-华南区-中珠-中山-销售二组-组员');
INSERT INTO `table 33` VALUES ('272317CF05E6', '冯亮', '56608', '销售', '0', '4824', '互联网板块-房产-华南区-华南区-中珠-中山-销售二组-组员');
INSERT INTO `table 33` VALUES ('0F8A42073821', '聂凯', '55563', '销售', '0', '4826', '互联网板块-房产-华南区-华南区-中珠-珠海-销售二组-组员');
INSERT INTO `table 33` VALUES ('AF6FD4064376', '李森', '56522', '销售', '0', '4826', '互联网板块-房产-华南区-华南区-中珠-珠海-销售二组-组员');
INSERT INTO `table 33` VALUES ('80E01942A4D0', '吴敏清', '55644', '销售', '0', '4826', '互联网板块-房产-华南区-华南区-中珠-珠海-销售二组-组员');
INSERT INTO `table 33` VALUES ('FC99866ADC98', '张琼', '30741', '销售', '0', '4831', '互联网板块-房产-网站运维中心-网站运维中心-网站运维中心-网站运维中心');
INSERT INTO `table 33` VALUES ('0010FD8544F9', '谢永雷', '52284', '销售', '0', '4833', '互联网板块-房产-联合区-联合区-郑州-郑州-销售一组-组员');
INSERT INTO `table 33` VALUES ('39F6928EC803', '胡珂', '53856', '销售', '0', '4833', '互联网板块-房产-联合区-联合区-郑州-郑州-销售一组-组员');
INSERT INTO `table 33` VALUES ('F92949453977', '王应龙', '56311', '销售', '0', '4833', '互联网板块-房产-联合区-联合区-郑州-郑州-销售一组-组员');
INSERT INTO `table 33` VALUES ('AA9CCF62E4B7', '董靖姣', '51330', '销售', '0', '4833', '互联网板块-房产-联合区-联合区-郑州-郑州-销售一组-组员');
INSERT INTO `table 33` VALUES ('ACE96F937818', '陈珊珊', '35537', '销售', '0', '4833', '互联网板块-房产-联合区-联合区-郑州-郑州-销售一组-组员');
INSERT INTO `table 33` VALUES ('BBA457E10D53', '史义敏', '39185', '销售', '0', '4833', '互联网板块-房产-联合区-联合区-郑州-郑州-销售一组-组员');
INSERT INTO `table 33` VALUES ('DE199556C2A2', '郭翠', '39249', '销售', '0', '4833', '互联网板块-房产-联合区-联合区-郑州-郑州-销售一组-组员');
INSERT INTO `table 33` VALUES ('DE197E5923D8', '马新杰', '51209', '销售', '0', '4835', '互联网板块-房产-联合区-联合区-郑州-郑州-销售二组-组员');
INSERT INTO `table 33` VALUES ('E401F09DC362', '尹雪56289', '56289', '销售', '0', '4835', '互联网板块-房产-联合区-联合区-郑州-郑州-销售二组-组员');
INSERT INTO `table 33` VALUES ('715007C7F269', '谭超军', '56187', '销售', '0', '4835', '互联网板块-房产-联合区-联合区-郑州-郑州-销售二组-组员');
INSERT INTO `table 33` VALUES ('272311EA4AB4', '吕二兵', '56328', '销售', '0', '4835', '互联网板块-房产-联合区-联合区-郑州-郑州-销售二组-组员');
INSERT INTO `table 33` VALUES ('E64B3A514117', '周丽洁35497', '35497', '销售', '0', '4835', '互联网板块-房产-联合区-联合区-郑州-郑州-销售二组-组员');
INSERT INTO `table 33` VALUES ('44F382E31A50', '耿婷', '39211', '销售', '0', '4835', '互联网板块-房产-联合区-联合区-郑州-郑州-销售二组-组员');
INSERT INTO `table 33` VALUES ('A014E60A67F3', '赵兰倩', '51318', '销售', '0', '4835', '互联网板块-房产-联合区-联合区-郑州-郑州-销售二组-组员');
INSERT INTO `table 33` VALUES ('C0E2912AA7A7', '肜娟娟', '35526', '销售', '0', '4837', '互联网板块-房产-联合区-联合区-郑州-郑州-销售三组-组员');
INSERT INTO `table 33` VALUES ('ACF00C630846', '左梦琳', '36979', '销售', '0', '4837', '互联网板块-房产-联合区-联合区-郑州-郑州-销售三组-组员');
INSERT INTO `table 33` VALUES ('E87879F234F6', '王旭峰', '51357', '销售', '0', '4837', '互联网板块-房产-联合区-联合区-郑州-郑州-销售三组-组员');
INSERT INTO `table 33` VALUES ('EFAEF4E51D73', '万君静', '37118', '销售', '0', '4837', '互联网板块-房产-联合区-联合区-郑州-郑州-销售三组-组员');
INSERT INTO `table 33` VALUES ('2E0C2E8F2B36', '叶梦园', '55111', '销售', '0', '4837', '互联网板块-房产-联合区-联合区-郑州-郑州-销售三组-组员');
INSERT INTO `table 33` VALUES ('5E8CF41A3944', '巴文娟', '58403', '销售', '0', '4837', '互联网板块-房产-联合区-联合区-郑州-郑州-销售三组-组员');
INSERT INTO `table 33` VALUES ('ACE59EB721D4', '杨菲53889', '53889', '销售', '0', '4839', '互联网板块-房产-联合区-联合区-郑州-郑州-销售四组-组员');
INSERT INTO `table 33` VALUES ('E476897D6229', '栾硕', '51381', '销售', '0', '4839', '互联网板块-房产-联合区-联合区-郑州-郑州-销售四组-组员');
INSERT INTO `table 33` VALUES ('13268C506D95', '赵国风', '39155', '销售', '0', '4839', '互联网板块-房产-联合区-联合区-郑州-郑州-销售四组-组员');
INSERT INTO `table 33` VALUES ('0BF35D2FB3C3', '徐麟', '55096', '销售', '0', '4841', '互联网板块-房产-联合区-联合区-郑州-郑州-销售五组-组员');
INSERT INTO `table 33` VALUES ('AE0F1528E262', '吴童麟', '56253', '销售', '0', '4841', '互联网板块-房产-联合区-联合区-郑州-郑州-销售五组-组员');
INSERT INTO `table 33` VALUES ('E401F932AA32', '李艳', '56270', '销售', '0', '4841', '互联网板块-房产-联合区-联合区-郑州-郑州-销售五组-组员');
INSERT INTO `table 33` VALUES ('7774F7A53AC8', '邵冰冰', '39116', '销售', '0', '4841', '互联网板块-房产-联合区-联合区-郑州-郑州-销售五组-组员');
INSERT INTO `table 33` VALUES ('362392C4A021', '崔磊', '35527', '销售', '0', '4841', '互联网板块-房产-联合区-联合区-郑州-郑州-销售五组-组员');
INSERT INTO `table 33` VALUES ('5E0D78EB0095', '张淑慧', '37115', '销售', '0', '4841', '互联网板块-房产-联合区-联合区-郑州-郑州-销售五组-组员');
INSERT INTO `table 33` VALUES ('B8D0A7D57D36', '王宁53835', '53835', '销售', '0', '4841', '互联网板块-房产-联合区-联合区-郑州-郑州-销售五组-组员');
INSERT INTO `table 33` VALUES ('D769F25AF904', '赵安琪', '51361', '销售', '0', '4844', '互联网板块-房产-联合区-联合区-郑州-郑州-销售六组销售一部-组员');
INSERT INTO `table 33` VALUES ('C32BB75FD348', '马明路', '56278', '销售', '0', '4844', '互联网板块-房产-联合区-联合区-郑州-郑州-销售六组销售一部-组员');
INSERT INTO `table 33` VALUES ('911AC04B3A56', '尤晓珂', '51300', '销售', '0', '4846', '互联网板块-房产-联合区-联合区-郑州-郑州-销售六组销售二部-组员');
INSERT INTO `table 33` VALUES ('911AA90BED24', '申晨', '51312', '销售', '0', '4846', '互联网板块-房产-联合区-联合区-郑州-郑州-销售六组销售二部-组员');
INSERT INTO `table 33` VALUES ('E0A92AE7E809', '陈灿娜', '51364', '销售', '0', '4846', '互联网板块-房产-联合区-联合区-郑州-郑州-销售六组销售二部-组员');
INSERT INTO `table 33` VALUES ('B4DCF5A66DB5', '王俊霞', '35523', '销售', '0', '4846', '互联网板块-房产-联合区-联合区-郑州-郑州-销售六组销售二部-组员');
INSERT INTO `table 33` VALUES ('27B01335FEC2', '黄培冬', '55582', '销售', '0', '4891', '互联网板块-房产-华南区-华南区-佛山-佛山-销售五组-销售员');
INSERT INTO `table 33` VALUES ('6EDAD58BE996', '储俊峰', '55636', '销售', '0', '4891', '互联网板块-房产-华南区-华南区-佛山-佛山-销售五组-销售员');
INSERT INTO `table 33` VALUES ('7162665BD251', '全小辉', '55568', '销售', '0', '4907', '互联网板块-房产-华南区-华南区-深圳-深圳-销售八组-组员');
INSERT INTO `table 33` VALUES ('7162608582A4', '郑训辉', '32846', '销售', '0', '4907', '互联网板块-房产-华南区-华南区-深圳-深圳-销售八组-组员');
INSERT INTO `table 33` VALUES ('AD0ECB99A1F4', '徐晓燕', '53596', '销售', '0', '4915', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售三组-组员');
INSERT INTO `table 33` VALUES ('2F20E530C355', '万慧', '54889', '销售', '0', '4915', '互联网板块-房产-苏南区-苏南-昆山-昆山-销售三组-组员');
INSERT INTO `table 33` VALUES ('AA965D33FB68', '苏艺', '51307', '销售', '0', '5063', '互联网板块-房产-联合区-联合区-广西-南宁-销售四组-组员');
INSERT INTO `table 33` VALUES ('FF557DD1E6C3', '莫剑萍', '56316', '销售', '0', '5063', '互联网板块-房产-联合区-联合区-广西-南宁-销售四组-组员');
INSERT INTO `table 33` VALUES ('BAE8ADC525C1', '周洪维', '54923', '销售', '0', '5084', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第5小组-组员');
INSERT INTO `table 33` VALUES ('CAFB1078E514', '袁泉', '54928', '销售', '0', '5086', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第6小组-组员');
INSERT INTO `table 33` VALUES ('3C24FDE0F6B5', '邓小亮', '31272', '销售', '0', '5086', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售一组第6小组-组员');
INSERT INTO `table 33` VALUES ('D0C3E2F3A132', '刘辰', '53508', '销售', '0', '5087', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售三组第1小组-组员');
INSERT INTO `table 33` VALUES ('AF701B814617', '杨雪54921', '54921', '销售', '0', '5087', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售三组第1小组-组员');
INSERT INTO `table 33` VALUES ('DCC88BE60AD2', '俞振', '39669', '销售', '0', '5087', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售三组第1小组-组员');
INSERT INTO `table 33` VALUES ('CD06D5B62AB5', '夏文通', '39665', '销售', '0', '5087', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售三组第1小组-组员');
INSERT INTO `table 33` VALUES ('8CF9436EB527', '刘坚54905', '54905', '销售', '0', '5087', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售三组第1小组-组员');
INSERT INTO `table 33` VALUES ('60A24E1C5A70', '吴志华', '39651', '销售', '0', '5087', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售三组第1小组-组员');
INSERT INTO `table 33` VALUES ('372C5D50ABA0', '孔建成', '35758', '销售', '0', '5087', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售三组第1小组-组员');
INSERT INTO `table 33` VALUES ('24D5C7B6ABB6', '钱辰好', '54880', '销售', '0', '5089', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售三组第2小组-组员');
INSERT INTO `table 33` VALUES ('A93638396810', '王子健', '31932', '销售', '0', '5089', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售三组第2小组-组员');
INSERT INTO `table 33` VALUES ('2F0B77588659', '钟亦夫', '37336', '销售', '0', '5091', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售三组第3小组-组员');
INSERT INTO `table 33` VALUES ('F2225D79DC00', '仇杰', '39628', '销售', '0', '5093', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售三组第4小组-组员');
INSERT INTO `table 33` VALUES ('DCC89FB44051', '丁晨燕', '39670', '销售', '0', '5095', '互联网板块-房产-苏南区-苏南-苏州-苏州-销售三组第5小组-组员');
INSERT INTO `table 33` VALUES ('6063768006B8', '高长升', '37879', '销售', '0', '5106', '互联网板块-房产-东北区-东北区-鞍山-鞍山-销售组-组员');
INSERT INTO `table 33` VALUES ('9F7F6892CB53', '李雪37841', '37841', '销售', '0', '5106', '互联网板块-房产-东北区-东北区-鞍山-鞍山-销售组-组员');
INSERT INTO `table 33` VALUES ('83C47E96AD61', '蔡雯雯', '37862', '销售', '0', '5106', '互联网板块-房产-东北区-东北区-鞍山-鞍山-销售组-组员');
INSERT INTO `table 33` VALUES ('49C25BA17166', '马也', '50107', '销售', '0', '5106', '互联网板块-房产-东北区-东北区-鞍山-鞍山-销售组-组员');
INSERT INTO `table 33` VALUES ('89B2FF137991', '王迪37708', '37708', '销售', '0', '5106', '互联网板块-房产-东北区-东北区-鞍山-鞍山-销售组-组员');
INSERT INTO `table 33` VALUES ('6064698A97D0', '吴献', '37880', '销售', '0', '5106', '互联网板块-房产-东北区-东北区-鞍山-鞍山-销售组-组员');
INSERT INTO `table 33` VALUES ('FCFA09222208', '陈毓家', '30152', '销售', '0', '5106', '互联网板块-房产-东北区-东北区-鞍山-鞍山-销售组-组员');
INSERT INTO `table 33` VALUES ('6.87E+75', '曹枭琰', '32016', '销售', '0', '5112', '互联网板块-房产-上海-上海-上海-上海-公用组-组员');
INSERT INTO `table 33` VALUES ('E15FF9DF6AB7', '张峪', '31006', '销售', '0', '5113', '互联网板块-房产-武汉-武汉-武汉-武汉-销售二部（停）-组员');
INSERT INTO `table 33` VALUES ('B041399E1B0F', '李雪', '30156', '销售', '0', '5115', '互联网板块-房产-东北区-东北区-沈阳-沈阳-公用组-组员');
INSERT INTO `table 33` VALUES ('B63E7DCE0EB5', '杨志', '53268', '销售', '0', '5117', '互联网板块-房产-北方区-北方-保定-保定-销售组-组员');
INSERT INTO `table 33` VALUES ('9C92722C3817', '高颖', '36282', '销售', '0', '5117', '互联网板块-房产-北方区-北方-保定-保定-销售组-组员');
INSERT INTO `table 33` VALUES ('4986E87AB619', '杨小娟', '55312', '销售', '0', '5117', '互联网板块-房产-北方区-北方-保定-保定-销售组-组员');
INSERT INTO `table 33` VALUES ('498616A327B6', '秦英', '55313', '销售', '0', '5117', '互联网板块-房产-北方区-北方-保定-保定-销售组-组员');
INSERT INTO `table 33` VALUES ('1CFEBABF7538', '李腾飞', '53290', '销售', '0', '5117', '互联网板块-房产-北方区-北方-保定-保定-销售组-组员');
INSERT INTO `table 33` VALUES ('B63E9030E3D5', '刘骏', '53244', '销售', '0', '5117', '互联网板块-房产-北方区-北方-保定-保定-销售组-组员');
INSERT INTO `table 33` VALUES ('1CFEAF0050C1', '刘允飞', '53288', '销售', '0', '5117', '互联网板块-房产-北方区-北方-保定-保定-销售组-组员');
INSERT INTO `table 33` VALUES ('4986E3B159B1', '张文凤', '55314', '销售', '0', '5117', '互联网板块-房产-北方区-北方-保定-保定-销售组-组员');
