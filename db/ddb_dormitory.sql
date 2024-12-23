/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 5.7.18-log : Database - db_dormitory
*********************************************************************
*/

CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_dormitory` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_dormitory`;

/*Table structure for table `adjust_room` */

DROP TABLE IF EXISTS `adjust_room`;

CREATE TABLE `adjust_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL COMMENT '账号',
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `currentroom_id` int(11) NOT NULL COMMENT '当前房间',
  `currentbed_id` int(11) NOT NULL COMMENT '当前床位号',
  `towardsroom_id` int(11) NOT NULL COMMENT '目标房间',
  `towardsbed_id` int(11) NOT NULL COMMENT '目标床位号',
  `state` enum('未处理','通过','驳回') NOT NULL DEFAULT '未处理' COMMENT '申请状态',
  `apply_time` varchar(255) NOT NULL COMMENT '申请时间',
  `finish_time` varchar(255) DEFAULT NULL COMMENT '处理时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `adjust_room` */

insert  into `adjust_room`(`id`,`username`,`name`,`currentroom_id`,`currentbed_id`,`towardsroom_id`,`towardsbed_id`,`state`,`apply_time`,`finish_time`) values 
(2,'stu1','张三',1101,1,1102,4,'通过','2022-02-17 14:35:02','2024-10-19 23:07:21'),
(5,'stu2','田田',1101,2,1104,1,'未处理','2024-10-19 23:05:25',NULL),
(6,'stu3','吉安',1101,3,1104,2,'驳回','2024-10-19 23:05:52','2024-10-19 23:07:37'),
(7,'stu9','德萨',1103,2,1105,1,'未处理','2024-10-19 23:06:18',NULL),
(8,'stu6','泡泡',1102,2,1104,4,'未处理','2024-10-19 23:06:52',NULL);

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `gender` enum('男','女') NOT NULL DEFAULT '男' COMMENT '性别',
  `age` int(11) NOT NULL COMMENT '年龄',
  `phone_num` varchar(11) DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `admin` */

insert  into `admin`(`username`,`password`,`name`,`gender`,`age`,`phone_num`,`email`,`avatar`) values 
('java1234','123456','大强','男',18,'14785412478',NULL,'4eb7dd1d20ad4b68b3b6a39651281537.png');

/*Table structure for table `dorm_build` */

DROP TABLE IF EXISTS `dorm_build`;

CREATE TABLE `dorm_build` (
  `dormbuild_id` int(11) NOT NULL COMMENT '宿舍楼号码',
  `dormbuild_name` varchar(255) NOT NULL COMMENT '宿舍楼名称',
  `dormbuild_detail` varchar(255) NOT NULL COMMENT '宿舍楼备注',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `dorm_build` */

insert  into `dorm_build`(`dormbuild_id`,`dormbuild_name`,`dormbuild_detail`,`id`) values 
(1,'一号楼','男宿舍',1),
(2,'二号楼','女宿舍',2),
(3,'三号楼','男宿舍',3),
(4,'四号楼','女宿舍',4);

/*Table structure for table `dorm_check` */

DROP TABLE IF EXISTS `dorm_check`;

CREATE TABLE `dorm_check` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `roomid` int(11) DEFAULT NULL COMMENT '房间id',
  `grade` varchar(255) DEFAULT NULL COMMENT '及格或者不及格',
  `reason` varchar(255) DEFAULT NULL COMMENT '原因',
  `date` varchar(255) DEFAULT NULL COMMENT '日期',
  `operatorName` varchar(255) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `dorm_check` */

insert  into `dorm_check`(`id`,`roomid`,`grade`,`reason`,`date`,`operatorName`) values 
(1,1003,'及格','123412','2024-10-18 18:06:49','admin'),
(2,1004,'不及格',' 有违纪物','2024-10-18 19:00:46','admin'),
(3,1004,'及格','1243423','2024-10-18 19:15:55','admin'),
(4,1103,'不及格','卫生太差','2024-10-18 19:17:23','admin'),
(5,1003,'及格','1003','2024-10-18 22:06:11','admin'),
(6,111111,'及格','1','2024-10-28 13:26:12','test'),
(7,1103,'及格','sss','2023-05-15 15:58:00','admin');

/*Table structure for table `dorm_electric` */

DROP TABLE IF EXISTS `dorm_electric`;

CREATE TABLE `dorm_electric` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `operatorName` varchar(255) NOT NULL COMMENT '操作人姓名',
  `roomid` int(11) NOT NULL COMMENT '宿舍号',
  `type` varchar(255) NOT NULL COMMENT '类型: 充值/扣费',
  `money` double DEFAULT NULL COMMENT '金额',
  `date` varchar(255) DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1627402260 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `dorm_electric` */

insert  into `dorm_electric`(`id`,`operatorName`,`roomid`,`type`,`money`,`date`) values 
(-1887424511,'stu10',1103,'充值',100,'2024-10-17 22:02:13'),
(247517186,'stu10',1103,'充值',1,'2024-10-17 21:53:06'),
(566243330,'stu10',1103,'充值',0,'2024-10-17 22:02:27'),
(1627402241,'stu10',1103,'充值',120,'2024-10-17 22:02:20'),
(1627402242,'stu10',1103,'充值',12,'2024-10-17 23:06:40'),
(1627402243,'stu10',1103,'充值',123,'2024-10-17 23:06:43'),
(1627402244,'admin',1103,'扣费',100,'2024-10-17 23:12:10'),
(1627402245,'admin',1102,'扣费',1,'2024-10-17 23:18:59'),
(1627402246,'stu10',1103,'充值',12,'2024-10-18 00:20:14'),
(1627402247,'admin',2102,'扣费',1.1,'2024-10-18 15:20:34'),
(1627402248,'stu10',1103,'充值',1.1,'2024-10-18 15:21:39'),
(1627402249,'admin',1103,'扣费',0.5,'2024-10-18 15:33:38'),
(1627402250,'admin',1103,'扣费',1,'2024-10-18 15:33:52'),
(1627402251,'admin',1103,'扣费',10,'2024-10-18 15:34:18'),
(1627402252,'admin',1103,'扣费',0.5,'2024-10-18 15:43:49'),
(1627402253,'admin',1103,'扣费',5,'2024-10-18 16:52:42'),
(1627402254,'admin',6103,'扣费',0.5,'2024-10-18 16:56:37'),
(1627402255,'stu10',1103,'充值',100,'2024-10-18 22:07:14'),
(1627402256,'admin',1103,'扣费',60,'2024-10-18 23:03:37'),
(1627402257,'admin',2102,'扣费',60,'2024-10-18 23:04:19'),
(1627402258,'admin',2102,'扣费',50,'2024-10-18 23:04:54'),
(1627402259,'admin',1103,'扣费',12,'2023-05-15 15:03:07');

/*Table structure for table `dorm_manager` */

DROP TABLE IF EXISTS `dorm_manager`;

CREATE TABLE `dorm_manager` (
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL DEFAULT '123456' COMMENT '密码',
  `dormbuild_id` int(11) NOT NULL COMMENT '所管理的宿舍楼栋号',
  `name` varchar(255) NOT NULL COMMENT '名字',
  `gender` enum('男','女') NOT NULL DEFAULT '男' COMMENT '性别',
  `age` int(11) NOT NULL COMMENT '年龄',
  `phone_num` varchar(11) DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `dorm_manager` */

insert  into `dorm_manager`(`username`,`password`,`dormbuild_id`,`name`,`gender`,`age`,`phone_num`,`email`,`avatar`) values 
('dorm1','123456',1,'张三','男',35,'15995917873',NULL,NULL),
('dorm2','123456',2,'李四','女',55,'15995917874',NULL,NULL),
('dorm3','123456',3,'王五','男',38,'15896875201',NULL,NULL),
('dorm4','123456',4,'赵花','女',40,'15877535247',NULL,NULL);

/*Table structure for table `dorm_room` */

DROP TABLE IF EXISTS `dorm_room`;

CREATE TABLE `dorm_room` (
  `dormroom_id` int(11) NOT NULL COMMENT '宿舍房间号',
  `dormbuild_id` int(11) NOT NULL COMMENT '宿舍楼号',
  `floor_num` int(11) NOT NULL COMMENT '楼层',
  `max_capacity` int(11) NOT NULL DEFAULT '4' COMMENT '房间最大入住人数',
  `current_capacity` int(11) NOT NULL DEFAULT '0' COMMENT '当前房间入住人数',
  `first_bed` varchar(255) DEFAULT NULL COMMENT '一号床位',
  `second_bed` varchar(255) DEFAULT NULL COMMENT '二号床位',
  `third_bed` varchar(255) DEFAULT NULL COMMENT '三号床位',
  `fourth_bed` varchar(255) DEFAULT NULL COMMENT '四号床位',
  PRIMARY KEY (`dormroom_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `dorm_room` */

insert  into `dorm_room`(`dormroom_id`,`dormbuild_id`,`floor_num`,`max_capacity`,`current_capacity`,`first_bed`,`second_bed`,`third_bed`,`fourth_bed`) values 
(1101,1,1,4,3,NULL,'stu2','stu3','stu4'),
(1102,1,1,4,4,'stu5','stu6','stu7','stu1'),
(1103,1,1,4,4,'stu8','stu9','stu10','stu11'),
(1104,1,1,4,0,NULL,NULL,NULL,NULL),
(1105,1,1,4,0,NULL,NULL,NULL,NULL),
(1201,1,2,4,0,NULL,NULL,NULL,NULL),
(1202,1,2,4,0,NULL,NULL,NULL,NULL),
(1203,1,2,4,0,NULL,NULL,NULL,NULL),
(1204,1,2,4,0,NULL,NULL,NULL,NULL),
(1205,1,2,4,0,NULL,NULL,NULL,NULL),
(1301,1,3,4,0,NULL,NULL,NULL,NULL),
(1302,1,3,4,0,NULL,NULL,NULL,NULL),
(1303,1,3,4,0,NULL,NULL,NULL,NULL),
(1304,1,3,4,0,NULL,NULL,NULL,NULL),
(1305,1,3,4,0,NULL,NULL,NULL,NULL),
(2101,2,1,4,3,'stu12','stu13','stu14',NULL),
(2102,2,1,4,0,NULL,NULL,NULL,NULL),
(2103,2,1,4,0,NULL,NULL,NULL,NULL),
(2104,2,1,4,0,NULL,NULL,NULL,NULL),
(2105,2,1,4,0,NULL,NULL,NULL,NULL),
(2201,2,2,4,0,NULL,NULL,NULL,NULL),
(2202,2,2,4,0,NULL,NULL,NULL,NULL),
(2203,2,2,4,0,NULL,NULL,NULL,NULL),
(2204,2,2,4,0,NULL,NULL,NULL,NULL),
(2205,2,2,4,0,NULL,NULL,NULL,NULL),
(2301,2,3,4,0,NULL,NULL,NULL,NULL),
(2302,2,3,4,0,NULL,NULL,NULL,NULL),
(2303,2,3,4,0,NULL,NULL,NULL,NULL),
(2304,2,3,4,0,NULL,NULL,NULL,NULL),
(2305,2,3,4,0,NULL,NULL,NULL,NULL),
(3101,3,1,4,3,'stu15','stu16','stu16',NULL),
(3102,3,1,4,0,NULL,NULL,NULL,NULL),
(3103,3,1,4,0,NULL,NULL,NULL,NULL),
(3104,3,1,4,0,NULL,NULL,NULL,NULL),
(3105,3,1,4,0,NULL,NULL,NULL,NULL),
(3201,3,2,4,0,NULL,NULL,NULL,NULL),
(3202,3,2,4,0,NULL,NULL,NULL,NULL),
(3203,3,2,4,0,NULL,NULL,NULL,NULL),
(3204,3,2,4,0,NULL,NULL,NULL,NULL),
(3205,3,2,4,0,NULL,NULL,NULL,NULL),
(3301,3,3,4,0,NULL,NULL,NULL,NULL),
(3302,3,3,4,0,NULL,NULL,NULL,NULL),
(3303,3,3,4,0,NULL,NULL,NULL,NULL),
(3304,3,3,4,0,NULL,NULL,NULL,NULL),
(3305,3,3,4,0,NULL,NULL,NULL,NULL),
(4101,4,1,4,0,NULL,NULL,NULL,NULL),
(4102,4,1,4,3,'stu17','stu18','stu19',NULL),
(4103,4,1,4,1,'stu20',NULL,NULL,NULL),
(4104,4,1,4,0,NULL,NULL,NULL,NULL),
(4105,4,1,4,0,NULL,NULL,NULL,NULL),
(4201,4,2,4,0,NULL,NULL,NULL,NULL),
(4202,4,2,4,0,NULL,NULL,NULL,NULL),
(4203,4,2,4,0,NULL,NULL,NULL,NULL),
(4204,4,2,4,0,NULL,NULL,NULL,NULL),
(4205,4,2,4,0,NULL,NULL,NULL,NULL),
(4301,4,3,4,0,NULL,NULL,NULL,NULL),
(4302,4,3,4,0,NULL,NULL,NULL,NULL),
(4303,4,3,4,0,NULL,NULL,NULL,NULL),
(4304,4,3,4,0,NULL,NULL,NULL,NULL),
(4305,4,3,4,0,NULL,NULL,NULL,NULL);

/*Table structure for table `dorm_water` */

DROP TABLE IF EXISTS `dorm_water`;

CREATE TABLE `dorm_water` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `operatorName` varchar(255) NOT NULL COMMENT '操作人姓名',
  `roomid` int(11) NOT NULL COMMENT '宿舍号',
  `type` varchar(255) NOT NULL COMMENT '类型: 充值/扣费',
  `money` double DEFAULT NULL COMMENT '金额',
  `date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2126553091 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `dorm_water` */

insert  into `dorm_water`(`id`,`operatorName`,`roomid`,`type`,`money`,`date`) values 
(-1814204414,'admin',1103,'扣费',12,'2023-05-15 13:58:23'),
(-951980030,'stu10',1103,'充值',1,'2024-10-18 23:13:27'),
(-863899647,'admin',1103,'扣费',7.5,'2024-10-18 23:35:19'),
(-713015294,'stu10',1103,'充值',112,'2024-10-18 00:32:06'),
(-633270270,'admin',1103,'扣费',5,'2024-10-18 16:54:56'),
(-490606590,'stu10',1103,'充值',100,'2024-10-18 23:13:10'),
(-293474303,'stu10',1103,'充值',100,'2024-10-19 00:37:51'),
(209731586,'stu10',1103,'充值',12,'2024-10-18 00:32:02'),
(408776706,'stu1',1102,'充值',12,'2023-05-15 14:19:47'),
(767684610,'admin',1103,'扣费',2.5,'2024-10-18 15:35:35'),
(889262082,'admin',1103,'扣费',5,'2024-10-18 16:53:18'),
(1229000705,'admin',21003,'扣费',5,'2024-10-18 16:55:57'),
(1973252098,'admin',1103,'扣费',122,'2023-05-15 13:54:57'),
(2084638721,'stu10',1103,'充值',0.5,'2024-10-18 16:41:30'),
(2126553090,'admin',21003,'扣费',25,'2024-10-18 16:27:58');

/*Table structure for table `health` */

DROP TABLE IF EXISTS `health`;

CREATE TABLE `health` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `username` varchar(255) NOT NULL COMMENT '姓名(学号)',
  `pressure` int(11) NOT NULL COMMENT '血压',
  `glucose` int(11) NOT NULL COMMENT '血糖',
  `oxygen` int(11) NOT NULL COMMENT '血氧',
  `heart` int(11) NOT NULL COMMENT '心跳次数',
  `breathe` int(11) NOT NULL COMMENT '呼吸次数',
  `date` date NOT NULL COMMENT '日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `health` */

insert  into `health`(`id`,`username`,`pressure`,`glucose`,`oxygen`,`heart`,`breathe`,`date`) values 
(1,'test',120,5,99,60,75,'2024-10-12'),
(2,'test',130,4,88,44,55,'2024-10-11'),
(4,'test',123,2,89,44,53,'2024-10-13'),
(5,'test',123,4,44,21,12,'2024-10-10'),
(6,'test',123,2,55,32,13,'2024-10-09'),
(7,'test',123,12,90,34,12,'2024-10-08'),
(8,'stu1',123,2,99,55,66,'2024-10-13'),
(9,'test',123,4,88,66,54,'2024-10-07'),
(10,'test',140,6,98,56,34,'2024-10-06'),
(11,'test',123,3,66,66,44,'2024-10-05'),
(12,'test',133,4,100,67,44,'2024-10-04'),
(13,'test',143,5,99,55,32,'2024-10-03'),
(14,'test',132,4,90,89,54,'2024-10-02'),
(15,'test',156,4,98,44,33,'2024-10-14'),
(16,'test',143,2,88,34,23,'2024-10-01'),
(17,'test',134,3,99,44,23,'2023-02-28'),
(18,'admin',120,3,99,55,55,'2024-10-24'),
(19,'stu11',120,2,99,66,66,'2024-10-30'),
(20,'stu11',111,1,99,44,44,'2024-10-29');

/*Table structure for table `notice` */

DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '主题',
  `content` longtext NOT NULL COMMENT '内容',
  `author` varchar(255) NOT NULL COMMENT '作者',
  `release_time` datetime NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `notice` */

insert  into `notice`(`id`,`title`,`content`,`author`,`release_time`) values 
(1,'入冬提醒','<p>近期我校所在地区天气逐渐降低，同学们要注意多穿衣服，少熬夜，避免感染风寒！</p>','大强','2024-10-14 00:09:08'),
(2,'关于宿舍卫生的新规定','<p>学生公寓是学生们主要的生活区域，兼具休息、学习、交际等多种功能，是培养、提升学生全面素质不可或缺的重要阵地。为了培养学生良好的行为素养和生活习惯，我们实行宿舍长内务准军事化管理，切实把学生公寓建成学生自我教育，自我管理和自我服务的家园。</p>','张三','2024-10-14 00:02:59'),
(3,'期末考试通知','<p>学期末降至，本学期所教授的课程也接近尾声，同学们利用好最后一段时间，好好复习争取考个好成绩！</p>','张三','2024-10-14 01:38:04'),
(10,'关于东总配电室倒闸操作的停电通知','<p>各学院、部处及广大师生员工：</p><p>因中关村校区东总配电室201路高压微机保护故障维修，经校领导批准，我公司定于1月27日晚对东总配电室及下级所属配电室进行相应的停电倒闸操作。请广大师生提前做好停电准备，并在送电后，检查本单位的供电设备运行情况。各配电室具体停电时间如下：</p><p><strong>1月27日/周四 &nbsp;22:00-23:00</strong></p><p><strong>中心教学楼配电室：</strong>中心教学楼、7#教学楼、逸夫楼、4#教学楼</p><p><strong>求是楼配电室：</strong>求是楼、2#楼电话室、10#办公楼、3#教学楼、理工餐厅、菜市场、保卫部、劳服办公楼</p><p><strong>4#教学楼配电室：</strong>三系实验区（南围墙）、图书馆、档案馆</p><p><strong>5#教学楼配电室：</strong>5#教学楼、小白楼、主楼、1#信息楼（原国防科工委）、理工加油站、南围墙三系实验区、车辆实验楼、原东车库实验、四号教学楼一层东侧实验区</p><p><strong>10#信息楼配电室：</strong>10#信息楼、先进加工实验楼、研教楼、8#教学楼、中南门值班室</p><p><strong>东总配：</strong>2#办公楼、招待所、保卫部监控中心、网络信息技术中心、老校史馆、八系重点实验楼、东北门、计算机学院学生工作室、外国专家公寓、原靶道实验室、广播楼、东平房实验室、2#楼电话室</p><p><strong>宇航楼配电室：</strong>宇航楼、1#教学楼、农科院家属楼、东平方实验室（喷涂）</p><p><strong>校医院配电室：</strong>校医院</p>','大强','2024-10-18 17:14:36'),
(12,'中关村校区紧急停热抢修通知','<p>各位师生：您们好</p><p>中关村校区供热主干管突发爆管漏水，系统失压致使供热锅炉停止运行。学生公寓和公共浴室，自今日起停供洗澡水，待管道修复后，恢复供应。给您的生活带来不便，敬请谅解！谢谢您的支持！</p>','大强','2024-10-18 17:15:43'),
(13,'【教师发展中心】教学一对一咨询预约服务','<p>为帮助广大教师解决教学能力提升和职业生涯发展中遇到的问题和困惑，教师发展中心汇聚了多名教学名师和专家，为我校教师提供个性化咨询服务，内容包括课堂教学、教改项目、教学竞赛、教学研究、职业发展规划等方面。欢迎感兴趣的老师报名参与！</p><p>　　【预约方式】</p><p>　　请扫描下方二维码填写信息，我们将尽快和您联系（三个工作日内），安排具体咨询时段。</p>','大强','2024-10-19 00:00:00'),
(14,'2022年寒假网络收费时间','<p>&nbsp;时间：1月19日、1月26日、2月9日、2月16日</p><p>　　&nbsp;&nbsp;&nbsp;&nbsp; 上午9：00—11：30　下午1：30—4：00</p><p>&nbsp;&nbsp;&nbsp; 地点：中关村校区信息中心楼网络信息技术中心314室</p><p>&nbsp;&nbsp;&nbsp; 电话：6891482766</p><p>网络信息技术中心</p>','大强','2024-10-18 17:17:39'),
(15,'2021年度国家社会科学基金项目申报公告','<p><strong>2021年度国家社会科学基金项目申报公告</strong></p><p>经全国哲学社会科学工作领导小组批准，现予发布《国家社科基金项目2021年度课题指南》，并就做好2021年度国家社科基金项目申报工作的有关事项公告如下：</p><p>一、申报国家社科基金项目的指导思想是，高举中国特色社会主义伟大旗帜，以马克思列宁主义、毛泽东思想、邓小平理论、“三个代表”重要思想、科学发展观、习近平新时代中国特色社会主义思想为指导，深入贯彻落实党的十九大和十九届二中、三中、四中、五中全会精神，落实《中共中央关于加快构建中国特色哲学社会科学的意见》，坚持解放思想、实事求是、与时俱进、求真务实，坚持以重大现实问题为主攻方向，坚持基础研究和应用研究并重，发挥国家社科基金示范引导作用，加快构建中国特色哲学社会科学，为党和国家工作大局服务，为繁荣发展哲学社会科学服务。</p><p>二、《国家社科基金项目2021年度课题指南》围绕深入学习贯彻习近平新时代中国特色社会主义思想、党的十九大和十九届二中、三中、四中、五中全会精神，在相关学科中拟定了一批重要选题，申请人可结合自己的学术专长和研究基础选择申报。</p><p>三、申报国家社科基金项目，要体现鲜明的时代特征、问题导向和创新意识，着力推出体现国家水准的研究成果。基础研究要密切跟踪国内外学术发展和学科建设的前沿和动态，着力推进学科体系、学术体系、话语体系建设和创新，力求具有原创性、开拓性和较高的学术思想价值；应用研究要立足党和国家事业发展需要，聚焦经济社会发展中的全局性、战略性和前瞻性的重大理论与实践问题，力求具有现实性、针对性和较强的决策参考价值。</p><p>四、课题申请人须具备下列条件：遵守中华人民共和国宪法和法律；具有独立开展研究和组织开展研究的能力，能够承担实质性研究工作；具有副高级以上（含）专业技术职称（职务），或者具有博士学位。不具有副高级以上（含）专业技术职称（职务）或者博士学位的，可以申请青年项目，不再需要专家书面推荐。青年项目申请人的年龄不得超过35周岁（1986年3月15日后出生）。课题组成员须征得本人同意并签字确认，否则视为违规申报。申请人可以根据研究的实际需要，吸收境外研究人员作为课题组成员参与申请。全日制在读研究生不能申请。在站博士后人员均可申请，其中在职博士后可以从所在工作单位或博士后工作站申请，全脱产博士后从所在博士后工作站申请。</p>','大强','2024-10-18 17:18:27'),
(16,'【百家大讲堂】第361期：流-固-声耦合系统研究及应用','<p>讲座题目：流-固-声耦合系统研究及应用 （Research on Fluid-Structure-Sound Interaction and Applications）</p><p>主讲人：成利</p><p>时 间：2021年12月20日9:30</p><p>地 点：腾讯会议</p><p>会议号： 125 747 249</p><p>承办单位：先进结构技术研究院 校科协</p>','大强','2024-10-18 17:19:00'),
(17,'【教师发展中心】【课程思政】课程思政三问','<p>为帮助我校教师更深入理解课程思政内涵，提升课程思政建设的意识和能力，2022年1月5日，教师发展中心邀请马克思主义学院副教授孙利老师带来“课程思政三问”主题线上讲座，欢迎各位老师报名参加！</p><p>【培训主题】</p><p>课程思政三问</p><p>【培训对象】</p><p>全校教师</p><p>【主要内容】</p><p>1.课程思政是什么？</p><p>2.课程思政为什么？</p><p>3.课程思政怎么办？</p><p>【培训安排】</p><p>形式：线上直播</p><p>时间：2022年1月5日（星期三）14:00&nbsp;-&nbsp;15:30</p><p>地点：腾讯会议835 712 893</p><p>备注：请老师们提前10-15分钟进入会议，并扫描二维码签到。</p>','大强','2024-10-18 17:19:21');

/*Table structure for table `repair` */

DROP TABLE IF EXISTS `repair`;

CREATE TABLE `repair` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `repairer` varchar(255) NOT NULL COMMENT '报修人',
  `dormbuild_id` int(11) NOT NULL COMMENT '报修宿舍楼',
  `dormroom_id` int(11) NOT NULL COMMENT '报修宿舍房间号',
  `title` varchar(255) NOT NULL COMMENT '表单标题',
  `content` longtext NOT NULL COMMENT '表单内容',
  `state` enum('完成','未完成') NOT NULL DEFAULT '未完成' COMMENT '订单状态（是否维修完成）',
  `order_buildtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单创建时间',
  `order_finishtime` datetime DEFAULT NULL COMMENT '订单完成时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1413525505 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `repair` */

insert  into `repair`(`id`,`repairer`,`dormbuild_id`,`dormroom_id`,`title`,`content`,`state`,`order_buildtime`,`order_finishtime`) values 
(-12455934,'张三',1,1101,'阳台漏水','阳台使用时会漏水请来修理','未完成','2024-10-14 20:37:35',NULL),
(1,'强强',1,1101,'水龙头损坏','水龙头损坏，请来1-1101宿舍修理','完成','2022-01-11 22:52:24','2022-02-17 14:35:02'),
(2,'七七',1,1101,'门把手损坏','门把手损坏，请来修理','完成','2022-01-17 23:11:13','2022-02-17 14:31:14'),
(3,'丽丽',2,2102,'水池损坏','水池损坏，请来修理','完成','2022-01-17 23:10:35','2022-02-15 16:16:15'),
(4,'贝贝',1,1102,'阳台漏水','宿舍阳台漏水，速来修理','完成','2022-01-17 23:12:16','2022-02-17 14:32:38'),
(5,'哈哈',1,1101,'窗台损坏','宿舍窗台损坏，速来修理','未完成','2022-02-18 22:35:37',NULL),
(6,'张三',1,1101,'浴室天花板漏水','浴室天花板漏水','完成','2024-10-03 21:00:21','2024-10-10 14:39:10');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `username` varchar(255) NOT NULL COMMENT '学号',
  `password` varchar(32) NOT NULL DEFAULT '123456' COMMENT '密码',
  `age` int(10) unsigned NOT NULL COMMENT '年龄',
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `gender` enum('男','女') NOT NULL DEFAULT '男' COMMENT '性别',
  `phone_num` varchar(11) DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`username`) USING BTREE,
  UNIQUE KEY `stu_num` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `student` */

insert  into `student`(`username`,`password`,`age`,`name`,`gender`,`phone_num`,`email`,`avatar`) values 
('stu1','123456',18,'张三','男','15875696511',NULL,'b9ee71703c9b4765af60b9cfe95d6bda.png'),
('stu10','123456',19,'马克','女','15889635874',NULL,NULL),
('stu11','123456',16,'巧巧','女','18978431781',NULL,NULL),
('stu12','123456',17,'丽丽','女','17986573547',NULL,NULL),
('stu13','123456',18,'美美','女','15896475354',NULL,NULL),
('stu14','123456',20,'拉拉','女','14896527357',NULL,NULL),
('stu15','123456',18,'贝贝','男','15896745351',NULL,NULL),
('stu16','123456',18,'力力','男','14596475257',NULL,NULL),
('stu17','123456',18,'阿成','男','15896542147',NULL,NULL),
('stu18','123456',19,'阿达','女','14785635874',NULL,NULL),
('stu19','123456',19,'帕森斯','男','15889658475',NULL,NULL),
('stu2','123456',18,'田田','男','15875359641',NULL,NULL),
('stu20','123456',21,'柠檬','男','15874563558',NULL,NULL),
('stu21','123456',21,'面对','男','15889635874',NULL,NULL),
('stu22','123456',25,'等等','男','15589963321',NULL,NULL),
('stu3','123456',18,'吉安','男','15798657350',NULL,NULL),
('stu4','123456',22,'力力','男','15878965874',NULL,NULL),
('stu5','123456',19,'哦哦','男','15897535478',NULL,NULL),
('stu6','123456',18,'泡泡','男','18987554765',NULL,NULL),
('stu7','123456',15,'刚刚','男','15897543854',NULL,NULL),
('stu8','123456',18,'七七','男','12332143215',NULL,NULL),
('stu9','123456',20,'德萨','男','15889658741',NULL,NULL);

/*Table structure for table `visitor` */

DROP TABLE IF EXISTS `visitor`;

CREATE TABLE `visitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `gender` enum('男','女') NOT NULL DEFAULT '男' COMMENT '性别',
  `phone_num` varchar(255) NOT NULL COMMENT '电话',
  `origin_city` varchar(255) NOT NULL COMMENT '来源城市',
  `visit_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '来访时间',
  `content` varchar(255) NOT NULL COMMENT '事情',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `visitor` */

insert  into `visitor`(`id`,`name`,`gender`,`phone_num`,`origin_city`,`visit_time`,`content`) values 
(1,'张三','男','14587896544','武汉','2022-02-21 17:34:52','探访孩子'),
(2,'李四','女','15774147563','江苏','2022-01-24 17:08:06','运送快递'),
(3,'啊啊','男','14588635774','湖北','2022-01-27 16:41:21','运送食品');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
