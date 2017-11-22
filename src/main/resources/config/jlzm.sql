/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50630
 Source Host           : localhost:3306
 Source Schema         : jlzm

 Target Server Type    : MySQL
 Target Server Version : 50630
 File Encoding         : 65001

 Date: 19/11/2017 21:34:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cd_master
-- ----------------------------
DROP TABLE IF EXISTS `cd_master`;
CREATE TABLE `cd_master` (
  `ID` bigint(20) NOT NULL,
  `CODE_NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `TYPE_EN` varchar(255) DEFAULT NULL,
  `CODE` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cd_master
-- ----------------------------
BEGIN;
INSERT INTO `cd_master` VALUES (1, '要', '勤怠チェック要否サイン', 'AttdncChkSgn', '1');
INSERT INTO `cd_master` VALUES (2, '否', '勤怠チェック要否サイン', 'AttdncChkSgn', '2');
INSERT INTO `cd_master` VALUES (3, '大学専科', '学歴', 'Diploma', '1');
INSERT INTO `cd_master` VALUES (4, '大学本科', '学歴', 'Diploma', '2');
INSERT INTO `cd_master` VALUES (5, '出勤日', '休日サイン', 'HldSgn', '0');
INSERT INTO `cd_master` VALUES (6, '休日', '休日サイン', 'HldSgn', '1');
INSERT INTO `cd_master` VALUES (7, '祝日', '休日サイン', 'HldSgn', '2');
INSERT INTO `cd_master` VALUES (8, '北京智明', '出張地CD', 'BusTripAreaCd', '1');
INSERT INTO `cd_master` VALUES (9, '成都智明', '出張地CD', 'BusTripAreaCd', '2');
INSERT INTO `cd_master` VALUES (10, '大連智明', '出張地CD', 'BusTripAreaCd', '3');
INSERT INTO `cd_master` VALUES (11, '上海智明', '出張地CD', 'BusTripAreaCd', '4');
INSERT INTO `cd_master` VALUES (12, '無錫智明', '出張地CD', 'BusTripAreaCd', '5');
INSERT INTO `cd_master` VALUES (13, '日本智明', '出張地CD', 'BusTripAreaCd', '6');
INSERT INTO `cd_master` VALUES (14, 'NRI', '出張地CD', 'BusTripAreaCd', '9');
INSERT INTO `cd_master` VALUES (15, '休暇', '有休消込区分', 'PidhldMixiKbn', '1');
INSERT INTO `cd_master` VALUES (16, '支給', '有休消込区分', 'PidhldMixiKbn', '2');
INSERT INTO `cd_master` VALUES (17, '初期化', '有休消込区分', 'PidhldMixiKbn', '9');
INSERT INTO `cd_master` VALUES (18, '休暇', '代休消込区分', 'CpsthldMixiDiv', '1');
INSERT INTO `cd_master` VALUES (19, '初期化', '代休消込区分', 'CpsthldMixiDiv', '9');
INSERT INTO `cd_master` VALUES (20, '有休', '休暇区分', 'HldDiv', '1');
INSERT INTO `cd_master` VALUES (21, '代休', '休暇区分', 'HldDiv', '2');
INSERT INTO `cd_master` VALUES (22, '病休', '休暇区分', 'HldDiv', '3');
INSERT INTO `cd_master` VALUES (23, '事休', '休暇区分', 'HldDiv', '4');
INSERT INTO `cd_master` VALUES (24, '婚休', '休暇区分', 'HldDiv', '5');
INSERT INTO `cd_master` VALUES (25, '産休', '休暇区分', 'HldDiv', '6');
INSERT INTO `cd_master` VALUES (26, '葬休', '休暇区分', 'HldDiv', '7');
INSERT INTO `cd_master` VALUES (28, '因公特批', '休暇区分', 'HldDiv', '8');
INSERT INTO `cd_master` VALUES (29, 'その他', '休暇区分', 'HldDiv', 'X');
INSERT INTO `cd_master` VALUES (30, '申請中', '残業ステータス', 'OvtmWkStatus', '1');
INSERT INTO `cd_master` VALUES (31, 'PJ許可済', '残業ステータス', 'OvtmWkStatus', '2');
INSERT INTO `cd_master` VALUES (32, '許可済', '残業ステータス', 'OvtmWkStatus', '3');
INSERT INTO `cd_master` VALUES (33, '実施済', '残業ステータス', 'OvtmWkStatus', '4');
INSERT INTO `cd_master` VALUES (34, 'PJ承認済', '残業ステータス', 'OvtmWkStatus', '5');
INSERT INTO `cd_master` VALUES (35, '承認済', '残業ステータス', 'OvtmWkStatus', '6');
INSERT INTO `cd_master` VALUES (36, '却下', '残業ステータス', 'OvtmWkStatus', '9');
INSERT INTO `cd_master` VALUES (37, '取消', '残業ステータス', 'OvtmWkStatus', '8');
INSERT INTO `cd_master` VALUES (38, '申請中', '休暇ステータス', 'HldStatus', '1');
INSERT INTO `cd_master` VALUES (39, 'PJ許可済', '休暇ステータス', 'HldStatus', '2');
INSERT INTO `cd_master` VALUES (40, '許可済', '休暇ステータス', 'HldStatus', '3');
INSERT INTO `cd_master` VALUES (41, '実施済', '休暇ステータス', 'HldStatus', '4');
INSERT INTO `cd_master` VALUES (42, 'PJ承認済', '休暇ステータス', 'HldStatus', '5');
INSERT INTO `cd_master` VALUES (43, '承認済', '休暇ステータス', 'HldStatus', '6');
INSERT INTO `cd_master` VALUES (44, '却下', '休暇ステータス', 'HldStatus', '9');
INSERT INTO `cd_master` VALUES (47, '通勤車遅れ', '勤怠修正理由コード', 'AttdncChgRsnCd', '2');
INSERT INTO `cd_master` VALUES (48, '機器故障', '勤怠修正理由コード', 'AttdncChgRsnCd', '3');
INSERT INTO `cd_master` VALUES (49, 'その他', '勤怠修正理由コード', 'AttdncChgRsnCd', 'X');
INSERT INTO `cd_master` VALUES (50, '出勤', '勤怠区分', 'AttdncDiv', '5');
INSERT INTO `cd_master` VALUES (51, '休暇', '勤怠区分', 'AttdncDiv', '2');
INSERT INTO `cd_master` VALUES (52, '出張', '勤怠区分', 'AttdncDiv', '4');
INSERT INTO `cd_master` VALUES (53, '無断欠勤', '勤怠区分', 'AttdncDiv', '1');
INSERT INTO `cd_master` VALUES (54, '08:30-09:00', '会議時間帯コード', 'MtTimeZoneCd', '1');
INSERT INTO `cd_master` VALUES (55, '09:00-09:30', '会議時間帯コード', 'MtTimeZoneCd', '2');
INSERT INTO `cd_master` VALUES (56, '09:30-10:00', '会議時間帯コード', 'MtTimeZoneCd', '3');
INSERT INTO `cd_master` VALUES (57, '10:00-10:30', '会議時間帯コード', 'MtTimeZoneCd', '4');
INSERT INTO `cd_master` VALUES (58, '10:30-11:00', '会議時間帯コード', 'MtTimeZoneCd', '5');
INSERT INTO `cd_master` VALUES (59, '11:00-11:30', '会議時間帯コード', 'MtTimeZoneCd', '6');
INSERT INTO `cd_master` VALUES (60, '12:30-13:00', '会議時間帯コード', 'MtTimeZoneCd', '7');
INSERT INTO `cd_master` VALUES (61, '13:00-13:30', '会議時間帯コード', 'MtTimeZoneCd', '8');
INSERT INTO `cd_master` VALUES (62, '13:30-14:00', '会議時間帯コード', 'MtTimeZoneCd', '9');
INSERT INTO `cd_master` VALUES (63, '14:00-14:30', '会議時間帯コード', 'MtTimeZoneCd', 'A');
INSERT INTO `cd_master` VALUES (64, '14:30-15:00', '会議時間帯コード', 'MtTimeZoneCd', 'B');
INSERT INTO `cd_master` VALUES (65, '15:00-15:30', '会議時間帯コード', 'MtTimeZoneCd', 'C');
INSERT INTO `cd_master` VALUES (66, '15:30-16:00', '会議時間帯コード', 'MtTimeZoneCd', 'D');
INSERT INTO `cd_master` VALUES (67, '16:00-16:30', '会議時間帯コード', 'MtTimeZoneCd', 'E');
INSERT INTO `cd_master` VALUES (68, '16:30-17:00', '会議時間帯コード', 'MtTimeZoneCd', 'F');
INSERT INTO `cd_master` VALUES (69, '17:00-17:30', '会議時間帯コード', 'MtTimeZoneCd', 'G');
INSERT INTO `cd_master` VALUES (70, 'SE', 'プロジェクト役割コード', 'PrjRoleCd', '2');
INSERT INTO `cd_master` VALUES (71, 'PM', 'プロジェクト役割コード', 'PrjRoleCd', '4');
INSERT INTO `cd_master` VALUES (72, 'PG', 'プロジェクト役割コード', 'PrjRoleCd', '1');
INSERT INTO `cd_master` VALUES (73, 'PL', 'プロジェクト役割コード', 'PrjRoleCd', '3');
INSERT INTO `cd_master` VALUES (74, 'Lv1', '権限コード', 'AuthCd', '1');
INSERT INTO `cd_master` VALUES (75, 'Lv2', '権限コード', 'AuthCd', '2');
INSERT INTO `cd_master` VALUES (76, 'Lv3', '権限コード', 'AuthCd', '3');
INSERT INTO `cd_master` VALUES (77, 'Lv4', '権限コード', 'AuthCd', '4');
INSERT INTO `cd_master` VALUES (78, 'Lv5', '権限コード', 'AuthCd', '5');
INSERT INTO `cd_master` VALUES (79, '月', '曜日コード', 'WeekCd', '1');
INSERT INTO `cd_master` VALUES (80, '火', '曜日コード', 'WeekCd', '2');
INSERT INTO `cd_master` VALUES (81, '水', '曜日コード', 'WeekCd', '3');
INSERT INTO `cd_master` VALUES (82, '木', '曜日コード', 'WeekCd', '4');
INSERT INTO `cd_master` VALUES (83, '金', '曜日コード', 'WeekCd', '5');
INSERT INTO `cd_master` VALUES (84, '土', '曜日コード', 'WeekCd', '6');
INSERT INTO `cd_master` VALUES (85, '日', '曜日コード', 'WeekCd', '7');
INSERT INTO `cd_master` VALUES (86, '男', '性別区分', 'GenDiv', '1');
INSERT INTO `cd_master` VALUES (87, '女', '性別区分', 'GenDiv', '2');
INSERT INTO `cd_master` VALUES (88, 'N1', '日本語等級', 'JpLv', '1');
INSERT INTO `cd_master` VALUES (89, 'N2', '日本語等級', 'JpLv', '2');
INSERT INTO `cd_master` VALUES (90, 'N3', '日本語等級', 'JpLv', '3');
INSERT INTO `cd_master` VALUES (91, 'N4', '日本語等級', 'JpLv', '4');
INSERT INTO `cd_master` VALUES (92, 'N5', '日本語等級', 'JpLv', '5');
INSERT INTO `cd_master` VALUES (93, 'CET-6', '英語等級', 'EnLv', '1');
INSERT INTO `cd_master` VALUES (94, 'CET-4', '英語等級', 'EnLv', '2');
INSERT INTO `cd_master` VALUES (95, '正社員', '社員区分', 'EmpDiv', '1');
INSERT INTO `cd_master` VALUES (96, '研修生', '社員区分', 'EmpDiv', '2');
INSERT INTO `cd_master` VALUES (97, '派遣', '社員区分', 'EmpDiv', '3');
INSERT INTO `cd_master` VALUES (98, '無', '有無区分', 'YNDiv', '0');
INSERT INTO `cd_master` VALUES (99, '有', '有無区分', 'YNDiv', '1');
INSERT INTO `cd_master` VALUES (100, '大分類', '作業分類区分', 'WkLstDiv', '1');
INSERT INTO `cd_master` VALUES (101, '中分類', '作業分類区分', 'WkLstDiv', '2');
INSERT INTO `cd_master` VALUES (102, '小分類', '作業分類区分', 'WkLstDiv', '3');
INSERT INTO `cd_master` VALUES (103, '休暇未承认', '勤怠取込結果コード', 'AttdncImpRsltCd', '1');
INSERT INTO `cd_master` VALUES (104, '残業未承认', '勤怠取込結果コード', 'AttdncImpRsltCd', '2');
INSERT INTO `cd_master` VALUES (105, 'カード記録未承認', '勤怠取込結果コード', 'AttdncImpRsltCd', '3');
INSERT INTO `cd_master` VALUES (106, '異常勤怠', '勤怠取込結果コード', 'AttdncImpRsltCd', '4');
INSERT INTO `cd_master` VALUES (107, '有', 'TV機器有無サイン', 'TVSgn', '1');
INSERT INTO `cd_master` VALUES (108, '無', 'TV機器有無サイン', 'TVSgn', '2');
INSERT INTO `cd_master` VALUES (109, '在職', '在職状態', 'IncumbencyDiv', '0');
INSERT INTO `cd_master` VALUES (110, '退職', '在職状態', 'IncumbencyDiv', '1');
INSERT INTO `cd_master` VALUES (111, '申請中', 'ステータス', 'Status', '1');
INSERT INTO `cd_master` VALUES (112, '承認済', 'ステータス', 'Status', '6');
INSERT INTO `cd_master` VALUES (113, '7日', '検索期間', 'Days', '7');
INSERT INTO `cd_master` VALUES (114, '14日', '検索期間', 'Days', '14');
INSERT INTO `cd_master` VALUES (115, '30日', '検索期間', 'Days', '30');
INSERT INTO `cd_master` VALUES (116, '90日', '検索期間', 'Days', '90');
INSERT INTO `cd_master` VALUES (231, 'Lv6', '権限コード', 'AuthCd', '6');
INSERT INTO `cd_master` VALUES (232, '基礎', '日本語研修クラス', 'jpClass', '1');
INSERT INTO `cd_master` VALUES (233, '初級', '日本語研修クラス', 'jpClass', '2');
INSERT INTO `cd_master` VALUES (234, '中級', '日本語研修クラス', 'jpClass', '3');
INSERT INTO `cd_master` VALUES (235, '高級', '日本語研修クラス', 'jpClass', '4');
INSERT INTO `cd_master` VALUES (236, 'コーナー', '日本語研修クラス', 'jpClass', '5');
INSERT INTO `cd_master` VALUES (241, 'その他', '学歴', 'Diploma', '3');
INSERT INTO `cd_master` VALUES (242, '修士', '学歴', 'Diploma', '4');
INSERT INTO `cd_master` VALUES (243, '博士', '学歴', 'Diploma', '5');
INSERT INTO `cd_master` VALUES (246, 'N2相当', '日本語等級', 'JpLv', '25');
INSERT INTO `cd_master` VALUES (247, 'N3相当', '日本語等級', 'JpLv', '35');
INSERT INTO `cd_master` VALUES (248, 'N1相当', '日本語等級', 'JpLv', '15');
INSERT INTO `cd_master` VALUES (252, 'その他', '日本語研修クラス', 'jpClass', '6');
INSERT INTO `cd_master` VALUES (254, 'SQA', 'プロジェクト役割コード', 'PrjRoleCd', '5');
INSERT INTO `cd_master` VALUES (255, '正常勤怠', '勤怠取込結果コード', 'AttdncImpRsltCd', '0');
COMMIT;

-- ----------------------------
-- Table structure for menu_list
-- ----------------------------
DROP TABLE IF EXISTS `menu_list`;
CREATE TABLE `menu_list` (
  `MENU_ID` int(11) NOT NULL AUTO_INCREMENT,
  `P_ID` int(11) DEFAULT NULL,
  `NAME` varchar(30) DEFAULT NULL,
  `URL` varchar(100) DEFAULT NULL,
  `LV` int(11) DEFAULT NULL,
  `ICON` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_list
-- ----------------------------
BEGIN;
INSERT INTO `menu_list` VALUES (1, 0, '勤怠管理', NULL, 1, 'cube');
INSERT INTO `menu_list` VALUES (2, 0, 'プロジェクト管理', NULL, 1, 'desktop');
INSERT INTO `menu_list` VALUES (3, 0, '有休・代休管理', NULL, 1, 'server');
INSERT INTO `menu_list` VALUES (4, 0, '会議室管理', NULL, 1, 'sitemap');
INSERT INTO `menu_list` VALUES (5, 0, '残業・休暇管理', NULL, 1, 'database');
INSERT INTO `menu_list` VALUES (6, 0, '图书管理', NULL, 5, 'book');
INSERT INTO `menu_list` VALUES (9, 0, 'システム管理', NULL, 1, 'dashboard');
INSERT INTO `menu_list` VALUES (11, 1, '勤怠管理', 'attendance', 1, 'tasks');
INSERT INTO `menu_list` VALUES (12, 1, '出張管理', 'busTrip/busTripTop.do', 1, 'taxi');
INSERT INTO `menu_list` VALUES (13, 1, 'カード未確認', 'cardRecord', 1, 'id-card-o');
INSERT INTO `menu_list` VALUES (20, 5, '休暇承認', 'holidayAccept', 3, 'check-square-o');
INSERT INTO `menu_list` VALUES (21, 2, 'プロジェクト管理', 'prj', 3, 'bar-chart');
INSERT INTO `menu_list` VALUES (31, 3, '有休・代休管理', 'pidVact', 5, 'plane');
INSERT INTO `menu_list` VALUES (41, 4, '会議室管理', 'mtroom', 4, 'bars');
INSERT INTO `menu_list` VALUES (42, 4, '会議室予約管理', 'resvMt/resvMtTop', 1, 'laptop');
INSERT INTO `menu_list` VALUES (51, 5, '残業管理', 'ovtmwk', 1, 'leaf');
INSERT INTO `menu_list` VALUES (52, 5, '残業承認', 'ovtmWkAppv', 3, 'gift');
INSERT INTO `menu_list` VALUES (53, 5, '休暇管理', 'holiday', 1, 'film');
INSERT INTO `menu_list` VALUES (61, 6, '图书状态', 'book', 5, 'bookmark-o');
INSERT INTO `menu_list` VALUES (62, 6, '图书log', 'bookhistory', 5, 'flag-o');
INSERT INTO `menu_list` VALUES (91, 9, 'マスター管理', 'codeMaster', 5, 'road');
INSERT INTO `menu_list` VALUES (92, 9, '要員管理', 'user', 4, 'user-md');
INSERT INTO `menu_list` VALUES (93, 9, 'カレンダー取込', 'calendar', 5, 'tree');
INSERT INTO `menu_list` VALUES (94, 9, '部署管理', 'department', 4, 'users');
COMMIT;

-- ----------------------------
-- Table structure for te_attdnc
-- ----------------------------
DROP TABLE IF EXISTS `te_attdnc`;
CREATE TABLE `te_attdnc` (
  `YMD` varchar(8) NOT NULL,
  `USER_ID` varchar(4) NOT NULL,
  `ATTDNC_DIV` varchar(1) NOT NULL,
  `STRWK_TIME` varchar(8) DEFAULT NULL,
  `ENDWK_TIME` varchar(8) DEFAULT NULL,
  `LATE_TIME` decimal(5,0) NOT NULL,
  `EARLY_TIME` decimal(5,0) NOT NULL,
  `OVTMWK_TIME` decimal(5,0) NOT NULL,
  `WK_TIME` decimal(5,0) NOT NULL,
  `ATTDNC_CHG_RSN_DIV` varchar(1) NOT NULL,
  `ATTDNC_CHG_RSN_CONT` varchar(60) NOT NULL,
  `ATTDNC_IMP_RSLT_CD` varchar(1) NOT NULL,
  `DEL_SGN` varchar(1) NOT NULL,
  `ADD_BY` varchar(20) NOT NULL,
  `ADD_DATE` date NOT NULL,
  `UPD_BY` varchar(20) DEFAULT NULL,
  `UPD_DATE` date DEFAULT NULL,
  `LOCK_VER_CNT` decimal(5,0) NOT NULL,
  `CPSTHLD_TIME_WORK` decimal(5,1) DEFAULT NULL,
  `CPSTHLD_TIME_HLD` decimal(5,1) DEFAULT NULL,
  `CPSTHLD_TIME_OFFHLD` decimal(5,1) DEFAULT NULL,
  `HLD_REST` decimal(5,1) DEFAULT NULL,
  `HLD_LIEU` decimal(5,1) DEFAULT NULL,
  `HLD_SICK` decimal(5,1) DEFAULT NULL,
  `HLD_LEAVE` decimal(5,1) DEFAULT NULL,
  `HLD_MARRY` decimal(5,1) DEFAULT NULL,
  `HLD_MATER` decimal(5,1) DEFAULT NULL,
  `HLD_FUNER` decimal(5,1) DEFAULT NULL,
  `HLD_BUSIN` decimal(5,1) DEFAULT NULL,
  `HLD_OTHER` decimal(5,1) DEFAULT NULL,
  `ABSENT_HOURS` decimal(5,1) DEFAULT NULL,
  `PUN_CARD_TIMES` decimal(1,0) DEFAULT NULL,
  `FOR_CARD_TIMES` decimal(1,0) DEFAULT NULL,
  `REMARKS` varchar(300) DEFAULT NULL,
  `WORK_ON_DES` varchar(300) DEFAULT NULL,
  `WORK_OFF_DES` varchar(300) DEFAULT NULL,
  `ABSNC_TIME` decimal(5,0) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`YMD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of te_attdnc
-- ----------------------------
BEGIN;
INSERT INTO `te_attdnc` VALUES ('20170313', '0003', '5', '08:21:23', '21:37:52', 0, 0, 0, 0, '1', '', '0', '0', '王一二三', '2017-11-16', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `te_attdnc` VALUES ('20170314', '0003', '5', '08:12:44', '21:31:06', 0, 0, 0, 0, '1', '', '0', '0', '王一二三', '2017-11-16', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `te_attdnc` VALUES ('20170315', '0003', '5', '07:19:41', '17:26:57', 0, 0, 0, 0, '1', '', '0', '0', '王一二三', '2017-11-16', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `te_attdnc` VALUES ('20170316', '0003', '5', '08:39:11', '17:48:50', 10, 0, 0, 0, '1', '', '0', '0', '王一二三', '2017-11-16', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `te_attdnc` VALUES ('20170317', '0003', '5', '07:33:59', '17:22:10', 0, 10, 0, 0, '1', '', '0', '0', '王一二三', '2017-11-16', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `te_attdnc` VALUES ('20170318', '0003', '5', '', '', 0, 0, 0, 0, '1', '', '0', '0', '王一二三', '2017-11-16', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `te_attdnc` VALUES ('20170319', '0003', '5', '', '', 0, 0, 0, 0, '1', '', '0', '0', '王一二三', '2017-11-16', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `te_attdnc` VALUES ('20170313', '0004', '5', '09:23:12', '11:07:48', 0, 0, 0, 0, '1', '', '0', '0', '王一二三', '2017-11-16', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `te_attdnc` VALUES ('20170314', '0004', '5', '', '', 0, 0, 0, 0, '1', '', '0', '0', '王一二三', '2017-11-16', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `te_attdnc` VALUES ('20170315', '0004', '5', '', '', 0, 0, 0, 0, '1', '', '0', '0', '王一二三', '2017-11-16', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `te_attdnc` VALUES ('20170316', '0004', '5', '', '', 0, 0, 0, 0, '1', '', '0', '0', '王一二三', '2017-11-16', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `te_attdnc` VALUES ('20170317', '0004', '5', '09:07:49', '16:47:06', 0, 0, 0, 0, '1', '', '0', '0', '王一二三', '2017-11-16', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `te_attdnc` VALUES ('20170318', '0004', '5', '', '', 0, 0, 0, 0, '1', '', '0', '0', '王一二三', '2017-11-16', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `te_attdnc` VALUES ('20170319', '0004', '5', '', '', 0, 0, 0, 0, '1', '', '0', '0', '王一二三', '2017-11-16', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `te_attdnc` VALUES ('20170313', '0006', '5', '07:19:57', '16:23:32', 0, 0, 0, 0, '1', '', '0', '0', '王一二三', '2017-11-16', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `te_attdnc` VALUES ('20170314', '0006', '5', '07:18:15', '16:18:48', 0, 0, 0, 0, '1', '', '0', '0', '王一二三', '2017-11-16', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `te_attdnc` VALUES ('20170315', '0006', '5', '07:37:35', '15:44:14', 0, 0, 0, 0, '1', '', '0', '0', '王一二三', '2017-11-16', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `te_attdnc` VALUES ('20170316', '0006', '5', '07:47:33', '15:29:10', 0, 0, 0, 0, '1', '', '0', '0', '王一二三', '2017-11-16', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `te_attdnc` VALUES ('20170317', '0006', '5', '07:23:47', '16:04:29', 0, 0, 0, 0, '1', '', '0', '0', '王一二三', '2017-11-16', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `te_attdnc` VALUES ('20170318', '0006', '5', '07:40:05', '16:26:38', 0, 0, 0, 0, '1', '', '0', '0', '王一二三', '2017-11-16', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `te_attdnc` VALUES ('20170319', '0006', '5', '', '', 0, 0, 0, 0, '1', '', '0', '0', '王一二三', '2017-11-16', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for tr_calendar
-- ----------------------------
DROP TABLE IF EXISTS `tr_calendar`;
CREATE TABLE `tr_calendar` (
  `YMD` varchar(8) NOT NULL,
  `HLD_SGN` varchar(1) NOT NULL,
  `MEMO` varchar(45) DEFAULT NULL,
  `DEL_SGN` varchar(1) NOT NULL,
  `ADD_BY` varchar(20) NOT NULL,
  `ADD_DATE` date NOT NULL,
  `UPD_BY` varchar(20) DEFAULT NULL,
  `UPD_DATE` date DEFAULT NULL,
  `LOCK_VER_CNT` int(11) NOT NULL,
  PRIMARY KEY (`YMD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tr_dept
-- ----------------------------
DROP TABLE IF EXISTS `tr_dept`;
CREATE TABLE `tr_dept` (
  `dept_id` varchar(10) NOT NULL,
  `dept_nm` varchar(20) NOT NULL,
  `dept_smpl_nm` varchar(30) NOT NULL,
  `del_sgn` varchar(1) NOT NULL,
  `add_by` varchar(30) NOT NULL,
  `add_date` date DEFAULT NULL,
  `upd_by` varchar(30) DEFAULT NULL,
  `upd_date` date DEFAULT NULL,
  `lock_ver_cnt` int(11) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tr_dept
-- ----------------------------
BEGIN;
INSERT INTO `tr_dept` VALUES ('ZJLSS01', '第一開発室', '一開', '0', 'ZWN', '2017-11-18', 'haha', '2017-11-18', 0);
INSERT INTO `tr_dept` VALUES ('ZJLSS02', '第二開発室', '二開', '0', 'ZWN', '2017-11-18', 'haha', '2017-11-18', 0);
INSERT INTO `tr_dept` VALUES ('ZJLSS03', '第三開発室', '三開', '0', '9999', '2017-11-18', 'haha', '2017-11-18', 0);
INSERT INTO `tr_dept` VALUES ('ZJLSS04', '第四開発室', '四開', '0', 'haha', '2017-11-18', 'haha', '2017-11-18', 0);
INSERT INTO `tr_dept` VALUES ('ZJLSS05', '生産保障部', '生産保障部', '0', '姜穎穎穎', '2017-11-18', '姜穎穎穎', '2017-11-18', 0);
COMMIT;

-- ----------------------------
-- Table structure for tr_permission
-- ----------------------------
DROP TABLE IF EXISTS `tr_permission`;
CREATE TABLE `tr_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(256) DEFAULT NULL COMMENT 'url地址',
  `name` varchar(64) DEFAULT NULL COMMENT 'url描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tr_permission
-- ----------------------------
BEGIN;
INSERT INTO `tr_permission` VALUES (1, '/permission/index.shtml', '权限列表');
INSERT INTO `tr_permission` VALUES (2, '/user/editPwdPage', '权限添加');
INSERT INTO `tr_permission` VALUES (3, '/permission/deletePermissionById.shtml', '权限删除');
COMMIT;

-- ----------------------------
-- Table structure for tr_role
-- ----------------------------
DROP TABLE IF EXISTS `tr_role`;
CREATE TABLE `tr_role` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '角色名',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序号',
  `description` varchar(255) DEFAULT NULL COMMENT '简介',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of tr_role
-- ----------------------------
BEGIN;
INSERT INTO `tr_role` VALUES (1, 'lv1', 0, '普通用户', 0);
INSERT INTO `tr_role` VALUES (2, 'lv2', 0, '项目组长', 0);
INSERT INTO `tr_role` VALUES (3, 'lv3', 0, '开发室长', 0);
INSERT INTO `tr_role` VALUES (4, 'lv4', 0, '技术部经理', 0);
INSERT INTO `tr_role` VALUES (5, 'lv5', 0, '超级管理员', 0);
COMMIT;

-- ----------------------------
-- Table structure for tr_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `tr_role_permission`;
CREATE TABLE `tr_role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `r_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `p_id` bigint(20) DEFAULT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tr_role_permission
-- ----------------------------
BEGIN;
INSERT INTO `tr_role_permission` VALUES (1, 1, 1);
INSERT INTO `tr_role_permission` VALUES (2, 5, 2);
INSERT INTO `tr_role_permission` VALUES (3, 4, 3);
INSERT INTO `tr_role_permission` VALUES (4, 5, 1);
COMMIT;

-- ----------------------------
-- Table structure for tr_user
-- ----------------------------
DROP TABLE IF EXISTS `tr_user`;
CREATE TABLE `tr_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(5) NOT NULL,
  `dept_id` varchar(7) NOT NULL,
  `user_nm` varchar(30) NOT NULL,
  `kana_nm` varchar(60) NOT NULL,
  `password` varchar(64) NOT NULL,
  `gen_div` varchar(2) NOT NULL,
  `htel_no` varchar(30) NOT NULL,
  `fam_reg` varchar(60) NOT NULL,
  `addr` varchar(60) NOT NULL,
  `edct` varchar(10) DEFAULT NULL,
  `gradt_schl` varchar(60) DEFAULT NULL,
  `spec` varchar(60) DEFAULT NULL,
  `gradt_ymd` date DEFAULT NULL,
  `jp_lv` varchar(2) DEFAULT NULL,
  `en_lv` varchar(2) DEFAULT NULL,
  `entcom_ymd` date NOT NULL,
  `attdnc_chk_sgn` varchar(1) NOT NULL,
  `atth_cd` tinyint(4) NOT NULL,
  `emp_div` varchar(1) NOT NULL,
  `lvjob_date` date DEFAULT NULL,
  `del_sgn` varchar(1) DEFAULT NULL,
  `add_by` varchar(30) NOT NULL,
  `add_date` date NOT NULL,
  `upd_by` varchar(30) DEFAULT NULL,
  `upd_date` date DEFAULT NULL,
  `lock_ver_cnt` int(11) NOT NULL,
  `taxprc` varchar(3) DEFAULT NULL,
  `passport_no` varchar(10) DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `jp_class` varchar(4) DEFAULT NULL,
  `jp_date` varchar(10) DEFAULT NULL,
  `en_date` varchar(10) DEFAULT NULL,
  `jp_ex_mm` int(11) DEFAULT NULL,
  `id_card` varchar(18) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tr_user
-- ----------------------------
BEGIN;
INSERT INTO `tr_user` VALUES (1, 'T069', 'ZJLSS01', '包英彪', 'ホウ　エイ　ヒョウ', '4QrcOUm6Wau+VuBX8g+IPg==', '1', '152-4323-3537', '吉林省松原市', '吉林市', '2', '北京交通大学', '電気工程と自動化', '2015-07-01', NULL, NULL, '2016-06-13', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1993-03-14', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (2, '0164', 'ZJLSS01', '鄭婷婷', 'テイ　テイテイ', '4QrcOUm6Wau+VuBX8g+IPg==', '2', '151-2432-7017', '吉林省松原市', '吉林市', '2', '吉林化工学院', '信息与計算科学', '2014-07-01', NULL, NULL, '2016-06-02', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1990-12-03', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (3, 'T058', 'ZJLSS01', '張津銘', 'ちょう　シン　メイ', '4QrcOUm6Wau+VuBX8g+IPg==', '1', '138-4462-7612', '吉林省吉林市', '吉林省吉林市丰満区', '2', '遼源職業技朮学院', '建筑エ程技朮', '2013-06-27', NULL, NULL, '2016-03-07', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1995-01-17', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (4, 'T062', 'ZJLSS01', '田継平', 'でん　けいへい', '4QrcOUm6Wau+VuBX8g+IPg==', '1', '156-6213-7509', '吉林省楡棥市', '吉林省吉林市丰満区', '2', '北氒大学', '計算機科学与技術', '2013-06-28', NULL, NULL, '2016-06-27', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1992-06-03', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (5, '0034', 'ZJLSS01', '李海林', 'り　かいりん', '4QrcOUm6Wau+VuBX8g+IPg==', '2', '159-8115-8133', '吉林省吉林市', '吉林省吉林市丰満区', '2', '吉林化工学院', 'インフォメーションとコンピュータ科学', '2013-06-27', NULL, NULL, '2013-07-01', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1991-02-11', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (6, '0189', 'ZJLSS01', '李金栄', 'り　きんえい', '4QrcOUm6Wau+VuBX8g+IPg==', '2', '186-8659-4948', '吉林省吉林市', '吉林市', '1', '大連軽工業学院', '計算機科学及技術', '2004-07-01', NULL, NULL, '2016-09-30', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1983-08-06', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (7, '0132', 'ZJLSS01', '李士啓', 'リ　　シケイ', '4QrcOUm6Wau+VuBX8g+IPg==', '1', '138-4327-8289', '吉林省吉林市', '吉林市', '2', '白城師範学院', '計算機科学及技術', '2011-07-01', NULL, NULL, '2015-04-07', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1988-09-26', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (8, '0017', 'ZJLSS01', '廉中星', 'れん　ちゅうせい', '4QrcOUm6Wau+VuBX8g+IPg==', '1', '180-4322-9727', '吉林市', '吉林市', '2', '北華大学', '電子信息工程', '2013-07-01', NULL, NULL, '2013-07-01', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1990-12-24', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (9, '0099', 'ZJLSS01', '鐘暁鋼', 'ショウ　ギョウコウ', '4QrcOUm6Wau+VuBX8g+IPg==', '1', '186-1848-1950', '吉林省吉林市', '吉林市', '2', '吉林大学', '近代物理学', '1989-07-01', NULL, NULL, '2014-04-01', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1967-03-18', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (10, '0044', 'ZJLSS04', '李存慧', 'り　そんけい', '4QrcOUm6Wau+VuBX8g+IPg==', '2', '136-306-00962', '吉林省吉林市', '吉林市', '2', '通化師範学院', '日本語', '2013-07-01', NULL, NULL, '2013-05-02', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1989-11-20', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (11, '0087', 'ZJLSS04', '牛宇光', 'ギュウ ウコウ', '4QrcOUm6Wau+VuBX8g+IPg==', '1', '134-2606-9681', '吉林省吉林市', '吉林省吉林市船営区', '2', '東北電力大学', '計算機科学与技術', '2006-06-24', NULL, NULL, '2013-09-16', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1982-04-03', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (12, '0150', 'ZJLSS04', '孫亜晶', 'そん　あしょう', '4QrcOUm6Wau+VuBX8g+IPg==', '2', '136-9432-7650', '吉林省吉林市', '吉林市', '2', '吉林化工学院', '計算機科学及技術', '2015-07-01', NULL, NULL, '2015-07-06', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1994-02-01', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (13, '0205', 'ZJLSS01', '周珅万', '111', '4QrcOUm6Wau+VuBX8g+IPg==', '1', '186-4320-8450', '辽宁省灯塔市', '吉林省吉林市船营区中凯梦之城', '1', '辽源职业技术学院', 'JAVA', NULL, '5', NULL, '2017-03-23', '1', 5, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 0, NULL, NULL, NULL, '1990-02-16', NULL, NULL, NULL, NULL, '211022199002160016', NULL);
INSERT INTO `tr_user` VALUES (14, '0003', 'ZJLSS03', 'admin', 'はは', 'd76d0ae14bf4d774f54a07de43a37c08', '1', '12345678912', 'aaaaaaaa', 'aaaaaaaa', '1', '1111', 'aaaaaaaa', '1911-07-10', '2', NULL, '2015-07-10', '1', 3, '2', NULL, '0', '0001', '2017-06-12', '0001', '2017-11-15', 10, '1', NULL, NULL, '2017-08-18', NULL, '2005-02-02', NULL, 0, NULL, NULL);
INSERT INTO `tr_user` VALUES (15, '8888', 'ZJLSS02', '8888', '8888', '0b7c9794fc9846270df76a96e079df24', '1', '154-4564-4564', '22322', '54548', '4', NULL, NULL, '2017-10-10', NULL, NULL, '2017-10-10', '2', 4, '2', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 0, '56', NULL, '2017-10-10', '2017-10-10', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (16, '0036', 'ZJLSS01', '曹双双', 'そう　そうそう', '4QrcOUm6Wau+VuBX8g+IPg==', '2', '156-6213-6425', '吉林省長春市', '吉林省吉林市丰満区', '2', '吉林化工学院', '信息与計算科学', '2013-06-27', NULL, NULL, '2013-07-01', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1990-08-02', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (17, '0056', 'ZJLSS01', 'シャク揚', 'しゃく　よう', '4QrcOUm6Wau+VuBX8g+IPg==', '1', '185-1500-2411', '吉林市', '吉林市', '2', '延辺大学', '計算機科学与技術', '2013-07-01', NULL, NULL, '2013-07-01', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1990-12-16', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (18, '0001', 'ZJLSS01', '王一二三', 'はは', 'e5c6e5ccec361baebcf79859e49c5526', '1', '13012345678', '吉林', '吉林', '1', '吉林', '吉林', '1912-08-09', '1', '1', '2016-09-06', '1', 5, '1', NULL, '0', '0001', '2017-06-12', '0001', '2017-06-12', 6, '0', 'a123', '2017-11-08', '2017-10-03', '1', '2017-10-17', NULL, 0, '123456111212120123', '111@163.com');
INSERT INTO `tr_user` VALUES (19, '0002', 'ZJLSS01', 'bb', 'はは', '3de2b02951b801792887ed72d8a7c8f2', '2', '123-4567-8912', 'aaaaaaaa', 'aaaaaaaa', '1', '1111', 'aaaaaaaa', '1911-07-10', '2', '1', '2016-02-10', '1', 4, '1', NULL, '0', '0001', '2017-06-12', '0001', '2017-06-12', 1, '1', NULL, '2017-11-09', '2017-08-18', '1', '2005-02-05', NULL, 0, NULL, NULL);
INSERT INTO `tr_user` VALUES (20, '0060', 'ZJLSS01', '張暁龍', 'ちょう　ぎょうりゅう', '4QrcOUm6Wau+VuBX8g+IPg==', '1', '159-8122-9927', '吉林省吉林市', '吉林省吉林市丰満区', '2', '長春理工大学光電信息学院', '電気工程と自動化', '2012-06-27', NULL, NULL, '2013-07-01', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1989-03-14', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (21, '0014', 'ZJLSS01', '朱秀秀', 'しゅしゅうしゅう', '4QrcOUm6Wau+VuBX8g+IPg==', '2', '155-9009-6136', '吉林市', '吉林市', '2', '通化師範学院', '日本語1', '2013-07-01', NULL, NULL, '2013-07-01', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1989-05-08', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (22, '0064', 'ZJLSS01', '倪岩娟', 'ゲイ　ガンケン', '4QrcOUm6Wau+VuBX8g+IPg==', '2', '158-4327-5286', '吉林省吉林市', '吉林省吉林市龍潭区', '2', '長春理工大学', '計算機科学与技術2', '2007-07-01', NULL, NULL, '2013-08-05', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1982-02-28', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (23, '0075', 'ZJLSS01', '郝春柳', 'かく　はるやなぎ', '4QrcOUm6Wau+VuBX8g+IPg==', '2', '132-6015-6296', '吉林市', '吉林市', '2', '吉林化工学院', '信息与計算科学', '2013-07-01', NULL, NULL, '2013-07-01', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1989-09-10', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (24, '0090', 'ZJLSS01', '王偉', 'オウ　イ', '4QrcOUm6Wau+VuBX8g+IPg==', '1', '189-4321-1940', '吉林省吉林市', '吉林市', '2', '長春工業大学', '計算機科学及技術', '2006-07-01', NULL, NULL, '2013-11-17', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1982-06-08', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (25, '0094', 'ZJLSS01', '張亮', 'チョウ　リョウ', '4QrcOUm6Wau+VuBX8g+IPg==', '1', '186-7877-1203', '山東省済南市', '吉林市', '2', '山東科技大学', '計算機科学及技術', '2008-07-01', NULL, NULL, '2013-12-01', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1986-03-07', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (26, '0100', 'ZJLSS01', '王星', 'おう　ほし', '4QrcOUm6Wau+VuBX8g+IPg==', '1', '155-9009-8028', '吉林市', '吉林市', '2', '東北大学', 'ソフトウエア技術3', '2010-03-01', NULL, NULL, '2014-04-08', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1987-06-15', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (27, '0119', 'ZJLSS01', '呉晶', 'ご　しょう', '4QrcOUm6Wau+VuBX8g+IPg==', '2', '150-4406-7551', '吉林市', '吉林市', '2', '長春大学', '通信工程', '2012-07-01', NULL, NULL, '2014-09-20', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1988-10-28', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (28, '0123', 'ZJLSS01', '宋今哲', 'ソウ　イマテツ', '4QrcOUm6Wau+VuBX8g+IPg==', '1', '180-4322-5868', '遼寧省大連市', '吉林市', '1', '吉林農業特産専業学校', '計算機及応用', '2002-07-01', NULL, NULL, '2014-12-01', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1981-03-06', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (29, '0147', 'ZJLSS01', '韓嘯', 'かん　しょう', '4QrcOUm6Wau+VuBX8g+IPg==', '2', '135-0477-1847', '吉林省吉林市', '吉林省吉林市丰満区', '2', '吉林化工学院', '計算機科学与技術', '2015-07-01', NULL, NULL, '2015-07-06', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1992-05-18', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (30, '0148', 'ZJLSS01', '王娜', 'オウ　ナ', '4QrcOUm6Wau+VuBX8g+IPg==', '2', '136-1442-4881', '吉林省吉林市', '吉林省吉林市丰満区', '2', '吉林化工学院', '計算機科学与技術', '2015-07-01', NULL, NULL, '2015-07-06', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1991-10-08', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (31, '0149', 'ZJLSS01', '王賀', 'おうが', '4QrcOUm6Wau+VuBX8g+IPg==', '2', '136-5449-4367', '吉林市', '烽火', '2', '吉林化工学院', '計算機科学与技術', '2015-07-01', NULL, NULL, '2015-07-07', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1992-10-13', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (32, '0155', 'ZJLSS01', '李海宇', 'り　かいう', '4QrcOUm6Wau+VuBX8g+IPg==', '2', '188-4446-2021', '吉林省遼源市', '吉林省吉林市丰満区', '2', '吉林化工学院', '計算機科学与技術', '2015-07-01', NULL, NULL, '2015-11-05', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1992-10-01', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (33, '0156', 'ZJLSS01', '許淼', 'きょ　びょう', '4QrcOUm6Wau+VuBX8g+IPg==', '2', '186-8655-2246', '吉林省通化縣', '吉林市', '2', '東北電力大学', '電子情報工程', '2015-07-01', NULL, NULL, '2015-11-25', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1992-06-27', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (34, '0157', 'ZJLSS01', '王美', 'おう　み', '4QrcOUm6Wau+VuBX8g+IPg==', '2', '136-8987-9771', '吉林市', '吉林市', '2', '吉林大学', '商務英語', '2013-09-15', NULL, NULL, '2015-10-24', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1990-04-24', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (35, '0176', 'ZJLSS01', '劉暢', 'りゅう　ちょう', '4QrcOUm6Wau+VuBX8g+IPg==', '2', '151-4340-4800', '吉林省四平市', '吉林市', '2', '長春理工大学', '自動化', '2016-07-02', NULL, NULL, '2016-07-05', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1994-05-27', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (36, '0180', 'ZJLSS01', '潘鴻揚', 'はん　こうよう', '4QrcOUm6Wau+VuBX8g+IPg==', '1', '151-4422-9527', '吉林市', '吉林市', '2', '長春第二航空学院', '航空儀表', '2000-07-01', NULL, NULL, '2016-07-18', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1979-02-16', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (37, '0181', 'ZJLSS01', '汪潤澤', 'おう　じゅんたく', '4QrcOUm6Wau+VuBX8g+IPg==', '1', '130-7970-3770', '吉林省吉林市', '吉林省吉林市昌邑区', '2', '雲南中医学院', '計算機科学及技術', '2016-07-01', NULL, NULL, '2016-07-25', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1993-05-14', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (38, '0187', 'ZJLSS01', '雷金彪', 'らい　きんひょう', '4QrcOUm6Wau+VuBX8g+IPg==', '1', '177-0129-2653', '吉林市', '吉林市', '1', '吉林財税高等専科学校', '計算機及応用', '2006-07-01', NULL, NULL, '2016-09-09', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1983-01-02', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (39, '0188', 'ZJLSS01', '姜帥', 'きょう　すい', '4QrcOUm6Wau+VuBX8g+IPg==', '1', '138-4422-6967', '吉林省吉林市', '吉林市', '2', '長春大学', '信息与計算科学', '2010-06-01', NULL, NULL, '2016-09-21', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1987-05-13', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (40, '0190', 'ZJLSS01', '崔金棟', 'さい　きんとう', '4QrcOUm6Wau+VuBX8g+IPg==', '1', '138-4422-6968', '吉林省吉林市', '吉林市', '1', '長春職業技朮学院', '食品', '2013-07-01', NULL, NULL, '2016-09-22', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1992-08-26', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (41, '0194', 'ZJLSS01', '金冠瑩', 'きん　かんえい', '4QrcOUm6Wau+VuBX8g+IPg==', '2', '159-4420-5109', '吉林省吉林市', '吉林市', '2', '吉林化工学院', '計算機科学及技術', '2016-07-01', NULL, NULL, '2016-11-21', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1992-07-15', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (42, '0195', 'ZJLSS01', '姜穎', 'きょう　えい', '4QrcOUm6Wau+VuBX8g+IPg==', '2', '135-9621-0381', '吉林省吉林市', '吉林市', '2', '北華大学', '計算機科学及技術', '2006-07-01', NULL, NULL, '2016-11-28', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1983-12-19', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (43, '0198', 'ZJLSS01', '邵澤豊', 'しょう　たくほう', '4QrcOUm6Wau+VuBX8g+IPg==', '1', '189-4321-3766', '吉林省吉林市', '吉林市', '2', '天津理工大学', '計算機科学及技術', '2006-07-01', NULL, NULL, '2017-01-23', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1992-05-01', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (44, '0200', 'ZJLSS01', '周宏宇', 'しゅう　こうう', '4QrcOUm6Wau+VuBX8g+IPg==', '1', '186-2995-3342', '吉林省吉林市', '吉林市', '1', '白城職業技術学院', '計算機及応用', '2011-06-01', NULL, NULL, '2017-02-03', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1987-08-07', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tr_user` VALUES (45, '0203', 'ZJLSS01', '王闊', 'おう　かち', '4QrcOUm6Wau+VuBX8g+IPg==', '1', '130-4130-1088', '吉林省吉林市', '吉林市', '1', '山東大学', '計算機及応用', '2013-07-01', NULL, NULL, '2017-03-14', '1', 3, '1', NULL, '0', '0001', '2017-11-15', '0001', '2017-11-15', 1, NULL, NULL, NULL, '1989-02-16', NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
