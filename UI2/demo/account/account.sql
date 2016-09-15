CREATE TABLE IF NOT EXISTS `account` (
  `fID` varchar(32) NOT NULL COMMENT 'ID',
  `fCreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `fDate` date DEFAULT NULL COMMENT '日期',
  `fMoney` decimal(10,0) DEFAULT NULL COMMENT '金额',
  `fDescription` varchar(512) DEFAULT NULL COMMENT '备注',
  `fType` varchar(32) DEFAULT NULL COMMENT '类型',
  `fClass` varchar(32) DEFAULT NULL COMMENT '分类',
  PRIMARY KEY (`fID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `account_class` (
  `fID` varchar(32) NOT NULL,
  `fType` varchar(32) NOT NULL,
  `fClass` varchar(32) NOT NULL,
  PRIMARY KEY (`fID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `account` (`fID`, `fCreateTime`, `fDate`, `fMoney`, `fDescription`, `fType`, `fClass`) VALUES
	('C6CF724644700001C084D910260017E7', '2015-10-22 15:32:39', '2015-10-22', 50, '吃麻辣烫', '支出', '餐费'),
	('C6CF724BA7900001956444909A00F4D0', '2015-10-22 15:33:01', '2015-10-22', 500, '干的不错', '收入', '奖金'),
	('C6CF7F7A2A0000018C811900EB0A19F7', '2015-10-22 19:23:23', '2015-10-22', 85, '打了个车', '支出', '交通'),
	('C6CFC1ECCCF000013B3310301F1D1C7A', '2015-10-23 14:44:38', '2015-10-23', 1200, '飞机票', '支出', '交通');
INSERT INTO `account_class` (`fID`, `fType`, `fClass`) VALUES
	('C6CF7622B43000017EA41D601D507130', '支出', '餐费'),
	('C6CF7626E24000014B31526A1E3B135F', '支出', '交通'),
	('C6CF762966B000019EA81DC015809660', '收入', '工资'),
	('C6CF763063B00001A345B2EFD6901C95', '收入', '奖金'),
	('C6CFC399428000015E1A8F6017B01034', '支出', '购物');

