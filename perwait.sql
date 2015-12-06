/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50529
Source Host           : localhost:3306
Source Database       : perwait

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2015-11-22 22:15:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for group
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `gid` int(5) NOT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group
-- ----------------------------

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `pid` int(5) NOT NULL,
  `tid` int(5) unsigned NOT NULL,
  `pname` varchar(40) NOT NULL,
  `particle` varchar(8000) DEFAULT NULL,
  `pdate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `pauthor` varchar(16) NOT NULL,
  `preplies` int(5) unsigned DEFAULT '0',
  `pclicks` int(5) unsigned DEFAULT '0',
  `ptheme` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`pid`,`tid`),
  KEY `author` (`pauthor`) USING BTREE,
  KEY `id` (`tid`) USING BTREE,
  CONSTRAINT `p_author` FOREIGN KEY (`pauthor`) REFERENCES `usr` (`uname`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_id` FOREIGN KEY (`tid`) REFERENCES `theme` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES ('1', '13', '蒲苇网，轻松您的生活', '', '2015-11-22 21:31:41', 'admin', '0', '0', null);
INSERT INTO `posts` VALUES ('1', '14', 'BUG BUG 快粗来', 'null', '2015-11-22 21:34:25', 'admin', '0', '0', null);
INSERT INTO `posts` VALUES ('1', '15', '笨蛋工程师', '说好的音乐播放器呢<br><br>说好的图片功能的<br><br>你妹啊  快发粗来', '2015-11-22 21:41:01', 'admin', '0', '0', null);

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `rid` int(5) unsigned NOT NULL,
  `tname` varchar(20) NOT NULL,
  `pid` int(5) NOT NULL,
  `rarticle` varchar(8000) DEFAULT NULL,
  `rauthor` varchar(20) NOT NULL,
  `rdate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `rshow` char(1) DEFAULT '0',
  `rshowdate` datetime DEFAULT NULL,
  PRIMARY KEY (`rid`,`pid`,`tname`),
  KEY `tname` (`tname`),
  KEY `pid` (`pid`) USING BTREE,
  KEY `rauthor` (`rauthor`) USING BTREE,
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`rauthor`) REFERENCES `usr` (`uname`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reply_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `posts` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reply_ibfk_3` FOREIGN KEY (`tname`) REFERENCES `theme` (`tname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES ('1', '布告栏', '1', '客观稍等··楼主吃饱饭在回来更新<br><br>稍等~', 'admin', '2015-11-22 21:33:05', '0', null);

-- ----------------------------
-- Table structure for theme
-- ----------------------------
DROP TABLE IF EXISTS `theme`;
CREATE TABLE `theme` (
  `tid` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `tname` varchar(14) NOT NULL,
  `tdate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `tarticle` varchar(30) DEFAULT NULL,
  `tauthor` varchar(20) NOT NULL,
  `tlv` char(1) DEFAULT NULL,
  `tlogo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tid`,`tname`),
  KEY `id索引` (`tid`),
  KEY `tauthor` (`tauthor`) USING BTREE,
  KEY `tname` (`tname`),
  CONSTRAINT `t_author` FOREIGN KEY (`tauthor`) REFERENCES `usr` (`uname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of theme
-- ----------------------------
INSERT INTO `theme` VALUES ('13', '布告栏', '2015-11-22 21:29:26', null, 'admin', null, null);
INSERT INTO `theme` VALUES ('14', '服务台', '2015-11-22 21:29:47', null, 'admin', null, null);
INSERT INTO `theme` VALUES ('15', '吐槽星人专区', '2015-11-22 21:30:06', null, 'admin', null, null);

-- ----------------------------
-- Table structure for usr
-- ----------------------------
DROP TABLE IF EXISTS `usr`;
CREATE TABLE `usr` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uname` varchar(16) NOT NULL,
  `upw` varchar(20) NOT NULL,
  `ulv` varchar(4) DEFAULT '0',
  `uqq` varchar(15) DEFAULT NULL,
  `uemail` varchar(40) DEFAULT NULL,
  `usex` char(1) DEFAULT NULL,
  `uage` char(3) DEFAULT NULL,
  `usign` varchar(100) DEFAULT NULL,
  `uregdate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `uimg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`,`uname`),
  KEY `uname` (`uname`),
  KEY `uimg` (`uimg`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usr
-- ----------------------------

INSERT INTO `usr` VALUES ('4', 'test', 'test', '0', null, '', null, null, null, null, null);
INSERT INTO `usr` VALUES ('5', 'haha', 'haha', '0', null, '', null, null, null, null, null);

-- ----------------------------
-- View structure for usr_posts
-- ----------------------------
DROP VIEW IF EXISTS `usr_posts`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `usr_posts` AS select * from posts p,usr u where p.pauthor=u.uname ;
