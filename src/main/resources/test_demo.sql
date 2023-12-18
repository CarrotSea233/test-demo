/*
 Navicat MySQL Data Transfer

 Source Server         : bei_gou
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : test_demo

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 02/07/2023 23:23:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for administrator_information
-- ----------------------------
DROP TABLE IF EXISTS `administrator_information`;
CREATE TABLE `administrator_information`  (
  `admin_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL COMMENT '用户id',
  `user_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '管理员姓名',
  `gender` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '性别',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of administrator_information
-- ----------------------------
INSERT INTO `administrator_information` VALUES (1, 1, '林超', '男', 20);
INSERT INTO `administrator_information` VALUES (2, 3, '无名客', '男', 20);
INSERT INTO `administrator_information` VALUES (3, 4, '无名客', '男', 20);
INSERT INTO `administrator_information` VALUES (4, 5, '无名客', '男', 20);

-- ----------------------------
-- Table structure for examination
-- ----------------------------
DROP TABLE IF EXISTS `examination`;
CREATE TABLE `examination`  (
  `exam_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `creation_time` datetime NULL DEFAULT NULL,
  `modification_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`exam_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of examination
-- ----------------------------
INSERT INTO `examination` VALUES (2, 'java作业一', '2023-06-30 09:45:56', '2023-06-30 09:45:56');
INSERT INTO `examination` VALUES (3, 'java作业二', '2023-06-30 09:47:06', '2023-06-30 09:47:06');
INSERT INTO `examination` VALUES (5, 'java作业五', '2023-06-30 09:57:07', '2023-06-30 09:57:07');
INSERT INTO `examination` VALUES (6, 'java作业七', '2023-06-30 10:02:23', '2023-06-30 15:39:36');
INSERT INTO `examination` VALUES (7, 'java作业七', '2023-06-30 21:55:06', '2023-06-30 22:22:45');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `log_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NULL DEFAULT NULL,
  `log_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `state` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (1, 1, '2023-07-02 10:06:51', 'logout');
INSERT INTO `log` VALUES (2, 12, '2023-07-02 10:07:10', 'login');
INSERT INTO `log` VALUES (4, 1, '2023-07-02 10:07:36', 'login');
INSERT INTO `log` VALUES (6, 18, '2023-07-02 16:30:26', 'login');
INSERT INTO `log` VALUES (7, 18, '2023-07-02 16:30:28', 'logout');
INSERT INTO `log` VALUES (8, 1, '2023-07-02 16:30:34', 'login');
INSERT INTO `log` VALUES (9, 1, '2023-07-02 17:04:38', 'logout');
INSERT INTO `log` VALUES (10, 12, '2023-07-02 17:04:43', 'login');
INSERT INTO `log` VALUES (11, 12, '2023-07-02 17:04:55', 'logout');
INSERT INTO `log` VALUES (12, 18, '2023-07-02 17:05:05', 'login');
INSERT INTO `log` VALUES (13, 18, '2023-07-02 20:33:50', 'logout');
INSERT INTO `log` VALUES (14, 12, '2023-07-02 20:33:55', 'login');
INSERT INTO `log` VALUES (15, 12, '2023-07-02 23:13:39', 'logout');
INSERT INTO `log` VALUES (16, 1, '2023-07-02 23:13:45', 'login');
INSERT INTO `log` VALUES (17, 1, '2023-07-02 23:18:33', 'logout');
INSERT INTO `log` VALUES (18, 12, '2023-07-02 23:18:39', 'login');
INSERT INTO `log` VALUES (19, 12, '2023-07-02 23:18:52', 'logout');
INSERT INTO `log` VALUES (20, 18, '2023-07-02 23:19:03', 'login');

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login`  (
  `user_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `identity` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '身份',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES (1, 'admin', '123456', 'admin');
INSERT INTO `login` VALUES (3, 'root', '123456', 'admin');
INSERT INTO `login` VALUES (4, 'test', '123456', 'admin');
INSERT INTO `login` VALUES (8, 'teacher01', '123456', 'teacher');
INSERT INTO `login` VALUES (9, 'teacher02', '123456', 'teacher');
INSERT INTO `login` VALUES (11, 'teacher04', '123456', 'teacher');
INSERT INTO `login` VALUES (12, 'teacher', '123456', 'teacher');
INSERT INTO `login` VALUES (15, '202113143000035', '123456', 'student');
INSERT INTO `login` VALUES (18, '202113143000039', '123456', 'student');
INSERT INTO `login` VALUES (21, '202113143000046', '123456', 'student');
INSERT INTO `login` VALUES (22, 'auto_teacher', '123456', 'teacher');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `question_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `question_types` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `question_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `creation_time` datetime NULL DEFAULT NULL,
  `modification_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `question_description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `choice_a` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `choice_b` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `choice_c` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `choice_d` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `solution` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`question_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (1, '选择题', '使用Java语言编写的源程序保存时的文件扩展名是', '2023-06-28 21:27:58', '2023-07-02 01:05:20', '使用Java语言编写的源程序保存时的文件扩展名是', '.class', '.java', '.cpp', '.txt', 'A');
INSERT INTO `question` VALUES (3, '填空题', '开发与运行Java程序需要经过的三个主要步骤为', '2023-06-28 22:56:12', '2023-06-28 22:56:12', '开发与运行Java程序需要经过的三个主要步骤为', '', '', '', '', '编辑源程序 ，编译生成字节码，解释运行字节码 ');
INSERT INTO `question` VALUES (4, '选择题', '不允许作为类及类成员的访问控制符的是', '2023-07-01 21:21:01', '2023-07-01 21:21:01', '不允许作为类及类成员的访问控制符的是', 'public', 'private', 'static', 'protected', 'C');
INSERT INTO `question` VALUES (5, '选择题', '为AB类的一个无形式参数无返回值的方法method书写方法头，使得使用类名AB作为前缀就可以调用它，该方法头的形式为', '2023-07-01 21:21:47', '2023-07-01 21:21:47', '为AB类的一个无形式参数无返回值的方法method书写方法头，使得使用类名AB作为前缀就可以调用它，该方法头的形式为', 'static void method( )', 'public void method( )', 'final void method( )', 'abstract void method( )', 'A');
INSERT INTO `question` VALUES (6, '选择题', '以下关于继承的叙述正确的是', '2023-07-01 21:22:36', '2023-07-01 21:22:36', '以下关于继承的叙述正确的是', '在Java中类只允许单一继承', '在Java中一个类只能实现一个接口', '在Java中一个类不能同时继承一个类和实现一个接口', '在Java中接口只允许单一继承', 'A');
INSERT INTO `question` VALUES (7, '选择题', '给出下面代码，关于该程序以下哪个说法是正确的？', '2023-07-01 21:23:37', '2023-07-01 21:23:37', '给出下面代码，关于该程序以下哪个说法是正确的？\r\npublic class Person{\r\n\r\nstatic int arr[] = new int[5];\r\n\r\npublic static void main(String a[])\r\n\r\n{\r\n\r\nSystem.out.println(arr[0]); }\r\n\r\n}', '编译时将产生错误', '编译时正确，运行时将产生错误', '输出零', '输出空', 'C');
INSERT INTO `question` VALUES (8, '判断题', '在Java的方法中定义一个常量要用const关键字', '2023-07-01 22:01:56', '2023-07-01 22:01:56', '在Java的方法中定义一个常量要用const关键字', '', '', '', '', '错');
INSERT INTO `question` VALUES (9, '判断题', '抽象方法必须在抽象类中，所以抽象类中的方法都必须是抽象方法。', '2023-07-01 22:02:15', '2023-07-01 22:02:15', '抽象方法必须在抽象类中，所以抽象类中的方法都必须是抽象方法。', '', '', '', '', '错');
INSERT INTO `question` VALUES (10, '判断题', '用final修饰的变量叫常量。', '2023-07-01 22:02:29', '2023-07-01 22:02:29', '用final修饰的变量叫常量。', '', '', '', '', '对');
INSERT INTO `question` VALUES (11, '判断题', '描述对象的两个要素是属性和方法。', '2023-07-01 22:02:44', '2023-07-01 22:02:44', '描述对象的两个要素是属性和方法。', '', '', '', '', '对');
INSERT INTO `question` VALUES (12, '填空题', '一个Java源程序由若干个（）组成。', '2023-07-01 22:03:58', '2023-07-01 22:03:58', '一个Java源程序由若干个（）组成。', '', '', '', '', '类');
INSERT INTO `question` VALUES (13, '填空题', '（）是Java的关键字，用来定义类。', '2023-07-01 22:04:21', '2023-07-01 22:04:21', '（）是Java的关键字，用来定义类。', '', '', '', '', 'class');
INSERT INTO `question` VALUES (14, '填空题', '面向对象程序设计的三个特征是（）（）（）。', '2023-07-01 22:05:13', '2023-07-01 22:05:13', '面向对象程序设计的三个特征是（）,（）,（）。', '', '', '', '', '封装；继承；多态');
INSERT INTO `question` VALUES (15, '填空题', 'Java语言是一种完全的（）程序设计语言。', '2023-07-01 22:06:20', '2023-07-01 22:06:20', 'Java语言是一种完全的（）程序设计语言。', '', '', '', '', '面向对象');
INSERT INTO `question` VALUES (16, '简答题', '包的作用', '2023-07-01 22:07:27', '2023-07-01 22:07:27', '包的作用', '', '', '', '', '1、将功能相近的类放到同一个包中，可以方便查找和使用。2、在一定程度上避免命名冲突。3、在java中，访问权限是可以是以包为单位的。');
INSERT INTO `question` VALUES (17, '简答题', '简述方法的重写和重载', '2023-07-01 22:08:03', '2023-07-01 22:08:03', '简述方法的重写和重载', '', '', '', '', 'override（重写） 1.方法名、参数、返回值相同。 2、重写方法的访问修饰符一定要大于或等于被重写的方法。 3、重写方法不能抛出新的异常或者抛出比被重写方法更宽泛的异常 4、存在于父类和子类之间。 5、被final修饰的方法不能重写 overload（重载） 1、参数类型、个数、顺序至少有一个不相同。 2、不能重载只有返回值不同的方法名。 3、存在于同类中');
INSERT INTO `question` VALUES (18, '简答题', '简述this关键字的用法', '2023-07-01 22:09:02', '2023-07-01 22:09:02', '简述this关键字的用法', '', '', '', '', '1、this调用本类中的属性，也就是类中的成员变量； 2、this调用本类中的其他方法； 3、this调用本类中的其他构造方法，调用时要放在构造方法的首行。');

-- ----------------------------
-- Table structure for relation_exam_question
-- ----------------------------
DROP TABLE IF EXISTS `relation_exam_question`;
CREATE TABLE `relation_exam_question`  (
  `req_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `exam_id` int UNSIGNED NULL DEFAULT NULL,
  `question_id` int UNSIGNED NULL DEFAULT NULL,
  `question_score` int NULL DEFAULT NULL,
  `order_number` int NULL DEFAULT NULL,
  PRIMARY KEY (`req_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of relation_exam_question
-- ----------------------------
INSERT INTO `relation_exam_question` VALUES (1, 2, 0, 10, 0);
INSERT INTO `relation_exam_question` VALUES (2, 2, 1, 10, 1);
INSERT INTO `relation_exam_question` VALUES (3, 3, 0, 20, 0);
INSERT INTO `relation_exam_question` VALUES (4, 3, 1, 20, 1);
INSERT INTO `relation_exam_question` VALUES (7, 5, 3, 10, 1);
INSERT INTO `relation_exam_question` VALUES (8, 5, 1, 50, 2);
INSERT INTO `relation_exam_question` VALUES (9, 6, 3, 60, 1);
INSERT INTO `relation_exam_question` VALUES (11, 6, 1, 20, 1);
INSERT INTO `relation_exam_question` VALUES (12, 7, 1, 50, 1);
INSERT INTO `relation_exam_question` VALUES (13, 7, 3, 50, 2);
INSERT INTO `relation_exam_question` VALUES (14, 7, 4, 10, 1);
INSERT INTO `relation_exam_question` VALUES (15, 7, 5, 10, 2);
INSERT INTO `relation_exam_question` VALUES (16, 7, 6, 10, 3);
INSERT INTO `relation_exam_question` VALUES (17, 7, 7, 10, 4);
INSERT INTO `relation_exam_question` VALUES (18, 7, 8, 10, 1);
INSERT INTO `relation_exam_question` VALUES (19, 7, 9, 10, 2);
INSERT INTO `relation_exam_question` VALUES (20, 7, 10, 10, 3);
INSERT INTO `relation_exam_question` VALUES (21, 7, 11, 10, 4);
INSERT INTO `relation_exam_question` VALUES (22, 7, 12, 10, 5);
INSERT INTO `relation_exam_question` VALUES (23, 7, 13, 10, 6);
INSERT INTO `relation_exam_question` VALUES (24, 7, 14, 10, 7);
INSERT INTO `relation_exam_question` VALUES (25, 7, 15, 10, 8);
INSERT INTO `relation_exam_question` VALUES (26, 7, 16, 10, 9);
INSERT INTO `relation_exam_question` VALUES (27, 7, 17, 10, 10);
INSERT INTO `relation_exam_question` VALUES (28, 7, 18, 10, 11);

-- ----------------------------
-- Table structure for relation_test_question
-- ----------------------------
DROP TABLE IF EXISTS `relation_test_question`;
CREATE TABLE `relation_test_question`  (
  `rtq_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `test_id` int UNSIGNED NULL DEFAULT NULL,
  `question_id` int UNSIGNED NULL DEFAULT NULL,
  `user_id` int UNSIGNED NULL DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `the_score` int NULL DEFAULT NULL,
  PRIMARY KEY (`rtq_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of relation_test_question
-- ----------------------------
INSERT INTO `relation_test_question` VALUES (1, 10, 1, 18, 'A', 50);
INSERT INTO `relation_test_question` VALUES (2, 10, 3, 18, '不知道', 0);
INSERT INTO `relation_test_question` VALUES (3, 10, 4, 18, 'C', 10);
INSERT INTO `relation_test_question` VALUES (4, 10, 5, 18, 'B', 0);
INSERT INTO `relation_test_question` VALUES (5, 10, 6, 18, 'A', 10);
INSERT INTO `relation_test_question` VALUES (6, 10, 7, 18, 'A', 0);
INSERT INTO `relation_test_question` VALUES (7, 10, 8, 18, '错', 10);
INSERT INTO `relation_test_question` VALUES (8, 10, 9, 18, '错', 10);
INSERT INTO `relation_test_question` VALUES (9, 10, 10, 18, '对', 10);
INSERT INTO `relation_test_question` VALUES (10, 10, 11, 18, '对', 10);
INSERT INTO `relation_test_question` VALUES (11, 10, 12, 18, 'java程序', 0);
INSERT INTO `relation_test_question` VALUES (12, 10, 13, 18, 'class', 10);
INSERT INTO `relation_test_question` VALUES (13, 10, 14, 18, '封装；继承；多态', 10);
INSERT INTO `relation_test_question` VALUES (14, 10, 15, 18, '面向对象', 10);
INSERT INTO `relation_test_question` VALUES (15, 10, 16, 18, '略', 0);
INSERT INTO `relation_test_question` VALUES (16, 10, 17, 18, '重写是重写父类的方法，重载是方法名相同而参数不同', 0);
INSERT INTO `relation_test_question` VALUES (17, 10, 18, 18, 'this.变量名\r\nthis.方法\r\nthis.构造方法', 0);

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`  (
  `score_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `test_id` int UNSIGNED NULL DEFAULT NULL,
  `user_id` int UNSIGNED NULL DEFAULT NULL,
  `total_score` int NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `the_mark_user_id` int UNSIGNED NULL DEFAULT 22,
  PRIMARY KEY (`score_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES (8, 10, 18, 140, '已结束', 12);

-- ----------------------------
-- Table structure for student_information
-- ----------------------------
DROP TABLE IF EXISTS `student_information`;
CREATE TABLE `student_information`  (
  `student_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '学号',
  `user_id` int UNSIGNED NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `grade` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '年级',
  `class_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '班级',
  `major` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '专业',
  `gender` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '性别',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  PRIMARY KEY (`student_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_information
-- ----------------------------
INSERT INTO `student_information` VALUES ('202113143000039', 18, '林超', '', '21软件2班', '软件工程', '男', 20);
INSERT INTO `student_information` VALUES ('202113143000046', 21, '罗伟杰', '', '21智科', '智能科学与技术', '男', 40);

-- ----------------------------
-- Table structure for teacher_information
-- ----------------------------
DROP TABLE IF EXISTS `teacher_information`;
CREATE TABLE `teacher_information`  (
  `job_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '工号',
  `user_id` int UNSIGNED NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '教师姓名',
  `entry_year` date NULL DEFAULT NULL COMMENT '入职年份',
  `gender` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '性别',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher_information
-- ----------------------------
INSERT INTO `teacher_information` VALUES (1, 6, '无名客', '2000-09-05', '男', 20);
INSERT INTO `teacher_information` VALUES (3, 8, '罗伟杰', '2023-07-21', '男', 20);
INSERT INTO `teacher_information` VALUES (4, 10, '罗伟杰03', '2023-06-27', '男', 20);
INSERT INTO `teacher_information` VALUES (5, 11, '罗伟杰04', '2023-06-27', '男', 30);
INSERT INTO `teacher_information` VALUES (6, 12, '林超', '2023-06-28', '男', 20);
INSERT INTO `teacher_information` VALUES (7, 22, '自动', '2000-09-05', '男', 20);

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `test_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `test_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `exam_id` int UNSIGNED NULL DEFAULT NULL,
  `test_start_time` datetime NULL DEFAULT NULL,
  `test_end_time` datetime NULL DEFAULT NULL,
  `class_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`test_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES (1, '作业java', 7, '2023-06-30 22:00:00', '2023-06-30 23:00:00', '21软件2班');
INSERT INTO `test` VALUES (3, 'java作业3', 7, '2023-06-30 22:40:00', '2023-06-30 23:40:00', '21软件2班');
INSERT INTO `test` VALUES (8, 'java作业5', 7, '2023-07-01 11:49:43', '2023-07-01 12:49:46', '21软件2班');
INSERT INTO `test` VALUES (9, 'java作业6', 7, '2023-07-01 11:52:19', '2023-07-01 12:52:22', '21软件2班');
INSERT INTO `test` VALUES (10, 'java作业7', 7, '2023-07-01 16:33:26', '2023-07-01 17:33:29', '21软件2班');

-- ----------------------------
-- View structure for admin_view
-- ----------------------------
DROP VIEW IF EXISTS `admin_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `admin_view` AS select `lo`.`user_id` AS `user_id`,`lo`.`account` AS `account`,`lo`.`password` AS `password`,`lo`.`identity` AS `identity`,`ai`.`user_name` AS `user_name`,`ai`.`gender` AS `gender`,`ai`.`age` AS `age` from (`login` `lo` join `administrator_information` `ai`) where ((`lo`.`user_id` = `ai`.`user_id`) and (`lo`.`identity` = 'admin'));

-- ----------------------------
-- View structure for exam_questions_view
-- ----------------------------
DROP VIEW IF EXISTS `exam_questions_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `exam_questions_view` AS select `req`.`req_id` AS `req_id`,`req`.`exam_id` AS `exam_id`,`q`.`question_id` AS `question_id`,`q`.`question_types` AS `question_types`,`q`.`question_name` AS `question_name`,`req`.`question_score` AS `question_score`,`req`.`order_number` AS `order_number` from (`question` `q` join `relation_exam_question` `req`) where (`q`.`question_id` = `req`.`question_id`);

-- ----------------------------
-- View structure for log_view
-- ----------------------------
DROP VIEW IF EXISTS `log_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `log_view` AS select `log`.`log_id` AS `log_id`,`log`.`user_id` AS `user_id`,`log`.`log_time` AS `log_time`,`log`.`state` AS `state`,`login`.`identity` AS `identity`,(case when (`login`.`identity` = 'admin') then `ai`.`user_name` when (`login`.`identity` = 'teacher') then `ti`.`user_name` when (`login`.`identity` = 'student') then `si`.`user_name` end) AS `user_name` from ((((`log` join `login` on((`log`.`user_id` = `login`.`user_id`))) left join `administrator_information` `ai` on(((`ai`.`user_id` = `log`.`user_id`) and (`login`.`identity` = 'admin')))) left join `teacher_information` `ti` on(((`ti`.`user_id` = `log`.`user_id`) and (`login`.`identity` = 'teacher')))) left join `student_information` `si` on(((`si`.`user_id` = `log`.`user_id`) and (`login`.`identity` = 'student'))));

-- ----------------------------
-- View structure for student_view
-- ----------------------------
DROP VIEW IF EXISTS `student_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `student_view` AS select `lo`.`user_id` AS `user_id`,`lo`.`account` AS `account`,`lo`.`password` AS `password`,`lo`.`identity` AS `identity`,`si`.`student_id` AS `student_id`,`si`.`user_name` AS `user_name`,`si`.`grade` AS `grade`,`si`.`class_name` AS `class_name`,`si`.`major` AS `major`,`si`.`gender` AS `gender`,`si`.`age` AS `age` from (`login` `lo` join `student_information` `si`) where ((`lo`.`user_id` = `si`.`user_id`) and (`lo`.`identity` = 'student'));

-- ----------------------------
-- View structure for teacher_view
-- ----------------------------
DROP VIEW IF EXISTS `teacher_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `teacher_view` AS select `lo`.`user_id` AS `user_id`,`ti`.`job_id` AS `job_id`,`ti`.`user_name` AS `user_name`,`lo`.`account` AS `account`,`lo`.`password` AS `password`,`lo`.`identity` AS `identity`,`ti`.`entry_year` AS `entry_year`,`ti`.`gender` AS `gender`,`ti`.`age` AS `age` from (`login` `lo` join `teacher_information` `ti`) where ((`lo`.`user_id` = `ti`.`user_id`) and (`lo`.`identity` = 'teacher'));

-- ----------------------------
-- View structure for test_student_view
-- ----------------------------
DROP VIEW IF EXISTS `test_student_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `test_student_view` AS select `ts`.`test_id` AS `test_id`,`ts`.`test_name` AS `test_name`,`ts`.`class_name` AS `class_name`,`sc`.`score_id` AS `score_id`,`sc`.`user_id` AS `user_id`,`si`.`user_name` AS `user_name`,`sc`.`total_score` AS `total_score`,`sc`.`the_mark_user_id` AS `the_mark_user_id`,`ti`.`user_name` AS `the_mark_user_name` from (((`score` `sc` left join `test` `ts` on((`ts`.`test_id` = `sc`.`test_id`))) left join `student_information` `si` on((`si`.`user_id` = `sc`.`user_id`))) left join `teacher_information` `ti` on((`ti`.`user_id` = `sc`.`the_mark_user_id`)));

-- ----------------------------
-- Triggers structure for table login
-- ----------------------------
DROP TRIGGER IF EXISTS `login_insert_user`;
delimiter ;;
CREATE TRIGGER `login_insert_user` AFTER INSERT ON `login` FOR EACH ROW begin
	if(new.identity = 'admin') then
		insert into administrator_information(user_id, user_name, gender, age) values(new.user_id, '无名客', '男', 20);
	elseif(new.identity = 'teacher') then
		insert into teacher_information(user_id, user_name, gender, age, entry_year) values(new.user_id, '无名客', '男', 20, '2000-9-5');
	elseif(new.identity = 'student') then
		insert into student_information(student_id, user_id, user_name, gender, age, grade, class_name, major) values(new.account, new.user_id, '无名客', '男', 20, '', '21软件2班', '软件工程');
	end if;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
