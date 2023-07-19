#
# TABLE STRUCTURE FOR: admin
#

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `about` text,
  `email` varchar(100) NOT NULL,
  `password` varchar(32) NOT NULL,
  `password_reset_token` varchar(20) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_logout` datetime DEFAULT NULL,
  `ip_address` varchar(14) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_admin` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

INSERT INTO `admin` (`id`, `firstname`, `lastname`, `about`, `email`, `password`, `password_reset_token`, `image`, `last_login`, `last_logout`, `ip_address`, `status`, `is_admin`) VALUES (1, 'Tanzil', 'Ahammed', 'Assistant managing director ', 'bdtask@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '2023-01-06 21:38:00', '2023-01-04 23:31:02', '::1', 1, 1);


#
# TABLE STRUCTURE FOR: advertisement
#

DROP TABLE IF EXISTS `advertisement`;

CREATE TABLE `advertisement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `page` int DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `script` text,
  `url` varchar(255) DEFAULT NULL,
  `serial_position` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

INSERT INTO `advertisement` (`id`, `name`, `page`, `image`, `script`, `url`, `serial_position`, `status`, `date`) VALUES (5, 'news-sidebar-top', 9, 'upload/advertisement/dff78ee612b37fc12c9e7fa94839d855.jpg', NULL, 'https://www.bdtask.com/', 1, 1, '2018-07-09 01:00:40');
INSERT INTO `advertisement` (`id`, `name`, `page`, `image`, `script`, `url`, `serial_position`, `status`, `date`) VALUES (6, 'news-sidebar-bottom', 9, 'upload/advertisement/7fabc49dd69e0a0d6e111f3fcae0118a.jpg', NULL, 'https://www.bdtask.com/', 2, 1, '2018-07-09 01:02:18');
INSERT INTO `advertisement` (`id`, `name`, `page`, `image`, `script`, `url`, `serial_position`, `status`, `date`) VALUES (7, 'news-top', 9, 'upload/advertisement/ff5a204fdd1722068e78222fd1d24a82.jpg', NULL, 'https://www.bdtask.com/', 3, 1, '2018-07-09 00:54:51');
INSERT INTO `advertisement` (`id`, `name`, `page`, `image`, `script`, `url`, `serial_position`, `status`, `date`) VALUES (8, 'news-bottom', 9, '/upload/advertisement/1614672574_04f30fde1bca314f6013.png', NULL, 'https://www.bdtask.com/', 4, 1, '2021-03-01 14:09:34');
INSERT INTO `advertisement` (`id`, `name`, `page`, `image`, `script`, `url`, `serial_position`, `status`, `date`) VALUES (9, 'news details-top', 26, '/upload/advertisement/1614672536_9bb671550e7dbf3570a2.png', NULL, 'https://www.bdtask.com/', 3, 1, '2021-03-01 14:08:57');
INSERT INTO `advertisement` (`id`, `name`, `page`, `image`, `script`, `url`, `serial_position`, `status`, `date`) VALUES (10, 'news details-bottom', 26, '/upload/advertisement/1614672514_0ec53a71097b84c63a82.png', NULL, 'https://www.bdtask.com/', 4, 1, '2021-03-01 14:08:34');
INSERT INTO `advertisement` (`id`, `name`, `page`, `image`, `script`, `url`, `serial_position`, `status`, `date`) VALUES (11, 'news details-sidebar-top', 26, '/upload/advertisement/1614672490_566192aff15693225bd1.png', NULL, 'https://www.bdtask.com/', 1, 1, '2021-03-01 14:08:11');
INSERT INTO `advertisement` (`id`, `name`, `page`, `image`, `script`, `url`, `serial_position`, `status`, `date`) VALUES (12, 'news details-sidebar-bottom', 26, '/upload/advertisement/1614657834_eb2d5f67f41ab46b4194.png', NULL, 'https://www.bdtask.com/', 2, 1, '2021-03-01 10:03:54');


#
# TABLE STRUCTURE FOR: coinpayments_payments
#

DROP TABLE IF EXISTS `coinpayments_payments`;

CREATE TABLE `coinpayments_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount1` double NOT NULL,
  `amount2` double NOT NULL,
  `buyer_name` varchar(100) NOT NULL,
  `currency1` varchar(100) NOT NULL,
  `currency2` varchar(100) NOT NULL,
  `fee` double NOT NULL,
  `ipn_id` mediumtext NOT NULL,
  `ipn_mode` varchar(20) NOT NULL,
  `ipn_type` varchar(20) NOT NULL,
  `ipn_version` varchar(20) NOT NULL,
  `merchant` mediumtext NOT NULL,
  `received_amount` double NOT NULL,
  `received_confirms` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL,
  `status_text` mediumtext NOT NULL,
  `txn_id` mediumtext NOT NULL,
  `user_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: crypto_payments
#

DROP TABLE IF EXISTS `crypto_payments`;

CREATE TABLE `crypto_payments` (
  `paymentID` int unsigned NOT NULL AUTO_INCREMENT,
  `boxID` int unsigned NOT NULL DEFAULT '0',
  `boxType` enum('paymentbox','captchabox') NOT NULL,
  `orderID` varchar(50) NOT NULL DEFAULT '',
  `userID` varchar(50) NOT NULL DEFAULT '',
  `countryID` varchar(3) NOT NULL DEFAULT '',
  `coinLabel` varchar(6) NOT NULL DEFAULT '',
  `amount` double(20,8) NOT NULL DEFAULT '0.00000000',
  `amountUSD` double(20,8) NOT NULL DEFAULT '0.00000000',
  `unrecognised` tinyint unsigned NOT NULL DEFAULT '0',
  `addr` varchar(34) NOT NULL DEFAULT '',
  `txID` char(64) NOT NULL DEFAULT '',
  `txDate` datetime DEFAULT NULL,
  `txConfirmed` tinyint unsigned NOT NULL DEFAULT '0',
  `txCheckDate` datetime DEFAULT NULL,
  `processed` tinyint unsigned NOT NULL DEFAULT '0',
  `processedDate` datetime DEFAULT NULL,
  `recordCreated` datetime DEFAULT NULL,
  PRIMARY KEY (`paymentID`),
  UNIQUE KEY `key3` (`boxID`,`orderID`,`userID`,`txID`,`amount`,`addr`),
  KEY `boxID` (`boxID`),
  KEY `boxType` (`boxType`),
  KEY `userID` (`userID`),
  KEY `countryID` (`countryID`),
  KEY `orderID` (`orderID`),
  KEY `amount` (`amount`),
  KEY `amountUSD` (`amountUSD`),
  KEY `coinLabel` (`coinLabel`),
  KEY `unrecognised` (`unrecognised`),
  KEY `addr` (`addr`),
  KEY `txID` (`txID`),
  KEY `txDate` (`txDate`),
  KEY `txConfirmed` (`txConfirmed`),
  KEY `txCheckDate` (`txCheckDate`),
  KEY `processed` (`processed`),
  KEY `processedDate` (`processedDate`),
  KEY `recordCreated` (`recordCreated`),
  KEY `key1` (`boxID`,`orderID`),
  KEY `key2` (`boxID`,`orderID`,`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

#
# TABLE STRUCTURE FOR: cryptolist
#

DROP TABLE IF EXISTS `cryptolist`;

CREATE TABLE `cryptolist` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `Id` int NOT NULL,
  `Url` varchar(300) DEFAULT NULL,
  `ImageUrl` varchar(300) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Symbol` varchar(100) NOT NULL,
  `CoinName` varchar(100) DEFAULT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `Algorithm` varchar(100) DEFAULT NULL,
  `ProofType` varchar(100) DEFAULT NULL,
  `FullyPremined` varchar(100) DEFAULT NULL,
  `TotalCoinSupply` varchar(100) DEFAULT NULL,
  `PreMinedValue` varchar(100) DEFAULT NULL,
  `TotalCoinsFreeFloat` varchar(100) DEFAULT NULL,
  `SortOrder` int DEFAULT NULL,
  `Sponsored` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `Id` (`Id`),
  UNIQUE KEY `Symbol` (`Symbol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: dbt_affiliation
#

DROP TABLE IF EXISTS `dbt_affiliation`;

CREATE TABLE `dbt_affiliation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `commission` double(19,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

INSERT INTO `dbt_affiliation` (`id`, `type`, `commission`, `status`) VALUES (1, 'PERCENT', '10.00000000', 1);


#
# TABLE STRUCTURE FOR: dbt_balance
#

DROP TABLE IF EXISTS `dbt_balance`;

CREATE TABLE `dbt_balance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `currency_id` int DEFAULT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `balance` double(19,8) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

INSERT INTO `dbt_balance` (`id`, `user_id`, `currency_id`, `currency_symbol`, `balance`, `last_update`) VALUES (1, '4H3CM7', 0, 'USD', '95000.00000000', '2023-01-04 02:52:28');
INSERT INTO `dbt_balance` (`id`, `user_id`, `currency_id`, `currency_symbol`, `balance`, `last_update`) VALUES (2, 'D40BQB', NULL, 'USDC', '100000.00000000', '2023-01-04 23:49:04');
INSERT INTO `dbt_balance` (`id`, `user_id`, `currency_id`, `currency_symbol`, `balance`, `last_update`) VALUES (3, 'D40BQB', 0, 'USD', '1353.61507930', '2023-01-05 12:31:34');


#
# TABLE STRUCTURE FOR: dbt_balance_log
#

DROP TABLE IF EXISTS `dbt_balance_log`;

CREATE TABLE `dbt_balance_log` (
  `log_id` bigint NOT NULL AUTO_INCREMENT,
  `balance_id` int NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `currency_id` int DEFAULT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `transaction_type` varchar(100) NOT NULL,
  `transaction_amount` double(19,8) NOT NULL,
  `transaction_fees` double(19,8) NOT NULL,
  `ip` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

INSERT INTO `dbt_balance_log` (`log_id`, `balance_id`, `user_id`, `currency_id`, `currency_symbol`, `transaction_type`, `transaction_amount`, `transaction_fees`, `ip`, `date`) VALUES ('1', 1, '4H3CM7', NULL, 'USD', 'DEPOSIT', '95000.00000000', '0.00000000', '::1', '2023-01-04 02:52:04');
INSERT INTO `dbt_balance_log` (`log_id`, `balance_id`, `user_id`, `currency_id`, `currency_symbol`, `transaction_type`, `transaction_amount`, `transaction_fees`, `ip`, `date`) VALUES ('2', 2, 'D40BQB', NULL, 'USDC', 'CREDITED', '100000.00000000', '0.00000000', '192.168.1.203', '2023-01-04 23:49:04');
INSERT INTO `dbt_balance_log` (`log_id`, `balance_id`, `user_id`, `currency_id`, `currency_symbol`, `transaction_type`, `transaction_amount`, `transaction_fees`, `ip`, `date`) VALUES ('3', 3, 'D40BQB', NULL, 'USD', 'DEPOSIT', '500.00000000', '0.00000000', '192.168.1.173', '2023-01-04 23:56:04');
INSERT INTO `dbt_balance_log` (`log_id`, `balance_id`, `user_id`, `currency_id`, `currency_symbol`, `transaction_type`, `transaction_amount`, `transaction_fees`, `ip`, `date`) VALUES ('4', 3, 'D40BQB', NULL, 'USD', 'DEPOSIT', '1000.00000000', '0.00000000', '192.168.1.173', '2023-01-04 23:56:58');
INSERT INTO `dbt_balance_log` (`log_id`, `balance_id`, `user_id`, `currency_id`, `currency_symbol`, `transaction_type`, `transaction_amount`, `transaction_fees`, `ip`, `date`) VALUES ('5', 3, 'D40BQB', NULL, 'USD', 'TRADE_CANCEL', '0.00210500', '0.00000000', '192.168.1.203', '2023-01-05 00:09:31');
INSERT INTO `dbt_balance_log` (`log_id`, `balance_id`, `user_id`, `currency_id`, `currency_symbol`, `transaction_type`, `transaction_amount`, `transaction_fees`, `ip`, `date`) VALUES ('6', 3, 'D40BQB', NULL, 'USD', 'TRADE_CANCEL', '1500.00000000', '0.00000000', '192.168.1.203', '2023-01-05 00:22:17');


#
# TABLE STRUCTURE FOR: dbt_biding
#

DROP TABLE IF EXISTS `dbt_biding`;

CREATE TABLE `dbt_biding` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bid_type` varchar(50) NOT NULL,
  `bid_price` double(19,8) NOT NULL,
  `bid_qty` double(19,8) NOT NULL,
  `bid_qty_available` double(19,8) NOT NULL,
  `total_amount` double(19,8) NOT NULL,
  `amount_available` double(19,8) NOT NULL,
  `coin_id` varchar(50) DEFAULT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `market_id` int DEFAULT NULL,
  `market_symbol` varchar(100) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `open_order` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fees_amount` double(19,8) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '"1=Complete, 2=Running"',
  `trade_type` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

INSERT INTO `dbt_biding` (`id`, `bid_type`, `bid_price`, `bid_qty`, `bid_qty_available`, `total_amount`, `amount_available`, `coin_id`, `currency_symbol`, `market_id`, `market_symbol`, `user_id`, `open_order`, `fees_amount`, `status`, `trade_type`) VALUES ('1', 'BUY', '0.00021050', '10.00000000', '10.00000000', '0.00210500', '0.00210500', NULL, 'BDG', NULL, 'BDG_USD', 'D40BQB', '2023-01-05 07:01:47', '0.00000000', 0, NULL);
INSERT INTO `dbt_biding` (`id`, `bid_type`, `bid_price`, `bid_qty`, `bid_qty_available`, `total_amount`, `amount_available`, `coin_id`, `currency_symbol`, `market_id`, `market_symbol`, `user_id`, `open_order`, `fees_amount`, `status`, `trade_type`) VALUES ('2', 'BUY', '0.00021050', '7125890.73634204', '7125890.73634204', '1500.00000000', '1500.00000000', NULL, 'BDG', NULL, 'BDG_USD', 'D40BQB', '2023-01-05 07:09:54', '0.00000000', 0, NULL);
INSERT INTO `dbt_biding` (`id`, `bid_type`, `bid_price`, `bid_qty`, `bid_qty_available`, `total_amount`, `amount_available`, `coin_id`, `currency_symbol`, `market_id`, `market_symbol`, `user_id`, `open_order`, `fees_amount`, `status`, `trade_type`) VALUES ('3', 'BUY', '0.00021040', '1.00000000', '1.00000000', '0.00021040', '0.00021040', NULL, 'BDG', NULL, 'BDG_USD', 'D40BQB', '2023-01-05 07:29:39', '0.00000000', 2, NULL);
INSERT INTO `dbt_biding` (`id`, `bid_type`, `bid_price`, `bid_qty`, `bid_qty_available`, `total_amount`, `amount_available`, `coin_id`, `currency_symbol`, `market_id`, `market_symbol`, `user_id`, `open_order`, `fees_amount`, `status`, `trade_type`) VALUES ('4', 'BUY', '0.00021030', '1.00000000', '1.00000000', '0.00021030', '0.00021030', NULL, 'BDG', NULL, 'BDG_USD', 'D40BQB', '2023-01-05 07:29:46', '0.00000000', 2, NULL);
INSERT INTO `dbt_biding` (`id`, `bid_type`, `bid_price`, `bid_qty`, `bid_qty_available`, `total_amount`, `amount_available`, `coin_id`, `currency_symbol`, `market_id`, `market_symbol`, `user_id`, `open_order`, `fees_amount`, `status`, `trade_type`) VALUES ('5', 'BUY', '0.07445000', '10.00000000', '10.00000000', '0.74450000', '0.74450000', NULL, 'DOGE', NULL, 'DOGE_USD', 'D40BQB', '2023-01-05 07:31:19', '0.00000000', 2, NULL);
INSERT INTO `dbt_biding` (`id`, `bid_type`, `bid_price`, `bid_qty`, `bid_qty_available`, `total_amount`, `amount_available`, `coin_id`, `currency_symbol`, `market_id`, `market_symbol`, `user_id`, `open_order`, `fees_amount`, `status`, `trade_type`) VALUES ('6', 'BUY', '13.24000000', '11.00000000', '11.00000000', '145.64000000', '145.64000000', NULL, 'SOL', NULL, 'SOL_USD', 'D40BQB', '2023-01-05 07:31:34', '0.00000000', 2, NULL);


#
# TABLE STRUCTURE FOR: dbt_biding_log
#

DROP TABLE IF EXISTS `dbt_biding_log`;

CREATE TABLE `dbt_biding_log` (
  `log_id` bigint NOT NULL AUTO_INCREMENT,
  `bid_id` bigint NOT NULL,
  `bid_type` varchar(10) NOT NULL,
  `bid_price` double(19,8) NOT NULL,
  `complete_qty` double(19,8) NOT NULL,
  `complete_amount` double(19,8) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `coin_id` varchar(100) DEFAULT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `market_id` int DEFAULT NULL,
  `market_symbol` varchar(100) NOT NULL,
  `success_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fees_amount` double(19,8) NOT NULL,
  `available_amount` double(19,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `trade_type` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

INSERT INTO `dbt_biding_log` (`log_id`, `bid_id`, `bid_type`, `bid_price`, `complete_qty`, `complete_amount`, `user_id`, `coin_id`, `currency_symbol`, `market_id`, `market_symbol`, `success_time`, `fees_amount`, `available_amount`, `status`, `trade_type`) VALUES ('1', '1', 'BUY', '0.00021050', '10.00000000', '0.00210500', 'D40BQB', NULL, 'BDG', NULL, 'BDG_USD', '2023-01-05 00:09:31', '0.00000000', '0.00000000', 0, NULL);
INSERT INTO `dbt_biding_log` (`log_id`, `bid_id`, `bid_type`, `bid_price`, `complete_qty`, `complete_amount`, `user_id`, `coin_id`, `currency_symbol`, `market_id`, `market_symbol`, `success_time`, `fees_amount`, `available_amount`, `status`, `trade_type`) VALUES ('2', '2', 'BUY', '0.00021050', '7125890.73634204', '1500.00000000', 'D40BQB', NULL, 'BDG', NULL, 'BDG_USD', '2023-01-05 00:22:17', '0.00000000', '0.00000000', 0, NULL);


#
# TABLE STRUCTURE FOR: dbt_blocklist
#

DROP TABLE IF EXISTS `dbt_blocklist`;

CREATE TABLE `dbt_blocklist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ip_mail` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: dbt_chat
#

DROP TABLE IF EXISTS `dbt_chat`;

CREATE TABLE `dbt_chat` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` varchar(10) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: dbt_coinhistory
#

DROP TABLE IF EXISTS `dbt_coinhistory`;

CREATE TABLE `dbt_coinhistory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `coin_symbol` varchar(100) NOT NULL,
  `market_symbol` varchar(100) NOT NULL,
  `last_price` double(19,8) NOT NULL,
  `total_coin_supply` double(19,8) NOT NULL,
  `price_high_1h` double(19,8) NOT NULL,
  `price_low_1h` double(19,8) NOT NULL,
  `price_change_1h` double(19,8) NOT NULL,
  `volume_1h` double(19,8) NOT NULL,
  `price_high_24h` double(19,8) NOT NULL,
  `price_low_24h` double(19,8) NOT NULL,
  `price_change_24h` double(19,8) NOT NULL,
  `volume_24h` double(19,8) NOT NULL,
  `open` double(19,8) NOT NULL,
  `close` double(19,8) NOT NULL,
  `volumefrom` double(19,8) NOT NULL,
  `volumeto` double(19,8) NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: dbt_coinpair
#

DROP TABLE IF EXISTS `dbt_coinpair`;

CREATE TABLE `dbt_coinpair` (
  `id` int NOT NULL AUTO_INCREMENT,
  `market_id` int DEFAULT NULL,
  `market_symbol` varchar(100) NOT NULL,
  `coin_id` int DEFAULT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `symbol` varchar(100) NOT NULL,
  `pair_type` varchar(55) DEFAULT NULL,
  `initial_price` double(19,8) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `isDefault` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `symbol` (`symbol`),
  UNIQUE KEY `symbol_2` (`symbol`),
  KEY `isDefault` (`isDefault`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;

INSERT INTO `dbt_coinpair` (`id`, `market_id`, `market_symbol`, `coin_id`, `currency_symbol`, `name`, `full_name`, `symbol`, `pair_type`, `initial_price`, `status`, `isDefault`) VALUES (1, NULL, 'USD', NULL, 'DOGE', 'USD', 'Dogecoin / USD ', 'DOGE_USD', NULL, NULL, 1, 0);
INSERT INTO `dbt_coinpair` (`id`, `market_id`, `market_symbol`, `coin_id`, `currency_symbol`, `name`, `full_name`, `symbol`, `pair_type`, `initial_price`, `status`, `isDefault`) VALUES (2, NULL, 'USD', NULL, 'BUSD', 'USD', 'Binance-Peg BUSD Token / USD ', 'BUSD_USD', NULL, NULL, 1, 0);
INSERT INTO `dbt_coinpair` (`id`, `market_id`, `market_symbol`, `coin_id`, `currency_symbol`, `name`, `full_name`, `symbol`, `pair_type`, `initial_price`, `status`, `isDefault`) VALUES (3, NULL, 'USD', NULL, 'ETH', 'USD', 'Ethereum / USD ', 'ETH_USD', NULL, NULL, 1, 0);
INSERT INTO `dbt_coinpair` (`id`, `market_id`, `market_symbol`, `coin_id`, `currency_symbol`, `name`, `full_name`, `symbol`, `pair_type`, `initial_price`, `status`, `isDefault`) VALUES (4, NULL, 'USD', NULL, 'BTC', 'USD', 'BitCoin / USD ', 'BTC_USD', NULL, NULL, 1, 0);
INSERT INTO `dbt_coinpair` (`id`, `market_id`, `market_symbol`, `coin_id`, `currency_symbol`, `name`, `full_name`, `symbol`, `pair_type`, `initial_price`, `status`, `isDefault`) VALUES (5, NULL, 'USD', NULL, 'USDC', 'USD', 'USD Coin / Tether Coin', 'USDC_USD', NULL, NULL, 1, 0);
INSERT INTO `dbt_coinpair` (`id`, `market_id`, `market_symbol`, `coin_id`, `currency_symbol`, `name`, `full_name`, `symbol`, `pair_type`, `initial_price`, `status`, `isDefault`) VALUES (6, NULL, 'USD', NULL, 'SHIB', 'USD', 'Shiba Inu / USD', 'SHIB_USD', NULL, NULL, 1, 0);
INSERT INTO `dbt_coinpair` (`id`, `market_id`, `market_symbol`, `coin_id`, `currency_symbol`, `name`, `full_name`, `symbol`, `pair_type`, `initial_price`, `status`, `isDefault`) VALUES (7, NULL, 'USD', NULL, 'SOL', 'USD', 'Solana / USD', 'SOL_USD', NULL, NULL, 1, 0);
INSERT INTO `dbt_coinpair` (`id`, `market_id`, `market_symbol`, `coin_id`, `currency_symbol`, `name`, `full_name`, `symbol`, `pair_type`, `initial_price`, `status`, `isDefault`) VALUES (8, NULL, 'USD', NULL, 'WBNB', 'USD', 'BNB/USD', 'WBNB_USD', NULL, NULL, 1, 0);
INSERT INTO `dbt_coinpair` (`id`, `market_id`, `market_symbol`, `coin_id`, `currency_symbol`, `name`, `full_name`, `symbol`, `pair_type`, `initial_price`, `status`, `isDefault`) VALUES (9, NULL, 'LTC', NULL, 'XRP', 'LTC', 'XRP/LTC', 'XRP_LTC', NULL, NULL, 1, 0);
INSERT INTO `dbt_coinpair` (`id`, `market_id`, `market_symbol`, `coin_id`, `currency_symbol`, `name`, `full_name`, `symbol`, `pair_type`, `initial_price`, `status`, `isDefault`) VALUES (10, NULL, 'LTC', NULL, 'ADA', 'LTC', 'Cardano / LTC', 'ADA_LTC', NULL, NULL, 1, 0);
INSERT INTO `dbt_coinpair` (`id`, `market_id`, `market_symbol`, `coin_id`, `currency_symbol`, `name`, `full_name`, `symbol`, `pair_type`, `initial_price`, `status`, `isDefault`) VALUES (11, NULL, 'LTC', NULL, 'MATIC', 'LTC', 'MATIC / LTC', 'MATIC_LTC', NULL, NULL, 1, 0);
INSERT INTO `dbt_coinpair` (`id`, `market_id`, `market_symbol`, `coin_id`, `currency_symbol`, `name`, `full_name`, `symbol`, `pair_type`, `initial_price`, `status`, `isDefault`) VALUES (12, NULL, 'LTC', NULL, 'AVAX', 'LTC', 'AVAX / LTC', 'AVAX_LTC', NULL, NULL, 1, 0);
INSERT INTO `dbt_coinpair` (`id`, `market_id`, `market_symbol`, `coin_id`, `currency_symbol`, `name`, `full_name`, `symbol`, `pair_type`, `initial_price`, `status`, `isDefault`) VALUES (13, NULL, 'LTC', NULL, 'DOT', 'LTC', 'Polkadot / LTC', 'DOT_LTC', NULL, NULL, 1, 0);
INSERT INTO `dbt_coinpair` (`id`, `market_id`, `market_symbol`, `coin_id`, `currency_symbol`, `name`, `full_name`, `symbol`, `pair_type`, `initial_price`, `status`, `isDefault`) VALUES (14, NULL, 'LTC', NULL, 'SAND', 'LTC', ' The Sandbox / LTC', 'SAND_LTC', NULL, NULL, 1, 0);
INSERT INTO `dbt_coinpair` (`id`, `market_id`, `market_symbol`, `coin_id`, `currency_symbol`, `name`, `full_name`, `symbol`, `pair_type`, `initial_price`, `status`, `isDefault`) VALUES (15, NULL, 'DOGE', NULL, 'CRV', 'USDT', 'Curve DAO Token / DOGE', 'CRV_DOGE', NULL, NULL, 1, 0);
INSERT INTO `dbt_coinpair` (`id`, `market_id`, `market_symbol`, `coin_id`, `currency_symbol`, `name`, `full_name`, `symbol`, `pair_type`, `initial_price`, `status`, `isDefault`) VALUES (16, NULL, 'DOGE', NULL, 'SRM', 'USDT', 'Serum / DOGE', 'SRM_DOGE', NULL, NULL, 1, 0);
INSERT INTO `dbt_coinpair` (`id`, `market_id`, `market_symbol`, `coin_id`, `currency_symbol`, `name`, `full_name`, `symbol`, `pair_type`, `initial_price`, `status`, `isDefault`) VALUES (17, NULL, 'DOGE', NULL, 'EOS', 'USDT', 'eosnetwork  / DOGE', 'EOS_DOGE', NULL, NULL, 1, 0);
INSERT INTO `dbt_coinpair` (`id`, `market_id`, `market_symbol`, `coin_id`, `currency_symbol`, `name`, `full_name`, `symbol`, `pair_type`, `initial_price`, `status`, `isDefault`) VALUES (18, NULL, 'DOGE', NULL, 'FIL', 'USDT', 'Filecoin / DOGE', 'FIL_DOGE', NULL, NULL, 1, 0);
INSERT INTO `dbt_coinpair` (`id`, `market_id`, `market_symbol`, `coin_id`, `currency_symbol`, `name`, `full_name`, `symbol`, `pair_type`, `initial_price`, `status`, `isDefault`) VALUES (19, NULL, 'DOGE', NULL, 'GALA', 'USDT', 'Gala / DOGE', 'GALA_DOGE', NULL, NULL, 1, 0);
INSERT INTO `dbt_coinpair` (`id`, `market_id`, `market_symbol`, `coin_id`, `currency_symbol`, `name`, `full_name`, `symbol`, `pair_type`, `initial_price`, `status`, `isDefault`) VALUES (20, NULL, 'BTC', NULL, 'MATIC', 'BTC', 'MATIC / BitCoin ', 'MATIC_BTC', NULL, NULL, 1, 0);
INSERT INTO `dbt_coinpair` (`id`, `market_id`, `market_symbol`, `coin_id`, `currency_symbol`, `name`, `full_name`, `symbol`, `pair_type`, `initial_price`, `status`, `isDefault`) VALUES (21, NULL, 'BTC', NULL, 'ADA', 'BTC', 'CARDANO / BitCoin BEP20 ', 'ADA_BTC', NULL, NULL, 1, 0);
INSERT INTO `dbt_coinpair` (`id`, `market_id`, `market_symbol`, `coin_id`, `currency_symbol`, `name`, `full_name`, `symbol`, `pair_type`, `initial_price`, `status`, `isDefault`) VALUES (22, NULL, 'BTC', NULL, 'SOL', 'BTC', 'SOLANA / BitCoin ', 'SOL_BTC', NULL, NULL, 1, 0);
INSERT INTO `dbt_coinpair` (`id`, `market_id`, `market_symbol`, `coin_id`, `currency_symbol`, `name`, `full_name`, `symbol`, `pair_type`, `initial_price`, `status`, `isDefault`) VALUES (23, NULL, 'BTC', NULL, 'ETH', 'BTC', 'Ethereum / BitCoin', 'ETH_BTC', NULL, NULL, 1, 0);
INSERT INTO `dbt_coinpair` (`id`, `market_id`, `market_symbol`, `coin_id`, `currency_symbol`, `name`, `full_name`, `symbol`, `pair_type`, `initial_price`, `status`, `isDefault`) VALUES (24, NULL, 'BTC', NULL, 'SAND', 'BTC', 'SAND / BitCoin ', 'SAND_BTC', NULL, NULL, 1, 0);
INSERT INTO `dbt_coinpair` (`id`, `market_id`, `market_symbol`, `coin_id`, `currency_symbol`, `name`, `full_name`, `symbol`, `pair_type`, `initial_price`, `status`, `isDefault`) VALUES (25, NULL, 'BTC', NULL, 'CRV', 'BTC', 'Curve DAO Token / BitCoin ', 'CRV_BTC', NULL, NULL, 1, 0);
INSERT INTO `dbt_coinpair` (`id`, `market_id`, `market_symbol`, `coin_id`, `currency_symbol`, `name`, `full_name`, `symbol`, `pair_type`, `initial_price`, `status`, `isDefault`) VALUES (26, NULL, 'USD', NULL, 'BDG', 'USD', 'BDG/USD', 'BDG_USD', NULL, '110.00000000', 1, 1);
INSERT INTO `dbt_coinpair` (`id`, `market_id`, `market_symbol`, `coin_id`, `currency_symbol`, `name`, `full_name`, `symbol`, `pair_type`, `initial_price`, `status`, `isDefault`) VALUES (27, NULL, 'TRX', NULL, 'BDG', 'BDTASK', 'SIMBCOIN SWAP', 'BDG_TRX', NULL, '1000.00000000', 1, 0);


#
# TABLE STRUCTURE FOR: dbt_country
#

DROP TABLE IF EXISTS `dbt_country`;

CREATE TABLE `dbt_country` (
  `id` int NOT NULL AUTO_INCREMENT,
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `nicename` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint DEFAULT NULL,
  `phonecode` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=254 DEFAULT CHARSET=utf8mb3;

INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (8, 'AQ', 'ANTARCTICA', 'Antarctica', 'ATA', NULL, 0);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, 0);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', 'IOT', NULL, 246);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (44, 'CN', 'CHINA', 'China', 'CHN', 156, 86);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', 'CXR', NULL, 61);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', 'CCK', NULL, 672);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 242);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (53, 'CI', 'COTE D\'IVOIRE', 'Cote D\'Ivoire', 'CIV', 384, 225);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, 0);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL, 0);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (99, 'IN', 'INDIA', 'India', 'IND', 356, 91);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (112, 'KP', 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'Korea, Democratic People\'s Republic of', 'PRK', 408, 850);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (116, 'LA', 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', 'Lao People\'s Democratic Republic', 'LAO', 418, 856);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL, 269);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (168, 'PE', 'PERU', 'Peru', 'PER', 604, 51);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 70);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL, 381);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL, 670);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, 1);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (240, 'RS', 'SERBIA', 'Serbia', 'SRB', 688, 381);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (241, 'AP', 'ASIA PACIFIC REGION', 'Asia / Pacific Region', '0', 0, 0);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (242, 'ME', 'MONTENEGRO', 'Montenegro', 'MNE', 499, 382);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (243, 'AX', 'ALAND ISLANDS', 'Aland Islands', 'ALA', 248, 358);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (244, 'BQ', 'BONAIRE, SINT EUSTATIUS AND SABA', 'Bonaire, Sint Eustatius and Saba', 'BES', 535, 599);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (245, 'CW', 'CURACAO', 'Curacao', 'CUW', 531, 599);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (246, 'GG', 'GUERNSEY', 'Guernsey', 'GGY', 831, 44);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (247, 'IM', 'ISLE OF MAN', 'Isle of Man', 'IMN', 833, 44);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (248, 'JE', 'JERSEY', 'Jersey', 'JEY', 832, 44);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (249, 'XK', 'KOSOVO', 'Kosovo', '---', 0, 381);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (250, 'BL', 'SAINT BARTHELEMY', 'Saint Barthelemy', 'BLM', 652, 590);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (251, 'MF', 'SAINT MARTIN', 'Saint Martin', 'MAF', 663, 590);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (252, 'SX', 'SINT MAARTEN', 'Sint Maarten', 'SXM', 534, 1);
INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES (253, 'SS', 'SOUTH SUDAN', 'South Sudan', 'SSD', 728, 211);


#
# TABLE STRUCTURE FOR: dbt_cryptocoin
#

DROP TABLE IF EXISTS `dbt_cryptocoin`;

CREATE TABLE `dbt_cryptocoin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL,
  `user_id` varchar(55) DEFAULT NULL,
  `url` varchar(300) DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `symbol` varchar(100) NOT NULL,
  `decimal_value` varchar(55) DEFAULT NULL,
  `coin_name` varchar(100) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `algorithm` varchar(100) DEFAULT NULL,
  `proof_type` varchar(100) DEFAULT NULL,
  `show_home` int DEFAULT '0',
  `coin_position` int DEFAULT '0',
  `premined_value` varchar(100) DEFAULT NULL,
  `total_coins_freefloat` varchar(100) DEFAULT NULL,
  `rank` int DEFAULT NULL,
  `sponsored` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Id` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3;

INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (1, 1, NULL, NULL, 'upload/coinlist/1659957309_3866ca14ca6b8408d706.png', NULL, 'BTC', NULL, 'Bitcoin', 'Bitcoin', NULL, 'localcoin', 1, 1, NULL, NULL, 1, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (2, 2, NULL, NULL, 'upload/coinlist/1659957402_1159f53cc25ed8f36590.png', NULL, 'ETH', '18', 'Ethereum Token', 'Ethereum Token', '0x2170Ed0880ac9A755fd29B2688956BD959F933F8', 'bep20', 1, 2, NULL, NULL, 2, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (3, 3, NULL, NULL, 'upload/coinlist/1659957594_9ed9ae9a8e8b4cabb043.png', NULL, 'USDT', '6', 'Tether USD', 'Tether USD', '0xdac17f958d2ee523a2206206994597c13d831ec7', 'erc20', 1, 3, NULL, NULL, 3, '', 0);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (4, 4, NULL, NULL, 'upload/coinlist/1659957672_b482a157011f63318860.png', NULL, 'USDC', '6', 'USD Coin', 'USD Coin', '0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48', 'erc20', 1, 4, NULL, NULL, 4, '', 0);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (5, 5, NULL, NULL, 'upload/coinlist/1659957771_28ae9620b37a7b925e9f.png', NULL, 'BNB', '18', 'BNB', 'BNB', '0xB8c77482e45F1F44dE1745F52C74426C631bDD52', 'erc20', 1, 5, NULL, NULL, 5, '', 0);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (6, 6, NULL, NULL, 'upload/coinlist/1659957956_d0b35d697c6909e710ae.png', NULL, 'XRP', '18', 'XRP Token', 'XRP Token', '0x1d2f0da169ceb9fc7b3144628db156f3f6c60dbe', 'bep20', 1, 6, NULL, NULL, 6, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (7, 7, NULL, NULL, 'upload/coinlist/1659958008_4ec70d0b5195eb96ac6e.png', NULL, 'ADA', '18', 'Cardano Token', 'Cardano Token', '0x3ee2200efb3400fabb9aacf31297cbdd1d435d47', 'bep20', 1, 7, NULL, NULL, 7, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (8, 8, NULL, NULL, 'upload/coinlist/1659958141_b461d7db960be0dc91a1.png', NULL, 'SOL', '18', 'Solana.com', 'Solana.com', '0x55e7882346e220252aba2dbd08077613f318fe80', 'erc20', 1, 8, NULL, NULL, 8, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (9, 9, NULL, NULL, 'upload/coinlist/1659958394_8e3e25764aab2e1e595d.png', NULL, 'DOT', '18', 'Polkadot Token', 'Polkadot Token', '0x7083609fce4d1d8dc0c979aab8c869ea2c873402', 'bep20', 1, 9, NULL, NULL, 9, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (10, 10, NULL, NULL, 'upload/coinlist/1659958463_f1ab81730074b78f90ff.png', NULL, 'DOGE', '8', 'Dogecoin', 'Dogecoin', '0xba2ae424d960c26247dd6c32edc70b295c744c43', 'bep20', 1, 10, NULL, NULL, 10, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (11, 11, NULL, NULL, 'upload/coinlist/1659958622_560440c584cb03656d05.png', NULL, 'AVAX', '18', 'Avalanche', 'Avalanche', '0x93567d6b6553bde2b652fb7f197a229b93813d3f', 'erc20', 1, 11, NULL, NULL, 11, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (12, 12, NULL, NULL, 'upload/coinlist/1659958727_63978e4e2b0b9dc4fa28.png', NULL, 'MATIC', '18', 'Matic Token', 'Matic Token', '0x7D1AfA7B718fb893dB30A3aBc0Cfc608AaCfeBB0', 'erc20', 1, 12, NULL, NULL, 12, '', 0);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (13, 13, NULL, NULL, 'upload/coinlist/1659958774_5da4980213a45c8114c4.png', NULL, 'DAI', '18', 'Dai Stablecoin', 'Dai Stablecoin', '0x6b175474e89094c44da98b954eedeac495271d0f', 'erc20', 1, 13, NULL, NULL, 13, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (14, 14, NULL, NULL, 'upload/coinlist/1659958854_8d8d7da2494c302047cb.png', NULL, 'SHIB', '18', 'SHIBA INU', 'SHIBA INU', '0x95ad61b0a150d79219dcf64e1e6cc01f0b64c4ce', 'erc20', 1, 14, NULL, NULL, 14, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (15, 15, NULL, NULL, 'upload/coinlist/1659958931_e195ea80cae07806b14b.png', NULL, 'SHIB', '18', 'SHIBA INU (Wormhole)', 'SHIBA INU (Wormhole)', '0xb1547683DA678f2e1F003A780143EC10Af8a832B', 'bep20', 0, 14, NULL, NULL, 15, '', 0);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (16, 16, NULL, NULL, 'upload/coinlist/1659959047_44a973f81944863ac75d.png', NULL, 'UNI', '18', 'Uniswap', 'Uniswap', '0x1f9840a85d5af5bf1d1762f925bdaddc4201f984', 'erc20', 1, 15, NULL, NULL, 16, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (17, 17, NULL, NULL, 'upload/coinlist/1659959209_b1e0803e5dd21c36351e.png', NULL, 'TRX', '18', 'TRON', 'TRON', '0x85eac5ac2f758618dfa09bdbe0cf174e7d574d5b', 'bep20', 1, 17, NULL, NULL, 17, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (18, 18, NULL, NULL, 'upload/coinlist/1659959247_e27422dce3047dcaf202.png', NULL, 'USD', NULL, 'US Dollar', 'US Dollar', NULL, 'fiat', 0, 18, NULL, NULL, 18, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (19, 19, NULL, NULL, 'upload/coinlist/1659959352_cde84ec9b2a5ae8267d7.png', NULL, 'WBTC', '8', 'Wrapped BTC', 'Wrapped BTC', '0x2260fac5e5542a773aa44fbcfedf7c193bc2c599', 'erc20', 1, 19, NULL, NULL, 19, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (20, 20, NULL, NULL, 'upload/coinlist/1659959498_c595c99129af9537d220.png', NULL, 'ETC', '18', 'Ethereum Classic', 'Ethereum Classic', '0x3d6545b08693dae087e957cb1180ee38b9e3c25e', 'bep20', 1, 20, NULL, NULL, 20, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (21, 21, NULL, NULL, 'upload/coinlist/1659959551_9a9204c77a043c20427a.png', NULL, 'LEO', '18', 'Bitfinex LEO Token', 'Bitfinex LEO Token', '0x2af5d2ad76741191d15dfe7bf6ac92d4bd912ca3', 'erc20', 1, 21, NULL, NULL, 21, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (22, 22, NULL, NULL, 'upload/coinlist/1659959680_1c1f2377d4eaa466cf0c.png', NULL, 'LTC', '18', 'Litecoin Token', 'Litecoin Token', '0x4338665CBB7B2485A8855A139b75D5e34AB0DB94', 'bep20', 1, 22, NULL, NULL, 22, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (23, 23, NULL, NULL, 'upload/coinlist/1659959962_709fdafd2a6eba980e12.png', NULL, 'NEAR', '18', 'NEAR Protocol', 'NEAR Protocol', '0x1fa4a73a3f0133f0025378af00236f3abdee5d63', 'bep20', 1, 24, NULL, NULL, 24, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (24, 24, NULL, NULL, 'upload/coinlist/1659960014_7a66b9b1f4971f9ebef5.png', NULL, 'LINK', '18', 'ChainLink Token', 'ChainLink Token', '0x514910771af9ca656af840dff83e8264ecf986ca', 'erc20', 1, 25, NULL, NULL, 25, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (25, 25, NULL, NULL, 'upload/coinlist/1659960090_4df641c7a9456918973d.png', NULL, 'CRO', '8', 'CRO', 'CRO', '0xa0b73e1ff0b80914ab6fe0444e65848c4c34450b', 'erc20', 1, 26, NULL, NULL, 26, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (26, 26, NULL, NULL, 'upload/coinlist/1659960419_ab200b7aa7688a219264.png', NULL, 'AVATAR', '8', 'AVATAR', 'AVATAR', '0x668b65875a62b064085a852adc0cfd0e952e7fa9', 'bep20', 0, 27, NULL, NULL, 27, '', 0);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (27, 27, '1NFIHW', 'https://bscscan.com/token/images/busd_32.png', 'upload/coinlist/1660307603_1c8443050425f1276662.png', 'BUSD Token', 'BUSD', '18', 'BUSD Token', 'BUSD Token', '0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56', 'bep20', 1, 28, NULL, NULL, 28, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (28, 28, NULL, NULL, 'upload/coinlist/1660307541_33f775a177295d383430.png', NULL, 'TIMUSD', '18', 'TrueInternetMoney-Peg TIMUSD Token', 'TrueInternetMoney-Peg TIMUSD Token', '0x18F480fb7E1Bf79f9ca21Ed78cB84569caD96643', 'bep20', 1, 29, NULL, NULL, 29, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (29, 29, NULL, NULL, 'upload/coinlist/1660605341_55b5bd3b12c25a90324f.png', NULL, 'MANA', '18', 'Decentraland MANA', 'Decentraland MANA', '0x0F5D2fB29fb7d3CFeE444a200298f468908cC942', 'erc20', 1, 29, NULL, NULL, 29, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (30, 30, NULL, NULL, 'upload/coinlist/1660606211_e15bc5907867b4c1fb44.png', NULL, 'GALA', '8', 'Gala', 'Gala', '0x15D4c048F83bd7e37d49eA4C83a07267Ec4203dA', 'erc20', 1, 30, NULL, NULL, 30, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (31, 31, NULL, NULL, 'upload/coinlist/1660606630_c47634886f5c1492d0a6.png', NULL, 'FIL', '18', 'Filecoin', 'Filecoin', '0x0D8Ce2A99Bb6e3B7Db580eD848240e4a0F9aE153', 'bep20', 1, 31, NULL, NULL, 31, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (32, 32, NULL, NULL, 'upload/coinlist/1660606925_449373d898be1a086ef1.png', NULL, 'EOS', '18', 'EOS Token', 'EOS Token', '0x56b6fB708fC5732DEC1Afc8D8556423A2EDcCbD6', 'bep20', 1, 32, NULL, NULL, 32, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (33, 33, NULL, NULL, 'upload/coinlist/1660607780_53b7124c24cd9f454a58.png', NULL, 'SRM', '6', 'Serum', 'Serum', '0x476c5E26a75bd202a9683ffD34359C0CC15be0fF', 'erc20', 1, 33, NULL, NULL, 33, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (34, 34, NULL, NULL, 'upload/coinlist/1660608136_1a9ec2d18f261696a010.png', NULL, 'CRV', '18', 'Curve DAO Token', 'Curve DAO Token', '0xD533a949740bb3306d119CC777fa900bA034cd52', 'erc20', 1, 34, NULL, NULL, 34, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (35, 35, NULL, NULL, 'upload/coinlist/1660608454_94f72e250b835b397ed8.png', NULL, 'SAND', '18', 'SAND', 'SAND', '0x3845badAde8e6dFF049820680d1F14bD3903a5d0', 'erc20', 1, 35, NULL, NULL, 35, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (36, 36, NULL, NULL, 'upload/coinlist/1660609583_d6511a60c005121669cb.png', NULL, 'CHZ', '18', 'chiliZ', 'chiliZ', '0x3506424F91fD33084466F402d5D97f05F8e3b4AF', 'erc20', 1, 36, NULL, NULL, 36, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (37, 37, NULL, NULL, 'upload/coinlist/1660669095_1c3b3277a49bc3229e72.png', NULL, 'EURO', NULL, 'Euro', 'Euro', NULL, 'fiat', 0, 37, NULL, NULL, 37, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (38, 38, NULL, NULL, 'upload/coinlist/1660669245_e2f6c0d0eddfd117f4dd.png', NULL, 'GBP', NULL, 'Great British Pound', 'Great British Pound', NULL, 'fiat', 0, 38, NULL, NULL, 38, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (39, 39, NULL, NULL, 'upload/coinlist/1660670059_46b248acfb579e471dbb.jpg', NULL, 'CAD', NULL, 'Canadian Doller', 'Canadian Doller', NULL, 'fiat', 1, 39, NULL, NULL, 39, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (40, 40, NULL, NULL, 'upload/coinlist/1660669706_66e8fd82380d62f0c16e.png', NULL, 'AUD', NULL, 'Australian Doller', 'Australian Doller', NULL, 'fiat', 0, 40, NULL, NULL, 40, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (41, 41, NULL, NULL, 'upload/coinlist/1660692927_02000f7b0d4eccdd5e6f.png', NULL, 'WBNB', '18', 'Wrapped BNB', 'Wrapped BNB BEP20', '0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c', 'bep20', 0, 41, NULL, NULL, 41, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (42, 42, NULL, NULL, 'upload/coinlist/1660693215_24f1194b6aa0218b8eff.png', NULL, 'AVAX', '18', 'Avalanche', 'Avalanche', '0x1CE0c2827e2eF14D5C4f29a091d735A204794041', 'bep20', 0, 42, NULL, NULL, 42, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (43, 43, NULL, NULL, 'upload/coinlist/1660693450_dc048b7c4b1be4fb779f.png', NULL, 'MATIC', '18', 'Matic Token', 'Matic Token', '0xCC42724C6683B7E57334c4E856f4c9965ED682bD', 'bep20', 0, 43, NULL, NULL, 43, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (44, 44, NULL, NULL, 'upload/coinlist/1660693739_32ca10594c00188118b4.png', NULL, 'USDT', '18', 'Tether USD', 'Tether USD', '0x55d398326f99059fF775485246999027B3197955', 'bep20', 0, 44, NULL, NULL, 44, '', 0);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (45, 45, NULL, NULL, 'upload/coinlist/1660693910_245585cb7337e2c7c888.png', NULL, 'USDC', '18', 'USD Coin', 'USD Coin', '0x8AC76a51cc950d9822D68b83fE1Ad97B32Cd580d', 'bep20', 0, 45, NULL, NULL, 45, '', 1);
INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES (46, 46, NULL, NULL, 'upload/coinlist/1661410112_c6b60ffa5f2582b22726.png', NULL, 'BDG', '18', 'BitCoin Digital Gold', 'BitCoin Digital Gold', '0xEA8d0b55C3da2dA170eB2B2eE4039752c8D0fE64', 'bep20', 1, 0, NULL, NULL, 0, '', 1);


#
# TABLE STRUCTURE FOR: dbt_deposit
#

DROP TABLE IF EXISTS `dbt_deposit`;

CREATE TABLE `dbt_deposit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stripe_session_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(100) NOT NULL,
  `currency_id` int DEFAULT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `amount` double(19,8) NOT NULL,
  `token` varchar(150) DEFAULT NULL,
  `transaction_hash` varchar(150) DEFAULT NULL,
  `wallet_address` varchar(150) DEFAULT NULL,
  `wallet_balance` double(25,8) DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `method_id` varchar(50) NOT NULL,
  `fees_amount` double(19,8) NOT NULL,
  `comment` mediumtext,
  `deposit_date` datetime DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL COMMENT '  0=Pending, 1= gas fee send, 2=user to admin transfer, 3=deposit success, 4=cancel ',
  `ip` varchar(50) NOT NULL,
  `approved_cancel_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

INSERT INTO `dbt_deposit` (`id`, `stripe_session_id`, `user_id`, `currency_id`, `currency_symbol`, `amount`, `token`, `transaction_hash`, `wallet_address`, `wallet_balance`, `expire_date`, `method_id`, `fees_amount`, `comment`, `deposit_date`, `approved_date`, `update_date`, `status`, `ip`, `approved_cancel_by`) VALUES (1, 'cs_test_a1Z4hh1nw6pYkvliVGzr71MEXOI52cZsT0zwxGGbR6yVQoMX00QmCAYDaM', '4H3CM7', NULL, 'USD', '95000.00000000', NULL, NULL, NULL, NULL, NULL, 'stripe', '0.00000000', NULL, '2023-01-04 02:52:04', NULL, NULL, 3, '::1', NULL);
INSERT INTO `dbt_deposit` (`id`, `stripe_session_id`, `user_id`, `currency_id`, `currency_symbol`, `amount`, `token`, `transaction_hash`, `wallet_address`, `wallet_balance`, `expire_date`, `method_id`, `fees_amount`, `comment`, `deposit_date`, `approved_date`, `update_date`, `status`, `ip`, `approved_cancel_by`) VALUES (2, NULL, 'D40BQB', NULL, 'USDC', '100000.00000000', NULL, NULL, NULL, NULL, NULL, 'admin', '0.00000000', 'testing ', '2023-01-04 23:49:04', '2023-01-04 23:49:04', NULL, 3, '192.168.1.203', 'admin');
INSERT INTO `dbt_deposit` (`id`, `stripe_session_id`, `user_id`, `currency_id`, `currency_symbol`, `amount`, `token`, `transaction_hash`, `wallet_address`, `wallet_balance`, `expire_date`, `method_id`, `fees_amount`, `comment`, `deposit_date`, `approved_date`, `update_date`, `status`, `ip`, `approved_cancel_by`) VALUES (3, 'cs_test_a1pOr32P29KMoUdy0ZUGO9tnaPEGu1LpUHD9rfx02h5LSo1KDb3b92P9ur', 'D40BQB', NULL, 'USD', '500.00000000', NULL, NULL, NULL, NULL, NULL, 'stripe', '0.00000000', NULL, '2023-01-04 23:56:04', NULL, NULL, 3, '192.168.1.173', NULL);
INSERT INTO `dbt_deposit` (`id`, `stripe_session_id`, `user_id`, `currency_id`, `currency_symbol`, `amount`, `token`, `transaction_hash`, `wallet_address`, `wallet_balance`, `expire_date`, `method_id`, `fees_amount`, `comment`, `deposit_date`, `approved_date`, `update_date`, `status`, `ip`, `approved_cancel_by`) VALUES (4, NULL, 'D40BQB', NULL, 'USD', '1000.00000000', NULL, NULL, NULL, NULL, NULL, 'paypal', '0.00000000', NULL, '2023-01-04 23:56:58', NULL, NULL, 3, '192.168.1.173', NULL);


#
# TABLE STRUCTURE FOR: dbt_fees
#

DROP TABLE IF EXISTS `dbt_fees`;

CREATE TABLE `dbt_fees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `level` varchar(100) NOT NULL,
  `fees` double NOT NULL,
  `currency_id` int NOT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

INSERT INTO `dbt_fees` (`id`, `level`, `fees`, `currency_id`, `currency_symbol`, `status`) VALUES (2, 'BUY', '10', 0, 'BTC', 1);
INSERT INTO `dbt_fees` (`id`, `level`, `fees`, `currency_id`, `currency_symbol`, `status`) VALUES (3, 'BUY', '10', 0, 'ETH', 1);


#
# TABLE STRUCTURE FOR: dbt_market
#

DROP TABLE IF EXISTS `dbt_market`;

CREATE TABLE `dbt_market` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `full_name` varchar(300) NOT NULL,
  `symbol` varchar(50) NOT NULL,
  `market_type` varchar(55) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

INSERT INTO `dbt_market` (`id`, `name`, `full_name`, `symbol`, `market_type`, `status`) VALUES (1, 'BTC', 'BTC Market', 'BTC', NULL, 1);
INSERT INTO `dbt_market` (`id`, `name`, `full_name`, `symbol`, `market_type`, `status`) VALUES (2, 'USD', 'USDT Market', 'USD', NULL, 1);
INSERT INTO `dbt_market` (`id`, `name`, `full_name`, `symbol`, `market_type`, `status`) VALUES (3, 'LTC', 'LTC Market', 'LTC', NULL, 1);
INSERT INTO `dbt_market` (`id`, `name`, `full_name`, `symbol`, `market_type`, `status`) VALUES (4, 'Doge', 'Dogecoin Market', 'DOGE', NULL, 1);
INSERT INTO `dbt_market` (`id`, `name`, `full_name`, `symbol`, `market_type`, `status`) VALUES (5, 'TEST', 'TEST', 'TRX', NULL, 1);


#
# TABLE STRUCTURE FOR: dbt_network_type
#

DROP TABLE IF EXISTS `dbt_network_type`;

CREATE TABLE `dbt_network_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `heading` varchar(50) DEFAULT NULL,
  `identifire` varchar(50) NOT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

INSERT INTO `dbt_network_type` (`id`, `heading`, `identifire`, `slug`, `status`) VALUES (1, 'Local Coin', 'localcoin', 'cointype', 1);
INSERT INTO `dbt_network_type` (`id`, `heading`, `identifire`, `slug`, `status`) VALUES (4, 'Crypto Deposit', 'crypto_deposit', 'deposit_type', 1);
INSERT INTO `dbt_network_type` (`id`, `heading`, `identifire`, `slug`, `status`) VALUES (5, 'Fiat Deposit', 'fiat_deposit', 'deposit_type', 1);
INSERT INTO `dbt_network_type` (`id`, `heading`, `identifire`, `slug`, `status`) VALUES (9, 'Crypto Currency', 'crypto_currency', 'withdraw_type', 1);
INSERT INTO `dbt_network_type` (`id`, `heading`, `identifire`, `slug`, `status`) VALUES (10, 'Fiat Currency', 'fiat_currency', 'withdraw_type', 1);
INSERT INTO `dbt_network_type` (`id`, `heading`, `identifire`, `slug`, `status`) VALUES (11, 'Fiat Currency', 'fiat', 'cointype', 1);


#
# TABLE STRUCTURE FOR: dbt_payout_method
#

DROP TABLE IF EXISTS `dbt_payout_method`;

CREATE TABLE `dbt_payout_method` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(250) NOT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `method` varchar(250) NOT NULL,
  `wallet_id` text NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

INSERT INTO `dbt_payout_method` (`id`, `user_id`, `currency_symbol`, `method`, `wallet_id`, `status`) VALUES (1, 'D40BQB', 'BTC', 'payeer', 'dad', 1);
INSERT INTO `dbt_payout_method` (`id`, `user_id`, `currency_symbol`, `method`, `wallet_id`, `status`) VALUES (2, 'D40BQB', 'USD', 'payeer', 'dad', 1);
INSERT INTO `dbt_payout_method` (`id`, `user_id`, `currency_symbol`, `method`, `wallet_id`, `status`) VALUES (3, 'D40BQB', 'USD', 'stripe', 'sss', 1);


#
# TABLE STRUCTURE FOR: dbt_security
#

DROP TABLE IF EXISTS `dbt_security`;

CREATE TABLE `dbt_security` (
  `id` int NOT NULL AUTO_INCREMENT,
  `keyword` varchar(20) NOT NULL,
  `data` mediumtext NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

INSERT INTO `dbt_security` (`id`, `keyword`, `data`, `status`) VALUES (1, 'url', '{\"url\":\"http:\\/\\/localhost\\/tradebox_ci4_final_test\\/\"}', 0);
INSERT INTO `dbt_security` (`id`, `keyword`, `data`, `status`) VALUES (2, 'login', '{\"duration\":\"30\",\"wrong_try\":\"3\",\"ip_block\":\"3\"}', 0);
INSERT INTO `dbt_security` (`id`, `keyword`, `data`, `status`) VALUES (3, 'https', '{\"cookie_secure\":0,\"cookie_http\":0}', 0);
INSERT INTO `dbt_security` (`id`, `keyword`, `data`, `status`) VALUES (4, 'xss_filter', '', 0);
INSERT INTO `dbt_security` (`id`, `keyword`, `data`, `status`) VALUES (5, 'csrf_token', '', 1);
INSERT INTO `dbt_security` (`id`, `keyword`, `data`, `status`) VALUES (6, 'capture', '{\"site_key\":\"6Lddh0AUAAAAAJm25vFsAOOG0Hixa1ZVg17jQ9ca\",\"secret_key\":\"6Lddh0AUAAAAAHNQXul04PdL7ponU4N9QiKywGt-\"}', 0);
INSERT INTO `dbt_security` (`id`, `keyword`, `data`, `status`) VALUES (7, 'sms', '', 0);
INSERT INTO `dbt_security` (`id`, `keyword`, `data`, `status`) VALUES (8, 'encryption', '', 0);
INSERT INTO `dbt_security` (`id`, `keyword`, `data`, `status`) VALUES (9, 'password', '', 0);
INSERT INTO `dbt_security` (`id`, `keyword`, `data`, `status`) VALUES (10, 'email', '', 0);


#
# TABLE STRUCTURE FOR: dbt_sms_email_template
#

DROP TABLE IF EXISTS `dbt_sms_email_template`;

CREATE TABLE `dbt_sms_email_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sms_or_email` varchar(10) NOT NULL,
  `template_name` varchar(50) NOT NULL,
  `subject_en` text NOT NULL,
  `subject_fr` text NOT NULL,
  `template_en` text NOT NULL,
  `template_fr` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;

INSERT INTO `dbt_sms_email_template` (`id`, `sms_or_email`, `template_name`, `subject_en`, `subject_fr`, `template_en`, `template_fr`) VALUES (1, 'sms', 'transfer_verification', 'Transfer Verification Code', 'Code de vérification de transfert', 'Welcome to Tradebox\r\nYou are about to transfer %amount% to the account %receiver_id%\r\nYour code is: %code%', 'Bienvenue à la Tradebox \r\nVous êtes sur le point de transférer %amount% au compte %receiver_id%\r\nVotre code est: %code%');
INSERT INTO `dbt_sms_email_template` (`id`, `sms_or_email`, `template_name`, `subject_en`, `subject_fr`, `template_en`, `template_fr`) VALUES (2, 'email', 'transfer_verification', 'Transfer Verification', 'Vérification du transfert', 'Welcome to Tradebox\r\nYou are about to transfer %amount% to the account %receiver_id%\r\nYour code is: %varify_code%', 'Bienvenue à la Tradebox\r\nVous êtes sur le point de transférer %amount% au compte %receiver_id%\r\nVotre code est: %varify_code%');
INSERT INTO `dbt_sms_email_template` (`id`, `sms_or_email`, `template_name`, `subject_en`, `subject_fr`, `template_en`, `template_fr`) VALUES (3, 'sms', 'transfer_success', 'Confirm Transfer', 'Confirmer le transfert', 'Welcome to Tradebox\r\nYou have successfully transferred the amount $%amount% to the account %receiver_id%.\r\nYour new balance is %new_balance%', 'Bienvenue à la Tradebox\r\nVous avez transféré le montant avec succès $%amount% au compte %receiver_id%.\r\nVotre nouveau solde est %new_balance%');
INSERT INTO `dbt_sms_email_template` (`id`, `sms_or_email`, `template_name`, `subject_en`, `subject_fr`, `template_en`, `template_fr`) VALUES (4, 'email', 'transfer_success', 'Confirm Transfer', 'Confirmer le transfert', 'Welcome to Tradebox\r\nYou have successfully transferred the amount $%amount% to the account %receiver_id%.\r\nYour new balance is %new_balance%', 'Bienvenue à la Tradebox\r\nVous avez transféré avec succès le montant $%amount% au compte %receiver_id%.\r\nVotre nouveau solde est %new_balance%');
INSERT INTO `dbt_sms_email_template` (`id`, `sms_or_email`, `template_name`, `subject_en`, `subject_fr`, `template_en`, `template_fr`) VALUES (5, 'sms', 'withdraw_verification', 'Verifying Withdrawal', 'Vérification du retrait', 'Welcome to Tradebox  \r\nYou are about to withdraw the amount: %amount%\r\nVerification code: %varify_code%', 'Bienvenue à la Tradebox  \r\nVous êtes sur le point de retirer le montant: %amount%\r\nLe code de vérification %varify_code%');
INSERT INTO `dbt_sms_email_template` (`id`, `sms_or_email`, `template_name`, `subject_en`, `subject_fr`, `template_en`, `template_fr`) VALUES (6, 'email', 'withdraw_verification', 'Verifying Withdrawal', 'Vérification du retrait', 'Welcome to Tradebox  \r\nYou are about to withdraw the amount: %amount%\r\nVerification code: %varify_code%', 'Bienvenue à la Tradebox  \r\nVous êtes sur le point de retirer le montant: %amount%\r\nLe code de vérification %varify_code%');
INSERT INTO `dbt_sms_email_template` (`id`, `sms_or_email`, `template_name`, `subject_en`, `subject_fr`, `template_en`, `template_fr`) VALUES (7, 'sms', 'withdraw_success', 'Withdraw Successful', 'Retrait réussi', 'Welcome to Tradebox\r\nHi, %name% You have successfully withdrawn the amount $%amount% from your account.\r\nYour new balance is $%new_balance%', 'Bienvenue à la Tradebox\r\nSalut, %name% Vous avez retiré avec succès le montant $%amount% depuis votre compte.\r\nVotre nouveau solde est $%new_balance%');
INSERT INTO `dbt_sms_email_template` (`id`, `sms_or_email`, `template_name`, `subject_en`, `subject_fr`, `template_en`, `template_fr`) VALUES (8, 'email', 'withdraw_success', 'Withdraw Successful', 'Retrait réussi', 'Welcome to Tradebox\r\nHi, %name% You have successfully withdrawn the amount $%amount% from your account.\r\nYour new balance is $%new_balance%', 'Bienvenue à la Tradebox\r\nSalut, %name% Vous avez retiré avec succès le montant $%amount% depuis votre compte.\r\nVotre nouveau solde est $%new_balance%');
INSERT INTO `dbt_sms_email_template` (`id`, `sms_or_email`, `template_name`, `subject_en`, `subject_fr`, `template_en`, `template_fr`) VALUES (9, 'email', 'forgot_password', 'Reset Password', 'Réinitialiser le mot de passe', 'Welcome to Tradebox\r\nTo reset your password, please enter the verification code given below:\r\nVerification Code: %varify_code%\r\n\r\nIf you did not request to reset your password, please contact us with full details at support@trueinternetmoney.com', 'Bienvenue à la Tradebox\r\nPour réinitialiser votre mot de passe, veuillez entrer le code de vérification indiqué ci-dessous:\r\nLe code de vérification %varify_code%\r\n\r\nSi vous n&#39;avez pas demandé la réinitialisation de votre mot de passe, veuillez nous contacter avec tous les détails \r\nà support@trueinternetmoney.com');
INSERT INTO `dbt_sms_email_template` (`id`, `sms_or_email`, `template_name`, `subject_en`, `subject_fr`, `template_en`, `template_fr`) VALUES (10, 'sms', 'deposit_success', 'Deposit Successful', 'Dépôt réussi', 'Welcome to Tradebox\r\nHi, %name%\r\nYou have successfully deposited the amount %amount% at date %date%', 'Bienvenue à Tradebox\r\nSalut, %name%\r\nVous avez déposé le montant avec succès %amount% à ce jour %date%');
INSERT INTO `dbt_sms_email_template` (`id`, `sms_or_email`, `template_name`, `subject_en`, `subject_fr`, `template_en`, `template_fr`) VALUES (11, 'email', 'deposit_success', 'Deposit Successful', 'Dépôt réussi', 'Welcome to Tradebox\r\nHi, %name%\r\nYou have successfully deposited the amount %amount% at date %date%', 'Bienvenue à la Tradebox\r\nSalut, %name%\r\nVous avez déposé le montant avec succès %amount% à ce jour %date%');
INSERT INTO `dbt_sms_email_template` (`id`, `sms_or_email`, `template_name`, `subject_en`, `subject_fr`, `template_en`, `template_fr`) VALUES (12, 'email', 'registered', 'Welcome to Tradebox Account Activation', 'Account Activation', 'Welcome to Tradebox. <br/>\r\nYour account was created successfully Please click on the link below to activate your account.<br/>\r\n %url%\r\n<br/><br/>\r\nAfter verifying, please log in and click on: <br/>\r\n1. Account - Profile. Please enter all your details<br/>\r\n2. Account - Bank setup. Please enter all your details<br/>\r\n3. Account - Payout Setup. Please enter all your details<br/>\r\n4. In Profile, click on Verify Account, enter details the click on Submit\r\n', 'Bienvenue sur Tradebox.<br/>\r\nVotre compte a été créé avec succès Veuillez cliquer sur le lien ci-dessous pour activer votre compte.<br/>\r\n  %url%\r\n<br/><br/>\r\nAprès vérification, connectez-vous et cliquez sur :<br/>\r\n1. Compte - Profil. Veuillez saisir toutes vos coordonnées<br/>\r\n2. Compte - Configuration de la banque. Veuillez saisir toutes vos coordonnées<br/>\r\n3. Compte - Configuration du paiement. Veuillez saisir toutes vos coordonnées<br/>\r\n4. Dans Profil, cliquez sur Vérifier le compte, entrez les détails puis cliquez sur Soumettre\r\n');
INSERT INTO `dbt_sms_email_template` (`id`, `sms_or_email`, `template_name`, `subject_en`, `subject_fr`, `template_en`, `template_fr`) VALUES (13, 'sms', 'profile_verification', 'Verify Phone Number', 'Vérifier le numéro de téléphone', 'Welcome to Tradebox\r\nYou are about to verify your phone number.\r\nYour Verification Code %varify_code%', 'Bienvenue à la Tradebox\r\nVous êtes sur le point de vérifier votre numéro de téléphone.\r\nLe code de vérification: %varify_code%');
INSERT INTO `dbt_sms_email_template` (`id`, `sms_or_email`, `template_name`, `subject_en`, `subject_fr`, `template_en`, `template_fr`) VALUES (14, 'email', 'profile_verification', 'Verify Email Address', 'Vérifier l&#39;adresse e-mail', 'Welcome to Tradebox\r\nYou are about to verify your email address.\r\nVerification Code: %varify_code%', 'Bienvenue à la Tradebox\r\nVous êtes sur le point de vérifier votre adresse e-mail.\r\nLe code de vérification: %varify_code%');
INSERT INTO `dbt_sms_email_template` (`id`, `sms_or_email`, `template_name`, `subject_en`, `subject_fr`, `template_en`, `template_fr`) VALUES (15, 'email', 'kyc_verify_success', 'Kyc verify success', 'Kyc vérifie le succès', 'Thank you for verifying! Hi, %name% You are now our verified customer.', 'Merci d&#39;avoir vérifié! Salut, %name% Vous êtes maintenant notre client vérifié.');
INSERT INTO `dbt_sms_email_template` (`id`, `sms_or_email`, `template_name`, `subject_en`, `subject_fr`, `template_en`, `template_fr`) VALUES (16, 'email', 'kyc_verify_cancel', 'KYC Verification Cancelled', 'KYC Vérification Annulée', 'Sorry! Your document is not appropriate.\r\nHello, %name% please resend your original document.', 'Merci pour vos vérifications.\r\nSalut, %name% Vous êtes maintenant notre client vérifié.');
INSERT INTO `dbt_sms_email_template` (`id`, `sms_or_email`, `template_name`, `subject_en`, `subject_fr`, `template_en`, `template_fr`) VALUES (17, 'email', 'kyc_verify_success', 'Kyc verify success', 'Kyc vérifie le succès', 'Thank you for your verifications. Hi, %name% You are now our verified customer.', 'Merci pour vos vérifications. Salut, %name% Vous êtes maintenant notre client vérifié.');
INSERT INTO `dbt_sms_email_template` (`id`, `sms_or_email`, `template_name`, `subject_en`, `subject_fr`, `template_en`, `template_fr`) VALUES (18, 'email', 'kyc_verify_cancel', 'KYC verify cancel', 'KYC vérifier annuler', 'Pardon! Votre document n\'est pas approprié. Bonjour, %name% veuillez renvoyer votre document original.', 'Merci pour vos vérifications. Salut, %name% Vous êtes maintenant notre client vérifié.');


#
# TABLE STRUCTURE FOR: dbt_theme
#

DROP TABLE IF EXISTS `dbt_theme`;

CREATE TABLE `dbt_theme` (
  `id` int NOT NULL AUTO_INCREMENT,
  `settings` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

INSERT INTO `dbt_theme` (`id`, `settings`, `status`) VALUES (1, '{\"body_background_color\":\"#181113\",\"body_font_color\":\"#b7b8b8\",\"menu_bg_color\":\"#000000\",\"menu_font_color\":\"#cdcfd0\",\"footer_bg_color\":\"#202124\",\"footer_font_color\":\"#cdcfd0\",\"btn_bg_color\":\"#882052\",\"btn_font_color\":\"#cdcfd0\",\"top_footer_horizontal_border_color\":\"#202124\",\"footer_menu_border_color\":\"#202124\",\"bottom_footer_background_color\":\"#202124\",\"bottom_footer_font_color\":\"#d9d9d9\",\"theme_color\":\"#a1a7ad\",\"newslatter_bg\":\"#202124\",\"newslatter_font\":\"#939699\",\"form_background_color\":\"#0d0d0d\",\"form_border_color\":\"#262d34\",\"form_label_color\":\"#cdcfd0\",\"form_input_field_background_color\":\"#121d27\",\"input_field_border_color\":\"#262d34\",\"input_field_color\":\"#cdcfd0\"}', 1);


#
# TABLE STRUCTURE FOR: dbt_transaction_setup
#

DROP TABLE IF EXISTS `dbt_transaction_setup`;

CREATE TABLE `dbt_transaction_setup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trntype` varchar(20) NOT NULL,
  `acctype` varchar(20) NOT NULL,
  `currency_symbol` varchar(20) NOT NULL,
  `network_type` varchar(50) DEFAULT NULL,
  `lower` double(19,8) NOT NULL,
  `upper` double(19,8) NOT NULL,
  `duration` int NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

INSERT INTO `dbt_transaction_setup` (`id`, `trntype`, `acctype`, `currency_symbol`, `network_type`, `lower`, `upper`, `duration`, `status`) VALUES (2, 'DEPOSIT', 'VERIFIED', 'USD', '', '10.00000000', '95000.00000000', 7, 1);
INSERT INTO `dbt_transaction_setup` (`id`, `trntype`, `acctype`, `currency_symbol`, `network_type`, `lower`, `upper`, `duration`, `status`) VALUES (3, 'DEPOSIT', 'UNVERIFIED', 'USD', '', '20.00000000', '90000.00000000', 7, 1);
INSERT INTO `dbt_transaction_setup` (`id`, `trntype`, `acctype`, `currency_symbol`, `network_type`, `lower`, `upper`, `duration`, `status`) VALUES (4, 'WITHDRAW', 'VERIFIED', 'USD', '', '50.00000000', '10000.00000000', 7, 1);


#
# TABLE STRUCTURE FOR: dbt_transfer
#

DROP TABLE IF EXISTS `dbt_transfer`;

CREATE TABLE `dbt_transfer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender_user_id` varchar(255) DEFAULT NULL,
  `receiver_user_id` varchar(255) DEFAULT NULL,
  `amount` double(19,8) DEFAULT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `fees` double(19,8) NOT NULL,
  `request_ip` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `comments` longtext,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='client to client transfer success, request data recorded.';

#
# TABLE STRUCTURE FOR: dbt_user
#

DROP TABLE IF EXISTS `dbt_user`;

CREATE TABLE `dbt_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(300) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password_reset_token` varchar(300) DEFAULT NULL,
  `googleauth` varchar(100) DEFAULT NULL,
  `referral_id` varchar(100) DEFAULT NULL,
  `referral_status` tinyint(1) NOT NULL DEFAULT '0',
  `language` varchar(50) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `address` mediumtext,
  `bio` mediumtext,
  `image` varchar(300) DEFAULT NULL,
  `status` tinyint(1) NOT NULL COMMENT '"0=Deactivated account, 1=Activated account, 2=Pending account, 3=Suspend account"',
  `verified` int NOT NULL DEFAULT '0' COMMENT '0= did not submit info, 1= All verified, 2=Cancel, 3=processing, 4 = Only KYC Verified, 5 = Only Mobile Verified, 6 = Only Email Verified, 7 = KYC and Mobile Verified, 8 = KYC Email Verified, 9 = Email and Mobile  Verified, 10 = KYC Cancel and Phone  Verified, 11 = KYC Cancel and Email Verified, 12 = KYC processing and  Mobile  Verified, 13 = KYC processing and Email Verified, 14 = KYC Cancel and  Mobile not Verified, 15 = KYC Cancel and Email not Verified, 16 = KYC processing  and Mobile not Verified, 19 = KYC processing and Email not Verified, ',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_date` datetime DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

INSERT INTO `dbt_user` (`id`, `user_id`, `first_name`, `last_name`, `username`, `email`, `password`, `phone`, `password_reset_token`, `googleauth`, `referral_id`, `referral_status`, `language`, `country`, `city`, `address`, `bio`, `image`, `status`, `verified`, `created`, `created_date`, `ip`) VALUES (1, '4H3CM7', 'ABM', 'demouser', NULL, 'demo@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '+88012485454', NULL, NULL, '', 0, 'english', NULL, NULL, NULL, NULL, NULL, 1, 0, '2023-01-04 15:36:26', '2023-01-04 00:14:19', '::1');
INSERT INTO `dbt_user` (`id`, `user_id`, `first_name`, `last_name`, `username`, `email`, `password`, `phone`, `password_reset_token`, `googleauth`, `referral_id`, `referral_status`, `language`, `country`, `city`, `address`, `bio`, `image`, `status`, `verified`, `created`, `created_date`, `ip`) VALUES (2, 'D40BQB', 'hasnath H', 'rahman', NULL, 'hasnathwm@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', '01200812891', 'e4788ca62aca91a771d8f7c2223ca244', NULL, NULL, 0, 'english', NULL, NULL, NULL, 'nothing to say', 'upload/user/1672897102_7f14afadf9dae584b327.jpg', 1, 1, '2023-01-05 12:30:57', '2023-01-04 23:19:07', '192.168.1.203');
INSERT INTO `dbt_user` (`id`, `user_id`, `first_name`, `last_name`, `username`, `email`, `password`, `phone`, `password_reset_token`, `googleauth`, `referral_id`, `referral_status`, `language`, `country`, `city`, `address`, `bio`, `image`, `status`, `verified`, `created`, `created_date`, `ip`) VALUES (4, '8V05VI', 'bd', 'task', NULL, 'admin@emample.com', 'dbc92dfad8f93fd24e484ab9a17ccab3', '123421412', '61b3502d1f7e06b96e48b8091db62601', NULL, 'D40BQB', 0, 'english', NULL, NULL, NULL, NULL, NULL, 1, 1, '2023-01-05 12:19:10', '2023-01-05 00:17:21', '192.168.1.203');


#
# TABLE STRUCTURE FOR: dbt_user_log
#

DROP TABLE IF EXISTS `dbt_user_log`;

CREATE TABLE `dbt_user_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `log_type` varchar(50) NOT NULL COMMENT '"acc_update = User Account Update, login=User Login info, deposit=User Deposit info, transfer=User Transfer info, withdraw=User Withdraw info, open_order="',
  `access_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_agent` varchar(300) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `ip` varchar(50) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

INSERT INTO `dbt_user_log` (`log_id`, `log_type`, `access_time`, `user_agent`, `user_id`, `ip`) VALUES (1, 'login', '2023-01-04 01:16:48', '{\"device\":\"Edge\",\"browser\":\"Edge V-108.0.1462.54\",\"platform\":\"Windows 10\"}', '4H3CM7', '::1');
INSERT INTO `dbt_user_log` (`log_id`, `log_type`, `access_time`, `user_agent`, `user_id`, `ip`) VALUES (2, 'login', '2023-01-04 23:37:40', '{\"device\":\"Edge\",\"browser\":\"Edge V-108.0.1462.54\",\"platform\":\"Windows 10\"}', 'D40BQB', '192.168.1.203');
INSERT INTO `dbt_user_log` (`log_id`, `log_type`, `access_time`, `user_agent`, `user_id`, `ip`) VALUES (3, 'login', '2023-01-04 23:55:36', '{\"device\":\"Edge\",\"browser\":\"Edge V-108.0.1462.54\",\"platform\":\"Windows 10\"}', 'D40BQB', '192.168.1.173');
INSERT INTO `dbt_user_log` (`log_id`, `log_type`, `access_time`, `user_agent`, `user_id`, `ip`) VALUES (4, 'login', '2023-01-05 00:12:42', '{\"device\":\"Chrome\",\"browser\":\"Chrome V-108.0.0.0\",\"platform\":\"Windows 10\"}', 'D40BQB', '192.168.1.203');
INSERT INTO `dbt_user_log` (`log_id`, `log_type`, `access_time`, `user_agent`, `user_id`, `ip`) VALUES (5, 'login', '2023-01-05 00:19:46', '{\"device\":\"Chrome\",\"browser\":\"Chrome V-108.0.0.0\",\"platform\":\"Windows 10\"}', '8V05VI', '192.168.1.203');


#
# TABLE STRUCTURE FOR: dbt_user_verify_doc
#

DROP TABLE IF EXISTS `dbt_user_verify_doc`;

CREATE TABLE `dbt_user_verify_doc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `verify_type` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `id_number` varchar(300) NOT NULL,
  `document1` varchar(300) NOT NULL,
  `document2` varchar(300) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: dbt_verify
#

DROP TABLE IF EXISTS `dbt_verify`;

CREATE TABLE `dbt_verify` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(250) DEFAULT NULL,
  `session_id` varchar(250) DEFAULT NULL,
  `verify_code` varchar(250) DEFAULT NULL,
  `user_id` varchar(250) DEFAULT NULL,
  `data` text,
  `verify_type` varchar(10) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: dbt_withdraw
#

DROP TABLE IF EXISTS `dbt_withdraw`;

CREATE TABLE `dbt_withdraw` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `wallet_id` mediumtext NOT NULL,
  `currency_id` int DEFAULT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `method` varchar(50) NOT NULL,
  `fees_amount` double NOT NULL,
  `comment` varchar(300) DEFAULT NULL,
  `request_date` datetime DEFAULT NULL,
  `success_date` datetime DEFAULT NULL,
  `cancel_date` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0=Cancel request, 1=Approved request, 2=Pending request, 3 = processing',
  `ip` varchar(50) NOT NULL,
  `approved_cancel_by` varchar(100) DEFAULT NULL,
  `withdraw_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: earnings
#

DROP TABLE IF EXISTS `earnings`;

CREATE TABLE `earnings` (
  `earning_id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(250) NOT NULL,
  `Purchaser_id` varchar(250) DEFAULT NULL,
  `earning_type` varchar(45) NOT NULL,
  `package_id` varchar(250) DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `date` varchar(45) NOT NULL,
  `amount` varchar(45) NOT NULL,
  `comments` longtext,
  PRIMARY KEY (`earning_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Weekly ROI, Monthly ROI, team bonous, direct referal bonous';

#
# TABLE STRUCTURE FOR: email_sms_gateway
#

DROP TABLE IF EXISTS `email_sms_gateway`;

CREATE TABLE `email_sms_gateway` (
  `es_id` int NOT NULL AUTO_INCREMENT,
  `gatewayname` varchar(100) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `protocol` varchar(100) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `port` varchar(100) DEFAULT NULL,
  `user` varchar(100) DEFAULT NULL,
  `userid` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `sid` varchar(100) DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL,
  `number` varchar(25) DEFAULT NULL,
  `mailtype` varchar(100) DEFAULT NULL,
  `charset` varchar(100) DEFAULT NULL,
  `api` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`es_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

INSERT INTO `email_sms_gateway` (`es_id`, `gatewayname`, `title`, `protocol`, `host`, `port`, `user`, `userid`, `password`, `sid`, `token`, `number`, `mailtype`, `charset`, `api`) VALUES (1, 'nexmo', 'BDTASK LIMITED', NULL, NULL, NULL, NULL, NULL, 'TCtz6dx6s3G4nVQ1', NULL, NULL, NULL, NULL, NULL, '633b7084');
INSERT INTO `email_sms_gateway` (`es_id`, `gatewayname`, `title`, `protocol`, `host`, `port`, `user`, `userid`, `password`, `sid`, `token`, `number`, `mailtype`, `charset`, `api`) VALUES (2, 'smtp', 'Bbtask mail', 'smtp', 'smtp.mailtrap.io', '2525', '199a525b4e1f88', '', '06f4bb0c453f48', NULL, NULL, NULL, 'html', 'utf-8', NULL);


#
# TABLE STRUCTURE FOR: external_api_setup
#

DROP TABLE IF EXISTS `external_api_setup`;

CREATE TABLE `external_api_setup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `data` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

INSERT INTO `external_api_setup` (`id`, `name`, `data`, `status`) VALUES (1, 'coinmarketcap', '{\"api_key\":\"5cffd167-16c3-4c34-b345-6eef830ce5a3\", \"create_link\":\"https://coinmarketcap.com/api\"}', 1);
INSERT INTO `external_api_setup` (`id`, `name`, `data`, `status`) VALUES (2, 'maps', '{\"api_key\":\"AIzaSyAUmj7I0GuGJWRcol-pMUmM4rrnHS90DE8\", \"create_link\":\"https://developers.google.com/maps/documentation/javascript/get-api-key\"}', 1);
INSERT INTO `external_api_setup` (`id`, `name`, `data`, `status`) VALUES (3, 'Cryptocompare', '{\"api_key\":\"61278343e480f5e40fffe307177e37e4339c4b2016ebd0c72d0b15386737ab0e\",\"create_link\":\"https:\\/\\/www.cryptocompare.com\"}', 1);


#
# TABLE STRUCTURE FOR: language
#

DROP TABLE IF EXISTS `language`;

CREATE TABLE `language` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `phrase` text NOT NULL,
  `english` text,
  `french` text,
  `arabic` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1181 DEFAULT CHARSET=utf8mb3;

INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1, 'creator_wallet', 'Creator Wallet Address', 'Creator Wallet Address fr', 'عنوان محفظة المنشئ');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (2, 'contact_address', 'Contract Address', 'Contract Address fr', 'عنوان العقد');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (3, 'email', 'Email', 'E-mail', 'البريد الإلكتروني');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (4, 'password', 'Password', 'Mot De Passe', 'كلمة المرور');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (5, 'login', 'Login', 'S\'identifier', 'تسجيل الدخول');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (6, 'incorrect_email_password', 'Incorrect Email/Password!', 'Mot de passe ou email incorrect', 'البريد الإلكتروني / كلمة المرور غير صحيحة!');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (7, 'user_role', 'User Role', 'RÃ´le Utilisateur', 'دور المستخدم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (8, 'please_login', 'Please Login', 'Veuillez Vous Connecter', 'الرجاء تسجيل الدخول');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (9, 'setting', 'Setting', 'Réglage', 'ضبط');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (10, 'profile', 'Profile', 'Profil', 'الملف الشخصي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (11, 'logout', 'Log Out', 'DÃ©connexion', 'تسجيل خروج');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (12, 'please_try_again', 'Please Try Again', 'Essayez encore !', 'حاول مرة اخرى');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (13, 'admin', 'Admin', 'Admin', 'مسؤل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (14, 'dashboard', 'Dashboard', 'Tableau de Bord', 'لوحة القيادة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (15, 'language_setting', 'Language Setting', 'Reglage Langue', 'إعدادات اللغة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (16, 'status', 'Status', 'Status', 'حالة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (17, 'active', 'Active', 'Actif', 'نشيط');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (18, 'inactive', 'Inactive', 'Inactif', 'غير نشط');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (19, 'cancel', 'Cancel', 'Cancel', 'يلغي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (20, 'save', 'Save', 'Sauver', 'يحفظ');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (21, 'serial', 'Serial', 'En Série', 'مسلسل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (22, 'action', 'Action', 'Action', 'عمل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (23, 'edit', 'Edit ', 'Editer', 'يحرر');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (24, 'delete', 'Delete', 'Effacer', 'حذف');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (25, 'save_successfully', 'Save Successfully!', 'Sauvegarde reussi', 'حفظ بنجاح!');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (26, 'update_successfully', 'Updated Successfully', 'Mise Ã  jour reussi', 'تم التحديث بنجاح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (27, 'delete_successfully', 'Delete Successfully', 'Supprimer Avec Succès', 'تم الحذف بنجاح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (28, 'are_you_sure', 'Are You Sure', 'êtes-vous Sûr', 'هل أنت واثق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (29, 'ip_address', 'IP Address', 'Adresse IP', 'عنوان IP');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (30, 'application_title', 'Application title', 'Titre appli', 'عنوان التطبيق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (31, 'favicon', 'Favicon', 'favicon', 'فافيكون');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (32, 'logo', 'Logo', 'Logo', 'شعار');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (33, 'footer_text', 'Footer text', 'Footer text', 'نص التذييل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (34, 'language', 'Language', 'Langue', 'لغة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (35, 'website_title', 'Website Title', 'Titre site web', 'عنوان الموقع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (36, 'invalid_logo', 'Invalid Logo', 'Logo invalide', 'شعار غير صالح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (37, 'submit_successfully', 'Submit Successfully!', 'Envoi reussi', 'أرسل بنجاح!');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (38, 'application_setting', 'Application Setting', 'Reglages appli', 'اعدادات التطبيق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (39, 'invalid_favicon', 'Invalid Favicon', 'Favicon Invalide', 'رمز مفضل غير صالح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (40, 'submit', 'Submit', 'Envoyez', 'يُقدِّم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (41, 'site_align', 'Website Align', 'Alignement site', 'محاذاة الموقع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (42, 'right_to_left', 'Right to Left', 'Doite vers la gauche', 'من اليمين الى اليسار');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (43, 'left_to_right', 'Left to Right', 'Gauche Vers la droite', 'من اليسار إلى اليمين');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (44, 'subject', 'Subject', 'Sujet', 'موضوعات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (45, 'receiver_name', 'Send To', 'Nom BÃ©nÃ©ficiaire', 'ارسل إلى');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (46, 'select_user', 'Select User', 'Selectionner Utilisateur', 'اختر المستخدم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (47, 'message_sent', 'Messages Sent', 'Message EnvoyÃ©', 'الرسائل المرسلة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (48, 'mail', 'Mail', 'Mail', 'بريد');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (49, 'send_mail', 'Send Mail', 'Envoyer Mail', 'ارسل بريد');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (50, 'mail_setting', 'Mail Setting', 'Reglage mail', 'إعداد البريد');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (51, 'protocol', 'Protocol', 'Protocole', 'بروتوكول');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (52, 'mailpath', 'Mail Path', 'Repertoire Mail', 'مسار البريد');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (53, 'mailtype', 'Mail Type', 'Type mail', 'نوع البريد');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (54, 'validate_email', 'Validate Email Address', 'Validez votre Email', 'التحقق من صحة عنوان البريد الإلكتروني');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (55, 'true', 'True', 'Vraie', 'حقيقي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (56, 'false', 'False', 'faux', 'خطأ شنيع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (57, 'attach_file', 'Attach File', 'Joindre un document', 'أرفق ملف');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (58, 'wordwrap', 'Enable Word Wrap', 'Wordwrap', 'تفعيل التفاف الكلمات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (59, 'send', 'Send', 'Envoyer', 'إرسال');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (60, 'app_setting', 'App Setting', 'Reglages appli', 'إعداد التطبيق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (61, 'sms', 'SMS', 'SMS', 'رسالة قصيرة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (62, 'gateway_setting', 'Gateway Setting', 'Reglage portail', 'إعداد البوابة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (63, 'time_zone', 'Time zone', 'Time Zone', 'وحدة زمنية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (64, 'provider', 'Provider', 'Fournisseur', 'مزود');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (65, 'sms_template', 'SMS Template', 'Template SMS', 'قالب SMS');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (66, 'template_name', 'Template Name', 'Nom du template', 'اسم القالب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (67, 'sms_schedule', 'SMS Schedule', 'Emploi du temps SMS', 'جدول الرسائل القصيرة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (68, 'schedule_name', 'Schedule Name', 'Nom d\'horaire', 'اسم الجدول');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (69, 'time', 'Time', 'Temps', 'زمن');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (70, 'already_exists', 'Already Exists', 'Existe dÃ©jÃ ', 'موجود أصلا');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (71, 'send_custom_sms', 'Send Custom SMS', 'Envoyer SMS personalisÃ©', 'إرسال رسائل SMS مخصصة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (72, 'sms_sent', 'SMS Sent!', 'SMS envoyÃ©', 'تم إرسال الرسائل القصيرة!');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (73, 'custom_sms_list', 'Custom SMS List', 'List SMS personalisÃ©', 'قائمة الرسائل القصيرة المخصصة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (74, 'reciver', 'Reciver', 'BÃ©nÃ©ficiaire', 'المتلقي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (75, 'auto_sms_report', 'Auto SMS Report', 'Rapport SMS Auto', 'تقرير الرسائل القصيرة التلقائي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (76, 'user_sms_list', 'User SMS List', 'Liste SMS utilisateurs', 'قائمة رسائل SMS للمستخدم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (77, 'send_sms', 'Send SMS', 'Envoyer SMS', 'أرسل رسالة نصية قصيرة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (78, 'new_sms', 'New SMS', 'Nouveau Message', 'رسائل SMS جديدة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (79, 'update', 'Update', 'Mettre à Jour', 'تحديث');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (80, 'reset', 'Reset', 'Réinitialiser', 'إعادة ضبط');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (81, 'messages', 'Messages', 'Messages', 'رسائل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (82, 'inbox', 'Inbox', 'Boite de rÃ©ception', 'صندوق الوارد');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (83, 'sent', 'Sent', 'EnvoyÃ©', 'أرسلت');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (84, 'captcha', 'Captcha', 'Captcha', 'كلمة التحقق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (85, 'welcome_back', 'Welcome back ', 'Bienvenue Ã  nouveau !', 'مرحبًا بعودتك');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (86, 'inbox_message', 'Inbox Message', 'SMS Boite de rÃ©ception', 'رسالة البريد الوارد');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (87, 'image_upload_successfully', 'Image Upload Successfully.', 'Upload d\'image reussi', 'تم تحميل الصورة بنجاح.');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (88, 'users', 'Users', 'Utilisateurs', 'المستخدمون');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (89, 'add_user', 'Add User', 'Ajouter utilisateur', 'إضافة مستخدم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (90, 'user_list', 'User List', 'Liste Utilisateurs', 'قائمة المستخدم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (91, 'firstname', 'First Name', 'Nom', 'الاسم الاول');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (92, 'lastname', 'Last Name', 'PrÃ©noms', 'الكنية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (93, 'about', 'About', 'A propos de nous', 'حول');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (94, 'preview', 'Preview', 'Visualliser', 'معاينة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (95, 'last_login', 'Last Login', 'Dernière Connexion', 'آخر تسجيل دخول');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (96, 'last_logout', 'Last Logout', 'Dernière Déconnexion', 'آخر خروج');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (97, 'image', 'Image', 'Image', 'صورة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (98, 'fullname', 'Full Name', 'Nom Complet', 'الاسم الكامل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (99, 'new_message', 'New Message', 'Nouveau Message', 'رسالة جديدة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (100, 'message', 'Message', 'Un Message', 'رسالة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (101, 'sender_name', 'Sender Name', 'Nom de l&#39;expÃ©diteur', 'اسم المرسل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (102, 'sl_no', 'SL No.', 'NumÃ©ro SL', 'SL. لا.');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (103, 'message_details', 'Message Details', 'DÃ©tails message', 'تفاصيل الرسالة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (104, 'date', 'Date', 'Date', 'تاريخ');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (105, 'select_option', 'Select Option', 'Sélectionner une option', 'حدد خيار');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (106, 'edit_profile', 'Edit Profile', 'Editer Profile', 'تعديل الملف الشخصي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (107, 'edit_user', 'Edit User', 'Editer utilisateur', 'تحرير العضو');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (108, 'sent_message', 'Sent Message', 'Message EnvoyÃ©', 'الرسالة المرسلة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (109, 'sub_admin', 'Sub Admin', 'Sub Administrateur', 'المسؤول الفرعي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (110, 'admin_list', 'Admin List', 'List Administrateurs', 'قائمة المسؤول');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (111, 'add_admin', 'Add Admin', 'Ajouter Administrateur', 'إضافة المسؤول');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (112, 'edit_admin', 'Edit Admin', 'Modifier L&#39;administrateur', 'تحرير المسؤول');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (113, 'username', 'Username', 'Nom utilisateur', 'اسم المستخدم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (114, 'sponsor_id', 'Sponsor ID', 'ID sponsor', 'هوية الكفيل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (115, 'mobile', 'Mobile', 'Mobile', 'التليفون المحمول');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (116, 'register', 'Register', 'Enregistrer', 'يسجل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (117, 'conf_password', 'Confirm Password', 'Reglage mot de passe', 'تأكيد كلمة المرور');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (118, 'user_id', 'User ID', 'ID utilisateur', 'معرف المستخدم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (119, 'package', 'Package', 'Pack', 'طَرد');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (120, 'create', 'Create', 'CrÃ©er', 'خلق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (121, 'package_name', 'Package Name', 'Nom du pack', 'اسم الحزمة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (122, 'package_deatils', 'Package Deatils', 'Detail pack', 'حزمة من التفاصيل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (123, 'package_amount', 'Package Amount', 'Montant pack', 'مبلغ العبوة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (124, 'daily_roi', 'Daily ROI', 'ROI journalier', 'عائد الاستثمار اليومي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (125, 'weekly_roi', 'Weekly ROI', 'ROI Hebdomadaire', 'عائد الاستثمار الأسبوعي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (126, 'monthly_roi', 'Monthly ROI', 'ROI Mensuel', 'عائد الاستثمار الشهري');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (127, 'yearly_roi', 'Yearly ROI', 'ROI annuel', 'عائد الاستثمار السنوي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (128, 'total_percent', 'Total Percent', 'Poucentage Total', 'إجمالي النسبة المئوية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (129, 'add_package', 'Add Package', 'Ajouter un Pack', 'أضف الحزمة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (130, 'transfer_add_msg', 'Transfer Successfully', 'Ajouter SMS transfert', 'تم التحويل بنجاح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (131, 'transfer', 'Transfer', 'Transfert', 'تحويل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (132, 'deposit', 'Deposit', 'Dépôt', 'إيداع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (133, 'edit_package', 'Edit Package', 'Editer Pack', 'تحرير الحزمة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (134, 'package_list', 'Package List', 'Liste Packs', 'قائمة العبوة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (135, 'withdraw', 'Withdraw', 'Se Désister', 'ينسحب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (136, 'request', 'Request', 'RequÃªte', 'طلب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (137, 'success', 'Success', 'SuccÃ¨s ! ', 'النجاح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (138, 'request_date', 'Request Date', 'Date RequÃªte', 'تاريخ الطلب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (139, 'payment_method', 'Payment Method', 'Methode de paiement', 'طريقة الدفع او السداد');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (140, 'amount', 'Amount', 'f', 'مقدار');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (141, 'charge', 'Charge', 'Frais', 'تكلفة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (142, 'total', 'Total', 'Total', 'المجموع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (143, 'comments', 'Comments', 'Commentaires', 'تعليقات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (144, 'pending', 'Pending', 'En cours', 'قيد الانتظار');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (145, 'cancel_date', 'Cancel Date', 'Annuler date', 'تاريخ الإلغاء');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (146, 'block_list', 'Block List', 'Liste Noire', 'قائمة الحظر');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (147, 'commission', 'Commission', 'Commission', 'عمولة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (148, 'setup', 'Setup', 'Regler', 'اقامة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (149, 'setup_list', 'Setup List', 'Liste de reglage', 'قائمة الإعداد');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (150, 'commission_list', 'Commission List', 'Liste Commission', 'قائمة العمولات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (151, 'level_name', 'Level Name', 'Nom du stage', 'اسم المستوى');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (152, 'personal_invest', 'Personal Invest', 'Mon investissement', 'الاستثمار الشخصي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (153, 'total_invest', 'Total Invest', 'Total Investissement', 'إجمالي الاستثمار');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (154, 'team_bonous', 'Team Bonous', 'Bonus d\'Equipe', 'مكافأة الفريق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (155, 'referral_bonous', 'Referral Bonous', 'Bonus parrainage', 'مكافأة الإحالة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (156, 'form_submit_msg', 'Insert Successfully', 'Envoyer formulaire', 'تم الإدراج بنجاح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (157, 'transection_category', 'Transaction Category', 'CatÃ©gorie Transaction', 'فئة المعاملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (158, 'add_deposit', 'Add Deposit', 'Effectuer un Depot', 'إضافة الإيداع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (159, 'deposit_list', 'Deposit List', 'Liste depot', 'قائمة الودائع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (160, 'team', 'Team', 'Equipe', 'فريق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (161, 'investment', 'Investment', 'Investissement personnel', 'استثمار');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (162, 'notification', 'Notification', 'Notification', 'تنبيه');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (163, 'receiver_id', 'Receiver Id', 'ID BÃ©nÃ©ficiaire', 'معرف المتلقي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (164, 'comment', 'Comments', 'Commentaire', 'تعليقات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (165, 'otp_send_to', 'OTP Send To', 'OTP envoyer Ã ', 'OTP أرسل إلى');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (166, 'transection', 'Transaction', 'Transactions', 'عملية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (167, 'buy', 'Buy', 'Acheter', 'يشتري');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (168, 'deposit_amount', 'Deposit Amount', 'Montant Depot', 'قيمة الايداع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (169, 'deposit_method', 'Deposit Method', 'Methode depot', 'طريقة الإيداع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (170, 'deposit_wallet_id', 'Deposit Wallet Id', 'Wallet ID', 'معرّف محفظة الإيداع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (171, 'confirm_transfer', 'Confirm Transfer', 'Confirmer transfert', 'تأكيد التحويل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (172, 'transfer_amount', 'Transfer Amount', 'Montant Transfert', 'مبلغ التحويل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (173, 'enter_verify_code', 'Enter Verify Code', 'Entrer code de vÃ©rification', 'أدخل رمز التحقق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (174, 'confirm', 'Confirm', 'Confirmer', 'يتأكد');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (175, 'deopsit_add_msg', 'Deposit Add Successfully.', 'Depot effectuÃ© avec succÃ¨s', 'تمت إضافة الإيداع بنجاح.');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (176, 'transfar_recite', 'Transfer Recite', 'ReÃ§u de transfert', 'تلاوة التحويل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (177, 'earn', 'Earn', 'Gagner', 'يكسب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (178, 'balance_is_unavailable', 'Balance Unavailable', 'Solde insuffisant', 'الرصيد غير متوفر');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (179, 'package_buy_successfully', 'Package Buy Successfully!', 'Achat du package reussi ! ', 'تم شراء العبوة بنجاح!');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (180, 'withdraw_recite', 'Withdraw Recite', 'ReÃ§u de retrait', 'سحب يقرأ');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (181, 'withdraw_confirm', 'Withdraw Confirm', 'Confirmation Retrait', 'سحب تأكيد');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (182, 'change_verify', 'Confirm Verify', 'Changer Verification', 'تأكيد التحقق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (183, 'change_password', 'Password Change', 'Changer mot de passe', 'تغيير كلمة السر');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (184, 'enter_confirm_password', 'Enter Confirm Password', 'Confirmer mot de passe', 'أدخل تأكيد كلمة المرور');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (185, 'enter_new_password', 'Enter New Password', 'Entrer nouveau mot de passe', 'أدخل كلمة مرور جديدة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (186, 'enter_old_password', 'Enter Old Password', 'Entrer ancien mot de passe', 'أدخل كلمة المرور القديمة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (187, 'change', 'Change', 'Changement', 'يتغيرون');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (188, 'password_change_successfull', 'Password Change Successfully', 'Mot de passe changÃ© avec succÃ¨s', 'تم تغيير كلمة المرور بنجاح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (189, 'old_password_is_wrong', 'Old Password Is Wrong', 'Entrer ancien mot de passe incorrect', 'كلمة المرور القديمة خاطئة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (190, 'fees_setting', 'Fees Setting', 'Reglages frais', 'تحديد الرسوم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (191, 'level', 'Level', 'Stage', 'مستوى');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (192, 'select_level', 'Select Level', 'Selectionner stage', 'اختار مستوى');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (193, 'fees_setting_successfully', 'Fees Setting Successfully', 'Reglages Frais reussi', 'ضبط الرسوم بنجاح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (194, 'bitcoin', 'Bitcoin', 'Bitcoin', 'بيتكوين');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (195, 'payeer', 'Payeer', 'Payeer', 'بايير');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (196, 'name', 'Name', 'Nom', 'اسم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (197, 'order_id', 'Order Id', 'ID de commande', 'رقم التعريف الخاص بالطلب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (198, 'fees', 'Fees', 'Frais', 'مصاريف');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (199, 'period', 'Period', 'PÃ©riode', 'فترة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (200, 'commission_ret', 'Commission Ret', 'Commission ret', 'لجنة المتقاعدين');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (201, 'title', 'Title', 'Titre', 'عنوان');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (202, 'details', 'Details', 'Details', 'تفاصيل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (203, 'personal_info', 'Personal Information', 'Informations personnels', 'معلومات شخصية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (204, 'sponsor_info', 'Sponsor Information', 'Info Sponsor', 'معلومات الراعي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (205, 'affiliate_url', 'Affiliat Url', 'Lien parrainage', 'عنوان Url التابع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (206, 'copy', 'Copy', 'Copier', 'ينسخ');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (207, 'my_payout', 'My Payout', 'Mes Paiements', 'مدفوعاتي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (208, 'personal_sales', 'Personal Sales', 'Ventes Personnelles', 'المبيعات الشخصية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (209, 'bank_details', 'Bank Details', 'Details de banque', 'التفاصيل المصرفية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (210, 'beneficiary_name', 'Beneficiary Name', 'Nom Beneficiaire', 'أسم المستفيد');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (211, 'bank_name', 'Bank Name', 'Nom de banque', 'اسم البنك');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (212, 'branch', 'Branch', 'Branche', 'فرع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (213, 'account_number', 'Account Number', 'NumÃ©ro de compte', 'رقم حساب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (214, 'ifsc_code', 'IFC Code', 'Code IFSC', 'كود مؤسسة التمويل الدولية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (215, 'account', 'Account', 'Compte', 'الحساب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (216, 'my_commission', 'My Commission', 'Mes commissions', 'لجنتي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (217, 'finance', 'Finance', 'La Finance', 'تمويل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (218, 'exchange', 'Exchange', 'Echange', 'تبادل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (219, 'bitcoin_setting', 'Bitcoin Setting', 'Reglages bitcoin', 'إعداد البيتكوين');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (220, 'payeer_setting', 'Payeer Setting', 'Reglages Payeer', 'إعداد Payeer');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (221, 'bank_information', 'Bank Information', 'Infos de banque', 'المعلومات المصرفية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (222, 'bitcoin_wallet_id', 'Bitcoin Wallet ID', 'Wallet Bitcoin', 'معرف محفظة Bitcoin');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (223, 'payment_method_setting', 'Payment Method Setting', 'Reglage methode de paiement', 'إعداد طريقة الدفع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (224, 'payeer_wallet_id', 'Payeer Wallet Id', 'ID Payeer', 'معرف محفظة Payeer');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (225, 'my_package', 'My Package', 'Mes packs', 'حزمة بلدي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (226, 'my_team', 'My Team', 'Mon Equipe', 'فريقي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (227, 'receipt', 'Receipt', 'RÃ©Ã§u', 'إيصال');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (228, 'withdraw_successfull', 'Withdraw Successfully', 'Retrait reussi !', 'سحب بنجاح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (229, 'team_bonus', 'Team Bonus', 'Bonus d\'Equipe', 'مكافأة الفريق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (230, 'withdraw_list', 'Withdraw List', 'Liste retraits', 'قائمة السحب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (231, 'pending_withdraw', 'Pending Withdraw', 'Retrait en attente', 'في انتظار سحب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (232, 'reciver_account', 'Receiver Account', 'Compte BÃ©nÃ©ficiaire', 'حساب المتلقي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (233, 'french', 'French', 'FranÃ§ais', 'فرنسي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (234, 'commission_setup', 'Commission Setup', 'Reglage commission', 'إعداد اللجنة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (235, 'personal_investment', 'Personal Investment', 'Investissement personnel', 'الاستثمار الشخصي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (236, 'total_investment', 'Total investment', 'Total Investissement', 'استثمار كامل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (237, 'transfer_list', 'Transfer List', 'Liste transfert', 'قائمة التحويل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (238, 'form_to', 'From To', 'De à', 'من الى');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (239, 'receive', 'Receive', 'Recevoir', 'تسلم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (240, 'wallet_id', 'Wallet Id', 'ID Wallet', 'معرف المحفظة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (241, 'withdraw_details', 'Withdraw Details', 'Details retraits', 'سحب التفاصيل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (242, 'generation_one', 'Generation One', 'GÃ©nÃ©ration 1', 'الجيل الأول');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (243, 'generation_two', 'Generation Two', 'GÃ©nÃ©ration 2', 'الجيل الثاني');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (244, 'generation_three', 'Generation Three', 'GÃ©nÃ©ration 3', 'الجيل الثالث');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (245, 'generation_four', 'Generation Four', 'GÃ©nÃ©ration 4', 'الجيل الرابع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (246, 'generation_five', 'Generation Five', 'GÃ©nÃ©ration 5', 'الجيل الخامس');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (247, 'generation_empty_message', 'You Have No Generation', 'Vous n\'avez pas de génération', 'ليس لديك جيل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (248, 'view', 'View', 'AperÃ§u', 'رأي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (249, 'cancle', 'Cancel', 'Annuler', 'يلغي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (250, 'type', 'Type', 'Taper', 'يكتب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (251, 'your_total_balance_is', 'Your Total Balance Is', 'Votre montant total est de', 'رصيدك الإجمالي هو');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (252, 'bonus', 'Bonus', 'Bonus', 'علاوة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (253, 'personal_turnover', 'Sponser Turnover', 'Mon Chiffre d\'affaire perso', 'دوران الراعي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (254, 'team_turnover', 'Team Turnover', 'Chiffre d\'affaire Equipe', 'دوران الفريق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (255, 'post_article', 'Post Article', 'Publier un article', 'مقال آخر');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (256, 'article_list', 'Article List', 'LIste article', 'قائمة المقالات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (257, 'add_article', 'Add Article', 'Ajouter article', 'أضف المادة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (258, 'headline_en', 'Headline English', 'Titre EN', 'العنوان باللغة الإنجليزية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (259, 'headline_fr', 'Headline French', 'Titre  FR', 'العنوان الفرنسي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (260, 'article_en', 'Article EN', 'Article EN', 'المادة EN');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (261, 'article_fr', 'Article FR', 'Article FR', 'المادة FR');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (262, 'edit_article', 'edit Article', 'Editer article', 'تحرير المقال');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (263, 'cat_list', 'Category List', 'Liste panier', 'قائمة الفئات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (264, 'add_cat', 'Add Category', 'Ajouter au panier', 'إضافة فئة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (265, 'parent_cat', 'Parent Category', 'Catégorie Parentale', 'القسم الرئيسي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (266, 'cat_name_en', 'Category Name English', 'Nom panier EN', 'اسم التصنيف English');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (267, 'cat_name_fr', 'Category Name French', 'Nom panier FR', 'اسم التصنيف فرنسي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (268, 'cat_title_en', 'Category Title English', 'Titre Panier EN', 'عنوان التصنيف English');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (269, 'cat_title_fr', 'Category Title French', 'Titre panier FR', 'عنوان الفئة French');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (270, 'select_cat', 'Select Category', 'Selectionner Cat', 'اختر الفئة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (271, 'edit_cat', 'Edit Category', 'Editer Panier', 'تحرير الفئة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (272, 'position_serial', 'Position Serial', 'Numéro de poste', 'موقف المسلسل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (273, 'currency_list', 'Currency List', 'Liste de devise', 'قائمة العملات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (274, 'currency', 'Currency', 'Devise', 'عملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (275, 'cryptocurrency_name', 'CryptoCurrency  Name', 'Nom Crypto monnaie', 'اسم العملة المشفرة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (276, 'select_cryptocurrency', 'Select Cryptocurrency', 'Selectionner Crypto', 'حدد العملة المشفرة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (277, 'edit_currency', 'Edit Currency', 'Editer Devise', 'تحرير العملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (278, 'exchange_list', 'Exchange List', 'Liste Ã©changes', 'قائمة الصرف');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (279, 'add_exchange', 'Add Exchange', 'Ajouter Echange', 'أضف الصرف');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (280, 'edit_exchange', 'Edit Exchange', 'Editer Echange', 'تحرير الصرف');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (281, 'wallet_data', 'Wallet ID', 'DonnÃ©es Wallet', 'معرف المحفظة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (282, 'sell_adjustment', 'Sell Adjustment', 'Ajustement Vente', 'تعديل البيع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (283, 'buy_adjustment', 'Buy Adjustment', 'Ajustement d\'achat', 'تعديل الشراء');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (284, 'exchange_wallet', 'Exchange Wallet', 'Wallet Echange', 'محفظة الصرف');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (285, 'exchange_wallet_list', 'Exchange Wallet List', 'Liste Wallet echange', 'قائمة محفظة الصرف');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (286, 'add_exchange_wallet', 'Add Exchange Wallet', 'Ajouter Wallet', 'إضافة محفظة الصرف');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (287, 'edit_exchange_wallet', 'Edit Exchange Wallet', 'Modifier Wallet echange', 'تحرير Exchange Wallet');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (288, 'local_currency_list', 'Local Currency List', 'LIste  Monnaies locales', 'قائمة العملات المحلية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (289, 'local_currency', 'Local Currency', 'Devise Locale', 'العملة المحلية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (290, 'add_local_currency', 'Add Local Currency', 'Ajouter Monnaie', 'أضف العملة المحلية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (291, 'edit_local_currency', 'Edit Local Currency', 'Editer Devise locale', 'تحرير العملة المحلية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (292, 'currency_name', 'Currency Name', 'Nom devise', 'اسم العملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (293, 'currency_iso_code', 'Currency ISO Code', 'Code ISO devise ', 'رمز ISO للعملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (294, 'usd_exchange_rate', 'USD Exchange Rate', 'Taux d\'echange USD', 'سعر صرف الدولار الأمريكي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (295, 'currency_symbol', 'Currency Symbol', 'Symboles Devise', 'رمز العملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (296, 'symbol_position', 'Symbol Position', 'Position symbole', 'موقف الرمز');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (297, 'currency_position', 'Currency Position', 'Position devise', 'وضع العملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (298, 'payment_gateway', 'Payment Gateway', 'Portail de paiement', 'بوابة الدفع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (299, 'gateway_name', 'Gateway Name', 'Nom passerelle', 'اسم البوابة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (300, 'gateway_setting', 'Gateway Setting', 'Reglage portail', 'إعداد البوابة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (301, 'add_payment_gateway', 'Add Payment Gateway', 'Ajouter Methode paiment', 'إضافة بوابة الدفع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (302, 'public_key', 'Public Key', 'ClÃ© publique', 'المفتاح العمومي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (303, 'private_key', 'Private Key', 'Clé privée', 'مفتاح سري');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (304, 'shop_id', 'Shop ID', 'ID shop', 'معرف المتجر');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (305, 'secret_key', 'Secret Key', 'ClÃ© secrete', 'المفتاح السري');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (306, 'edit_payment_gateway', 'Edit Payment Gateway', 'Editer Methode de paiement', 'تحرير بوابة الدفع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (307, 'slider_list', 'Slider List', 'Liste des curseurs', 'قائمة المنزلق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (308, 'add_slider', 'Add Slider', 'Ajouter Slider', 'أضف شريط التمرير');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (309, 'headline_fr', 'Headline French', 'Titre panier FR', 'العنوان رنسي  ');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (310, 'edit_slider', 'Edit Slider', 'Modifier le curseur', 'تحرير شريط التمرير');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (311, 'social_app', 'Social App', 'Application sociale', 'التطبيق الاجتماعي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (312, 'edit_social_app', 'Edit Social App', 'Editer RS appli', 'تحرير التطبيق الاجتماعي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (313, 'social_link', 'Social Link', 'Lien social', 'الرابط الاجتماعي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (314, 'add_link', 'Add Link', 'Ajouter Lien', 'إضافة رابط');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (315, 'link', 'Link', 'Lien', 'نهاية لهذه الغاية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (316, 'icon', 'Icon', 'IcÃ´ne', 'أيقونة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (317, 'edit_social_link', 'Edit Social Link', 'Edit les liens RS', 'تحرير الارتباط الاجتماعي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (318, 'transection_info', 'Transection Info', 'Info transaction', 'معلومات النقل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (319, 'sell', 'Sell', 'Vendre', 'باع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (320, 'article', 'Article', 'Article', 'مقالة - سلعة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (321, 'coin_amount', 'Coin Amount', 'Montat Crypto', 'مبلغ العملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (322, 'coin_name', 'Coin Name', 'Nom de la pièce', 'اسم العملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (323, 'buy_amount', 'Buy Amount', 'Montant achat', 'مبلغ الشراء');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (324, 'sell_amount', 'Sell Amount', 'Montant Ã  vendre', 'مبلغ البيع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (325, 'wallet_data', 'Wallet ID', 'DonnÃ©es Wallet', 'معرف المحفظة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (326, 'usd_amount', 'USD Amount', 'Montant USD', 'المبلغ بالدولار الأمريكي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (327, 'rate_coin', 'Coin Rate', 'Taux coin', 'سعر العملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (328, 'local_amount', 'Local Amount', 'Montant Local', 'المبلغ المحلي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (329, 'om_name', 'OM Name', 'Nom OM', 'اسم OM');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (330, 'om_mobile_no', 'OM Phone No', 'NÂ° OM', 'OM رقم الهاتف');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (331, 'transaction_no', 'Transaction No', 'NÂ° de transaction', 'رقم العملية التجارية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (332, 'idcard_no', 'ID Card No', 'NÂ° CNI', 'رقم بطاقة الهوية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (333, 'buy_list', 'Buy List', 'Buy list', 'قائمة الشراء');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (334, 'add_buy', 'Add Buy', 'Ajouter Achat', 'أضف شراء');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (335, 'transection_type', 'Transection Type', 'Type de transaction', 'نوع المعاملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (336, 'payment_successfully', 'Payment Successfully', 'Paiement effectuÃ©', 'تم الدفع بنجاح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (337, 'payment_cancel', 'Payment Cancel', 'Paiement annulÃ©', 'إلغاء الدفع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (338, 'payment_successfully', 'Payment Successfully', 'Paiement effectuÃ©', 'تم الدفع بنجاح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (339, 'sell_list', 'Sell List', 'LIste de vente ', 'قائمة البيع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (340, 'add_sell', 'Add Sell', 'Ajouter Vente', 'أضف بيع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (341, 'edit_sell', 'Edit Sell', 'Modifier Vendre', 'تحرير بيع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (342, 'account_active_mail', 'Please check Email to activate your account', 'Activer votre mail', 'يرجى التحقق من البريد الإلكتروني لتفعيل حسابك');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (343, 'accept_terms_privacy', 'You need to agree our Privacy Policy and Terms and Conditions.', 'Vous devez accepter notre politique de confidentialité et nos conditions générales.', 'يتحتاج إلى الموافقة على سياسة الخصوصية والشروط والأحكام الخاصة بنا.');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (344, 'username_used', 'Username Already Used', 'Nom d\'utilisateur dÃ©jÃ  utilisÃ©', 'اسم المستخدم مستخدم بالفعل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (345, 'account_create_success_social', 'Account Created Successfully and Your Account activated', 'Compte crÃ©e avec succÃ¨s', 'تم إنشاء الحساب بنجاح وتفعيل حسابك');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (346, 'email_used', 'Email Already Used', 'Adresse mail dÃ©jÃ  utilisÃ©', 'البريد الإلكتروني مستخدم بالفعل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (347, 'account_create_active_link', 'Account created successfully Activation link has been sent to your email address', 'Le compte a été créé avec succès Le lien d\'activation a été envoyé à votre adresse e-mail', 'تم إنشاء الحساب بنجاح تم إرسال رابط التنشيط إلى عنوان بريدك الإلكتروني');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (348, 'active_account', 'Active Account', 'Compte actif', 'حساب نشط');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (349, 'wrong_try_activation', 'Wrong Try', 'Mauvaise activation', 'المحاولة الخاطئة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (350, 'pay_now', 'Pay Now', 'Payer maintenant', 'ادفع الآن');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (351, 'payment_successfully', 'Payment Successfully', 'Paiement effectuÃ©', 'تم الدفع بنجاح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (352, 'sell_successfully', 'Sell Successfully', 'Vente effectuÃ©e avec succÃ¨s', 'البيع بنجاح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (353, 'already_clicked', 'Already Clicked There', 'DÃ©ja ValidÃ©', 'تم النقر بالفعل هناك');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (354, 'user_info', 'User Info', 'info utilisateur', 'معلومات المستخدم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (355, 'user_id', 'User ID', 'ID utilisateur', 'معرف المستخدم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (356, 'registered_ip', 'Registered IP', 'IP enregistrée', 'IP المسجل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (357, 'requested_ip', 'Requested IP', 'IP demandée', 'طلب IP');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (358, 'transaction_status', 'Transaction Status', 'Status de la transaction', 'حالة عملية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (359, 'receive_status', 'Receive Status', 'Recevoir le statut', 'تلقي_حالة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (360, 'receive_complete', 'Receive Complete', 'Réception terminée', 'تلقي كاملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (361, 'payment_status', 'Payment Status', 'Status de paiement', 'حالة السداد');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (362, 'payment_complete', 'Payment Complete', 'Paiement terminé', 'الدفع تم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (363, 'url', 'URL', 'URL', 'URL');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (364, 'app_id', 'App Id', 'ID appli', 'معرف التطبيق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (365, 'app_secret', 'App Secret', 'Secret Appli', 'سر التطبيق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (366, 'api_key', 'API Key', 'Clé API', 'مفتاح API');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (367, 'app_name', 'App Name', 'Nom Appli', 'اسم التطبيق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (368, 'social_list', 'Social List', 'Liste sociale', 'القائمة الاجتماعية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (369, 'select_payment_method', 'Select Payment Method', 'Selectionner mode de paiement', 'اختار طريقة الدفع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (370, 'payable', 'Payable', 'Payable', 'مستحق الدفع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (371, 'rate', 'Rate', 'Évaluer', 'معدل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (372, 'how_do_you_receive_money', 'How do you receive money', 'Comment ReÃ§evoir votre argent', 'كيف تحصل على المال');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (373, 'withdraw_method', 'Withdraw Method', 'Methode de retrait', 'طريقة السحب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (374, 'select_withdraw_method', 'Select Withdraw Method', 'Selectionner mÃ©thode de retrait', 'حدد طريقة السحب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (375, 'account_info', 'Account Info', 'Info compte', 'معلومات الحساب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (376, 'upload_docunemts', 'Upload Docunemts', 'Ajouter fichier', 'تحميل المستندات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (377, 'my_generation', 'My Generation', 'Mon Equipe', 'جيلي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (378, 'category', 'Category', 'CatÃ©gorie', 'فئة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (379, 'slider_h1_en', 'Slider H1 English', 'Curseur H1 Anglais', 'سلايدر H1 انجليزي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (380, 'slider_h1_fr', 'Slider H1 French', 'Curseur H1 Français', 'سلايدر H1 فرنسي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (381, 'slider_h2_en', 'Slider H2 English', 'Curseur H2 Anglais', 'سلايدر H2 الإنجليزية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (382, 'slider_h2_fr', 'Slider H2 French', 'Curseur H2 Français', 'سلايدر H2 فرنسي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (383, 'slider_h3_en', 'Slider H3 English', 'Curseur H3 Anglais', 'سلايدر H3 الإنجليزية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (384, 'slider_h3_fr', 'Slider H3 French', 'Curseur H3 Français', 'سلايدر H3 فرنسي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (385, 'complete', 'Complete', 'Complète', 'مكتمل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (386, 'refresh_currency', 'Refresh Currency', 'Actualiser la devise', 'تحديث العملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (387, 'cryptocurrency', 'Crypto Currency', 'Crypto Monnaie', 'عملة مشفرة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (388, 'symbol', 'Symbol', 'Symbole', 'رمز');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (389, 'please_select_cryptocurrency_first', 'Please Select CryptoCurrency First', 'Veuillez choisir une crypto monnaie', 'يرجى تحديد CryptoCurrency أولاً');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (390, 'please_select_diffrent_payment_method', 'Please select Diffrent Payment Method', 'Selectionner une autre mÃ©thode de paiement', 'يرجى تحديد طريقة دفع مختلفة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (391, 'add_credit', 'Add Credit', 'Crediter Compte', 'إضافة رصيد');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (392, 'credit', 'Credit', 'CrÃ©dit', 'تنسب إليه');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (393, 'credit_list', 'Credit List', 'Liste De Crédit', 'قائمة الائتمان');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (394, 'notes', 'Note', 'Notes', 'ملحوظة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (395, 'my_level_info', 'My Level Info', 'Info Niveau', 'معلومات مستواي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (396, 'slider', 'Slider', 'Slider', 'المنزلق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (397, 'exchange_setting', 'Exchange Setting', 'Reglage Echange', 'إعداد الصرف');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (398, 'exchange_all_request', 'Exchange all Request', 'Toutes requÃªtes echanges', 'تبادل جميع الطلبات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (399, 'total_user', 'Total User', 'Nombre d\'utilisateurs', 'إجمالي المستخدم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (400, 'total_roi', 'Total ROI', 'Total ROI', 'إجمالي عائد الاستثمار');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (401, 'total_commission', 'Total Commission', 'Total commission', 'إجمالي العمولة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (402, 'download_pdf', 'Download PDF', 'TÃ©lÃ©charger ', 'تحميل PDF');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (403, 'view_all_news', 'View all news', 'AperÃ§u News', 'عرض كل الأخبار');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (404, 'download_company_brochure', 'Download Company Brochure', 'TÃ©lÃ©chargez notre brochure', 'تحميل كتيب الشركة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (405, 'get_in_touch', 'Get in touch', 'Contactez-nous', 'ابقى على تواصل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (406, 'read_more', 'Read More', 'Lire plus', 'اقرأ أكثر');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (407, 'know_more', 'Know more', 'Savoir plus', 'تعرف أكثر');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (408, 'choose_plan', 'Choose plan', 'acheter', 'اختر الخطة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (409, 'latest_jobs', 'Latest Jobs', 'Latest Jobs', 'أحدث الوظائف');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (410, 'website', 'Website', 'website', 'موقع الكتروني');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (411, 'chose_one_of_the_following_methods', 'Chose One of the Following Methods.', 'chose_one_of_the_following_methods.', 'اختر إحدى الطرق التالية.');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (412, 'sign_in_using_your_email_address', 'Sign in Using Your Email Address', 'Connectez-vous avec votre username ou email', 'تسجيل الدخول باستخدام عنوان البريد الإلكتروني الخاص بك');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (413, 'forgot_password', 'Forgot Password', 'Mot De Passe Oublié', 'هل نسيت كلمة السر');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (414, 'remember_me', 'Remember Me', 'Souviens-toi De Moi', 'تذكرنى');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (415, 'username_or_email', 'Username or email', 'Username or email', 'اسم المستخدم أو البريد الالكتروني');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (416, 'dont_have_an_account', 'Don\'t have an account', 'Don\'t have an account', 'ليس لديك حساب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (417, 'sign_up_now', 'Sign up Now', 'CrÃ©er un compte maintenant', 'أفتح حساب الأن');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (418, 'send_code', 'Send Code', 'Send Code', 'أرسل الرمز');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (419, 'sign_up', 'Sign Up', 'S\'inscrire', 'اشتراك');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (420, 'already_user', 'Already User', 'Already User', 'بالفعل مستخدم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (421, 'sign_in_now', 'Sign In Now', 'Connectez-vous maintenant', 'قم بتسجيل دخولك الآن');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (422, 'sign_up_for_free', 'Sign Up For Free', 'CrÃ©er un compte gratuitement', 'سجل مجانا');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (423, 'join_thousands_of_companies_that_Use_globalcrypt_every_day', 'Join Thousands of Companies that Use Global Crypto Every Day', 'Join Thousands of Companies that Use Global Crypto Every Day', 'انضم إلى آلاف الشركات التي تستخدم العملات المشفرة العالمية كل يوم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (424, 'your_password_at_global_crypto_are_encrypted_and_secured', 'Your Password at the site is Encrypted And Secured', 'Votre mot de passe sur le site est crypté et sécurisé', 'ككلمة المرور الخاصة بك في الموقع مشفرة ومؤمنة  ');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (425, 'email_username_used', 'Email/Username Already Used', 'Email/Username Already Used', 'البريد الإلكتروني / اسم المستخدم مستخدم بالفعل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (426, 'address', 'Address', 'Adresse', 'تبوك');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (427, 'phone', 'Phone', 'Phone', 'هاتف');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (428, 'admin_align', 'Admin alignment', 'Admin alignment', 'محاذاة المسؤول');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (429, 'office_time', 'Office time', 'Office time', 'وقت المكتب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (430, 'logo_web', 'Website logo', 'Website logo', 'شعار الموقع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (431, 'dashboard_logo', 'Dashboard logo', 'Dashboard logo', 'شعار لوحة القيادة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (432, 'advertisement', 'Advertisement', 'Advertisement', 'الإعلانات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (433, 'script', 'Script', 'Script', 'النصي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (434, 'add_advertisement', 'Add Advertisement', 'Add Advertisement', 'أضف إعلان');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (435, 'page', 'Page', 'Page', 'صفحة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (436, 'embed_code', 'Embed code', 'Embed code', 'كود التضمين');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (437, 'add_type', 'Add Type', 'Add Type', 'إضافة نوع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (438, 'edit_advertisement', 'Edit Advertisement', 'Edit Advertisement', 'تحرير إعلان');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (439, 'host', 'Host', 'Host', 'مضيف');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (440, 'port', 'Port', 'Port', 'ميناء');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (441, 'apikey', 'API Key', 'API Key', 'مفتاح API');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (442, 'mail_type', 'Mail Type', 'Mail Type', 'نوع البريد');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (443, 'charset', 'Charset', 'Charset', 'محارف');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (444, 'news', 'News', 'Nouvelles', 'أخبار');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (445, 'news_list', 'News List', 'News List', 'قائمة الأخبار');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (446, 'edit_news', 'Edit News', 'Edit News', 'تحرير الأخبار');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (447, 'post_news', 'Post News', 'Post News', 'آخر الأخبار');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (448, 'close', 'Close', 'Close', 'قريب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (449, 'contact_us', 'Contact Us', 'Contact Us', 'اتصل بنا');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (450, 'watch_video', 'WATCH VIDEO', 'WATCH VIDEO', 'شاهد الفيديو');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (451, 'about_bitcoin', 'About Bitcoin', 'About Bitcoin', 'حول بيتكوين');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (452, 'get_start', 'Get Start', 'Get Start', 'ابدأ');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (453, 'cryptocoins', 'Crypto Coins', 'Crypto Coins', 'عملات التشفير');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (454, 'subscribe_to_our_newsletter', 'Subscribe to our newsletter!', 'Subscribe to our newsletter!', 'اشترك في نشرتنا الإخبارية!');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (455, 'email_newslatter', 'Email Newsletter', 'Email Newsletter', 'النشرة البريد الإلكتروني');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (456, 'services', 'Services', 'Services', 'خدمات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (457, 'our_company', 'Our Company', 'Our Company', 'شركتنا');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (458, 'sign_in', 'Sign In', 'Connectez-vous', 'تسجيل الدخول');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (459, 'join_the_new_yera_of_cryptocurrency_exchange', 'Join the new Yera of cryptocurrency exchange', 'Join the new Yera of cryptocurrency exchange', 'انضم إلى العام الجديد لتبادل العملات المشفرة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (460, 'access_the_cryptocurrency_experience_you_deserve', 'Access the cryptocurrency experience you deserve', 'Access the cryptocurrency experience you deserve', 'تمتع بالوصول إلى تجربة العملة المشفرة التي تستحقها');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (461, 'home', 'Home', 'Accueil', 'مسكن');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (462, 'scroll_to_top', 'Scroll to Top', 'Scroll to Top', 'انتقل إلى أعلى');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (463, 'ticker', 'Ticker', 'Ticker', 'شريط');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (464, 'price', 'Price', 'Prix', 'سعر');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (465, 'capitalization', 'Capitalization', 'Capitalization', 'الرسملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (466, '1d_change', '1D change', '1D change', '1D التغيير');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (467, 'graph_24h', 'Graph 24H', 'Graph 24H', 'الرسم البياني 24 ح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (468, 'recent_post', 'Recent Post', 'Recent Post', 'المنشور الاخير');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (469, 'my_social_link', 'My Social link', 'My Social link', 'الارتباط الاجتماعي الخاص بي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (470, 'tell_us_about_your_project', 'Tell Us About Your Project', 'Tell Us About Your Project', 'أخبرنا عن مشروعك');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (471, 'company', 'Company', 'Company', 'شركة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (472, 'reset_your_password', 'Reset Your Password', 'Réinitialisez Votre Mot De Passe', 'اعد ضبط كلمه السر');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (473, '24h_change', '24H change', '24H change', '24H التغيير');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (474, '24h_volume', '24H Volume', '24H Volume', 'حجم 24H');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (475, 'latitudelongitude', 'Latitude, Longitude', 'Latitude, Longitude', 'خطوط العرض والطول');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (476, 'send_money', 'Send Money', 'Send Money', 'إرسال الأموال');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (477, 'article', 'Article', 'article', 'مقالة - سلعة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (478, 'contact', 'Contact', 'Contact', 'اتصال');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (479, 'team', 'Team', 'team', 'فريق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (480, 'client', 'Client', 'client', 'عميل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (481, 'service', 'Service', 'service', 'خدمة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (482, 'testimonial', 'Testimonial', 'testimonial', 'شهادة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (483, 'faq', 'F.A.Q', 'faq', 'التعليمات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (484, 'short_description_en', 'Short description english', 'Short Description', 'وصف قصير اللغة الإنجليزية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (485, 'long_description_en', 'Long description English', 'Long Description', 'وصف طويل باللغة الإنجليزية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (486, 'short_description_fr', 'Short description english', 'Short Description', 'وصف قصير اللغة الإنجليزية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (487, 'long_description_fr', 'Long description English', 'Long Description', 'وصف طويل باللغة الإنجليزية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (488, 'info', 'Information', 'Information', 'معلومة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (489, 'quote', 'Quote', 'Quote', 'يقتبس');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (490, 'question_fr', 'Question French', 'Question French', 'سؤال الفرنسية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (491, 'question_en', 'Question English', 'Question English', 'سؤال اللغة الإنجليزية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (492, 'answer_en', 'Answer English', 'Answer English', 'أجب باللغة الإنجليزية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (493, 'answer_fr', 'Answer French', 'Answer French', 'أجب بالفرنسية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (494, 'content', 'Page Content', 'Page Content', 'محتوى الصفحة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (495, 'add_content', 'Add Content', 'Add Content', 'إضافة محتوى');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (496, 'edit_content', 'Edit Content', 'Edit Content', 'تحرير المحتوى');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (497, 'video', 'video (If Youtube Link)', 'video', 'فيديو (إذا كان رابط يوتيوب)');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (498, 'add_faq', 'Add F.A.Q', 'Add faq', 'إضافة أسئلة وأجوبة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (499, 'add_testimonial', 'Add Testimonial', 'Add testimonial', 'أضف شهادة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (500, 'add_service', 'Add Service', 'Add service', 'أضف خدمة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (501, 'add_client', 'Add Client', 'Add client', 'إضافة عميل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (502, 'add_team', 'Add Team', 'Add team', 'اضافة فريق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (503, 'add_contact', 'Add Contact', 'Add contact', 'إضافة جهة اتصال');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (504, 'add_article', 'Add Article', 'Add article', 'أضف المادة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (505, 'edit_article', 'edit Article', 'edit article', 'تحرير المقال');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (506, 'edit_contact', 'edit Contact', 'edit contact', 'تحرير جهة الاتصال');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (507, 'edit_team', 'edit Team', 'edit team', 'تحرير الفريق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (508, 'edit_client', 'edit Client', 'edit client', 'تحرير العميل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (509, 'edit_service', 'edit Service', 'edit service', 'تحرير الخدمة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (510, 'edit_testimonial', 'edit Testimonial', 'edit testimonial', 'تحرير التزكية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (511, 'edit_faq', 'edit F.A.Q', 'edit faq', 'تحرير أسئلة وأجوبة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (512, 'article_list', 'Article List', 'article', 'قائمة المقالات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (513, 'contact_list', 'Contact List', 'contact', 'قائمة الإتصال');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (514, 'team_list', 'Team List', 'team', 'قائمة الفريق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (515, 'client_list', 'Client List', 'client', 'قائمة العملاء');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (516, 'service_list', 'Service List', 'service', 'قائمة الخدمات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (517, 'testimonial_list', 'Testimonial List', 'testimonial', 'قائمة الشهادات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (518, 'faq_list', 'F.A.Q List', 'faq', 'قائمة الأسئلة الشائعة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (519, 'content_list', 'Page Content', 'Page Content', 'محتوى الصفحة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (520, 'add_teammember', 'Add Teammember', 'Add Teammember', 'إضافة عضو الفريق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (521, 'tooltip_package_name', 'Example: Silver Package', 'Example: Silver Package', 'مثال: الباقة الفضية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (522, 'tooltip_package_details', 'This is for Package Short Details', 'This is for Package Short Details.', 'هذا للحصول على تفاصيل الحزمة المختصرة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (523, 'tooltip_package_amount', 'Package Amount in Dollar. Example: 200', 'Package Amount in Dollar. Example: 200', 'مبلغ الحزمة بالدولار. ');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (524, 'tooltip_package_daily_roi', 'Please Set this field with Zero. Example: 0', 'Please Set this field with Zero. Example: 0', 'الرجاء تعيين هذا الحقل مع الصفر. ');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (525, 'tooltip_package_weekly_roi', 'Who buy this package they will get weekly ROI in Dollar. Example: 5. They will get every week 5 till them package period', 'Who buy this package they will get weekly ROI in Dollar. Example: 5. They will get every week 5 till them package period', 'الذين يشترون هذه الحزمة سيحصلون على عائد استثمار أسبوعي بالدولار. ');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (526, 'tooltip_package_monthly_roi', 'Sum of weekly ROI in a month', 'Sum of weekly ROI in a month', 'مجموع عائد الاستثمار الأسبوعي في الشهر');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (527, 'tooltip_package_yearly_roi', 'Sum of weekly ROI in a Year', 'Sum of weekly ROI in a Year', 'مجموع عائد الاستثمار الأسبوعي في السنة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (528, 'tooltip_package_total_percent_roi', 'Total Persent Of ROI', 'Total Persent Of ROI', 'إجمالي النسبة المئوية لعائد الاستثمار');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (529, 'tooltip_package_period', 'Package Period', 'Package Period', 'فترة الحزمة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (530, 'trading', 'Trading', 'Trade', 'تجارة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (531, 'trade_history', 'Trade History', 'Histoire Du Commerce', 'تاريخ التجارة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (532, 'market', 'Market', 'Marché', 'سوق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (533, 'coin_pair', 'Coin Pair', 'Coin Pair', 'زوج العملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (534, 'pending_deposit', 'Pending Deposit', 'Demande de retrat en cours', 'في انتظار الإيداع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (535, 'email_and_sms_setting', 'Email And SMS Setting', 'Paramètres D\'e-mail Et De SMS', 'إعداد البريد الإلكتروني والرسائل القصيرة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (536, 'email_and_sms_gateway', 'Email And Sms Gateway', 'Email And Sms Gateway', 'بوابة البريد الإلكتروني والرسائل القصيرة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (537, 'trade', 'Trade', 'Commerce', 'تجارة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (538, 'referral_id', 'Referral ID', 'ID de parrainage', 'معرف الإحالة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (539, 'please_enter_valid_email', 'Please Enter Valid Email !!!', 'Please Enter Valid Email !!!', 'الرجاء إدخال بريد إلكتروني صحيح !!!');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (540, 'already_subscribe', 'This Email Address already subscribed', 'This Email Address already subscribed', 'عنوان البريد الإلكتروني هذا مشترك بالفعل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (541, 'message_send_successfuly', 'TMessage send successfuly', 'Message send successfuly', 'تم ارسال الرسالة بنجاح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (542, 'message_send_fail', 'Message send Fail', 'Message send Fail', 'فشل إرسال الرسالة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (543, 'setup_payment_gateway', 'setup payment gateway', 'setup payment gateway', 'إعداد بوابة الدفع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (544, 'user_profile', 'User Profile', 'User Profile', 'ملف تعريفي للمستخدم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (545, 'client_id', 'Client Id', 'Client Id', 'معرف العميل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (546, 'client_secret', 'Client Secret', 'Client Secret', 'سر العميل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (547, 'notice', 'Notice', 'Remarquer', 'يلاحظ');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (548, 'edit_notice', 'Edit Notice', 'Edit Notice', 'تحرير الإخطار');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (549, 'language_list', 'Language List', 'Language List', 'قائمة اللغات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (550, 'phrase_list', 'Phrase List', 'Phrase List', 'قائمة العبارات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (551, 'label_added_successfully', 'Label added successfully!', 'Label added successfully!', 'تمت إضافة التسمية بنجاح!');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (552, 'this_level_already_exist', 'This Level Already Exist!', 'This Level Already Exist!', 'هذا المستوى موجود بالفعل!');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (553, 'you_successfully_deposit_the_amount', 'You successfully deposit the amount', 'You successfully deposit the amount', 'قمت بإيداع المبلغ بنجاح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (554, 'your_new_balance_is', 'Your new balance is', 'Your new balance is', 'رصيدك الجديد هو');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (555, 'account_name', 'Account Name', 'Account Name', 'أسم الحساب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (556, 'account_no', 'Account No', 'Account No', 'رقم الحساب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (557, 'branch_name', 'Branch Name', 'Branch Name', 'اسم الفرع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (558, 'swift_code', 'SWIFT Code', 'SWIFT Code', 'رمز السرعة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (559, 'abn_no', 'BSB/Routing Number', 'BSB/Routing Number', 'BSB / رقم التوجيه');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (560, 'country', 'Country', 'Country', 'دولة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (561, 'there_is_no_phone_number', 'There is no Phone number!!!', 'There is no Phone number!!!', 'لا يوجد رقم هاتف !!!');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (562, 'coinpair', 'Coinpair', 'Coinpair', 'كوينبير');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (563, 'edit_coinpair', 'Edit Coinpair', 'Edit Coinpair', 'تحرير Coinpair');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (564, 'edit_coin', 'Edit coin', 'Edit coin', 'تحرير العملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (565, 'coin_market', 'Coin Market', 'Marché Aux Pièces', 'سوق العملات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (566, 'edit_market', 'Edit Market', 'Modifier Le Marché', 'تحرير السوق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (567, 'leave_us_a_message', 'Leave us a message', 'Leave us a message', 'اترك لنا رسالة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (568, 'verify_type', 'verify type', 'verify type', 'تحقق من النوع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (569, 'gender', 'Gender', 'Gender', 'جنس');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (570, 'id_number', 'Id  Number', 'Id Number', 'رقم الهوية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (571, 'verification_is_being_processed', 'Verification Is being Processed', 'Verification Is being Processed', 'التحقق قيد المعالجة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (572, 'cryptocoin', 'Cryptocoin', 'Cryptocoin french', 'العملة المشفرة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (573, 'please_setup_your_bank_account', 'Please setup bank account', 'Please setup bank account', 'الرجاء إعداد حساب مصرفي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (574, 'this_gateway_deactivated', 'This Gateway Deactivated', 'This Gateway Deactivated', 'تم إلغاء تنشيط هذه البوابة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (575, 'otp_send_to', 'OTP Send To', 'OTP Send To', 'OTP أرسل إلى');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (576, 'your_weekly_limit_exceeded', 'Your weekly Limit exceeded', 'Your weekly exceeded ', 'تجاوز الحد الأسبوعي الخاص بك');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (577, 'there_is_no_order_for_cancel', 'There is no order for cancel', 'There is no order for cancel', 'لا يوجد طلب للإلغاء');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (578, 'request_canceled', 'Request Canceled', 'Demande Annulée', 'تم إلغاء الطلب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (579, 'referral_id_is_invalid', 'Referral ID is invalid', 'Referral ID is invalid', 'معرف الإحالة غير صالح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (580, 'invalid_ip_address', 'Invalid IP address', 'Invalid IP address', 'عنوان إب غير صالح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (581, 'please_activate_your_account', 'Please activate your account', 'Please activate your account', 'يرجى تفعيل حسابك');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (582, 'already_regsister', 'Already regsister!!!', 'Already regsister!!!', 'مسجل بالفعل !!!');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (583, 'this_account_is_now_pending', 'This account is now pending', 'This account is now pending', 'هذا الحساب معلق الآن');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (584, 'this_account_is_suspend', 'This account is suspend', 'This account is suspend', 'هذا الحساب معلق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (585, 'something_wrong', 'Something wrong !!!', 'Something wrong !!!', 'هل هناك خطب ما !!!');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (586, 'password_missmatch', 'Password Missmatch', 'password missmatch', 'كلمة المرور غير متطابقة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (587, 'invalid_authentication_code', 'Invalid Authentication Code', 'Invalid Authentication Code', 'رمز المصادقة غير صالح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (588, 'password_reset_code_send_check_your_email', 'Password reset code send.Check your email.', 'Password reset code send.Check your email.', 'إرسال رمز إعادة تعيين كلمة المرور. تحقق من بريدك الإلكتروني.');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (589, 'email_required', 'Enter your email address!', 'email required', 'أدخل عنوان بريدك الالكتروني!');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (590, 'password_changed', 'Password has been changed', 'Password has been changed', 'تم تغيير كلمة المرور');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (591, 'google_authenticator_disabled', 'Google Authenticator Disabled', 'Google Authenticator Disabled', 'Google Authenticator معطل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (592, 'google_authenticator_enabled', 'Google Authenticator Enabled', 'Google Authenticator Enabled', 'تم تمكين Google Authenticator');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (593, 'this_account_already_activated', 'This account already activated', 'This account already activated', 'تم تنشيط هذا الحساب بالفعل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (594, 'total_balance', 'Total Balance', 'Total Balance', 'إجمالي الرصيد');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (595, 'available_balance', 'Available Balance', 'Available balance', 'الرصيد المتوفر');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (596, 'open', 'Open', 'Ouvert', 'فتح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (597, 'qty', 'QTY', 'QTY', 'الكمية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (598, 'finished_trade', 'Finished Trade', 'Finished Trade', 'التجارة النهائية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (599, 'deposit_crypto_dollar', 'Deposit(Crypto/Dollar)', 'Deposit(Crypto/Dollar)', 'إيداع (تشفير / دولار)');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (600, 'us_dollar', 'US Dollar', 'US Dollar', 'الدولار الأمريكي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (601, 'available', 'Available', 'Disponible', 'متوفرة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (602, 'buy_orders', 'Buy Orders', 'Buy Orders', 'أوامر الشراء');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (603, 'last_price', 'Last price', 'last price', 'السعر الاخير');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (604, 'sell_orders', 'Sell Orders', 'Sell Orders', 'أوامر البيع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (605, '1hr_change', '1hr Change', '1hr Change', '1 ساعة التغيير');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (606, '1hr_high', '1hr High', '1hr High', '1 ساعة عالية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (607, '1hr_low', '1hr Low', '1hr Low', '1 ساعة منخفضة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (608, '1hr_volume', '1hr Volume', '1hr Volume', 'حجم 1 ساعة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (609, 'estimated_open_price', 'Estimated open price', 'Estimated open price', 'سعر الافتتاح المقدر');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (610, 'open_fees', 'Open fees', 'Open fees', 'فتح الرسوم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (611, 'market_depth', 'Market Depth', 'Market Depth', 'عمق السوق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (612, 'coin', 'Coin', 'Pièce De Monnaie', 'عملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (613, 'market_price', 'Market Price', 'Market Price', 'سعر السوق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (614, 'volume', 'volume', 'volume', 'الصوت');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (615, 'live_chat', 'Live Chat', 'Live Chat', 'دردشة مباشرة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (616, 'market_trade_history', 'Market Trade History', 'Market Trade History', 'تاريخ تجارة السوق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (617, 'Notices', 'notices', 'notices', 'إشعارات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (618, 'posted_by', 'Posted by', 'Posted by', 'منشور من طرف');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (619, 'latest_form_our_blog', 'Latest form our blog', 'Latest form our blog', 'أحدث شكل على مدونتنا');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (620, 'auth_code', 'Auth Code', 'AuthCode', 'كود المصادقة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (621, 'scan_this_barcode_using', 'Scan this BarCode using', 'Scan this BarCode using', 'امسح هذا الرمز الشريطي باستخدام ملفات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (622, 'google_authentication', 'Google Authentication', 'Google Authentication', 'مصادقة جوجل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (623, 'install_google_authentication', 'Install Google Authentication', 'Install Google Authentication', 'قم بتثبيت مصادقة Google');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (624, 'if_you_are_unable_to_scan_the_qr_code_please_enter_this_code_manually_into_the_app.', 'If you are unable to scan the QR code, please enter this code manually into the app.', 'If you are unable to scan the QR code, please enter this code manually into the app.', 'إذا لم تتمكن من مسح رمز الاستجابة السريعة ضوئيًا ، فيرجى إدخال هذا الرمز يدويًا في التطبيق.');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (625, 'open_order', 'Open Order', 'Open Order', 'طلب مفتوح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (626, 'complete_order', 'Complete Order', 'Complete Order', 'اكمل الطلب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (627, 'bank_setting', 'Bank Setup', 'Bank Setup', 'إعداد البنك');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (628, 'payout_setup', 'Payout Setup', 'Payout Setup', 'إعداد الدفع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (629, 'account_login', 'Account Login', 'Account Login', 'تسجل الدخول');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (630, 'we_never_share_your_email_with_anyone_else', 'We\'ll never share your email with anyone else', 'We\'ll never share your email with anyone else', 'لن نشارك بريدك الإلكتروني مع أي شخص آخر');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (631, 'news_details', 'News Details', 'News Details', 'تفاصيل الخبر');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (632, 'open_order_history', 'Open Order History', 'Open Order History', 'افتح محفوظات الطلبات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (633, 'required_qty', 'Required QTY', 'Qté requise', 'الكمية المطلوبة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (634, 'available_qty', 'Available Quantity ', 'quantité disponible', 'الكمية المتوفرة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (635, 'required_amount', 'Required Amount', 'Quantité requise', 'المبلغ المطلوب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (636, 'available_amount', 'Available Amount', 'Montant disponible', 'المبلغ المتاح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (637, 'complete_qty', 'Complete QTY', 'QTÉ complète', 'الكمية الكاملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (638, 'complete_amount', 'Complete amount', 'Montant complet', 'المبلغ الكامل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (639, 'trade_time', 'Trade Time', 'Trade Time', 'وقت التجارة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (640, 'running', 'Running', 'Fonctionnement', 'ادارة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (641, '24hr_change', '24hr Change', '24hr Change', '24 ساعة التغيير');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (642, '24hr_high', '24hr High', '24hr High', 'ارتفاع 24 ساعة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (643, '24hr_low', '24hr Low', '1hr Low', '24 ساعة منخفضة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (644, '24hr_volume', '24hr Volume', '24hr Volume', 'حجم 24 ساعة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (645, 'post_comment', 'Post Comment', 'Post Comment', 'أضف تعليقا');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (646, 'account_created', 'Account Created', 'Account Created', 'تم إنشاء الحساب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (647, 'access_time', 'Access Time', 'Access Time', 'وقت الوصول');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (648, 'user_agent', 'User Agent', 'User Agent', 'وكيل المستخدم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (649, 'passport', 'Passport', 'Passport', 'جواز سفر');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (650, 'drivers_license', 'Driver license', 'Driver license', 'رخصة قيادة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (651, 'government_issued_id_card', 'Government-issued ID Card', 'Government-issued ID Card', 'بطاقة هوية صادرة عن جهة حكومية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (652, 'given_name', 'Given Name', 'Given Name', 'الاسم المعطى');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (653, 'surname', 'Surname', 'Surname', 'اسم العائلة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (654, 'passport_nid_license_number', 'Passport/NID/License Number', 'Passport/NID/License Number', 'جواز السفر / NID / رقم الترخيص');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (655, 'account_register', 'Account Register', 'Account Register', 'تسجيل الحساب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (656, 'confirm_password', 'Confirm Password', 'Confirm Password', 'تأكيد كلمة المرور');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (657, 'canceled', 'Canceled', 'Annulé', 'ألغيت');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (658, 'completed', 'Completed', 'Complété', 'مكتمل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (659, 'crypto_dollar_currency', 'Crypto/Dollar Currency', 'Crypto/Dollar Currency', 'عملة التشفير / الدولار');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (660, 'withdraw_no', 'Withdraw No', 'Withdraw No', 'سحب لا');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (661, 'male', 'Male', 'Male', 'ذكر');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (662, 'female', 'Female', 'Female', 'أنثى');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (663, 'verify', 'KYC Verify', 'Verify', 'تحقق KYC');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (664, 'server_problem', 'We are unable to send SMS at the moment.', 'Nous ne pouvons pas envoyer de SMS pour le moment.', 'نحن غير قادرين على إرسال الرسائل القصيرة في الوقت الحالي.');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (665, 'verified', 'Verified', 'Vérifié', 'تم التحقق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (666, 'footer_menu1', 'Footer menu 1', 'Footer menu 1', 'قائمة التذييل 1');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (667, 'footer_menu2', 'Footer menu 2', 'Footer menu 2', 'قائمة التذييل 2');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (668, 'footer_menu3', 'Social Media', 'Social Media', 'وسائل التواصل الاجتماعي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (669, 'terms_of_use', 'Terms Of Use', 'Terms Of Use', 'تعليمات الاستخدام');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (670, 'receiver_not_valid', 'Receiver not valid!!!', 'Receiver not valid!!!', 'المتلقي غير صالح !!!');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (671, 'first_name_required', 'Please enter your name!', 'Please enter your name!', 'من فضلك أدخل إسمك!');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (672, 'a_lowercase_letter', 'Please Enter a Lowercase letter !', 'Please enter a loswercase letter!', 'الرجاء إدخال حرف صغير!');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (673, 'password_required', 'Please enter your password!', 'Please enter yYour password!', 'من فضلك أدخل رقمك السري!');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (674, 'a_capital_uppercase_letter', 'Please Enter a Uppercase letter ! ', 'Please enter a upercase letter!', 'الرجاء إدخال حرف كبير!');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (675, 'a_number', 'Please Enter a Number!', 'Please enter a number!', 'الرجاء إدخال رقم!');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (676, 'a_special', 'Please Enter a Special Character !', 'Please enter a  special character!', 'الرجاء إدخال حرف خاص!');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (677, 'please_enter_at_least_8_characters_input', 'Please enter at least eight characters!', 'Please enter at least eight characters!', 'الرجاء إدخال ثمانية أحرف على الأقل!');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (678, 'confirm_password_must_be_filled_out', 'Please enter Confirm password!', 'Please enter Confirm password!', 'الرجاء إدخال تأكيد كلمة المرور!');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (679, 'must_confirm_privacy_policy_and_terms_and_conditions', 'Must confirm privacy policy and terms and conditions', 'Must confirm privacy policy and terms and conditions', 'يجب تأكيد سياسة الخصوصية والشروط والأحكام');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (680, 'phone_required', 'Enter your phone number!', 'Enter your phone number!', 'أدخل رقم هاتفك!');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (681, 'email_required', 'Enter your email address!', 'Enter your email address!', 'أدخل عنوان بريدك الالكتروني!');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (682, 'comments_required', 'Enter your comments!', 'Enter your comments!', 'أدخل تعليقاتك!');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (683, 'first_name', 'Please enter your first name!', 'Please enter your first name!', 'يرجى ادخال الاسم الاول!');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (684, 'f_name', 'First Name', 'First Name', 'الاسم الاول');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (685, 'l_name', 'Last Name', 'Last Name', 'الكنية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (686, 'coin_full_name', 'Coin Full Name', 'Nom complet de la piÃ¨ce', 'الاسم الكامل للعملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (687, 'coin_id', 'Coin Id', 'ID de piÃ¨ce', 'معرف العملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (688, 'rank', 'Rank', 'Rang', 'مرتبة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (689, 'show_home', 'Show Home', 'Afficher la maison', 'عرض الصفحة الرئيسية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (690, 'yes', 'Yes', 'Oui', 'نعم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (691, 'no', 'No', 'Non', 'رقم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (692, 'coin_image/icon/logo', 'Coin Image/Icon/Logo', 'Image de piÃ¨ce / icÃ´ne / logo', 'صورة العملة / الرمز / الشعار');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (693, 'coin_icon', 'Coin Icon', 'IcÃ´ne de piÃ¨ce de monnaie', 'رمز العملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (694, 'full_name', 'Full Name', 'Nom complet', 'الاسم الكامل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (695, 'home_page/serial', 'Home Page/Serial', 'Page d\'accueil / SÃ©rie', 'الصفحة الرئيسية / المسلسل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (696, 'email_notification_settings', 'Email Notification Settings', 'Paramètres De Notification Par E-mail', 'إعدادات إعلام البريد الإلكتروني');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (697, 'payout', 'Payout', 'Paiement', 'سيصرف');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (698, 'commissin', 'Commissin', 'Commission', 'عمولة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (699, 'team_bonnus', 'Team Bonnus', 'Bonus d\'équipe', 'فريق بونوس');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (700, 'sms_sending', 'SMS Sending', 'Envoi De SMS', 'إرسال الرسائل القصيرة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (701, 'exchange_market', 'Exchange Market', 'Marché Des Changes', 'سوق الصرف');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (702, 'total_trade', 'Total Trade', 'Commerce Total', 'إجمالي التجارة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (703, 'total_crypto_fees', 'Total Crypto Fees', 'Total Des Frais De Crypto', 'إجمالي رسوم التشفير');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (704, 'total_usd_fees', 'Total USD Fees', 'Frais Totaux En USD', 'إجمالي الرسوم بالدولار الأمريكي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (705, 'referral_bonus_usd', 'Referral Bonus USD', 'Bonus De Parrainage USD', 'مكافأة الإحالة بالدولار الأمريكي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (706, 'market_deposit', 'Market Deposit', 'DÃ©pÃ´t de marchÃ©', 'إيداع في السوق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (707, 'fees_collect', 'Fees Collect', 'Frais collectÃ©s', 'تحصيل الرسوم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (708, 'quantity', 'Quantity', 'QuantitÃ©', 'كمية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (709, 'required', 'Required', 'Obligatoire', 'مطلوب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (710, 'history', 'history', 'histoire', 'التاريخ');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (711, 'back', 'Back', 'Retour', 'خلف');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (712, 'important', 'Important', 'Important', 'مهم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (713, 'send_only', 'Send Only', 'Envoyer seulement', 'إرسال فقط');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (714, 'deposit_address', 'deposit address', 'adresse de dÃ©pÃ´t', 'عنوان الإيداع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (715, 'sending_any_other_coin_or_token_to_this_address_may_result_in_the_loss_of_your_deposit', 'Sending any other coin or token to this address may result in the loss of your deposit', 'L\'envoi de toute autre piÃ¨ce ou jeton Ã  cette adresse peut entraÃ®ner la perte de votre dÃ©pÃ´t', 'قد يؤدي إرسال أي عملة أو رمز مميز آخر إلى هذا العنوان إلى فقدان الإيداع الخاص بك');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (716, 'copy_address', 'Copy Address', 'Copier l\'adresse', 'نسخ العنوان');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (717, 'payment_process', 'Payment Process', 'Processus de paiement', 'قدم الآن');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (718, 'balance', 'Balance', 'Ã©quilibre', 'الرصيد');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (719, 'flag', 'Flag', 'Drapeau', 'علَم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (720, 'menu_background_color', 'Menu Background Color', 'Couleur d\'arrière-plan du menu', 'لون خلفية القائمة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (721, 'menu_font_color', 'Menu Font Color', 'Couleur de la police du menu', 'لون خط القائمة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (722, 'footer_background_color', 'Footer Background Color', 'Couleur de fond du bas de page', 'لون خلفية التذييل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (723, 'footer_font_color', 'Footer Font Color', 'Couleur de la police du pied de page', 'لون خط التذييل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (724, 'button_background_color', 'Button Background Color', 'Couleur d\'arrière-plan du bouton', 'لون خلفية الزر');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (725, 'button_font_color', 'Button Font Color', 'Couleur de la police du bouton', 'لون خط الزر');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (726, 'theme_color', 'Theme Color', 'Couleur du thème', 'لون الموضوع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (727, 'newsletter_background_color', 'Newsletter Background Color', 'Couleur d\'arrière-plan de la newsletter', 'لون خلفية الرسالة الإخبارية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (728, 'newsletter_font_color', 'Newsletter Font Color', 'Couleur de police de la newsletter', 'لون خط الرسالة الإخبارية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (729, 'newsletter_images', 'Newsletter Images', 'Images de la newsletter', 'صور النشرة الإخبارية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (730, 'pending-withdraw', 'Pending withdraw', 'En attente de retrait', 'في انتظار سحب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (731, 'withdraw-list', 'Withdraw List', 'Retirer la liste', 'قائمة السحب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (732, 'pending-deposit', 'Pending Deposit', 'Dépôt en attente', 'في انتظار الإيداع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (733, 'deposit-list', 'Deposit List', 'Liste de dépôt', 'قائمة الودائع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (734, 'add-credit', 'Add Credit', 'Ajouter un crédit', 'إضافة رصيد');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (735, 'open-order', 'Open Order', 'Commande Ouverte', 'طلب مفتوح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (736, 'trade-history', 'Trade History', 'Histoire Du Commerce', 'تاريخ التجارة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (737, 'exchanger', 'Exchanger', 'Échangeur', 'مبادل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (738, 'coin-pair', 'Coin Pair', 'Paire De Pièces', 'زوج العملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (739, 'user', 'User', 'Utilisateur', 'المستعمل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (740, 'add-user', 'Add User', 'Ajouter un utilisateur', 'إضافة مستخدم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (741, 'user-list', 'user list', 'liste d\'utilisateur', 'قائمة المستخدم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (742, 'verify-user', 'Verify User', 'Vérifier L\'utilisateur', 'تحقق من المستخدم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (743, 'subscriber-list', 'Subscriber List', 'Liste D\'abonnés', 'قائمة المشتركين');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (744, 'app-setting', 'App Setting', 'Réglage De L\'application', 'إعداد التطبيق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (745, 'block-list', 'Block List', 'Liste De Blocage', 'قائمة الحظر');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (746, 'fees-setting', 'Fees Setting', 'établissement Des Frais', 'تحديد الرسوم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (747, 'transaction-setup', 'Transaction Setup', 'Configuration De La Transaction', 'إعداد المعاملات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (748, 'email-sms-gateway', 'Email Sms Gateway', 'Passerelle Sms Email', 'بوابة البريد الإلكتروني الرسائل القصيرة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (749, 'payment-gateway', 'Payment Gateway', 'Passerelle De Paiement', 'بوابة الدفع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (750, 'affiliation', 'Affiliation', 'Affiliation', 'الانتماء');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (751, 'external-api-list', 'External Api List', 'Liste Des API Externes', 'قائمة Api الخارجية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (752, 'update-external-api', 'Update External Api', 'Mettre à Jour L\'API Externe', 'تحديث واجهة برمجة التطبيقات الخارجية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (753, 'phrase', 'Phrase', 'Phrase', 'عبارة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (754, 'edit-phrase', 'Edit Phrase', 'Modifier La Phrase', 'تحرير العبارة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (755, 'update-gateway', 'Update Gateway', 'Mettre à Jour La Passerelle', 'بوابة التحديث');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (756, 'edit-user', 'Edit User', 'Modifier L\'utilisateur', 'تحرير العضو');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (757, 'add-admin', 'Add Admin', 'Ajouter Un Administrateur', 'إضافة المسؤول');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (758, 'admin-list', 'Admin List', 'Liste D\'administrateurs', 'قائمة المسؤول');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (759, 'cms', 'CMS', 'CMS', 'سم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (760, 'themes-setting', 'Themes Setting', 'Réglage Des Thèmes', 'إعداد الموضوعات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (761, 'page-content-list', 'Page Content List', 'Liste De Contenu De Page', 'قائمة محتويات الصفحة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (762, 'faq-list', 'Faq List', 'Liste De Faq', 'قائمة الأسئلة الشائعة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (763, 'notice-list', 'Notice List', 'Liste D\'avis', 'قائمة الإشعارات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (764, 'edit-page-content', 'Edit Page Content', 'Modifier Le Contenu De La Page', 'تحرير محتوى الصفحة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (765, 'edit-faq', 'Edit Faq', 'Modifier La FAQ', 'تحرير التعليمات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (766, 'edit-notice', 'Edit Notice', 'Modifier L\'avis', 'تحرير الإخطار');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (767, 'add-page-content', 'Add Page Content', 'Ajouter Du Contenu De Page', 'أضف محتوى الصفحة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (768, 'add-faq', 'Add Faq', 'Ajouter Une FAQ', 'أضف التعليمات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (769, 'news-list', 'News List', 'Liste De Nouvelles', 'قائمة الأخبار');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (770, 'add-news', 'Add News', 'Ajouter Des Nouvelles', 'أضف أخبار');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (771, 'edit-news', 'Edit News', 'Modifier Les Actualités', 'تحرير الأخبار');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (772, 'category-list', 'Category List', 'Liste Des Catégories', 'قائمة الفئات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (773, 'add-category', 'Add Category', 'Ajouter Une Catégorie', 'إضافة فئة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (774, 'edit-category', 'Edit Category', 'Modifier La Catégorie', 'تحرير الفئة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (775, 'slider-list', 'Slider List', 'Liste De Curseurs', 'قائمة المنزلق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (776, 'add-slider', 'Add Slider', 'Ajouter Un Curseur', 'أضف شريط التمرير');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (777, 'edit-slider', 'Edit Slider', 'Modifier Le Curseur', 'تحرير شريط التمرير');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (778, 'social-link-list', 'Social Link List', 'Liste De Liens Sociaux', 'قائمة الروابط الاجتماعية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (779, 'edit-social-link', 'Edit Social Link', 'Modifier Le Lien Social', 'تحرير الارتباط الاجتماعي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (780, 'advertisement-list', 'Advertisement List', 'Liste De Publicités', 'قائمة الإعلانات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (781, 'add-advertisement', 'Add Advertisement', 'Ajouter Une Publicité', 'أضف إعلان');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (782, 'edit-advertisement', 'Edit Advertisement', 'Modifier La Publicité', 'تحرير إعلان');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (783, 'web-language-list', 'Web Language List', 'Liste Des Langues Web', 'قائمة لغة الويب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (784, 'autoupdate', 'Autoupdate', 'Mise à Jour Automatique', 'التحديث التلقائي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (785, 'latest-version', 'Latest Version', 'Dernière Version', 'احدث اصدار');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (786, 'current-version', 'Current Version', 'Version Actuelle', 'النسخة الحالية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (787, 'subscriber', 'Subscriber', 'Abonné', 'مشترك');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (788, 'affiliation-setup', 'Affiliation Setup', 'Configuration De L\'affiliation', 'إعداد الانتساب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (789, 'external-api', 'External API', 'API Externe', 'API الخارجية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (790, 'support', 'Support', 'Soutien', 'الدعم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (791, 'no-update-available', 'No Update Available', 'Pas De Mise A Jour Disponible', 'أي تحديث متاح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (792, 'full-name', 'Full Name', 'Nom Complet', 'الاسم الكامل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (793, 'initial-price', 'Initial Price', 'Prix ???initial', 'السعر المبدئي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (794, 'test_bdtask', 'Bdtask Limited', 'Bdtask limité', 'Bdtask المحدودة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (795, 'email_sms_template', 'E-mail And SMS Template', 'E-mail And SMS Template', 'قالب البريد الإلكتروني والرسائل القصيرة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (796, 'template-english', 'Template English', 'Modèle Anglais', 'نموذج باللغة الإنجليزية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (797, 'template-french', 'Template French', 'Modèle Français', 'قالب فرنسي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (798, 'template-name', 'Template Name', 'Nom Du Modèle', 'اسم القالب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (799, 'template-type', 'Template Type', 'Type De Modèle', 'نوع النموذج');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (800, 'template-update', 'Template-update', 'Template-update', 'تحديث النموذج');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (801, 'email-sms-template', 'Email Sms Template', 'Modèle De Courrier électronique SMS', 'نموذج البريد الإلكتروني SMS');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (802, 'transfer_verification', 'Transfer Verification', 'Vérification Du Transfert', 'التحقق من التحويل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (803, 'transfer_success', 'Transfer Success', 'Succès Du Transfert', 'نجاح النقل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (804, 'withdraw_verification', 'Withdraw Verification', 'Retirer La Vérification', 'سحب التحقق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (805, 'withdraw_success', 'Withdraw Success', 'Retirer Le Succès', 'سحب النجاح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (806, 'profile_update', 'Profile Update', 'Mise à Jour Du Profil', 'تحديث الملف الشخصي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (807, 'deposit_success', 'Deposit Success', 'Réussite Du Dépôt', 'نجاح الإيداع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (808, 'registered', 'Registered', 'Inscrit', 'مسجل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (809, 'email_address', 'Email Address', 'Adresse E-mail', 'عنوان البريد الالكترونى');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (810, 'template_type', 'Template Type', 'Type De Modèle', 'نوع النموذج');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (811, 'subject_english', 'Subject English', 'Sujet Anglais', 'مادة الانجليزية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (812, 'subject_french', 'Subject French', 'Sujet Français', 'الموضوع الفرنسية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (813, 'purchase_key', 'Purchase Key', 'Clé D\'achat', 'مفتاح الشراء');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (814, 'module', 'Module', 'Module', 'وحدة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (815, 'add_module', 'Add Module', 'Ajouter Un Module', 'إضافة وحدة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (816, 'overwrite', 'Overwrite', 'écraser', 'الكتابة فوق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (817, 'theme_uploaded_successfully', 'Theme Uploaded Successfully', 'Thème Téléchargé Avec Succès', 'تم تحميل الموضوع بنجاح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (818, 'there_was_a_problem_with_the_upload', 'There Was A Problem With The Upload', 'Il Y A Eu Un Problème Avec Le Téléchargement', 'كانت هناك مشكلة في التحميل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (819, 'invalid_purchase_key', 'Invalid Purchase Key', 'Clé D\'achat Invalide', 'مفتاح شراء غير صالح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (820, 'buy_now', 'Buy Now', 'Acheter Maintenant', 'اشتري الآن');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (821, 'install', 'Install', 'Installer', 'تثبيت');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (822, 'invalid_module', 'Invalid Module', 'Module Invalide', 'وحدة غير صالحة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (823, 'module_added_successfully', 'Module Added Successfully', 'Module Ajouté Avec Succès', 'تمت إضافة الوحدة بنجاح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (824, 'no_tables_are_registered_in_config', 'No Tables Are Registered_in Config', 'Aucune Table N\'est Enregistrée Dans La Configuration', 'لم يتم تسجيل أي جداول في التكوين');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (825, 'themes', 'Themes', 'Thèmes', 'ثيمات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (826, 'module_list', 'Module List', 'Liste Des Modules', 'قائمة الوحدة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (827, 'theme_active_successfully', 'Theme Active Successfully', 'Thème Actif Avec Succès', 'تم تفعيل الموضوع بنجاح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (828, 'theme_name', 'Theme Name', 'Nom Du Thème', 'اسم الموضوع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (829, 'upload', 'Upload', 'Télécharger', 'تحميل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (830, 'downloaded_successfully', 'Downloaded Successfully', 'Téléchargé Avec Succès', 'تم التنزيل بنجاح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (831, 'failed_try_again', 'Failed Try Again', 'échec Réessayer', 'فشل - الرجاء المحاولة مرة أخرى');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (832, 'no_theme_available', 'No Theme Available', 'Aucun Thème Disponible', 'لا يوجد موضوع متاح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (833, 'download', 'Download', 'Télécharger', 'تحميل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (834, 'theme_list', 'Theme List', 'Liste De Thèmes', 'قائمة الموضوع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (835, 'addon', 'Addon', 'Ajouter', 'اضافه');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (836, 'add_theme', 'Add Theme', 'Ajouter Un Thème', 'إضافة موضوع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (837, 'download_theme', 'Download Theme', 'Télécharger Le Thème', 'تحميل الموضوع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (838, 'uninstall', 'Uninstall', 'Désinstaller', 'الغاء التثبيت');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (839, 'please_wait', 'Please Wait', 'S\'il Vous Plaît, Attendez', 'أرجو الإنتظار');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (840, 'current', 'Current', 'Actuel', 'تيار');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (841, 'back_to_home', 'Back To Home', 'De Retour à La Maison', 'العودة إلى المنزل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (842, 'trading_history', 'Trading History', 'Historique Du Trading', 'تاريخ التداول');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (843, 'latest_news', 'Latest News', 'Dernières Nouvelles', 'أحدث الأخبار');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (844, 'create_an_account', 'Create An Account', 'Créer Un Compte', 'انشئ حساب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (845, 'to__trade', 'To  Trade', 'échanger', 'للتجارة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (846, 'log_in', 'Log In', 'S\'identifier', 'تسجيل الدخول');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (847, 'white', 'WHITE', 'BLANC', 'أبيض');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (848, 'dark', 'DARK', 'FONCÉ', 'مظلم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (849, 'enter_your_email_address_to_retrieve_your_password', 'Enter Your Email Address To Retrieve Your Password', 'Entrez Votre Adresse E-mail Pour Récupérer Votre Mot De Passe', 'أدخل عنوان بريدك الإلكتروني لاسترداد كلمة المرور الخاصة بك');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (850, 'retrieve_password', 'Retrieve Password', 'Récupérer Mot De Passe', 'استرجاع كلمة المرور');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (851, 'not_a_member_yet', 'Not A Member Yet', 'Pas Encore Membre', 'لست عضوا حتى الآن');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (852, 'total_users', 'Total Users', 'Nombre Total D\'utilisateurs', 'إجمالي المستخدمين');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (853, 'all_users', 'All Users', 'Tous Les Utilisateurs', 'جميع المستخدمين');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (854, 'all_markets', 'All Markets', 'Tous Les Marchés', 'جميع الأسواق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (855, 'method', 'Method', 'Méthode', 'طريقة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (856, 'slider_title_engnilsh', 'Slider Title Engnilsh', 'Titre Du Curseur Engnilsh', 'عنوان المنزلق Engnilsh');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (857, 'slider_h1', 'Slider H1', 'Curseur H1', 'المنزلق H1');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (858, 'sub_title_english', 'Sub Title English', 'Sous-titre Anglais', 'الترجمة الإنجليزية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (859, 'slider_h2', 'Slider H2', 'Curseur H2', 'المنزلق H2');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (860, 'button_text', 'Button Text', 'Texte Du Bouton', 'زر كتابة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (861, 'slider_h3', 'Slider H3', 'Curseur H3', 'المنزلق H3');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (862, 'code', 'Code', 'Code', 'شفرة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (863, 'language_name', 'Language Name', 'Nom De La Langue', 'اسم اللغة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (864, 'add_coin_pair', 'Add Coin Pair', 'Ajouter Une Paire De Pièces', 'إضافة زوج عملات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (865, 'cryptocoin_add', 'Cryptocoin Add', 'Ajout De Crypto-monnaie', 'إضافة Cryptocoin');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (866, 'add-coin-pair', 'Add-coin-pair', 'Ajouter Une Paire De Pièces', 'إضافة زوج عملات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (867, 'security', 'Security', 'Sécurité', 'حماية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (868, 'edita_dmin', 'Edita Dmin', 'Edita Dmin', 'إيديتا دمين');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (869, 'edit-admin', 'Edit-admin', 'Edit-admin', 'تحرير المسؤول');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (870, 'article1_en', 'Article1 En', 'Article1 Fr', 'المادة 1 En');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (871, 'question_english', 'Question English', 'Question Anglais', 'سؤال اللغة الإنجليزية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (872, 'add-notice', 'Add-notice', 'Add-notice', 'إضافة إشعار');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (873, 'edit-profile', 'Edit-profile', 'Editer Le Profil', 'تعديل الملف الشخصي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (874, '_phrase_name', ' Phrase Name', 'Nom De La Phrase', 'اسم العبارة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (875, 'cryptocoin-edit', 'Cryptocoin-edit', 'Crypto-monnaie-modifier', 'Cryptocoin تحرير');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (876, 'edit-market', 'Edit-market', 'Edit-market', 'تحرير السوق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (877, 'edit-coin-pair', 'Edit-coin-pair', 'Modifier La Paire De Pièces', 'تحرير زوج العملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (878, 'transaction_type', 'Transaction Type', 'Type De Transaction', 'نوع المعاملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (879, 'account_type', 'Account Type', 'Type De Compte', 'نوع الحساب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (880, 'unverified', 'Unverified', 'Non Vérifié', 'لم يتم التحقق منه');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (881, 'limit_amount', 'Limit Amount', 'Montant Limite', 'الحد المبلغ');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (882, 'percent', 'Percent', 'Pour Cent', 'نسبه مئويه');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (883, 'fixed', 'Fixed', 'Fixé', 'مُثَبَّت');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (884, 'api_name', 'API Name', 'Nom De L\'API', 'اسم API');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (885, 'merchant_id', 'Merchant Id', 'Identifiant Du Marchand', 'معرّف التاجر');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (886, 'email_gateway', 'Email Gateway', 'Passerelle De Messagerie', 'بوابة البريد الإلكتروني');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (887, 'sms_gateway', 'Sms Gateway', 'Passerelle Sms', 'بوابة الرسائل القصيرة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (888, 'credit-list', 'Credit-list', 'Liste De Crédit', 'قائمة الائتمان');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (889, 'cryptocoin-add', 'Add Currency', 'Ajouter une devise', 'أضف العملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (890, 'see_all_users', 'See All Users', 'Voir Tous Les Utilisateurs', 'انظر جميع المستخدمين');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (891, 'see_all_markets', 'See All Markets', 'Voir Tous Les Marchés', 'انظر جميع الأسواق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (892, 'see_trade_history', 'See Trade History', 'Voir L\'historique Du Commerce', 'انظر تاريخ التجارة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (893, 'buy_&_sell', 'Buy & Sell', 'Acheter Vendre', 'شراء بيع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (894, 'deposit,_withdraw,_transfer', 'Deposit, Withdraw, Transfer', 'Dépôt, Retrait, Transfert', 'الإيداع والسحب والتحويل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (895, 'see_all_pending_withdraw', 'See All Pending Withdraw', 'Voir Tous Les Retraits En Attente', 'انظر كل الانسحاب المعلق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (896, 'see_all_trade_history', 'See All Trade History', 'Voir Toute L\'histoire Du Commerce', 'انظر جميع تاريخ التجارة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (897, 'user_growth_rate', 'USER GROWTH RATE', 'TAUX DE CROISSANCE DES UTILISATEURS', 'معدل نمو المستخدم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (898, 'email_sms_settings', 'Email Sms Settings', 'Paramètres De Messagerie électronique', 'إعدادات البريد الإلكتروني SMS');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (899, 'email-sms-settings', 'Email-sms-settings', 'Email-sms-settings', 'إعدادات البريد الإلكتروني');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (900, 'fees_collection', 'Fees Collection', 'Perception Des Frais', 'تحصيل الرسوم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (901, 'create_user', 'Create User', 'Créer Un Utilisateur', 'إنشاء مستخدم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (902, 'create_admin', 'Create Admin', 'Créer Un Administrateur', 'إنشاء المسؤول');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (903, 'add-ons', 'Add-ons', 'Add-ons', 'الإضافات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (904, 'max_sell_currency_amount', 'Max Sell Currency Amount', 'Montant Maximal De La Devise De Vente', 'الحد الأقصى لمبلغ عملة البيع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (905, 'max_buy_currency_amount', 'Max Buy Currency Amount', 'Montant Maximal De La Devise D\'achat', 'الحد الأقصى لمبلغ عملة الشراء');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (906, 'account', 'Account', 'Compte', 'الحساب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (907, 'google_captcha', 'Google Captcha', 'Google Capture', 'جوجل كابتشا');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (908, 'add_captcha_at_your_domain', 'Add captcha at your domain', 'Domaine De Configuration', 'إضافة الكابتشا في المجال الخاص بك');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (909, 'pages', 'Pages', 'Pages', 'الصفحات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (910, 'useful_links', 'Useful Links', 'Liens Utiles', 'روابط مفيدة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (911, 'check_your_email_server', 'Check Your Email Server', 'Vérifiez Votre Serveur De Messagerie', 'تحقق من خادم البريد الإلكتروني الخاص بك');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (912, 'check_your_sms_gateway_', 'Check Your Sms Gateway ', 'Vérifiez Votre Passerelle SMS', 'تحقق من بوابة الرسائل القصيرة الخاصة بك');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (913, 'mobile_no', 'Mobile No', 'Mobile Non', 'رقم الموبايل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (914, 'email_gateway_setup', 'Email Gateway Setup', 'Configuration De La Passerelle De Messagerie', 'إعداد بوابة البريد الإلكتروني');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (915, 'sms_gateway_setup', 'SMS Gateway Setup', 'Configuration De La Passerelle SMS', 'إعداد بوابة الرسائل القصيرة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (916, 'check_your_sms_gateway', 'Check Your Sms Gateway', 'Vérifiez Votre Passerelle SMS', 'تحقق من بوابة الرسائل القصيرة الخاصة بك');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (917, 'logo_type', 'Logo Type', 'Type De Logo', 'نوع الشعار');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (918, 'log_type', 'Log Type', 'Type De Journal', 'نوع السجل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (919, 'body_background_color', 'Body Background Color', 'Couleur D\'arrière-plan Du Corps', 'لون خلفية الجسم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (920, 'body_font_color', 'Body Font Color', 'Couleur De La Police Du Corps', 'لون خط النص الأساسي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (921, 'top_footer_horizontal_border_color', 'Top Footer Horizontal Border Color', 'Couleur De La Bordure Horizontale Du Pied De Page Supérieur', 'لون الحد الأفقي في التذييل العلوي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (922, 'footer__menu_border_color', 'Footer  Menu Border Color', 'Couleur De La Bordure Du Menu Du Pied De Page', 'لون حدود قائمة التذييل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (923, 'footer_menu_border_color', 'Footer Menu Border Color', 'Couleur De La Bordure Du Menu Du Pied De Page', 'لون حدود قائمة التذييل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (924, 'bottom_footer_background_color', 'Bottom Footer Background Color', 'Couleur D\'arrière-plan Du Pied De Page Inférieur', 'لون خلفية التذييل السفلي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (925, 'bottom_footer_font_color', 'Bottom Footer Font Color', 'Couleur De Police Du Pied De Page Inférieur', 'لون خط التذييل السفلي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (926, 'form_background_color', 'Form Background Color', 'Couleur D\'arrière-plan Du Formulaire', 'لون خلفية النموذج');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (927, 'form_border_color', 'Form Border Color', 'Couleur De La Bordure Du Formulaire', 'لون حدود النموذج');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (928, 'form_label_color', 'Form Label Color', 'Couleur De L\'étiquette Du Formulaire', 'لون تسمية النموذج');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (929, 'form_input_field_background_color', 'Form Input Field Background Color', 'Couleur d\'arrière-plan du champ de saisie du formulaire', 'لون خلفية حقل إدخال النموذج');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (930, 'input_field_border_color', 'Input Field Border Color', 'Couleur De La Bordure Du Champ De Saisie', 'لون حدود حقل الإدخال');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (931, 'input_field_color', 'Input Field Color', 'Couleur Du Champ De Saisie', 'لون حقل الإدخال');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (932, 'verify_profile', 'Verify Profile', 'Vérifier Le Profil', 'تحقق من الملف الشخصي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (933, 'contact_with_us', 'Contact With Us', 'En Contact Avec Nous', 'اتصل بنا');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (934, 'working_hours', 'Working Hours', 'Heures D\'ouverture', 'ساعات العمل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (935, 'phone_number', 'Phone Number', 'Numéro De Téléphone', 'رقم الهاتف');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (936, 'bank_payment', 'Bank Payment', 'Paiement Bancaire', 'بنك');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (937, 'themes_setting', 'Themes Setting', 'Réglage Des Thèmes', 'إعداد السمات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (938, 'page_content_list', 'Page Content List', 'Liste Du Contenu De La Page', 'قائمة محتويات الصفحة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (939, 'notice_list', 'Notice List', 'Liste Des Avis', 'قائمة الإشعارات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (940, 'category_list', 'Category List', 'Liste Des Catégories', 'قائمة الفئات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (941, 'social_link_list', 'Social Link List', 'Liste De Liens Sociaux', 'الرابط الاجتماعي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (942, 'advertisement_list', 'Advertisement List', 'Liste Des Publicités', 'قائمة الإعلانات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (943, 'web_language_list', 'Web Language List', 'Liste Des Langues Web', 'قائمة لغة الويب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (944, 'coinpayment', 'Coinpayment', 'Paiement Par Pièces', 'الدفع بالعملة المعدنية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (945, 'gourl', 'Gourl', 'Gourle', 'جورل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (946, 'paypal', 'Paypal', 'Pay Pal', 'باي بال');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (947, 'transaction_setup', 'Transaction Setup', 'Configuration Des Transactions', 'إعداد المعاملات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (948, 'external_api_list', 'External Api List', 'Liste D\'API Externes', 'قائمة Api الخارجية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (949, 'bank_payment', 'Bank Payment', 'Bank', 'بنك');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (950, 'coinpayment', 'Coinpayment', 'Coinpayment', 'الدفع بالعملة المعدنية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (951, 'gourl', 'Gourl', 'Gourl', 'جورل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (952, 'paypal', 'Paypal', 'Paypal', 'باي بال');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (953, 'paystack', 'Paystack', 'Pile de paie', 'رواتب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (954, 'stripe', 'Stripe', 'Stripe', 'شريط');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (955, 'token_payment', 'Token', 'Token', 'رمز');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (956, 'page_content_list', 'Page Content List', 'Page Content List', 'قائمة محتويات الصفحة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (957, 'themes_setting', 'Themes Setting', 'Themes Setting', 'إعداد السمات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (958, 'notice_list', 'Notice List', 'Notice List', 'قائمة الإشعارات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (959, 'category_list', 'Category List', 'Category List', 'قائمة الفئات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (960, 'social_link_list', 'Social Link List', 'Social Link', 'الرابط الاجتماعي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (961, 'advertisement_list', 'Advertisement List', 'Advertisement List', 'قائمة الإعلانات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (962, 'web_language_list', 'Web Language List', 'Web Language List', 'قائمة لغة الويب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (963, 'transaction_setup', 'Transaction Setup', 'Transaction Setup', 'إعداد المعاملات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (964, 'external_api_list', 'External Api List', 'External Api List', 'قائمة Api الخارجية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (965, 'verify_users', 'Verify Users', 'Verify Users', 'تحقق من المستخدمين');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (966, 'subscriber_list', 'Subscriber List', 'Subscriber List', 'قائمة المشتركين');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (967, 'order_book', 'Order Book', 'Order Book', 'سجل الطلبيات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (968, 'trades', 'trades', 'trades', 'الصفقات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (969, 'order_placement', 'Order Placement', 'Order Placement', 'ترتيب التنسيب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (970, 'search_pair', 'Search Pair', 'Search Pair', 'بحث عن زوج');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (971, 'more', 'More', 'More', 'أكثر');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (972, 'from_date', 'From Date', 'Partir De La Date', 'من التاريخ');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (973, 'to_date', 'To Date', 'À Ce Jour', 'حتي اليوم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (974, 'coins', 'Coins', 'Pièces De Monnaie', 'عملات معدنية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (975, 'select_coin', 'Select Coin', 'Sélectionnez La Pièce', 'اختر عملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (976, 'select_status', 'Select Status', 'Sélectionnez Le Statut', 'حدد الحالة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (977, 'trade_type', 'Trade Type', 'Type De Commerce', 'نوع التجارة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (978, 'select_trade_type', 'Select Trade Type', 'Sélectionnez Le Type De Commerce', 'حدد نوع التجارة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (979, 'open_trade', 'Open Trade', 'Commerce Ouvert', 'فتح التجارة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (980, 'complete_trade', 'Complete Trade', 'Commerce Complet', 'التجارة الكاملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (981, 'canceled_trade', 'Canceled Trade', 'Commerce Annulé', 'التجارة الملغاة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (982, 'bid_type', 'Bid Type', 'Type D\'enchère', 'نوع العطاء');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (983, 'select_bid_type', 'Select Bid Type', 'Sélectionnez Le Type D\'enchère', 'حدد نوع العطاء');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (984, 'receiver', 'Receiver', 'Receveur', 'المتلقي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (985, 'paytm', 'Paytm', 'Paytm', 'Paytm');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (986, 'merchant_key', 'Merchant Key', 'Clé du marchand', 'مفتاح التاجر');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (987, 'merchant_mid', 'Merchant MID', 'MID marchand', 'تاجر MID');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (988, 'paytm', 'Paytm', 'Paytm', 'Paytm');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (989, 'admin_password', 'Admin Password', 'Mot De Passe D administrateur', 'كلمة سر المشرف');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (990, 'admin_wallet', 'Admin Wallet', 'Portefeuille Administrateur', 'محفظة المسؤول');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (991, 'coin_symbol', 'Coin Symbol', 'Coin Symbol F', 'رمز العملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (992, 'initial_price', 'Initial Price', 'Initial Price Fr', 'السعر المبدئي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (993, 'coin_logo', 'Coin Logo', 'Logo De PiÃ¨ce De Monnaie', 'شعار العملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (994, 'contract_address', 'Contract Address', 'Adresse de contact', 'عنوان العقد');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (995, 'creator', 'Creator ', 'CrÃƒÂ©ateur', 'المنشئ');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (996, 'proof_type', 'Proof Type', 'Preuve Type', 'نوع الإثبات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (997, 'add_coin', 'Add Coin', 'Ajouter une piÃƒÂ¨ce', 'أضف عملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (998, 'token_symbol', 'Token Symbol', 'Token Symbol fr', 'رمز الرمز');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (999, 'decimal_value', 'Decimal Value', 'valeur dÃƒÂ©cimale', 'قيمة عشرية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1000, 'creator_address', 'Creator Address', 'Adresse Du CrÃ©ateur', 'عنوان المنشئ');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1001, 'deposit_confirm', 'Deposit Confirm', 'DÃ©pÃ´t Confirmer', 'تأكيد الإيداع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1002, 'balance_receive_from_user', 'Balance Receive From User', 'Solde ReÃ§u De L\'utilisateur', 'استلام الرصيد من المستخدم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1003, 'sent_user_balance', 'Sent User Balance', 'Solde De L\'utilisateur EnvoyÃ©', 'رصيد المستخدم المرسل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1004, 'decimal', 'Decimal ', 'DÃ©cimal', 'عدد عشري');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1005, 'supply', 'Supply ', 'La Fourniture', 'إمداد');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1006, 'position', 'Position ', 'Positionner', 'موقع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1007, 'server_ip', 'Server IP', 'IP Du Serveur', 'خادم IP');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1008, 'database_name', 'Database Name', 'Nom De La Base De DonnÃ©es', 'اسم قاعدة البيانات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1009, 'user_name', 'User Name', 'Nom D\'utilisateur', 'اسم االمستخدم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1010, 'infura_id', 'Infura ID', 'Identifiant Infura', 'معرف Infura');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1011, 'minimum_amount', 'Minimum Amount', 'Montant Minimal', 'الحد الأدنى للمبلغ');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1012, 'maximum_amount', 'Maximum Amount', 'QuantitÃ© Maximale', 'الحد الأقصى للمبلغ');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1013, 'documentation', 'Documentation', 'Documentations fr', 'التوثيق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1014, 'note', 'Note ', 'Noter', 'ملحوظة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1015, 'you_can_use_above_link_for_cron_job_copy_and_past_at_cron_job_command_box', 'You Can Use Above Link For Cron Job. Copy And Past At Cron Job Command Box', 'Vous Pouvez Utiliser Le Lien Ci-dessus Pour Le Travail Cron.', 'يمكنك استخدام الرابط أعلاه لوظيفة Cron. ');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1016, 'set_cron_job_once_per_2_minutes', 'Set Cron Job Once Per 2 Minutes', 'DÃ©finir La TÃ¢che Cron Une Fois Toutes Les 2 Minutes', 'اضبط وظيفة كرون مرة واحدة في دقيقتين');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1017, 'set_cron_job_once_per_5_minutes', 'Set Cron Job Once Per 5 Minutes', 'DÃ©finir La TÃ¢che Cron Une Fois Toutes Les 5 Minutes', 'اضبط وظيفة كرون مرة واحدة كل 5 دقائق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1018, 'initial', 'Initial ', 'Initiale', 'مبدئي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1019, 'create_your_infura_account', 'Create Your Infura Account', 'CrÃ©ez Votre Compte Infura', 'قم بإنشاء حساب Infura الخاص بك');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1020, 'data_not_found', 'Data Not Found', 'DonnÃ©es Non TrouvÃ©es', 'لم يتم العثور على بيانات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1021, 'fund_received', 'Fund Received', 'Fonds ReÃ§u', 'تم استلام الأموال');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1022, 'please_note', 'Please Note', 'Veuillez Noter', 'يرجى الملاحظة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1023, 'coins_will_be_deposited_when_you_add_amount_in_this_wallet', 'Coins Will Be Deposited, When You Add Amount In This Wallet', 'Les PiÃ¨ces Seront DÃ©posÃ©es Lorsque Vous Ajoutez Un Montant Dans Ce Portefeuille', 'سيتم إيداع العملات المعدنية ، عند إضافة مبلغ في هذه المحفظة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1024, 'your_transaction_validity_24_hours_please_deposit_this_wallet_immediately', 'Your Transaction Validity 2 Hours  Please Deposit This Wallet Immediately', 'ValiditÃ© De Votre Transaction 2 Heures Veuillez DÃ©poser Ce Portefeuille ImmÃ©diatement', 'صصلاحية معاملتك ساعتين يرجى إيداع هذه المحفظة على الفور  ');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1025, 'server_error_please_try_again', 'Server Error Please Try Again', 'Erreur De Serveur, Veuillez RÃ©essayer', 'خطأ في الخادم ، يرجى المحاولة مرة أخرى');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1026, 'please_enter_minimum_amount', 'Please Enter Minimum Amount', 'Veuillez Saisir Le Montant Minimum', 'الرجاء إدخال الحد الأدنى للمبلغ');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1027, 'and_maximum_amount', 'And Maximum Amount', 'Et Montant Maximum', 'والمبلغ الأقصى');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1028, 'token_logo_url', 'Token Logo Url', 'URL Du Logo Du Jeton', 'عنوان URL لشعار الرمز المميز');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1029, 'this_symbol_already_exist', 'This Symbol Already Exist', 'Ce Symbole Existe DÃ©jÃ ', 'هذا الرمز موجود بالفعل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1030, 'this_url_is_invalid', 'This URL Is Invalid', 'Cette URL N\'est Pas Valide', 'عنوان URL هذا غير صالح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1031, 'coin_logo_not_found', 'Coin Logo Not Found', 'Logo De La PiÃ¨ce Introuvable', 'لم يتم العثور على شعار العملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1032, 'coin_added_successfully', 'Coin Added Successfully', 'PiÃ¨ce AjoutÃ©e Avec SuccÃ¨s', 'تمت إضافة العملة بنجاح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1033, 'your_withdraw_transaction_successfully_sent_please_wait_for_confirmation', 'Your Withdraw Transaction Successfully Sent, Please Wait For Confirmation', 'Votre Transaction De Retrait A Ã©tÃ© EnvoyÃ©e Avec SuccÃ¨s, Veuillez Attendre La Confirmation', 'تم إرسال معاملة السحب الخاصة بك بنجاح ، يرجى انتظار التأكيد');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1034, 'your_confirmation_already_placed', 'Your Confirmation Already Placed', 'Votre Confirmation DÃ©jÃ  PlacÃ©e', 'تم تقديم التأكيد الخاص بك بالفعل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1035, 'your_user_name_or_password_is_wrong', 'Your User Name Or Password Is Wrong', 'Votre Nom D\'utilisateur Ou Mot De Passe Est Incorrect', 'اسم المستخدم أو كلمة المرور الخاصة بك خاطئة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1036, 'don_not_use_your_existing_database_in_your_project_please_use_another_database', 'Don Not Use Your Existing Database In Your Project,please Use Another Database', 'N\'utilisez Pas Votre Base De DonnÃ©es Existante Dans Votre Projet, Veuillez Utiliser Une Autre Base De DonnÃ©es', 'لا تستخدم قاعدة البيانات الموجودة في مشروعك ، يرجى استخدام قاعدة بيانات أخرى');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1037, 'this_symbol_already_exists', 'This Symbol Already Exists', 'Ce Symbole Existe DÃ©jÃ ', 'هذا الرمز موجود بالفعل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1038, 'market_symbol', 'Market Symbol', 'Symbole Du MarchÃ©', 'رمز السوق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1039, 'available_serial', 'Available Serial', 'sÃ©rie disponible', 'المسلسل المتاح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1040, 'erc20_wallet', 'ERC20 Wallet Address', 'Portefeuille ERC20', 'عنوان محفظة ERC20');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1041, 'erc20_private_key', 'ERC20 Private Key', 'ClÃ© PrivÃ©e ERC20', 'المفتاح الخاص ERC20');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1042, 'erc20', 'ERC20 ', 'ERC20 fr', 'ERC20');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1043, 'admin_bep20_wallet_setup', 'Admin BEP20 Wallet Setup', 'Configuration Du Portefeuille Administrateur BEP20', 'إعداد المحفظة المسؤول BEP20');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1044, 'erc20_coin', 'ERC20 Coin', 'PiÃ¨ce De Monnaie ERC20', 'عملة ERC20');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1045, 'add_erc20_coin', 'ADD ERC20 COIN', 'Add Coin ERC20', 'أضف عملة ERC20');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1046, 'erc20_market', 'ERC20 Market', 'MarchÃ© ERC20', 'سوق ERC20');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1047, 'erc20_coin_pair', 'ERC20 Coin Pair', 'Paire De PiÃ¨ces ERC20', 'زوج العملات ERC20');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1048, 'create_erc20_wallet', 'Admin ERC20 Wallet Setup', 'Admin ERC20 Wallet Setup', 'إعداد المحفظة الإدارية ERC20');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1049, 'erc20_balance', 'ERC20 Balance', 'Balance ERC20', 'ميزان ERC20');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1050, 'erc20_diposit_address', 'ERC20 Deposit Address', 'Adresse de dépôt ERC20', 'عنوان الإيداع ERC20');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1051, 'rpc_url', 'RPC URL', 'URL RPC', 'عنوان URL لـ RPC');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1052, 'subscription_payment', 'Subscription Payment', 'Paiement de labonnement', 'دفع الاشتراك');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1053, 'set_cron_job_once_per_5_hours', 'Set Cron Job Once Per 5 Hours', 'Set Cron Job Once Per 5 Hours', 'اضبط وظيفة كرون مرة واحدة كل 5 ساعات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1054, 'your_transaction_validity_24_hours__please_deposit_this_wallet_immediately', 'Your transaction validity 24 hours please deposit this wallet immediately', 'Your transaction validity 24 hours please deposit this wallet as soon as possible', 'صلاحية معاملتك 24 ساعة ، يرجى إيداع هذه المحفظة على الفور');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1055, 'upload_pdf', 'Upload pdf file', 'Téléchargez le fichier pdf', 'تحميل ملف pdf');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1056, 'link_with_pdf', 'Link page with a pdf file', 'Page de lien avec un fichier pdf', 'صفحة الارتباط بملف pdf');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1057, 'site_description', 'Meta Description', 'Meta Description', 'ميتا الوصف');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1058, 'site_keywords', 'Meta Keywords', 'Méta-mots clés', 'كلمات دلالية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1059, 'page_height', 'Pdf Container Height', 'Hauteur du conteneur PDF', 'ارتفاع حاوية PDF');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1060, 'bep20', 'BEP20', 'BEP20', 'BEP20');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1061, 'bep20_wallet_address', 'BEP20 Wallet Address', 'BEP20 Wallet Address', 'عنوان المحفظة BEP20');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1062, 'bep20_private_key', 'BEP20 Private Key', 'BEP20 Private Key', 'المفتاح الخاص BEP20');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1063, 'tearms_conditions_text', 'I agree with your Privacy Policy and Terms and Conditions.', 'Je suis d\'accord avec votre politique de confidentialité et vos conditions d\'utilisation.', 'أأوافق على سياسة الخصوصية والشروط والأحكام الخاصة بك.');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1064, 'bank_address', 'Bank Address', 'Adresse de la banque', 'عنوان البنك');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1065, 'sid', 'Account SID', 'ID du compte', 'SID الحساب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1066, 'auth_token', 'Auth Token', 'Jeton d\'authentification', 'رمز المصادقة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1067, 'phone_number', 'Phone Number', 'Numéro de téléphone', 'رقم الهاتف');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1068, 'default_pair', 'Is Default Coin Pair', 'Est la paire de pièces par défaut', 'هو زوج العملات الافتراضي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1069, 'show_trademenu_without_verify', 'Is show trading menu without login', 'Est-ce que le menu de trading est affiché sans connexion', 'هو إظهار قائمة التداول دون تسجيل الدخول');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1070, 'phone-verify', 'Verify Phone', 'Vérifier le téléphone', 'تحقق من الهاتف');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1071, 'email-verify', 'Verify Email', 'Vérifier les courriels', 'التحقق من البريد الإلكتروني');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1072, 'code_didnot_match', 'Verification code didn\'t match', 'Le code de vérification ne correspond pas', 'رمز التحقق غير متطابق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1073, 'verify_text_email', 'Please enter the verification code that has been sent to your email, in the box below.', 'Veuillez entrer le code de vérification qui a été envoyé à votre adresse e-mail, dans la case ci-dessous.', 'الرجاء إدخال رمز التحقق الذي تم إرساله إلى بريدك الإلكتروني ، في المربع أدناه.');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1074, 'verify_text_phone', 'Please enter the verification code that has been sent to your phone, in the box below.', 'Veuillez entrer le code de vérification qui a été envoyé à votre téléphone, dans la case ci-dessous.', 'الرجاء إدخال رمز التحقق الذي تم إرساله إلى هاتفك في المربع أدناه.');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1075, 'verify_email', 'Email address verify', 'Vérification de l\'adresse e-mail', 'التحقق من البريد الإلكتروني');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1076, 'verify_code', 'Verification code', 'Le code de vérification', 'رمز التحقق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1077, 'verify_email', 'Email address verify', 'Vérification de l\'e-mail', 'التحقق من البريد الإلكتروني');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1078, 'verify_phone', 'Phone verify', 'Vérification du téléphone', 'التحقق من الهاتف');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1079, 'fiat_deposit', 'Fiat Deposit', 'Dépôt Fiat', 'إيداع فيات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1080, 'crypto_deposit', 'Crypto Deposit', 'Dépôt cryptographique', 'إيداع العملات المشفرة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1081, 'deposit_type', 'Deposit Type', 'Type de dépôt', 'نوع الإيداع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1082, 'deposit_network', 'Select Network', 'Réseau de dépôt', 'اختر شبكة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1083, 'crypto', 'Crypto', 'Crypto', 'تشفير');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1084, 'currency', 'Currency', 'Devise', 'عملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1085, 'deposit_with', 'Deposit With', 'Dépôt avec', 'إيداع مع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1086, 'blockchain_network', 'Blockchain Network', 'Réseau Blockchain', 'شبكة Blockchain');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1087, 'coin_not_supported', 'This coin is not supported at this network, Please deposit with payment gateway!', 'Cette pièce n\'est pas prise en charge sur ce réseau, veuillez déposer avec la passerelle de paiement !', 'هذه العملة غير مدعومة في هذه الشبكة ، يرجى الإيداع ببوابة الدفع!');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1088, 'transaction_hash', 'Transaction Hash', 'Hachage des transactions', 'تجزئة الصفقة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1089, 'withdraw_with', 'Withdraw With', 'Retirer avec', 'سحب مع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1090, 'crypto_currency', 'Crypto Currency', 'Monnaie cryptographique', 'عملة مشفرة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1091, 'fiat_currency', 'Fiat Currency', 'Monnaie fiduciaire', 'عملة ورقية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1092, 'coin_not_supported_withdraw', 'This coin is not supported at this network, Please withdraw with payment gateway!', 'Cette pièce n\'est pas prise en charge sur ce réseau, veuillez retirer avec la passerelle de paiement !', 'هذه العملة غير مدعومة في هذه الشبكة ، يرجى السحب ببوابة الدفع!');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1093, 'verify_code_not_match', 'Your verify code did not match.', 'Votre code de vérification ne correspond pas.', 'رمز التحقق الخاص بك غير متطابق.');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1094, 'fiat_withdraw_list', 'Fiat Withdraw List', 'Fiat retirer la liste', 'قائمة سحب فيات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1095, 'crypto_withdraw_list', 'Crypto Withdraw List', 'Liste de retrait de crypto', 'قائمة سحب العملات المشفرة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1096, 'processing', 'Processing..', 'Traitement..', 'يعالج..');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1097, 'search', 'Search', 'chercher', 'يبحث');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1098, 'profile_verification', 'Profile Verification', 'Vérification du profil', 'التحقق من الملف الشخصي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1099, 'login_successfully', 'You Are Logged In Successfully!', 'Vous êtes connecté avec succès !', 'لقد تم تسجيل دخولك بنجاح!');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1100, 'cuurent_passowrd', 'Current Password', 'Mot de passe actuel', 'كلمة المرور الحالية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1101, 'current_passowrd', 'Current Password', 'Mot de passe actuel', 'كلمة المرور الحالية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1102, 'current_password', 'Current Password', 'Mot de passe actuel', 'كلمة المرور الحالية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1103, 'current_password', 'Current Password', 'Mot de passe actuel', 'كلمة المرور الحالية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1104, 'kyc_verify_success', 'KYC verify success', 'KYC vérifie le succès', 'تحقق KYC من النجاح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1105, 'kyc_verify_cancel', 'KYC verify cancel', 'KYC vérifier annuler', 'التحقق من KYC إلغاء');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1106, 'kyc_verify', 'KYC Verify', 'KYC vérifie', 'تحقق  KYC');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1107, 'kyc_verify_cancel', 'KYC verify cancel', 'KYC vérifier annuler', 'التحقق من KYC إلغاء');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1108, 'verification_processing', 'Your verification already processing!', 'Votre vérification est déjà en cours de traitement !', 'التحقق الخاص بك قيد المعالجة بالفعل!');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1109, 'require_verify', 'Required verification for showing trade menu', 'Vérification requise pour afficher le menu commercial', 'التحقق المطلوب لإظهار قائمة التجارة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1110, 'popular_cryptocurrencies', 'Popular cryptocurrencies', 'Crypto-monnaies populaires', 'العملات المشفرة الشعبية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1111, 'all_cryptos', 'All Cryptos', 'All Cryptos', 'جميع العملات المشفرة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1112, 'node_server_setup', 'Node Server Setup', 'configuration du serveur de nœuds', 'إعداد خادم العقدة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1113, 'bep20_coin', 'BEP20 Coin', 'Pièce De Monnaie Bep20', 'عملة BEP20');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1114, 'add_bep20_coin', 'Add BEP20 Coin', 'Ajouter Une Pièce Bep20', 'أضف عملة BEP20');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1115, 'bep20_market', 'Bep20 Market', 'Marché Bep20', 'سوق Bep20');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1116, 'bep20_coin_pair', 'BEP20 Coin Pair', 'Paire De Pièces BEP20', 'زوج عملة BEP20');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1117, 'bep20_transaction_setup', 'Bep20 Transaction Setup', 'Configuration Des Transactions BEP20', 'إعداد المعاملات Bep20');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1118, 'bep20_balance', 'BEP20 Balance', 'Solde Bep20', 'BEP20 الرصيد');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1119, 'bep20_diposit_address', 'Bep20 Deposit Address', 'Bep20 Adresse De Dépôt', 'عنوان إيداع Bep20');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1120, 'bep20_coin_list', 'BEP20 Coin List', 'Liste De Pièces BEP20', 'قائمة العملات المعدنية BEP20');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1121, 'find_your_rpc_url_from_here', 'Find your RPC URL from here.', 'Trouvez votre URL RPC à partir de maintenant ici.', 'ابحث عن عنوان URL الخاص بـ RPC من هنا.');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1122, 'add_coin', 'Add Coin', 'Ajouter une pièce', 'أضف عملة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1123, 'add_erc20_coin', 'ADD ERC20 COIN', 'AJOUTER UNE PIÈCE ERC20', 'إضافة عملة ERC20');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1124, 'add_bep20_coin', 'Add BEP20 Coin', 'AJOUTER UNE PIÈCE BEP20', 'إضافة عملة BEP20');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1125, 'report', 'Report', 'Signaler', 'تقرير');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1126, 'trading_view_chart', 'TradingView Chart', 'Graphique de Tradingview', 'مخطط عرض التداول');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1127, 'original_chart', 'Original Chart', 'Graphique d\'origine', 'الرسم البياني الأصلي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1128, 'receivable_amount', 'Receivable amount:', 'Montant à recevoir :', 'المبلغ المستحق:');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1129, 'payeer_wallet', 'Payeer Wallet ', 'Portefeuille Payeur', 'محفظة بايير');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1130, 'sign_out', 'Sign Out', 'Se déconnecter', 'خروج');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1131, 'node_server_setup', 'Node Server Setup', 'Configuration du serveur de nœud', 'إعداد خادم العقدة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1132, 'admin_bep20_wallet_setup', 'Admin BEP20 Wallet Setup', 'Configuration du portefeuille administrateur BEP20', 'إعداد المحفظة المسؤول BEP20');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1133, 'coin_request_bep20', 'Coin Request BEP20', 'Demande de pièces BEP20', 'طلب عملة BEP20');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1134, 'documentation', 'Documentation', 'Documentation', 'توثيق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1135, 'addons', 'Addons', 'Compléments', 'الإضافات');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1136, 'tutorial', 'Tutorial', 'Didacticiel', 'الدورة التعليمية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1137, 'support', 'Support', 'Soutien', 'الدعم');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1138, 'network_type', 'Network Type', 'Type de réseau', 'نوع الشبكة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1139, 'requested', 'Requested', 'Demandé', 'مطلوب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1140, 'verify_manually', 'Verify manually', 'Vérifier manuellement', 'تحقق يدويًا');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1141, 'minimum_limit', 'Minimum Limit', 'Limite minimale', 'الحد الأدنى');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1142, 'maximum_weekly_limit', 'Maximum Weekly Limit', 'Limite hebdomadaire maximale', 'الحد الأسبوعي الأقصى');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1143, 'monthly_limit', 'Monthly Limit', 'Limite mensuelle', 'الحد الشهري');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1144, 'yearly_limit', 'Yearly Limit', 'Limite annuelle', 'الحد السنوي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1145, 'to', 'To', 'À', 'إلى');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1146, 'gateway', 'Gateway', 'passerelle', 'بوابة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1147, 'add_phrase', 'Add Phrase', 'Ajouter une phrase', 'أضف عبارة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1148, 'label', 'Label', 'Étiquette', 'مُلصَق');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1149, 'edit_phrase', 'Edit Phrase', 'Modifier La Phrase', 'تحرير العبارة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1150, 'search_phrase_or_label', 'Search Phrase OR Label', 'Rechercher une expression OU une étiquette', 'عبارة البحث أو التسمية');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1151, 'import_phrase', 'Import Phrase', 'Importer une phrase', 'استيراد العبارة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1152, 'export_phrase', 'Export Phrase', 'Exporter la phrase', 'عبارة التصدير');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1153, 'get_your_API_key', 'Get Your API Key', 'Obtenez votre clé API', 'احصل على مفتاح API الخاص بك');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1154, 'create_account', 'Create Account', 'Créer un compte', 'إصنع حساب');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1155, 'manual', 'Manual', 'Manuel', 'يدوي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1156, 'automatic', 'Automatic', 'Automatique', 'تلقائي');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1157, 'debuging_active', 'Debuging Active', 'Débogage actif', 'التصحيح نشط');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1158, 'supported_coin_text', 'Please enter all supported coin by (,) separate with no space like: BTC,ETH,LTC so on... ', 'Veuillez saisir toutes les pièces prises en charge par (,) séparément sans espace comme : BTC, ETH, LTC, etc.', 'الرجاء إدخال جميع العملات المدعومة بواسطة (،) منفصلة بدون مسافة مثل: BTC ، ETH ، LTC ، إلخ ...');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1159, 'suported_coin', 'Suported Coin', 'Pièce prise en charge', 'العملة المدعومة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1160, 'debug_email', 'Debug Email', 'E-mail de débogage', 'تصحيح أخطاء البريد الإلكتروني');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1161, 'secret', 'Secret', 'Secrète', 'سر');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1162, 'your_merchant_id', 'Your Merchant ID', 'Votre identifiant marchand', 'معرف التاجر الخاص بك');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1163, 'callback_url', 'Callback Url', 'URL de rappel', 'عاود الاتصال بالعنوان');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1164, 'cancel_url', 'Cancel Url', 'URL d\'annulation', 'إلغاء عنوان Url');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1165, 'success_url', 'Success Url', 'URL de réussite', 'رابط النجاح');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1166, 'mode', 'Mode', 'Mode', 'الوضع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1167, 'live', 'Live', 'Vivre', 'يعيش');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1168, 'Sandbox', 'SandBox', 'Bac à sable', 'SandBox');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1169, 'get_api_key', 'Get API Key', 'Obtenir la clé API', 'احصل على مفتاح API');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1170, 'api_key', 'API Key', 'clé API', 'مفتاح API');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1171, 'premium', 'Premium', 'Prime', 'الممتازة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1172, 'free', 'Free', 'Libre', 'حر');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1173, 'pay_with_card', 'Pay with Card', 'Payer par carte', 'الدفع بالبطاقة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1174, 'activated', 'Activated', 'Activé', 'مفعل');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1175, 'theme_details', 'Theme Details', 'Détails du thème', 'تفاصيل الموضوع');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1176, 'page_content', 'Page Content', 'Contenu de la page', 'محتوى الصفحة');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1177, 'admin_erc20_wallet_setup', 'Admin ERC20 Wallet Setup', 'Configuration Du Portefeuille Administrateur ERC20', 'إعداد المحفظة المسؤول ERC20');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1178, 'coin_request_erc20', 'Coin Request ERC20', 'Demande de pièces ERC20', 'طلب عملة ERC20');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1179, 'allow_url_fopen', 'Its required the servers allow_url_fopen is enabled, should work well', 'Il est nécessaire que les serveurs allow_url_fopen soient activés, devraient bien fonctionner', 'مطلوب أن يتم تمكين الخوادم allow_url_fopen ، يجب أن تعمل بشكل جيد  ');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES (1180, 'server_configuration', 'Found in the server configuration by allow_url_fopen=Off', 'Trouvé dans la configuration du serveur par allow_url_fopen=Off', 'تم العثور عليه في تكوين الخادم عن طريق allow_url_fopen = Off');


#
# TABLE STRUCTURE FOR: message
#

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender_id` int NOT NULL,
  `receiver_id` varchar(250) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL,
  `sender_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=unseen, 1=seen, 2=delete',
  `receiver_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=unseen, 1=seen, 2=delete',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

INSERT INTO `message` (`id`, `sender_id`, `receiver_id`, `subject`, `message`, `datetime`, `sender_status`, `receiver_status`) VALUES (1, 1, '4H3CM7', 'Deposit', 'Welcome to Tradebox\r\nHi, ABM demouser\r\nYou have successfully deposited the amount USD 95000 at date 04 January 2023', '2023-01-04 02:52:33', 0, 0);
INSERT INTO `message` (`id`, `sender_id`, `receiver_id`, `subject`, `message`, `datetime`, `sender_status`, `receiver_status`) VALUES (2, 1, 'D40BQB', 'Deposit', 'Welcome to Tradebox\r\nHi, hasnath H rahman\r\nYou have successfully deposited the amount USD 500 at date 04 January 2023', '2023-01-04 11:56:30', 0, 0);
INSERT INTO `message` (`id`, `sender_id`, `receiver_id`, `subject`, `message`, `datetime`, `sender_status`, `receiver_status`) VALUES (3, 1, 'D40BQB', 'Deposit', 'Welcome to Tradebox\r\nHi, hasnath H rahman\r\nYou have successfully deposited the amount USD 1000 at date 04 January 2023', '2023-01-04 11:58:01', 0, 0);


#
# TABLE STRUCTURE FOR: module
#

DROP TABLE IF EXISTS `module`;

CREATE TABLE `module` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  `image` varchar(255) DEFAULT NULL,
  `module_type` varchar(50) DEFAULT 'network',
  `directory` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: notifications
#

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `notification_id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `notification_type` varchar(45) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `details` longtext,
  `status` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='SMS and Email notified data will be stored in this table.';

INSERT INTO `notifications` (`notification_id`, `user_id`, `date`, `notification_type`, `subject`, `details`, `status`) VALUES (1, '4H3CM7', '2023-01-04 02:52:32', 'deposit', 'Deposit Successful', 'Welcome to Tradebox\r\nHi, %name%\r\nYou have successfully deposited the amount USD 95000 at date %date%', '0');
INSERT INTO `notifications` (`notification_id`, `user_id`, `date`, `notification_type`, `subject`, `details`, `status`) VALUES (2, 'D40BQB', '2023-01-04 11:56:29', 'deposit', 'Deposit Successful', 'Welcome to Tradebox\r\nHi, %name%\r\nYou have successfully deposited the amount USD 500 at date %date%', '0');
INSERT INTO `notifications` (`notification_id`, `user_id`, `date`, `notification_type`, `subject`, `details`, `status`) VALUES (3, 'D40BQB', '2023-01-04 11:58:00', 'deposit', 'Deposit Successful', 'Welcome to Tradebox\r\nHi, %name%\r\nYou have successfully deposited the amount USD 1000 at date %date%', '0');


#
# TABLE STRUCTURE FOR: payeer_payments
#

DROP TABLE IF EXISTS `payeer_payments`;

CREATE TABLE `payeer_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `m_operation_id` int NOT NULL,
  `m_operation_ps` int NOT NULL,
  `m_operation_date` varchar(100) NOT NULL,
  `m_operation_pay_date` varchar(100) NOT NULL,
  `m_shop` int NOT NULL,
  `m_orderid` varchar(300) NOT NULL,
  `m_amount` varchar(100) NOT NULL,
  `m_curr` varchar(100) NOT NULL,
  `m_desc` varchar(300) NOT NULL,
  `m_status` varchar(100) NOT NULL,
  `m_sign` mediumtext NOT NULL,
  `lang` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

#
# TABLE STRUCTURE FOR: payment_gateway
#

DROP TABLE IF EXISTS `payment_gateway`;

CREATE TABLE `payment_gateway` (
  `id` int NOT NULL AUTO_INCREMENT,
  `getway_type` enum('Crypto','Fiat') DEFAULT 'Fiat',
  `identity` varchar(50) NOT NULL,
  `agent` varchar(100) NOT NULL,
  `public_key` text NOT NULL,
  `private_key` text NOT NULL,
  `shop_id` varchar(100) NOT NULL,
  `secret_key` varchar(100) NOT NULL,
  `data` text NOT NULL,
  `coinlist` text,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

INSERT INTO `payment_gateway` (`id`, `getway_type`, `identity`, `agent`, `public_key`, `private_key`, `shop_id`, `secret_key`, `data`, `coinlist`, `status`) VALUES (1, 'Crypto', 'bitcoin', 'GoUrl Payment ', 'a:13:{s:7:\"bitcoin\";s:50:\"43137AACNNeySpeedcoin77SPDPUBaJBxvUGvX7KgmBcx9CGvb\";s:11:\"bitcoincash\";s:0:\"\";s:8:\"litecoin\";s:0:\"\";s:4:\"dash\";s:0:\"\";s:8:\"dogecoin\";s:0:\"\";s:9:\"speedcoin\";s:50:\"43137AACNNeySpeedcoin77SPDPUBaJBxvUGvX7KgmBcx9CGvb\";s:8:\"reddcoin\";s:0:\"\";s:7:\"potcoin\";s:0:\"\";s:11:\"feathercoin\";s:0:\"\";s:8:\"vertcoin\";s:0:\"\";s:8:\"peercoin\";s:0:\"\";s:12:\"monetaryunit\";s:0:\"\";s:17:\"universalcurrency\";s:0:\"\";}', 'a:13:{s:7:\"bitcoin\";s:50:\"43137AACNNeySpeedcoin77SPDPRVyzic8CEewfdazdv9HwdH2\";s:11:\"bitcoincash\";s:0:\"\";s:8:\"litecoin\";s:0:\"\";s:4:\"dash\";s:0:\"\";s:8:\"dogecoin\";s:0:\"\";s:9:\"speedcoin\";s:50:\"43137AACNNeySpeedcoin77SPDPRVyzic8CEewfdazdv9HwdH2\";s:8:\"reddcoin\";s:0:\"\";s:7:\"potcoin\";s:0:\"\";s:11:\"feathercoin\";s:0:\"\";s:8:\"vertcoin\";s:0:\"\";s:8:\"peercoin\";s:0:\"\";s:12:\"monetaryunit\";s:0:\"\";s:17:\"universalcurrency\";s:0:\"\";}', '', '', '', 'BTC,ETH,BCH,LTC,LTCT,DASH,DOGE,SPD,RDD,POT,FTC,VTC,PPC,MUE,UNIT,MHT', 1);
INSERT INTO `payment_gateway` (`id`, `getway_type`, `identity`, `agent`, `public_key`, `private_key`, `shop_id`, `secret_key`, `data`, `coinlist`, `status`) VALUES (2, 'Fiat', 'payeer', 'Payeer ', '485146745', 'VsdHofTsuI6XOdjL', '', '', '', NULL, 1);
INSERT INTO `payment_gateway` (`id`, `getway_type`, `identity`, `agent`, `public_key`, `private_key`, `shop_id`, `secret_key`, `data`, `coinlist`, `status`) VALUES (3, 'Fiat', 'paystack', 'Paystack ', 'pk_test_08e6678d24436a08e7cd2d236b4114c620811f9c', 'sk_test_ee101b8fea4c01b15631a16ded96b3a5c82b6540', 'free', 'efc16cf798cb00de6ef3', '', NULL, 1);
INSERT INTO `payment_gateway` (`id`, `getway_type`, `identity`, `agent`, `public_key`, `private_key`, `shop_id`, `secret_key`, `data`, `coinlist`, `status`) VALUES (4, 'Fiat', 'paypal', 'Paypal ', 'AfmTkhn-GYb_HAsPayWeLDVTG39jNjGsJ3siJSNDs6QGr52KDLnAT28fIv4TVni5P3Dax8w1y-Libl_j', 'EHGJveSf9GJcbyQwgYmouRi9baBPKLPqeSYjYesiG4UJTSnQ45q3gwQdkB6TvFQAjkYm42D1P_Hqn340', '', 'sandbox', '', 'USD', 1);
INSERT INTO `payment_gateway` (`id`, `getway_type`, `identity`, `agent`, `public_key`, `private_key`, `shop_id`, `secret_key`, `data`, `coinlist`, `status`) VALUES (5, 'Fiat', 'stripe', 'Stripe ', 'pk_test_BPLwYal0sn4KkKaDTzuj5oRq', 'sk_test_6J6dcwXf8ruEZGCvlC09C9NK', '', '', '', 'USD', 1);
INSERT INTO `payment_gateway` (`id`, `getway_type`, `identity`, `agent`, `public_key`, `private_key`, `shop_id`, `secret_key`, `data`, `coinlist`, `status`) VALUES (6, 'Crypto', 'coinpayment', 'CoinPayments', '0ef5d693629164125849eee7f24deeea058fde91a232b3091525724a480c2c34', '0e1Efced49C5e902a4abF65A01e4F41c040f58aa48f4A6b041e0508D45dc1164', '', '', '{\"marcent_id\":\"f8224829cda4268f107089fd92a469c6\",\"ipn_secret\":\"Bdtask@#2021\",\"debug_email\":\"turan.vuiyan@gmail.com\",\"debuging_active\":1,\"withdraw\":\"1\"}', 'BCH,LTCT,DOGE,DASH,SPD,RDD,POT,FTC,VTC,PPC,MUE,UNIT,TCB,MHT,ETH,USDT,USDT,USDC,ADA,XRP,BUSD,DOT,DOGE,AVAX,MATIC,SHIB,DAI,UNI,UNI,TRX,WBTC,ETC,LEO,LTC,NEAR,LINK,FTX,CRO,ATOM,WFLOW,BCH,VET,FIL,APE,MANA,SAND,XTZ,AXS,AAVE,QNT,EGLD,OKB,EOS,TUSD,TUSD,ZEC,CHZ,MKR,FTM,GRT,IOTA,BTT,USDP,PAX,LDO,CEL,HT,CRV,USDD,USDD,BAT,USDN,USDN,LRC,ENJ,ZIL,PAXG,GMT,NEXO,KAVA,1INCH,wROSE,GNO,CVX,TWT,GALA,GALA,COMP,SNX,HOT,ANKR,YFI,BTC,BNB', 1);
INSERT INTO `payment_gateway` (`id`, `getway_type`, `identity`, `agent`, `public_key`, `private_key`, `shop_id`, `secret_key`, `data`, `coinlist`, `status`) VALUES (7, 'Crypto', 'token', 'Token', '51fec43efdeb1323d1a0854ffa807b64abf8', 'messege...', '', 'show', '', 'BTC,BCH,LTC,DOGE, ,MHT, RDD,SPD,DASH,LTCT,POT,FTC,VTC,PPC,MUE,UNIT', 1);


#
# TABLE STRUCTURE FOR: setting
#

DROP TABLE IF EXISTS `setting`;

CREATE TABLE `setting` (
  `setting_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `siteDescription` text,
  `sitekeywords` text,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `logo_web` varchar(255) NOT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `site_align` varchar(50) DEFAULT NULL,
  `footer_text` varchar(255) DEFAULT NULL,
  `time_zone` varchar(100) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `office_time` varchar(255) DEFAULT NULL,
  `show_trademenu_without_verify` tinyint(1) NOT NULL DEFAULT '1',
  `email_verify` tinyint(1) NOT NULL DEFAULT '0' COMMENT ' 0=Not required, 1= Required ',
  `phone_verify` tinyint(1) NOT NULL DEFAULT '0' COMMENT ' 0=Not required, 1= Required ',
  `kyc_verify` tinyint(1) NOT NULL DEFAULT '0' COMMENT ' 0=Not required, 1= Required ',
  `update_notification` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

INSERT INTO `setting` (`setting_id`, `title`, `description`, `siteDescription`, `sitekeywords`, `email`, `phone`, `logo`, `logo_web`, `favicon`, `language`, `site_align`, `footer_text`, `time_zone`, `latitude`, `office_time`, `show_trademenu_without_verify`, `email_verify`, `phone_verify`, `kyc_verify`, `update_notification`) VALUES (1, 'Tradebox', 'Bangladesh Office B-25, Mannan Plaza, 4th Floor, Khilkhet Dhaka-1229, Bangladesh', 'Tradebox is offering new Bitcoin cryptocurrencies to the world market. We serve our members with products built in a fairer, more accessible, and efficient manner.\r\n', 'Tradebox, Buy, Crypto, Cryptocurrency Bitcoin US Dollar, Bitcoin Singapore Dollar, Bitcoin Canadian Dollar, Bitcoin Euro, Bitcoin Pound Sterling, Bitcoin Digital Gold, Bitcoin Platinum, Bitcoin Premium, Bitcoin US Dollar', 'business@bdtask.com', '+8801817584639 ', 'upload/settings/1660942254_c0c7ebf8e316fc6319ca.png', 'upload/settings/1660941959_856ff5d21bed33f3e16e.png', 'upload/settings/1660941090_3c8e4821460122facc6a.png', 'english', 'LTR', '2022 © Copyright Tradebox', 'Europe/Paris', '40.6700, -73.9400', 'Monday - Friday: 08:00 - 22:00\r\nSaturday, Sunday: Closed', 1, 0, 0, 0, 0);


#
# TABLE STRUCTURE FOR: sms_email_send_setup
#

DROP TABLE IF EXISTS `sms_email_send_setup`;

CREATE TABLE `sms_email_send_setup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `method` text NOT NULL,
  `deposit` int DEFAULT NULL,
  `transfer` int DEFAULT NULL,
  `withdraw` int DEFAULT NULL,
  `payout` int DEFAULT NULL,
  `commission` int DEFAULT NULL,
  `team_bonnus` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

INSERT INTO `sms_email_send_setup` (`id`, `method`, `deposit`, `transfer`, `withdraw`, `payout`, `commission`, `team_bonnus`) VALUES (1, 'email', 1, 1, 1, NULL, NULL, NULL);
INSERT INTO `sms_email_send_setup` (`id`, `method`, `deposit`, `transfer`, `withdraw`, `payout`, `commission`, `team_bonnus`) VALUES (2, 'sms', 1, 1, 1, NULL, NULL, NULL);


#
# TABLE STRUCTURE FOR: themes
#

DROP TABLE IF EXISTS `themes`;

CREATE TABLE `themes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` tinyint NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

INSERT INTO `themes` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES (1, 'tradebox_Default_Theme', 1, '2021-01-18 12:54:13', '2021-03-27 10:57:46');


#
# TABLE STRUCTURE FOR: web_article
#

DROP TABLE IF EXISTS `web_article`;

CREATE TABLE `web_article` (
  `article_id` int NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) DEFAULT NULL,
  `headline_en` varchar(300) DEFAULT NULL,
  `headline_fr` varchar(300) DEFAULT NULL,
  `pdflink` tinyint NOT NULL DEFAULT '0',
  `article_pdf` varchar(150) DEFAULT NULL,
  `pageHeight` int NOT NULL DEFAULT '800',
  `article_image` varchar(100) DEFAULT NULL,
  `custom_url` varchar(300) NOT NULL,
  `article1_en` longtext NOT NULL,
  `article1_fr` longtext NOT NULL,
  `article2_en` longtext NOT NULL,
  `article2_fr` longtext NOT NULL,
  `video` varchar(300) DEFAULT NULL,
  `cat_id` int DEFAULT NULL,
  `page_content` int DEFAULT '0' COMMENT 'if this is a Page content set 1 else 0',
  `position_serial` int NOT NULL,
  `publish_date` datetime NOT NULL,
  `publish_by` varchar(20) NOT NULL,
  `edit_history` int NOT NULL,
  PRIMARY KEY (`article_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

INSERT INTO `web_article` (`article_id`, `slug`, `headline_en`, `headline_fr`, `pdflink`, `article_pdf`, `pageHeight`, `article_image`, `custom_url`, `article1_en`, `article1_fr`, `article2_en`, `article2_fr`, `video`, `cat_id`, `page_content`, `position_serial`, `publish_date`, `publish_by`, `edit_history`) VALUES (1, NULL, 'Contact', 'Contact Français Français Français Français Turkey', 0, NULL, 800, NULL, '', '1355 Market Street, Suite 900 San Francisco, CA 94103', '<div>\r\n<p>Phone <font color=\"#72afd2\"><span xss=removed>+1 (514) 352-1010</span></font><br>Fax <span xss=removed>+1 (514) 352-7511</span></p></div>', '<ul class=\"opening_hours\">\r\n <li>\r\n<p>Monday-Wednesday</p>\r\n <p>10 am - 6 pm</p></li>\r\n</ul>', '', NULL, 12, 0, 0, '2020-09-15 12:02:49', 'admin@demo.com', 0);
INSERT INTO `web_article` (`article_id`, `slug`, `headline_en`, `headline_fr`, `pdflink`, `article_pdf`, `pageHeight`, `article_image`, `custom_url`, `article1_en`, `article1_fr`, `article2_en`, `article2_fr`, `video`, `cat_id`, `page_content`, `position_serial`, `publish_date`, `publish_by`, `edit_history`) VALUES (2, NULL, 'Marketing Consultancy', 'Lorem ipsum ', 0, NULL, 800, NULL, '', 'write your answer\r\n', 'write your answer\r\n', '', '', NULL, 30, 0, 0, '2021-03-10 03:09:55', 'admin@demo.com', 0);
INSERT INTO `web_article` (`article_id`, `slug`, `headline_en`, `headline_fr`, `pdflink`, `article_pdf`, `pageHeight`, `article_image`, `custom_url`, `article1_en`, `article1_fr`, `article2_en`, `article2_fr`, `video`, `cat_id`, `page_content`, `position_serial`, `publish_date`, `publish_by`, `edit_history`) VALUES (4, NULL, NULL, NULL, 0, NULL, 800, NULL, '', 'Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. ', 'Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. ', '', '', NULL, 29, 0, 0, '2018-10-10 10:56:25', 'admin@demo.com', 0);
INSERT INTO `web_article` (`article_id`, `slug`, `headline_en`, `headline_fr`, `pdflink`, `article_pdf`, `pageHeight`, `article_image`, `custom_url`, `article1_en`, `article1_fr`, `article2_en`, `article2_fr`, `video`, `cat_id`, `page_content`, `position_serial`, `publish_date`, `publish_by`, `edit_history`) VALUES (5, NULL, NULL, NULL, 0, NULL, 800, NULL, '', 'Te cum mutat malorum. Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. ', 'Te cum mutat malorum. Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. ', '', '', NULL, 29, 0, 0, '2018-10-10 10:56:55', 'admin@demo.com', 0);
INSERT INTO `web_article` (`article_id`, `slug`, `headline_en`, `headline_fr`, `pdflink`, `article_pdf`, `pageHeight`, `article_image`, `custom_url`, `article1_en`, `article1_fr`, `article2_en`, `article2_fr`, `video`, `cat_id`, `page_content`, `position_serial`, `publish_date`, `publish_by`, `edit_history`) VALUES (6, NULL, NULL, NULL, 0, NULL, 800, NULL, '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Iam id ipsum absurdum, maximum malum neglegi. Satisne ergo pudori consulat, si quis sine teste libidini pareat?', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Iam id ipsum absurdum, maximum malum neglegi. Satisne ergo pudori consulat, si quis sine teste libidini pareat?', '', '', NULL, 29, 0, 0, '2018-10-10 10:58:48', 'admin@demo.com', 0);
INSERT INTO `web_article` (`article_id`, `slug`, `headline_en`, `headline_fr`, `pdflink`, `article_pdf`, `pageHeight`, `article_image`, `custom_url`, `article1_en`, `article1_fr`, `article2_en`, `article2_fr`, `video`, `cat_id`, `page_content`, `position_serial`, `publish_date`, `publish_by`, `edit_history`) VALUES (7, 'Make Each <span>Price Spike</span> And Dip Count', 'Make Each Price Spike And Dip Count. Ok', 'Make Each Price Spike And Dip Count', 0, NULL, 800, '', '', '<p><span style=\"color:#a5a5a5; font-family:-apple-system,BlinkMacSystemFont,\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum.</span></p>\r\n', '<p><span style=\"color:#a5a5a5; font-family:-apple-system,BlinkMacSystemFont,\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum.</span></p>\r\n', '', '', '', 28, 1, 1, '2023-01-04 10:43:13', 'bdtask@gmail.com', 0);
INSERT INTO `web_article` (`article_id`, `slug`, `headline_en`, `headline_fr`, `pdflink`, `article_pdf`, `pageHeight`, `article_image`, `custom_url`, `article1_en`, `article1_fr`, `article2_en`, `article2_fr`, `video`, `cat_id`, `page_content`, `position_serial`, `publish_date`, `publish_by`, `edit_history`) VALUES (8, 'WELCOME TO Tradebox', 'WELCOME TO Tradebox', 'BIENVENUE CHEZ Tradebox', 1, '', 800, '', '', '<p><span style=\"font-size:12pt\"><span style=\"font-size:13.5pt\"><span style=\"color:black\">Tradebox is offering new Bitcoin cryptocurrencies to the world market. We serve our members with products built in a fairer, more accessible, and efficient manner. </span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-size:13.5pt\"><span style=\"color:black\">We are a decentralized exchange (DEX) focused on&nbsp;offering a premier trading experience.&nbsp; </span></span></span></p>\r\n', '<p><span style=\"font-size:12pt\"><span style=\"font-size:13.5pt\"><span style=\"color:black\">تقدم Tradebox عملات مشفرة جديدة من Bitcoin إلى السوق العالمية. نحن نخدم أعضائنا بمنتجات مبنية بطريقة أكثر إنصافًا وأكثر سهولة وفعالية.</span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-size:13.5pt\"><span style=\"color:black\">نحن بورصة لامركزية (DEX) تركز على تقديم تجربة تداول ممتازة.</span></span></span></p>\r\n', '', '', '', 31, 1, 1, '2023-01-04 05:15:29', 'bdtask@gmail.com', 0);
INSERT INTO `web_article` (`article_id`, `slug`, `headline_en`, `headline_fr`, `pdflink`, `article_pdf`, `pageHeight`, `article_image`, `custom_url`, `article1_en`, `article1_fr`, `article2_en`, `article2_fr`, `video`, `cat_id`, `page_content`, `position_serial`, `publish_date`, `publish_by`, `edit_history`) VALUES (9, NULL, 'Coin List', 'Coin List', 0, NULL, 0, '', '', '', '', '', '', '', 32, 1, 1, '2022-08-13 11:25:02', 'info@admin.com', 0);
INSERT INTO `web_article` (`article_id`, `slug`, `headline_en`, `headline_fr`, `pdflink`, `article_pdf`, `pageHeight`, `article_image`, `custom_url`, `article1_en`, `article1_fr`, `article2_en`, `article2_fr`, `video`, `cat_id`, `page_content`, `position_serial`, `publish_date`, `publish_by`, `edit_history`) VALUES (12, NULL, NULL, NULL, 0, NULL, 800, NULL, '', 'test n', 'tes a', '', '', NULL, 29, 0, 0, '2023-01-04 10:45:04', 'bdtask@gmail.com', 0);
INSERT INTO `web_article` (`article_id`, `slug`, `headline_en`, `headline_fr`, `pdflink`, `article_pdf`, `pageHeight`, `article_image`, `custom_url`, `article1_en`, `article1_fr`, `article2_en`, `article2_fr`, `video`, `cat_id`, `page_content`, `position_serial`, `publish_date`, `publish_by`, `edit_history`) VALUES (13, NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Iam id ipsum absurdum, maximum malum neglegi. Satisne ergo pudori consulat, si quis sine teste libidini pareat?', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Iam id ipsum absurdum, maximum malum neglegi. Satisne ergo pudori consulat, si quis sine teste libidini pareat?', 0, NULL, 0, '', '', '<p>sad</p>\r\n', '<p>sdaf</p>\r\n', '<p>dsfsa</p>\r\n', '<p>sdfsd</p>\r\n', '', 29, 1, 2, '2023-01-05 05:47:40', 'bdtask@gmail.com', 0);


#
# TABLE STRUCTURE FOR: web_category
#

DROP TABLE IF EXISTS `web_category`;

CREATE TABLE `web_category` (
  `cat_id` int NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) NOT NULL,
  `cat_name_en` varchar(100) NOT NULL,
  `cat_name_fr` varchar(100) NOT NULL,
  `parent_id` int NOT NULL,
  `cat_image` varchar(300) DEFAULT NULL,
  `cat_title1_en` varchar(100) DEFAULT NULL,
  `cat_title1_fr` varchar(100) DEFAULT NULL,
  `cat_title2_en` varchar(300) DEFAULT NULL,
  `cat_title2_fr` varchar(300) DEFAULT NULL,
  `menu` int DEFAULT NULL COMMENT 'Header menu=1',
  `position_serial` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;

INSERT INTO `web_category` (`cat_id`, `slug`, `cat_name_en`, `cat_name_fr`, `parent_id`, `cat_image`, `cat_title1_en`, `cat_title1_fr`, `cat_title2_en`, `cat_title2_fr`, `menu`, `position_serial`, `status`) VALUES (1, 'home', 'Home', 'Maison', 0, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 1, 1, 1);
INSERT INTO `web_category` (`cat_id`, `slug`, `cat_name_en`, `cat_name_fr`, `parent_id`, `cat_image`, `cat_title1_en`, `cat_title1_fr`, `cat_title2_en`, `cat_title2_fr`, `menu`, `position_serial`, `status`) VALUES (4, 'exchange', 'Exchange', 'Échange', 0, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', 'Exchange', '', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that', '', 1, 4, 1);
INSERT INTO `web_category` (`cat_id`, `slug`, `cat_name_en`, `cat_name_fr`, `parent_id`, `cat_image`, `cat_title1_en`, `cat_title1_fr`, `cat_title2_en`, `cat_title2_fr`, `menu`, `position_serial`, `status`) VALUES (8, 'about', 'About', 'Sur', 0, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', 'About Us', '', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that', '', 0, NULL, 1);
INSERT INTO `web_category` (`cat_id`, `slug`, `cat_name_en`, `cat_name_fr`, `parent_id`, `cat_image`, `cat_title1_en`, `cat_title1_fr`, `cat_title2_en`, `cat_title2_fr`, `menu`, `position_serial`, `status`) VALUES (9, 'news', 'News', 'Nouvelles', 0, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', 'Latest form our blog', '', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that', '', NULL, NULL, 1);
INSERT INTO `web_category` (`cat_id`, `slug`, `cat_name_en`, `cat_name_fr`, `parent_id`, `cat_image`, `cat_title1_en`, `cat_title1_fr`, `cat_title2_en`, `cat_title2_fr`, `menu`, `position_serial`, `status`) VALUES (16, 'register', 'Register', 'Register', 0, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, 0, 1);
INSERT INTO `web_category` (`cat_id`, `slug`, `cat_name_en`, `cat_name_fr`, `parent_id`, `cat_image`, `cat_title1_en`, `cat_title1_fr`, `cat_title2_en`, `cat_title2_fr`, `menu`, `position_serial`, `status`) VALUES (17, 'forgot-password', 'Forgot Password', 'Mot de Passe oublié', 0, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, NULL, 1);
INSERT INTO `web_category` (`cat_id`, `slug`, `cat_name_en`, `cat_name_fr`, `parent_id`, `cat_image`, `cat_title1_en`, `cat_title1_fr`, `cat_title2_en`, `cat_title2_fr`, `menu`, `position_serial`, `status`) VALUES (19, 'btc', 'BTC', '', 9, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, NULL, 1);
INSERT INTO `web_category` (`cat_id`, `slug`, `cat_name_en`, `cat_name_fr`, `parent_id`, `cat_image`, `cat_title1_en`, `cat_title1_fr`, `cat_title2_en`, `cat_title2_fr`, `menu`, `position_serial`, `status`) VALUES (20, 'eth', 'ETH', 'ETH', 9, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, 0, 1);
INSERT INTO `web_category` (`cat_id`, `slug`, `cat_name_en`, `cat_name_fr`, `parent_id`, `cat_image`, `cat_title1_en`, `cat_title1_fr`, `cat_title2_en`, `cat_title2_fr`, `menu`, `position_serial`, `status`) VALUES (21, 'ltc', 'LTC', 'LTC', 9, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, 0, 1);
INSERT INTO `web_category` (`cat_id`, `slug`, `cat_name_en`, `cat_name_fr`, `parent_id`, `cat_image`, `cat_title1_en`, `cat_title1_fr`, `cat_title2_en`, `cat_title2_fr`, `menu`, `position_serial`, `status`) VALUES (22, 'dash', 'DASH', 'DASH', 9, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, 0, 1);
INSERT INTO `web_category` (`cat_id`, `slug`, `cat_name_en`, `cat_name_fr`, `parent_id`, `cat_image`, `cat_title1_en`, `cat_title1_fr`, `cat_title2_en`, `cat_title2_fr`, `menu`, `position_serial`, `status`) VALUES (24, 'blockchain', 'Blockchain', 'Blockchain', 9, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, 0, 1);
INSERT INTO `web_category` (`cat_id`, `slug`, `cat_name_en`, `cat_name_fr`, `parent_id`, `cat_image`, `cat_title1_en`, `cat_title1_fr`, `cat_title2_en`, `cat_title2_fr`, `menu`, `position_serial`, `status`) VALUES (25, 'trading', 'Trading', 'Trading', 9, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, 0, 1);
INSERT INTO `web_category` (`cat_id`, `slug`, `cat_name_en`, `cat_name_fr`, `parent_id`, `cat_image`, `cat_title1_en`, `cat_title1_fr`, `cat_title2_en`, `cat_title2_fr`, `menu`, `position_serial`, `status`) VALUES (26, 'news-details', 'News Details', 'News Details', 0, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, 0, 1);
INSERT INTO `web_category` (`cat_id`, `slug`, `cat_name_en`, `cat_name_fr`, `parent_id`, `cat_image`, `cat_title1_en`, `cat_title1_fr`, `cat_title2_en`, `cat_title2_fr`, `menu`, `position_serial`, `status`) VALUES (27, 'mining', 'Mining', '', 9, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, NULL, 1);
INSERT INTO `web_category` (`cat_id`, `slug`, `cat_name_en`, `cat_name_fr`, `parent_id`, `cat_image`, `cat_title1_en`, `cat_title1_fr`, `cat_title2_en`, `cat_title2_fr`, `menu`, `position_serial`, `status`) VALUES (28, 'terms', 'Terms', 'terms', 1, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', 'term title english', 'turki title', 'category title english', 'dsf', 2, NULL, 1);
INSERT INTO `web_category` (`cat_id`, `slug`, `cat_name_en`, `cat_name_fr`, `parent_id`, `cat_image`, `cat_title1_en`, `cat_title1_fr`, `cat_title2_en`, `cat_title2_fr`, `menu`, `position_serial`, `status`) VALUES (29, 'notice', 'Notice', 'Noticeo', 0, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 2, 0, 1);
INSERT INTO `web_category` (`cat_id`, `slug`, `cat_name_en`, `cat_name_fr`, `parent_id`, `cat_image`, `cat_title1_en`, `cat_title1_fr`, `cat_title2_en`, `cat_title2_fr`, `menu`, `position_serial`, `status`) VALUES (30, 'faq', 'FAQ', 'FAQ', 30, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', ' Frequently asked questions', ' Frequently asked questions', ' frequently asked questions', ' Frequently asked questions', 2, NULL, 1);
INSERT INTO `web_category` (`cat_id`, `slug`, `cat_name_en`, `cat_name_fr`, `parent_id`, `cat_image`, `cat_title1_en`, `cat_title1_fr`, `cat_title2_en`, `cat_title2_fr`, `menu`, `position_serial`, `status`) VALUES (31, 'welcome-text', 'Welcome Text', 'Welcome Text', 0, '', 'Welcome Text', 'Welcome Text', '', '', 0, NULL, 1);
INSERT INTO `web_category` (`cat_id`, `slug`, `cat_name_en`, `cat_name_fr`, `parent_id`, `cat_image`, `cat_title1_en`, `cat_title1_fr`, `cat_title2_en`, `cat_title2_fr`, `menu`, `position_serial`, `status`) VALUES (32, 'coin-list', 'Coin List', 'Coin List', 0, 'upload/1613365281_db9ef32ca3cf3baef089.jpg', 'Coin List', 'Coin List', '', '', 0, 0, 1);
INSERT INTO `web_category` (`cat_id`, `slug`, `cat_name_en`, `cat_name_fr`, `parent_id`, `cat_image`, `cat_title1_en`, `cat_title1_fr`, `cat_title2_en`, `cat_title2_fr`, `menu`, `position_serial`, `status`) VALUES (34, 'demo-menu', 'demo menu', 'TT', 29, 'upload/1673065153_1a0380fa80b402469576.jpg', 'TT', 'TT', 'sdfds', 'sdf', 2, 0, 1);


#
# TABLE STRUCTURE FOR: web_language
#

DROP TABLE IF EXISTS `web_language`;

CREATE TABLE `web_language` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `flag` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

INSERT INTO `web_language` (`id`, `name`, `flag`) VALUES (1, 'English ', 'en');
INSERT INTO `web_language` (`id`, `name`, `flag`) VALUES (2, 'Frence ', 'fr');


#
# TABLE STRUCTURE FOR: web_news
#

DROP TABLE IF EXISTS `web_news`;

CREATE TABLE `web_news` (
  `article_id` int NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) DEFAULT NULL,
  `headline_en` varchar(300) NOT NULL,
  `headline_fr` varchar(300) NOT NULL,
  `article_image` varchar(100) DEFAULT NULL,
  `custom_url` varchar(300) NOT NULL,
  `article1_en` longtext NOT NULL,
  `article1_fr` longtext NOT NULL,
  `article2_en` longtext NOT NULL,
  `article2_fr` longtext NOT NULL,
  `cat_id` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `position_serial` int NOT NULL,
  `publish_date` datetime NOT NULL,
  `publish_by` varchar(20) NOT NULL,
  `edit_history` int NOT NULL,
  PRIMARY KEY (`article_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

INSERT INTO `web_news` (`article_id`, `slug`, `headline_en`, `headline_fr`, `article_image`, `custom_url`, `article1_en`, `article1_fr`, `article2_en`, `article2_fr`, `cat_id`, `parent_id`, `position_serial`, `publish_date`, `publish_by`, `edit_history`) VALUES (4, 'south-africa-puts-onus-on-taxpayers-to-declare-all-cryptocurrency-income', 'South Africa Puts Onus on Taxpayers to Declare All Cryptocurrency Income', '', 'upload/news/166e293c430bdf835f0c6d6a127e4e13.jpg', '', '<div>Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. Autem ullum cu sed. Id per enim deserunt, vel an choro dolores voluptatum. His viderer civibus te, quis vero timeam te mel. Meis nulla nec id. Te eros ubique ius.</div><div><br></div><div>Pri nisl velit at. Ei lobortis forensibus dissentiunt sit, ius idque veritus in, in aeterno invenire usu. Esse inani inermis eam ea. Justo perfecto dignissim an pri, ea sit dico neglegentur, id mundi maiestatis vel. Eos eu stet dicit. Porro suscipiantur id usu, antiopam moderatius sit ne. Ei nulla torquatos ullamcorper sed, no stet graece instructior vel, eirmod vulputate an duo.</div><div><br></div><div>Splendide laboramus eam cu, veritus singulis vel et, essent assentior an vim. Prima paulo ut mei, no tota erat eam. Constituam consequuntur his ad. Ad ius libris labore, ex sumo regione eos. No ius vero apeirian.</div><div><br></div><div>Mollis integre persius ad nam. At agam constituam sit, an mea dolores iracundia conceptam, vis no atqui verear detracto. Et fugit ridens intellegam duo, eu facilisi erroribus duo. Et vix homero verear liberavisse, natum nonumes splendide usu at. Ea vis meliore offendit intellegebat. Ne mazim philosophia usu.</div><div><br></div><div>At mazim tacimates per. Ne reque tractatos mel, at eos case commodo. Cu animal constituam pri, ea nam ceteros copiosae philosophia. Ei modo fuisset pertinax vim, id vis tacimates interpretaris mediocritatem. Vel no esse scripserit, nostrum tacimates his te.</div><div><br></div><div>Corpora postulant voluptatum nam eu. Cum te agam delectus ullamcorper, nostrum perfecto an nam. Ne quo accusata adversarium, illud efficiantur te nam. At veri simul virtute mei, deleniti persecuti te mei. Ludus animal eam cu, an nulla prompta imperdiet vis. Est cu dicam soluta everti.</div><div><br></div><div>Aliquam feugait perfecto per ne, an adolescens sententiae vis, his no noster animal. At vim vidit apeirian appellantur, no graecis invidunt sea. Illud oblique ad ius, eum no partem consectetuer, equidem incorrupte cum cu. At usu docendi tibique evertitur. Duis deserunt pri at. Aeque tempor usu et, ex illum facer efficiendi nam.</div><div><br></div><div>Vel quodsi iracundia ne, eu audiam tibique mnesarchum est. Diam oporteat suavitate pri id. Eos latine euripidis ad, ad mei partem accommodare, nam at elitr vitae voluptaria. Id sea ceteros suscipiantur. Ne per viderer tacimates repudiare, sed id quaestio cotidieque. Ei hinc dolor putent usu, falli lucilius nam at.</div><div><br></div><div>Aperiam detracto qualisque cu sea, sea te deleniti scripserit. Option feugiat sit ei. Labore volumus instructior eos ne, id graecis antiopam assueverit vel, no appetere argumentum eloquentiam quo. Error option dolorum nam cu. Vim tantas populo et, te mea quem quando decore.</div><div><br></div><div>Duo ad elit aperiam. Et error aliquip mea. Cum ut facete assentior, ei vis dictas erroribus salutatus. Mea eu iusto volumus argumentum, sed eu quando regione indoctum.</div>', '', '', '', 21, NULL, 0, '2018-07-10 09:11:16', 'admin@demo.com', 0);
INSERT INTO `web_news` (`article_id`, `slug`, `headline_en`, `headline_fr`, `article_image`, `custom_url`, `article1_en`, `article1_fr`, `article2_en`, `article2_fr`, `cat_id`, `parent_id`, `position_serial`, `publish_date`, `publish_by`, `edit_history`) VALUES (5, 'neo-eos-litecoin-iota-and-stellar-technical-analysis-april-9-2018', 'NEO, EOS, Litecoin, IOTA and Stellar: Technical Analysis April 9, 2018', '', 'upload/news/b731dbe9143e088de015c0c844d40105.jpg', '', '<div>Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. Autem ullum cu sed. Id per enim deserunt, vel an choro dolores voluptatum. His viderer civibus te, quis vero timeam te mel. Meis nulla nec id. Te eros ubique ius.</div><div><br></div><div>Pri nisl velit at. Ei lobortis forensibus dissentiunt sit, ius idque veritus in, in aeterno invenire usu. Esse inani inermis eam ea. Justo perfecto dignissim an pri, ea sit dico neglegentur, id mundi maiestatis vel. Eos eu stet dicit. Porro suscipiantur id usu, antiopam moderatius sit ne. Ei nulla torquatos ullamcorper sed, no stet graece instructior vel, eirmod vulputate an duo.</div><div><br></div><div>Splendide laboramus eam cu, veritus singulis vel et, essent assentior an vim. Prima paulo ut mei, no tota erat eam. Constituam consequuntur his ad. Ad ius libris labore, ex sumo regione eos. No ius vero apeirian.</div><div><br></div><div>Mollis integre persius ad nam. At agam constituam sit, an mea dolores iracundia conceptam, vis no atqui verear detracto. Et fugit ridens intellegam duo, eu facilisi erroribus duo. Et vix homero verear liberavisse, natum nonumes splendide usu at. Ea vis meliore offendit intellegebat. Ne mazim philosophia usu.</div><div><br></div><div>At mazim tacimates per. Ne reque tractatos mel, at eos case commodo. Cu animal constituam pri, ea nam ceteros copiosae philosophia. Ei modo fuisset pertinax vim, id vis tacimates interpretaris mediocritatem. Vel no esse scripserit, nostrum tacimates his te.</div><div><br></div><div>Corpora postulant voluptatum nam eu. Cum te agam delectus ullamcorper, nostrum perfecto an nam. Ne quo accusata adversarium, illud efficiantur te nam. At veri simul virtute mei, deleniti persecuti te mei. Ludus animal eam cu, an nulla prompta imperdiet vis. Est cu dicam soluta everti.</div><div><br></div><div>Aliquam feugait perfecto per ne, an adolescens sententiae vis, his no noster animal. At vim vidit apeirian appellantur, no graecis invidunt sea. Illud oblique ad ius, eum no partem consectetuer, equidem incorrupte cum cu. At usu docendi tibique evertitur. Duis deserunt pri at. Aeque tempor usu et, ex illum facer efficiendi nam.</div><div><br></div><div>Vel quodsi iracundia ne, eu audiam tibique mnesarchum est. Diam oporteat suavitate pri id. Eos latine euripidis ad, ad mei partem accommodare, nam at elitr vitae voluptaria. Id sea ceteros suscipiantur. Ne per viderer tacimates repudiare, sed id quaestio cotidieque. Ei hinc dolor putent usu, falli lucilius nam at.</div><div><br></div><div>Aperiam detracto qualisque cu sea, sea te deleniti scripserit. Option feugiat sit ei. Labore volumus instructior eos ne, id graecis antiopam assueverit vel, no appetere argumentum eloquentiam quo. Error option dolorum nam cu. Vim tantas populo et, te mea quem quando decore.</div><div><br></div><div>Duo ad elit aperiam. Et error aliquip mea. Cum ut facete assentior, ei vis dictas erroribus salutatus. Mea eu iusto volumus argumentum, sed eu quando regione indoctum.</div>', '', '', '', 21, NULL, 0, '2018-07-10 09:11:02', 'admin@demo.com', 0);
INSERT INTO `web_news` (`article_id`, `slug`, `headline_en`, `headline_fr`, `article_image`, `custom_url`, `article1_en`, `article1_fr`, `article2_en`, `article2_fr`, `cat_id`, `parent_id`, `position_serial`, `publish_date`, `publish_by`, `edit_history`) VALUES (6, 'why-invest-in-dash', 'Why Invest in Dash?', '', 'upload/news/9d5c09ab5b25569514fa852e2d2c1483.jpg', '', '<div>Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. Autem ullum cu sed. Id per enim deserunt, vel an choro dolores voluptatum. His viderer civibus te, quis vero timeam te mel. Meis nulla nec id. Te eros ubique ius.</div><div><br></div><div>Pri nisl velit at. Ei lobortis forensibus dissentiunt sit, ius idque veritus in, in aeterno invenire usu. Esse inani inermis eam ea. Justo perfecto dignissim an pri, ea sit dico neglegentur, id mundi maiestatis vel. Eos eu stet dicit. Porro suscipiantur id usu, antiopam moderatius sit ne. Ei nulla torquatos ullamcorper sed, no stet graece instructior vel, eirmod vulputate an duo.</div><div><br></div><div>Splendide laboramus eam cu, veritus singulis vel et, essent assentior an vim. Prima paulo ut mei, no tota erat eam. Constituam consequuntur his ad. Ad ius libris labore, ex sumo regione eos. No ius vero apeirian.</div><div><br></div><div>Mollis integre persius ad nam. At agam constituam sit, an mea dolores iracundia conceptam, vis no atqui verear detracto. Et fugit ridens intellegam duo, eu facilisi erroribus duo. Et vix homero verear liberavisse, natum nonumes splendide usu at. Ea vis meliore offendit intellegebat. Ne mazim philosophia usu.</div><div><br></div><div>At mazim tacimates per. Ne reque tractatos mel, at eos case commodo. Cu animal constituam pri, ea nam ceteros copiosae philosophia. Ei modo fuisset pertinax vim, id vis tacimates interpretaris mediocritatem. Vel no esse scripserit, nostrum tacimates his te.</div><div><br></div><div>Corpora postulant voluptatum nam eu. Cum te agam delectus ullamcorper, nostrum perfecto an nam. Ne quo accusata adversarium, illud efficiantur te nam. At veri simul virtute mei, deleniti persecuti te mei. Ludus animal eam cu, an nulla prompta imperdiet vis. Est cu dicam soluta everti.</div><div><br></div><div>Aliquam feugait perfecto per ne, an adolescens sententiae vis, his no noster animal. At vim vidit apeirian appellantur, no graecis invidunt sea. Illud oblique ad ius, eum no partem consectetuer, equidem incorrupte cum cu. At usu docendi tibique evertitur. Duis deserunt pri at. Aeque tempor usu et, ex illum facer efficiendi nam.</div><div><br></div><div>Vel quodsi iracundia ne, eu audiam tibique mnesarchum est. Diam oporteat suavitate pri id. Eos latine euripidis ad, ad mei partem accommodare, nam at elitr vitae voluptaria. Id sea ceteros suscipiantur. Ne per viderer tacimates repudiare, sed id quaestio cotidieque. Ei hinc dolor putent usu, falli lucilius nam at.</div><div><br></div><div>Aperiam detracto qualisque cu sea, sea te deleniti scripserit. Option feugiat sit ei. Labore volumus instructior eos ne, id graecis antiopam assueverit vel, no appetere argumentum eloquentiam quo. Error option dolorum nam cu. Vim tantas populo et, te mea quem quando decore.</div><div><br></div><div>Duo ad elit aperiam. Et error aliquip mea. Cum ut facete assentior, ei vis dictas erroribus salutatus. Mea eu iusto volumus argumentum, sed eu quando regione indoctum.</div>', '', '', '', 22, NULL, 0, '2018-07-10 09:10:50', 'admin@demo.com', 0);
INSERT INTO `web_news` (`article_id`, `slug`, `headline_en`, `headline_fr`, `article_image`, `custom_url`, `article1_en`, `article1_fr`, `article2_en`, `article2_fr`, `cat_id`, `parent_id`, `position_serial`, `publish_date`, `publish_by`, `edit_history`) VALUES (7, 'asic-resistance-increasingly-hot-topic-in-crypto-as-monero-forks', 'ASIC Resistance Increasingly Hot Topic in Crypto as Monero Forks', '', 'upload/news/32083222f2430503659756a60d3b0b6b.jpg', '', '<div>Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. Autem ullum cu sed. Id per enim deserunt, vel an choro dolores voluptatum. His viderer civibus te, quis vero timeam te mel. Meis nulla nec id. Te eros ubique ius.</div><div><br></div><div>Pri nisl velit at. Ei lobortis forensibus dissentiunt sit, ius idque veritus in, in aeterno invenire usu. Esse inani inermis eam ea. Justo perfecto dignissim an pri, ea sit dico neglegentur, id mundi maiestatis vel. Eos eu stet dicit. Porro suscipiantur id usu, antiopam moderatius sit ne. Ei nulla torquatos ullamcorper sed, no stet graece instructior vel, eirmod vulputate an duo.</div><div><br></div><div>Splendide laboramus eam cu, veritus singulis vel et, essent assentior an vim. Prima paulo ut mei, no tota erat eam. Constituam consequuntur his ad. Ad ius libris labore, ex sumo regione eos. No ius vero apeirian.</div><div><br></div><div>Mollis integre persius ad nam. At agam constituam sit, an mea dolores iracundia conceptam, vis no atqui verear detracto. Et fugit ridens intellegam duo, eu facilisi erroribus duo. Et vix homero verear liberavisse, natum nonumes splendide usu at. Ea vis meliore offendit intellegebat. Ne mazim philosophia usu.</div><div><br></div><div>At mazim tacimates per. Ne reque tractatos mel, at eos case commodo. Cu animal constituam pri, ea nam ceteros copiosae philosophia. Ei modo fuisset pertinax vim, id vis tacimates interpretaris mediocritatem. Vel no esse scripserit, nostrum tacimates his te.</div><div><br></div><div>Corpora postulant voluptatum nam eu. Cum te agam delectus ullamcorper, nostrum perfecto an nam. Ne quo accusata adversarium, illud efficiantur te nam. At veri simul virtute mei, deleniti persecuti te mei. Ludus animal eam cu, an nulla prompta imperdiet vis. Est cu dicam soluta everti.</div><div><br></div><div>Aliquam feugait perfecto per ne, an adolescens sententiae vis, his no noster animal. At vim vidit apeirian appellantur, no graecis invidunt sea. Illud oblique ad ius, eum no partem consectetuer, equidem incorrupte cum cu. At usu docendi tibique evertitur. Duis deserunt pri at. Aeque tempor usu et, ex illum facer efficiendi nam.</div><div><br></div><div>Vel quodsi iracundia ne, eu audiam tibique mnesarchum est. Diam oporteat suavitate pri id. Eos latine euripidis ad, ad mei partem accommodare, nam at elitr vitae voluptaria. Id sea ceteros suscipiantur. Ne per viderer tacimates repudiare, sed id quaestio cotidieque. Ei hinc dolor putent usu, falli lucilius nam at.</div><div><br></div><div>Aperiam detracto qualisque cu sea, sea te deleniti scripserit. Option feugiat sit ei. Labore volumus instructior eos ne, id graecis antiopam assueverit vel, no appetere argumentum eloquentiam quo. Error option dolorum nam cu. Vim tantas populo et, te mea quem quando decore.</div><div><br></div><div>Duo ad elit aperiam. Et error aliquip mea. Cum ut facete assentior, ei vis dictas erroribus salutatus. Mea eu iusto volumus argumentum, sed eu quando regione indoctum.</div>', '', '', '', 19, NULL, 0, '2018-07-17 10:30:35', 'admin@demo.com', 0);
INSERT INTO `web_news` (`article_id`, `slug`, `headline_en`, `headline_fr`, `article_image`, `custom_url`, `article1_en`, `article1_fr`, `article2_en`, `article2_fr`, `cat_id`, `parent_id`, `position_serial`, `publish_date`, `publish_by`, `edit_history`) VALUES (8, 'canadian-mining-giant-hyperblock-acquires-cryptoglobal-for-106-million', 'CANADIAN MINING GIANT HYPERBLOCK ACQUIRES CRYPTOGLOBAL FOR $106 MILLION', '', 'upload/news/e56c8562afa3795f3c4c3ecccc3bfa83.jpg', '', '<div>Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. Autem ullum cu sed. Id per enim deserunt, vel an choro dolores voluptatum. His viderer civibus te, quis vero timeam te mel. Meis nulla nec id. Te eros ubique ius.</div><div><br></div><div>Pri nisl velit at. Ei lobortis forensibus dissentiunt sit, ius idque veritus in, in aeterno invenire usu. Esse inani inermis eam ea. Justo perfecto dignissim an pri, ea sit dico neglegentur, id mundi maiestatis vel. Eos eu stet dicit. Porro suscipiantur id usu, antiopam moderatius sit ne. Ei nulla torquatos ullamcorper sed, no stet graece instructior vel, eirmod vulputate an duo.</div><div><br></div><div>Splendide laboramus eam cu, veritus singulis vel et, essent assentior an vim. Prima paulo ut mei, no tota erat eam. Constituam consequuntur his ad. Ad ius libris labore, ex sumo regione eos. No ius vero apeirian.</div><div><br></div><div>Mollis integre persius ad nam. At agam constituam sit, an mea dolores iracundia conceptam, vis no atqui verear detracto. Et fugit ridens intellegam duo, eu facilisi erroribus duo. Et vix homero verear liberavisse, natum nonumes splendide usu at. Ea vis meliore offendit intellegebat. Ne mazim philosophia usu.</div><div><br></div><div>At mazim tacimates per. Ne reque tractatos mel, at eos case commodo. Cu animal constituam pri, ea nam ceteros copiosae philosophia. Ei modo fuisset pertinax vim, id vis tacimates interpretaris mediocritatem. Vel no esse scripserit, nostrum tacimates his te.</div><div><br></div><div>Corpora postulant voluptatum nam eu. Cum te agam delectus ullamcorper, nostrum perfecto an nam. Ne quo accusata adversarium, illud efficiantur te nam. At veri simul virtute mei, deleniti persecuti te mei. Ludus animal eam cu, an nulla prompta imperdiet vis. Est cu dicam soluta everti.</div><div><br></div><div>Aliquam feugait perfecto per ne, an adolescens sententiae vis, his no noster animal. At vim vidit apeirian appellantur, no graecis invidunt sea. Illud oblique ad ius, eum no partem consectetuer, equidem incorrupte cum cu. At usu docendi tibique evertitur. Duis deserunt pri at. Aeque tempor usu et, ex illum facer efficiendi nam.</div><div><br></div><div>Vel quodsi iracundia ne, eu audiam tibique mnesarchum est. Diam oporteat suavitate pri id. Eos latine euripidis ad, ad mei partem accommodare, nam at elitr vitae voluptaria. Id sea ceteros suscipiantur. Ne per viderer tacimates repudiare, sed id quaestio cotidieque. Ei hinc dolor putent usu, falli lucilius nam at.</div><div><br></div><div>Aperiam detracto qualisque cu sea, sea te deleniti scripserit. Option feugiat sit ei. Labore volumus instructior eos ne, id graecis antiopam assueverit vel, no appetere argumentum eloquentiam quo. Error option dolorum nam cu. Vim tantas populo et, te mea quem quando decore.</div><div><br></div><div>Duo ad elit aperiam. Et error aliquip mea. Cum ut facete assentior, ei vis dictas erroribus salutatus. Mea eu iusto volumus argumentum, sed eu quando regione indoctum.</div>', '', '', '', 27, NULL, 0, '2018-07-17 10:30:23', 'admin@demo.com', 0);
INSERT INTO `web_news` (`article_id`, `slug`, `headline_en`, `headline_fr`, `article_image`, `custom_url`, `article1_en`, `article1_fr`, `article2_en`, `article2_fr`, `cat_id`, `parent_id`, `position_serial`, `publish_date`, `publish_by`, `edit_history`) VALUES (9, 'how-can-blockchains-remove-the-pay-to-trade-barrier-in-the-market', 'How Can Blockchains Remove the ‘Pay to Trade’ Barrier in the Market?', '', 'upload/news/2ff94094fcfbe19daf303a479b9fad68.jpg', '', '<div>Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. Autem ullum cu sed. Id per enim deserunt, vel an choro dolores voluptatum. His viderer civibus te, quis vero timeam te mel. Meis nulla nec id. Te eros ubique ius.</div><div><br></div><div>Pri nisl velit at. Ei lobortis forensibus dissentiunt sit, ius idque veritus in, in aeterno invenire usu. Esse inani inermis eam ea. Justo perfecto dignissim an pri, ea sit dico neglegentur, id mundi maiestatis vel. Eos eu stet dicit. Porro suscipiantur id usu, antiopam moderatius sit ne. Ei nulla torquatos ullamcorper sed, no stet graece instructior vel, eirmod vulputate an duo.</div><div><br></div><div>Splendide laboramus eam cu, veritus singulis vel et, essent assentior an vim. Prima paulo ut mei, no tota erat eam. Constituam consequuntur his ad. Ad ius libris labore, ex sumo regione eos. No ius vero apeirian.</div><div><br></div><div>Mollis integre persius ad nam. At agam constituam sit, an mea dolores iracundia conceptam, vis no atqui verear detracto. Et fugit ridens intellegam duo, eu facilisi erroribus duo. Et vix homero verear liberavisse, natum nonumes splendide usu at. Ea vis meliore offendit intellegebat. Ne mazim philosophia usu.</div><div><br></div><div>At mazim tacimates per. Ne reque tractatos mel, at eos case commodo. Cu animal constituam pri, ea nam ceteros copiosae philosophia. Ei modo fuisset pertinax vim, id vis tacimates interpretaris mediocritatem. Vel no esse scripserit, nostrum tacimates his te.</div><div><br></div><div>Corpora postulant voluptatum nam eu. Cum te agam delectus ullamcorper, nostrum perfecto an nam. Ne quo accusata adversarium, illud efficiantur te nam. At veri simul virtute mei, deleniti persecuti te mei. Ludus animal eam cu, an nulla prompta imperdiet vis. Est cu dicam soluta everti.</div><div><br></div><div>Aliquam feugait perfecto per ne, an adolescens sententiae vis, his no noster animal. At vim vidit apeirian appellantur, no graecis invidunt sea. Illud oblique ad ius, eum no partem consectetuer, equidem incorrupte cum cu. At usu docendi tibique evertitur. Duis deserunt pri at. Aeque tempor usu et, ex illum facer efficiendi nam.</div><div><br></div><div>Vel quodsi iracundia ne, eu audiam tibique mnesarchum est. Diam oporteat suavitate pri id. Eos latine euripidis ad, ad mei partem accommodare, nam at elitr vitae voluptaria. Id sea ceteros suscipiantur. Ne per viderer tacimates repudiare, sed id quaestio cotidieque. Ei hinc dolor putent usu, falli lucilius nam at.</div><div><br></div><div>Aperiam detracto qualisque cu sea, sea te deleniti scripserit. Option feugiat sit ei. Labore volumus instructior eos ne, id graecis antiopam assueverit vel, no appetere argumentum eloquentiam quo. Error option dolorum nam cu. Vim tantas populo et, te mea quem quando decore.</div><div><br></div><div>Duo ad elit aperiam. Et error aliquip mea. Cum ut facete assentior, ei vis dictas erroribus salutatus. Mea eu iusto volumus argumentum, sed eu quando regione indoctum.</div>', '', '', '', 24, NULL, 0, '2018-07-10 09:13:25', 'admin@demo.com', 0);
INSERT INTO `web_news` (`article_id`, `slug`, `headline_en`, `headline_fr`, `article_image`, `custom_url`, `article1_en`, `article1_fr`, `article2_en`, `article2_fr`, `cat_id`, `parent_id`, `position_serial`, `publish_date`, `publish_by`, `edit_history`) VALUES (10, 'how-blockchain-is-making-it-easier-to-get', 'How Blockchain Is Making It Easier to Get', '', 'upload/news/44807c1619ecc1f8374b8930477187aa.jpg', '', '<div>Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. Autem ullum cu sed. Id per enim deserunt, vel an choro dolores voluptatum. His viderer civibus te, quis vero timeam te mel. Meis nulla nec id. Te eros ubique ius.</div><div><br></div><div>Pri nisl velit at. Ei lobortis forensibus dissentiunt sit, ius idque veritus in, in aeterno invenire usu. Esse inani inermis eam ea. Justo perfecto dignissim an pri, ea sit dico neglegentur, id mundi maiestatis vel. Eos eu stet dicit. Porro suscipiantur id usu, antiopam moderatius sit ne. Ei nulla torquatos ullamcorper sed, no stet graece instructior vel, eirmod vulputate an duo.</div><div><br></div><div>Splendide laboramus eam cu, veritus singulis vel et, essent assentior an vim. Prima paulo ut mei, no tota erat eam. Constituam consequuntur his ad. Ad ius libris labore, ex sumo regione eos. No ius vero apeirian.</div><div><br></div><div>Mollis integre persius ad nam. At agam constituam sit, an mea dolores iracundia conceptam, vis no atqui verear detracto. Et fugit ridens intellegam duo, eu facilisi erroribus duo. Et vix homero verear liberavisse, natum nonumes splendide usu at. Ea vis meliore offendit intellegebat. Ne mazim philosophia usu.</div><div><br></div><div>At mazim tacimates per. Ne reque tractatos mel, at eos case commodo. Cu animal constituam pri, ea nam ceteros copiosae philosophia. Ei modo fuisset pertinax vim, id vis tacimates interpretaris mediocritatem. Vel no esse scripserit, nostrum tacimates his te.</div><div><br></div><div>Corpora postulant voluptatum nam eu. Cum te agam delectus ullamcorper, nostrum perfecto an nam. Ne quo accusata adversarium, illud efficiantur te nam. At veri simul virtute mei, deleniti persecuti te mei. Ludus animal eam cu, an nulla prompta imperdiet vis. Est cu dicam soluta everti.</div><div><br></div><div>Aliquam feugait perfecto per ne, an adolescens sententiae vis, his no noster animal. At vim vidit apeirian appellantur, no graecis invidunt sea. Illud oblique ad ius, eum no partem consectetuer, equidem incorrupte cum cu. At usu docendi tibique evertitur. Duis deserunt pri at. Aeque tempor usu et, ex illum facer efficiendi nam.</div><div><br></div><div>Vel quodsi iracundia ne, eu audiam tibique mnesarchum est. Diam oporteat suavitate pri id. Eos latine euripidis ad, ad mei partem accommodare, nam at elitr vitae voluptaria. Id sea ceteros suscipiantur. Ne per viderer tacimates repudiare, sed id quaestio cotidieque. Ei hinc dolor putent usu, falli lucilius nam at.</div><div><br></div><div>Aperiam detracto qualisque cu sea, sea te deleniti scripserit. Option feugiat sit ei. Labore volumus instructior eos ne, id graecis antiopam assueverit vel, no appetere argumentum eloquentiam quo. Error option dolorum nam cu. Vim tantas populo et, te mea quem quando decore.</div><div><br></div><div>Duo ad elit aperiam. Et error aliquip mea. Cum ut facete assentior, ei vis dictas erroribus salutatus. Mea eu iusto volumus argumentum, sed eu quando regione indoctum.</div>', '', '', '', 24, NULL, 0, '2018-07-10 09:13:16', 'admin@demo.com', 0);
INSERT INTO `web_news` (`article_id`, `slug`, `headline_en`, `headline_fr`, `article_image`, `custom_url`, `article1_en`, `article1_fr`, `article2_en`, `article2_fr`, `cat_id`, `parent_id`, `position_serial`, `publish_date`, `publish_by`, `edit_history`) VALUES (11, 'ripple-price-technical-analysis-xrpusd', 'Ripple Price Technical Analysis – XRP/USD', '', 'upload/news/3c9de71155211697f38a3820ba36670d.jpg', '', '<div>Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. Autem ullum cu sed. Id per enim deserunt, vel an choro dolores voluptatum. His viderer civibus te, quis vero timeam te mel. Meis nulla nec id. Te eros ubique ius.</div><div><br></div><div>Pri nisl velit at. Ei lobortis forensibus dissentiunt sit, ius idque veritus in, in aeterno invenire usu. Esse inani inermis eam ea. Justo perfecto dignissim an pri, ea sit dico neglegentur, id mundi maiestatis vel. Eos eu stet dicit. Porro suscipiantur id usu, antiopam moderatius sit ne. Ei nulla torquatos ullamcorper sed, no stet graece instructior vel, eirmod vulputate an duo.</div><div><br></div><div>Splendide laboramus eam cu, veritus singulis vel et, essent assentior an vim. Prima paulo ut mei, no tota erat eam. Constituam consequuntur his ad. Ad ius libris labore, ex sumo regione eos. No ius vero apeirian.</div><div><br></div><div>Mollis integre persius ad nam. At agam constituam sit, an mea dolores iracundia conceptam, vis no atqui verear detracto. Et fugit ridens intellegam duo, eu facilisi erroribus duo. Et vix homero verear liberavisse, natum nonumes splendide usu at. Ea vis meliore offendit intellegebat. Ne mazim philosophia usu.</div><div><br></div><div>At mazim tacimates per. Ne reque tractatos mel, at eos case commodo. Cu animal constituam pri, ea nam ceteros copiosae philosophia. Ei modo fuisset pertinax vim, id vis tacimates interpretaris mediocritatem. Vel no esse scripserit, nostrum tacimates his te.</div><div><br></div><div>Corpora postulant voluptatum nam eu. Cum te agam delectus ullamcorper, nostrum perfecto an nam. Ne quo accusata adversarium, illud efficiantur te nam. At veri simul virtute mei, deleniti persecuti te mei. Ludus animal eam cu, an nulla prompta imperdiet vis. Est cu dicam soluta everti.</div><div><br></div><div>Aliquam feugait perfecto per ne, an adolescens sententiae vis, his no noster animal. At vim vidit apeirian appellantur, no graecis invidunt sea. Illud oblique ad ius, eum no partem consectetuer, equidem incorrupte cum cu. At usu docendi tibique evertitur. Duis deserunt pri at. Aeque tempor usu et, ex illum facer efficiendi nam.</div><div><br></div><div>Vel quodsi iracundia ne, eu audiam tibique mnesarchum est. Diam oporteat suavitate pri id. Eos latine euripidis ad, ad mei partem accommodare, nam at elitr vitae voluptaria. Id sea ceteros suscipiantur. Ne per viderer tacimates repudiare, sed id quaestio cotidieque. Ei hinc dolor putent usu, falli lucilius nam at.</div><div><br></div><div>Aperiam detracto qualisque cu sea, sea te deleniti scripserit. Option feugiat sit ei. Labore volumus instructior eos ne, id graecis antiopam assueverit vel, no appetere argumentum eloquentiam quo. Error option dolorum nam cu. Vim tantas populo et, te mea quem quando decore.</div><div><br></div><div>Duo ad elit aperiam. Et error aliquip mea. Cum ut facete assentior, ei vis dictas erroribus salutatus. Mea eu iusto volumus argumentum, sed eu quando regione indoctum.</div>', '', '', '', 25, NULL, 0, '2018-07-08 09:11:43', 'admin@demo.com', 0);
INSERT INTO `web_news` (`article_id`, `slug`, `headline_en`, `headline_fr`, `article_image`, `custom_url`, `article1_en`, `article1_fr`, `article2_en`, `article2_fr`, `cat_id`, `parent_id`, `position_serial`, `publish_date`, `publish_by`, `edit_history`) VALUES (12, 'bitfinex-introduces-trading-for-12-altcoins', 'Bitfinex Introduces Trading for 12 Altcoins', '', 'upload/news/bced67e1ee1ed3b2f3d4a10f9f71e78e.jpg', '', '<div>Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. Autem ullum cu sed. Id per enim deserunt, vel an choro dolores voluptatum. His viderer civibus te, quis vero timeam te mel. Meis nulla nec id. Te eros ubique ius.</div><div><br></div><div>Pri nisl velit at. Ei lobortis forensibus dissentiunt sit, ius idque veritus in, in aeterno invenire usu. Esse inani inermis eam ea. Justo perfecto dignissim an pri, ea sit dico neglegentur, id mundi maiestatis vel. Eos eu stet dicit. Porro suscipiantur id usu, antiopam moderatius sit ne. Ei nulla torquatos ullamcorper sed, no stet graece instructior vel, eirmod vulputate an duo.</div><div><br></div><div>Splendide laboramus eam cu, veritus singulis vel et, essent assentior an vim. Prima paulo ut mei, no tota erat eam. Constituam consequuntur his ad. Ad ius libris labore, ex sumo regione eos. No ius vero apeirian.</div><div><br></div><div>Mollis integre persius ad nam. At agam constituam sit, an mea dolores iracundia conceptam, vis no atqui verear detracto. Et fugit ridens intellegam duo, eu facilisi erroribus duo. Et vix homero verear liberavisse, natum nonumes splendide usu at. Ea vis meliore offendit intellegebat. Ne mazim philosophia usu.</div><div><br></div><div>At mazim tacimates per. Ne reque tractatos mel, at eos case commodo. Cu animal constituam pri, ea nam ceteros copiosae philosophia. Ei modo fuisset pertinax vim, id vis tacimates interpretaris mediocritatem. Vel no esse scripserit, nostrum tacimates his te.</div><div><br></div><div>Corpora postulant voluptatum nam eu. Cum te agam delectus ullamcorper, nostrum perfecto an nam. Ne quo accusata adversarium, illud efficiantur te nam. At veri simul virtute mei, deleniti persecuti te mei. Ludus animal eam cu, an nulla prompta imperdiet vis. Est cu dicam soluta everti.</div><div><br></div><div>Aliquam feugait perfecto per ne, an adolescens sententiae vis, his no noster animal. At vim vidit apeirian appellantur, no graecis invidunt sea. Illud oblique ad ius, eum no partem consectetuer, equidem incorrupte cum cu. At usu docendi tibique evertitur. Duis deserunt pri at. Aeque tempor usu et, ex illum facer efficiendi nam.</div><div><br></div><div>Vel quodsi iracundia ne, eu audiam tibique mnesarchum est. Diam oporteat suavitate pri id. Eos latine euripidis ad, ad mei partem accommodare, nam at elitr vitae voluptaria. Id sea ceteros suscipiantur. Ne per viderer tacimates repudiare, sed id quaestio cotidieque. Ei hinc dolor putent usu, falli lucilius nam at.</div><div><br></div><div>Aperiam detracto qualisque cu sea, sea te deleniti scripserit. Option feugiat sit ei. Labore volumus instructior eos ne, id graecis antiopam assueverit vel, no appetere argumentum eloquentiam quo. Error option dolorum nam cu. Vim tantas populo et, te mea quem quando decore.</div><div><br></div><div>Duo ad elit aperiam. Et error aliquip mea. Cum ut facete assentior, ei vis dictas erroribus salutatus. Mea eu iusto volumus argumentum, sed eu quando regione indoctum.</div>', '', '', '', 25, NULL, 0, '2018-07-10 09:35:43', 'admin@demo.com', 0);


#
# TABLE STRUCTURE FOR: web_slider
#

DROP TABLE IF EXISTS `web_slider`;

CREATE TABLE `web_slider` (
  `id` int NOT NULL AUTO_INCREMENT,
  `slider_h1_en` varchar(900) DEFAULT NULL,
  `slider_h1_fr` varchar(900) DEFAULT NULL,
  `slider_h2_en` varchar(900) DEFAULT NULL,
  `slider_h2_fr` varchar(900) DEFAULT NULL,
  `slider_h3_en` varchar(900) DEFAULT NULL,
  `slider_h3_fr` varchar(900) DEFAULT NULL,
  `slider_img` varchar(300) DEFAULT NULL,
  `custom_url` varchar(300) NOT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

INSERT INTO `web_slider` (`id`, `slider_h1_en`, `slider_h1_fr`, `slider_h2_en`, `slider_h2_fr`, `slider_h3_en`, `slider_h3_fr`, `slider_img`, `custom_url`, `status`) VALUES (1, 'The Feature of Financing Technology is Here', '', 'It is a long established fact that a reader will be distracted.', '', 'Get in touch', '', 'upload/slider/1635412183_f2ae8cca01f1aa5cd933.png', 'https://www.bdtask.com/', 1);
INSERT INTO `web_slider` (`id`, `slider_h1_en`, `slider_h1_fr`, `slider_h2_en`, `slider_h2_fr`, `slider_h3_en`, `slider_h3_fr`, `slider_img`, `custom_url`, `status`) VALUES (3, 'Take the world&#39;s  best  Cryptocurrency  Site.', '', 'Miker Ipsum is simply dummy text of the printing.', '', 'Start Now', '', 'upload/slider/1635412151_11703710f77dd17c1f6e.png', 'https://www.bdtask.com/', 1);


#
# TABLE STRUCTURE FOR: web_social_link
#

DROP TABLE IF EXISTS `web_social_link`;

CREATE TABLE `web_social_link` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `status` int NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO `web_social_link` (`id`, `name`, `link`, `icon`, `status`, `date`) VALUES (1, 'Facebook', 'https://facebook.com', 'facebook', 1, '2023-01-07 10:56:09');
INSERT INTO `web_social_link` (`id`, `name`, `link`, `icon`, `status`, `date`) VALUES (2, 'twitter', 'https://twitter.com', 'tumblr', 1, '2018-07-09 12:12:09');
INSERT INTO `web_social_link` (`id`, `name`, `link`, `icon`, `status`, `date`) VALUES (3, 'linkedin', 'https:/linkdin.com', 'linkedin', 1, '2020-10-04 17:40:11');
INSERT INTO `web_social_link` (`id`, `name`, `link`, `icon`, `status`, `date`) VALUES (4, 'youtube', 'https://www.youtube.com', 'dribbble', 0, '2021-03-09 01:47:57');
INSERT INTO `web_social_link` (`id`, `name`, `link`, `icon`, `status`, `date`) VALUES (5, 'instagram', 'https://instagram.com', 'instagram', 1, '2023-01-05 10:56:44');


#
# TABLE STRUCTURE FOR: web_subscriber
#

DROP TABLE IF EXISTS `web_subscriber`;

CREATE TABLE `web_subscriber` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`sub_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

INSERT INTO `web_subscriber` (`sub_id`, `email`, `status`) VALUES (1, 'hasnathwm@gmail.com', 0);


