/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50158
Source Host           : localhost:3306
Source Database       : pethospital

Target Server Type    : MYSQL
Target Server Version : 50158
File Encoding         : 65001

Date: 2017-03-02 17:42:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ph_accesslog`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ph_accesslog
-- ----------------------------

-- ----------------------------
-- Table structure for `ph_admin`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ph_admin
-- ----------------------------

-- ----------------------------
-- Table structure for `ph_case`
-- ----------------------------
DROP TABLE IF EXISTS `ph_case`;
CREATE TABLE `ph_case` (
  `case_id` int(11) NOT NULL AUTO_INCREMENT,
  `casetype_id` int(11) NOT NULL,
  `case_name` varchar(255) NOT NULL,
  `case_link` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `reception_des` longtext,
  `reception_pic` varchar(255) DEFAULT NULL,
  `reception_video` varchar(255) DEFAULT NULL,
  `examination_des` longtext,
  `examination_pic` varchar(255) DEFAULT NULL,
  `examination_video` varchar(255) DEFAULT NULL,
  `diagnosis_des` longtext,
  `diagnosis_pic` varchar(255) DEFAULT NULL,
  `diagnosis_video` varchar(255) DEFAULT NULL,
  `treatment_des` longtext,
  `treatment_pic` varchar(255) DEFAULT NULL,
  `treatment_video` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ph_case
-- ----------------------------

-- ----------------------------
-- Table structure for `ph_casetype`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ph_casetype
-- ----------------------------

-- ----------------------------
-- Table structure for `ph_department`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ph_department
-- ----------------------------

-- ----------------------------
-- Table structure for `ph_image`
-- ----------------------------
DROP TABLE IF EXISTS `ph_image`;
CREATE TABLE `ph_image` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_type` int(11) NOT NULL DEFAULT '0',
  `image_path` varchar(255) NOT NULL,
  `upload_time` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ph_image
-- ----------------------------

-- ----------------------------
-- Table structure for `ph_operatelog`
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
-- Records of ph_operatelog
-- ----------------------------

-- ----------------------------
-- Table structure for `ph_process`
-- ----------------------------
DROP TABLE IF EXISTS `ph_process`;
CREATE TABLE `ph_process` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(255) NOT NULL,
  `p_dpm` int(255) NOT NULL,
  `p_link` varchar(255) NOT NULL,
  `p_content` longtext,
  `p_responsibility` longtext,
  `p_img` varchar(255) DEFAULT NULL,
  `p_video` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` date NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ph_process
-- ----------------------------

-- ----------------------------
-- Table structure for `ph_role`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ph_role
-- ----------------------------

-- ----------------------------
-- Table structure for `ph_user`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ph_user
-- ----------------------------

-- ----------------------------
-- Table structure for `ph_useraccesslog`
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
-- Records of ph_useraccesslog
-- ----------------------------

-- ----------------------------
-- Table structure for `ph_useroperatelog`
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
-- Records of ph_useroperatelog
-- ----------------------------

-- ----------------------------
-- Table structure for `ph_video`
-- ----------------------------
DROP TABLE IF EXISTS `ph_video`;
CREATE TABLE `ph_video` (
  `video_id` int(11) NOT NULL AUTO_INCREMENT,
  `cover_img` varchar(255) NOT NULL,
  `capture_img` varchar(255) NOT NULL,
  `video_type` int(11) NOT NULL DEFAULT '0',
  `video_path` varchar(255) NOT NULL,
  `upload_time` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ph_video
-- ----------------------------
