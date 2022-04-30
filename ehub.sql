/*
Navicat MySQL Data Transfer

Source Server         : bce
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : ehub

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2019-05-25 23:19:16
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `attemptedquestions`
-- ----------------------------
DROP TABLE IF EXISTS `attemptedquestions`;
CREATE TABLE `attemptedquestions` (
  `AQID` int(30) NOT NULL AUTO_INCREMENT,
  `QuestionId` int(30) DEFAULT NULL,
  `OptionId` int(30) DEFAULT NULL,
  `ConductedTestId` int(30) DEFAULT NULL,
  PRIMARY KEY (`AQID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of attemptedquestions
-- ----------------------------
INSERT INTO `attemptedquestions` VALUES ('1', '1', '1', '11');
INSERT INTO `attemptedquestions` VALUES ('2', '2', '5', '11');
INSERT INTO `attemptedquestions` VALUES ('6', '3', '11', '13');
INSERT INTO `attemptedquestions` VALUES ('7', '5', '19', '13');
INSERT INTO `attemptedquestions` VALUES ('8', '4', '13', '13');
INSERT INTO `attemptedquestions` VALUES ('11', '45', '170', '15');
INSERT INTO `attemptedquestions` VALUES ('12', '1', '1', '15');
INSERT INTO `attemptedquestions` VALUES ('13', '44', '166', '15');
INSERT INTO `attemptedquestions` VALUES ('14', '44', '166', '16');
INSERT INTO `attemptedquestions` VALUES ('15', '49', '187', '16');

-- ----------------------------
-- Table structure for `categories`
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `CategoryId` int(30) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', 'Topic wise');
INSERT INTO `categories` VALUES ('2', 'Section wise');
INSERT INTO `categories` VALUES ('3', 'Subject wise');

-- ----------------------------
-- Table structure for `conductedtests`
-- ----------------------------
DROP TABLE IF EXISTS `conductedtests`;
CREATE TABLE `conductedtests` (
  `ConductedTestId` int(30) NOT NULL AUTO_INCREMENT,
  `TestId` int(30) DEFAULT NULL,
  `StudentId` int(30) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`ConductedTestId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of conductedtests
-- ----------------------------
INSERT INTO `conductedtests` VALUES ('11', '1', '1', '2018-12-25');
INSERT INTO `conductedtests` VALUES ('13', '3', '2', '2018-12-26');
INSERT INTO `conductedtests` VALUES ('15', '4', '3', '2018-12-31');
INSERT INTO `conductedtests` VALUES ('16', '7', '3', '2019-01-01');

-- ----------------------------
-- Table structure for `departments`
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `DepartmentId` int(30) NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(50) DEFAULT NULL,
  `RegistrationId` int(30) DEFAULT NULL,
  PRIMARY KEY (`DepartmentId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO `departments` VALUES ('1', 'CSE', '1');
INSERT INTO `departments` VALUES ('2', 'ECE', '1');
INSERT INTO `departments` VALUES ('4', 'Numerical', '3');
INSERT INTO `departments` VALUES ('5', 'Practical labs', '3');
INSERT INTO `departments` VALUES ('16', 'ME', '1');
INSERT INTO `departments` VALUES ('17', 'ME', '6');
INSERT INTO `departments` VALUES ('18', 'CSE', '6');
INSERT INTO `departments` VALUES ('19', 'CE', '1');
INSERT INTO `departments` VALUES ('20', 'Grvaity', '7');
INSERT INTO `departments` VALUES ('21', 'Motion', '7');
INSERT INTO `departments` VALUES ('22', 'Sound', '7');

-- ----------------------------
-- Table structure for `events`
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `EventId` int(30) NOT NULL AUTO_INCREMENT,
  `EventName` varchar(50) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Venue` varchar(100) DEFAULT NULL,
  `RefId` int(30) DEFAULT NULL,
  `RefType` varchar(50) DEFAULT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `ImageName` varchar(100) DEFAULT NULL,
  `Status` tinyint(5) DEFAULT NULL,
  `IsOpened` bit(1) DEFAULT NULL,
  PRIMARY KEY (`EventId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of events
-- ----------------------------
INSERT INTO `events` VALUES ('1', 'New Year ', '2018-12-31', 'conference hall', '1', 'Faculty', 'Function', 'as 2018 ends,lets celebrate the beginning of a new year!', '1.jpg', '0', '');
INSERT INTO `events` VALUES ('2', 'Orientation', '2019-01-04', 'ampi theatre', '2', 'Students', 'Seminar', 'Lets welcome new students', '2.jpg', '0', '');
INSERT INTO `events` VALUES ('3', 'Holi', '2019-03-02', 'Institute Ground', '7', 'Student', 'Function', 'Holi function in institute', '1.jpg', '0', '');

-- ----------------------------
-- Table structure for `faculties`
-- ----------------------------
DROP TABLE IF EXISTS `faculties`;
CREATE TABLE `faculties` (
  `FacultyId` int(30) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Gender` varchar(30) DEFAULT NULL,
  `Qualification` varchar(30) DEFAULT NULL,
  `College` varchar(100) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `ContactNo` varchar(20) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `UserId` varchar(100) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `DepartmentId` int(30) DEFAULT NULL,
  PRIMARY KEY (`FacultyId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of faculties
-- ----------------------------
INSERT INTO `faculties` VALUES ('2', 'Priya', 'Female', 'B.tech', 'GZS BTI', '#09,vishal nagar', 'Delhi', '9876656787', 'priya98@gmail.com', 'Priya', '98', '2');
INSERT INTO `faculties` VALUES ('3', 'Akhil', 'Male', 'B.tech', 'RBIT Ropar', '#sco-34,main chownk', 'bilaspur', '8054496160', 'akhilsinghverma@gmail.com', 'khilji', '99', '4');
INSERT INTO `faculties` VALUES ('6', 'Sunita', 'Female', 'M.tech', 'IIT kanpur', '#290,model town,phase-1', 'Bathinda', '8437111144', 'sunitadhir789@gmail.com', 'Sunita', 'sun', '1');
INSERT INTO `faculties` VALUES ('7', 'Antriksh Dhir', 'Male', 'B.Tech', 'Chndigarh Group of College,Landran', '#290,model town,phase-1', 'Bathinda', '8437111144', 'antrikshdhir@gmail.com', 'Dhir', 'dhir', '17');

-- ----------------------------
-- Table structure for `notices`
-- ----------------------------
DROP TABLE IF EXISTS `notices`;
CREATE TABLE `notices` (
  `NoticeId` int(30) NOT NULL AUTO_INCREMENT,
  `Subject` varchar(100) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Description` varchar(300) DEFAULT NULL,
  `FacultyId` int(30) DEFAULT NULL,
  `Status` tinyint(10) DEFAULT NULL,
  PRIMARY KEY (`NoticeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of notices
-- ----------------------------
INSERT INTO `notices` VALUES ('1', 'DBMS', '2018-12-24', 'Test to be conducted on 24/1/2019', '1', '0');
INSERT INTO `notices` VALUES ('3', 'Cn', '2018-11-17', 'results announced for cn.', '6', '0');
INSERT INTO `notices` VALUES ('4', 'Thermodynamics', '2019-01-07', 'Give ur thermodynamics test in ur respective accounts.', '7', '0');

-- ----------------------------
-- Table structure for `options`
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `OptionId` int(30) NOT NULL AUTO_INCREMENT,
  `OptionText` varchar(200) DEFAULT NULL,
  `IsAnswer` bit(10) DEFAULT NULL,
  `QuestionId` int(20) DEFAULT NULL,
  PRIMARY KEY (`OptionId`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of options
-- ----------------------------
INSERT INTO `options` VALUES ('1', 'used to store data in organised manner', '\0', '1');
INSERT INTO `options` VALUES ('2', 'used as an array', '\0\0', '1');
INSERT INTO `options` VALUES ('3', 'a store where data is kept', '\0\0', '1');
INSERT INTO `options` VALUES ('4', 'data can be compiled', '\0\0', '1');
INSERT INTO `options` VALUES ('5', 'internet security organisation', '\0\0', '2');
INSERT INTO `options` VALUES ('6', 'internet safely organized', '\0\0', '2');
INSERT INTO `options` VALUES ('7', 'india safe org', '\0', '2');
INSERT INTO `options` VALUES ('8', 'international organisation for standardization', '\0\0', '2');
INSERT INTO `options` VALUES ('9', 'interanet poll', '\0\0', '3');
INSERT INTO `options` VALUES ('10', 'intricate pool', '\0\0', '3');
INSERT INTO `options` VALUES ('11', 'internet protocol', '\0', '3');
INSERT INTO `options` VALUES ('12', 'internet person', '\0\0', '3');
INSERT INTO `options` VALUES ('13', 'exor and gate', '\0', '4');
INSERT INTO `options` VALUES ('14', 'exor  not+and gate', '\0\0', '4');
INSERT INTO `options` VALUES ('15', 'exnor and or gate', '\0\0', '4');
INSERT INTO `options` VALUES ('16', 'exnor and+not gate', '\0\0', '4');
INSERT INTO `options` VALUES ('17', 'arrays', '\0\0', '5');
INSERT INTO `options` VALUES ('18', 'linked lists', '\0\0', '5');
INSERT INTO `options` VALUES ('19', 'arrays and inked lists', '\0', '5');
INSERT INTO `options` VALUES ('20', 'none ', '\0\0', '5');
INSERT INTO `options` VALUES ('145', '28-Jan-98', '\00', '54');
INSERT INTO `options` VALUES ('146', '23-Jan-96', '\01', '54');
INSERT INTO `options` VALUES ('147', '23-Feb-96', '\00', '54');
INSERT INTO `options` VALUES ('148', '28-Feb-98', '\00', '54');
INSERT INTO `options` VALUES ('149', '28-Jan-98', '\00', '56');
INSERT INTO `options` VALUES ('150', '23-Jan-96', '\01', '56');
INSERT INTO `options` VALUES ('151', '23-Feb-96', '\00', '56');
INSERT INTO `options` VALUES ('152', '28-Feb-98', '\00', '56');
INSERT INTO `options` VALUES ('158', 'ryan reynolds', '\00', '55');
INSERT INTO `options` VALUES ('159', 'james arthur', '\00', '55');
INSERT INTO `options` VALUES ('160', 'james gosling', '\01', '55');
INSERT INTO `options` VALUES ('161', 'ryan gosling', '\00', '57');
INSERT INTO `options` VALUES ('162', 'ryan reynolds', '\00', '57');
INSERT INTO `options` VALUES ('163', 'james arthur', '\00', '57');
INSERT INTO `options` VALUES ('164', 'james gosling', '\01', '57');
INSERT INTO `options` VALUES ('165', '28-Jan-98', '\00', '44');
INSERT INTO `options` VALUES ('166', '23-Jan-96', '\01', '44');
INSERT INTO `options` VALUES ('167', '23-Feb-96', '\00', '44');
INSERT INTO `options` VALUES ('168', '28-Feb-98', '\00', '44');
INSERT INTO `options` VALUES ('169', 'ryan gosling', '\00', '45');
INSERT INTO `options` VALUES ('170', 'ryan reynolds', '\00', '45');
INSERT INTO `options` VALUES ('171', 'james arthur', '\00', '45');
INSERT INTO `options` VALUES ('172', 'james gosling', '\01', '45');
INSERT INTO `options` VALUES ('173', '28-Jan-98', '\00', '48');
INSERT INTO `options` VALUES ('174', '23-Jan-96', '\01', '48');
INSERT INTO `options` VALUES ('175', '23-Feb-96', '\00', '48');
INSERT INTO `options` VALUES ('176', '28-Feb-98', '\00', '48');
INSERT INTO `options` VALUES ('177', '28-Jan-98', '\00', '50');
INSERT INTO `options` VALUES ('178', '23-Jan-96', '\01', '50');
INSERT INTO `options` VALUES ('179', '23-Feb-96', '\00', '50');
INSERT INTO `options` VALUES ('180', '28-Feb-98', '\00', '50');
INSERT INTO `options` VALUES ('181', '28-Jan-98', '\00', '52');
INSERT INTO `options` VALUES ('182', '23-Jan-96', '\01', '52');
INSERT INTO `options` VALUES ('183', '23-Feb-96', '\00', '52');
INSERT INTO `options` VALUES ('184', '28-Feb-98', '\00', '52');
INSERT INTO `options` VALUES ('185', 'ryan gosling', '\00', '49');
INSERT INTO `options` VALUES ('186', 'ryan reynolds', '\00', '49');
INSERT INTO `options` VALUES ('187', 'james arthur', '\00', '49');
INSERT INTO `options` VALUES ('188', 'james gosling', '\01', '49');
INSERT INTO `options` VALUES ('189', 'ryan gosling', '\00', '51');
INSERT INTO `options` VALUES ('190', 'ryan reynolds', '\00', '51');
INSERT INTO `options` VALUES ('191', 'james arthur', '\00', '51');
INSERT INTO `options` VALUES ('192', 'james gosling', '\01', '51');
INSERT INTO `options` VALUES ('193', 'ryan gosling', '\00', '53');
INSERT INTO `options` VALUES ('194', 'ryan reynolds', '\00', '53');
INSERT INTO `options` VALUES ('195', 'james arthur', '\00', '53');
INSERT INTO `options` VALUES ('196', 'james gosling', '\01', '53');
INSERT INTO `options` VALUES ('197', null, null, null);
INSERT INTO `options` VALUES ('198', '28-Jan-98', '\00', '58');
INSERT INTO `options` VALUES ('199', '23-Jan-96', '\01', '58');
INSERT INTO `options` VALUES ('200', '23-Feb-96', '\00', '58');
INSERT INTO `options` VALUES ('201', '28-Feb-98', '\00', '58');
INSERT INTO `options` VALUES ('202', 'ryan gosling', '\00', '59');
INSERT INTO `options` VALUES ('203', 'ryan reynolds', '\00', '59');
INSERT INTO `options` VALUES ('204', 'james arthur', '\00', '59');
INSERT INTO `options` VALUES ('205', 'james gosling', '\01', '59');
INSERT INTO `options` VALUES ('206', '28-Jan-98', '\00', '60');
INSERT INTO `options` VALUES ('207', '23-Jan-96', '\01', '60');
INSERT INTO `options` VALUES ('208', '23-Feb-96', '\00', '60');
INSERT INTO `options` VALUES ('209', '28-Feb-98', '\00', '60');
INSERT INTO `options` VALUES ('210', '28-Jan-98', '\00', '61');
INSERT INTO `options` VALUES ('211', '23-Jan-96', '\01', '61');
INSERT INTO `options` VALUES ('212', '23-Feb-96', '\00', '61');
INSERT INTO `options` VALUES ('213', '28-Feb-98', '\00', '61');
INSERT INTO `options` VALUES ('214', '28-Jan-98', '\00', '62');
INSERT INTO `options` VALUES ('215', '23-Jan-96', '\01', '62');
INSERT INTO `options` VALUES ('216', '23-Feb-96', '\00', '62');
INSERT INTO `options` VALUES ('217', '28-Feb-98', '\00', '62');
INSERT INTO `options` VALUES ('218', 'ryan gosling', '\00', '63');
INSERT INTO `options` VALUES ('219', 'ryan reynolds', '\00', '63');
INSERT INTO `options` VALUES ('220', 'james arthur', '\00', '63');
INSERT INTO `options` VALUES ('221', 'james gosling', '\01', '63');
INSERT INTO `options` VALUES ('222', 'ryan gosling', '\00', '64');
INSERT INTO `options` VALUES ('223', 'ryan reynolds', '\00', '64');
INSERT INTO `options` VALUES ('224', 'james arthur', '\00', '64');
INSERT INTO `options` VALUES ('225', 'james gosling', '\01', '64');
INSERT INTO `options` VALUES ('226', 'ryan gosling', '\00', '65');
INSERT INTO `options` VALUES ('227', 'ryan reynolds', '\00', '65');
INSERT INTO `options` VALUES ('228', 'james arthur', '\00', '65');
INSERT INTO `options` VALUES ('229', 'james gosling', '\01', '65');
INSERT INTO `options` VALUES ('230', null, null, null);

-- ----------------------------
-- Table structure for `questions`
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `QuestionId` int(30) NOT NULL AUTO_INCREMENT,
  `QuestionText` varchar(100) DEFAULT NULL,
  `CategoryId` int(30) DEFAULT NULL,
  PRIMARY KEY (`QuestionId`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES ('1', 'what do u mean by databases', '1');
INSERT INTO `questions` VALUES ('2', 'what is iso?', '1');
INSERT INTO `questions` VALUES ('3', 'IP address full form', '2');
INSERT INTO `questions` VALUES ('4', 'Half adder logic is', '2');
INSERT INTO `questions` VALUES ('5', 'stacks can be implemeted by', '2');
INSERT INTO `questions` VALUES ('44', 'When was java released', '3');
INSERT INTO `questions` VALUES ('45', 'Who was the developer of java', '3');
INSERT INTO `questions` VALUES ('48', 'When was java released', '3');
INSERT INTO `questions` VALUES ('49', 'Who was the developer of java', '3');
INSERT INTO `questions` VALUES ('50', 'When was java released', '1');
INSERT INTO `questions` VALUES ('51', 'Who was the developer of java', '2');

-- ----------------------------
-- Table structure for `records`
-- ----------------------------
DROP TABLE IF EXISTS `records`;
CREATE TABLE `records` (
  `RecordId` int(30) NOT NULL AUTO_INCREMENT,
  `Exam` varchar(50) DEFAULT NULL,
  `Enroll2018` int(30) DEFAULT NULL,
  `Enroll2017` int(30) DEFAULT NULL,
  `Enroll2016` int(30) DEFAULT NULL,
  `Enroll2015` int(30) DEFAULT NULL,
  `Enroll2014` int(30) DEFAULT NULL,
  `Select2018` int(30) DEFAULT NULL,
  `Select2017` int(30) DEFAULT NULL,
  `Select2016` int(30) DEFAULT NULL,
  `Select2015` int(30) DEFAULT NULL,
  `Select2014` int(30) DEFAULT NULL,
  `RegistrationId` int(30) DEFAULT NULL,
  PRIMARY KEY (`RecordId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of records
-- ----------------------------
INSERT INTO `records` VALUES ('2', 'IIT Mains', '50', '40', '30', '20', '10', '20', '16', '10', '7', '5', '1');
INSERT INTO `records` VALUES ('4', 'NEET', '38', '45', '50', '40', '35', '15', '24', '30', '20', '17', '1');
INSERT INTO `records` VALUES ('5', 'IIT Mains', '40', '38', '36', '34', '32', '20', '18', '16', '14', '12', '2');
INSERT INTO `records` VALUES ('6', 'NEET', '80', '75', '82', '78', '73', '59', '62', '45', '50', '48', '2');
INSERT INTO `records` VALUES ('7', 'GATE', '100', '120', '110', '105', '115', '10', '12', '8', '11', '9', '6');

-- ----------------------------
-- Table structure for `registeredstudents`
-- ----------------------------
DROP TABLE IF EXISTS `registeredstudents`;
CREATE TABLE `registeredstudents` (
  `StudentId` int(30) DEFAULT NULL,
  `EventId` int(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of registeredstudents
-- ----------------------------
INSERT INTO `registeredstudents` VALUES ('1', '1');
INSERT INTO `registeredstudents` VALUES ('1', '2');
INSERT INTO `registeredstudents` VALUES ('2', '1');
INSERT INTO `registeredstudents` VALUES ('3', '3');

-- ----------------------------
-- Table structure for `registrations`
-- ----------------------------
DROP TABLE IF EXISTS `registrations`;
CREATE TABLE `registrations` (
  `RegistrationID` int(20) NOT NULL AUTO_INCREMENT,
  `UserID` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `InstituteName` varchar(100) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `MobileNo` varchar(20) DEFAULT NULL,
  `EmailID` varchar(100) DEFAULT NULL,
  `SecurityQuestion` varchar(100) DEFAULT NULL,
  `Answer` varchar(20) DEFAULT NULL,
  `Code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`RegistrationID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of registrations
-- ----------------------------
INSERT INTO `registrations` VALUES ('1', 'Kanishka', '12', 'Ganpati Coaching classes', '#290,Model Town,Phase-1', 'Bathinda', null, 'dhir.kanish@gmail.com', 'How many floors are there in your house?', '123', '1234');
INSERT INTO `registrations` VALUES ('2', 'deepak', '09', 'Chemistry Classes', 'scf-1024,sector-34-c', 'chandigarh', null, 'deepakorg@gmail.com', 'What\'s your pet name?', 'tommy', '12345');
INSERT INTO `registrations` VALUES ('3', 'Newton', '22', 'Newton Physics Institute', '#sco-34,main chownk', 'bilaspur', null, 'newtonverma@gmail.com', 'What company mobile do u own>', 'htc', 'tc');
INSERT INTO `registrations` VALUES ('6', 'Antriksh', 'ant', 'Gate Coaching', '#290,model town,phase-1', 'Bathinda', '8437111144', 'antrikshdhir@gmail.com', 'What\'s your pet name?', 'df', 'df');
INSERT INTO `registrations` VALUES ('7', 'Akhil', 'akhil', 'Akhil Phsics Institute', '#39,Street no.9,Ajit Road', 'Bathinda', '8054496160', 'akhilsinghverma', 'How many floors are there in your house?', '7', '7');

-- ----------------------------
-- Table structure for `scheduledtests`
-- ----------------------------
DROP TABLE IF EXISTS `scheduledtests`;
CREATE TABLE `scheduledtests` (
  `STID` int(30) NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL,
  `LastDate` date DEFAULT NULL,
  `FacultyId` int(30) DEFAULT NULL,
  `CategoryId` int(30) DEFAULT NULL,
  `NOQ` int(30) DEFAULT NULL,
  `Duration` int(255) DEFAULT NULL,
  PRIMARY KEY (`STID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of scheduledtests
-- ----------------------------
INSERT INTO `scheduledtests` VALUES ('1', '2018-10-10', '2018-11-10', '1', '1', '2', '60');
INSERT INTO `scheduledtests` VALUES ('3', '2018-11-17', '2018-11-27', '1', '2', '3', '20');
INSERT INTO `scheduledtests` VALUES ('4', '2018-12-31', '2019-01-31', '7', '1', '4', '20');
INSERT INTO `scheduledtests` VALUES ('5', '2018-12-31', '2019-01-31', '7', '2', '4', '20');
INSERT INTO `scheduledtests` VALUES ('6', '2018-12-31', '2019-01-31', '7', '1', '5', '25');
INSERT INTO `scheduledtests` VALUES ('7', '2019-01-01', '2019-01-10', '7', '3', '7', '30');
INSERT INTO `scheduledtests` VALUES ('8', '2019-01-07', '2019-02-10', '7', '2', '4', '15');

-- ----------------------------
-- Table structure for `students`
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `StudentId` int(30) NOT NULL AUTO_INCREMENT,
  `StudentName` varchar(50) DEFAULT NULL,
  `Gender` varchar(50) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Contact` varchar(30) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `UserId` varchar(100) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `FacultyId` int(30) DEFAULT NULL,
  PRIMARY KEY (`StudentId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES ('1', 'Preet', 'Female', '1999-07-25', '8437111144', 'dhir.preet@gmail.com', 'Preet', '00', '1');
INSERT INTO `students` VALUES ('2', 'harsh', 'Male', '1995-04-03', '9876543210', 'harsh@gmail.com', 'harsh', '00', '1');
INSERT INTO `students` VALUES ('3', 'Aditya', 'Male', '2003-07-31', '8437111144', 'adityadhir@gmail.com', 'Aditya', 'adi', '7');
