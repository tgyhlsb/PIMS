/*
Navicat MySQL Data Transfer

Source Server         : cxz
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : pims

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2014-12-03 21:25:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `course_id` int(20) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(45) DEFAULT NULL,
  `course_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6584 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('8', 'Computer Science', '');
INSERT INTO `course` VALUES ('14', 'Advanced Computer Science', null);
INSERT INTO `course` VALUES ('6583', 'Computer Security', null);

-- ----------------------------
-- Table structure for first_inspection
-- ----------------------------
DROP TABLE IF EXISTS `first_inspection`;
CREATE TABLE `first_inspection` (
  `first_inspection_id` int(20) NOT NULL AUTO_INCREMENT,
  `student_id` int(20) DEFAULT '0',
  `inspector_id` int(20) DEFAULT NULL,
  `module_id` int(20) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `first_inspectioncol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`first_inspection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of first_inspection
-- ----------------------------

-- ----------------------------
-- Table structure for inspector
-- ----------------------------
DROP TABLE IF EXISTS `inspector`;
CREATE TABLE `inspector` (
  `username` char(20) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `inspector_id` int(45) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `capacity` int(45) DEFAULT NULL,
  PRIMARY KEY (`inspector_id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=383 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inspector
-- ----------------------------
INSERT INTO `inspector` VALUES ('Zhiwei', 'Zhiwei', '1', 'Mr.', 'Zhiwei', 'Liu', null, null);

-- ----------------------------
-- Table structure for inspector_keyword
-- ----------------------------
DROP TABLE IF EXISTS `inspector_keyword`;
CREATE TABLE `inspector_keyword` (
  `inspector_keyword_id` int(20) NOT NULL AUTO_INCREMENT,
  `inspector_id` int(20) DEFAULT NULL,
  `keyword_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`inspector_keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inspector_keyword
-- ----------------------------

-- ----------------------------
-- Table structure for keyword
-- ----------------------------
DROP TABLE IF EXISTS `keyword`;
CREATE TABLE `keyword` (
  `keyword_id` int(20) NOT NULL AUTO_INCREMENT,
  `keyword_name` varchar(45) DEFAULT NULL,
  `module_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`keyword_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of keyword
-- ----------------------------
INSERT INTO `keyword` VALUES ('1', 'artificial', '26581');
INSERT INTO `keyword` VALUES ('2', 'www', '26581');

-- ----------------------------
-- Table structure for module
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `module_id` int(20) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(45) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `students_enrolled` int(45) DEFAULT NULL,
  `inspector_available` int(45) DEFAULT NULL,
  `default_inspector_capacity` int(45) DEFAULT NULL,
  `first_inspection_start_date` datetime(6) DEFAULT NULL,
  `first_inspection_end_date` datetime(6) DEFAULT NULL,
  `second_inspection_start_date` datetime(6) DEFAULT NULL,
  `second_inspection_end_date` datetime(6) DEFAULT NULL,
  `dissertation_deadline` datetime(6) DEFAULT NULL,
  `pc_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26588 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES ('26581', 'BSc project', '2014/15', '2014-09-30 12:00:51.000000', '2015-06-01 00:00:33.000000', null, null, '4', '2014-12-01 00:00:25.000000', '2014-11-10 00:00:43.000000', '2015-05-01 00:00:53.000000', '2014-11-14 00:00:14.000000', null, null);
INSERT INTO `module` VALUES ('26584', 'BSc project', '2013/14', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `module` VALUES ('26587', 'MSc project', '2014/15', null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for project_coordinator
-- ----------------------------
DROP TABLE IF EXISTS `project_coordinator`;
CREATE TABLE `project_coordinator` (
  `username` char(20) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `pc_id` int(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_coordinator
-- ----------------------------
INSERT INTO `project_coordinator` VALUES ('hxs235', 'hxs235', '1', 'Prof.', 'He', 'Shan', 'hxs235@bham.ac.uk');
INSERT INTO `project_coordinator` VALUES ('jxh123', 'jxh123', '2', 'Ms.', 'Julie', 'Heathcote', 'jxh123@bham.ac.uk');
INSERT INTO `project_coordinator` VALUES ('Jane2', 'jane', '3', 'Mr.', 'Jane', null, 'jane@bham.ac.uk');

-- ----------------------------
-- Table structure for second_inspection
-- ----------------------------
DROP TABLE IF EXISTS `second_inspection`;
CREATE TABLE `second_inspection` (
  `second_inspection_id` int(20) NOT NULL AUTO_INCREMENT,
  `student_id` int(20) DEFAULT NULL,
  `inspector_id` int(20) DEFAULT NULL,
  `modeule_id` int(20) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `second_inspectioncol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`second_inspection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of second_inspection
-- ----------------------------

-- ----------------------------
-- Table structure for slot
-- ----------------------------
DROP TABLE IF EXISTS `slot`;
CREATE TABLE `slot` (
  `slot_id` int(20) NOT NULL AUTO_INCREMENT,
  `start_date` datetime(6) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `student_id` int(20) DEFAULT NULL,
  `inspector_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`slot_id`),
  KEY `student_id` (`student_id`),
  KEY `inspector_id` (`inspector_id`),
  CONSTRAINT `slot_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `slot_ibfk_2` FOREIGN KEY (`inspector_id`) REFERENCES `inspector` (`inspector_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of slot
-- ----------------------------
INSERT INTO `slot` VALUES ('2', '2014-11-11 11:30:00.000000', '2014-11-11 14:00:00.000000', '1', null);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `student_id` int(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `project_title` varchar(255) DEFAULT NULL,
  `project_description` varchar(255) DEFAULT NULL,
  `supervisor` varchar(45) DEFAULT NULL,
  `username` char(20) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `module_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `module_id` (`module_id`),
  KEY `supervisor` (`supervisor`),
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`),
  CONSTRAINT `student_ibfk_3` FOREIGN KEY (`supervisor`) REFERENCES `inspector` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', 'Chenxin', 'Zhao', 'cxz413@bham.ac.uk', null, 'Artificital', 'Zhiwei', 'cxz413', 'cxz413', '26581');

-- ----------------------------
-- Table structure for student_keyword
-- ----------------------------
DROP TABLE IF EXISTS `student_keyword`;
CREATE TABLE `student_keyword` (
  `student_keyword_id` int(20) NOT NULL AUTO_INCREMENT,
  `keyword_id` int(20) DEFAULT NULL,
  `student_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`student_keyword_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_keyword
-- ----------------------------
INSERT INTO `student_keyword` VALUES ('10', '2', '1');
INSERT INTO `student_keyword` VALUES ('13', '1', '2');
INSERT INTO `student_keyword` VALUES ('14', '1', '3');
INSERT INTO `student_keyword` VALUES ('15', '2', '3');
INSERT INTO `student_keyword` VALUES ('16', '3', '3');
