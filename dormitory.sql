/*
 Navicat Premium Data Transfer

 Source Server         : a
 Source Server Type    : MySQL
 Source Server Version : 80035
 Source Host           : localhost:3306
 Source Schema         : dormitory

 Target Server Type    : MySQL
 Target Server Version : 80035
 File Encoding         : 65001

 Date: 22/05/2024 10:15:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for absent
-- ----------------------------
DROP TABLE IF EXISTS `absent`;
CREATE TABLE `absent`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `building_id` int NULL DEFAULT NULL,
  `dormitory_id` int NULL DEFAULT NULL,
  `student_id` int NULL DEFAULT NULL,
  `dormitory_admin_id` int NULL DEFAULT NULL,
  `create_date` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `reason` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of absent
-- ----------------------------
INSERT INTO `absent` VALUES (13, 1, 2, 5, 16, '2022-04-16', '请假');
INSERT INTO `absent` VALUES (14, 1, 1, 1, 1, '2022-04-26', '请假');
INSERT INTO `absent` VALUES (15, 2, 5, 63, 1, '2022-04-26', '请假');
INSERT INTO `absent` VALUES (16, 1, 1, 1, 16, '2024-05-21', '外出');
INSERT INTO `absent` VALUES (17, 1, 1, 1, 16, '2024-05-22', '外出');

-- ----------------------------
-- Table structure for building
-- ----------------------------
DROP TABLE IF EXISTS `building`;
CREATE TABLE `building`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `introduction` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `admin_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of building
-- ----------------------------
INSERT INTO `building` VALUES (1, '1号楼', '计算机学院宿舍楼', 16);
INSERT INTO `building` VALUES (2, '2号楼', '计算机学院宿舍楼', 16);
INSERT INTO `building` VALUES (16, '5号楼', '电信学院宿舍楼', 16);

-- ----------------------------
-- Table structure for dormitory
-- ----------------------------
DROP TABLE IF EXISTS `dormitory`;
CREATE TABLE `dormitory`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `building_id` int NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `type` int NULL DEFAULT NULL,
  `available` int NULL DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dormitory
-- ----------------------------
INSERT INTO `dormitory` VALUES (1, 1, '101', 4, 0, '88230001');
INSERT INTO `dormitory` VALUES (2, 1, '102', 4, 0, '88230002');
INSERT INTO `dormitory` VALUES (3, 1, '211', 4, 0, '88230007');
INSERT INTO `dormitory` VALUES (4, 2, '212', 6, 1, '88230008');
INSERT INTO `dormitory` VALUES (5, 2, '321', 8, 6, '88230013');
INSERT INTO `dormitory` VALUES (6, 2, '322', 10, 10, '88230016');
INSERT INTO `dormitory` VALUES (36, 1, '666', 6, 6, '88136666');

-- ----------------------------
-- Table structure for dormitory_admin
-- ----------------------------
DROP TABLE IF EXISTS `dormitory_admin`;
CREATE TABLE `dormitory_admin`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dormitory_admin
-- ----------------------------
INSERT INTO `dormitory_admin` VALUES (1, 'll', '123123', '宋玉', '女', '13312345678');
INSERT INTO `dormitory_admin` VALUES (2, 'ww', '123123', '王力', '男', '13612345678');
INSERT INTO `dormitory_admin` VALUES (16, 'zz', '123123', '张三', '女', '13312345678');

-- ----------------------------
-- Table structure for fix
-- ----------------------------
DROP TABLE IF EXISTS `fix`;
CREATE TABLE `fix`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `fixed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fix
-- ----------------------------
INSERT INTO `fix` VALUES (1, '王伟', '门坏了', '2024-05-22 08:11:48', '已完成');
INSERT INTO `fix` VALUES (2, '王伟', '空调坏了', '2024-05-22T09:16', '已完成');
INSERT INTO `fix` VALUES (3, '王伟', '空调又坏了', '2024-05-22T09:17', '已完成');
INSERT INTO `fix` VALUES (4, '王伟', '空调又又又坏了', '2024-05-16T10:13', '未完成');

-- ----------------------------
-- Table structure for moveout
-- ----------------------------
DROP TABLE IF EXISTS `moveout`;
CREATE TABLE `moveout`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `dormitory_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `reason` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `create_date` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of moveout
-- ----------------------------
INSERT INTO `moveout` VALUES (15, '63', '6', '毕业', '2022-04-17');
INSERT INTO `moveout` VALUES (17, '18', '4', '毕业', '2022-04-27');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `login` int NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `gender` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `dormitory_id` int NULL DEFAULT NULL,
  `state` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `create_date` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '001', '王伟', 10001, '123123', '男', 1, '入住', '2022-04-14');
INSERT INTO `student` VALUES (2, '002', '曹海', 10002, '123123', '男', 1, '入住', '2022-04-14');
INSERT INTO `student` VALUES (3, '003', '李力', 10003, '123123', '男', 1, '入住', '2022-04-14');
INSERT INTO `student` VALUES (4, '004', '赵昭', 10004, '123123', '男', 1, '入住', '2022-04-14');
INSERT INTO `student` VALUES (5, '005', '王维利', 10005, '123123', '男', 2, '入住', '2022-04-14');
INSERT INTO `student` VALUES (6, '006', '李双', 10006, '123123', '女', 2, '入住', '2022-04-14');
INSERT INTO `student` VALUES (7, '007', '李小峰', 10007, '123123', '男', 2, '入住', '2022-04-14');
INSERT INTO `student` VALUES (8, '008', '孙奇', 10008, '123123', '男', 2, '入住', '2022-04-14');
INSERT INTO `student` VALUES (9, '009', '李立', 10009, '123123', '女', 3, '入住', '2022-04-14');
INSERT INTO `student` VALUES (10, '010', '周华发', 10010, '123123', '男', 3, '入住', '2022-04-14');
INSERT INTO `student` VALUES (11, '011', '赵正义', 10011, '123123', '男', 3, '入住', '2022-04-14');
INSERT INTO `student` VALUES (12, '012', '李明', 10012, '123123', '男', 3, '入住', '2022-04-14');
INSERT INTO `student` VALUES (13, '013', '许鹏飞', 10013, '123123', '男', 4, '入住', '2022-04-14');
INSERT INTO `student` VALUES (14, '014', '朱海', 10014, '123123', '男', 4, '入住', '2022-04-14');
INSERT INTO `student` VALUES (15, '015', '苏苏苏', 10015, '123123', '男', 4, '入住', '2022-04-14');
INSERT INTO `student` VALUES (16, '016', '李雪', 10016, '123123', '女', 4, '入住', '2022-04-14');
INSERT INTO `student` VALUES (17, '017', '李爽', 10017, '123123', '女', 4, '入住', '2022-04-14');
INSERT INTO `student` VALUES (18, '018', '王纯', 10018, '123123', '女', 4, '迁出', '2022-04-14');
INSERT INTO `student` VALUES (63, '019', '小明', 10019, '123123', '男', 5, '迁出', '2022-04-17');

-- ----------------------------
-- Table structure for system_admin
-- ----------------------------
DROP TABLE IF EXISTS `system_admin`;
CREATE TABLE `system_admin`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_admin
-- ----------------------------
INSERT INTO `system_admin` VALUES (1, 'admin1', '123123', '管理员1', '88132001');
INSERT INTO `system_admin` VALUES (2, 'admin2', '123123', '管理员2', '88132002');

SET FOREIGN_KEY_CHECKS = 1;
