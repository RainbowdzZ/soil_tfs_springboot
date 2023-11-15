/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : ry-vue

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 15/11/2023 11:27:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'wx_user', '微信用户表', NULL, NULL, 'WxUser', 'crud', 'com.ruoyi.wx', 'wx', 'wxuser', '微信用户', 'xieqingbiao', '0', '/', '{\"parentMenuId\":\"2002\"}', 'admin', '2023-11-02 10:11:44', '', '2023-11-02 17:21:26', NULL);
INSERT INTO `gen_table` VALUES (2, 'wx_coupon', '优惠券的规则信息', NULL, NULL, 'WxCoupon', 'crud', 'com.ruoyi.wx', 'wx', 'coupon', '优惠券', 'xqb', '0', '/', '{\"parentMenuId\":\"2002\"}', 'admin', '2023-11-05 16:27:12', '', '2023-11-09 15:06:35', NULL);
INSERT INTO `gen_table` VALUES (3, 'wx_user_coupon', '优惠券历史', NULL, NULL, 'WxUserCoupon', 'crud', 'com.ruoyi.wx', 'wx', 'usercoupon', '优惠券历史', 'xqb', '0', '/', '{\"parentMenuId\":\"2002\"}', 'admin', '2023-11-06 16:47:14', '', '2023-11-09 15:20:42', NULL);
INSERT INTO `gen_table` VALUES (4, 'wx_user_farm', '用户农场表', NULL, NULL, 'WxUserFarm', 'crud', 'com.ruoyi.wx', 'wx', 'farm', '农场管理', 'xqb', '0', '/', '{\"parentMenuId\":\"2002\"}', 'admin', '2023-11-08 16:49:10', '', '2023-11-08 16:53:17', NULL);
INSERT INTO `gen_table` VALUES (5, 'tfs_checkup', '', NULL, NULL, 'TfsCheckup', 'crud', 'com.ruoyi.system', 'system', 'checkup', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2023-11-13 09:49:43', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (6, 'tfs_checkup_indicator', '', NULL, NULL, 'TfsCheckupIndicator', 'crud', 'com.ruoyi.system', 'system', 'indicator', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2023-11-13 09:49:43', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (7, 'tfs_order', '', NULL, NULL, 'TfsOrder', 'crud', 'com.ruoyi.system', 'system', 'order', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2023-11-13 09:49:43', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (8, 'tfs_recipe', '', NULL, NULL, 'TfsRecipe', 'crud', 'com.ruoyi.system', 'system', 'recipe', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2023-11-13 09:49:43', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(0) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'id', '主键', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-02 10:11:44', '', '2023-11-02 17:21:26');
INSERT INTO `gen_table_column` VALUES (2, 1, 'openid', '微信用户唯一标识', 'varchar(100)', 'String', 'openid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-11-02 10:11:44', '', '2023-11-02 17:21:26');
INSERT INTO `gen_table_column` VALUES (3, 1, 'nickname', '微信名称', 'varchar(100)', 'String', 'nickname', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-11-02 10:11:44', '', '2023-11-02 17:21:26');
INSERT INTO `gen_table_column` VALUES (4, 1, 'phone', '手机号', 'varchar(11)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-11-02 10:11:44', '', '2023-11-02 17:21:26');
INSERT INTO `gen_table_column` VALUES (5, 1, 'sex', '性别', 'int', 'Long', 'sex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2023-11-02 10:11:44', '', '2023-11-02 17:21:26');
INSERT INTO `gen_table_column` VALUES (6, 1, 'avatar', '头像', 'varchar(255)', 'String', 'avatar', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'imageUpload', '', 6, 'admin', '2023-11-02 10:11:44', '', '2023-11-02 17:21:26');
INSERT INTO `gen_table_column` VALUES (7, 1, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2023-11-02 10:11:44', '', '2023-11-02 17:21:26');
INSERT INTO `gen_table_column` VALUES (8, 1, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2023-11-02 10:11:44', '', '2023-11-02 17:21:26');
INSERT INTO `gen_table_column` VALUES (9, 1, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2023-11-02 10:11:44', '', '2023-11-02 17:21:26');
INSERT INTO `gen_table_column` VALUES (10, 1, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2023-11-02 10:11:44', '', '2023-11-02 17:21:26');
INSERT INTO `gen_table_column` VALUES (11, 2, 'id', '优惠券id', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-05 16:27:12', '', '2023-11-09 15:06:35');
INSERT INTO `gen_table_column` VALUES (12, 2, 'name', '优惠券名称，可以和活动名称保持一致', 'varchar(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-11-05 16:27:12', '', '2023-11-09 15:06:35');
INSERT INTO `gen_table_column` VALUES (13, 2, 'type', '优惠券类型，1：普通券。目前就一种，保留字段', 'tinyint', 'Long', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 3, 'admin', '2023-11-05 16:27:12', '', '2023-11-09 15:06:35');
INSERT INTO `gen_table_column` VALUES (14, 2, 'discount_type', '折扣类型，1：满减，2：每满减，3：折扣，4：无门槛', 'tinyint', 'Long', 'discountType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2023-11-05 16:27:12', '', '2023-11-09 15:06:35');
INSERT INTO `gen_table_column` VALUES (15, 2, 'threshold_amount', '使用门槛，0：表示无门槛，其他值：最低消费金额', 'int', 'Long', 'thresholdAmount', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2023-11-05 16:27:12', '', '2023-11-09 15:06:35');
INSERT INTO `gen_table_column` VALUES (16, 2, 'obtain_way', '获取方式：1：手动领取，2：兑换码', 'tinyint', 'Long', 'obtainWay', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 6, 'admin', '2023-11-05 16:27:12', '', '2023-11-09 15:06:35');
INSERT INTO `gen_table_column` VALUES (17, 2, 'issue_begin_time', '开始发放时间', 'datetime', 'Date', 'issueBeginTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2023-11-05 16:27:12', '', '2023-11-09 15:06:35');
INSERT INTO `gen_table_column` VALUES (18, 2, 'issue_end_time', '结束发放时间', 'datetime', 'Date', 'issueEndTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2023-11-05 16:27:12', '', '2023-11-09 15:06:35');
INSERT INTO `gen_table_column` VALUES (19, 2, 'term_days', '优惠券有效期天数，0：表示有效期是指定有效期的', 'int', 'Long', 'termDays', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-11-05 16:27:12', '', '2023-11-09 15:06:35');
INSERT INTO `gen_table_column` VALUES (20, 2, 'term_begin_time', '优惠券有效期开始时间', 'datetime', 'Date', 'termBeginTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 10, 'admin', '2023-11-05 16:27:12', '', '2023-11-09 15:06:35');
INSERT INTO `gen_table_column` VALUES (21, 2, 'term_end_time', '优惠券有效期结束时间', 'datetime', 'Date', 'termEndTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 11, 'admin', '2023-11-05 16:27:12', '', '2023-11-09 15:06:35');
INSERT INTO `gen_table_column` VALUES (22, 2, 'status', '优惠券配置状态，1：待发放，2：未开始   3：进行中，4：已结束，5：暂停', 'tinyint', 'Long', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'wx_coupon_status', 12, 'admin', '2023-11-05 16:27:12', '', '2023-11-09 15:06:35');
INSERT INTO `gen_table_column` VALUES (23, 2, 'total_num', '总数量，不超过5000', 'int', 'Long', 'totalNum', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 13, 'admin', '2023-11-05 16:27:12', '', '2023-11-09 15:06:35');
INSERT INTO `gen_table_column` VALUES (24, 2, 'issue_num', '已发行数量，用于判断是否超发', 'int', 'Long', 'issueNum', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 14, 'admin', '2023-11-05 16:27:12', '', '2023-11-09 15:06:35');
INSERT INTO `gen_table_column` VALUES (25, 2, 'used_num', '已使用数量', 'int', 'Long', 'usedNum', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 15, 'admin', '2023-11-05 16:27:12', '', '2023-11-09 15:06:35');
INSERT INTO `gen_table_column` VALUES (26, 2, 'user_limit', '每个人限领的数量，默认1', 'int', 'Long', 'userLimit', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 16, 'admin', '2023-11-05 16:27:12', '', '2023-11-09 15:06:35');
INSERT INTO `gen_table_column` VALUES (27, 2, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 17, 'admin', '2023-11-05 16:27:12', '', '2023-11-09 15:06:35');
INSERT INTO `gen_table_column` VALUES (28, 2, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2023-11-05 16:27:12', '', '2023-11-09 15:06:35');
INSERT INTO `gen_table_column` VALUES (29, 2, 'creater', '创建人', 'bigint', 'Long', 'creater', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2023-11-05 16:27:12', '', '2023-11-09 15:06:35');
INSERT INTO `gen_table_column` VALUES (30, 2, 'updater', '更新人', 'bigint', 'Long', 'updater', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2023-11-05 16:27:12', '', '2023-11-09 15:06:35');
INSERT INTO `gen_table_column` VALUES (31, 3, 'id', 'id', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-06 16:47:14', '', '2023-11-09 15:20:42');
INSERT INTO `gen_table_column` VALUES (32, 3, 'user_id', '用户id', 'bigint', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-11-06 16:47:14', '', '2023-11-09 15:20:42');
INSERT INTO `gen_table_column` VALUES (33, 3, 'coupon_id', '优惠券id', 'bigint', 'Long', 'couponId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-11-06 16:47:14', '', '2023-11-09 15:20:42');
INSERT INTO `gen_table_column` VALUES (34, 3, 'term_begin_time', '有效期开始时间', 'datetime', 'Date', 'termBeginTime', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'datetime', '', 4, 'admin', '2023-11-06 16:47:14', '', '2023-11-09 15:20:42');
INSERT INTO `gen_table_column` VALUES (35, 3, 'term_end_time', '有效期结束时间', 'datetime', 'Date', 'termEndTime', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'datetime', '', 5, 'admin', '2023-11-06 16:47:14', '', '2023-11-09 15:20:42');
INSERT INTO `gen_table_column` VALUES (36, 3, 'used_time', '使用时间（核销时间）', 'datetime', 'Date', 'usedTime', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'datetime', '', 6, 'admin', '2023-11-06 16:47:14', '', '2023-11-09 15:20:42');
INSERT INTO `gen_table_column` VALUES (37, 3, 'status', '优惠券状态，1：未使用，2：已使用，3：已失效', 'tinyint', 'Long', 'status', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'radio', 'wx_user_conpon_status', 7, 'admin', '2023-11-06 16:47:14', '', '2023-11-09 15:20:42');
INSERT INTO `gen_table_column` VALUES (38, 3, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2023-11-06 16:47:14', '', '2023-11-09 15:20:42');
INSERT INTO `gen_table_column` VALUES (39, 3, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2023-11-06 16:47:14', '', '2023-11-09 15:20:42');
INSERT INTO `gen_table_column` VALUES (40, 3, 'order_id', '订单id', 'bigint', 'Long', 'orderId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2023-11-06 16:47:14', '', '2023-11-09 15:20:42');
INSERT INTO `gen_table_column` VALUES (41, 4, 'id', 'id', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-08 16:49:10', '', '2023-11-08 16:53:17');
INSERT INTO `gen_table_column` VALUES (42, 4, 'user_id', '用户id', 'bigint', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-11-08 16:49:10', '', '2023-11-08 16:53:17');
INSERT INTO `gen_table_column` VALUES (43, 4, 'consignee', '收件人', 'varchar(50)', 'String', 'consignee', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-11-08 16:49:10', '', '2023-11-08 16:53:17');
INSERT INTO `gen_table_column` VALUES (44, 4, 'phone', '手机号', 'varchar(11)', 'String', 'phone', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-11-08 16:49:10', '', '2023-11-08 16:53:17');
INSERT INTO `gen_table_column` VALUES (45, 4, 'province_name', '省级名称', 'varchar(32)', 'String', 'provinceName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2023-11-08 16:49:10', '', '2023-11-08 16:53:18');
INSERT INTO `gen_table_column` VALUES (46, 4, 'city_name', '市级名称', 'varchar(32)', 'String', 'cityName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 6, 'admin', '2023-11-08 16:49:10', '', '2023-11-08 16:53:18');
INSERT INTO `gen_table_column` VALUES (47, 4, 'district_name', '区级名称', 'varchar(32)', 'String', 'districtName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 7, 'admin', '2023-11-08 16:49:10', '', '2023-11-08 16:53:18');
INSERT INTO `gen_table_column` VALUES (48, 4, 'detail', '详细地址', 'varchar(200)', 'String', 'detail', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 8, 'admin', '2023-11-08 16:49:10', '', '2023-11-08 16:53:18');
INSERT INTO `gen_table_column` VALUES (49, 4, 'is_default', '默认地址 0否1是', 'tinyint(1)', 'Integer', 'isDefault', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 9, 'admin', '2023-11-08 16:49:10', '', '2023-11-08 16:53:18');
INSERT INTO `gen_table_column` VALUES (50, 4, 'plant_category', '种植种类', 'varchar(50)', 'String', 'plantCategory', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 10, 'admin', '2023-11-08 16:49:10', '', '2023-11-08 16:53:18');
INSERT INTO `gen_table_column` VALUES (51, 4, 'scale', '种植规模', 'varchar(64)', 'String', 'scale', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 11, 'admin', '2023-11-08 16:49:10', '', '2023-11-08 16:53:18');
INSERT INTO `gen_table_column` VALUES (52, 4, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2023-11-08 16:49:10', '', '2023-11-08 16:53:18');
INSERT INTO `gen_table_column` VALUES (53, 4, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2023-11-08 16:49:10', '', '2023-11-08 16:53:18');
INSERT INTO `gen_table_column` VALUES (54, 4, 'creater', '创建人', 'bigint', 'Long', 'creater', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 14, 'admin', '2023-11-08 16:49:10', '', '2023-11-08 16:53:18');
INSERT INTO `gen_table_column` VALUES (55, 4, 'updater', '更新人', 'bigint', 'Long', 'updater', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 15, 'admin', '2023-11-08 16:49:10', '', '2023-11-08 16:53:18');
INSERT INTO `gen_table_column` VALUES (56, 4, 'is_deleted', '是否删除 0否1是', 'tinyint(1)', 'Integer', 'isDeleted', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 16, 'admin', '2023-11-08 16:49:10', '', '2023-11-08 16:53:18');
INSERT INTO `gen_table_column` VALUES (57, 5, 'id', NULL, 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-13 09:49:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (58, 5, 'order_id', NULL, 'bigint', 'Long', 'orderId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-11-13 09:49:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (59, 5, 'submission_time', NULL, 'datetime', 'Date', 'submissionTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2023-11-13 09:49:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (60, 5, 'checkup_indicator_id', NULL, 'bigint', 'Long', 'checkupIndicatorId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-11-13 09:49:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (61, 5, 'checkup_indicator_name', NULL, 'varchar(255)', 'String', 'checkupIndicatorName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2023-11-13 09:49:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (62, 5, 'unit', NULL, 'varchar(20)', 'String', 'unit', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-11-13 09:49:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (63, 5, 'checkup_value', NULL, 'decimal(5,2)', 'BigDecimal', 'checkupValue', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-11-13 09:49:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (64, 6, 'id', NULL, 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-13 09:49:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (65, 6, 'indicator_name', NULL, 'varchar(255)', 'String', 'indicatorName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-11-13 09:49:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (66, 6, 'unit', NULL, 'char(20)', 'String', 'unit', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-11-13 09:49:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (67, 6, 'created_at', NULL, 'datetime', 'Date', 'createdAt', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2023-11-13 09:49:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (68, 6, 'updated_at', NULL, 'datetime', 'Date', 'updatedAt', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2023-11-13 09:49:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (69, 6, 'status', NULL, 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 6, 'admin', '2023-11-13 09:49:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (70, 7, 'id', NULL, 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-13 09:49:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (71, 7, 'wx_user_id', NULL, 'bigint', 'Long', 'wxUserId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-11-13 09:49:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (72, 7, 'soil_number', NULL, 'smallint', 'Long', 'soilNumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-11-13 09:49:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (73, 7, 'order_time', NULL, 'datetime', 'Date', 'orderTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2023-11-13 09:49:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (74, 7, 'order_status', NULL, 'char(1)', 'String', 'orderStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2023-11-13 09:49:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (75, 7, 'recipe_id', NULL, 'bigint', 'Long', 'recipeId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-11-13 09:49:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (76, 7, 'checkup_id', NULL, 'bigint', 'Long', 'checkupId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-11-13 09:49:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (77, 7, 'coupon_id', NULL, 'bigint', 'Long', 'couponId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-11-13 09:49:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (78, 8, 'id', NULL, 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-13 09:49:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (79, 8, 'create_at', NULL, 'datetime', 'Date', 'createAt', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 2, 'admin', '2023-11-13 09:49:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (80, 8, 'update_at', NULL, 'datetime', 'Date', 'updateAt', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2023-11-13 09:49:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (81, 8, 'fertilization_advice', NULL, 'varchar(255)', 'String', 'fertilizationAdvice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-11-13 09:49:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (82, 8, 'recipe_advice', NULL, 'varchar(255)', 'String', 'recipeAdvice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-11-13 09:49:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (83, 8, 'summary', NULL, 'varchar(255)', 'String', 'summary', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-11-13 09:49:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (84, 8, 'order_id', NULL, 'bigint', 'Long', 'orderId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-11-13 09:49:43', '', NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
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
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
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
  `fired_time` bigint(0) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(0) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(0) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
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
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
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
  `last_checkin_time` bigint(0) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(0) NOT NULL COMMENT '检查间隔时间',
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
  `repeat_count` bigint(0) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(0) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(0) NOT NULL COMMENT '已经触发的次数',
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
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(0) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(0) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(0) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(0) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
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
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(0) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(0) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(0) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(0) NOT NULL COMMENT '开始时间',
  `end_time` bigint(0) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(0) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-10-29 20:56:20', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-10-29 20:56:20', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-10-29 20:56:20', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-10-29 20:56:20', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-10-29 20:56:20', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-10-29 20:56:20', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '采土检测机构', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-29 20:56:19', 'admin', '2023-11-12 20:32:20');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-29 20:56:19', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-29 20:56:19', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-29 20:56:19', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-29 20:56:19', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-29 20:56:19', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-29 20:56:19', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-29 20:56:19', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-29 20:56:19', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-29 20:56:19', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(0) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 119 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '待发放', '1', 'wx_coupon_status', NULL, 'primary', 'N', '0', 'admin', '2023-11-09 15:01:31', 'admin', '2023-11-09 15:01:39', NULL);
INSERT INTO `sys_dict_data` VALUES (101, 0, '未开始', '2', 'wx_coupon_status', NULL, 'info', 'N', '0', 'admin', '2023-11-09 15:02:46', 'admin', '2023-11-09 15:03:19', NULL);
INSERT INTO `sys_dict_data` VALUES (102, 0, '进行中', '3', 'wx_coupon_status', NULL, 'success', 'N', '0', 'admin', '2023-11-09 15:03:07', 'admin', '2023-11-09 15:03:13', NULL);
INSERT INTO `sys_dict_data` VALUES (103, 0, '已结束', '4', 'wx_coupon_status', NULL, 'danger', 'N', '0', 'admin', '2023-11-09 15:04:05', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 0, '暂停中', '5', 'wx_coupon_status', NULL, 'warning', 'N', '0', 'admin', '2023-11-09 15:04:39', 'admin', '2023-11-10 09:03:16', NULL);
INSERT INTO `sys_dict_data` VALUES (105, 0, '未使用', '1', 'wx_user_conpon_status', NULL, 'primary', 'N', '0', 'admin', '2023-11-09 15:19:38', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 0, '已使用', '2', 'wx_user_conpon_status', NULL, 'success', 'N', '0', 'admin', '2023-11-09 15:19:57', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (107, 0, '已失效', '3', 'wx_user_conpon_status', NULL, 'danger', 'N', '0', 'admin', '2023-11-09 15:20:22', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (110, 0, '未支付', '0', 'tfs_order_status', NULL, 'warning', 'N', '0', 'admin', '2023-11-02 14:05:52', '', NULL, '订单未支付状态');
INSERT INTO `sys_dict_data` VALUES (111, 0, '待送检', '1', 'tfs_order_status', NULL, 'warning', 'N', '0', 'admin', '2023-11-02 14:07:06', '', NULL, '订单待送检');
INSERT INTO `sys_dict_data` VALUES (112, 0, '待检测', '2', 'tfs_order_status', NULL, 'primary', 'N', '0', 'admin', '2023-11-02 14:07:28', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (113, 0, '待配方', '3', 'tfs_order_status', NULL, 'primary', 'N', '0', 'admin', '2023-11-02 14:08:12', 'admin', '2023-11-02 14:08:53', NULL);
INSERT INTO `sys_dict_data` VALUES (114, 0, '已完成', '4', 'tfs_order_status', NULL, 'success', 'N', '0', 'admin', '2023-11-02 14:09:11', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (115, 0, '已取消', '5', 'tfs_order_status', NULL, 'danger', 'N', '0', 'admin', '2023-11-02 14:09:36', '', NULL, '订单已取消');
INSERT INTO `sys_dict_data` VALUES (116, 0, '禁用', '0', 'checkup_indicator_status', NULL, 'danger', 'N', '0', 'admin', '2023-11-09 10:22:44', 'admin', '2023-11-09 10:36:40', NULL);
INSERT INTO `sys_dict_data` VALUES (117, 1, '启用', '1', 'checkup_indicator_status', NULL, 'success', 'N', '0', 'admin', '2023-11-09 10:23:23', 'admin', '2023-11-09 10:36:48', NULL);
INSERT INTO `sys_dict_data` VALUES (118, 0, '待采土', '6', 'tfs_order_status', NULL, 'primary', 'N', '0', 'admin', '2023-11-14 13:45:38', 'admin', '2023-11-14 13:45:51', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '优惠劵配置状态', 'wx_coupon_status', '0', 'admin', '2023-11-09 14:59:12', '', NULL, '优惠劵配置状态列表');
INSERT INTO `sys_dict_type` VALUES (101, '优惠劵使用状态', 'wx_user_conpon_status', '0', 'admin', '2023-11-09 15:18:42', 'admin', '2023-11-09 15:19:03', '用户优惠劵使用状态');
INSERT INTO `sys_dict_type` VALUES (105, '订单状态', 'tfs_order_status', '0', 'admin', '2023-11-02 12:03:15', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (106, '检测指标状态', 'checkup_indicator_status', '0', 'admin', '2023-11-09 10:18:15', '', NULL, '检测指标状态');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_job` VALUES (100, '检查优惠劵过期设置状态', 'DEFAULT', 'couponTask.checkCouponExpire', '0 */30 * * * ?', '1', '1', '1', 'admin', '2023-11-07 16:09:27', 'admin', '2023-11-08 10:12:45', '');
INSERT INTO `sys_job` VALUES (101, '定时删除个人优惠劵', 'DEFAULT', 'userCouponTask.delExpireCoupons()', '0 0 0 ? * MON', '1', '1', '1', 'admin', '2023-11-12 16:18:47', '', NULL, '');
INSERT INTO `sys_job` VALUES (102, '定时删除优惠劵活动', 'DEFAULT', 'couponTask.checkCouponExpire()', '0 0 0 ? * MON', '1', '1', '1', 'admin', '2023-11-12 16:28:21', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：6毫秒', '0', '', '2023-11-07 15:22:10');
INSERT INTO `sys_job_log` VALUES (2, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：4毫秒', '0', '', '2023-11-07 15:25:07');
INSERT INTO `sys_job_log` VALUES (3, '查看个人优惠劵过期', 'DEFAULT', 'couponTask.checkCoupon', '查看个人优惠劵过期 总共耗时：6毫秒', '0', '', '2023-11-07 16:09:34');
INSERT INTO `sys_job_log` VALUES (4, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2023-11-07 16:09:55');
INSERT INTO `sys_job_log` VALUES (5, '查看个人优惠劵过期', 'DEFAULT', 'couponTask.checkCoupon', '查看个人优惠劵过期 总共耗时：3毫秒', '0', '', '2023-11-07 16:12:32');
INSERT INTO `sys_job_log` VALUES (6, '检查优惠劵过期设置状态', 'DEFAULT', 'couponTask.checkCouponExpire', '检查优惠劵过期设置状态 总共耗时：451毫秒', '1', 'java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'search_value\' in \'field list\'\r\n### The error may exist in com/ruoyi/wx/mapper/WxUserCouponMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT  id,user_id,coupon_id,term_begin_time,term_end_time,used_time,status,order_id,search_value,create_by,create_time,update_by,update_time,remark,params  FROM wx_user_coupon     WHERE (term_end_time <= ? AND status = ?)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'search_value\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'search_value\' in \'field list\'\r\n	at org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator.doTranslate(SQLErrorCodeSQLExceptionTranslator.java:239)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:70)\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTran', '2023-11-08 09:47:59');
INSERT INTO `sys_job_log` VALUES (7, '检查优惠劵过期设置状态', 'DEFAULT', 'couponTask.checkCouponExpire', '检查优惠劵过期设置状态 总共耗时：38588毫秒', '1', 'java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'search_value\' in \'field list\'\r\n### The error may exist in com/ruoyi/wx/mapper/WxUserCouponMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT  id,user_id,coupon_id,term_begin_time,term_end_time,used_time,status,order_id,search_value,create_by,create_time,update_by,update_time,remark,params  FROM wx_user_coupon     WHERE (term_end_time <= ? AND term_end_time IS NOT NULL AND status = ?)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'search_value\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'search_value\' in \'field list\'\r\n	at org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator.doTranslate(SQLErrorCodeSQLExceptionTranslator.java:239)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:70)\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionI', '2023-11-08 09:53:34');
INSERT INTO `sys_job_log` VALUES (8, '检查优惠劵过期设置状态', 'DEFAULT', 'couponTask.checkCouponExpire', '检查优惠劵过期设置状态 总共耗时：20538毫秒', '0', '', '2023-11-08 10:01:44');
INSERT INTO `sys_job_log` VALUES (9, '检查优惠劵过期设置状态', 'DEFAULT', 'couponTask.checkCouponExpire', '检查优惠劵过期设置状态 总共耗时：31810毫秒', '0', '', '2023-11-08 10:04:56');
INSERT INTO `sys_job_log` VALUES (10, '定时删除个人优惠劵', 'DEFAULT', 'userCouponTask.delExpireCoupons()', '定时删除个人优惠劵 总共耗时：3毫秒', '0', '', '2023-11-12 16:18:57');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 214 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-29 21:25:02');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '1', '验证码已失效', '2023-10-30 08:45:20');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2023-10-30 08:45:29');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 11:34:58');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 14:00:54');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 15:57:17');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:30:14');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 17:41:38');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 20:33:16');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-31 11:36:44');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-10-31 14:06:54');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-31 14:07:00');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-31 14:30:41');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2023-10-31 14:30:53');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-31 15:25:45');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 08:33:13');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 09:07:03');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 10:18:06');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-01 10:34:15');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2023-11-01 10:35:05');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 14:05:36');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 15:41:10');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-02 09:27:11');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-02 10:11:32');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2023-11-02 14:11:28');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2023-11-02 17:13:39');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-03 08:33:38');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-03 09:18:15');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-11-03 09:22:17');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-03 09:22:31');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-11-03 14:04:51');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-03 14:05:13');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '192.168.43.229', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-03 14:53:14');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '192.168.43.229', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-03 15:00:01');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '192.168.43.229', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-03 15:00:01');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '192.168.43.229', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-03 15:02:07');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '192.168.43.229', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2023-11-03 15:03:32');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '192.168.43.229', '内网IP', 'Chrome Mobile', 'Android 6.x', '1', '验证码已失效', '2023-11-03 15:03:32');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '192.168.43.229', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-11-03 15:03:54');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '192.168.43.229', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-03 15:03:59');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '192.168.43.229', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-03 15:04:48');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '192.168.43.229', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '退出成功', '2023-11-03 15:05:02');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '192.168.43.229', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2023-11-03 15:05:16');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '192.168.43.229', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2023-11-03 15:47:56');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '192.168.43.229', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '退出成功', '2023-11-03 16:08:25');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2023-11-05 14:41:35');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '退出成功', '2023-11-05 14:48:12');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2023-11-05 14:48:19');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '退出成功', '2023-11-05 14:58:01');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2023-11-05 14:58:13');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-05 16:26:57');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-06 10:17:29');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '退出成功', '2023-11-06 10:17:44');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2023-11-06 10:18:02');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '退出成功', '2023-11-06 10:24:38');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '退出成功', '2023-11-06 10:24:38');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2023-11-06 10:25:10');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '退出成功', '2023-11-06 10:26:43');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '1', '验证码已失效', '2023-11-06 10:28:53');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2023-11-06 10:28:59');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '退出成功', '2023-11-06 10:29:09');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2023-11-06 10:29:22');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-06 14:17:35');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2023-11-06 15:49:27');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-06 16:47:03');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-06 17:05:52');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-06 17:05:56');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '退出成功', '2023-11-06 17:22:20');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2023-11-06 17:22:31');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '退出成功', '2023-11-06 17:25:43');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2023-11-06 17:25:54');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '退出成功', '2023-11-06 18:01:32');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2023-11-06 18:01:41');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '退出成功', '2023-11-06 18:08:20');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2023-11-06 18:08:32');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '退出成功', '2023-11-06 18:20:27');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2023-11-06 18:20:36');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2023-11-06 20:28:10');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-07 08:55:10');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-07 09:46:29');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2023-11-07 14:09:52');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2023-11-07 15:04:09');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2023-11-07 15:51:46');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-07 16:44:22');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-07 17:22:35');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-08 09:40:39');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-08 11:21:26');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-08 16:48:49');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-08 18:02:47');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-09 08:59:46');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2023-11-09 09:46:38');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-09 10:33:28');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-09 11:34:36');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-09 14:07:02');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-09 21:47:31');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-10 08:34:19');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2023-11-10 10:22:40');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2023-11-10 11:40:04');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-10 14:59:23');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-10 16:57:37');
INSERT INTO `sys_logininfor` VALUES (200, 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-10 16:57:46');
INSERT INTO `sys_logininfor` VALUES (201, 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-10 17:10:57');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-10 17:11:03');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-10 17:43:54');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-10 21:54:49');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-12 14:23:06');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-12 15:35:15');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-12 15:35:20');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-12 20:25:46');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-13 09:02:15');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-13 10:55:02');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2023-11-13 20:09:33');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2023-11-14 08:49:30');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-15 08:42:48');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(0) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(0) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2061 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-10-29 20:56:20', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-10-29 20:56:20', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-10-29 20:56:20', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '1', '1', '', 'guide', 'admin', '2023-10-29 20:56:20', 'admin', '2023-11-02 09:28:44', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-10-29 20:56:20', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-10-29 20:56:20', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-10-29 20:56:20', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-10-29 20:56:20', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-10-29 20:56:20', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-10-29 20:56:20', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-10-29 20:56:20', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-10-29 20:56:20', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-10-29 20:56:20', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-10-29 20:56:20', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-10-29 20:56:20', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-10-29 20:56:20', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-10-29 20:56:20', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-10-29 20:56:20', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-10-29 20:56:20', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-10-29 20:56:20', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-10-29 20:56:20', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-10-29 20:56:20', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-10-29 20:56:20', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-10-29 20:56:20', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '小程序管理', 0, 4, 'wx', NULL, NULL, 1, 0, 'M', '0', '0', '', 'wechat', 'admin', '2023-11-02 09:28:20', 'admin', '2023-11-02 09:42:49', '');
INSERT INTO `sys_menu` VALUES (2004, '微信用户', 2002, 1, 'wxuser', 'wx/wxuser/index', NULL, 1, 0, 'C', '0', '0', 'wx:wxuser:list', 'user', 'admin', '2023-11-02 10:42:04', 'admin', '2023-11-02 10:45:19', '微信用户菜单');
INSERT INTO `sys_menu` VALUES (2005, '微信用户查询', 2004, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'wx:wxuser:query', '#', 'admin', '2023-11-02 10:42:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '微信用户新增', 2004, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'wx:wxuser:add', '#', 'admin', '2023-11-02 10:42:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '微信用户修改', 2004, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'wx:wxuser:edit', '#', 'admin', '2023-11-02 10:42:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '微信用户删除', 2004, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'wx:wxuser:remove', '#', 'admin', '2023-11-02 10:42:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '微信用户导出', 2004, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'wx:wxuser:export', '#', 'admin', '2023-11-02 10:42:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '优惠券管理', 2002, 1, 'coupon', 'wx/coupon/index', NULL, 1, 0, 'C', '0', '0', 'wx:coupon:list', 'documentation', 'admin', '2023-11-05 17:24:48', 'admin', '2023-11-05 17:26:08', '优惠券菜单');
INSERT INTO `sys_menu` VALUES (2016, '优惠券查询', 2015, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'wx:coupon:query', '#', 'admin', '2023-11-05 17:24:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '优惠券新增', 2015, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'wx:coupon:add', '#', 'admin', '2023-11-05 17:24:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '优惠券修改', 2015, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'wx:coupon:edit', '#', 'admin', '2023-11-05 17:24:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '优惠券删除', 2015, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'wx:coupon:remove', '#', 'admin', '2023-11-05 17:24:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '优惠券导出', 2015, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'wx:coupon:export', '#', 'admin', '2023-11-05 17:24:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '发放优惠劵', 2015, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wx:coupon:issue', '#', 'admin', '2023-11-06 10:34:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '暂停发放', 2015, 7, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wx:coupon:stop', '#', 'admin', '2023-11-06 16:15:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '优惠券历史', 2002, 1, 'usercoupon', 'wx/usercoupon/index', NULL, 1, 0, 'C', '0', '0', 'wx:usercoupon:list', 'log', 'admin', '2023-11-06 16:58:30', 'admin', '2023-11-06 16:59:03', '优惠券历史菜单');
INSERT INTO `sys_menu` VALUES (2024, '优惠券历史查询', 2023, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'wx:usercoupon:query', '#', 'admin', '2023-11-06 16:58:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '优惠券历史新增', 2023, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'wx:usercoupon:add', '#', 'admin', '2023-11-06 16:58:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '优惠券历史修改', 2023, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'wx:usercoupon:edit', '#', 'admin', '2023-11-06 16:58:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '优惠券历史删除', 2023, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'wx:usercoupon:remove', '#', 'admin', '2023-11-06 16:58:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '优惠券历史导出', 2023, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'wx:usercoupon:export', '#', 'admin', '2023-11-06 16:58:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '农场管理', 2002, 1, 'farm', 'wx/farm/index', NULL, 1, 0, 'C', '0', '0', 'wx:farm:list', 'drag', 'admin', '2023-11-08 16:55:52', 'admin', '2023-11-08 18:03:53', '农场管理菜单');
INSERT INTO `sys_menu` VALUES (2030, '农场管理查询', 2029, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'wx:farm:query', '#', 'admin', '2023-11-08 16:55:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '农场管理新增', 2029, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'wx:farm:add', '#', 'admin', '2023-11-08 16:55:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '农场管理修改', 2029, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'wx:farm:edit', '#', 'admin', '2023-11-08 16:55:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '农场管理删除', 2029, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'wx:farm:remove', '#', 'admin', '2023-11-08 16:55:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '农场管理导出', 2029, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'wx:farm:export', '#', 'admin', '2023-11-08 16:55:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '检测订单后台', 0, 0, 'tfs', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'peoples', 'admin', '2023-11-02 11:26:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '订单管理', 2040, 1, 'order', 'tfs/order/index', NULL, 1, 0, 'C', '0', '0', 'tfs:order:list', '#', 'admin', '2023-11-02 14:23:40', '', NULL, '订单管理菜单');
INSERT INTO `sys_menu` VALUES (2042, '订单管理查询', 2041, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'tfs:order:query', '#', 'admin', '2023-11-02 14:23:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '订单管理新增', 2041, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'tfs:order:add', '#', 'admin', '2023-11-02 14:23:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '订单管理修改', 2041, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'tfs:order:edit', '#', 'admin', '2023-11-02 14:23:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '订单管理删除', 2041, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'tfs:order:remove', '#', 'admin', '2023-11-02 14:23:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '订单管理导出', 2041, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'tfs:order:export', '#', 'admin', '2023-11-02 14:23:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '检测指标管理', 2040, 1, 'indicator', 'tfs/indicator/index', NULL, 1, 0, 'C', '0', '0', 'tfs:indicator:list', '#', 'admin', '2023-11-03 10:56:42', '', NULL, '检测指标管理菜单');
INSERT INTO `sys_menu` VALUES (2048, '检测指标管理查询', 2047, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'tfs:indicator:query', '#', 'admin', '2023-11-03 10:56:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '检测指标管理新增', 2047, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'tfs:indicator:add', '#', 'admin', '2023-11-03 10:56:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2050, '检测指标管理修改', 2047, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'tfs:indicator:edit', '#', 'admin', '2023-11-03 10:56:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '检测指标管理删除', 2047, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'tfs:indicator:remove', '#', 'admin', '2023-11-03 10:56:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '检测指标管理导出', 2047, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'tfs:indicator:export', '#', 'admin', '2023-11-03 10:56:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2053, '专家配方', 0, 1, 'ecs', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'education', 'admin', '2023-11-03 11:17:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2054, '专家配方', 2053, 1, 'recipe', 'tfs/recipe/index', NULL, 1, 0, 'C', '0', '0', 'tfs:recipe:list', '#', 'admin', '2023-11-03 11:26:16', '', NULL, '专家配方菜单');
INSERT INTO `sys_menu` VALUES (2055, '专家配方查询', 2054, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'tfs:recipe:query', '#', 'admin', '2023-11-03 11:26:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2056, '专家配方新增', 2054, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'tfs:recipe:add', '#', 'admin', '2023-11-03 11:26:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2057, '专家配方修改', 2054, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'tfs:recipe:edit', '#', 'admin', '2023-11-03 11:26:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2058, '专家配方删除', 2054, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'tfs:recipe:remove', '#', 'admin', '2023-11-03 11:26:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '专家配方导出', 2054, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'tfs:recipe:export', '#', 'admin', '2023-11-03 11:26:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2060, '查看订单详情', 2054, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'tfs:recipe:order', '#', 'admin', '2023-11-14 16:24:11', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-10-29 20:56:20', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-10-29 20:56:20', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(0) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(0) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(0) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(0) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 301 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-10-29 20:56:20\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2023-10-29 20:56:20\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-31 11:55:13', 133);
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"phone\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"小程序管理\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"app\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-31 15:30:51', 116);
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-10-31 15:30:51\",\"icon\":\"phone\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"小程序管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"app\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-31 15:31:26', 157);
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-10-31 15:30:51\",\"icon\":\"phone\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"小程序管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"app\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-31 15:31:37', 14);
INSERT INTO `sys_oper_log` VALUES (104, '角色管理', 5, 'com.ruoyi.web.controller.system.SysRoleController.export()', 'POST', 1, 'admin', NULL, '/system/role/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-01 14:16:30', 2274);
INSERT INTO `sys_oper_log` VALUES (105, '角色管理', 5, 'com.ruoyi.web.controller.system.SysRoleController.export()', 'POST', 1, 'admin', NULL, '/system/role/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-01 14:16:46', 155);
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2000', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 14:50:16', 93);
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"订单管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"order\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 14:51:37', 59);
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"phone\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"小程序管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"wx\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-02 09:28:20', 59);
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-10-29 20:56:20\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-02 09:28:39', 32);
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-10-29 20:56:20\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-02 09:28:44', 37);
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wx/user/index\",\"createBy\":\"admin\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"农户管理\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2002,\"path\":\"wxuser\",\"perms\":\"wx:user:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-02 09:34:43', 23);
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wx/user/index\",\"createTime\":\"2023-11-02 09:34:43\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"农户管理\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2002,\"path\":\"wxuser\",\"perms\":\"wx:user:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-02 09:35:04', 22);
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-11-02 09:28:20\",\"icon\":\"wechat\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"小程序管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"wx\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-02 09:42:49', 35);
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"wx_user\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-02 10:11:44', 298);
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"wxuser\",\"className\":\"WxUser\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-02 10:11:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Openid\",\"columnComment\":\"微信用户唯一标识\",\"columnId\":2,\"columnName\":\"openid\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-02 10:11:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"openid\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Nickname\",\"columnComment\":\"微信名称\",\"columnId\":3,\"columnName\":\"nickname\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-02 10:11:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"nickname\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Phone\",\"columnComment\":\"手机号\",\"columnId\":4,\"columnName\":\"phone\",\"columnType\":\"varchar(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-02 10:11:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"phone\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"que', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-02 10:13:52', 122);
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"wx_user\"}', NULL, 0, NULL, '2023-11-02 10:16:34', 115);
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"wxuser\",\"className\":\"WxUser\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-02 10:11:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-02 10:13:51\",\"usableColumn\":false},{\"capJavaField\":\"Openid\",\"columnComment\":\"微信用户唯一标识\",\"columnId\":2,\"columnName\":\"openid\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-02 10:11:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"openid\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-02 10:13:52\",\"usableColumn\":false},{\"capJavaField\":\"Nickname\",\"columnComment\":\"微信名称\",\"columnId\":3,\"columnName\":\"nickname\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-02 10:11:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"nickname\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-02 10:13:52\",\"usableColumn\":false},{\"capJavaField\":\"Phone\",\"columnComment\":\"手机号\",\"columnId\":4,\"columnName\":\"phone\",\"columnType\":\"varchar(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-02 10:11:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-02 10:19:54', 90);
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2004', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2023-11-02 10:42:57', 21);
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2004', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2023-11-02 10:43:07', 7);
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wx/user/index\",\"createTime\":\"2023-11-02 09:34:43\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"农户管理\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":2002,\"path\":\"wxuser\",\"perms\":\"wx:user:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-02 10:43:52', 29);
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wx/wxuser/index\",\"createTime\":\"2023-11-02 10:42:04\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"微信用户\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"wxuser\",\"perms\":\"wx:wxuser:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-02 10:44:15', 16);
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wx/wxuser/index\",\"createTime\":\"2023-11-02 10:42:04\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"微信用户\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"wxuser\",\"perms\":\"wx:wxuser:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-02 10:45:19', 17);
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"wxuser\",\"className\":\"WxUser\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-02 10:11:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-02 10:19:54\",\"usableColumn\":false},{\"capJavaField\":\"Openid\",\"columnComment\":\"微信用户唯一标识\",\"columnId\":2,\"columnName\":\"openid\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-02 10:11:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"openid\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-02 10:19:54\",\"usableColumn\":false},{\"capJavaField\":\"Nickname\",\"columnComment\":\"微信名称\",\"columnId\":3,\"columnName\":\"nickname\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-02 10:11:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"nickname\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-02 10:19:54\",\"usableColumn\":false},{\"capJavaField\":\"Phone\",\"columnComment\":\"手机号\",\"columnId\":4,\"columnName\":\"phone\",\"columnType\":\"varchar(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-02 10:11:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-02 10:46:00', 74);
INSERT INTO `sys_oper_log` VALUES (124, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"wx_user\"}', NULL, 0, NULL, '2023-11-02 10:46:06', 76);
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"wx_user\"}', NULL, 0, NULL, '2023-11-02 10:48:22', 75);
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2003', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-02 10:59:06', 64);
INSERT INTO `sys_oper_log` VALUES (127, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"wxuser\",\"className\":\"WxUser\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-02 10:11:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-02 10:46:00\",\"usableColumn\":false},{\"capJavaField\":\"Openid\",\"columnComment\":\"微信用户唯一标识\",\"columnId\":2,\"columnName\":\"openid\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-02 10:11:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"openid\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-02 10:46:00\",\"usableColumn\":false},{\"capJavaField\":\"Nickname\",\"columnComment\":\"微信名称\",\"columnId\":3,\"columnName\":\"nickname\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-02 10:11:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"nickname\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-02 10:46:00\",\"usableColumn\":false},{\"capJavaField\":\"Phone\",\"columnComment\":\"手机号\",\"columnId\":4,\"columnName\":\"phone\",\"columnType\":\"varchar(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-02 10:11:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-02 17:17:20', 83);
INSERT INTO `sys_oper_log` VALUES (128, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"wxuser\",\"className\":\"WxUser\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-02 10:11:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-02 17:17:20\",\"usableColumn\":false},{\"capJavaField\":\"Openid\",\"columnComment\":\"微信用户唯一标识\",\"columnId\":2,\"columnName\":\"openid\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-02 10:11:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"openid\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-02 17:17:20\",\"usableColumn\":false},{\"capJavaField\":\"Nickname\",\"columnComment\":\"微信名称\",\"columnId\":3,\"columnName\":\"nickname\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-02 10:11:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"nickname\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-02 17:17:20\",\"usableColumn\":false},{\"capJavaField\":\"Phone\",\"columnComment\":\"手机号\",\"columnId\":4,\"columnName\":\"phone\",\"columnType\":\"varchar(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-02 10:11:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-02 17:21:26', 116);
INSERT INTO `sys_oper_log` VALUES (129, '微信用户', 2, 'com.ruoyi.wx.controller.WxUserController.edit()', 'PUT', 1, 'admin', NULL, '/wx/wxuser', '127.0.0.1', '内网IP', '{\"avatar\":\"/profile/upload/2023/11/02/Default_20231102173159A001.jpg\",\"createBy\":\"\",\"createTime\":\"2023-11-02 17:10:40\",\"id\":3,\"nickname\":\"395J0s577x3pSVjV\",\"openid\":\"oECBU6iMOH0vYVF0gTu9qw7wFqWw\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2023-11-02 17:32:09\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-02 17:32:09', 64);
INSERT INTO `sys_oper_log` VALUES (130, '微信用户', 2, 'com.ruoyi.wx.controller.WxUserController.edit()', 'PUT', 1, 'admin', NULL, '/wx/wxuser', '127.0.0.1', '内网IP', '{\"avatar\":\"/profile/upload/2023/11/02/Default_20231102173159A001.jpg\",\"createBy\":\"\",\"createTime\":\"2023-11-02 17:10:40\",\"id\":3,\"nickname\":\"大沙比\",\"openid\":\"oECBU6iMOH0vYVF0gTu9qw7wFqWw\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2023-11-02 17:33:59\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-02 17:33:59', 16);
INSERT INTO `sys_oper_log` VALUES (131, '微信用户', 2, 'com.ruoyi.wx.controller.WxUserController.edit()', 'PUT', 1, 'admin', NULL, '/wx/wxuser', '127.0.0.1', '内网IP', '{\"avatar\":\"/profile/upload/2023/11/02/Default_20231102173159A001.jpg,/profile/upload/2023/11/02/、代码3_20231102174054A002.png\",\"createBy\":\"\",\"createTime\":\"2023-11-02 17:10:40\",\"id\":3,\"nickname\":\"大沙比\",\"openid\":\"oECBU6iMOH0vYVF0gTu9qw7wFqWw\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2023-11-02 17:40:56\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-02 17:40:56', 49);
INSERT INTO `sys_oper_log` VALUES (132, '微信用户', 2, 'com.ruoyi.wx.controller.WxUserController.edit()', 'PUT', 1, 'admin', NULL, '/wx/wxuser', '127.0.0.1', '内网IP', '{\"avatar\":\"/profile/upload/2023/11/02/Default_20231102173159A001.jpg\",\"createBy\":\"\",\"createTime\":\"2023-11-02 17:10:40\",\"id\":3,\"nickname\":\"大沙比\",\"openid\":\"oECBU6iMOH0vYVF0gTu9qw7wFqWw\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2023-11-02 17:41:12\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-02 17:41:12', 11);
INSERT INTO `sys_oper_log` VALUES (133, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"wx_coupon\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 16:27:13', 190);
INSERT INTO `sys_oper_log` VALUES (134, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"coupon\",\"className\":\"WxCoupon\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"优惠券id\",\"columnId\":11,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 16:27:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"优惠券名称，可以和活动名称保持一致\",\"columnId\":12,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 16:27:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"优惠券类型，1：普通券。目前就一种，保留字段\",\"columnId\":13,\"columnName\":\"type\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 16:27:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"type\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DiscountType\",\"columnComment\":\"折扣类型，1：满减，2：每满减，3：折扣，4：无门槛\",\"columnId\":14,\"columnName\":\"discount_type\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 16:27:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 16:31:34', 87);
INSERT INTO `sys_oper_log` VALUES (135, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"coupon\",\"className\":\"WxCoupon\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"优惠券id\",\"columnId\":11,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 16:27:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-11-05 16:31:34\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"优惠券名称，可以和活动名称保持一致\",\"columnId\":12,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 16:27:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-11-05 16:31:34\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"优惠券类型，1：普通券。目前就一种，保留字段\",\"columnId\":13,\"columnName\":\"type\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 16:27:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"type\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-11-05 16:31:34\",\"usableColumn\":false},{\"capJavaField\":\"DiscountType\",\"columnComment\":\"折扣类型，1：满减，2：每满减，3：折扣，4：无门槛\",\"columnId\":14,\"columnName\":\"discount_type\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 16:27:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 16:34:26', 92);
INSERT INTO `sys_oper_log` VALUES (136, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2001', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 17:01:57', 34);
INSERT INTO `sys_oper_log` VALUES (137, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"coupon\",\"className\":\"WxCoupon\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"优惠券id\",\"columnId\":11,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 16:27:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-11-05 16:34:26\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"优惠券名称，可以和活动名称保持一致\",\"columnId\":12,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 16:27:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-11-05 16:34:26\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"优惠券类型，1：普通券。目前就一种，保留字段\",\"columnId\":13,\"columnName\":\"type\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 16:27:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"type\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-11-05 16:34:26\",\"usableColumn\":false},{\"capJavaField\":\"DiscountType\",\"columnComment\":\"折扣类型，1：满减，2：每满减，3：折扣，4：无门槛\",\"columnId\":14,\"columnName\":\"discount_type\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 16:27:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 17:03:25', 98);
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"coupon\",\"className\":\"WxCoupon\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"优惠券id\",\"columnId\":11,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 16:27:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-11-05 17:03:25\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"优惠券名称，可以和活动名称保持一致\",\"columnId\":12,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 16:27:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-11-05 17:03:25\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"优惠券类型，1：普通券。目前就一种，保留字段\",\"columnId\":13,\"columnName\":\"type\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 16:27:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"type\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-11-05 17:03:25\",\"usableColumn\":false},{\"capJavaField\":\"DiscountType\",\"columnComment\":\"折扣类型，1：满减，2：每满减，3：折扣，4：无门槛\",\"columnId\":14,\"columnName\":\"discount_type\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 16:27:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 17:23:25', 80);
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wx/coupon/index\",\"createTime\":\"2023-11-05 17:24:48\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2015,\"menuName\":\"优惠券管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"coupon\",\"perms\":\"wx:coupon:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 17:26:08', 21);
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"wx_coupon\"}', NULL, 0, NULL, '2023-11-05 17:26:55', 105);
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"coupon\",\"className\":\"WxCoupon\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"优惠券id\",\"columnId\":11,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 16:27:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-11-05 17:23:25\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"优惠券名称，可以和活动名称保持一致\",\"columnId\":12,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 16:27:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-11-05 17:23:25\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"优惠券类型，1：普通券。目前就一种，保留字段\",\"columnId\":13,\"columnName\":\"type\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 16:27:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"type\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-11-05 17:23:25\",\"usableColumn\":false},{\"capJavaField\":\"DiscountType\",\"columnComment\":\"折扣类型，1：满减，2：每满减，3：折扣，4：无门槛\",\"columnId\":14,\"columnName\":\"discount_type\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 16:27:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 17:42:16', 177);
INSERT INTO `sys_oper_log` VALUES (142, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"coupon\",\"className\":\"WxCoupon\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"优惠券id\",\"columnId\":11,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 16:27:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-11-05 17:42:16\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"优惠券名称，可以和活动名称保持一致\",\"columnId\":12,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 16:27:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-11-05 17:42:16\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"优惠券类型，1：普通券。目前就一种，保留字段\",\"columnId\":13,\"columnName\":\"type\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 16:27:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"type\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-11-05 17:42:16\",\"usableColumn\":false},{\"capJavaField\":\"DiscountType\",\"columnComment\":\"折扣类型，1：满减，2：每满减，3：折扣，4：无门槛\",\"columnId\":14,\"columnName\":\"discount_type\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 16:27:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 17:44:17', 123);
INSERT INTO `sys_oper_log` VALUES (143, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"wx_coupon\"}', NULL, 0, NULL, '2023-11-05 17:44:41', 401);
INSERT INTO `sys_oper_log` VALUES (144, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"发放优惠劵\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2015,\"perms\":\"wx:coupon:issue\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 10:34:43', 72);
INSERT INTO `sys_oper_log` VALUES (145, '微信用户', 2, 'com.ruoyi.web.controller.wx.WxUserController.edit()', 'PUT', 1, 'admin', NULL, '/wx/wxuser', '127.0.0.1', '内网IP', '{\"avatar\":\"https://thirdwx.qlogo.cn/mmopen/vi_32/POgEwh4mIHO4nibH0KlMECNjjGxQUq24ZEaGT4poC6icRiccVGKSyXwibcPq4BWmiaIGuG1icwxaQX6grC9VemZoJ8rg/132\",\"createBy\":\"\",\"createTime\":\"2023-11-02 17:10:40\",\"id\":3,\"nickname\":\"大沙比111\",\"openid\":\"oECBU6iMOH0vYVF0gTu9qw7wFqWw\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2023-11-06 14:17:48\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 14:19:48', 119552);
INSERT INTO `sys_oper_log` VALUES (146, '微信用户', 2, 'com.ruoyi.web.controller.wx.WxUserController.edit()', 'PUT', 1, 'admin', NULL, '/wx/wxuser', '127.0.0.1', '内网IP', '{\"avatar\":\"https://thirdwx.qlogo.cn/mmopen/vi_32/POgEwh4mIHO4nibH0KlMECNjjGxQUq24ZEaGT4poC6icRiccVGKSyXwibcPq4BWmiaIGuG1icwxaQX6grC9VemZoJ8rg/132\",\"createBy\":\"\",\"createTime\":\"2023-11-02 17:10:40\",\"id\":3,\"nickname\":\"大沙比111\",\"openid\":\"oECBU6iMOH0vYVF0gTu9qw7wFqWw\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2023-11-06 14:19:48\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 14:19:48', 13);
INSERT INTO `sys_oper_log` VALUES (147, '微信用户', 2, 'com.ruoyi.web.controller.wx.WxUserController.edit()', 'PUT', 1, 'admin', NULL, '/wx/wxuser', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2023-11-02 17:10:40\",\"id\":3,\"nickname\":\"加薪要秃头\",\"openid\":\"oECBU6iMOH0vYVF0gTu9qw7wFqWw\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2023-11-06 15:54:58\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 15:55:00', 2318);
INSERT INTO `sys_oper_log` VALUES (148, '微信用户', 2, 'com.ruoyi.web.controller.wx.WxUserController.edit()', 'PUT', 1, 'admin', NULL, '/wx/wxuser', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2023-11-02 17:10:40\",\"id\":3,\"nickname\":\"加薪要秃头\",\"openid\":\"oECBU6iMOH0vYVF0gTu9qw7wFqWw\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2023-11-06 15:56:56\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 15:56:56', 24);
INSERT INTO `sys_oper_log` VALUES (149, '微信用户', 2, 'com.ruoyi.web.controller.wx.WxUserController.edit()', 'PUT', 1, 'admin', NULL, '/wx/wxuser', '127.0.0.1', '内网IP', '{\"avatar\":\"http://tmp/ZwEgOhkjMRnl78cda47afd411c50e703f811322a402e.jpeg,/profile/upload/2023/11/06/Default_20231106155828A001.jpg\",\"createBy\":\"\",\"createTime\":\"2023-11-02 17:10:40\",\"id\":3,\"nickname\":\"加薪要秃头\",\"openid\":\"oECBU6iMOH0vYVF0gTu9qw7wFqWw\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2023-11-06 15:58:33\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 15:58:33', 54);
INSERT INTO `sys_oper_log` VALUES (150, '微信用户', 2, 'com.ruoyi.web.controller.wx.WxUserController.edit()', 'PUT', 1, 'admin', NULL, '/wx/wxuser', '127.0.0.1', '内网IP', '{\"avatar\":\"/profile/upload/2023/11/06/Default_20231106155828A001.jpg\",\"createBy\":\"\",\"createTime\":\"2023-11-02 17:10:40\",\"id\":3,\"nickname\":\"加薪要秃头\",\"openid\":\"oECBU6iMOH0vYVF0gTu9qw7wFqWw\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2023-11-06 15:59:50\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 16:00:13', 30576);
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"暂停发放\",\"menuType\":\"F\",\"orderNum\":7,\"params\":{},\"parentId\":2015,\"perms\":\"wx:coupon:stop\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 16:15:15', 23);
INSERT INTO `sys_oper_log` VALUES (152, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"wx_user_coupon\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 16:47:14', 173);
INSERT INTO `sys_oper_log` VALUES (153, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"coupon\",\"className\":\"WxUserCoupon\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":31,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":32,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CouponId\",\"columnComment\":\"优惠券id\",\"columnId\":33,\"columnName\":\"coupon_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"couponId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TermBeginTime\",\"columnComment\":\"有效期开始时间\",\"columnId\":34,\"columnName\":\"term_begin_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"termBeginTime\",\"javaType\":\"Date\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 16:49:14', 54);
INSERT INTO `sys_oper_log` VALUES (154, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"coupon\",\"className\":\"WxUserCoupon\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":31,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-11-06 16:49:14\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":32,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-11-06 16:49:14\",\"usableColumn\":false},{\"capJavaField\":\"CouponId\",\"columnComment\":\"优惠券id\",\"columnId\":33,\"columnName\":\"coupon_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"couponId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-11-06 16:49:14\",\"usableColumn\":false},{\"capJavaField\":\"TermBeginTime\",\"columnComment\":\"有效期开始时间\",\"columnId\":34,\"columnName\":\"term_begin_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 16:50:24', 59);
INSERT INTO `sys_oper_log` VALUES (155, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"coupon\",\"className\":\"WxUserCoupon\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":31,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-11-06 16:50:24\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":32,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-11-06 16:50:24\",\"usableColumn\":false},{\"capJavaField\":\"CouponId\",\"columnComment\":\"优惠券id\",\"columnId\":33,\"columnName\":\"coupon_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"couponId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-11-06 16:50:24\",\"usableColumn\":false},{\"capJavaField\":\"TermBeginTime\",\"columnComment\":\"有效期开始时间\",\"columnId\":34,\"columnName\":\"term_begin_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 16:51:33', 46);
INSERT INTO `sys_oper_log` VALUES (156, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"coupon\",\"className\":\"WxUserCoupon\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":31,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-11-06 16:51:33\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":32,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-11-06 16:51:33\",\"usableColumn\":false},{\"capJavaField\":\"CouponId\",\"columnComment\":\"优惠券id\",\"columnId\":33,\"columnName\":\"coupon_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"couponId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-11-06 16:51:33\",\"usableColumn\":false},{\"capJavaField\":\"TermBeginTime\",\"columnComment\":\"有效期开始时间\",\"columnId\":34,\"columnName\":\"term_begin_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 16:52:26', 91);
INSERT INTO `sys_oper_log` VALUES (157, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"coupon\",\"className\":\"WxUserCoupon\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":31,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-11-06 16:52:26\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":32,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-11-06 16:52:26\",\"usableColumn\":false},{\"capJavaField\":\"CouponId\",\"columnComment\":\"优惠券id\",\"columnId\":33,\"columnName\":\"coupon_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"couponId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-11-06 16:52:26\",\"usableColumn\":false},{\"capJavaField\":\"TermBeginTime\",\"columnComment\":\"有效期开始时间\",\"columnId\":34,\"columnName\":\"term_begin_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 16:53:40', 67);
INSERT INTO `sys_oper_log` VALUES (158, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"wx_user_coupon\"}', NULL, 0, NULL, '2023-11-06 16:54:00', 144);
INSERT INTO `sys_oper_log` VALUES (159, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"usercoupon\",\"className\":\"WxUserCoupon\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":31,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-11-06 16:53:40\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":32,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-11-06 16:53:40\",\"usableColumn\":false},{\"capJavaField\":\"CouponId\",\"columnComment\":\"优惠券id\",\"columnId\":33,\"columnName\":\"coupon_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"couponId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-11-06 16:53:40\",\"usableColumn\":false},{\"capJavaField\":\"TermBeginTime\",\"columnComment\":\"有效期开始时间\",\"columnId\":34,\"columnName\":\"term_begin_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrem', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 16:55:54', 45);
INSERT INTO `sys_oper_log` VALUES (160, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"wx_user_coupon\"}', NULL, 0, NULL, '2023-11-06 16:56:38', 139);
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wx/usercoupon/index\",\"createTime\":\"2023-11-06 16:58:30\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2023,\"menuName\":\"优惠券历史\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"usercoupon\",\"perms\":\"wx:usercoupon:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 16:59:03', 12);
INSERT INTO `sys_oper_log` VALUES (162, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"usercoupon\",\"className\":\"WxUserCoupon\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":31,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-11-06 16:55:54\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":32,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-11-06 16:55:54\",\"usableColumn\":false},{\"capJavaField\":\"CouponId\",\"columnComment\":\"优惠券id\",\"columnId\":33,\"columnName\":\"coupon_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"couponId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-11-06 16:55:54\",\"usableColumn\":false},{\"capJavaField\":\"TermBeginTime\",\"columnComment\":\"有效期开始时间\",\"columnId\":34,\"columnName\":\"term_begin_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrem', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 17:40:35', 128);
INSERT INTO `sys_oper_log` VALUES (163, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"wx_user_coupon\"}', NULL, 0, NULL, '2023-11-06 17:40:41', 475);
INSERT INTO `sys_oper_log` VALUES (164, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":1,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 15:22:10', 59);
INSERT INTO `sys_oper_log` VALUES (165, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":1,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 15:25:07', 44);
INSERT INTO `sys_oper_log` VALUES (166, '定时任务', 1, 'com.ruoyi.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"cronExpression\":\"0/10 * * * * ?\",\"invokeTarget\":\"couponTask.checkCoupon\",\"jobGroup\":\"DEFAULT\",\"jobName\":\"查询优惠劵是否过期\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2023-11-07 15:57:50\",\"params\":{},\"status\":\"0\"}', NULL, 1, 'No bean named \'couponTask\' available', '2023-11-07 15:57:44', 13);
INSERT INTO `sys_oper_log` VALUES (167, '定时任务', 1, 'com.ruoyi.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"cronExpression\":\"0/10 * * * * ?\",\"invokeTarget\":\"couponTask.checkCoupon\",\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"jobName\":\"查看个人优惠劵过期\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2023-11-07 16:09:30\",\"params\":{},\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 16:09:27', 44);
INSERT INTO `sys_oper_log` VALUES (168, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 16:09:34', 17);
INSERT INTO `sys_oper_log` VALUES (169, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":1,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 16:09:55', 9);
INSERT INTO `sys_oper_log` VALUES (170, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 16:12:32', 64);
INSERT INTO `sys_oper_log` VALUES (171, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-11-07 16:09:27\",\"cronExpression\":\"0/10 * * * * ?\",\"invokeTarget\":\"couponTask.checkCouponExpire\",\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"jobName\":\"检查优惠劵过期设置状态\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2023-11-08 09:41:50\",\"params\":{},\"remark\":\"\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 09:41:43', 59);
INSERT INTO `sys_oper_log` VALUES (172, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 09:47:58', 31);
INSERT INTO `sys_oper_log` VALUES (173, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 09:52:58', 127);
INSERT INTO `sys_oper_log` VALUES (174, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 10:01:27', 124);
INSERT INTO `sys_oper_log` VALUES (175, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 10:04:30', 23);
INSERT INTO `sys_oper_log` VALUES (176, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"createTime\":\"2023-11-07 16:09:27\",\"cronExpression\":\"0 */30 * * * ?\",\"invokeTarget\":\"couponTask.checkCouponExpire\",\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"jobName\":\"检查优惠劵过期设置状态\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2023-11-08 10:30:00\",\"params\":{},\"remark\":\"\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 10:12:45', 50);
INSERT INTO `sys_oper_log` VALUES (177, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"wx_user_farm\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 16:49:10', 231);
INSERT INTO `sys_oper_log` VALUES (178, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"farm\",\"className\":\"WxUserFarm\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":41,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-08 16:49:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":42,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-08 16:49:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Consignee\",\"columnComment\":\"收件人\",\"columnId\":43,\"columnName\":\"consignee\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-08 16:49:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"consignee\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Phone\",\"columnComment\":\"手机号\",\"columnId\":44,\"columnName\":\"phone\",\"columnType\":\"varchar(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-08 16:49:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"phone\",\"javaType\":\"String\",\"list\":tr', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 16:52:22', 186);
INSERT INTO `sys_oper_log` VALUES (179, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"farm\",\"className\":\"WxUserFarm\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":41,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-08 16:49:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-11-08 16:52:22\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":42,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-08 16:49:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-11-08 16:52:22\",\"usableColumn\":false},{\"capJavaField\":\"Consignee\",\"columnComment\":\"收件人\",\"columnId\":43,\"columnName\":\"consignee\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-08 16:49:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"consignee\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2023-11-08 16:52:22\",\"usableColumn\":false},{\"capJavaField\":\"Phone\",\"columnComment\":\"手机号\",\"columnId\":44,\"columnName\":\"phone\",\"columnType\":\"varchar(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-08 16:49:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 16:53:18', 134);
INSERT INTO `sys_oper_log` VALUES (180, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"wx_user_farm\"}', NULL, 0, NULL, '2023-11-08 16:53:24', 359);
INSERT INTO `sys_oper_log` VALUES (181, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wx/farm/index\",\"createTime\":\"2023-11-08 16:55:52\",\"icon\":\"drag\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2029,\"menuName\":\"农场管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"farm\",\"perms\":\"wx:farm:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 18:03:53', 59);
INSERT INTO `sys_oper_log` VALUES (182, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"优惠劵配置状态\",\"dictType\":\"wx_coupon_status\",\"params\":{},\"remark\":\"优惠劵配置状态列表\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 14:59:12', 78);
INSERT INTO `sys_oper_log` VALUES (183, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"待发放\",\"dictSort\":0,\"dictType\":\"wx_coupon_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 15:01:31', 26);
INSERT INTO `sys_oper_log` VALUES (184, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-09 15:01:31\",\"default\":false,\"dictCode\":100,\"dictLabel\":\"待发放\",\"dictSort\":0,\"dictType\":\"wx_coupon_status\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 15:01:39', 25);
INSERT INTO `sys_oper_log` VALUES (185, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未开始\",\"dictSort\":0,\"dictType\":\"wx_coupon_status\",\"dictValue\":\"2\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 15:02:46', 12);
INSERT INTO `sys_oper_log` VALUES (186, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"进行中\",\"dictSort\":0,\"dictType\":\"wx_coupon_status\",\"dictValue\":\"3\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 15:03:07', 20);
INSERT INTO `sys_oper_log` VALUES (187, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-09 15:03:07\",\"default\":false,\"dictCode\":102,\"dictLabel\":\"进行中\",\"dictSort\":0,\"dictType\":\"wx_coupon_status\",\"dictValue\":\"3\",\"isDefault\":\"N\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 15:03:13', 16);
INSERT INTO `sys_oper_log` VALUES (188, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-09 15:02:46\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"未开始\",\"dictSort\":0,\"dictType\":\"wx_coupon_status\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 15:03:19', 19);
INSERT INTO `sys_oper_log` VALUES (189, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已结束\",\"dictSort\":0,\"dictType\":\"wx_coupon_status\",\"dictValue\":\"4\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 15:04:05', 17);
INSERT INTO `sys_oper_log` VALUES (190, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"暂停\",\"dictSort\":0,\"dictType\":\"wx_coupon_status\",\"dictValue\":\"5\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 15:04:39', 19);
INSERT INTO `sys_oper_log` VALUES (191, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"coupon\",\"className\":\"WxCoupon\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"优惠券id\",\"columnId\":11,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 16:27:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-11-05 17:44:17\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"优惠券名称，可以和活动名称保持一致\",\"columnId\":12,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 16:27:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-11-05 17:44:17\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"优惠券类型，1：普通券。目前就一种，保留字段\",\"columnId\":13,\"columnName\":\"type\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 16:27:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"type\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-11-05 17:44:17\",\"usableColumn\":false},{\"capJavaField\":\"DiscountType\",\"columnComment\":\"折扣类型，1：满减，2：每满减，3：折扣，4：无门槛\",\"columnId\":14,\"columnName\":\"discount_type\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-05 16:27:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 15:06:35', 167);
INSERT INTO `sys_oper_log` VALUES (192, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"优惠劵使用状态\",\"dictType\":\"wx_user_conpon_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 15:18:42', 22);
INSERT INTO `sys_oper_log` VALUES (193, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-09 15:18:42\",\"dictId\":101,\"dictName\":\"优惠劵使用状态\",\"dictType\":\"wx_user_conpon_status\",\"params\":{},\"remark\":\"用户优惠劵使用状态\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 15:19:04', 35);
INSERT INTO `sys_oper_log` VALUES (194, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未使用\",\"dictSort\":0,\"dictType\":\"wx_user_conpon_status\",\"dictValue\":\"1\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 15:19:38', 16);
INSERT INTO `sys_oper_log` VALUES (195, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已使用\",\"dictSort\":0,\"dictType\":\"wx_user_conpon_status\",\"dictValue\":\"2\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 15:19:57', 16);
INSERT INTO `sys_oper_log` VALUES (196, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已失效\",\"dictSort\":0,\"dictType\":\"wx_user_conpon_status\",\"dictValue\":\"3\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 15:20:22', 19);
INSERT INTO `sys_oper_log` VALUES (197, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"usercoupon\",\"className\":\"WxUserCoupon\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":31,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-11-06 17:40:34\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":32,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-11-06 17:40:34\",\"usableColumn\":false},{\"capJavaField\":\"CouponId\",\"columnComment\":\"优惠券id\",\"columnId\":33,\"columnName\":\"coupon_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"couponId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-11-06 17:40:34\",\"usableColumn\":false},{\"capJavaField\":\"TermBeginTime\",\"columnComment\":\"有效期开始时间\",\"columnId\":34,\"columnName\":\"term_begin_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-11-06 16:47:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrem', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 15:20:42', 121);
INSERT INTO `sys_oper_log` VALUES (198, '优惠券历史', 2, 'com.ruoyi.web.controller.wx.WxUserCouponController.edit()', 'PUT', 1, 'admin', NULL, '/wx/usercoupon', '127.0.0.1', '内网IP', '{\"couponId\":2,\"createTime\":\"2023-11-08 10:03:11\",\"id\":4,\"status\":3,\"termBeginTime\":\"2023-11-06 10:02:35\",\"termEndTime\":\"2023-11-08 10:02:58\",\"updateTime\":\"2023-11-09 15:27:59\",\"userId\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 15:27:59', 39);
INSERT INTO `sys_oper_log` VALUES (199, '优惠券', 1, 'com.ruoyi.web.controller.wx.WxCouponController.add()', 'POST', 1, 'admin', NULL, '/wx/coupon', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-11-09 15:40:11\",\"creater\":103,\"discountType\":4,\"id\":5,\"issueBeginTime\":\"2023-11-09 00:00:00\",\"issueEndTime\":\"2023-11-10 00:00:00\",\"name\":\"支付抵扣券3\",\"obtainWay\":1,\"termBeginTime\":\"2023-11-09 00:00:00\",\"termDays\":1,\"termEndTime\":\"2023-11-09 23:59:59\",\"thresholdAmount\":0,\"totalNum\":10,\"type\":1,\"updater\":103,\"userLimit\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 15:40:11', 51);
INSERT INTO `sys_oper_log` VALUES (200, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.edit()', 'PUT', 1, 'admin', NULL, '/wx/coupon', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-11-09 15:40:11\",\"creater\":103,\"discountType\":4,\"id\":5,\"issueBeginTime\":\"2023-11-09 00:00:00\",\"issueEndTime\":\"2023-11-10 00:00:00\",\"issueNum\":0,\"name\":\"支付抵扣券3\",\"obtainWay\":1,\"status\":1,\"termBeginTime\":\"2023-11-09 00:00:00\",\"termDays\":2,\"termEndTime\":\"2023-11-09 23:59:59\",\"thresholdAmount\":0,\"totalNum\":10,\"type\":1,\"updateTime\":\"2023-11-09 16:26:44\",\"updater\":103,\"usedNum\":0,\"userLimit\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 16:26:44', 121);
INSERT INTO `sys_oper_log` VALUES (201, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.beginIssue()', 'PUT', 1, 'admin', NULL, '/wx/coupon/5/issue', '127.0.0.1', '内网IP', '5', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 17:29:27', 31876);
INSERT INTO `sys_oper_log` VALUES (202, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.beginIssue()', 'PUT', 1, 'admin', NULL, '/wx/coupon/5/issue', '127.0.0.1', '内网IP', '5', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 17:39:43', 394459);
INSERT INTO `sys_oper_log` VALUES (203, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.beginIssue()', 'PUT', 1, 'admin', NULL, '/wx/coupon/5/issue', '127.0.0.1', '内网IP', '5', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 17:41:35', 92321);
INSERT INTO `sys_oper_log` VALUES (204, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.beginIssue()', 'PUT', 1, 'admin', NULL, '/wx/coupon/5/issue', '127.0.0.1', '内网IP', '5', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 17:49:47', 357331);
INSERT INTO `sys_oper_log` VALUES (205, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.beginIssue()', 'PUT', 1, 'admin', NULL, '/wx/coupon/5/issue', '127.0.0.1', '内网IP', '5', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 17:52:15', 89923);
INSERT INTO `sys_oper_log` VALUES (206, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.beginIssue()', 'PUT', 1, 'admin', NULL, '/wx/coupon/5/issue', '127.0.0.1', '内网IP', '5', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 17:56:23', 210424);
INSERT INTO `sys_oper_log` VALUES (207, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.beginIssue()', 'PUT', 1, 'admin', NULL, '/wx/coupon/5/issue', '127.0.0.1', '内网IP', '5', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 21:47:20', 13829608);
INSERT INTO `sys_oper_log` VALUES (208, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.beginIssue()', 'PUT', 1, 'admin', NULL, '/wx/coupon/5/issue', '127.0.0.1', '内网IP', '5', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 08:37:31', 173897);
INSERT INTO `sys_oper_log` VALUES (209, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.beginIssue()', 'PUT', 1, 'admin', NULL, '/wx/coupon/5/issue', '127.0.0.1', '内网IP', '5', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 08:38:54', 31834);
INSERT INTO `sys_oper_log` VALUES (210, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.beginIssue()', 'PUT', 1, 'admin', NULL, '/wx/coupon/5/issue', '127.0.0.1', '内网IP', '5', NULL, 1, '优惠券发放时间已过期', '2023-11-10 08:42:55', 14477);
INSERT INTO `sys_oper_log` VALUES (211, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.beginIssue()', 'PUT', 1, 'admin', NULL, '/wx/coupon/5/issue', '127.0.0.1', '内网IP', '5', NULL, 1, '优惠券发放时间已过期', '2023-11-10 08:45:10', 11);
INSERT INTO `sys_oper_log` VALUES (212, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.edit()', 'PUT', 1, 'admin', NULL, '/wx/coupon', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-11-09 15:40:11\",\"creater\":103,\"discountType\":4,\"id\":5,\"issueBeginTime\":\"2023-11-09 08:38:32\",\"issueEndTime\":\"2023-11-10 23:59:59\",\"issueNum\":0,\"name\":\"支付抵扣券3\",\"obtainWay\":1,\"status\":1,\"termBeginTime\":\"2023-11-09 00:00:11\",\"termDays\":2,\"termEndTime\":\"2023-11-09 23:59:59\",\"thresholdAmount\":0,\"totalNum\":10,\"type\":1,\"updateTime\":\"2023-11-10 08:45:42\",\"updater\":103,\"usedNum\":0,\"userLimit\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 08:45:42', 80);
INSERT INTO `sys_oper_log` VALUES (213, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.beginIssue()', 'PUT', 1, 'admin', NULL, '/wx/coupon/5/issue', '127.0.0.1', '内网IP', '5', NULL, 1, '优惠券发放时间已过期', '2023-11-10 08:45:50', 33);
INSERT INTO `sys_oper_log` VALUES (214, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.beginIssue()', 'PUT', 1, 'admin', NULL, '/wx/coupon/5/issue', '127.0.0.1', '内网IP', '5', NULL, 1, '优惠券发放时间已过期', '2023-11-10 08:51:08', 66371);
INSERT INTO `sys_oper_log` VALUES (215, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.beginIssue()', 'PUT', 1, 'admin', NULL, '/wx/coupon/5/issue', '127.0.0.1', '内网IP', '5', NULL, 1, '优惠券发放时间已过期', '2023-11-10 08:51:35', 11084);
INSERT INTO `sys_oper_log` VALUES (216, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.beginIssue()', 'PUT', 1, 'admin', NULL, '/wx/coupon/5/issue', '127.0.0.1', '内网IP', '5', NULL, 1, '优惠券发放时间已过期', '2023-11-10 08:54:10', 61666);
INSERT INTO `sys_oper_log` VALUES (217, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.beginIssue()', 'PUT', 1, 'admin', NULL, '/wx/coupon/5/issue', '127.0.0.1', '内网IP', '5', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 08:54:42', 160);
INSERT INTO `sys_oper_log` VALUES (218, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.edit()', 'PUT', 1, 'admin', NULL, '/wx/coupon', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-11-09 15:40:11\",\"creater\":103,\"discountType\":4,\"id\":5,\"issueBeginTime\":\"2023-11-10 08:54:42\",\"issueEndTime\":\"2023-11-10 00:00:00\",\"issueNum\":0,\"name\":\"支付抵扣券3\",\"obtainWay\":1,\"status\":3,\"termBeginTime\":\"2023-11-09 00:00:11\",\"termDays\":2,\"termEndTime\":\"2023-11-09 23:59:59\",\"thresholdAmount\":0,\"totalNum\":10,\"type\":1,\"updateTime\":\"2023-11-10 08:55:06\",\"updater\":103,\"usedNum\":0,\"userLimit\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 08:55:06', 28);
INSERT INTO `sys_oper_log` VALUES (219, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.beginIssue()', 'PUT', 1, 'admin', NULL, '/wx/coupon/5/issue', '127.0.0.1', '内网IP', '5', NULL, 1, '优惠券状态不正常', '2023-11-10 08:55:17', 19);
INSERT INTO `sys_oper_log` VALUES (220, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.beginIssue()', 'PUT', 1, 'admin', NULL, '/wx/coupon/5/issue', '127.0.0.1', '内网IP', '5', NULL, 1, '优惠券发放时间已过期', '2023-11-10 08:55:48', 22);
INSERT INTO `sys_oper_log` VALUES (221, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.edit()', 'PUT', 1, 'admin', NULL, '/wx/coupon', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-11-09 15:40:11\",\"creater\":103,\"discountType\":4,\"id\":5,\"issueBeginTime\":\"2023-11-10 08:54:42\",\"issueEndTime\":\"2023-11-10 23:59:59\",\"issueNum\":0,\"name\":\"支付抵扣券3\",\"obtainWay\":1,\"status\":1,\"termBeginTime\":\"2023-11-09 00:00:11\",\"termDays\":2,\"termEndTime\":\"2023-11-09 23:59:59\",\"thresholdAmount\":0,\"totalNum\":10,\"type\":1,\"updateTime\":\"2023-11-10 08:56:08\",\"updater\":103,\"usedNum\":0,\"userLimit\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 08:56:08', 17);
INSERT INTO `sys_oper_log` VALUES (222, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.beginIssue()', 'PUT', 1, 'admin', NULL, '/wx/coupon/5/issue', '127.0.0.1', '内网IP', '5', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 08:56:15', 51);
INSERT INTO `sys_oper_log` VALUES (223, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.stopIssue()', 'PUT', 1, 'admin', NULL, '/wx/coupon/5/stop', '127.0.0.1', '内网IP', '5', NULL, 0, NULL, '2023-11-10 09:02:38', 72);
INSERT INTO `sys_oper_log` VALUES (224, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-09 15:04:39\",\"default\":false,\"dictCode\":104,\"dictLabel\":\"暂停中\",\"dictSort\":0,\"dictType\":\"wx_coupon_status\",\"dictValue\":\"5\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 09:03:16', 28);
INSERT INTO `sys_oper_log` VALUES (225, '微信用户', 2, 'com.ruoyi.web.controller.wx.WxUserController.edit()', 'PUT', 1, 'admin', NULL, '/wx/wxuser', '127.0.0.1', '内网IP', '{\"avatar\":\"http://tmp/N6vmLH3st6or797e64059cce8911ac5cebb1e9f12838.jpeg,/profile/upload/2023/11/10/Default_20231110102353A001.jpg\",\"createBy\":\"\",\"createTime\":\"2023-11-02 17:10:40\",\"id\":3,\"nickname\":\"加薪不秃头\",\"openid\":\"oECBU6iMOH0vYVF0gTu9qw7wFqWw\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2023-11-10 10:28:30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 10:28:30', 54);
INSERT INTO `sys_oper_log` VALUES (226, '微信用户', 2, 'com.ruoyi.web.controller.wx.WxUserController.edit()', 'PUT', 1, 'admin', NULL, '/wx/wxuser', '127.0.0.1', '内网IP', '{\"avatar\":\"/profile/upload/2023/11/10/Default_20231110102353A001.jpg\",\"createBy\":\"\",\"createTime\":\"2023-11-02 17:10:40\",\"id\":3,\"nickname\":\"加薪不秃头\",\"openid\":\"oECBU6iMOH0vYVF0gTu9qw7wFqWw\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2023-11-10 10:28:37\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 10:28:37', 21);
INSERT INTO `sys_oper_log` VALUES (227, '微信用户', 2, 'com.ruoyi.web.controller.wx.WxUserController.edit()', 'PUT', 1, 'admin', NULL, '/wx/wxuser', '127.0.0.1', '内网IP', '{\"avatar\":\"/profile/upload/2023/11/10/Default_20231110102353A001.jpg\",\"createBy\":\"\",\"createTime\":\"2023-11-02 17:10:40\",\"id\":3,\"nickname\":\"加薪不秃头\",\"openid\":\"oECBU6iMOH0vYVF0gTu9qw7wFqWw\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2023-11-10 11:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 11:00:00', 214);
INSERT INTO `sys_oper_log` VALUES (228, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.edit()', 'PUT', 1, 'admin', NULL, '/wx/coupon', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-11-09 10:59:20\",\"creater\":1,\"discountType\":4,\"id\":4,\"issueBeginTime\":\"2023-11-09 09:48:52\",\"issueEndTime\":\"2023-11-11 23:48:58\",\"issueNum\":1,\"name\":\"支付抵用券2\",\"obtainWay\":1,\"status\":3,\"termBeginTime\":\"2023-11-09 10:58:45\",\"termDays\":1,\"termEndTime\":\"2023-11-11 10:58:54\",\"thresholdAmount\":0,\"totalNum\":10,\"type\":1,\"updateTime\":\"2023-11-10 17:45:11\",\"updater\":1,\"usedNum\":0,\"userLimit\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 17:45:11', 24);
INSERT INTO `sys_oper_log` VALUES (229, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.edit()', 'PUT', 1, 'admin', NULL, '/wx/coupon', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-11-09 10:01:35\",\"creater\":1,\"discountType\":4,\"id\":3,\"issueBeginTime\":\"2023-11-09 00:00:00\",\"issueEndTime\":\"2023-11-11 23:59:59\",\"issueNum\":1,\"name\":\"支付抵用券\",\"obtainWay\":1,\"status\":3,\"termBeginTime\":\"2023-11-09 00:00:00\",\"termDays\":7,\"termEndTime\":\"2023-11-14 23:59:59\",\"thresholdAmount\":0,\"totalNum\":10,\"type\":1,\"updateTime\":\"2023-11-10 17:45:31\",\"updater\":1,\"usedNum\":0,\"userLimit\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 17:45:31', 11);
INSERT INTO `sys_oper_log` VALUES (230, '优惠券', 3, 'com.ruoyi.web.controller.wx.WxCouponController.remove()', 'DELETE', 1, 'admin', NULL, '/wx/coupon/3,4,5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 17:50:07', 46);
INSERT INTO `sys_oper_log` VALUES (231, '优惠券历史', 3, 'com.ruoyi.web.controller.wx.WxUserCouponController.remove()', 'DELETE', 1, 'admin', NULL, '/wx/usercoupon/1722445367288561700,1722451072506667000', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-11-10 17:51:24', 7);
INSERT INTO `sys_oper_log` VALUES (232, '优惠券历史', 3, 'com.ruoyi.web.controller.wx.WxUserCouponController.remove()', 'DELETE', 1, 'admin', NULL, '/wx/usercoupon/1722445367288561700', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-11-10 17:51:41', 25);
INSERT INTO `sys_oper_log` VALUES (233, '优惠券历史', 3, 'com.ruoyi.web.controller.wx.WxUserCouponController.remove()', 'DELETE', 1, 'admin', NULL, '/wx/usercoupon/1722445367288561700', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-11-10 17:51:45', 10);
INSERT INTO `sys_oper_log` VALUES (234, '优惠券', 1, 'com.ruoyi.web.controller.wx.WxCouponController.add()', 'POST', 1, 'admin', NULL, '/wx/coupon', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-11-10 17:54:14\",\"creater\":1,\"discountType\":4,\"id\":6,\"issueBeginTime\":\"2023-11-09 00:00:00\",\"issueEndTime\":\"2023-11-11 00:00:00\",\"name\":\"支付抵扣券\",\"obtainWay\":1,\"termBeginTime\":\"2023-11-10 00:00:00\",\"termDays\":7,\"termEndTime\":\"2023-11-11 00:00:00\",\"thresholdAmount\":0,\"totalNum\":10,\"type\":1,\"updater\":1,\"userLimit\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 17:54:14', 62);
INSERT INTO `sys_oper_log` VALUES (235, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.beginIssue()', 'PUT', 1, 'admin', NULL, '/wx/coupon/6/issue', '127.0.0.1', '内网IP', '6', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 17:54:50', 155);
INSERT INTO `sys_oper_log` VALUES (236, '优惠券', 1, 'com.ruoyi.web.controller.wx.WxCouponController.add()', 'POST', 1, 'admin', NULL, '/wx/coupon', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-11-10 17:58:12\",\"creater\":1,\"discountType\":4,\"id\":7,\"issueBeginTime\":\"2023-11-09 00:00:00\",\"issueEndTime\":\"2023-11-11 04:00:04\",\"name\":\"支付使用券\",\"obtainWay\":1,\"termBeginTime\":\"2023-11-09 00:00:00\",\"termDays\":2,\"termEndTime\":\"2023-11-11 00:00:00\",\"thresholdAmount\":0,\"totalNum\":10,\"type\":1,\"updater\":1,\"userLimit\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 17:58:12', 12);
INSERT INTO `sys_oper_log` VALUES (237, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.beginIssue()', 'PUT', 1, 'admin', NULL, '/wx/coupon/7/issue', '127.0.0.1', '内网IP', '7', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 17:58:44', 75);
INSERT INTO `sys_oper_log` VALUES (238, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.edit()', 'PUT', 1, 'admin', NULL, '/wx/coupon', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-11-10 17:54:15\",\"creater\":1,\"discountType\":4,\"id\":6,\"issueBeginTime\":\"2023-11-10 17:54:50\",\"issueEndTime\":\"2023-11-13 00:00:00\",\"issueNum\":1,\"name\":\"支付抵扣券\",\"obtainWay\":1,\"status\":4,\"termBeginTime\":\"2023-11-10 00:00:00\",\"termDays\":7,\"termEndTime\":\"2023-11-11 00:00:00\",\"thresholdAmount\":0,\"totalNum\":10,\"type\":1,\"updateTime\":\"2023-11-12 14:43:59\",\"updater\":1,\"usedNum\":0,\"userLimit\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-12 14:43:59', 36);
INSERT INTO `sys_oper_log` VALUES (239, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.edit()', 'PUT', 1, 'admin', NULL, '/wx/coupon', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-11-10 17:54:15\",\"creater\":1,\"discountType\":4,\"id\":6,\"issueBeginTime\":\"2023-11-10 17:54:50\",\"issueEndTime\":\"2023-11-13 00:00:00\",\"issueNum\":1,\"name\":\"支付抵扣券\",\"obtainWay\":1,\"status\":4,\"termBeginTime\":\"2023-11-12 00:00:00\",\"termDays\":7,\"termEndTime\":\"2023-11-13 00:00:00\",\"thresholdAmount\":0,\"totalNum\":10,\"type\":1,\"updateTime\":\"2023-11-12 14:44:25\",\"updater\":1,\"usedNum\":0,\"userLimit\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-12 14:44:25', 9);
INSERT INTO `sys_oper_log` VALUES (240, '优惠券', 1, 'com.ruoyi.web.controller.wx.WxCouponController.add()', 'POST', 1, 'admin', NULL, '/wx/coupon', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-11-12 15:42:11\",\"creater\":1,\"discountType\":4,\"id\":8,\"issueBeginTime\":\"2023-11-12 00:00:00\",\"issueEndTime\":\"2023-11-14 00:00:00\",\"name\":\"支付券3\",\"obtainWay\":1,\"termBeginTime\":\"2023-11-12 15:42:03\",\"termDays\":7,\"termEndTime\":\"2023-11-15 00:00:00\",\"thresholdAmount\":0,\"totalNum\":10,\"type\":1,\"updater\":1,\"userLimit\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-12 15:42:11', 40);
INSERT INTO `sys_oper_log` VALUES (241, '优惠券历史', 1, 'com.ruoyi.web.controller.wx.WxUserCouponController.add()', 'POST', 1, 'admin', NULL, '/wx/usercoupon', '127.0.0.1', '内网IP', '{\"couponId\":8,\"createTime\":\"2023-11-12 15:42:38\",\"id\":1722916714942832643,\"termBeginTime\":\"2023-11-12 00:00:00\",\"termEndTime\":\"2023-11-15 00:00:00\",\"userId\":15}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-12 15:42:38', 44);
INSERT INTO `sys_oper_log` VALUES (242, '优惠券历史', 3, 'com.ruoyi.web.controller.wx.WxUserCouponController.remove()', 'DELETE', 1, 'admin', NULL, '/wx/usercoupon/1722916714942832600', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-11-12 15:42:51', 42);
INSERT INTO `sys_oper_log` VALUES (243, '优惠券历史', 3, 'com.ruoyi.web.controller.wx.WxUserCouponController.remove()', 'DELETE', 1, 'admin', NULL, '/wx/usercoupon/1722916714942832600', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-11-12 15:43:06', 30);
INSERT INTO `sys_oper_log` VALUES (244, '优惠券历史', 3, 'com.ruoyi.web.controller.wx.WxUserCouponController.remove()', 'DELETE', 1, 'admin', NULL, '/wx/usercoupon/1722916714942832600', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-11-12 15:43:16', 8);
INSERT INTO `sys_oper_log` VALUES (245, '优惠券历史', 3, 'com.ruoyi.web.controller.wx.WxUserCouponController.remove()', 'DELETE', 1, 'admin', NULL, '/wx/usercoupon/1722916714942832600', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-11-12 15:44:50', 43038);
INSERT INTO `sys_oper_log` VALUES (246, '优惠券历史', 3, 'com.ruoyi.web.controller.wx.WxUserCouponController.remove()', 'DELETE', 1, 'admin', NULL, '/wx/usercoupon/1722916714942832643', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-12 16:05:38', 43);
INSERT INTO `sys_oper_log` VALUES (247, '定时任务', 1, 'com.ruoyi.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '', '{\"msg\":\"新增任务\'定时删除个人优惠劵\'失败，Cron表达式不正确\",\"code\":500}', 0, NULL, '2023-11-12 16:14:19', 5);
INSERT INTO `sys_oper_log` VALUES (248, '定时任务', 1, 'com.ruoyi.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"cronExpression\":\"0 0 0 ? * MON\",\"invokeTarget\":\"userCouponTask.delExpireCoupons()\",\"jobGroup\":\"DEFAULT\",\"jobName\":\"定时删除个人优惠劵\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2023-11-13 00:00:00\",\"params\":{},\"status\":\"0\"}', NULL, 1, 'No bean named \'userCouponTask\' available', '2023-11-12 16:17:13', 2);
INSERT INTO `sys_oper_log` VALUES (249, '定时任务', 1, 'com.ruoyi.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"cronExpression\":\"0 0 0 ? * MON\",\"invokeTarget\":\"userCouponTask.delExpireCoupons()\",\"jobGroup\":\"DEFAULT\",\"jobId\":101,\"jobName\":\"定时删除个人优惠劵\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2023-11-13 00:00:00\",\"params\":{},\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-12 16:18:47', 54);
INSERT INTO `sys_oper_log` VALUES (250, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":101,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-12 16:18:57', 13);
INSERT INTO `sys_oper_log` VALUES (251, '定时任务', 1, 'com.ruoyi.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"cronExpression\":\"0 0 0 ? * MON\",\"invokeTarget\":\"couponTask.checkCouponExpire()\",\"jobGroup\":\"DEFAULT\",\"jobId\":102,\"jobName\":\"定时删除优惠劵活动\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2023-11-13 00:00:00\",\"params\":{},\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-12 16:28:21', 38);
INSERT INTO `sys_oper_log` VALUES (252, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-10-29 20:56:20\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"专家\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-12 20:30:49', 68);
INSERT INTO `sys_oper_log` VALUES (253, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"采土检测机构\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-12 20:32:20', 36);
INSERT INTO `sys_oper_log` VALUES (254, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tfs_order,tfs_checkup,tfs_recipe,tfs_checkup_indicator\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-13 09:49:43', 212);
INSERT INTO `sys_oper_log` VALUES (255, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.beginIssue()', 'PUT', 1, 'admin', NULL, '/wx/coupon/8/issue', '127.0.0.1', '内网IP', '8', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-13 11:10:39', 80);
INSERT INTO `sys_oper_log` VALUES (256, '优惠券', 1, 'com.ruoyi.web.controller.wx.WxCouponController.add()', 'POST', 1, 'admin', NULL, '/wx/coupon', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-11-14 08:50:12\",\"creater\":1,\"discountType\":4,\"id\":9,\"issueBeginTime\":\"2023-11-14 00:00:00\",\"issueEndTime\":\"2023-11-16 00:00:00\",\"name\":\"优惠券3\",\"obtainWay\":1,\"termBeginTime\":\"2023-11-14 00:00:00\",\"termDays\":7,\"termEndTime\":\"2023-11-17 00:00:00\",\"thresholdAmount\":0,\"totalNum\":10,\"type\":1,\"updater\":1,\"userLimit\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-14 08:50:12', 54);
INSERT INTO `sys_oper_log` VALUES (257, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.beginIssue()', 'PUT', 1, 'admin', NULL, '/wx/coupon/9/issue', '127.0.0.1', '内网IP', '9', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-14 08:50:51', 50);
INSERT INTO `sys_oper_log` VALUES (258, '优惠券', 1, 'com.ruoyi.web.controller.wx.WxCouponController.add()', 'POST', 1, 'admin', NULL, '/wx/coupon', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-11-14 11:50:31\",\"creater\":1,\"discountType\":4,\"id\":10,\"issueBeginTime\":\"2023-11-14 11:50:05\",\"issueEndTime\":\"2023-11-17 00:00:00\",\"name\":\"支付抵扣券4\",\"obtainWay\":1,\"termBeginTime\":\"2023-11-14 00:00:00\",\"termDays\":3,\"termEndTime\":\"2023-11-17 00:00:00\",\"thresholdAmount\":0,\"totalNum\":10,\"type\":1,\"updater\":1,\"userLimit\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-14 11:50:31', 53);
INSERT INTO `sys_oper_log` VALUES (259, '优惠券', 1, 'com.ruoyi.web.controller.wx.WxCouponController.add()', 'POST', 1, 'admin', NULL, '/wx/coupon', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-11-14 11:51:06\",\"creater\":1,\"discountType\":4,\"id\":11,\"issueBeginTime\":\"2023-11-14 00:00:00\",\"issueEndTime\":\"2023-11-17 00:00:00\",\"name\":\"支付券5\",\"obtainWay\":1,\"termBeginTime\":\"2023-11-14 00:00:00\",\"termDays\":4,\"termEndTime\":\"2023-11-18 00:00:00\",\"thresholdAmount\":0,\"totalNum\":10,\"type\":1,\"updater\":1,\"userLimit\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-14 11:51:06', 7);
INSERT INTO `sys_oper_log` VALUES (260, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.beginIssue()', 'PUT', 1, 'admin', NULL, '/wx/coupon/10/issue', '127.0.0.1', '内网IP', '10', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-14 11:51:08', 53);
INSERT INTO `sys_oper_log` VALUES (261, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.beginIssue()', 'PUT', 1, 'admin', NULL, '/wx/coupon/11/issue', '127.0.0.1', '内网IP', '11', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-14 11:51:12', 30);
INSERT INTO `sys_oper_log` VALUES (262, '优惠券', 1, 'com.ruoyi.web.controller.wx.WxCouponController.add()', 'POST', 1, 'admin', NULL, '/wx/coupon', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-11-14 12:03:08\",\"creater\":1,\"discountType\":4,\"id\":12,\"issueBeginTime\":\"2023-11-14 00:00:00\",\"issueEndTime\":\"2023-11-17 00:00:00\",\"name\":\"支付抵扣券7\",\"obtainWay\":1,\"termBeginTime\":\"2023-11-14 00:00:00\",\"termDays\":4,\"termEndTime\":\"2023-11-18 00:00:00\",\"thresholdAmount\":0,\"totalNum\":10,\"type\":1,\"updater\":1,\"userLimit\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-14 12:03:08', 48);
INSERT INTO `sys_oper_log` VALUES (263, '优惠券', 2, 'com.ruoyi.web.controller.wx.WxCouponController.beginIssue()', 'PUT', 1, 'admin', NULL, '/wx/coupon/12/issue', '127.0.0.1', '内网IP', '12', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-14 12:03:13', 101);
INSERT INTO `sys_oper_log` VALUES (264, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"待采土\",\"dictSort\":0,\"dictType\":\"tfs_order_status\",\"dictValue\":\"6\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-14 13:45:38', 23);
INSERT INTO `sys_oper_log` VALUES (265, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-14 13:45:38\",\"default\":false,\"dictCode\":118,\"dictLabel\":\"待采土\",\"dictSort\":0,\"dictType\":\"tfs_order_status\",\"dictValue\":\"6\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-14 13:45:51', 22);
INSERT INTO `sys_oper_log` VALUES (266, '订单管理', 2, 'com.ruoyi.web.controller.tfs.TfsOrderController.updateOrderStatus()', 'PUT', 1, 'admin', NULL, '/tfs/order/updateStatus', '127.0.0.1', '内网IP', '{\"orderId\":\"24\",\"status\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-14 14:37:08', 32);
INSERT INTO `sys_oper_log` VALUES (267, '订单管理', 2, 'com.ruoyi.web.controller.tfs.TfsOrderController.updateOrderStatus()', 'PUT', 1, 'admin', NULL, '/tfs/order/updateStatus', '127.0.0.1', '内网IP', '{\"orderId\":\"27\",\"status\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-14 15:26:38', 35);
INSERT INTO `sys_oper_log` VALUES (268, '订单管理', 2, 'com.ruoyi.web.controller.tfs.TfsOrderController.updateOrderStatus()', 'PUT', 1, 'admin', NULL, '/tfs/order/updateStatus', '127.0.0.1', '内网IP', '{\"orderId\":\"27\",\"status\":\"3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-14 15:45:11', 73);
INSERT INTO `sys_oper_log` VALUES (269, '提交检测单', 1, 'com.ruoyi.web.controller.tfs.TfsCheckupController.add()', 'POST', 1, 'admin', NULL, '/tfs/checkup', '127.0.0.1', '内网IP', '{\"checkupIndicatorId\":5,\"checkupIndicatorName\":\"有效磷\",\"checkupValue\":12,\"orderId\":27,\"params\":{},\"unit\":\"mg/kg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-14 15:45:11', 59);
INSERT INTO `sys_oper_log` VALUES (270, '提交检测单', 1, 'com.ruoyi.web.controller.tfs.TfsCheckupController.add()', 'POST', 1, 'admin', NULL, '/tfs/checkup', '127.0.0.1', '内网IP', '{\"checkupIndicatorId\":3,\"checkupIndicatorName\":\"有机质\",\"checkupValue\":12,\"orderId\":27,\"params\":{},\"unit\":\"g/kg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-14 15:45:11', 59);
INSERT INTO `sys_oper_log` VALUES (271, '提交检测单', 1, 'com.ruoyi.web.controller.tfs.TfsCheckupController.add()', 'POST', 1, 'admin', NULL, '/tfs/checkup', '127.0.0.1', '内网IP', '{\"checkupIndicatorId\":10,\"checkupIndicatorName\":\"测试\",\"checkupValue\":12,\"orderId\":27,\"params\":{},\"unit\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-14 15:45:11', 59);
INSERT INTO `sys_oper_log` VALUES (272, '提交检测单', 1, 'com.ruoyi.web.controller.tfs.TfsCheckupController.add()', 'POST', 1, 'admin', NULL, '/tfs/checkup', '127.0.0.1', '内网IP', '{\"checkupIndicatorId\":2,\"checkupIndicatorName\":\"pH\",\"checkupValue\":2,\"orderId\":27,\"params\":{},\"unit\":\"无\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-14 15:45:11', 59);
INSERT INTO `sys_oper_log` VALUES (273, '提交检测单', 1, 'com.ruoyi.web.controller.tfs.TfsCheckupController.add()', 'POST', 1, 'admin', NULL, '/tfs/checkup', '127.0.0.1', '内网IP', '{\"checkupIndicatorId\":4,\"checkupIndicatorName\":\"全氮\",\"checkupValue\":12,\"orderId\":27,\"params\":{},\"unit\":\"g/kg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-14 15:45:11', 59);
INSERT INTO `sys_oper_log` VALUES (274, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查看订单详情\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2054,\"perms\":\"tfs:recipe:order\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-14 16:24:11', 75);
INSERT INTO `sys_oper_log` VALUES (275, '专家配方', 1, 'com.ruoyi.web.controller.tfs.TfsRecipeController.add()', 'POST', 1, 'admin', NULL, '/tfs/recipe', '127.0.0.1', '内网IP', '{\"fertilizationAdvice\":\"11111\",\"orderId\":27,\"params\":{},\"plantingAdvice\":\"可以\",\"summary\":\"ok\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'planting_advice\' in \'field list\'\r\n### The error may exist in file [D:\\ruoyi\\RuoYi-Vue\\ruoyi-wx\\target\\classes\\mapper\\tfs\\TfsRecipeMapper.xml]\r\n### The error may involve com.ruoyi.wx.mapper.TfsRecipeMapper.insertTfsRecipe-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tfs_recipe          ( order_id,             fertilization_advice,             planting_advice,             summary )           values ( ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'planting_advice\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'planting_advice\' in \'field list\'', '2023-11-14 16:44:22', 145);
INSERT INTO `sys_oper_log` VALUES (276, '专家配方', 1, 'com.ruoyi.web.controller.tfs.TfsRecipeController.add()', 'POST', 1, 'admin', NULL, '/tfs/recipe', '127.0.0.1', '内网IP', '{\"fertilizationAdvice\":\"34\",\"orderId\":27,\"params\":{},\"plantingAdvice\":\"141\",\"summary\":\"141\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-14 16:48:03', 56);
INSERT INTO `sys_oper_log` VALUES (277, '订单管理', 2, 'com.ruoyi.web.controller.tfs.TfsOrderController.updateOrderStatus()', 'PUT', 1, 'admin', NULL, '/tfs/order/updateStatus', '127.0.0.1', '内网IP', '{\"orderId\":\"27\",\"status\":\"4\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-14 16:48:04', 58);
INSERT INTO `sys_oper_log` VALUES (278, '订单管理', 2, 'com.ruoyi.web.controller.tfs.TfsOrderController.updateOrderStatus()', 'PUT', 1, 'admin', NULL, '/tfs/order/updateStatus', '127.0.0.1', '内网IP', '{\"orderId\":\"29\",\"status\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-14 17:06:52', 25);
INSERT INTO `sys_oper_log` VALUES (279, '提交检测单', 1, 'com.ruoyi.web.controller.tfs.TfsCheckupController.add()', 'POST', 1, 'admin', NULL, '/tfs/checkup', '127.0.0.1', '内网IP', '{\"checkupIndicatorId\":2,\"checkupIndicatorName\":\"pH\",\"checkupValue\":2,\"orderId\":29,\"params\":{},\"unit\":\"无\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-14 17:08:09', 56);
INSERT INTO `sys_oper_log` VALUES (280, '提交检测单', 1, 'com.ruoyi.web.controller.tfs.TfsCheckupController.add()', 'POST', 1, 'admin', NULL, '/tfs/checkup', '127.0.0.1', '内网IP', '{\"checkupIndicatorId\":5,\"checkupIndicatorName\":\"有效磷\",\"checkupValue\":2,\"orderId\":29,\"params\":{},\"unit\":\"mg/kg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-14 17:08:10', 20);
INSERT INTO `sys_oper_log` VALUES (281, '提交检测单', 1, 'com.ruoyi.web.controller.tfs.TfsCheckupController.add()', 'POST', 1, 'admin', NULL, '/tfs/checkup', '127.0.0.1', '内网IP', '{\"checkupIndicatorId\":10,\"checkupIndicatorName\":\"测试\",\"checkupValue\":23,\"orderId\":29,\"params\":{},\"unit\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-14 17:08:10', 21);
INSERT INTO `sys_oper_log` VALUES (282, '提交检测单', 1, 'com.ruoyi.web.controller.tfs.TfsCheckupController.add()', 'POST', 1, 'admin', NULL, '/tfs/checkup', '127.0.0.1', '内网IP', '{\"checkupIndicatorId\":3,\"checkupIndicatorName\":\"有机质\",\"checkupValue\":232,\"orderId\":29,\"params\":{},\"unit\":\"g/kg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-14 17:08:10', 35);
INSERT INTO `sys_oper_log` VALUES (283, '订单管理', 2, 'com.ruoyi.web.controller.tfs.TfsOrderController.updateOrderStatus()', 'PUT', 1, 'admin', NULL, '/tfs/order/updateStatus', '127.0.0.1', '内网IP', '{\"orderId\":\"29\",\"status\":\"3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-14 17:08:10', 53);
INSERT INTO `sys_oper_log` VALUES (284, '提交检测单', 1, 'com.ruoyi.web.controller.tfs.TfsCheckupController.add()', 'POST', 1, 'admin', NULL, '/tfs/checkup', '127.0.0.1', '内网IP', '{\"checkupIndicatorId\":4,\"checkupIndicatorName\":\"全氮\",\"checkupValue\":232,\"orderId\":29,\"params\":{},\"unit\":\"g/kg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-14 17:08:10', 39);
INSERT INTO `sys_oper_log` VALUES (285, '订单管理', 2, 'com.ruoyi.web.controller.tfs.TfsOrderController.updateOrderStatus()', 'PUT', 1, 'admin', NULL, '/tfs/order/updateStatus', '127.0.0.1', '内网IP', '{\"orderId\":\"36\",\"status\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-15 09:46:15', 50);
INSERT INTO `sys_oper_log` VALUES (286, '订单管理', 2, 'com.ruoyi.web.controller.tfs.TfsOrderController.updateOrderStatus()', 'PUT', 1, 'admin', NULL, '/tfs/order/updateStatus', '127.0.0.1', '内网IP', '{\"orderId\":\"36\",\"status\":\"3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-15 09:46:23', 33);
INSERT INTO `sys_oper_log` VALUES (287, '提交检测单', 1, 'com.ruoyi.web.controller.tfs.TfsCheckupController.add()', 'POST', 1, 'admin', NULL, '/tfs/checkup', '127.0.0.1', '内网IP', '{\"checkupIndicatorId\":4,\"checkupIndicatorName\":\"全氮\",\"checkupValue\":12,\"orderId\":36,\"params\":{},\"unit\":\"g/kg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-15 09:46:23', 58);
INSERT INTO `sys_oper_log` VALUES (288, '提交检测单', 1, 'com.ruoyi.web.controller.tfs.TfsCheckupController.add()', 'POST', 1, 'admin', NULL, '/tfs/checkup', '127.0.0.1', '内网IP', '{\"checkupIndicatorId\":2,\"checkupIndicatorName\":\"pH\",\"checkupValue\":3,\"orderId\":36,\"params\":{},\"unit\":\"无\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-15 09:46:23', 67);
INSERT INTO `sys_oper_log` VALUES (289, '提交检测单', 1, 'com.ruoyi.web.controller.tfs.TfsCheckupController.add()', 'POST', 1, 'admin', NULL, '/tfs/checkup', '127.0.0.1', '内网IP', '{\"checkupIndicatorId\":3,\"checkupIndicatorName\":\"有机质\",\"checkupValue\":12,\"orderId\":36,\"params\":{},\"unit\":\"g/kg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-15 09:46:23', 65);
INSERT INTO `sys_oper_log` VALUES (290, '提交检测单', 1, 'com.ruoyi.web.controller.tfs.TfsCheckupController.add()', 'POST', 1, 'admin', NULL, '/tfs/checkup', '127.0.0.1', '内网IP', '{\"checkupIndicatorId\":5,\"checkupIndicatorName\":\"有效磷\",\"checkupValue\":3,\"orderId\":36,\"params\":{},\"unit\":\"mg/kg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-15 09:46:23', 65);
INSERT INTO `sys_oper_log` VALUES (291, '提交检测单', 1, 'com.ruoyi.web.controller.tfs.TfsCheckupController.add()', 'POST', 1, 'admin', NULL, '/tfs/checkup', '127.0.0.1', '内网IP', '{\"checkupIndicatorId\":10,\"checkupIndicatorName\":\"测试\",\"checkupValue\":3,\"orderId\":36,\"params\":{},\"unit\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-15 09:46:23', 64);
INSERT INTO `sys_oper_log` VALUES (292, '订单管理', 2, 'com.ruoyi.web.controller.tfs.TfsOrderController.updateOrderStatus()', 'PUT', 1, 'admin', NULL, '/tfs/order/updateStatus', '127.0.0.1', '内网IP', '{\"orderId\":\"37\",\"status\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-15 10:32:43', 26);
INSERT INTO `sys_oper_log` VALUES (293, '订单管理', 2, 'com.ruoyi.web.controller.tfs.TfsOrderController.updateOrderStatus()', 'PUT', 1, 'admin', NULL, '/tfs/order/updateStatus', '127.0.0.1', '内网IP', '{\"orderId\":\"37\",\"status\":\"3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-15 10:33:01', 24);
INSERT INTO `sys_oper_log` VALUES (294, '提交检测单', 1, 'com.ruoyi.web.controller.tfs.TfsCheckupController.add()', 'POST', 1, 'admin', NULL, '/tfs/checkup', '127.0.0.1', '内网IP', '{\"checkupIndicatorId\":10,\"checkupIndicatorName\":\"测试\",\"checkupValue\":1,\"orderId\":37,\"params\":{},\"unit\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-15 10:33:01', 33);
INSERT INTO `sys_oper_log` VALUES (295, '提交检测单', 1, 'com.ruoyi.web.controller.tfs.TfsCheckupController.add()', 'POST', 1, 'admin', NULL, '/tfs/checkup', '127.0.0.1', '内网IP', '{\"checkupIndicatorId\":3,\"checkupIndicatorName\":\"有机质\",\"checkupValue\":12,\"orderId\":37,\"params\":{},\"unit\":\"g/kg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-15 10:33:01', 33);
INSERT INTO `sys_oper_log` VALUES (296, '提交检测单', 1, 'com.ruoyi.web.controller.tfs.TfsCheckupController.add()', 'POST', 1, 'admin', NULL, '/tfs/checkup', '127.0.0.1', '内网IP', '{\"checkupIndicatorId\":5,\"checkupIndicatorName\":\"有效磷\",\"checkupValue\":11,\"orderId\":37,\"params\":{},\"unit\":\"mg/kg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-15 10:33:01', 33);
INSERT INTO `sys_oper_log` VALUES (297, '提交检测单', 1, 'com.ruoyi.web.controller.tfs.TfsCheckupController.add()', 'POST', 1, 'admin', NULL, '/tfs/checkup', '127.0.0.1', '内网IP', '{\"checkupIndicatorId\":2,\"checkupIndicatorName\":\"pH\",\"checkupValue\":12,\"orderId\":37,\"params\":{},\"unit\":\"无\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-15 10:33:01', 33);
INSERT INTO `sys_oper_log` VALUES (298, '提交检测单', 1, 'com.ruoyi.web.controller.tfs.TfsCheckupController.add()', 'POST', 1, 'admin', NULL, '/tfs/checkup', '127.0.0.1', '内网IP', '{\"checkupIndicatorId\":4,\"checkupIndicatorName\":\"全氮\",\"checkupValue\":11,\"orderId\":37,\"params\":{},\"unit\":\"g/kg\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-15 10:33:01', 33);
INSERT INTO `sys_oper_log` VALUES (299, '专家配方', 1, 'com.ruoyi.web.controller.tfs.TfsRecipeController.add()', 'POST', 1, 'admin', NULL, '/tfs/recipe', '127.0.0.1', '内网IP', '{\"fertilizationAdvice\":\"安抚付款哈发回来的看法和立法\",\"orderId\":37,\"params\":{},\"plantingAdvice\":\"啊方法i适当放宽拉法基\",\"summary\":\"发达的省份发\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-15 10:33:42', 18);
INSERT INTO `sys_oper_log` VALUES (300, '订单管理', 2, 'com.ruoyi.web.controller.tfs.TfsOrderController.updateOrderStatus()', 'PUT', 1, 'admin', NULL, '/tfs/order/updateStatus', '127.0.0.1', '内网IP', '{\"orderId\":\"37\",\"status\":\"4\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-15 10:33:43', 21);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(0) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-10-29 20:56:20', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-10-29 20:56:20', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(0) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-10-29 20:56:20', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '专家', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-10-29 20:56:20', 'admin', '2023-11-12 20:30:49', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(0) NOT NULL COMMENT '部门ID',
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
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
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
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
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
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
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
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-11-15 08:42:48', 'admin', '2023-10-29 20:56:20', '', '2023-11-15 08:42:48', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-11-10 16:57:46', 'admin', '2023-10-29 20:56:20', 'admin', '2023-11-10 16:57:46', '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
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
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for tfs_checkup
-- ----------------------------
DROP TABLE IF EXISTS `tfs_checkup`;
CREATE TABLE `tfs_checkup`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(0) NULL DEFAULT NULL,
  `submission_time` datetime(0) NULL DEFAULT NULL,
  `checkup_indicator_id` bigint(0) NULL DEFAULT NULL,
  `checkup_indicator_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `checkup_value` decimal(5, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  CONSTRAINT `tfs_checkup_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tfs_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tfs_checkup
-- ----------------------------
INSERT INTO `tfs_checkup` VALUES (36, 27, '2023-11-14 15:45:11', 2, 'pH', '无', 2.00);
INSERT INTO `tfs_checkup` VALUES (37, 27, '2023-11-14 15:45:11', 3, '有机质', 'g/kg', 12.00);
INSERT INTO `tfs_checkup` VALUES (38, 27, '2023-11-14 15:45:11', 4, '全氮', 'g/kg', 12.00);
INSERT INTO `tfs_checkup` VALUES (39, 27, '2023-11-14 15:45:11', 10, '测试', '测试', 12.00);
INSERT INTO `tfs_checkup` VALUES (40, 27, '2023-11-14 15:45:11', 5, '有效磷', 'mg/kg', 12.00);
INSERT INTO `tfs_checkup` VALUES (41, 29, '2023-11-14 17:08:09', 2, 'pH', '无', 2.00);
INSERT INTO `tfs_checkup` VALUES (42, 29, '2023-11-14 17:08:09', 5, '有效磷', 'mg/kg', 2.00);
INSERT INTO `tfs_checkup` VALUES (43, 29, '2023-11-14 17:08:09', 10, '测试', '测试', 23.00);
INSERT INTO `tfs_checkup` VALUES (44, 29, '2023-11-14 17:08:10', 3, '有机质', 'g/kg', 232.00);
INSERT INTO `tfs_checkup` VALUES (45, 29, '2023-11-14 17:08:10', 4, '全氮', 'g/kg', 232.00);
INSERT INTO `tfs_checkup` VALUES (46, 36, '2023-11-15 09:46:23', 4, '全氮', 'g/kg', 12.00);
INSERT INTO `tfs_checkup` VALUES (47, 36, '2023-11-15 09:46:23', 10, '测试', '测试', 3.00);
INSERT INTO `tfs_checkup` VALUES (48, 36, '2023-11-15 09:46:23', 3, '有机质', 'g/kg', 12.00);
INSERT INTO `tfs_checkup` VALUES (49, 36, '2023-11-15 09:46:23', 5, '有效磷', 'mg/kg', 3.00);
INSERT INTO `tfs_checkup` VALUES (50, 36, '2023-11-15 09:46:23', 2, 'pH', '无', 3.00);
INSERT INTO `tfs_checkup` VALUES (51, 37, '2023-11-15 10:33:01', 10, '测试', '测试', 1.00);
INSERT INTO `tfs_checkup` VALUES (52, 37, '2023-11-15 10:33:01', 2, 'pH', '无', 12.00);
INSERT INTO `tfs_checkup` VALUES (53, 37, '2023-11-15 10:33:01', 5, '有效磷', 'mg/kg', 11.00);
INSERT INTO `tfs_checkup` VALUES (54, 37, '2023-11-15 10:33:01', 3, '有机质', 'g/kg', 12.00);
INSERT INTO `tfs_checkup` VALUES (55, 37, '2023-11-15 10:33:01', 4, '全氮', 'g/kg', 11.00);

-- ----------------------------
-- Table structure for tfs_checkup_indicator
-- ----------------------------
DROP TABLE IF EXISTS `tfs_checkup_indicator`;
CREATE TABLE `tfs_checkup_indicator`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `indicator_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `unit` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tfs_checkup_indicator
-- ----------------------------
INSERT INTO `tfs_checkup_indicator` VALUES (2, 'pH', '无', '2023-11-03 00:00:00', '2023-11-03 00:00:00', '1');
INSERT INTO `tfs_checkup_indicator` VALUES (3, '有机质', 'g/kg', '2023-11-03 11:58:49', '2023-11-03 11:58:49', '1');
INSERT INTO `tfs_checkup_indicator` VALUES (4, '全氮', 'g/kg', '2023-11-03 11:59:21', '2023-11-03 11:59:21', '1');
INSERT INTO `tfs_checkup_indicator` VALUES (5, '有效磷', 'mg/kg', '2023-11-03 12:00:10', '2023-11-03 12:00:10', '1');
INSERT INTO `tfs_checkup_indicator` VALUES (10, '测试', '测试', '2023-11-09 00:00:00', '2023-11-09 00:00:00', '1');

-- ----------------------------
-- Table structure for tfs_order
-- ----------------------------
DROP TABLE IF EXISTS `tfs_order`;
CREATE TABLE `tfs_order`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `wx_user_id` bigint(0) NOT NULL,
  `soil_number` bigint(0) NULL DEFAULT NULL,
  `order_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `order_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `user_coupon_id` bigint(0) NULL DEFAULT NULL,
  `farm_id` bigint(0) NOT NULL COMMENT '农场id',
  `soil_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '采土图片',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '详细地址',
  `latitude` double(255, 5) NULL DEFAULT NULL COMMENT '纬度',
  `longitude` double(255, 5) NULL DEFAULT NULL COMMENT '经度',
  `courier_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '快递号',
  `shipping_type` tinyint(0) NULL DEFAULT NULL COMMENT '配送方式',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `wx_user_id`(`wx_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tfs_order
-- ----------------------------
INSERT INTO `tfs_order` VALUES (22, 15, 202311140001, '2023-11-14 17:55:11', '5', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tfs_order` VALUES (23, 15, 202311140002, '2023-11-14 17:55:17', '5', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tfs_order` VALUES (24, 15, 202311140003, '2023-11-14 17:55:21', '2', 1723908273968517121, 2, '/profile/upload/2023/11/14/vcB3ev747UTj59f234dba28082ec88ce190c27cd9910_20231114113713A001.jpg', NULL, 21.26624, 110.36534, NULL, NULL);
INSERT INTO `tfs_order` VALUES (25, 15, 202311140004, '2023-11-14 17:55:25', '5', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tfs_order` VALUES (26, 15, 202311140005, '2023-11-14 17:55:29', '5', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tfs_order` VALUES (27, 15, 202311140006, '2023-11-14 17:55:37', '4', 1724228383044280322, 6, '/profile/upload/2023/11/14/Cvvh0jDzQLon1cf08e98fa885fb49a4eb4871234b974_20231114114125A002.jpg', NULL, 21.26624, 110.36534, '449297731209831', 0);
INSERT INTO `tfs_order` VALUES (28, 15, 202311140007, '2023-11-14 12:05:28', '1', 1724273856207765506, 2, '/profile/upload/2023/11/14/mR7WIUgSAW2I8bd22be7903f3f047b0589522cd613a9_20231114120527A002.jpg', NULL, 21.26624, 110.36534, NULL, NULL);
INSERT INTO `tfs_order` VALUES (29, 15, 202311140008, '2023-11-14 15:22:41', '3', 1724273859630317569, 2, '/profile/upload/2023/11/14/IgO6cEOSvz6z8bd22be7903f3f047b0589522cd613a9_20231114142118A001.jpg', NULL, 21.26624, 110.36534, '', 1);
INSERT INTO `tfs_order` VALUES (30, 15, 202311140009, '2023-11-14 14:53:14', '5', 1724276999444344834, 6, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tfs_order` VALUES (31, 15, 202311140010, '2023-11-14 17:57:24', '5', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tfs_order` VALUES (32, 15, 202311140011, '2023-11-14 17:58:03', '5', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tfs_order` VALUES (33, 15, 202311140012, '2023-11-14 17:58:56', '5', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tfs_order` VALUES (34, 15, 202311140013, '2023-11-14 17:59:22', '5', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tfs_order` VALUES (35, 15, 202311150001, '2023-11-15 09:51:36', '1', NULL, 2, '/profile/upload/2023/11/15/F3Jk226KORfc8bd22be7903f3f047b0589522cd613a9_20231115095131A002.jpg', '广东省湛江市麻章区麻章镇中共湛江市麻章区委员会湛江市麻章区人民政府', 21.26331, 110.33427, NULL, NULL);
INSERT INTO `tfs_order` VALUES (36, 15, 202311150002, '2023-11-15 09:45:32', '3', NULL, 2, '/profile/upload/2023/11/15/k9MWcXgKrpaA8bd22be7903f3f047b0589522cd613a9_20231115094510A001.jpg', '广东省湛江市麻章区麻章镇中共湛江市麻章区委员会湛江市麻章区人民政府', 21.26331, 110.33427, NULL, NULL);
INSERT INTO `tfs_order` VALUES (37, 17, 202311150003, '2023-11-15 10:30:15', '4', 1724611191412224001, 17, '/profile/upload/2023/11/15/H68Jtse55C5l59f234dba28082ec88ce190c27cd9910_20231115102932A002.jpg', '广东省湛江市麻章区麻章镇中共湛江市麻章区委员会湛江市麻章区人民政府', 21.26331, 110.33427, '338219377826542311', 0);
INSERT INTO `tfs_order` VALUES (38, 17, 202311150004, '2023-11-15 10:35:04', '5', 1724611196143398914, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tfs_order` VALUES (39, 17, 202311150005, '2023-11-15 10:36:17', '1', 1724611196143398914, 17, '/profile/upload/2023/11/15/DvbL7CIYmRcq1cf08e98fa885fb49a4eb4871234b974_20231115103611A003.jpg', '广东省湛江市麻章区麻章镇中共湛江市麻章区委员会湛江市麻章区人民政府', 21.26331, 110.33427, '', 1);
INSERT INTO `tfs_order` VALUES (40, 17, 202311150006, '2023-11-15 10:48:51', '5', NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tfs_order` VALUES (41, 17, 202311150007, '2023-11-15 10:48:52', '5', NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tfs_order` VALUES (42, 17, 202311150008, '2023-11-15 10:48:54', '5', NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tfs_order` VALUES (43, 17, 202311150009, '2023-11-15 10:49:07', '5', NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tfs_order` VALUES (44, 17, 202311150010, '2023-11-15 10:46:34', '5', 1724619247436980225, 17, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tfs_order` VALUES (45, 17, 202311150011, '2023-11-15 10:46:40', '5', NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tfs_recipe
-- ----------------------------
DROP TABLE IF EXISTS `tfs_recipe`;
CREATE TABLE `tfs_recipe`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `fertilization_advice` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `planting_advice` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `order_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  CONSTRAINT `tfs_recipe_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tfs_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tfs_recipe
-- ----------------------------
INSERT INTO `tfs_recipe` VALUES (1, '2023-11-14 17:12:16', '2023-11-14 17:12:16', '在发发阿根据功能结构你见过哪家姑娘九年f', '稻谷、小麦、玉米、大米、谷子、黍子、高粱、送达、送达、送达、送达等', '稻谷、小麦、玉米、大米、谷子、黍子、高粱、送达、送达、送达、送达等', 27);
INSERT INTO `tfs_recipe` VALUES (2, '2023-11-15 11:22:28', '2023-11-15 11:22:29', '安抚付款哈发回来的看法和立法', '啊方法i适当放宽拉法基', '发达的省份发', 37);

-- ----------------------------
-- Table structure for wx_coupon
-- ----------------------------
DROP TABLE IF EXISTS `wx_coupon`;
CREATE TABLE `wx_coupon`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '优惠券id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '优惠券名称，可以和活动名称保持一致',
  `type` tinyint(0) NOT NULL DEFAULT 1 COMMENT '优惠券类型，1：普通券。目前就一种，保留字段',
  `discount_type` tinyint(0) NOT NULL DEFAULT 4 COMMENT '折扣类型，1：满减，2：每满减，3：折扣，4：无门槛',
  `threshold_amount` int(0) NOT NULL DEFAULT 0 COMMENT '使用门槛，0：表示无门槛，其他值：最低消费金额',
  `obtain_way` tinyint(0) NOT NULL DEFAULT 0 COMMENT '获取方式：1：手动领取，2：兑换码',
  `issue_begin_time` datetime(0) NULL DEFAULT NULL COMMENT '开始发放时间',
  `issue_end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束发放时间',
  `term_days` int(0) NOT NULL DEFAULT 0 COMMENT '优惠券有效期天数，0：表示有效期是指定有效期的',
  `term_begin_time` datetime(0) NULL DEFAULT NULL COMMENT '优惠券有效期开始时间',
  `term_end_time` datetime(0) NULL DEFAULT NULL COMMENT '优惠券有效期结束时间',
  `status` tinyint(0) NULL DEFAULT 1 COMMENT '优惠券配置状态，1：待发放，2：未开始   3：进行中，4：已结束，5：暂停',
  `total_num` int(0) NOT NULL DEFAULT 0 COMMENT '总数量，不超过5000',
  `issue_num` int(0) NOT NULL DEFAULT 0 COMMENT '已发行数量，用于判断是否超发',
  `used_num` int(0) NOT NULL DEFAULT 0 COMMENT '已使用数量',
  `user_limit` int(0) NOT NULL DEFAULT 1 COMMENT '每个人限领的数量，默认1',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `creater` bigint(0) NOT NULL COMMENT '创建人',
  `updater` bigint(0) NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '优惠券的规则信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wx_coupon
-- ----------------------------
INSERT INTO `wx_coupon` VALUES (2, '支付抵扣券', 1, 4, 0, 1, NULL, NULL, 7, '2023-11-07 10:02:35', '2023-11-08 10:02:58', 1, 30, 0, 0, 1, '2023-11-07 14:40:03', '2023-11-10 10:14:47', 1, 1);
INSERT INTO `wx_coupon` VALUES (6, '支付抵扣券', 1, 4, 0, 1, '2023-11-10 17:54:50', '2023-11-13 00:00:00', 7, '2023-11-12 00:00:00', '2023-11-13 00:00:00', 4, 10, 1, 0, 1, '2023-11-10 17:54:15', '2023-11-12 14:47:20', 1, 1);
INSERT INTO `wx_coupon` VALUES (7, '支付使用券', 1, 4, 0, 1, '2023-11-10 17:58:44', '2023-11-11 04:00:04', 2, '2023-11-09 00:00:00', '2023-11-11 00:00:00', 4, 10, 1, 0, 1, '2023-11-10 17:58:12', '2023-11-10 17:58:49', 1, 1);
INSERT INTO `wx_coupon` VALUES (8, '支付券3', 1, 4, 0, 1, '2023-11-13 11:10:39', '2023-11-14 00:00:00', 7, '2023-11-12 15:42:03', '2023-11-15 00:00:00', 4, 10, 2, 1, 1, '2023-11-12 15:42:12', '2023-11-14 10:50:52', 1, 1);
INSERT INTO `wx_coupon` VALUES (9, '优惠券3', 1, 4, 0, 1, '2023-11-14 08:50:51', '2023-11-16 00:00:00', 7, '2023-11-14 00:00:00', '2023-11-17 00:00:00', 3, 10, 2, 1, 1, '2023-11-14 08:50:12', '2023-11-15 10:49:28', 1, 1);
INSERT INTO `wx_coupon` VALUES (10, '支付抵扣券4', 1, 4, 0, 1, '2023-11-14 11:51:09', '2023-11-17 00:00:00', 3, '2023-11-14 00:00:00', '2023-11-17 00:00:00', 3, 10, 2, 2, 1, '2023-11-14 11:50:31', '2023-11-15 10:35:40', 1, 1);
INSERT INTO `wx_coupon` VALUES (11, '支付券5', 1, 4, 0, 1, '2023-11-14 11:51:12', '2023-11-17 00:00:00', 4, '2023-11-14 00:00:00', '2023-11-18 00:00:00', 3, 10, 1, 1, 1, '2023-11-14 11:51:06', '2023-11-14 12:04:24', 1, 1);
INSERT INTO `wx_coupon` VALUES (12, '支付抵扣券7', 1, 4, 0, 1, '2023-11-14 12:03:13', '2023-11-17 00:00:00', 4, '2023-11-14 00:00:00', '2023-11-18 00:00:00', 3, 10, 2, 1, 1, '2023-11-14 12:03:09', '2023-11-15 10:29:13', 1, 1);

-- ----------------------------
-- Table structure for wx_user
-- ----------------------------
DROP TABLE IF EXISTS `wx_user`;
CREATE TABLE `wx_user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `openid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信用户唯一标识',
  `nickname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信名称',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `sex` int(0) NULL DEFAULT NULL COMMENT '性别',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wx_user
-- ----------------------------
INSERT INTO `wx_user` VALUES (15, 'oECBU6iMOH0vYVF0gTu9qw7wFqWw', '加薪要秃头', NULL, NULL, 'http://192.168.43.229:8080/profile/upload/2023/11/13/BfbfPVq7yQzB9ffaad4c33059ad5925059297819d5d0_20231113090159A001.jpeg', '', '2023-11-02 17:10:40', '', '2023-11-15 09:45:01');
INSERT INTO `wx_user` VALUES (16, 'oECBU6kSZEzHdXowJnSFJbbJLg1Q', '58q0a06D0g0N6181', NULL, NULL, 'http://192.168.43.229:8080/profile/upload/2023/11/13/eoEAJDuTNsMV2f280931a1ce5f1d4b3029ff4e3dfa31_20231113163711A001.jpeg', '', '2023-11-13 16:37:06', '', '2023-11-13 16:45:08');
INSERT INTO `wx_user` VALUES (17, 'oECBU6tM9ONweGJvmNJQCM4fWd8E', '测试号123', NULL, NULL, 'http://192.168.43.229:8080/profile/upload/2023/11/15/1273CiRNekTZ9ca76728f23ec10559df8b4276aa8ae1_20231115102529A001.jpeg', '', '2023-11-15 10:11:21', '', '2023-11-15 10:39:57');

-- ----------------------------
-- Table structure for wx_user_coupon
-- ----------------------------
DROP TABLE IF EXISTS `wx_user_coupon`;
CREATE TABLE `wx_user_coupon`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(0) NOT NULL COMMENT '用户id',
  `coupon_id` bigint(0) NOT NULL COMMENT '优惠券id',
  `term_begin_time` datetime(0) NULL DEFAULT NULL COMMENT '有效期开始时间',
  `term_end_time` datetime(0) NOT NULL COMMENT '有效期结束时间',
  `used_time` datetime(0) NULL DEFAULT NULL COMMENT '使用时间（核销时间）',
  `status` tinyint(0) NOT NULL DEFAULT 1 COMMENT '优惠券状态，1：未使用，2：已使用，3：已失效',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_coupon`(`coupon_id`) USING BTREE,
  INDEX `idx_user_coupon`(`user_id`, `coupon_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1724611196143398915 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '优惠券领取历史记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wx_user_coupon
-- ----------------------------
INSERT INTO `wx_user_coupon` VALUES (4, 15, 2, '2023-11-06 10:02:35', '2023-11-08 10:02:58', NULL, 3, '2023-11-08 10:03:11', '2023-11-10 17:52:27', NULL);
INSERT INTO `wx_user_coupon` VALUES (1722915733425364994, 15, 6, '2023-11-12 00:00:00', '2023-11-13 00:00:00', NULL, 3, '2023-11-10 17:54:55', '2023-11-13 09:18:28', NULL);
INSERT INTO `wx_user_coupon` VALUES (1722916714942832642, 15, 7, '2023-11-09 00:00:00', '2023-11-11 00:00:00', NULL, 3, '2023-11-10 17:58:49', '2023-11-12 14:37:28', NULL);
INSERT INTO `wx_user_coupon` VALUES (1723908273968517121, 15, 8, '2023-11-12 15:42:03', '2023-11-15 00:00:00', NULL, 2, '2023-11-13 11:38:55', '2023-11-14 10:50:53', 24);
INSERT INTO `wx_user_coupon` VALUES (1723983366262407169, 16, 8, '2023-11-12 15:42:03', '2023-11-15 00:00:00', NULL, 3, '2023-11-13 16:37:19', '2023-11-15 08:55:29', NULL);
INSERT INTO `wx_user_coupon` VALUES (1724228383044280322, 15, 9, '2023-11-14 00:00:00', '2023-11-17 00:00:00', NULL, 2, '2023-11-14 08:50:55', '2023-11-14 09:52:52', 27);
INSERT INTO `wx_user_coupon` VALUES (1724273856207765506, 15, 11, '2023-11-14 00:00:00', '2023-11-18 00:00:00', NULL, 2, '2023-11-14 11:51:37', '2023-11-14 12:04:25', 28);
INSERT INTO `wx_user_coupon` VALUES (1724273859630317569, 15, 10, '2023-11-14 00:00:00', '2023-11-17 00:00:00', NULL, 2, '2023-11-14 11:51:38', '2023-11-14 14:05:10', 29);
INSERT INTO `wx_user_coupon` VALUES (1724276999444344834, 15, 12, '2023-11-14 00:00:00', '2023-11-18 00:00:00', NULL, 1, '2023-11-14 12:04:06', '2023-11-14 15:00:47', 30);
INSERT INTO `wx_user_coupon` VALUES (1724611191412224001, 17, 12, '2023-11-14 00:00:00', '2023-11-18 00:00:00', NULL, 2, '2023-11-15 10:12:04', '2023-11-15 10:29:13', 37);
INSERT INTO `wx_user_coupon` VALUES (1724611196143398914, 17, 10, '2023-11-14 00:00:00', '2023-11-17 00:00:00', NULL, 2, '2023-11-15 10:12:05', '2023-11-15 10:35:41', 39);
INSERT INTO `wx_user_coupon` VALUES (1724619247436980225, 17, 9, '2023-11-14 00:00:00', '2023-11-17 00:00:00', NULL, 1, '2023-11-15 10:44:05', '2023-11-15 10:49:28', 44);

-- ----------------------------
-- Table structure for wx_user_farm
-- ----------------------------
DROP TABLE IF EXISTS `wx_user_farm`;
CREATE TABLE `wx_user_farm`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(0) NOT NULL COMMENT '用户id',
  `consignee` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收件人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号',
  `province_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省级名称',
  `city_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '市级名称',
  `district_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区级名称',
  `detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '详细地址',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '默认地址 0否1是',
  `plant_category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '种植种类',
  `scale` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '种植规模',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `creater` bigint(0) NULL DEFAULT NULL COMMENT '创建人',
  `updater` bigint(0) NULL DEFAULT NULL COMMENT '更新人',
  `is_deleted` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除 0否1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户农场表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wx_user_farm
-- ----------------------------
INSERT INTO `wx_user_farm` VALUES (2, 15, '大白', '15666688811', '广东省', '湛江市', '麻章区', '海大路1号广东海洋大学', 0, '土豆', '120', '2023-11-09 08:40:23', '2023-11-14 15:54:56', 3, 3, 0);
INSERT INTO `wx_user_farm` VALUES (6, 15, '李嘉欣', '13827366530', '广东省', '佛山市', '禅城区', '快乐农场19号', 0, '香蕉', '90', '2023-11-13 15:36:15', '2023-11-15 09:57:28', NULL, NULL, 0);
INSERT INTO `wx_user_farm` VALUES (7, 16, '测试号1', '13811111111', '北京市', '北京市', '东城区', '开心农场11号', 0, '辣椒', '100', '2023-11-13 16:40:20', '2023-11-13 16:40:28', NULL, NULL, 0);
INSERT INTO `wx_user_farm` VALUES (9, 15, '小白', '12699872831', '广东省', '深圳市', '罗湖区', '罗湖农场101号', 0, '玉米', '110', '2023-11-14 16:00:28', '2023-11-15 09:54:38', NULL, NULL, 0);
INSERT INTO `wx_user_farm` VALUES (17, 17, '测试号123', '13727228333', '北京市', '北京市', '东城区', '农场001', 0, '辣椒', '90', '2023-11-15 10:25:56', '2023-11-15 10:26:41', NULL, NULL, 0);
INSERT INTO `wx_user_farm` VALUES (18, 17, '测试123', '12312312331', '北京市', '北京市', '东城区', '农场002', 0, '土豆', '100', '2023-11-15 10:28:52', '2023-11-15 10:34:33', NULL, NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;
