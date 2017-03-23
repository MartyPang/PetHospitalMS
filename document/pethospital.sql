/*
MySQL Backup
Source Server Version: 5.7.17
Source Database: pet_hospital
Date: 2017/3/19 23:03:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `ph_accesslog`
-- ----------------------------
DROP TABLE IF EXISTS `ph_accesslog`;
CREATE TABLE `ph_accesslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `access_time` datetime NOT NULL,
  `access_ip` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ph_admin`
-- ----------------------------
DROP TABLE IF EXISTS `ph_admin`;
CREATE TABLE `ph_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `last_access_time` datetime NOT NULL,
  `enable` int(11) NOT NULL,
  `authority` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ph_case`
-- ----------------------------
DROP TABLE IF EXISTS `ph_case`;
CREATE TABLE `ph_case` (
  `case_id` int(11) NOT NULL AUTO_INCREMENT,
  `casetype_id` int(11) NOT NULL,
  `casetype_name` varchar(255) NOT NULL,
  `case_name` varchar(255) NOT NULL,
  `case_link` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `reception_des` longtext,
  `reception_pic` varchar(255) DEFAULT '',
  `reception_video` varchar(255) DEFAULT '',
  `examination_des` longtext,
  `examination_pic` varchar(255) DEFAULT '',
  `examination_video` varchar(255) DEFAULT '',
  `diagnosis_des` longtext,
  `diagnosis_pic` varchar(255) DEFAULT '',
  `diagnosis_video` varchar(255) DEFAULT '',
  `treatment_des` longtext,
  `treatment_pic` varchar(255) DEFAULT '',
  `treatment_video` varchar(255) DEFAULT '',
  `status` int(11) NOT NULL,
  PRIMARY KEY (`case_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ph_casetype`
-- ----------------------------
DROP TABLE IF EXISTS `ph_casetype`;
CREATE TABLE `ph_casetype` (
  `casetype_id` int(11) NOT NULL AUTO_INCREMENT,
  `casetype_name` varchar(255) NOT NULL,
  `casetype_desc` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`casetype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ph_department`
-- ----------------------------
DROP TABLE IF EXISTS `ph_department`;
CREATE TABLE `ph_department` (
  `dpm_id` int(11) NOT NULL AUTO_INCREMENT,
  `dpm_name` varchar(255) NOT NULL,
  `dpm_des` varchar(255) NOT NULL,
  `func` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`dpm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ph_image`
-- ----------------------------
DROP TABLE IF EXISTS `ph_image`;
CREATE TABLE `ph_image` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_type` int(11) NOT NULL DEFAULT '0',
  `image_name` varchar(255) NOT NULL DEFAULT '',
  `image_path` varchar(255) NOT NULL,
  `img_s` varchar(255) NOT NULL,
  `img_b` varchar(255) NOT NULL,
  `upload_time` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ph_operatelog`
-- ----------------------------
DROP TABLE IF EXISTS `ph_operatelog`;
CREATE TABLE `ph_operatelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `access_time` datetime NOT NULL,
  `operate` varchar(255) NOT NULL,
  `access_ip` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `operate_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ph_process`
-- ----------------------------
DROP TABLE IF EXISTS `ph_process`;
CREATE TABLE `ph_process` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(255) NOT NULL,
  `p_dpm` int(255) NOT NULL,
  `p_link` varchar(255) NOT NULL,
  `p_content` longtext,
  `p_responsibility` longtext,
  `p_img` varchar(255) DEFAULT '',
  `p_video` varchar(255) DEFAULT '',
  `create_time` datetime NOT NULL,
  `update_time` date NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ph_role`
-- ----------------------------
DROP TABLE IF EXISTS `ph_role`;
CREATE TABLE `ph_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  `role_des` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ph_user`
-- ----------------------------
DROP TABLE IF EXISTS `ph_user`;
CREATE TABLE `ph_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `last_access_time` datetime NOT NULL,
  `enable` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ph_useraccesslog`
-- ----------------------------
DROP TABLE IF EXISTS `ph_useraccesslog`;
CREATE TABLE `ph_useraccesslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `access_time` datetime NOT NULL,
  `access_ip` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ph_useroperatelog`
-- ----------------------------
DROP TABLE IF EXISTS `ph_useroperatelog`;
CREATE TABLE `ph_useroperatelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `access_time` datetime NOT NULL,
  `operate` varchar(255) NOT NULL,
  `access_ip` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `operate_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ph_video`
-- ----------------------------
DROP TABLE IF EXISTS `ph_video`;
CREATE TABLE `ph_video` (
  `video_id` int(11) NOT NULL AUTO_INCREMENT,
  `cover_img` varchar(255) NOT NULL,
  `capture_img` varchar(255) NOT NULL,
  `video_type` int(11) NOT NULL DEFAULT '0',
  `video_name` varchar(255) NOT NULL DEFAULT '',
  `video_path` varchar(255) NOT NULL,
  `transfering` int(255) NOT NULL DEFAULT '0',
  `upload_time` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`video_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `ph_admin` VALUES ('1','1','111111','2017-03-07 16:40:44','2017-03-19 10:42:19','1','1');