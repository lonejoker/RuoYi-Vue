/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : ry-vue

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 28/03/2022 20:57:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (3, 'sys_file_info', '文件信息表', NULL, NULL, 'SysFileInfo', 'crud', 'com.ruoyi.system', 'system', 'info', '文件信息', 'ruoyi', '0', '/', NULL, 'admin', '2022-03-27 08:16:41', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (4, 'sys_resources', '资源管理表', NULL, NULL, 'SysResources', 'crud', 'com.ruoyi.system', 'system', 'resources', '资源管理', 'xiaobai', '0', '/', '{}', 'admin', '2022-03-27 19:35:06', '', '2022-03-28 20:33:44', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (12, '3', 'file_id', '文件id', 'int(11)', 'Long', 'fileId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-03-27 08:16:41', '', NULL);
INSERT INTO `gen_table_column` VALUES (13, '3', 'file_name', '文件名称', 'varchar(50)', 'String', 'fileName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-03-27 08:16:41', '', NULL);
INSERT INTO `gen_table_column` VALUES (14, '3', 'file_path', '文件路径', 'varchar(255)', 'String', 'filePath', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-03-27 08:16:41', '', NULL);
INSERT INTO `gen_table_column` VALUES (15, '4', 'id', '文件id', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 1, 'admin', '2022-03-27 19:35:06', NULL, '2022-03-28 20:56:03');
INSERT INTO `gen_table_column` VALUES (16, '4', 'name', '文件名', 'varchar(100)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-03-27 19:35:06', NULL, '2022-03-28 20:56:03');
INSERT INTO `gen_table_column` VALUES (17, '4', 'url', '文件链接', 'varchar(255)', 'String', 'url', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-03-27 19:35:06', NULL, '2022-03-28 20:56:03');
INSERT INTO `gen_table_column` VALUES (18, '4', 'type', '文件类型', 'varchar(50)', 'String', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'sys_resources_type', 4, 'admin', '2022-03-27 19:35:06', NULL, '2022-03-28 20:56:03');
INSERT INTO `gen_table_column` VALUES (19, '4', 'size', '文件大小（kb）', 'bigint(50)', 'Long', 'size', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-03-27 19:35:06', NULL, '2022-03-28 20:56:03');
INSERT INTO `gen_table_column` VALUES (20, '4', 'del_flag', '逻辑删除（0正常，1禁用）', 'tinyint(1)', 'Integer', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 6, 'admin', '2022-03-27 19:35:06', NULL, '2022-03-28 20:56:03');
INSERT INTO `gen_table_column` VALUES (21, '4', 'md5', '唯一标识', 'varchar(255)', 'String', 'md5', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-03-27 19:35:06', NULL, '2022-03-28 20:56:03');
INSERT INTO `gen_table_column` VALUES (22, '4', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 8, 'admin', '2022-03-27 19:35:06', NULL, '2022-03-28 20:56:03');
INSERT INTO `gen_table_column` VALUES (23, '4', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', NULL, 9, 'admin', '2022-03-27 19:35:06', NULL, '2022-03-28 20:56:03');
INSERT INTO `gen_table_column` VALUES (24, '4', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', NULL, 10, 'admin', '2022-03-27 19:35:06', NULL, '2022-03-28 20:56:03');
INSERT INTO `gen_table_column` VALUES (25, '4', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, 11, 'admin', '2022-03-27 19:35:06', NULL, '2022-03-28 20:56:03');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-03-26 13:11:49', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-03-26 13:11:49', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-03-26 13:11:49', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'Y', 'admin', '2022-03-26 13:11:49', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-03-26 13:11:49', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-26 13:11:48', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-26 13:11:48', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-26 13:11:48', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-26 13:11:48', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-26 13:11:48', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-26 13:11:48', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-26 13:11:48', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-26 13:11:48', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-26 13:11:48', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-26 13:11:48', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, 'jpg', '1', 'sys_resources_type', NULL, 'primary', 'N', '0', 'admin', '2022-03-28 20:19:13', '', NULL, 'jpg图片格式');
INSERT INTO `sys_dict_data` VALUES (101, 2, 'png', '2', 'sys_resources_type', NULL, 'primary', 'N', '0', 'admin', '2022-03-28 20:20:34', '', NULL, 'png图片格式');
INSERT INTO `sys_dict_data` VALUES (102, 3, 'rar', '3', 'sys_resources_type', NULL, 'primary', 'N', '0', 'admin', '2022-03-28 20:20:59', '', NULL, 'rar压缩包格式');
INSERT INTO `sys_dict_data` VALUES (103, 4, 'zip', '4', 'sys_resources_type', NULL, 'primary', 'N', '0', 'admin', '2022-03-28 20:21:16', '', NULL, 'zip压缩包格式');
INSERT INTO `sys_dict_data` VALUES (104, 5, 'mp4', '5', 'sys_resources_type', NULL, 'primary', 'N', '0', 'admin', '2022-03-28 20:21:31', '', NULL, 'mp4视频格式');
INSERT INTO `sys_dict_data` VALUES (105, 26, 'mp3', '26', 'sys_resources_type', NULL, 'primary', 'N', '0', 'admin', '2022-03-28 20:21:48', 'admin', '2022-03-28 20:52:17', 'mp3音乐格式');
INSERT INTO `sys_dict_data` VALUES (106, 7, 'pdf', '7', 'sys_resources_type', NULL, 'primary', 'N', '0', 'admin', '2022-03-28 20:22:06', '', NULL, 'pdf文档格式');
INSERT INTO `sys_dict_data` VALUES (107, 8, 'txt', '8', 'sys_resources_type', NULL, 'primary', 'N', '0', 'admin', '2022-03-28 20:22:44', '', NULL, 'txt文本格式');
INSERT INTO `sys_dict_data` VALUES (108, 9, 'doc', '9', 'sys_resources_type', NULL, 'primary', 'N', '0', 'admin', '2022-03-28 20:23:04', '', NULL, 'doc文档格式');
INSERT INTO `sys_dict_data` VALUES (109, 6, 'gif', '6', 'sys_resources_type', NULL, 'primary', 'N', '0', 'admin', '2022-03-28 20:23:31', '', NULL, 'gif图片格式');
INSERT INTO `sys_dict_data` VALUES (110, 11, 'avi', '11', 'sys_resources_type', NULL, 'primary', 'N', '0', 'admin', '2022-03-28 20:23:48', '', NULL, 'avi视频格式');
INSERT INTO `sys_dict_data` VALUES (111, 12, '7z', '12', 'sys_resources_type', NULL, 'primary', 'N', '0', 'admin', '2022-03-28 20:24:38', '', NULL, '7z压缩包格式');
INSERT INTO `sys_dict_data` VALUES (112, 13, 'jar', '13', 'sys_resources_type', NULL, 'primary', 'N', '0', 'admin', '2022-03-28 20:24:58', '', NULL, 'jar包格式');
INSERT INTO `sys_dict_data` VALUES (113, 14, 'war', '14', 'sys_resources_type', NULL, 'primary', 'N', '0', 'admin', '2022-03-28 20:25:12', '', NULL, 'war包格式');
INSERT INTO `sys_dict_data` VALUES (114, 15, 'docx', '15', 'sys_resources_type', NULL, 'primary', 'N', '0', 'admin', '2022-03-28 20:25:35', '', NULL, 'docx文档格式');
INSERT INTO `sys_dict_data` VALUES (115, 16, 'xls', '16', 'sys_resources_type', NULL, 'primary', 'N', '0', 'admin', '2022-03-28 20:25:55', '', NULL, 'xls文档格式');
INSERT INTO `sys_dict_data` VALUES (116, 17, 'xlsx', '17', 'sys_resources_type', NULL, 'primary', 'N', '0', 'admin', '2022-03-28 20:26:22', '', NULL, 'xlsx文档格式');
INSERT INTO `sys_dict_data` VALUES (117, 18, 'ppt', '18', 'sys_resources_type', NULL, 'primary', 'N', '0', 'admin', '2022-03-28 20:26:39', '', NULL, 'ppt文档格式');
INSERT INTO `sys_dict_data` VALUES (118, 19, 'apk', '19', 'sys_resources_type', NULL, 'primary', 'N', '0', 'admin', '2022-03-28 20:27:01', '', NULL, 'apk安装包格式');
INSERT INTO `sys_dict_data` VALUES (119, 20, 'pptx', '20', 'sys_resources_type', NULL, 'primary', 'N', '0', 'admin', '2022-03-28 20:27:20', '', NULL, 'pptx文档格式');
INSERT INTO `sys_dict_data` VALUES (120, 21, 'html', '21', 'sys_resources_type', NULL, 'primary', 'N', '0', 'admin', '2022-03-28 20:27:38', '', NULL, 'html网页格式');
INSERT INTO `sys_dict_data` VALUES (121, 22, 'jpeg', '22', 'sys_resources_type', NULL, 'primary', 'N', '0', 'admin', '2022-03-28 20:28:03', '', NULL, 'jpeg图片格式');
INSERT INTO `sys_dict_data` VALUES (122, 23, 'js', '23', 'sys_resources_type', NULL, 'primary', 'N', '0', 'admin', '2022-03-28 20:28:53', '', NULL, 'js脚本格式');
INSERT INTO `sys_dict_data` VALUES (123, 24, 'css', '24', 'sys_resources_type', NULL, 'primary', 'N', '0', 'admin', '2022-03-28 20:29:10', '', NULL, 'css样式格式');
INSERT INTO `sys_dict_data` VALUES (124, 25, 'java', '25', 'sys_resources_type', NULL, 'primary', 'N', '0', 'admin', '2022-03-28 20:29:29', '', NULL, 'java文件格式');
INSERT INTO `sys_dict_data` VALUES (143, 10, 'md', '10', 'sys_resources_type', NULL, 'primary', 'N', '0', 'admin', '2022-03-28 20:51:48', 'admin', '2022-03-28 20:52:25', 'markdown格式');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '资源类型', 'sys_resources_type', '0', 'admin', '2022-03-28 20:18:41', 'admin', '2022-03-28 20:18:55', '文件资源类型，如jpg、mp4，zip等');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 174 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 13:12:03');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 13:42:21');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 17:21:04');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-26 17:35:52');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 17:35:56');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-26 17:36:53');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 17:37:00');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 18:08:06');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 19:24:07');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 20:01:23');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 23:30:33');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-26 23:49:53');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-26 23:49:57');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-27 00:18:38');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 00:18:41');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-27 00:19:20');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 00:19:25');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 00:21:51');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2022-03-27 00:36:44');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-27 00:44:19');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 00:44:23');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 00:44:44');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 00:45:09');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 00:45:53');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 00:46:46');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 00:47:13');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 00:49:52');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 00:53:59');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2022-03-27 00:55:55');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 07:44:11');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-27 07:57:47');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 07:57:50');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 08:01:12');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 08:20:38');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-27 08:23:32');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 08:23:36');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 08:24:30');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 08:57:30');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-27 09:00:30');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 09:00:52');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-27 09:05:41');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 09:05:48');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-27 10:15:32');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 10:15:37');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2022-03-27 11:31:02');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 12:12:04');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 13:38:58');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 14:38:52');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 16:38:44');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-27 17:18:43');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 17:18:48');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-27 17:20:07');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 17:20:11');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-27 18:39:26');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 18:39:32');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-27 18:42:11');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 18:42:14');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 20:53:18');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-27 21:23:46');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 21:23:48');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-27 21:57:14');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 21:57:20');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-27 22:33:28');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 07:43:26');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 08:46:21');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-28 08:57:42');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 08:57:46');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-28 09:04:10');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 09:04:17');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 12:58:06');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 15:20:34');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 16:19:19');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-28 20:29:37');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 20:29:41');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-28 20:35:30');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 20:36:51');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-28 20:49:33');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-28 20:49:35');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2037 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 2, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-03-26 13:11:49', 'admin', '2022-03-27 19:06:23', '系统管理目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2022-03-26 13:11:49', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-03-26 13:11:49', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-03-26 13:11:49', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-03-26 13:11:49', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-03-26 13:11:49', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-03-26 13:11:49', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-03-26 13:11:49', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-03-26 13:11:49', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-03-26 13:11:49', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2022-03-26 13:11:49', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 1, 10, 'online', 'system/online/index', '', 1, 0, 'C', '0', '0', 'system:online:list', 'online', 'admin', '2022-03-26 13:11:49', 'admin', '2022-03-27 18:48:38', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-03-26 13:11:49', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-03-26 13:11:49', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2022-03-26 13:11:49', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'system/operlog/index', '', 1, 0, 'C', '0', '0', 'system:operlog:list', 'form', 'admin', '2022-03-26 13:11:49', 'admin', '2022-03-27 18:47:25', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'system/logininfor/index', '', 1, 0, 'C', '0', '0', 'system:logininfor:list', 'logininfor', 'admin', '2022-03-26 13:11:49', 'admin', '2022-03-27 18:48:04', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:query', '#', 'admin', '2022-03-26 13:11:49', 'admin', '2022-03-27 18:47:35', '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:remove', '#', 'admin', '2022-03-26 13:11:49', 'admin', '2022-03-27 18:47:45', '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:export', '#', 'admin', '2022-03-26 13:11:49', 'admin', '2022-03-27 18:47:51', '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:query', '#', 'admin', '2022-03-26 13:11:49', 'admin', '2022-03-27 18:48:11', '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:remove', '#', 'admin', '2022-03-26 13:11:49', 'admin', '2022-03-27 18:48:21', '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:export', '#', 'admin', '2022-03-26 13:11:49', 'admin', '2022-03-27 18:48:27', '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:online:query', '#', 'admin', '2022-03-26 13:11:49', 'admin', '2022-03-27 18:48:44', '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:online:batchLogout', '#', 'admin', '2022-03-26 13:11:49', 'admin', '2022-03-27 18:48:53', '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:online:forceLogout', '#', 'admin', '2022-03-26 13:11:49', 'admin', '2022-03-27 18:48:59', '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-03-26 13:11:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '资源管理', 0, 1, 'resources', 'system/resources/index', NULL, 1, 0, 'C', '0', '0', 'system:resources:list', 'button', 'admin', '2022-03-27 21:34:49', 'admin', '2022-03-27 21:39:53', '资源管理菜单');
INSERT INTO `sys_menu` VALUES (2032, '资源管理查询', 2031, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:resources:query', '#', 'admin', '2022-03-27 21:34:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '资源管理新增', 2031, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:resources:add', '#', 'admin', '2022-03-27 21:34:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '资源管理修改', 2031, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:resources:edit', '#', 'admin', '2022-03-27 21:34:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '资源管理删除', 2031, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:resources:remove', '#', 'admin', '2022-03-27 21:34:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '资源管理导出', 2031, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:resources:export', '#', 'admin', '2022-03-27 21:34:49', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2022-03-26 13:11:49', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2022-03-26 13:11:49', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 290 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_job_log', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 19:24:23');
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/1', '127.0.0.1', '内网IP', '{tableIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 20:08:21');
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"zip\",\"orderNum\":5,\"menuName\":\"文件管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"files\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 23:35:50');
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"code\",\"orderNum\":1,\"menuName\":\"图片管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"pic\",\"component\":\"files/pic\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"sys:files:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 23:36:50');
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"code\",\"orderNum\":1,\"menuName\":\"图片管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"pic\",\"component\":\"files/pic/index\",\"children\":[],\"createTime\":1648309010000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"C\",\"perms\":\"sys:files:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 23:37:05');
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"zip\",\"orderNum\":5,\"menuName\":\"资源管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"files\",\"children\":[],\"createTime\":1648308950000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 23:38:00');
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"zip\",\"orderNum\":5,\"menuName\":\"资源管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"resources\",\"children\":[],\"createTime\":1648308950000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 23:39:26');
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"code\",\"orderNum\":1,\"menuName\":\"图片管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"pic\",\"component\":\"resources/pic/index\",\"children\":[],\"createTime\":1648309010000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"C\",\"perms\":\"sys:resources:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 23:39:40');
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"code\",\"orderNum\":1,\"menuName\":\"图片管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"pic\",\"component\":\"resources/pic/index\",\"children\":[],\"createTime\":1648309010000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"C\",\"perms\":\"resources:pic:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 23:40:06');
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"pdf\",\"orderNum\":2,\"menuName\":\"文件管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"files\",\"component\":\"resources/files/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"resources:files:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 23:40:55');
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"code\",\"orderNum\":1,\"menuName\":\"图片管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"picture\",\"component\":\"resources/picture/index\",\"children\":[],\"createTime\":1648309010000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"C\",\"perms\":\"resources:picture:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 23:49:16');
INSERT INTO `sys_oper_log` VALUES (111, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_resources', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-26 23:59:56');
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"FileId\",\"usableColumn\":false,\"columnId\":9,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"fileId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"文件id\",\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648310396000,\"tableId\":2,\"pk\":true,\"columnName\":\"file_id\"},{\"capJavaField\":\"FileName\",\"usableColumn\":false,\"columnId\":10,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"fileName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"文件名称\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648310396000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"file_name\"},{\"capJavaField\":\"FilePath\",\"usableColumn\":false,\"columnId\":11,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"filePath\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"文件路径\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648310396000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"file_path\"}],\"businessName\":\"resources\",\"moduleName\":\"system\",\"className\":\"SysResources\",\"tableName\":\"sys_resources\",\"crud\":true,\"options\":\"{\\\"parentMenuId\\\":2001}\",\"genType\":\"0\",\"packageName\":\"com.ruoyi.system\",\"functionName\":\"文件信息\",\"tree\":false,\"tableComment\":\"文件信息表\",\"params\":{\"parentMenuId\":2001},\"tplCategory\":\"crud\",\"parentMenuId\":\"2001\",\"tableId\":2,\"genPath\":\"/\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 00:00:40');
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-27 00:00:42');
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-27 00:00:42');
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-27 00:10:12');
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-27 00:10:12');
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-27 00:12:23');
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"zip\",\"orderNum\":5,\"menuName\":\"资源管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"children\":[],\"createTime\":1648308950000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 00:17:27');
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"code\",\"orderNum\":1,\"menuName\":\"图片管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"picture\",\"component\":\"system/picture/index\",\"children\":[],\"createTime\":1648309010000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"C\",\"perms\":\"system:picture:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 00:17:34');
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"pdf\",\"orderNum\":2,\"menuName\":\"文件管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"files\",\"component\":\"system/files/index\",\"children\":[],\"createTime\":1648309255000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2002,\"menuType\":\"C\",\"perms\":\"system:files:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 00:17:40');
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"zip\",\"orderNum\":5,\"menuName\":\"资源管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"resources\",\"children\":[],\"createTime\":1648308950000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 00:19:03');
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"code\",\"orderNum\":1,\"menuName\":\"图片管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"picture\",\"component\":\"resources/picture/index\",\"children\":[],\"createTime\":1648309010000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"C\",\"perms\":\"resources:picture:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 00:19:12');
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"pdf\",\"orderNum\":2,\"menuName\":\"文件管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"files\",\"component\":\"resources/files/index\",\"children\":[],\"createTime\":1648309255000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2002,\"menuType\":\"C\",\"perms\":\"resources:files:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 00:19:16');
INSERT INTO `sys_oper_log` VALUES (124, '文件信息', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"fileName\":\"22\",\"filePath\":\"22\",\"params\":{},\"fileId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 00:22:57');
INSERT INTO `sys_oper_log` VALUES (125, '文件信息', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"fileName\":\"11\",\"filePath\":\"11\",\"params\":{},\"fileId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 00:23:01');
INSERT INTO `sys_oper_log` VALUES (126, '文件信息', 3, 'com.ruoyi.web.controller.system.SysResourcesController.remove()', 'DELETE', 1, 'admin', NULL, '/system/resources/2', '127.0.0.1', '内网IP', '{fileIds=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 00:23:06');
INSERT INTO `sys_oper_log` VALUES (127, '文件信息', 3, 'com.ruoyi.web.controller.system.SysResourcesController.remove()', 'DELETE', 1, 'admin', NULL, '/system/resources/1', '127.0.0.1', '内网IP', '{fileIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 00:23:07');
INSERT INTO `sys_oper_log` VALUES (128, '文件信息', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"fileName\":\"1\",\"filePath\":\"1\",\"params\":{},\"fileId\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 00:23:18');
INSERT INTO `sys_oper_log` VALUES (129, '文件信息', 3, 'com.ruoyi.web.controller.system.SysResourcesController.remove()', 'DELETE', 1, 'admin', NULL, '/system/resources/3', '127.0.0.1', '内网IP', '{fileIds=3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 00:23:24');
INSERT INTO `sys_oper_log` VALUES (130, '文件信息', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"fileName\":\"桌面\",\"filePath\":\"http://localhost:8989/profileupload/2022/03/27/桌面_20220327002813A001.png\",\"params\":{},\"fileId\":4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 00:28:14');
INSERT INTO `sys_oper_log` VALUES (131, '文件信息', 2, 'com.ruoyi.web.controller.system.SysResourcesController.edit()', 'PUT', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"fileName\":\"桌面\",\"filePath\":\"http://localhost:8989/profileupload/2022/03/27/桌面1_20220327003055A002.png\",\"params\":{},\"fileId\":4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 00:30:56');
INSERT INTO `sys_oper_log` VALUES (132, '文件信息', 3, 'com.ruoyi.web.controller.system.SysResourcesController.remove()', 'DELETE', 1, 'admin', NULL, '/system/resources/4', '127.0.0.1', '内网IP', '{fileIds=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 00:35:01');
INSERT INTO `sys_oper_log` VALUES (133, '文件信息', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"fileName\":\"111\",\"filePath\":\"http://localhost:8989/profile/upload/2022/03/27/微信图片_20210416230100_20220327003508A001.jpg\",\"params\":{},\"fileId\":5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 00:35:09');
INSERT INTO `sys_oper_log` VALUES (134, '文件信息', 3, 'com.ruoyi.web.controller.system.SysResourcesController.remove()', 'DELETE', 1, 'admin', NULL, '/system/resources/5', '127.0.0.1', '内网IP', '{fileIds=5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 00:37:57');
INSERT INTO `sys_oper_log` VALUES (135, '文件信息', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"fileName\":\"222\",\"filePath\":\"http://localhost:8989/profile/upload/2022/03/27/wallhaven-k716w7_20220327003803A002.jpg\",\"params\":{},\"fileId\":6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 00:38:04');
INSERT INTO `sys_oper_log` VALUES (136, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":3,\"menuName\":\"文件信息\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"resources\",\"component\":\"system/resources/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"system:resources:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 07:54:43');
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2002', '127.0.0.1', '内网IP', '{menuId=2002}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 07:55:08');
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":1,\"menuName\":\"查询\",\"params\":{},\"parentId\":2009,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:resources:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 07:56:27');
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":2,\"menuName\":\"新增\",\"params\":{},\"parentId\":2009,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:resources:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 07:56:41');
INSERT INTO `sys_oper_log` VALUES (140, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":3,\"menuName\":\"编辑\",\"params\":{},\"parentId\":2009,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:resources:edit\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 07:56:49');
INSERT INTO `sys_oper_log` VALUES (141, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":4,\"menuName\":\"删除\",\"params\":{},\"parentId\":2009,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:resources:remove\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 07:57:00');
INSERT INTO `sys_oper_log` VALUES (142, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":5,\"menuName\":\"导出\",\"params\":{},\"parentId\":2009,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:resources:export\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 07:57:10');
INSERT INTO `sys_oper_log` VALUES (143, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2001', '127.0.0.1', '内网IP', '{menuId=2001}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2022-03-27 07:57:20');
INSERT INTO `sys_oper_log` VALUES (144, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2003', '127.0.0.1', '内网IP', '{menuId=2003}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2022-03-27 07:57:24');
INSERT INTO `sys_oper_log` VALUES (145, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2004', '127.0.0.1', '内网IP', '{menuId=2004}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 07:57:27');
INSERT INTO `sys_oper_log` VALUES (146, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2005', '127.0.0.1', '内网IP', '{menuId=2005}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 07:57:30');
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2007', '127.0.0.1', '内网IP', '{menuId=2007}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 07:57:32');
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2006', '127.0.0.1', '内网IP', '{menuId=2006}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 07:57:35');
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2008', '127.0.0.1', '内网IP', '{menuId=2008}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 07:57:38');
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2003', '127.0.0.1', '内网IP', '{menuId=2003}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 07:57:39');
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2001', '127.0.0.1', '内网IP', '{menuId=2001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 07:57:42');
INSERT INTO `sys_oper_log` VALUES (152, '文件信息', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"fileName\":\"11\",\"filePath\":\"http://localhost:8989/profile/upload/2022/03/27/wallhaven-k716w7_20220327080130A001.jpg\",\"params\":{},\"fileId\":7}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 08:01:31');
INSERT INTO `sys_oper_log` VALUES (153, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2010', '127.0.0.1', '内网IP', '{menuId=2010}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 08:16:01');
INSERT INTO `sys_oper_log` VALUES (154, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2011', '127.0.0.1', '内网IP', '{menuId=2011}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 08:16:02');
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2012', '127.0.0.1', '内网IP', '{menuId=2012}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 08:16:04');
INSERT INTO `sys_oper_log` VALUES (156, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2013', '127.0.0.1', '内网IP', '{menuId=2013}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 08:16:07');
INSERT INTO `sys_oper_log` VALUES (157, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2014', '127.0.0.1', '内网IP', '{menuId=2014}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 08:16:09');
INSERT INTO `sys_oper_log` VALUES (158, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/2', '127.0.0.1', '内网IP', '{tableIds=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 08:16:34');
INSERT INTO `sys_oper_log` VALUES (159, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_file_info', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 08:16:42');
INSERT INTO `sys_oper_log` VALUES (160, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-27 08:16:45');
INSERT INTO `sys_oper_log` VALUES (161, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-27 08:16:45');
INSERT INTO `sys_oper_log` VALUES (162, '文件信息', 1, 'com.ruoyi.system.controller.SysFileInfoController.add()', 'POST', 1, 'admin', NULL, '/system/info', '127.0.0.1', '内网IP', '{\"fileName\":\"11\",\"filePath\":\"http://localhost:8989/profile/upload/2022/03/27/批注 2021-04-15 193024_20220327082201A001.png\",\"params\":{},\"fileId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 08:22:02');
INSERT INTO `sys_oper_log` VALUES (163, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2009', '127.0.0.1', '内网IP', '{menuId=2009}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 08:57:44');
INSERT INTO `sys_oper_log` VALUES (164, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2000', '127.0.0.1', '内网IP', '{menuId=2000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 08:57:46');
INSERT INTO `sys_oper_log` VALUES (165, '文件信息', 5, 'com.ruoyi.system.controller.SysFileInfoController.export()', 'POST', 1, 'admin', NULL, '/system/info/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2022-03-27 09:02:31');
INSERT INTO `sys_oper_log` VALUES (166, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":1,\"menuName\":\"文件信息\",\"params\":{},\"parentId\":3,\"isCache\":\"0\",\"path\":\"info\",\"component\":\"system/info/index\",\"children\":[],\"createTime\":1648340246000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2015,\"menuType\":\"C\",\"perms\":\"system:info:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 09:07:10');
INSERT INTO `sys_oper_log` VALUES (167, '文件信息', 2, 'com.ruoyi.system.controller.SysFileInfoController.edit()', 'PUT', 1, 'admin', NULL, '/system/info', '127.0.0.1', '内网IP', '{\"fileName\":\"11\",\"filePath\":\"http://localhost:8989/profile/upload/2022/03/27/wallhaven-k716w7_20220327101132A001.jpg\",\"params\":{},\"fileId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 10:11:33');
INSERT INTO `sys_oper_log` VALUES (168, '文件信息', 1, 'com.ruoyi.system.controller.SysFileInfoController.add()', 'POST', 1, 'admin', NULL, '/system/info', '127.0.0.1', '内网IP', '{\"fileName\":\"22\",\"filePath\":\"http://localhost:8989/profile/upload/2022/03/27/wallhaven-72x61v1_20220327112331A001.jpg\",\"params\":{},\"fileId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 11:23:32');
INSERT INTO `sys_oper_log` VALUES (169, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1049', '127.0.0.1', '内网IP', '{menuId=1049}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2022-03-27 17:10:45');
INSERT INTO `sys_oper_log` VALUES (170, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1049', '127.0.0.1', '内网IP', '{menuId=1049}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2022-03-27 17:11:28');
INSERT INTO `sys_oper_log` VALUES (171, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/110', '127.0.0.1', '内网IP', '{menuId=110}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2022-03-27 17:18:57');
INSERT INTO `sys_oper_log` VALUES (172, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/111', '127.0.0.1', '内网IP', '{menuId=111}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2022-03-27 17:29:37');
INSERT INTO `sys_oper_log` VALUES (173, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"form\",\"orderNum\":1,\"menuName\":\"操作日志\",\"params\":{},\"parentId\":108,\"isCache\":\"0\",\"path\":\"operlog\",\"component\":\"system/operlog/index\",\"children\":[],\"createTime\":1648271509000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":500,\"menuType\":\"C\",\"perms\":\"system:operlog:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 18:47:25');
INSERT INTO `sys_oper_log` VALUES (174, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"操作查询\",\"params\":{},\"parentId\":500,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648271509000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1040,\"menuType\":\"F\",\"perms\":\"system:operlog:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 18:47:35');
INSERT INTO `sys_oper_log` VALUES (175, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"#\",\"orderNum\":2,\"menuName\":\"操作删除\",\"params\":{},\"parentId\":500,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648271509000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1041,\"menuType\":\"F\",\"perms\":\"system:operlog:remove\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 18:47:45');
INSERT INTO `sys_oper_log` VALUES (176, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"#\",\"orderNum\":4,\"menuName\":\"日志导出\",\"params\":{},\"parentId\":500,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648271509000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1042,\"menuType\":\"F\",\"perms\":\"system:operlog:export\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 18:47:51');
INSERT INTO `sys_oper_log` VALUES (177, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"logininfor\",\"orderNum\":2,\"menuName\":\"登录日志\",\"params\":{},\"parentId\":108,\"isCache\":\"0\",\"path\":\"logininfor\",\"component\":\"system/logininfor/index\",\"children\":[],\"createTime\":1648271509000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":501,\"menuType\":\"C\",\"perms\":\"system:logininfor:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 18:48:04');
INSERT INTO `sys_oper_log` VALUES (178, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"登录查询\",\"params\":{},\"parentId\":501,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648271509000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1043,\"menuType\":\"F\",\"perms\":\"system:logininfor:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 18:48:11');
INSERT INTO `sys_oper_log` VALUES (179, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"#\",\"orderNum\":2,\"menuName\":\"登录删除\",\"params\":{},\"parentId\":501,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648271509000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1044,\"menuType\":\"F\",\"perms\":\"system:logininfor:remove\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 18:48:21');
INSERT INTO `sys_oper_log` VALUES (180, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"#\",\"orderNum\":3,\"menuName\":\"日志导出\",\"params\":{},\"parentId\":501,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648271509000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1045,\"menuType\":\"F\",\"perms\":\"system:logininfor:export\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 18:48:27');
INSERT INTO `sys_oper_log` VALUES (181, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"online\",\"orderNum\":10,\"menuName\":\"在线用户\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"online\",\"component\":\"system/online/index\",\"children\":[],\"createTime\":1648271509000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":109,\"menuType\":\"C\",\"perms\":\"system:online:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 18:48:38');
INSERT INTO `sys_oper_log` VALUES (182, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"#\",\"orderNum\":1,\"menuName\":\"在线查询\",\"params\":{},\"parentId\":109,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648271509000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1046,\"menuType\":\"F\",\"perms\":\"system:online:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 18:48:44');
INSERT INTO `sys_oper_log` VALUES (183, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"#\",\"orderNum\":2,\"menuName\":\"批量强退\",\"params\":{},\"parentId\":109,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1648271509000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1047,\"menuType\":\"F\",\"perms\":\"system:online:batchLogout\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 18:48:53');
INSERT INTO `sys_oper_log` VALUES (185, '操作日志', 3, 'com.ruoyi.web.controller.monitor.SysOperlogController.remove()', 'DELETE', 1, 'admin', NULL, '/system/operlog/184', '127.0.0.1', '内网IP', '{operIds=184}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 18:59:11');
INSERT INTO `sys_oper_log` VALUES (186, '登录日志', 3, 'com.ruoyi.web.controller.monitor.SysLogininforController.remove()', 'DELETE', 1, 'admin', NULL, '/system/logininfor/158', '127.0.0.1', '内网IP', '{infoIds=158}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 18:59:16');
INSERT INTO `sys_oper_log` VALUES (187, '登录日志', 3, 'com.ruoyi.web.controller.monitor.SysLogininforController.remove()', 'DELETE', 1, 'admin', NULL, '/system/logininfor/157', '127.0.0.1', '内网IP', '{infoIds=157}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 18:59:44');
INSERT INTO `sys_oper_log` VALUES (188, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"date\",\"orderNum\":3,\"menuName\":\"资源管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"resources\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:05:57');
INSERT INTO `sys_oper_log` VALUES (189, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"date\",\"orderNum\":2,\"menuName\":\"资源管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"resources\",\"children\":[],\"createTime\":1648379157000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2021,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:06:06');
INSERT INTO `sys_oper_log` VALUES (190, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"system\",\"orderNum\":2,\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"children\":[],\"createTime\":1648271509000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:06:23');
INSERT INTO `sys_oper_log` VALUES (191, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"date\",\"orderNum\":1,\"menuName\":\"资源管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"resources\",\"children\":[],\"createTime\":1648379157000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2021,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:06:27');
INSERT INTO `sys_oper_log` VALUES (192, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"excel\",\"orderNum\":1,\"menuName\":\"图片管理\",\"params\":{},\"parentId\":2021,\"isCache\":\"0\",\"path\":\"picture\",\"component\":\"resources/picture/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"resources:picture:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:08:34');
INSERT INTO `sys_oper_log` VALUES (193, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"email\",\"orderNum\":2,\"menuName\":\"文件管理\",\"params\":{},\"parentId\":2021,\"isCache\":\"0\",\"path\":\"files\",\"component\":\"resources/files/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"resources:files:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:09:22');
INSERT INTO `sys_oper_log` VALUES (194, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"validCode\",\"orderNum\":3,\"menuName\":\"视频管理\",\"params\":{},\"parentId\":2021,\"isCache\":\"0\",\"path\":\"video\",\"component\":\"resources/video/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"resources:video:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:10:04');
INSERT INTO `sys_oper_log` VALUES (195, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_resources', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:35:06');
INSERT INTO `sys_oper_log` VALUES (196, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"xiaobai\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":15,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"文件id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648380906000,\"tableId\":4,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":16,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"文件名\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648380906000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Url\",\"usableColumn\":false,\"columnId\":17,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"url\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"文件链接\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648380906000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"url\"},{\"capJavaField\":\"Type\",\"usableColumn\":false,\"columnId\":18,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"type\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"文件类型\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648380906000,\"isEdit\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:40:11');
INSERT INTO `sys_oper_log` VALUES (197, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"xiaobai\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":15,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"文件id\",\"updateTime\":1648381211000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648380906000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":16,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"文件名\",\"isQuery\":\"1\",\"updateTime\":1648381211000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648380906000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Url\",\"usableColumn\":false,\"columnId\":17,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"url\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"文件链接\",\"updateTime\":1648381211000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648380906000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"url\"},{\"capJavaField\":\"Type\",\"usableColumn\":false,\"columnId\":18,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"type\",\"htmlType\":\"select\",\"edit\":true,\"query\":false,\"columnComment\":\"文件类型\",\"updateTime\":1648381211000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"qu', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 19:44:23');
INSERT INTO `sys_oper_log` VALUES (198, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-27 19:46:34');
INSERT INTO `sys_oper_log` VALUES (199, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-27 19:46:35');
INSERT INTO `sys_oper_log` VALUES (200, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"remark\":\"111\",\"params\":{},\"createTime\":1648387057992,\"name\":\"111\",\"id\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 21:17:38');
INSERT INTO `sys_oper_log` VALUES (201, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2022', '127.0.0.1', '内网IP', '{menuId=2022}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 21:21:44');
INSERT INTO `sys_oper_log` VALUES (202, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2023', '127.0.0.1', '内网IP', '{menuId=2023}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 21:21:46');
INSERT INTO `sys_oper_log` VALUES (203, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2024', '127.0.0.1', '内网IP', '{menuId=2024}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 21:21:48');
INSERT INTO `sys_oper_log` VALUES (204, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"date\",\"orderNum\":1,\"menuName\":\"资源管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"resources\",\"component\":\"system/resources/list\",\"children\":[],\"createTime\":1648379157000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2021,\"menuType\":\"C\",\"perms\":\"system:resources:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 21:22:19');
INSERT INTO `sys_oper_log` VALUES (205, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"date\",\"orderNum\":1,\"menuName\":\"资源管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"resources\",\"component\":\"system/resources/index\",\"children\":[],\"createTime\":1648379157000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2021,\"menuType\":\"C\",\"perms\":\"system:resources:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 21:23:28');
INSERT INTO `sys_oper_log` VALUES (206, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"date\",\"orderNum\":1,\"menuName\":\"资源管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"resources\",\"component\":\"system/resources/index\",\"children\":[],\"createTime\":1648379157000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2021,\"menuType\":\"C\",\"perms\":\"system:resources:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 21:24:23');
INSERT INTO `sys_oper_log` VALUES (207, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2026', '127.0.0.1', '内网IP', '{menuId=2026}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 21:25:24');
INSERT INTO `sys_oper_log` VALUES (208, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2028', '127.0.0.1', '内网IP', '{menuId=2028}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 21:25:26');
INSERT INTO `sys_oper_log` VALUES (209, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2027', '127.0.0.1', '内网IP', '{menuId=2027}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 21:25:28');
INSERT INTO `sys_oper_log` VALUES (210, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2030', '127.0.0.1', '内网IP', '{menuId=2030}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 21:25:30');
INSERT INTO `sys_oper_log` VALUES (211, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2029', '127.0.0.1', '内网IP', '{menuId=2029}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 21:25:32');
INSERT INTO `sys_oper_log` VALUES (212, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2025', '127.0.0.1', '内网IP', '{menuId=2025}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 21:25:34');
INSERT INTO `sys_oper_log` VALUES (213, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/sys_resources', '127.0.0.1', '内网IP', '{tableName=sys_resources}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 21:27:46');
INSERT INTO `sys_oper_log` VALUES (214, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"xiaobai\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":15,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"isList\":\"1\",\"required\":false,\"superColumn\":false,\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"文件id\",\"isQuery\":\"1\",\"updateTime\":1648387666000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648380906000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":16,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"文件名\",\"isQuery\":\"1\",\"updateTime\":1648387666000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648380906000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Url\",\"usableColumn\":false,\"columnId\":17,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"isInsert\":\"1\",\"javaField\":\"url\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"文件链接\",\"isQuery\":\"1\",\"updateTime\":1648387666000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648380906000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"url\"},{\"capJavaField\":\"Type\",\"usableColumn\":false,\"columnId\":18,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"isInsert\":\"1\",\"javaField\":\"type\",\"htmlType\":\"select\",\"edit\":false,\"query\":true,\"columnComment\":\"文件类型\",\"isQuery\":\"1\",\"updateTime\":1648387666000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"va', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 21:29:39');
INSERT INTO `sys_oper_log` VALUES (215, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"xiaobai\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":15,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"isList\":\"1\",\"required\":false,\"superColumn\":false,\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"文件id\",\"isQuery\":\"1\",\"updateTime\":1648387779000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648380906000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":16,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"文件名\",\"isQuery\":\"1\",\"updateTime\":1648387779000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648380906000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Url\",\"usableColumn\":false,\"columnId\":17,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"isInsert\":\"1\",\"javaField\":\"url\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"文件链接\",\"isQuery\":\"1\",\"updateTime\":1648387779000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648380906000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"url\"},{\"capJavaField\":\"Type\",\"usableColumn\":false,\"columnId\":18,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"isInsert\":\"1\",\"javaField\":\"type\",\"htmlType\":\"select\",\"edit\":false,\"query\":true,\"columnComment\":\"文件类型\",\"isQuery\":\"1\",\"updateTime\":1648387779000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"va', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 21:30:20');
INSERT INTO `sys_oper_log` VALUES (216, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"xiaobai\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":15,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"isList\":\"1\",\"required\":false,\"superColumn\":false,\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"文件id\",\"isQuery\":\"1\",\"updateTime\":1648387820000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648380906000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":16,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"文件名\",\"isQuery\":\"1\",\"updateTime\":1648387820000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648380906000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Url\",\"usableColumn\":false,\"columnId\":17,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"isInsert\":\"1\",\"javaField\":\"url\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"文件链接\",\"isQuery\":\"1\",\"updateTime\":1648387820000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648380906000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"url\"},{\"capJavaField\":\"Type\",\"usableColumn\":false,\"columnId\":18,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"isInsert\":\"1\",\"javaField\":\"type\",\"htmlType\":\"select\",\"edit\":false,\"query\":true,\"columnComment\":\"文件类型\",\"isQuery\":\"1\",\"updateTime\":1648387820000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"va', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 21:30:57');
INSERT INTO `sys_oper_log` VALUES (217, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-27 21:34:02');
INSERT INTO `sys_oper_log` VALUES (218, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-27 21:34:02');
INSERT INTO `sys_oper_log` VALUES (219, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":1,\"menuName\":\"资源管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"resources\",\"component\":\"system/resources/index\",\"children\":[],\"createTime\":1648388089000,\"isFrame\":\"1\",\"menuId\":2031,\"menuType\":\"C\",\"perms\":\"system:resources:list\",\"status\":\"0\"}', '{\"msg\":\"修改菜单\'资源管理\'失败，菜单名称已存在\",\"code\":500}', 0, NULL, '2022-03-27 21:39:36');
INSERT INTO `sys_oper_log` VALUES (220, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"date\",\"orderNum\":1,\"menuName\":\"资源管理1\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"resources\",\"component\":\"system/resources/index\",\"children\":[],\"createTime\":1648379157000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2021,\"menuType\":\"C\",\"perms\":\"system:resources:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 21:39:43');
INSERT INTO `sys_oper_log` VALUES (221, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":1,\"menuName\":\"资源管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"resources\",\"component\":\"system/resources/index\",\"children\":[],\"createTime\":1648388089000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2031,\"menuType\":\"C\",\"perms\":\"system:resources:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 21:39:53');
INSERT INTO `sys_oper_log` VALUES (222, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2021', '127.0.0.1', '内网IP', '{menuId=2021}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 21:39:57');
INSERT INTO `sys_oper_log` VALUES (223, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"createBy\":\"admin\",\"createTime\":1648391644772,\"name\":\"111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 22:34:04');
INSERT INTO `sys_oper_log` VALUES (224, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"createBy\":\"admin\",\"createTime\":1648391798293,\"name\":\"1111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 22:36:38');
INSERT INTO `sys_oper_log` VALUES (225, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"createBy\":\"admin\",\"createTime\":1648391849067,\"name\":\"111\",\"id\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 22:37:29');
INSERT INTO `sys_oper_log` VALUES (226, '文件信息', 1, 'com.ruoyi.system.controller.SysFileInfoController.add()', 'POST', 1, 'admin', NULL, '/system/info', '127.0.0.1', '内网IP', '{\"fileName\":\"1112\",\"filePath\":\"http://localhost:8989/profile/upload/2022/03/27/wallhaven-z8dg9y_20220327224258A005.png\",\"params\":{},\"fileId\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 22:42:59');
INSERT INTO `sys_oper_log` VALUES (227, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"url\":\"http://localhost:8989/profile/upload/2022/03/27/wallhaven-z8dg9y_20220327224913A006.png\",\"createBy\":\"admin\",\"createTime\":1648392555390,\"name\":\"22\",\"id\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 22:49:15');
INSERT INTO `sys_oper_log` VALUES (228, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"createBy\":\"admin\",\"createTime\":1648393138940,\"name\":\"222\"}', NULL, 1, '', '2022-03-27 22:58:59');
INSERT INTO `sys_oper_log` VALUES (229, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"url\":\"http://localhost:8989/profile/upload/2022/03/27/zybfsyqs_20220327225908A001.jpg\",\"createBy\":\"admin\",\"createTime\":1648393149946,\"name\":\"222\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 22:59:09');
INSERT INTO `sys_oper_log` VALUES (230, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"url\":\"http://localhost:8989/profile/upload/2022/03/27/wallhaven-72x61v2_20220327230245A001.jpg\",\"createBy\":\"admin\",\"createTime\":1648393366862,\"name\":\"222\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 23:02:47');
INSERT INTO `sys_oper_log` VALUES (231, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"url\":\"http://localhost:8989/profile/upload/2022/03/27/批注 2021-04-15 193024_20220327230458A001.png\",\"createBy\":\"admin\",\"createTime\":1648393499181,\"name\":\"222\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 23:04:59');
INSERT INTO `sys_oper_log` VALUES (232, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/27/wallhaven-k716w7_20220327232401A002.jpg\",\"createBy\":\"admin\",\"createTime\":1648394643677,\"name\":\"222\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 23:24:03');
INSERT INTO `sys_oper_log` VALUES (233, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/27/zybfsyqs_20220327232518A003.jpg\",\"createBy\":\"admin\",\"createTime\":1648394720992,\"name\":\"1212\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 23:25:21');
INSERT INTO `sys_oper_log` VALUES (234, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/27/wallhaven-k716w7_20220327232552A004.jpg\",\"createBy\":\"admin\",\"createTime\":1648394753716,\"name\":\"222\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 23:25:53');
INSERT INTO `sys_oper_log` VALUES (235, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"png\",\"url\":\"http://localhost:8989/profile/upload/2022/03/27/wallhaven-z8dg9y_20220327232614A005.png\",\"createBy\":\"admin\",\"createTime\":1648394775695,\"name\":\"22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 23:26:15');
INSERT INTO `sys_oper_log` VALUES (236, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/27/wallhaven-72x61v1_20220327232746A006.jpg\",\"createBy\":\"admin\",\"createTime\":1648394868406,\"name\":\"222\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 23:27:48');
INSERT INTO `sys_oper_log` VALUES (237, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/27/wallhaven-k716w7_20220327232824A007.jpg\",\"createBy\":\"admin\",\"createTime\":1648394905507,\"name\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 23:28:25');
INSERT INTO `sys_oper_log` VALUES (238, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/27/wallhaven-72x61v1_20220327233033A009.jpg\",\"createBy\":\"admin\",\"size\":6913188,\"createTime\":1648395034331,\"name\":\"222\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 23:30:34');
INSERT INTO `sys_oper_log` VALUES (239, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/27/wallhaven-72x61v1_20220327235157A001.jpg\",\"createBy\":\"admin\",\"size\":6751,\"createTime\":1648396318413,\"name\":\"222\",\"id\":3,\"md5\":\"531defeccb7bd71093661247f83d4168\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 23:51:58');
INSERT INTO `sys_oper_log` VALUES (240, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/27/wallhaven-72x61v1_20220327235231A002.jpg\",\"createBy\":\"admin\",\"size\":6751,\"createTime\":1648396353177,\"name\":\"12\",\"id\":4,\"md5\":\"199686579cd2ee119fbe6ae4eafe6bee\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-27 23:52:33');
INSERT INTO `sys_oper_log` VALUES (241, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v1_20220328000017A001.jpg\",\"createBy\":\"admin\",\"size\":6751,\"createTime\":1648396819120,\"name\":\"222\",\"id\":5,\"md5\":\"9ad360b62c1adf36165f228b27a2e42a\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 00:00:19');
INSERT INTO `sys_oper_log` VALUES (242, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v1_20220328000303A001.jpg\",\"createBy\":\"admin\",\"size\":6751,\"createTime\":1648396984063,\"name\":\"22\",\"md5\":\"64a9e93c358d4b33a6f4787842df5dd3\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-28 00:03:04');
INSERT INTO `sys_oper_log` VALUES (243, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v1_20220328000303A001.jpg\",\"createBy\":\"admin\",\"size\":6751,\"createTime\":1648397010111,\"name\":\"22\",\"md5\":\"64a9e93c358d4b33a6f4787842df5dd3\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-28 00:03:30');
INSERT INTO `sys_oper_log` VALUES (244, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v1_20220328000303A001.jpg\",\"createBy\":\"admin\",\"size\":6751,\"createTime\":1648397019679,\"name\":\"2222\",\"md5\":\"64a9e93c358d4b33a6f4787842df5dd3\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-28 00:03:39');
INSERT INTO `sys_oper_log` VALUES (245, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v1_20220328000303A001.jpg\",\"createBy\":\"admin\",\"size\":6751,\"createTime\":1648397030078,\"name\":\"2222\",\"md5\":\"64a9e93c358d4b33a6f4787842df5dd3\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-28 00:03:50');
INSERT INTO `sys_oper_log` VALUES (246, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v1_20220328000303A001.jpg\",\"createBy\":\"admin\",\"size\":6751,\"createTime\":1648397130183,\"name\":\"2222\",\"md5\":\"64a9e93c358d4b33a6f4787842df5dd3\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-28 00:05:30');
INSERT INTO `sys_oper_log` VALUES (247, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v1_20220328000303A001.jpg\",\"createBy\":\"admin\",\"size\":6751,\"createTime\":1648397142549,\"name\":\"2222\",\"md5\":\"64a9e93c358d4b33a6f4787842df5dd3\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-28 00:05:42');
INSERT INTO `sys_oper_log` VALUES (248, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v1_20220328000544A002.jpg\",\"createBy\":\"admin\",\"size\":6751,\"createTime\":1648397145043,\"name\":\"2222\",\"md5\":\"255a2a544340b299c1d22f87364b3717\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-28 00:05:45');
INSERT INTO `sys_oper_log` VALUES (249, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v_20220328004238A001.jpg\",\"createBy\":\"admin\",\"size\":406,\"createTime\":1648399359683,\"name\":\"22\",\"id\":1,\"md5\":\"e4de4797d68e2cea06f00308a0fc0021\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 00:42:39');
INSERT INTO `sys_oper_log` VALUES (250, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/微信图片_20210416230100_20220328004329A002.jpg\",\"createBy\":\"admin\",\"size\":1979,\"createTime\":1648399411329,\"name\":\"1\"}', NULL, 1, '该文件已经存在', '2022-03-28 00:43:31');
INSERT INTO `sys_oper_log` VALUES (251, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/微信图片_20210416230100_20220328004404A003.jpg\",\"createBy\":\"admin\",\"size\":1979,\"createTime\":1648399446142,\"name\":\"1\"}', NULL, 1, '该文件已经存在', '2022-03-28 00:44:06');
INSERT INTO `sys_oper_log` VALUES (252, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"png\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/批注 2021-04-15 193024_20220328004448A004.png\",\"createBy\":\"admin\",\"size\":106,\"createTime\":1648399490243,\"name\":\"1\"}', NULL, 1, '该文件已经存在', '2022-03-28 00:44:50');
INSERT INTO `sys_oper_log` VALUES (253, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"png\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/批注 2021-04-15 193024_20220328004510A005.png\",\"createBy\":\"admin\",\"size\":106,\"createTime\":1648399511606,\"name\":\"1\"}', NULL, 1, '该文件已经存在', '2022-03-28 00:45:11');
INSERT INTO `sys_oper_log` VALUES (254, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"png\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/批注 2021-04-15 193024_20220328004510A005.png\",\"createBy\":\"admin\",\"size\":106,\"createTime\":1648399668162,\"name\":\"1\"}', NULL, 1, '该文件已经存在', '2022-03-28 00:47:48');
INSERT INTO `sys_oper_log` VALUES (255, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v_20220328004757A006.jpg\",\"createBy\":\"admin\",\"size\":406,\"createTime\":1648399678478,\"name\":\"1\"}', NULL, 1, '该文件已经存在', '2022-03-28 00:47:58');
INSERT INTO `sys_oper_log` VALUES (256, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v_20220328005404A001.jpg\",\"createBy\":\"admin\",\"size\":406,\"createTime\":1648400045219,\"name\":\"wallhaven-72x61v.jpg\"}', NULL, 1, '该文件已经存在', '2022-03-28 00:54:05');
INSERT INTO `sys_oper_log` VALUES (257, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v_20220328005520A001.jpg\",\"createBy\":\"admin\",\"size\":406,\"createTime\":1648400121371,\"name\":\"wallhaven-72x61v.jpg\",\"md5\":\"686c8e17d7e0e1b72d1ef557ef91b6a6\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-28 00:55:21');
INSERT INTO `sys_oper_log` VALUES (258, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v_20220328010203A001.jpg\",\"createBy\":\"admin\",\"size\":406,\"createTime\":1648400524225,\"name\":\"wallhaven-72x61v.jpg\",\"md5\":\"686c8e17d7e0e1b72d1ef557ef91b6a6\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-28 01:02:04');
INSERT INTO `sys_oper_log` VALUES (259, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v_20220328010641A001.jpg\",\"createBy\":\"admin\",\"size\":406,\"createTime\":1648400802794,\"name\":\"wallhaven-72x61v\",\"id\":1,\"md5\":\"686c8e17d7e0e1b72d1ef557ef91b6a6\"}', NULL, 1, 'java.lang.Integer cannot be cast to java.lang.Boolean', '2022-03-28 01:06:42');
INSERT INTO `sys_oper_log` VALUES (260, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v_20220328010641A001.jpg\",\"createBy\":\"admin\",\"size\":406,\"createTime\":1648400807385,\"name\":\"wallhaven-72x61v.jpg\"}', NULL, 1, '该文件已存在', '2022-03-28 01:06:47');
INSERT INTO `sys_oper_log` VALUES (261, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v_20220328011410A001.jpg\",\"createBy\":\"admin\",\"size\":406,\"createTime\":1648401251806,\"name\":\"wallhaven-72x61v\",\"id\":1,\"md5\":\"686c8e17d7e0e1b72d1ef557ef91b6a6\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 01:14:11');
INSERT INTO `sys_oper_log` VALUES (262, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v_20220328011417A002.jpg\",\"createBy\":\"admin\",\"size\":406,\"createTime\":1648401259301,\"name\":\"wallhaven-72x61v.jpg\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-28 01:14:19');
INSERT INTO `sys_oper_log` VALUES (263, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v1_20220328011435A003.jpg\",\"createBy\":\"admin\",\"size\":6751,\"createTime\":1648401276361,\"name\":\"wallhaven-72x61v1.jpg\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-28 01:14:36');
INSERT INTO `sys_oper_log` VALUES (264, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v_20220328011544A001.jpg\",\"createBy\":\"admin\",\"size\":406,\"createTime\":1648401345545,\"name\":\"wallhaven-72x61v.jpg\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-28 01:15:45');
INSERT INTO `sys_oper_log` VALUES (265, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v_20220328074346A001.jpg\",\"createBy\":\"admin\",\"size\":406,\"createTime\":1648424627767,\"name\":\"wallhaven-72x61v.jpg\"}', '{\"msg\":\"412\",\"code\":500,\"data\":\"该文件已存在\"}', 0, NULL, '2022-03-28 07:43:47');
INSERT INTO `sys_oper_log` VALUES (266, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v1_20220328074404A002.jpg\",\"createBy\":\"admin\",\"size\":6751,\"createTime\":1648424645529,\"name\":\"wallhaven-72x61v1\",\"id\":2,\"md5\":\"45a8612df383f8c3f78c789d279504ae\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2022-03-28 07:44:05');
INSERT INTO `sys_oper_log` VALUES (267, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v1_20220328074507A001.jpg\",\"createBy\":\"admin\",\"size\":6751,\"createTime\":1648424709373,\"name\":\"wallhaven-72x61v1.jpg\"}', '{\"msg\":\"该文件已存在\",\"code\":412}', 0, NULL, '2022-03-28 07:45:09');
INSERT INTO `sys_oper_log` VALUES (268, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v2_20220328074520A002.jpg\",\"createBy\":\"admin\",\"size\":1125,\"createTime\":1648424722024,\"name\":\"wallhaven-72x61v2\",\"id\":3,\"md5\":\"b7fd7c7fdaeddf5447ba433b1f153c36\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2022-03-28 07:45:22');
INSERT INTO `sys_oper_log` VALUES (269, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v_20220328074558A003.jpg\",\"createBy\":\"admin\",\"size\":406,\"createTime\":1648424761130,\"name\":\"wallhaven-72x61v\",\"id\":1,\"md5\":\"686c8e17d7e0e1b72d1ef557ef91b6a6\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2022-03-28 07:46:01');
INSERT INTO `sys_oper_log` VALUES (270, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v_20220328074608A004.jpg\",\"createBy\":\"admin\",\"size\":406,\"createTime\":1648424771842,\"name\":\"wallhaven-72x61v.jpg\"}', '{\"msg\":\"该文件已存在\",\"code\":412}', 0, NULL, '2022-03-28 07:46:11');
INSERT INTO `sys_oper_log` VALUES (271, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v_20220328074750A005.jpg\",\"createBy\":\"admin\",\"size\":406,\"createTime\":1648424871479,\"name\":\"wallhaven-72x61v.jpg\"}', '{\"msg\":\"该文件已存在\",\"code\":412}', 0, NULL, '2022-03-28 07:47:51');
INSERT INTO `sys_oper_log` VALUES (272, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v1_20220328085121A004.jpg\",\"createBy\":\"admin\",\"size\":6751,\"createTime\":1648428706275,\"name\":\"wallhaven-72x61v1\",\"id\":2,\"md5\":\"45a8612df383f8c3f78c789d279504ae\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2022-03-28 08:51:46');
INSERT INTO `sys_oper_log` VALUES (273, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v2_20220328092621A003.jpg\",\"createBy\":\"admin\",\"size\":1125,\"createTime\":1648430783117,\"name\":\"wallhaven-72x61v2\",\"id\":3,\"md5\":\"b7fd7c7fdaeddf5447ba433b1f153c36\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2022-03-28 09:26:23');
INSERT INTO `sys_oper_log` VALUES (274, '资源管理', 2, 'com.ruoyi.web.controller.system.SysResourcesController.edit()', 'PUT', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"updateTime\":1648431164446,\"delFlag\":0,\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-k716w7_20220328093243A001.jpg\",\"createBy\":\"admin\",\"size\":256643,\"createTime\":1648430783000,\"updateBy\":\"admin\",\"name\":\"wallhaven-k716w7.jpg\",\"id\":3,\"md5\":\"b7fd7c7fdaeddf5447ba433b1f153c36\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 09:32:44');
INSERT INTO `sys_oper_log` VALUES (275, '资源管理', 2, 'com.ruoyi.web.controller.system.SysResourcesController.edit()', 'PUT', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"updateTime\":1648432256753,\"delFlag\":0,\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-z8dg9y_20220328095055A002.png\",\"createBy\":\"admin\",\"size\":26836,\"createTime\":1648430783000,\"updateBy\":\"admin\",\"name\":\"wallhaven-z8dg9y.png\",\"id\":3,\"md5\":\"b7fd7c7fdaeddf5447ba433b1f153c36\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 09:50:56');
INSERT INTO `sys_oper_log` VALUES (276, '资源管理', 2, 'com.ruoyi.web.controller.system.SysResourcesController.edit()', 'PUT', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"updateTime\":1648432437165,\"delFlag\":0,\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/zybfsyqs_20220328095356A003.jpg\",\"createBy\":\"admin\",\"size\":38713,\"createTime\":1648430783000,\"updateBy\":\"admin\",\"name\":\"zybfsyqs.jpg\",\"id\":3,\"md5\":\"b7fd7c7fdaeddf5447ba433b1f153c36\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 09:53:57');
INSERT INTO `sys_oper_log` VALUES (277, '资源管理', 2, 'com.ruoyi.web.controller.system.SysResourcesController.edit()', 'PUT', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"updateTime\":1648432463890,\"delFlag\":0,\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/桌面_20220328095421A004.png\",\"createBy\":\"admin\",\"size\":1228291,\"createTime\":1648430783000,\"updateBy\":\"admin\",\"name\":\"桌面.png\",\"id\":3,\"md5\":\"b7fd7c7fdaeddf5447ba433b1f153c36\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 09:54:23');
INSERT INTO `sys_oper_log` VALUES (278, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"png\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/桌面_20220328155910A005.png\",\"createBy\":\"admin\",\"size\":1199,\"createTime\":1648454351194,\"name\":\"桌面\",\"id\":4,\"md5\":\"786f1857288db03554b9693575780005\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2022-03-28 15:59:11');
INSERT INTO `sys_oper_log` VALUES (279, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"png\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/桌面1_20220328155916A006.png\",\"createBy\":\"admin\",\"size\":223,\"createTime\":1648454357616,\"name\":\"桌面1\",\"id\":5,\"md5\":\"364851725f764395603c65fd4c98e666\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2022-03-28 15:59:17');
INSERT INTO `sys_oper_log` VALUES (280, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v_20220328162550A001.jpg\",\"createBy\":\"admin\",\"size\":406,\"createTime\":1648455951066,\"name\":\"wallhaven-72x61v\",\"id\":1,\"md5\":\"686c8e17d7e0e1b72d1ef557ef91b6a6\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2022-03-28 16:25:51');
INSERT INTO `sys_oper_log` VALUES (281, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v1_20220328162556A002.jpg\",\"createBy\":\"admin\",\"size\":6751,\"createTime\":1648455957549,\"name\":\"wallhaven-72x61v1\",\"id\":2,\"md5\":\"45a8612df383f8c3f78c789d279504ae\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2022-03-28 16:25:57');
INSERT INTO `sys_oper_log` VALUES (282, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v2_20220328162607A003.jpg\",\"createBy\":\"admin\",\"size\":1125,\"createTime\":1648455968571,\"name\":\"wallhaven-72x61v2\",\"id\":3,\"md5\":\"b7fd7c7fdaeddf5447ba433b1f153c36\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2022-03-28 16:26:08');
INSERT INTO `sys_oper_log` VALUES (283, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v_20220328162941A001.jpg\",\"createBy\":\"admin\",\"size\":416175,\"createTime\":1648456181674,\"name\":\"wallhaven-72x61v\",\"id\":1,\"md5\":\"686c8e17d7e0e1b72d1ef557ef91b6a6\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2022-03-28 16:29:41');
INSERT INTO `sys_oper_log` VALUES (284, '资源管理', 3, 'com.ruoyi.web.controller.system.SysResourcesController.remove()', 'DELETE', 1, 'admin', NULL, '/system/resources/1', '127.0.0.1', '内网IP', '{ids=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 16:30:09');
INSERT INTO `sys_oper_log` VALUES (285, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v_20220328163126A001.jpg\",\"createBy\":\"admin\",\"size\":406,\"createTime\":1648456289496,\"name\":\"wallhaven-72x61v\",\"id\":1,\"md5\":\"686c8e17d7e0e1b72d1ef557ef91b6a6\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2022-03-28 16:31:29');
INSERT INTO `sys_oper_log` VALUES (286, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"createBy\":\"admin\",\"createTime\":1648456597005}', NULL, 1, '', '2022-03-28 16:36:37');
INSERT INTO `sys_oper_log` VALUES (287, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/zybfsyqs_20220328163649A002.jpg\",\"createBy\":\"admin\",\"size\":37,\"createTime\":1648456612527,\"name\":\"zybfsyqs\",\"id\":2,\"md5\":\"0994e1317fb9083a22b67d3e85933ba1\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2022-03-28 16:36:52');
INSERT INTO `sys_oper_log` VALUES (288, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"zip\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/基于Spring MVC   Spring   MyBatis的【医院就诊挂号系统】_20220328164213A001.zip\",\"createBy\":\"admin\",\"size\":20331,\"createTime\":1648456934942,\"name\":\"基于Spring MVC   Spring   MyBatis的【医院就诊挂号系统】\",\"id\":3,\"md5\":\"98f8905542efcfce0a6c92a75261d595\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2022-03-28 16:42:15');
INSERT INTO `sys_oper_log` VALUES (289, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v1_20220328164259A002.jpg\",\"createBy\":\"admin\",\"size\":6751,\"createTime\":1648456984474,\"name\":\"wallhaven-72x61v1\",\"id\":4,\"md5\":\"45a8612df383f8c3f78c789d279504ae\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2022-03-28 16:43:04');
INSERT INTO `sys_oper_log` VALUES (290, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2016', '127.0.0.1', '内网IP', '{menuId=2016}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:16:41');
INSERT INTO `sys_oper_log` VALUES (291, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2017', '127.0.0.1', '内网IP', '{menuId=2017}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:16:43');
INSERT INTO `sys_oper_log` VALUES (292, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2018', '127.0.0.1', '内网IP', '{menuId=2018}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:16:45');
INSERT INTO `sys_oper_log` VALUES (293, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2019', '127.0.0.1', '内网IP', '{menuId=2019}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:16:47');
INSERT INTO `sys_oper_log` VALUES (294, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2020', '127.0.0.1', '内网IP', '{menuId=2020}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:16:49');
INSERT INTO `sys_oper_log` VALUES (295, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2015', '127.0.0.1', '内网IP', '{menuId=2015}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:16:51');
INSERT INTO `sys_oper_log` VALUES (296, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"sys_resources_type\",\"remark\":\"文件资源类型，如jpg、mp4，zip等\",\"params\":{},\"dictType\":\"资源类型\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:18:41');
INSERT INTO `sys_oper_log` VALUES (297, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":1648469921000,\"updateBy\":\"admin\",\"dictName\":\"资源类型\",\"remark\":\"文件资源类型，如jpg、mp4，zip等\",\"dictId\":100,\"params\":{},\"dictType\":\"sys_resources_type\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:18:55');
INSERT INTO `sys_oper_log` VALUES (298, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"primary\",\"dictSort\":1,\"remark\":\"jpg图片格式\",\"params\":{},\"dictType\":\"资源类型\",\"dictLabel\":\"jpg\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:19:13');
INSERT INTO `sys_oper_log` VALUES (299, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"listClass\":\"primary\",\"dictSort\":2,\"remark\":\"png图片格式\",\"params\":{},\"dictType\":\"资源类型\",\"dictLabel\":\"png\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:20:34');
INSERT INTO `sys_oper_log` VALUES (300, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"listClass\":\"primary\",\"dictSort\":3,\"remark\":\"rar压缩包格式\",\"params\":{},\"dictType\":\"资源类型\",\"dictLabel\":\"rar\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:20:59');
INSERT INTO `sys_oper_log` VALUES (301, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"4\",\"listClass\":\"primary\",\"dictSort\":4,\"remark\":\"zip压缩包格式\",\"params\":{},\"dictType\":\"资源类型\",\"dictLabel\":\"zip\",\"createBy\":\"admin\",\"default\":false,\"cssClass\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:21:16');
INSERT INTO `sys_oper_log` VALUES (302, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"5\",\"listClass\":\"primary\",\"dictSort\":5,\"remark\":\"mp4视频格式\",\"params\":{},\"dictType\":\"资源类型\",\"dictLabel\":\"mp4\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:21:31');
INSERT INTO `sys_oper_log` VALUES (303, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"6\",\"listClass\":\"primary\",\"dictSort\":6,\"remark\":\"mp3音乐格式\",\"params\":{},\"dictType\":\"资源类型\",\"dictLabel\":\"mp3\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:21:48');
INSERT INTO `sys_oper_log` VALUES (304, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"7\",\"listClass\":\"primary\",\"dictSort\":7,\"remark\":\"pdf文档格式\",\"params\":{},\"dictType\":\"资源类型\",\"dictLabel\":\"pdf\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:22:06');
INSERT INTO `sys_oper_log` VALUES (305, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"8\",\"listClass\":\"primary\",\"dictSort\":8,\"remark\":\"txt文本格式\",\"params\":{},\"dictType\":\"资源类型\",\"dictLabel\":\"txt\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:22:44');
INSERT INTO `sys_oper_log` VALUES (306, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"9\",\"listClass\":\"primary\",\"dictSort\":9,\"remark\":\"doc文档格式\",\"params\":{},\"dictType\":\"资源类型\",\"dictLabel\":\"doc\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:23:04');
INSERT INTO `sys_oper_log` VALUES (307, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"10\",\"listClass\":\"primary\",\"dictSort\":10,\"remark\":\"gif图片格式\",\"params\":{},\"dictType\":\"资源类型\",\"dictLabel\":\"gif\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:23:31');
INSERT INTO `sys_oper_log` VALUES (308, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"11\",\"listClass\":\"primary\",\"dictSort\":11,\"remark\":\"avi视频格式\",\"params\":{},\"dictType\":\"资源类型\",\"dictLabel\":\"avi\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:23:48');
INSERT INTO `sys_oper_log` VALUES (309, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"12\",\"listClass\":\"primary\",\"dictSort\":12,\"remark\":\"7z压缩包格式\",\"params\":{},\"dictType\":\"资源类型\",\"dictLabel\":\"7z\",\"createBy\":\"admin\",\"default\":false,\"cssClass\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:24:38');
INSERT INTO `sys_oper_log` VALUES (310, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"13\",\"listClass\":\"primary\",\"dictSort\":13,\"remark\":\"jar包格式\",\"params\":{},\"dictType\":\"资源类型\",\"dictLabel\":\"jar\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:24:58');
INSERT INTO `sys_oper_log` VALUES (311, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"14\",\"listClass\":\"primary\",\"dictSort\":14,\"remark\":\"war包格式\",\"params\":{},\"dictType\":\"资源类型\",\"dictLabel\":\"war\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:25:12');
INSERT INTO `sys_oper_log` VALUES (312, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"15\",\"listClass\":\"primary\",\"dictSort\":15,\"remark\":\"docx文档格式\",\"params\":{},\"dictType\":\"资源类型\",\"dictLabel\":\"docx\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:25:35');
INSERT INTO `sys_oper_log` VALUES (313, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"16\",\"listClass\":\"primary\",\"dictSort\":16,\"remark\":\"xls文档格式\",\"params\":{},\"dictType\":\"资源类型\",\"dictLabel\":\"xls\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:25:55');
INSERT INTO `sys_oper_log` VALUES (314, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"17\",\"listClass\":\"primary\",\"dictSort\":17,\"remark\":\"xlsx文档格式\",\"params\":{},\"dictType\":\"资源类型\",\"dictLabel\":\"xlsx\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:26:22');
INSERT INTO `sys_oper_log` VALUES (315, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"18\",\"listClass\":\"primary\",\"dictSort\":18,\"remark\":\"ppt文档格式\",\"params\":{},\"dictType\":\"资源类型\",\"dictLabel\":\"ppt\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:26:39');
INSERT INTO `sys_oper_log` VALUES (316, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"19\",\"listClass\":\"primary\",\"dictSort\":19,\"remark\":\"apk安装包格式\",\"params\":{},\"dictType\":\"资源类型\",\"dictLabel\":\"apk\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:27:01');
INSERT INTO `sys_oper_log` VALUES (317, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"20\",\"listClass\":\"primary\",\"dictSort\":20,\"remark\":\"pptx文档格式\",\"params\":{},\"dictType\":\"资源类型\",\"dictLabel\":\"pptx\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:27:20');
INSERT INTO `sys_oper_log` VALUES (318, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"21\",\"listClass\":\"primary\",\"dictSort\":21,\"remark\":\"html网页格式\",\"params\":{},\"dictType\":\"资源类型\",\"dictLabel\":\"html\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:27:38');
INSERT INTO `sys_oper_log` VALUES (319, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"22\",\"listClass\":\"primary\",\"dictSort\":22,\"remark\":\"jpeg图片格式\",\"params\":{},\"dictType\":\"资源类型\",\"dictLabel\":\"jpeg\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:28:03');
INSERT INTO `sys_oper_log` VALUES (320, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"23\",\"listClass\":\"primary\",\"dictSort\":23,\"remark\":\"js脚本格式\",\"params\":{},\"dictType\":\"资源类型\",\"dictLabel\":\"js\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:28:53');
INSERT INTO `sys_oper_log` VALUES (321, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"24\",\"listClass\":\"primary\",\"dictSort\":24,\"remark\":\"css样式格式\",\"params\":{},\"dictType\":\"资源类型\",\"dictLabel\":\"css\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:29:10');
INSERT INTO `sys_oper_log` VALUES (322, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"25\",\"listClass\":\"primary\",\"dictSort\":25,\"remark\":\"java文件格式\",\"params\":{},\"dictType\":\"资源类型\",\"dictLabel\":\"java\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:29:29');
INSERT INTO `sys_oper_log` VALUES (323, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"docx\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/20190412430240+陆泳涛_20220328202953A003.docx\",\"createBy\":\"admin\",\"size\":14,\"createTime\":1648470594410,\"name\":\"20190412430240+陆泳涛\",\"id\":1,\"md5\":\"6e780fefd705dd7cb0a552326a0ae5b4\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2022-03-28 20:29:54');
INSERT INTO `sys_oper_log` VALUES (324, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"txt\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/github错误_20220328203011A004.txt\",\"createBy\":\"admin\",\"size\":0,\"createTime\":1648470612059,\"name\":\"github错误\",\"id\":2,\"md5\":\"4fc092efa410f6b076f244e8aa407bcc\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2022-03-28 20:30:12');
INSERT INTO `sys_oper_log` VALUES (325, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"md\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/重装系统准备_20220328203155A001.md\",\"createBy\":\"admin\",\"size\":0,\"createTime\":1648470716314,\"name\":\"重装系统准备\",\"id\":3,\"md5\":\"022a4e2a369e86f89f6ecf65a6b919d5\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2022-03-28 20:31:56');
INSERT INTO `sys_oper_log` VALUES (326, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"xiaobai\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":15,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"isList\":\"1\",\"required\":false,\"superColumn\":false,\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"文件id\",\"isQuery\":\"1\",\"updateTime\":1648387857000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1648380906000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":16,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"文件名\",\"isQuery\":\"1\",\"updateTime\":1648387857000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648380906000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Url\",\"usableColumn\":false,\"columnId\":17,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"isInsert\":\"1\",\"javaField\":\"url\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"文件链接\",\"isQuery\":\"1\",\"updateTime\":1648387857000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1648380906000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"url\"},{\"capJavaField\":\"Type\",\"usableColumn\":false,\"columnId\":18,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"sys_resources_type\",\"required\":false,\"superColumn\":false,\"isInsert\":\"1\",\"javaField\":\"type\",\"htmlType\":\"select\",\"edit\":false,\"query\":true,\"columnComment\":\"文件类型\",\"isQuery\":\"1\",\"updateTime\":1648387857000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:33:44');
INSERT INTO `sys_oper_log` VALUES (327, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-28 20:33:48');
INSERT INTO `sys_oper_log` VALUES (328, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-28 20:33:48');
INSERT INTO `sys_oper_log` VALUES (329, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"primary\",\"dictSort\":1,\"remark\":\"jpg图片格式\",\"params\":{},\"dictType\":\"sys_resources_type\",\"dictLabel\":\"jpg\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:39:47');
INSERT INTO `sys_oper_log` VALUES (330, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"listClass\":\"primary\",\"dictSort\":2,\"remark\":\"png图片格式\",\"params\":{},\"dictType\":\"sys_resources_type\",\"dictLabel\":\"png\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:40:25');
INSERT INTO `sys_oper_log` VALUES (331, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"listClass\":\"primary\",\"dictSort\":3,\"remark\":\"mp4视频格式\",\"params\":{},\"dictType\":\"sys_resources_type\",\"dictLabel\":\"mp4\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:40:58');
INSERT INTO `sys_oper_log` VALUES (332, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"4\",\"listClass\":\"primary\",\"dictSort\":4,\"remark\":\"txt文本格式\",\"params\":{},\"dictType\":\"sys_resources_type\",\"dictLabel\":\"txt\",\"createBy\":\"admin\",\"default\":false,\"cssClass\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:41:23');
INSERT INTO `sys_oper_log` VALUES (333, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"5\",\"listClass\":\"primary\",\"dictSort\":5,\"remark\":\"markdown格式\",\"params\":{},\"dictType\":\"sys_resources_type\",\"dictLabel\":\"md\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:41:53');
INSERT INTO `sys_oper_log` VALUES (334, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"6\",\"listClass\":\"primary\",\"dictSort\":6,\"remark\":\"pdf文档格式\",\"params\":{},\"dictType\":\"sys_resources_type\",\"dictLabel\":\"pdf\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:42:09');
INSERT INTO `sys_oper_log` VALUES (335, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"7\",\"listClass\":\"primary\",\"dictSort\":7,\"remark\":\"doc文档格式\",\"params\":{},\"dictType\":\"sys_resources_type\",\"dictLabel\":\"doc\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:42:27');
INSERT INTO `sys_oper_log` VALUES (336, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"8\",\"listClass\":\"primary\",\"dictSort\":8,\"remark\":\"xls文档格式\",\"params\":{},\"dictType\":\"sys_resources_type\",\"dictLabel\":\"xls\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:42:50');
INSERT INTO `sys_oper_log` VALUES (337, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"7\",\"listClass\":\"primary\",\"dictSort\":7,\"remark\":\"zip压缩包格式\",\"params\":{},\"dictType\":\"sys_resources_type\",\"dictLabel\":\"ziip\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:43:35');
INSERT INTO `sys_oper_log` VALUES (338, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"7\",\"listClass\":\"primary\",\"dictSort\":7,\"remark\":\"zip压缩包格式\",\"params\":{},\"dictType\":\"sys_resources_type\",\"dictLabel\":\"zip\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1648471415000,\"dictCode\":133,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:43:43');
INSERT INTO `sys_oper_log` VALUES (339, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"9\",\"listClass\":\"primary\",\"dictSort\":9,\"remark\":\"doc文档格式\",\"params\":{},\"dictType\":\"sys_resources_type\",\"dictLabel\":\"doc\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1648471347000,\"dictCode\":131,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:43:53');
INSERT INTO `sys_oper_log` VALUES (340, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"10\",\"listClass\":\"primary\",\"dictSort\":10,\"remark\":\"xls文档格式\",\"params\":{},\"dictType\":\"sys_resources_type\",\"dictLabel\":\"xls\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1648471370000,\"dictCode\":132,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:44:01');
INSERT INTO `sys_oper_log` VALUES (341, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"8\",\"listClass\":\"primary\",\"dictSort\":8,\"remark\":\"rar压缩包格式\",\"params\":{},\"dictType\":\"sys_resources_type\",\"dictLabel\":\"rar\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:44:17');
INSERT INTO `sys_oper_log` VALUES (342, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"11\",\"listClass\":\"primary\",\"dictSort\":11,\"remark\":\"gif动图格式\",\"params\":{},\"dictType\":\"sys_resources_type\",\"dictLabel\":\"gif\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:44:54');
INSERT INTO `sys_oper_log` VALUES (343, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"12\",\"listClass\":\"primary\",\"dictSort\":12,\"remark\":\"jpeg图片格式\",\"params\":{},\"dictType\":\"sys_resources_type\",\"dictLabel\":\"jpeg\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:45:17');
INSERT INTO `sys_oper_log` VALUES (344, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"13\",\"listClass\":\"primary\",\"dictSort\":13,\"remark\":\"docx文档格式\",\"params\":{},\"dictType\":\"sys_resources_type\",\"dictLabel\":\"docx\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:45:37');
INSERT INTO `sys_oper_log` VALUES (345, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"14\",\"listClass\":\"primary\",\"dictSort\":14,\"remark\":\"xlsx文档格式\",\"params\":{},\"dictType\":\"sys_resources_type\",\"dictLabel\":\"xlsx\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:45:51');
INSERT INTO `sys_oper_log` VALUES (346, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"15\",\"listClass\":\"primary\",\"dictSort\":15,\"remark\":\"ppt文档格式\",\"params\":{},\"dictType\":\"sys_resources_type\",\"dictLabel\":\"ppt\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:46:17');
INSERT INTO `sys_oper_log` VALUES (347, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"16\",\"listClass\":\"primary\",\"dictSort\":16,\"remark\":\"pptx文档格式\",\"params\":{},\"dictType\":\"sys_resources_type\",\"dictLabel\":\"pptx\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:46:30');
INSERT INTO `sys_oper_log` VALUES (348, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"17\",\"listClass\":\"primary\",\"dictSort\":17,\"remark\":\"html网页格式\",\"params\":{},\"dictType\":\"sys_resources_type\",\"dictLabel\":\"html\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:46:46');
INSERT INTO `sys_oper_log` VALUES (349, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"18\",\"listClass\":\"primary\",\"dictSort\":19,\"remark\":\"7z压缩包格式\",\"params\":{},\"dictType\":\"sys_resources_type\",\"dictLabel\":\"7z\",\"createBy\":\"admin\",\"default\":false,\"cssClass\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:47:10');
INSERT INTO `sys_oper_log` VALUES (350, '资源管理', 1, 'com.ruoyi.web.controller.system.SysResourcesController.add()', 'POST', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"params\":{},\"type\":\"jpg\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v2_20220328204945A001.jpg\",\"createBy\":\"admin\",\"size\":1125,\"createTime\":1648471785627,\"name\":\"wallhaven-72x61v2\",\"id\":4,\"md5\":\"b7fd7c7fdaeddf5447ba433b1f153c36\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2022-03-28 20:49:45');
INSERT INTO `sys_oper_log` VALUES (351, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"26\",\"listClass\":\"primary\",\"dictSort\":26,\"remark\":\"markdown格式\",\"params\":{},\"dictType\":\"sys_resources_type\",\"dictLabel\":\"md\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:51:48');
INSERT INTO `sys_oper_log` VALUES (352, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"26\",\"listClass\":\"primary\",\"dictSort\":26,\"remark\":\"mp3音乐格式\",\"params\":{},\"dictType\":\"sys_resources_type\",\"dictLabel\":\"mp3\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1648470108000,\"dictCode\":105,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:52:17');
INSERT INTO `sys_oper_log` VALUES (353, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"10\",\"listClass\":\"primary\",\"dictSort\":10,\"remark\":\"markdown格式\",\"params\":{},\"dictType\":\"sys_resources_type\",\"dictLabel\":\"md\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1648471908000,\"dictCode\":143,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:52:25');
INSERT INTO `sys_oper_log` VALUES (354, '资源管理', 2, 'com.ruoyi.web.controller.system.SysResourcesController.edit()', 'PUT', 1, 'admin', NULL, '/system/resources', '127.0.0.1', '内网IP', '{\"updateTime\":1648472086959,\"delFlag\":0,\"params\":{},\"type\":\"7z\",\"url\":\"http://localhost:8989/profile/upload/2022/03/28/myblog现_20220328205445A002.7z\",\"createBy\":\"admin\",\"size\":31960,\"createTime\":1648470716000,\"updateBy\":\"admin\",\"name\":\"myblog现\",\"id\":3,\"md5\":\"c4f89d541e2482fd2fc8741ce4bd0780\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2022-03-28 20:54:46');
INSERT INTO `sys_oper_log` VALUES (355, '资源管理', 3, 'com.ruoyi.web.controller.system.SysResourcesController.remove()', 'DELETE', 1, 'admin', NULL, '/system/resources/1', '127.0.0.1', '内网IP', '{ids=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:55:01');
INSERT INTO `sys_oper_log` VALUES (356, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/sys_resources', '127.0.0.1', '内网IP', '{tableName=sys_resources}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-28 20:56:03');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2022-03-26 13:11:48', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2022-03-26 13:11:48', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2022-03-26 13:11:48', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2022-03-26 13:11:48', '', NULL, '');

-- ----------------------------
-- Table structure for sys_resources
-- ----------------------------
DROP TABLE IF EXISTS `sys_resources`;
CREATE TABLE `sys_resources`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件名',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件链接',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件类型',
  `size` bigint(50) DEFAULT NULL COMMENT '文件大小（kb）',
  `del_flag` tinyint(1) DEFAULT 0 COMMENT '逻辑删除（0正常，1禁用）',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '唯一标识',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '资源管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_resources
-- ----------------------------
INSERT INTO `sys_resources` VALUES (2, 'github错误', 'http://localhost:8989/profile/upload/2022/03/28/github错误_20220328203011A004.txt', 'txt', 0, 0, '4fc092efa410f6b076f244e8aa407bcc', 'admin', '2022-03-28 20:30:12', NULL, '2022-03-28 20:30:12');
INSERT INTO `sys_resources` VALUES (3, 'myblog现', 'http://localhost:8989/profile/upload/2022/03/28/myblog现_20220328205445A002.7z', '7z', 31960, 0, 'c4f89d541e2482fd2fc8741ce4bd0780', 'admin', '2022-03-28 20:31:56', 'admin', '2022-03-28 20:54:47');
INSERT INTO `sys_resources` VALUES (4, 'wallhaven-72x61v2', 'http://localhost:8989/profile/upload/2022/03/28/wallhaven-72x61v2_20220328204945A001.jpg', 'jpg', 1125, 0, 'b7fd7c7fdaeddf5447ba433b1f153c36', 'admin', '2022-03-28 20:49:46', NULL, '2022-03-28 20:49:45');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2022-03-26 13:11:49', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-03-28 20:49:36', 'admin', '2022-03-26 13:11:48', '', '2022-03-28 20:49:35', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-03-26 13:11:48', 'admin', '2022-03-26 13:11:48', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
