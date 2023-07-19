SET sql_mode = '';

--
-- Table structure for table `admin`
--
--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `is_admin` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `advertisement`
--

CREATE TABLE `advertisement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `page` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `script` text,
  `url` varchar(255) DEFAULT NULL,
  `serial_position` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `advertisement`
--

INSERT INTO `advertisement` (`id`, `name`, `page`, `image`, `script`, `url`, `serial_position`, `status`, `date`) VALUES
(5, 'news-sidebar-top', 9, 'upload/advertisement/dff78ee612b37fc12c9e7fa94839d855.jpg', NULL, 'https://www.bdtask.com/', 1, 1, '2018-07-09 01:00:40'),
(6, 'news-sidebar-bottom', 9, 'upload/advertisement/7fabc49dd69e0a0d6e111f3fcae0118a.jpg', NULL, 'https://www.bdtask.com/', 2, 1, '2018-07-09 01:02:18'),
(7, 'news-top', 9, 'upload/advertisement/ff5a204fdd1722068e78222fd1d24a82.jpg', NULL, 'https://www.bdtask.com/', 3, 1, '2018-07-09 00:54:51'),
(8, 'news-bottom', 9, '/upload/advertisement/1614672574_04f30fde1bca314f6013.png', NULL, 'https://www.bdtask.com/', 4, 1, '2021-03-01 14:09:34'),
(9, 'news details-top', 26, '/upload/advertisement/1614672536_9bb671550e7dbf3570a2.png', NULL, 'https://www.bdtask.com/', 3, 1, '2021-03-01 14:08:57'),
(10, 'news details-bottom', 26, '/upload/advertisement/1614672514_0ec53a71097b84c63a82.png', NULL, 'https://www.bdtask.com/', 4, 1, '2021-03-01 14:08:34'),
(11, 'news details-sidebar-top', 26, '/upload/advertisement/1614672490_566192aff15693225bd1.png', NULL, 'https://www.bdtask.com/', 1, 1, '2021-03-01 14:08:11'),
(12, 'news details-sidebar-bottom', 26, '/upload/advertisement/1614657834_eb2d5f67f41ab46b4194.png', NULL, 'https://www.bdtask.com/', 2, 1, '2021-03-01 10:03:54');

-- --------------------------------------------------------

--
-- Table structure for table `coinpayments_payments`
--

CREATE TABLE `coinpayments_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cryptolist`
--

CREATE TABLE `cryptolist` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `Id` int(11) NOT NULL,
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
  `SortOrder` int(11) DEFAULT NULL,
  `Sponsored` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `crypto_payments`
--

CREATE TABLE `crypto_payments` (
  `paymentID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `boxID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `boxType` enum('paymentbox','captchabox') NOT NULL,
  `orderID` varchar(50) NOT NULL DEFAULT '',
  `userID` varchar(50) NOT NULL DEFAULT '',
  `countryID` varchar(3) NOT NULL DEFAULT '',
  `coinLabel` varchar(6) NOT NULL DEFAULT '',
  `amount` double(20,8) NOT NULL DEFAULT '0.00000000',
  `amountUSD` double(20,8) NOT NULL DEFAULT '0.00000000',
  `unrecognised` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `addr` varchar(34) NOT NULL DEFAULT '',
  `txID` char(64) NOT NULL DEFAULT '',
  `txDate` datetime DEFAULT NULL,
  `txConfirmed` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `txCheckDate` datetime DEFAULT NULL,
  `processed` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `processedDate` datetime DEFAULT NULL,
  `recordCreated` datetime DEFAULT NULL,
  PRIMARY KEY (`paymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


-- --------------------------------------------------------

--
-- Table structure for table `dbt_affiliation`
--

CREATE TABLE `dbt_affiliation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `commission` double(19,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dbt_affiliation`
--

INSERT INTO `dbt_affiliation` (`id`, `type`, `commission`, `status`) VALUES
(1, 'PERCENT', 20.00000000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dbt_balance`
--

CREATE TABLE `dbt_balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `balance` double(19,8) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dbt_balance_log`
--

CREATE TABLE `dbt_balance_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `balance_id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `transaction_type` varchar(100) NOT NULL,
  `transaction_amount` double(19,8) NOT NULL,
  `transaction_fees` double(19,8) NOT NULL,
  `ip` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
--
-- Table structure for table `dbt_biding`
--

CREATE TABLE `dbt_biding` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bid_type` varchar(50) NOT NULL,
  `bid_price` double(19,8) NOT NULL,
  `bid_qty` double(19,8) NOT NULL,
  `bid_qty_available` double(19,8) NOT NULL,
  `total_amount` double(19,8) NOT NULL,
  `amount_available` double(19,8) NOT NULL,
  `coin_id` varchar(50) DEFAULT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `market_id` int(11) DEFAULT NULL,
  `market_symbol` varchar(100) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `open_order` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fees_amount` double(19,8) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '"1=Complete, 2=Running"',
  `trade_type` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dbt_biding_log`
--

CREATE TABLE `dbt_biding_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bid_id` bigint(20) NOT NULL,
  `bid_type` varchar(10) NOT NULL,
  `bid_price` double(19,8) NOT NULL,
  `complete_qty` double(19,8) NOT NULL,
  `complete_amount` double(19,8) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `coin_id` varchar(100) DEFAULT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `market_id` int(11) DEFAULT NULL,
  `market_symbol` varchar(100) NOT NULL,
  `success_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fees_amount` double(19,8) NOT NULL,
  `available_amount` double(19,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `trade_type` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dbt_blocklist`
--

CREATE TABLE `dbt_blocklist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip_mail` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dbt_chat`
--

CREATE TABLE `dbt_chat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(10) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dbt_coinhistory`
--

CREATE TABLE `dbt_coinhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dbt_coinpair`
--

CREATE TABLE `dbt_coinpair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `market_id` int(11) DEFAULT NULL,
  `market_symbol` varchar(100) NOT NULL,
  `coin_id` int(11) DEFAULT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `symbol` varchar(100) NOT NULL,
  `pair_type` varchar(55) DEFAULT NULL,
  `initial_price` double(19,8) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `isDefault` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dbt_coinpair`
--

INSERT INTO `dbt_coinpair` (`id`, `market_id`, `market_symbol`, `coin_id`, `currency_symbol`, `name`, `full_name`, `symbol`, `pair_type`, `initial_price`, `status`, `isDefault`) VALUES
(1, NULL, 'USD', NULL, 'DOGE', 'USD', 'Dogecoin / USD ', 'DOGE_USD', NULL, 0.09000000, 1, 0),
(2, NULL, 'USD', NULL, 'BUSD', 'USD', 'Binance-Peg BUSD Token / USD ', 'BUSD_USD', NULL, 0.99800000, 1, 0),
(3, NULL, 'USD', NULL, 'ETH', 'USD', 'Ethereum / USD ', 'ETH_USD', NULL, 1900.00000000, 1, 0),
(4, NULL, 'USD', NULL, 'BTC', 'USD', 'BitCoin / USD ', 'BTC_USD', NULL, 24000.00000000, 1, 0),
(5, NULL, 'USD', NULL, 'USDC', 'USD', 'USD Coin / Tether Coin', 'USDC_USD', NULL, 0.99700000, 1, 0),
(6, NULL, 'USD', NULL, 'SHIB', 'USD', 'Shiba Inu / USD', 'SHIB_USD', NULL, 0.00001999, 1, 0),
(7, NULL, 'USD', NULL, 'SOL', 'USD', 'Solana / USD', 'SOL_USD', NULL, 45.00000000, 1, 0),
(8, NULL, 'USD', NULL, 'WBNB', 'USD', 'BNB/USD', 'WBNB_USD', NULL, 320.00000000, 1, 0),
(9, NULL, 'LTC', NULL, 'XRP', 'LTC', 'XRP/LTC', 'XRP_LTC', NULL, 0.39000000, 1, 0),
(10, NULL, 'LTC', NULL, 'ADA', 'LTC', 'Cardano / LTC', 'ADA_LTC', NULL, 0.57000000, 1, 0),
(11, NULL, 'LTC', NULL, 'MATIC', 'LTC', 'MATIC / LTC', 'MATIC_LTC', NULL, 0.97000000, 1, 0),
(12, NULL, 'LTC', NULL, 'AVAX', 'LTC', 'AVAX / LTC', 'AVAX_LTC', NULL, 28.41000000, 1, 0),
(13, NULL, 'LTC', NULL, 'DOT', 'LTC', 'Polkadot / LTC', 'DOT_LTC', NULL, 8.89000000, 1, 0),
(14, NULL, 'LTC', NULL, 'SAND', 'LTC', ' The Sandbox / LTC', 'SAND_LTC', NULL, 1.38500000, 1, 0),
(15, NULL, 'DOGE', NULL, 'CRV', 'USDT', 'Curve DAO Token / DOGE', 'CRV_DOGE', NULL, 1.35000000, 1, 0),
(16, NULL, 'DOGE', NULL, 'SRM', 'USDT', 'Serum / DOGE', 'SRM_DOGE', NULL, 1.10000000, 1, 0),
(17, NULL, 'DOGE', NULL, 'EOS', 'USDT', 'eosnetwork  / DOGE', 'EOS_DOGE', NULL, 1.50000000, 1, 0),
(18, NULL, 'DOGE', NULL, 'FIL', 'USDT', 'Filecoin / DOGE', 'FIL_DOGE', NULL, 8.95000000, 1, 0),
(19, NULL, 'DOGE', NULL, 'GALA', 'USDT', 'Gala / DOGE', 'GALA_DOGE', NULL, 0.07000000, 1, 0),
(20, NULL, 'BTC', NULL, 'MATIC', 'BTC', 'MATIC / BitCoin ', 'MATIC_BTC', NULL, 0.00294800, 1, 0),
(21, NULL, 'BTC', NULL, 'ADA', 'BTC', 'CARDANO / BitCoin BEP20 ', 'ADA_BTC', NULL, 0.00175000, 1, 0),
(22, NULL, 'BTC', NULL, 'SOL', 'BTC', 'SOLANA / BitCoin ', 'SOL_BTC', NULL, 0.13580000, 1, 0),
(23, NULL, 'BTC', NULL, 'ETH', 'BTC', 'Ethereum / BitCoin', 'ETH_BTC', NULL, 0.01317485, 1, 1),
(24, NULL, 'BTC', NULL, 'SAND', 'BTC', 'SAND / BitCoin ', 'SAND_BTC', NULL, 0.00398500, 1, 0),
(25, NULL, 'BTC', NULL, 'CRV', 'BTC', 'Curve DAO Token / BitCoin ', 'CRV_BTC', NULL, 0.00388000, 1, 0);


-- --------------------------------------------------------

--
-- Table structure for table `dbt_country`
--

CREATE TABLE `dbt_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `nicename` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  `phonecode` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dbt_country`
--

INSERT INTO `dbt_country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', 'ATA', NULL, 0),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, 0),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', 'IOT', NULL, 246),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56),
(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', 'CXR', NULL, 61),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', 'CCK', NULL, 672),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 242),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506),
(53, 'CI', 'COTE D\'IVOIRE', 'Cote D\'Ivoire', 'CIV', 384, 225),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, 0),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL, 0),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354),
(99, 'IN', 'INDIA', 'India', 'IND', 356, 91),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'Korea, Democratic People\'s Republic of', 'PRK', 408, 850),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996),
(116, 'LA', 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', 'Lao People\'s Democratic Republic', 'LAO', 418, 856),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230),
(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL, 269),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595),
(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 70),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL, 381),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL, 670),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, 1),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263),
(240, 'RS', 'SERBIA', 'Serbia', 'SRB', 688, 381),
(241, 'AP', 'ASIA PACIFIC REGION', 'Asia / Pacific Region', '0', 0, 0),
(242, 'ME', 'MONTENEGRO', 'Montenegro', 'MNE', 499, 382),
(243, 'AX', 'ALAND ISLANDS', 'Aland Islands', 'ALA', 248, 358),
(244, 'BQ', 'BONAIRE, SINT EUSTATIUS AND SABA', 'Bonaire, Sint Eustatius and Saba', 'BES', 535, 599),
(245, 'CW', 'CURACAO', 'Curacao', 'CUW', 531, 599),
(246, 'GG', 'GUERNSEY', 'Guernsey', 'GGY', 831, 44),
(247, 'IM', 'ISLE OF MAN', 'Isle of Man', 'IMN', 833, 44),
(248, 'JE', 'JERSEY', 'Jersey', 'JEY', 832, 44),
(249, 'XK', 'KOSOVO', 'Kosovo', '---', 0, 381),
(250, 'BL', 'SAINT BARTHELEMY', 'Saint Barthelemy', 'BLM', 652, 590),
(251, 'MF', 'SAINT MARTIN', 'Saint Martin', 'MAF', 663, 590),
(252, 'SX', 'SINT MAARTEN', 'Sint Maarten', 'SXM', 534, 1),
(253, 'SS', 'SOUTH SUDAN', 'South Sudan', 'SSD', 728, 211);

-- --------------------------------------------------------

--
-- Table structure for table `dbt_cryptocoin`
--

CREATE TABLE `dbt_cryptocoin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
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
  `show_home` int(11) DEFAULT '0',
  `coin_position` int(11) DEFAULT '0',
  `premined_value` varchar(100) DEFAULT NULL,
  `total_coins_freefloat` varchar(100) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `sponsored` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dbt_cryptocoin`
--

INSERT INTO `dbt_cryptocoin` (`id`, `cid`, `user_id`, `url`, `image`, `name`, `symbol`, `decimal_value`, `coin_name`, `full_name`, `algorithm`, `proof_type`, `show_home`, `coin_position`, `premined_value`, `total_coins_freefloat`, `rank`, `sponsored`, `status`) VALUES
(1, 1, NULL, NULL, 'upload/coinlist/1659957309_3866ca14ca6b8408d706.png', NULL, 'BTC', NULL, 'Bitcoin', 'Bitcoin', NULL, 'localcoin', 1, 1, NULL, NULL, 1, '', 1),
(2, 2, NULL, NULL, 'upload/coinlist/1659957402_1159f53cc25ed8f36590.png', NULL, 'ETH', '18', 'Ethereum Token', 'Ethereum Token', NULL, 'localcoin', 1, 2, NULL, NULL, 2, '', 1),
(3, 3, NULL, NULL, 'upload/coinlist/1659957594_9ed9ae9a8e8b4cabb043.png', NULL, 'USDT', '6', 'Tether USD', 'Tether USD', NULL, 'localcoin', 1, 3, NULL, NULL, 3, '', 0),
(4, 4, NULL, NULL, 'upload/coinlist/1659957672_b482a157011f63318860.png', NULL, 'USDC', '6', 'USD Coin', 'USD Coin', NULL, 'localcoin', 1, 42, NULL, NULL, 42, '', 0),
(5, 5, NULL, NULL, 'upload/coinlist/1659957771_28ae9620b37a7b925e9f.png', NULL, 'BNB', '18', 'BNB', 'BNB', NULL, 'localcoin', 1, 4, NULL, NULL, 4, '', 0),
(6, 6, NULL, NULL, 'upload/coinlist/1659957956_d0b35d697c6909e710ae.png', NULL, 'XRP', '18', 'XRP Token', 'XRP Token', NULL, 'localcoin', 1, 6, NULL, NULL, 6, '', 1),
(7, 7, NULL, NULL, 'upload/coinlist/1659958008_4ec70d0b5195eb96ac6e.png', NULL, 'ADA', '18', 'Cardano Token', 'Cardano Token', NULL, 'localcoin', 1, 7, NULL, NULL, 7, '', 1),
(8, 8, NULL, NULL, 'upload/coinlist/1659958141_b461d7db960be0dc91a1.png', NULL, 'SOL', '18', 'Solana.com', 'Solana.com', NULL, 'localcoin', 1, 8, NULL, NULL, 8, '', 1),
(9, 9, NULL, NULL, 'upload/coinlist/1659958394_8e3e25764aab2e1e595d.png', NULL, 'DOT', '18', 'Polkadot Token', 'Polkadot Token', NULL, 'localcoin', 1, 9, NULL, NULL, 9, '', 1),
(10, 10, NULL, NULL, 'upload/coinlist/1659958463_f1ab81730074b78f90ff.png', NULL, 'DOGE', '8', 'Dogecoin', 'Dogecoin', NULL, 'localcoin', 1, 10, NULL, NULL, 10, '', 1),
(11, 11, NULL, NULL, 'upload/coinlist/1659958622_560440c584cb03656d05.png', NULL, 'AVAX', '18', 'Avalanche', 'Avalanche', NULL, 'localcoin', 1, 40, NULL, NULL, 40, '', 1),
(12, 12, NULL, NULL, 'upload/coinlist/1659958727_63978e4e2b0b9dc4fa28.png', NULL, 'MATIC', '18', 'Matic Token', 'Matic Token', NULL, 'localcoin', 1, 41, NULL, NULL, 41, '', 0),
(13, 13, NULL, NULL, 'upload/coinlist/1659958774_5da4980213a45c8114c4.png', NULL, 'DAI', '18', 'Dai Stablecoin', 'Dai Stablecoin', NULL, 'localcoin', 1, 13, NULL, NULL, 13, '', 1),
(14, 14, NULL, NULL, 'upload/coinlist/1659958854_8d8d7da2494c302047cb.png', NULL, 'SHIB', '18', 'SHIBA INU', 'SHIBA INU', NULL, 'localcoin', 1, 14, NULL, NULL, 14, '', 1),
(15, 15, NULL, NULL, 'upload/coinlist/1659958931_e195ea80cae07806b14b.png', NULL, 'SHIB', '18', 'SHIBA INU (Wormhole)', 'SHIBA INU (Wormhole)', NULL, 'localcoin', 0, 14, NULL, NULL, 14, '', 0),
(16, 16, NULL, NULL, 'upload/coinlist/1659959047_44a973f81944863ac75d.png', NULL, 'UNI', '18', 'Uniswap', 'Uniswap', NULL, 'localcoin', 1, 15, NULL, NULL, 15, '', 1),
(17, 17, NULL, NULL, 'upload/coinlist/1659959209_b1e0803e5dd21c36351e.png', NULL, 'TRX', '18', 'TRON', 'TRON', NULL, 'localcoin', 1, 16, NULL, NULL, 16, '', 1),
(18, 18, NULL, NULL, 'upload/coinlist/1659959247_e27422dce3047dcaf202.png', NULL, 'USD', NULL, 'US Dollar', 'US Dollar', NULL, 'fiat', 0, 17, NULL, NULL, 17, '', 1),
(19, 19, NULL, NULL, 'upload/coinlist/1659959352_cde84ec9b2a5ae8267d7.png', NULL, 'WBTC', '8', 'Wrapped BTC', 'Wrapped BTC', NULL, 'localcoin', 1, 44, NULL, NULL, 44, '', 1),
(20, 20, NULL, NULL, 'upload/coinlist/1659959498_c595c99129af9537d220.png', NULL, 'ETC', '18', 'Ethereum Classic', 'Ethereum Classic', NULL, 'localcoin', 1, 19, NULL, NULL, 19, '', 1),
(21, 21, NULL, NULL, 'upload/coinlist/1659959551_9a9204c77a043c20427a.png', NULL, 'LEO', '18', 'Bitfinex LEO Token', 'Bitfinex LEO Token', NULL, 'localcoin', 1, 20, NULL, NULL, 20, '', 1),
(22, 22, NULL, NULL, 'upload/coinlist/1659959680_1c1f2377d4eaa466cf0c.png', NULL, 'LTC', '18', 'Litecoin Token', 'Litecoin Token', NULL, 'localcoin', 1, 21, NULL, NULL, 21, '', 1),
(23, 23, NULL, NULL, 'upload/coinlist/1659959962_709fdafd2a6eba980e12.png', NULL, 'NEAR', '18', 'NEAR Protocol', 'NEAR Protocol', NULL, 'localcoin', 1, 22, NULL, NULL, 22, '', 1),
(24, 24, NULL, NULL, 'upload/coinlist/1659960014_7a66b9b1f4971f9ebef5.png', NULL, 'LINK', '18', 'ChainLink Token', 'ChainLink Token', NULL, 'localcoin', 1, 23, NULL, NULL, 23, '', 1),
(25, 25, NULL, NULL, 'upload/coinlist/1659960090_4df641c7a9456918973d.png', NULL, 'CRO', '8', 'CRO', 'CRO', NULL, 'localcoin', 1, 24, NULL, NULL, 24, '', 1),
(26, 26, NULL, NULL, 'upload/coinlist/1659960419_ab200b7aa7688a219264.png', NULL, 'AVATAR', '8', 'AVATAR', 'AVATAR', NULL, 'localcoin', 0, 43, NULL, NULL, 43, '', 0),
(27, 27, '1NFIHW', 'https://bscscan.com/token/images/busd_32.png', 'upload/coinlist/1660307603_1c8443050425f1276662.png', 'BUSD Token', 'BUSD', '18', 'BUSD Token', 'BUSD Token', NULL, 'localcoin', 1, 25, NULL, NULL, 25, '', 1),
(28, 28, NULL, NULL, 'upload/coinlist/1660307541_33f775a177295d383430.png', NULL, 'TIMUSD', '18', 'TrueInternetMoney-Peg TIMUSD Token', 'TrueInternetMoney-Peg TIMUSD Token', NULL, 'localcoin', 1, 26, NULL, NULL, 26, '', 1),
(29, 29, NULL, NULL, 'upload/coinlist/1660605341_55b5bd3b12c25a90324f.png', NULL, 'MANA', '18', 'Decentraland MANA', 'Decentraland MANA', NULL, 'localcoin', 1, 26, NULL, NULL, 27, '', 1),
(30, 30, NULL, NULL, 'upload/coinlist/1660606211_e15bc5907867b4c1fb44.png', NULL, 'GALA', '8', 'Gala', 'Gala', NULL, 'localcoin', 1, 26, NULL, NULL, 28, '', 1),
(31, 31, NULL, NULL, 'upload/coinlist/1660606630_c47634886f5c1492d0a6.png', NULL, 'FIL', '18', 'Filecoin', 'Filecoin', NULL, 'localcoin', 1, 26, NULL, NULL, 29, '', 1),
(32, 32, NULL, NULL, 'upload/coinlist/1660606925_449373d898be1a086ef1.png', NULL, 'EOS', '18', 'EOS Token', 'EOS Token', NULL, 'localcoin', 1, 26, NULL, NULL, 30, '', 1),
(33, 33, NULL, NULL, 'upload/coinlist/1660607780_53b7124c24cd9f454a58.png', NULL, 'SRM', '6', 'Serum', 'Serum', NULL, 'localcoin', 1, 26, NULL, NULL, 31, '', 1),
(34, 34, NULL, NULL, 'upload/coinlist/1660608136_1a9ec2d18f261696a010.png', NULL, 'CRV', '18', 'Curve DAO Token', 'Curve DAO Token', NULL, 'localcoin', 1, 26, NULL, NULL, 32, '', 1),
(35, 35, NULL, NULL, 'upload/coinlist/1660608454_94f72e250b835b397ed8.png', NULL, 'SAND', '18', 'SAND', 'SAND', NULL, 'localcoin', 1, 26, NULL, NULL, 33, '', 1),
(36, 36, NULL, NULL, 'upload/coinlist/1660609583_d6511a60c005121669cb.png', NULL, 'CHZ', '18', 'chiliZ', 'chiliZ', NULL, 'localcoin', 1, 34, NULL, NULL, 34, '', 1),
(37, 37, NULL, NULL, 'upload/coinlist/1660669095_1c3b3277a49bc3229e72.png', NULL, 'EURO', NULL, 'Euro', 'Euro', NULL, 'fiat', 0, 35, NULL, NULL, 35, '', 1),
(38, 38, NULL, NULL, 'upload/coinlist/1660669245_e2f6c0d0eddfd117f4dd.png', NULL, 'GBP', NULL, 'Great British Pound', 'Great British Pound', NULL, 'fiat', 0, 36, NULL, NULL, 36, '', 1),
(39, 39, NULL, NULL, 'upload/coinlist/1660670059_46b248acfb579e471dbb.jpg', NULL, 'CAD', NULL, 'Canadian Doller', 'Canadian Doller', NULL, 'fiat', 1, 37, NULL, NULL, 37, '', 1),
(40, 40, NULL, NULL, 'upload/coinlist/1660669706_66e8fd82380d62f0c16e.png', NULL, 'AUD', NULL, 'Australian Doller', 'Australian Doller', NULL, 'fiat', 0, 38, NULL, NULL, 38, '', 1),
(41, 41, NULL, NULL, 'upload/coinlist/1660692927_02000f7b0d4eccdd5e6f.png', NULL, 'WBNB', '18', 'Wrapped BNB', 'Wrapped BNB BEP20', NULL, 'localcoin', 0, 39, NULL, NULL, 39, '', 1),
(42, 42, NULL, NULL, 'upload/coinlist/1660693215_24f1194b6aa0218b8eff.png', NULL, 'AVAX', '18', 'Avalanche', 'Avalanche', NULL, 'localcoin', 0, 40, NULL, NULL, 40, '', 1),
(43, 43, NULL, NULL, 'upload/coinlist/1660693450_dc048b7c4b1be4fb779f.png', NULL, 'MATIC', '18', 'Matic Token', 'Matic Token', NULL, 'localcoin', 0, 41, NULL, NULL, 41, '', 1),
(44, 44, NULL, NULL, 'upload/coinlist/1660693739_32ca10594c00188118b4.png', NULL, 'USDT', '18', 'Tether USD', 'Tether USD', NULL, 'localcoin', 0, 3, NULL, NULL, 3, '', 0),
(45, 45, NULL, NULL, 'upload/coinlist/1660693910_245585cb7337e2c7c888.png', NULL, 'USDC', '18', 'USD Coin', 'USD Coin', NULL, 'localcoin', 0, 42, NULL, NULL, 42, '', 1);
-- --------------------------------------------------------

--
-- Table structure for table `dbt_deposit`
--

CREATE TABLE `dbt_deposit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stripe_session_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(100) NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Table structure for table `dbt_fees`
--

CREATE TABLE `dbt_fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(100) NOT NULL,
  `fees` double NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------
--
-- Table structure for table `dbt_market`
--

CREATE TABLE `dbt_market` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `full_name` varchar(300) NOT NULL,
  `symbol` varchar(50) NOT NULL,
  `market_type` varchar(55) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dbt_market`
--
INSERT INTO `dbt_market` (`id`, `name`, `full_name`, `symbol`, `status`) VALUES
(1, 'BTC', 'BTC Market', 'BTC', 1),
(2, 'USD', 'USDT Market', 'USD', 1),
(3, 'LTC', 'LTC Market', 'LTC', 1),
(4, 'Doge', 'Dogecoin Market', 'DOGE', 1);

-- --------------------------------------------------------

--
-- Table structure for table `dbt_network_type`
--

CREATE TABLE `dbt_network_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `heading` varchar(50) DEFAULT NULL,
  `identifire` varchar(50) NOT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dbt_network_type`
--

INSERT INTO `dbt_network_type` (`id`, `heading`, `identifire`, `slug`, `status`) VALUES
(1, 'Local Coin', 'localcoin', 'cointype', 1),
(4, 'Crypto Deposit', 'crypto_deposit', 'deposit_type', 1),
(5, 'Fiat Deposit', 'fiat_deposit', 'deposit_type', 1),
(9, 'Crypto Currency', 'crypto_currency', 'withdraw_type', 1),
(10, 'Fiat Currency', 'fiat_currency', 'withdraw_type', 1),
(11, 'Fiat Currency', 'fiat', 'cointype', 1);

-- --------------------------------------------------------

--
-- Table structure for table `dbt_payout_method`
--

CREATE TABLE `dbt_payout_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(250) NOT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `method` varchar(250) NOT NULL,
  `wallet_id` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dbt_security`
--

CREATE TABLE `dbt_security` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(20) NOT NULL,
  `data` mediumtext NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dbt_security`
--

INSERT INTO `dbt_security` (`id`, `keyword`, `data`, `status`) VALUES
(1, 'url', '{\"url\":\"http:\\/\\/localhost\\/tradebox_ci4_final_test\\/\"}', 0),
(2, 'login', '{\"duration\":\"30\",\"wrong_try\":\"3\",\"ip_block\":\"3\"}', 0),
(3, 'https', '{\"cookie_secure\":0,\"cookie_http\":0}', 0),
(4, 'xss_filter', '', 0),
(5, 'csrf_token', '', 1),
(6, 'capture', '{\"site_key\":\"6Lddh0AUAAAAAJm25vFsAOOG0Hixa1ZVg17jQ9ca\",\"secret_key\":\"6Lddh0AUAAAAAHNQXul04PdL7ponU4N9QiKywGt-\"}', 0),
(7, 'sms', '', 0),
(8, 'encryption', '', 0),
(9, 'password', '', 0),
(10, 'email', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `dbt_sms_email_template`
--

CREATE TABLE `dbt_sms_email_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sms_or_email` varchar(10) NOT NULL,
  `template_name` varchar(50) NOT NULL,
  `subject_en` text NOT NULL,
  `subject_fr` text NOT NULL,
  `template_en` text NOT NULL,
  `template_fr` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dbt_sms_email_template`
--

INSERT INTO `dbt_sms_email_template` (`id`, `sms_or_email`, `template_name`, `subject_en`, `subject_fr`, `template_en`, `template_fr`) VALUES
(1, 'sms', 'transfer_verification', 'Transfer Verification Code', 'Code de vérification de transfert', 'Welcome to Tradebox\r\nYou are about to transfer %amount% to the account %receiver_id%\r\nYour code is: %code%', 'Bienvenue à la Tradebox \r\nVous êtes sur le point de transférer %amount% au compte %receiver_id%\r\nVotre code est: %code%'),
(2, 'email', 'transfer_verification', 'Transfer Verification', 'Vérification du transfert', 'Welcome to Tradebox\r\nYou are about to transfer %amount% to the account %receiver_id%\r\nYour code is: %varify_code%', 'Bienvenue à la Tradebox\r\nVous êtes sur le point de transférer %amount% au compte %receiver_id%\r\nVotre code est: %varify_code%'),
(3, 'sms', 'transfer_success', 'Confirm Transfer', 'Confirmer le transfert', 'Welcome to Tradebox\r\nYou have successfully transferred the amount $%amount% to the account %receiver_id%.\r\nYour new balance is %new_balance%', 'Bienvenue à la Tradebox\r\nVous avez transféré le montant avec succès $%amount% au compte %receiver_id%.\r\nVotre nouveau solde est %new_balance%'),
(4, 'email', 'transfer_success', 'Confirm Transfer', 'Confirmer le transfert', 'Welcome to Tradebox\r\nYou have successfully transferred the amount $%amount% to the account %receiver_id%.\r\nYour new balance is %new_balance%', 'Bienvenue à la Tradebox\r\nVous avez transféré avec succès le montant $%amount% au compte %receiver_id%.\r\nVotre nouveau solde est %new_balance%'),
(5, 'sms', 'withdraw_verification', 'Verifying Withdrawal', 'Vérification du retrait', 'Welcome to Tradebox  \r\nYou are about to withdraw the amount: %amount%\r\nVerification code: %varify_code%', 'Bienvenue à la Tradebox  \r\nVous êtes sur le point de retirer le montant: %amount%\r\nLe code de vérification %varify_code%'),
(6, 'email', 'withdraw_verification', 'Verifying Withdrawal', 'Vérification du retrait', 'Welcome to Tradebox  \r\nYou are about to withdraw the amount: %amount%\r\nVerification code: %varify_code%', 'Bienvenue à la Tradebox  \r\nVous êtes sur le point de retirer le montant: %amount%\r\nLe code de vérification %varify_code%'),
(7, 'sms', 'withdraw_success', 'Withdraw Successful', 'Retrait réussi', 'Welcome to Tradebox\r\nHi, %name% You have successfully withdrawn the amount $%amount% from your account.\r\nYour new balance is $%new_balance%', 'Bienvenue à la Tradebox\r\nSalut, %name% Vous avez retiré avec succès le montant $%amount% depuis votre compte.\r\nVotre nouveau solde est $%new_balance%'),
(8, 'email', 'withdraw_success', 'Withdraw Successful', 'Retrait réussi', 'Welcome to Tradebox\r\nHi, %name% You have successfully withdrawn the amount $%amount% from your account.\r\nYour new balance is $%new_balance%', 'Bienvenue à la Tradebox\r\nSalut, %name% Vous avez retiré avec succès le montant $%amount% depuis votre compte.\r\nVotre nouveau solde est $%new_balance%'),
(9, 'email', 'forgot_password', 'Reset Password', 'Réinitialiser le mot de passe', 'Welcome to Tradebox\r\nTo reset your password, please enter the verification code given below:\r\nVerification Code: %varify_code%\r\n\r\nIf you did not request to reset your password, please contact us with full details at support@trueinternetmoney.com', 'Bienvenue à la Tradebox\r\nPour réinitialiser votre mot de passe, veuillez entrer le code de vérification indiqué ci-dessous:\r\nLe code de vérification %varify_code%\r\n\r\nSi vous n&#39;avez pas demandé la réinitialisation de votre mot de passe, veuillez nous contacter avec tous les détails \r\nà support@trueinternetmoney.com'),
(10, 'sms', 'deposit_success', 'Deposit Successful', 'Dépôt réussi', 'Welcome to Tradebox\r\nHi, %name%\r\nYou have successfully deposited the amount %amount% at date %date%', 'Bienvenue à Tradebox\r\nSalut, %name%\r\nVous avez déposé le montant avec succès %amount% à ce jour %date%'),
(11, 'email', 'deposit_success', 'Deposit Successful', 'Dépôt réussi', 'Welcome to Tradebox\r\nHi, %name%\r\nYou have successfully deposited the amount %amount% at date %date%', 'Bienvenue à la Tradebox\r\nSalut, %name%\r\nVous avez déposé le montant avec succès %amount% à ce jour %date%'),
(12, 'email', 'registered', 'Welcome to Tradebox Account Activation', 'Account Activation', 'Welcome to Tradebox. <br/>\r\nYour account was created successfully Please click on the link below to activate your account.<br/>\r\n %url%\r\n<br/><br/>\r\nAfter verifying, please log in and click on: <br/>\r\n1. Account - Profile. Please enter all your details<br/>\r\n2. Account - Bank setup. Please enter all your details<br/>\r\n3. Account - Payout Setup. Please enter all your details<br/>\r\n4. In Profile, click on Verify Account, enter details the click on Submit\r\n', 'Bienvenue sur Tradebox.<br/>\r\nVotre compte a été créé avec succès Veuillez cliquer sur le lien ci-dessous pour activer votre compte.<br/>\r\n  %url%\r\n<br/><br/>\r\nAprès vérification, connectez-vous et cliquez sur :<br/>\r\n1. Compte - Profil. Veuillez saisir toutes vos coordonnées<br/>\r\n2. Compte - Configuration de la banque. Veuillez saisir toutes vos coordonnées<br/>\r\n3. Compte - Configuration du paiement. Veuillez saisir toutes vos coordonnées<br/>\r\n4. Dans Profil, cliquez sur Vérifier le compte, entrez les détails puis cliquez sur Soumettre\r\n'),
(13, 'sms', 'profile_verification', 'Verify Phone Number', 'Vérifier le numéro de téléphone', 'Welcome to Tradebox\r\nYou are about to verify your phone number.\r\nYour Verification Code %varify_code%', 'Bienvenue à la Tradebox\r\nVous êtes sur le point de vérifier votre numéro de téléphone.\r\nLe code de vérification: %varify_code%'),
(14, 'email', 'profile_verification', 'Verify Email Address', 'Vérifier l&#39;adresse e-mail', 'Welcome to Tradebox\r\nYou are about to verify your email address.\r\nVerification Code: %varify_code%', 'Bienvenue à la Tradebox\r\nVous êtes sur le point de vérifier votre adresse e-mail.\r\nLe code de vérification: %varify_code%'),
(15, 'email', 'kyc_verify_success', 'Kyc verify success', 'Kyc vérifie le succès', 'Thank you for verifying! Hi, %name% You are now our verified customer.', 'Merci d&#39;avoir vérifié! Salut, %name% Vous êtes maintenant notre client vérifié.'),
(16, 'email', 'kyc_verify_cancel', 'KYC Verification Cancelled', 'KYC Vérification Annulée', 'Sorry! Your document is not appropriate.\r\nHello, %name% please resend your original document.', 'Merci pour vos vérifications.\r\nSalut, %name% Vous êtes maintenant notre client vérifié.'),
(17, 'email', 'kyc_verify_success', 'Kyc verify success', 'Kyc vérifie le succès', 'Thank you for your verifications. Hi, %name% You are now our verified customer.', 'Merci pour vos vérifications. Salut, %name% Vous êtes maintenant notre client vérifié.'),
(18, 'email', 'kyc_verify_cancel', 'KYC verify cancel', 'KYC vérifier annuler', 'Pardon! Votre document n\'est pas approprié. Bonjour, %name% veuillez renvoyer votre document original.', 'Merci pour vos vérifications. Salut, %name% Vous êtes maintenant notre client vérifié.');

-- --------------------------------------------------------

--
-- Table structure for table `dbt_theme`
--

CREATE TABLE `dbt_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,  
  `settings` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dbt_theme`
--

INSERT INTO `dbt_theme` (`id`, `settings`, `status`) VALUES
(1, '{\"body_background_color\":\"#060d13\",\"body_font_color\":\"#cdcfd0\",\"menu_bg_color\":\"#000000\",\"menu_font_color\":\"#cdcfd0\",\"footer_bg_color\":\"#202124\",\"footer_font_color\":\"#cdcfd0\",\"btn_bg_color\":\"#147100\",\"btn_font_color\":\"#cdcfd0\",\"top_footer_horizontal_border_color\":\"#202124\",\"footer_menu_border_color\":\"#202124\",\"bottom_footer_background_color\":\"#202124\",\"bottom_footer_font_color\":\"#cdcfd0\",\"theme_color\":\"#a1a7ad\",\"newslatter_bg\":\"#202124\",\"newslatter_font\":\"#939699\",\"form_background_color\":\"#0d0d0d\",\"form_border_color\":\"#262d34\",\"form_label_color\":\"#cdcfd0\",\"form_input_field_background_color\":\"#121d27\",\"input_field_border_color\":\"#262d34\",\"input_field_color\":\"#cdcfd0\"}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `dbt_transaction_setup`
--

CREATE TABLE `dbt_transaction_setup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,  `trntype` varchar(20) NOT NULL,
  `acctype` varchar(20) NOT NULL,
  `currency_symbol` varchar(20) NOT NULL,
  `network_type` varchar(50) DEFAULT NULL,
  `lower` double(19,8) NOT NULL,
  `upper` double(19,8) NOT NULL,
  `duration` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dbt_transfer`
--

CREATE TABLE `dbt_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,  `sender_user_id` varchar(255) DEFAULT NULL,
  `receiver_user_id` varchar(255) DEFAULT NULL,
  `amount` double(19,8) DEFAULT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `fees` double(19,8) NOT NULL,
  `request_ip` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `comments` longtext,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='client to client transfer success, request data recorded.';

-- --------------------------------------------------------

--
-- Table structure for table `dbt_user`
--

CREATE TABLE `dbt_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,  `user_id` varchar(100) NOT NULL,
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
  `verified` int(11) NOT NULL DEFAULT '0' COMMENT '0= did not submit info, 1= All verified, 2=Cancel, 3=processing, 4 = Only KYC Verified, 5 = Only Mobile Verified, 6 = Only Email Verified, 7 = KYC and Mobile Verified, 8 = KYC Email Verified, 9 = Email and Mobile  Verified, 10 = KYC Cancel and Phone  Verified, 11 = KYC Cancel and Email Verified, 12 = KYC processing and  Mobile  Verified, 13 = KYC processing and Email Verified, 14 = KYC Cancel and  Mobile not Verified, 15 = KYC Cancel and Email not Verified, 16 = KYC processing  and Mobile not Verified, 19 = KYC processing and Email not Verified, ',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_date` datetime DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dbt_user_log`
--

CREATE TABLE `dbt_user_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,  
  `log_type` varchar(50) NOT NULL COMMENT '"acc_update = User Account Update, login=User Login info, deposit=User Deposit info, transfer=User Transfer info, withdraw=User Withdraw info, open_order="',
  `access_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_agent` varchar(300) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `ip` varchar(50) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Table structure for table `dbt_user_verify_doc`
--

CREATE TABLE `dbt_user_verify_doc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL ,  
  `verify_type` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `id_number` varchar(300) NOT NULL,
  `document1` varchar(300) NOT NULL,
  `document2` varchar(300) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dbt_verify`
--

CREATE TABLE `dbt_verify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,  
  `ip_address` varchar(250) DEFAULT NULL,
  `session_id` varchar(250) DEFAULT NULL,
  `verify_code` varchar(250) DEFAULT NULL,
  `user_id` varchar(250) DEFAULT NULL,
  `data` text,
  `verify_type` varchar(10) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `dbt_withdraw`
--

CREATE TABLE `dbt_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,  
  `user_id` varchar(100) NOT NULL,
  `wallet_id` mediumtext NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `earnings`
--

CREATE TABLE `earnings` (
  `earning_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(250) NOT NULL,
  `Purchaser_id` varchar(250) DEFAULT NULL,
  `earning_type` varchar(45) NOT NULL,
  `package_id` varchar(250) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `date` varchar(45) NOT NULL,
  `amount` varchar(45) NOT NULL,
  `comments` longtext,
  PRIMARY KEY (`earning_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Weekly ROI, Monthly ROI, team bonous, direct referal bonous';

-- --------------------------------------------------------

--
-- Table structure for table `email_sms_gateway`
--

CREATE TABLE `email_sms_gateway` (
  `es_id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_sms_gateway`
--

INSERT INTO `email_sms_gateway` (`es_id`, `gatewayname`, `title`, `protocol`, `host`, `port`, `user`, `userid`, `password`, `sid`, `token`, `number`, `mailtype`, `charset`, `api`) VALUES
(1, 'nexmo', 'BDTASK LIMITED', NULL, NULL, NULL, NULL, NULL, 'TCtz6dx6s3G4nVQ1', NULL, NULL, NULL, NULL, NULL, '633b7084'),
(2, 'smtp', 'Bbtask mail', 'smtp', 'smtp.mailtrap.io', '2525', '199a525b4e1f88', '', '06f4bb0c453f48', NULL, NULL, NULL, 'html', 'utf-8', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `external_api_setup`
--

CREATE TABLE `external_api_setup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `data` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `external_api_setup`
--

INSERT INTO `external_api_setup` (`id`, `name`, `data`, `status`) VALUES
(1, 'coinmarketcap', '{\"api_key\":\"5cffd167-16c3-4c34-b345-6eef830ce5a3\", \"create_link\":\"https://coinmarketcap.com/api\"}', 1),
(2, 'maps', '{\"api_key\":\"AIzaSyAUmj7I0GuGJWRcol-pMUmM4rrnHS90DE8\", \"create_link\":\"https://developers.google.com/maps/documentation/javascript/get-api-key\"}', 1),
(3, 'Cryptocompare', '{\"api_key\":\"61278343e480f5e40fffe307177e37e4339c4b2016ebd0c72d0b15386737ab0e\",\"create_link\":\"https:\\/\\/www.cryptocompare.com\"}', 1),
(4, 'Free Currency Converter', '{\"api_key\":\"1ef69640753e1a57f651\",\"create_link\":\"https:www.currencyconverterapi.com\"}', 1);
-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `phrase` text NOT NULL,
  `english` text,
  `french` text,
  `arabic` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES
(NULL, 'creator_wallet', 'Creator Wallet Address', 'Creator Wallet Address fr', 'عنوان محفظة المنشئ'),
(NULL, 'contact_address', 'Contract Address', 'Contract Address fr', 'عنوان العقد'),
(NULL, 'email', 'Email', 'E-mail', 'البريد الإلكتروني'),
(NULL, 'password', 'Password', 'Mot De Passe', 'كلمة المرور'),
(NULL, 'login', 'Login', 'S\'identifier', 'تسجيل الدخول'),
(NULL, 'incorrect_email_password', 'Incorrect Email/Password!', 'Mot de passe ou email incorrect', 'البريد الإلكتروني / كلمة المرور غير صحيحة!'),
(NULL, 'user_role', 'User Role', 'RÃ´le Utilisateur', 'دور المستخدم'),
(NULL, 'please_login', 'Please Login', 'Veuillez Vous Connecter', 'الرجاء تسجيل الدخول'),
(NULL, 'setting', 'Setting', 'Réglage', 'ضبط'),
(NULL, 'profile', 'Profile', 'Profil', 'الملف الشخصي'),
(NULL, 'logout', 'Log Out', 'DÃ©connexion', 'تسجيل خروج'),
(NULL, 'please_try_again', 'Please Try Again', 'Essayez encore !', 'حاول مرة اخرى'),
(NULL, 'admin', 'Admin', 'Admin', 'مسؤل'),
(NULL, 'dashboard', 'Dashboard', 'Tableau de Bord', 'لوحة القيادة'),
(NULL, 'language_setting', 'Language Setting', 'Reglage Langue', 'إعدادات اللغة'),
(NULL, 'status', 'Status', 'Status', 'حالة'),
(NULL, 'active', 'Active', 'Actif', 'نشيط'),
(NULL, 'inactive', 'Inactive', 'Inactif', 'غير نشط'),
(NULL, 'cancel', 'Cancel', 'Cancel', 'يلغي'),
(NULL, 'save', 'Save', 'Sauver', 'يحفظ'),
(NULL, 'serial', 'Serial', 'En Série', 'مسلسل'),
(NULL, 'action', 'Action', 'Action', 'عمل'),
(NULL, 'edit', 'Edit ', 'Editer', 'يحرر'),
(NULL, 'delete', 'Delete', 'Effacer', 'حذف'),
(NULL, 'save_successfully', 'Save Successfully!', 'Sauvegarde reussi', 'حفظ بنجاح!'),
(NULL, 'update_successfully', 'Updated Successfully', 'Mise Ã  jour reussi', 'تم التحديث بنجاح'),
(NULL, 'delete_successfully', 'Delete Successfully', 'Supprimer Avec Succès', 'تم الحذف بنجاح'),
(NULL, 'are_you_sure', 'Are You Sure', 'êtes-vous Sûr', 'هل أنت واثق'),
(NULL, 'ip_address', 'IP Address', 'Adresse IP', 'عنوان IP'),
(NULL, 'application_title', 'Application title', 'Titre appli', 'عنوان التطبيق'),
(NULL, 'favicon', 'Favicon', 'favicon', 'فافيكون'),
(NULL, 'logo', 'Logo', 'Logo', 'شعار'),
(NULL, 'footer_text', 'Footer text', 'Footer text', 'نص التذييل'),
(NULL, 'language', 'Language', 'Langue', 'لغة'),
(NULL, 'website_title', 'Website Title', 'Titre site web', 'عنوان الموقع'),
(NULL, 'invalid_logo', 'Invalid Logo', 'Logo invalide', 'شعار غير صالح'),
(NULL, 'submit_successfully', 'Submit Successfully!', 'Envoi reussi', 'أرسل بنجاح!'),
(NULL, 'application_setting', 'Application Setting', 'Reglages appli', 'اعدادات التطبيق'),
(NULL, 'invalid_favicon', 'Invalid Favicon', 'Favicon Invalide', 'رمز مفضل غير صالح'),
(NULL, 'submit', 'Submit', 'Envoyez', 'يُقدِّم'),
(NULL, 'site_align', 'Website Align', 'Alignement site', 'محاذاة الموقع'),
(NULL, 'right_to_left', 'Right to Left', 'Doite vers la gauche', 'من اليمين الى اليسار'),
(NULL, 'left_to_right', 'Left to Right', 'Gauche Vers la droite', 'من اليسار إلى اليمين'),
(NULL, 'subject', 'Subject', 'Sujet', 'موضوعات'),
(NULL, 'receiver_name', 'Send To', 'Nom BÃ©nÃ©ficiaire', 'ارسل إلى'),
(NULL, 'select_user', 'Select User', 'Selectionner Utilisateur', 'اختر المستخدم'),
(NULL, 'message_sent', 'Messages Sent', 'Message EnvoyÃ©', 'الرسائل المرسلة'),
(NULL, 'mail', 'Mail', 'Mail', 'بريد'),
(NULL, 'send_mail', 'Send Mail', 'Envoyer Mail', 'ارسل بريد'),
(NULL, 'mail_setting', 'Mail Setting', 'Reglage mail', 'إعداد البريد'),
(NULL, 'protocol', 'Protocol', 'Protocole', 'بروتوكول'),
(NULL, 'mailpath', 'Mail Path', 'Repertoire Mail', 'مسار البريد'),
(NULL, 'mailtype', 'Mail Type', 'Type mail', 'نوع البريد'),
(NULL, 'validate_email', 'Validate Email Address', 'Validez votre Email', 'التحقق من صحة عنوان البريد الإلكتروني'),
(NULL, 'true', 'True', 'Vraie', 'حقيقي'),
(NULL, 'false', 'False', 'faux', 'خطأ شنيع'),
(NULL, 'attach_file', 'Attach File', 'Joindre un document', 'أرفق ملف'),
(NULL, 'wordwrap', 'Enable Word Wrap', 'Wordwrap', 'تفعيل التفاف الكلمات'),
(NULL, 'send', 'Send', 'Envoyer', 'إرسال'),
(NULL, 'app_setting', 'App Setting', 'Reglages appli', 'إعداد التطبيق'),
(NULL, 'sms', 'SMS', 'SMS', 'رسالة قصيرة'),
(NULL, 'gateway_setting', 'Gateway Setting', 'Reglage portail', 'إعداد البوابة'),
(NULL, 'time_zone', 'Time zone', 'Time Zone', 'وحدة زمنية'),
(NULL, 'provider', 'Provider', 'Fournisseur', 'مزود'),
(NULL, 'sms_template', 'SMS Template', 'Template SMS', 'قالب SMS'),
(NULL, 'template_name', 'Template Name', 'Nom du template', 'اسم القالب'),
(NULL, 'sms_schedule', 'SMS Schedule', 'Emploi du temps SMS', 'جدول الرسائل القصيرة'),
(NULL, 'schedule_name', 'Schedule Name', 'Nom d\'horaire', 'اسم الجدول'),
(NULL, 'time', 'Time', 'Temps', 'زمن'),
(NULL, 'already_exists', 'Already Exists', 'Existe dÃ©jÃ ', 'موجود أصلا'),
(NULL, 'send_custom_sms', 'Send Custom SMS', 'Envoyer SMS personalisÃ©', 'إرسال رسائل SMS مخصصة'),
(NULL, 'sms_sent', 'SMS Sent!', 'SMS envoyÃ©', 'تم إرسال الرسائل القصيرة!'),
(NULL, 'custom_sms_list', 'Custom SMS List', 'List SMS personalisÃ©', 'قائمة الرسائل القصيرة المخصصة'),
(NULL, 'reciver', 'Reciver', 'BÃ©nÃ©ficiaire', 'المتلقي'),
(NULL, 'auto_sms_report', 'Auto SMS Report', 'Rapport SMS Auto', 'تقرير الرسائل القصيرة التلقائي'),
(NULL, 'user_sms_list', 'User SMS List', 'Liste SMS utilisateurs', 'قائمة رسائل SMS للمستخدم'),
(NULL, 'send_sms', 'Send SMS', 'Envoyer SMS', 'أرسل رسالة نصية قصيرة'),
(NULL, 'new_sms', 'New SMS', 'Nouveau Message', 'رسائل SMS جديدة'),
(NULL, 'update', 'Update', 'Mettre à Jour', 'تحديث'),
(NULL, 'reset', 'Reset', 'Réinitialiser', 'إعادة ضبط'),
(NULL, 'messages', 'Messages', 'Messages', 'رسائل'),
(NULL, 'inbox', 'Inbox', 'Boite de rÃ©ception', 'صندوق الوارد'),
(NULL, 'sent', 'Sent', 'EnvoyÃ©', 'أرسلت'),
(NULL, 'captcha', 'Captcha', 'Captcha', 'كلمة التحقق'),
(NULL, 'welcome_back', 'Welcome back ', 'Bienvenue Ã  nouveau !', 'مرحبًا بعودتك'),
(NULL, 'inbox_message', 'Inbox Message', 'SMS Boite de rÃ©ception', 'رسالة البريد الوارد'),
(NULL, 'image_upload_successfully', 'Image Upload Successfully.', 'Upload d\'image reussi', 'تم تحميل الصورة بنجاح.'),
(NULL, 'users', 'Users', 'Utilisateurs', 'المستخدمون'),
(NULL, 'add_user', 'Add User', 'Ajouter utilisateur', 'إضافة مستخدم'),
(NULL, 'user_list', 'User List', 'Liste Utilisateurs', 'قائمة المستخدم'),
(NULL, 'firstname', 'First Name', 'Nom', 'الاسم الاول'),
(NULL, 'lastname', 'Last Name', 'PrÃ©noms', 'الكنية'),
(NULL, 'about', 'About', 'A propos de nous', 'حول'),
(NULL, 'preview', 'Preview', 'Visualliser', 'معاينة'),
(NULL, 'last_login', 'Last Login', 'Dernière Connexion', 'آخر تسجيل دخول'),
(NULL, 'last_logout', 'Last Logout', 'Dernière Déconnexion', 'آخر خروج'),
(NULL, 'image', 'Image', 'Image', 'صورة'),
(NULL, 'fullname', 'Full Name', 'Nom Complet', 'الاسم الكامل'),
(NULL, 'new_message', 'New Message', 'Nouveau Message', 'رسالة جديدة'),
(NULL, 'message', 'Message', 'Un Message', 'رسالة'),
(NULL, 'sender_name', 'Sender Name', 'Nom de l&#39;expÃ©diteur', 'اسم المرسل'),
(NULL, 'sl_no', 'SL No.', 'NumÃ©ro SL', 'SL. لا.'),
(NULL, 'message_details', 'Message Details', 'DÃ©tails message', 'تفاصيل الرسالة'),
(NULL, 'date', 'Date', 'Date', 'تاريخ'),
(NULL, 'select_option', 'Select Option', 'Sélectionner une option', 'حدد خيار'),
(NULL, 'edit_profile', 'Edit Profile', 'Editer Profile', 'تعديل الملف الشخصي'),
(NULL, 'edit_user', 'Edit User', 'Editer utilisateur', 'تحرير العضو'),
(NULL, 'sent_message', 'Sent Message', 'Message EnvoyÃ©', 'الرسالة المرسلة'),
(NULL, 'sub_admin', 'Sub Admin', 'Sub Administrateur', 'المسؤول الفرعي'),
(NULL, 'admin_list', 'Admin List', 'List Administrateurs', 'قائمة المسؤول'),
(NULL, 'add_admin', 'Add Admin', 'Ajouter Administrateur', 'إضافة المسؤول'),
(NULL, 'edit_admin', 'Edit Admin', 'Modifier L&#39;administrateur', 'تحرير المسؤول'),
(NULL, 'username', 'Username', 'Nom utilisateur', 'اسم المستخدم'),
(NULL, 'sponsor_id', 'Sponsor ID', 'ID sponsor', 'هوية الكفيل'),
(NULL, 'mobile', 'Mobile', 'Mobile', 'التليفون المحمول'),
(NULL, 'register', 'Register', 'Enregistrer', 'يسجل'),
(NULL, 'conf_password', 'Confirm Password', 'Reglage mot de passe', 'تأكيد كلمة المرور'),
(NULL, 'user_id', 'User ID', 'ID utilisateur', 'معرف المستخدم'),
(NULL, 'package', 'Package', 'Pack', 'طَرد'),
(NULL, 'create', 'Create', 'CrÃ©er', 'خلق'),
(NULL, 'package_name', 'Package Name', 'Nom du pack', 'اسم الحزمة'),
(NULL, 'package_deatils', 'Package Deatils', 'Detail pack', 'حزمة من التفاصيل'),
(NULL, 'package_amount', 'Package Amount', 'Montant pack', 'مبلغ العبوة'),
(NULL, 'daily_roi', 'Daily ROI', 'ROI journalier', 'عائد الاستثمار اليومي'),
(NULL, 'weekly_roi', 'Weekly ROI', 'ROI Hebdomadaire', 'عائد الاستثمار الأسبوعي'),
(NULL, 'monthly_roi', 'Monthly ROI', 'ROI Mensuel', 'عائد الاستثمار الشهري'),
(NULL, 'yearly_roi', 'Yearly ROI', 'ROI annuel', 'عائد الاستثمار السنوي'),
(NULL, 'total_percent', 'Total Percent', 'Poucentage Total', 'إجمالي النسبة المئوية'),
(NULL, 'add_package', 'Add Package', 'Ajouter un Pack', 'أضف الحزمة'),
(NULL, 'transfer_add_msg', 'Transfer Successfully', 'Ajouter SMS transfert', 'تم التحويل بنجاح'),
(NULL, 'transfer', 'Transfer', 'Transfert', 'تحويل'),
(NULL, 'deposit', 'Deposit', 'Dépôt', 'إيداع'),
(NULL, 'edit_package', 'Edit Package', 'Editer Pack', 'تحرير الحزمة'),
(NULL, 'package_list', 'Package List', 'Liste Packs', 'قائمة العبوة'),
(NULL, 'withdraw', 'Withdraw', 'Se Désister', 'ينسحب'),
(NULL, 'request', 'Request', 'RequÃªte', 'طلب'),
(NULL, 'success', 'Success', 'SuccÃ¨s ! ', 'النجاح'),
(NULL, 'request_date', 'Request Date', 'Date RequÃªte', 'تاريخ الطلب'),
(NULL, 'payment_method', 'Payment Method', 'Methode de paiement', 'طريقة الدفع او السداد'),
(NULL, 'amount', 'Amount', 'f', 'مقدار'),
(NULL, 'charge', 'Charge', 'Frais', 'تكلفة'),
(NULL, 'total', 'Total', 'Total', 'المجموع'),
(NULL, 'comments', 'Comments', 'Commentaires', 'تعليقات'),
(NULL, 'pending', 'Pending', 'En cours', 'قيد الانتظار'),
(NULL, 'cancel_date', 'Cancel Date', 'Annuler date', 'تاريخ الإلغاء'),
(NULL, 'block_list', 'Block List', 'Liste Noire', 'قائمة الحظر'),
(NULL, 'commission', 'Commission', 'Commission', 'عمولة'),
(NULL, 'setup', 'Setup', 'Regler', 'اقامة'),
(NULL, 'setup_list', 'Setup List', 'Liste de reglage', 'قائمة الإعداد'),
(NULL, 'commission_list', 'Commission List', 'Liste Commission', 'قائمة العمولات'),
(NULL, 'level_name', 'Level Name', 'Nom du stage', 'اسم المستوى'),
(NULL, 'personal_invest', 'Personal Invest', 'Mon investissement', 'الاستثمار الشخصي'),
(NULL, 'total_invest', 'Total Invest', 'Total Investissement', 'إجمالي الاستثمار'),
(NULL, 'team_bonous', 'Team Bonous', 'Bonus d\'Equipe', 'مكافأة الفريق'),
(NULL, 'referral_bonous', 'Referral Bonous', 'Bonus parrainage', 'مكافأة الإحالة'),
(NULL, 'form_submit_msg', 'Insert Successfully', 'Envoyer formulaire', 'تم الإدراج بنجاح'),
(NULL, 'transection_category', 'Transaction Category', 'CatÃ©gorie Transaction', 'فئة المعاملة'),
(NULL, 'add_deposit', 'Add Deposit', 'Effectuer un Depot', 'إضافة الإيداع'),
(NULL, 'deposit_list', 'Deposit List', 'Liste depot', 'قائمة الودائع'),
(NULL, 'team', 'Team', 'Equipe', 'فريق'),
(NULL, 'investment', 'Investment', 'Investissement personnel', 'استثمار'),
(NULL, 'notification', 'Notification', 'Notification', 'تنبيه'),
(NULL, 'receiver_id', 'Receiver Id', 'ID BÃ©nÃ©ficiaire', 'معرف المتلقي'),
(NULL, 'comment', 'Comments', 'Commentaire', 'تعليقات'),
(NULL, 'otp_send_to', 'OTP Send To', 'OTP envoyer Ã ', 'OTP أرسل إلى'),
(NULL, 'transection', 'Transaction', 'Transactions', 'عملية'),
(NULL, 'buy', 'Buy', 'Acheter', 'يشتري'),
(NULL, 'deposit_amount', 'Deposit Amount', 'Montant Depot', 'قيمة الايداع'),
(NULL, 'deposit_method', 'Deposit Method', 'Methode depot', 'طريقة الإيداع'),
(NULL, 'deposit_wallet_id', 'Deposit Wallet Id', 'Wallet ID', 'معرّف محفظة الإيداع'),
(NULL, 'confirm_transfer', 'Confirm Transfer', 'Confirmer transfert', 'تأكيد التحويل'),
(NULL, 'transfer_amount', 'Transfer Amount', 'Montant Transfert', 'مبلغ التحويل'),
(NULL, 'enter_verify_code', 'Enter Verify Code', 'Entrer code de vÃ©rification', 'أدخل رمز التحقق'),
(NULL, 'confirm', 'Confirm', 'Confirmer', 'يتأكد'),
(NULL, 'deopsit_add_msg', 'Deposit Add Successfully.', 'Depot effectuÃ© avec succÃ¨s', 'تمت إضافة الإيداع بنجاح.'),
(NULL, 'transfar_recite', 'Transfer Recite', 'ReÃ§u de transfert', 'تلاوة التحويل'),
(NULL, 'earn', 'Earn', 'Gagner', 'يكسب'),
(NULL, 'balance_is_unavailable', 'Balance Unavailable', 'Solde insuffisant', 'الرصيد غير متوفر'),
(NULL, 'package_buy_successfully', 'Package Buy Successfully!', 'Achat du package reussi ! ', 'تم شراء العبوة بنجاح!'),
(NULL, 'withdraw_recite', 'Withdraw Recite', 'ReÃ§u de retrait', 'سحب يقرأ'),
(NULL, 'withdraw_confirm', 'Withdraw Confirm', 'Confirmation Retrait', 'سحب تأكيد'),
(NULL, 'change_verify', 'Confirm Verify', 'Changer Verification', 'تأكيد التحقق'),
(NULL, 'change_password', 'Password Change', 'Changer mot de passe', 'تغيير كلمة السر'),
(NULL, 'enter_confirm_password', 'Enter Confirm Password', 'Confirmer mot de passe', 'أدخل تأكيد كلمة المرور'),
(NULL, 'enter_new_password', 'Enter New Password', 'Entrer nouveau mot de passe', 'أدخل كلمة مرور جديدة'),
(NULL, 'enter_old_password', 'Enter Old Password', 'Entrer ancien mot de passe', 'أدخل كلمة المرور القديمة'),
(NULL, 'change', 'Change', 'Changement', 'يتغيرون'),
(NULL, 'password_change_successfull', 'Password Change Successfully', 'Mot de passe changÃ© avec succÃ¨s', 'تم تغيير كلمة المرور بنجاح'),
(NULL, 'old_password_is_wrong', 'Old Password Is Wrong', 'Entrer ancien mot de passe incorrect', 'كلمة المرور القديمة خاطئة'),
(NULL, 'fees_setting', 'Fees Setting', 'Reglages frais', 'تحديد الرسوم'),
(NULL, 'level', 'Level', 'Stage', 'مستوى'),
(NULL, 'select_level', 'Select Level', 'Selectionner stage', 'اختار مستوى'),
(NULL, 'fees_setting_successfully', 'Fees Setting Successfully', 'Reglages Frais reussi', 'ضبط الرسوم بنجاح'),
(NULL, 'bitcoin', 'Bitcoin', 'Bitcoin', 'بيتكوين'),
(NULL, 'payeer', 'Payeer', 'Payeer', 'بايير'),
(NULL, 'name', 'Name', 'Nom', 'اسم'),
(NULL, 'order_id', 'Order Id', 'ID de commande', 'رقم التعريف الخاص بالطلب'),
(NULL, 'fees', 'Fees', 'Frais', 'مصاريف'),
(NULL, 'period', 'Period', 'PÃ©riode', 'فترة'),
(NULL, 'commission_ret', 'Commission Ret', 'Commission ret', 'لجنة المتقاعدين'),
(NULL, 'title', 'Title', 'Titre', 'عنوان'),
(NULL, 'details', 'Details', 'Details', 'تفاصيل'),
(NULL, 'personal_info', 'Personal Information', 'Informations personnels', 'معلومات شخصية'),
(NULL, 'sponsor_info', 'Sponsor Information', 'Info Sponsor', 'معلومات الراعي'),
(NULL, 'affiliate_url', 'Affiliat Url', 'Lien parrainage', 'عنوان Url التابع'),
(NULL, 'copy', 'Copy', 'Copier', 'ينسخ'),
(NULL, 'my_payout', 'My Payout', 'Mes Paiements', 'مدفوعاتي'),
(NULL, 'personal_sales', 'Personal Sales', 'Ventes Personnelles', 'المبيعات الشخصية'),
(NULL, 'bank_details', 'Bank Details', 'Details de banque', 'التفاصيل المصرفية'),
(NULL, 'beneficiary_name', 'Beneficiary Name', 'Nom Beneficiaire', 'أسم المستفيد'),
(NULL, 'bank_name', 'Bank Name', 'Nom de banque', 'اسم البنك'),
(NULL, 'branch', 'Branch', 'Branche', 'فرع'),
(NULL, 'account_number', 'Account Number', 'NumÃ©ro de compte', 'رقم حساب'),
(NULL, 'ifsc_code', 'IFC Code', 'Code IFSC', 'كود مؤسسة التمويل الدولية'),
(NULL, 'account', 'Account', 'Compte', 'الحساب'),
(NULL, 'my_commission', 'My Commission', 'Mes commissions', 'لجنتي'),
(NULL, 'finance', 'Finance', 'La Finance', 'تمويل'),
(NULL, 'exchange', 'Exchange', 'Echange', 'تبادل'),
(NULL, 'bitcoin_setting', 'Bitcoin Setting', 'Reglages bitcoin', 'إعداد البيتكوين'),
(NULL, 'payeer_setting', 'Payeer Setting', 'Reglages Payeer', 'إعداد Payeer'),
(NULL, 'bank_information', 'Bank Information', 'Infos de banque', 'المعلومات المصرفية'),
(NULL, 'bitcoin_wallet_id', 'Bitcoin Wallet ID', 'Wallet Bitcoin', 'معرف محفظة Bitcoin'),
(NULL, 'payment_method_setting', 'Payment Method Setting', 'Reglage methode de paiement', 'إعداد طريقة الدفع'),
(NULL, 'payeer_wallet_id', 'Payeer Wallet Id', 'ID Payeer', 'معرف محفظة Payeer'),
(NULL, 'my_package', 'My Package', 'Mes packs', 'حزمة بلدي'),
(NULL, 'my_team', 'My Team', 'Mon Equipe', 'فريقي'),
(NULL, 'receipt', 'Receipt', 'RÃ©Ã§u', 'إيصال'),
(NULL, 'withdraw_successfull', 'Withdraw Successfully', 'Retrait reussi !', 'سحب بنجاح'),
(NULL, 'team_bonus', 'Team Bonus', 'Bonus d\'Equipe', 'مكافأة الفريق'),
(NULL, 'withdraw_list', 'Withdraw List', 'Liste retraits', 'قائمة السحب'),
(NULL, 'pending_withdraw', 'Pending Withdraw', 'Retrait en attente', 'في انتظار سحب'),
(NULL, 'reciver_account', 'Receiver Account', 'Compte BÃ©nÃ©ficiaire', 'حساب المتلقي'),
(NULL, 'french', 'French', 'FranÃ§ais', 'فرنسي'),
(NULL, 'commission_setup', 'Commission Setup', 'Reglage commission', 'إعداد اللجنة'),
(NULL, 'personal_investment', 'Personal Investment', 'Investissement personnel', 'الاستثمار الشخصي'),
(NULL, 'total_investment', 'Total investment', 'Total Investissement', 'استثمار كامل'),
(NULL, 'transfer_list', 'Transfer List', 'Liste transfert', 'قائمة التحويل'),
(NULL, 'form_to', 'From To', 'De à', 'من الى'),
(NULL, 'receive', 'Receive', 'Recevoir', 'تسلم'),
(NULL, 'wallet_id', 'Wallet Id', 'ID Wallet', 'معرف المحفظة'),
(NULL, 'withdraw_details', 'Withdraw Details', 'Details retraits', 'سحب التفاصيل'),
(NULL, 'generation_one', 'Generation One', 'GÃ©nÃ©ration 1', 'الجيل الأول'),
(NULL, 'generation_two', 'Generation Two', 'GÃ©nÃ©ration 2', 'الجيل الثاني'),
(NULL, 'generation_three', 'Generation Three', 'GÃ©nÃ©ration 3', 'الجيل الثالث'),
(NULL, 'generation_four', 'Generation Four', 'GÃ©nÃ©ration 4', 'الجيل الرابع'),
(NULL, 'generation_five', 'Generation Five', 'GÃ©nÃ©ration 5', 'الجيل الخامس'),
(NULL, 'generation_empty_message', 'You Have No Generation', 'Vous n\'avez pas de génération', 'ليس لديك جيل'),
(NULL, 'view', 'View', 'AperÃ§u', 'رأي'),
(NULL, 'cancle', 'Cancel', 'Annuler', 'يلغي'),
(NULL, 'type', 'Type', 'Taper', 'يكتب'),
(NULL, 'your_total_balance_is', 'Your Total Balance Is', 'Votre montant total est de', 'رصيدك الإجمالي هو'),
(NULL, 'bonus', 'Bonus', 'Bonus', 'علاوة'),
(NULL, 'personal_turnover', 'Sponser Turnover', 'Mon Chiffre d\'affaire perso', 'دوران الراعي'),
(NULL, 'team_turnover', 'Team Turnover', 'Chiffre d\'affaire Equipe', 'دوران الفريق'),
(NULL, 'post_article', 'Post Article', 'Publier un article', 'مقال آخر'),
(NULL, 'article_list', 'Article List', 'LIste article', 'قائمة المقالات'),
(NULL, 'add_article', 'Add Article', 'Ajouter article', 'أضف المادة'),
(NULL, 'headline_en', 'Headline English', 'Titre EN', 'العنوان باللغة الإنجليزية'),
(NULL, 'headline_fr', 'Headline French', 'Titre  FR', 'العنوان الفرنسي'),
(NULL, 'article_en', 'Article EN', 'Article EN', 'المادة EN'),
(NULL, 'article_fr', 'Article FR', 'Article FR', 'المادة FR'),
(NULL, 'edit_article', 'Edit Article', 'Editer article', 'تحرير المقال'),
(NULL, 'cat_list', 'Category List', 'Liste panier', 'قائمة الفئات'),
(NULL, 'add_cat', 'Add Category', 'Ajouter au panier', 'إضافة فئة'),
(NULL, 'parent_cat', 'Parent Category', 'Catégorie Parentale', 'القسم الرئيسي'),
(NULL, 'cat_name_en', 'Category Name English', 'Nom panier EN', 'اسم التصنيف English'),
(NULL, 'cat_name_fr', 'Category Name French', 'Nom panier FR', 'اسم التصنيف فرنسي'),
(NULL, 'cat_title_en', 'Category Title English', 'Titre Panier EN', 'عنوان التصنيف English'),
(NULL, 'cat_title_fr', 'Category Title French', 'Titre panier FR', 'عنوان الفئة French'),
(NULL, 'select_cat', 'Select Category', 'Selectionner Cat', 'اختر الفئة'),
(NULL, 'edit_cat', 'Edit Category', 'Editer Panier', 'تحرير الفئة'),
(NULL, 'position_serial', 'Position Serial', 'Numéro de poste', 'موقف المسلسل'),
(NULL, 'currency_list', 'Currency List', 'Liste de devise', 'قائمة العملات'),
(NULL, 'currency', 'Currency', 'Devise', 'عملة'),
(NULL, 'cryptocurrency_name', 'CryptoCurrency  Name', 'Nom Crypto monnaie', 'اسم العملة المشفرة'),
(NULL, 'select_cryptocurrency', 'Select Cryptocurrency', 'Selectionner Crypto', 'حدد العملة المشفرة'),
(NULL, 'edit_currency', 'Edit Currency', 'Editer Devise', 'تحرير العملة'),
(NULL, 'exchange_list', 'Exchange List', 'Liste Ã©changes', 'قائمة الصرف'),
(NULL, 'add_exchange', 'Add Exchange', 'Ajouter Echange', 'أضف الصرف'),
(NULL, 'edit_exchange', 'Edit Exchange', 'Editer Echange', 'تحرير الصرف'),
(NULL, 'wallet_data', 'Wallet ID', 'DonnÃ©es Wallet', 'معرف المحفظة'),
(NULL, 'sell_adjustment', 'Sell Adjustment', 'Ajustement Vente', 'تعديل البيع'),
(NULL, 'buy_adjustment', 'Buy Adjustment', 'Ajustement d\'achat', 'تعديل الشراء'),
(NULL, 'exchange_wallet', 'Exchange Wallet', 'Wallet Echange', 'محفظة الصرف'),
(NULL, 'exchange_wallet_list', 'Exchange Wallet List', 'Liste Wallet echange', 'قائمة محفظة الصرف'),
(NULL, 'add_exchange_wallet', 'Add Exchange Wallet', 'Ajouter Wallet', 'إضافة محفظة الصرف'),
(NULL, 'edit_exchange_wallet', 'Edit Exchange Wallet', 'Modifier Wallet echange', 'تحرير Exchange Wallet'),
(NULL, 'local_currency_list', 'Local Currency List', 'LIste  Monnaies locales', 'قائمة العملات المحلية'),
(NULL, 'local_currency', 'Local Currency', 'Devise Locale', 'العملة المحلية'),
(NULL, 'add_local_currency', 'Add Local Currency', 'Ajouter Monnaie', 'أضف العملة المحلية'),
(NULL, 'edit_local_currency', 'Edit Local Currency', 'Editer Devise locale', 'تحرير العملة المحلية'),
(NULL, 'currency_name', 'Currency Name', 'Nom devise', 'اسم العملة'),
(NULL, 'currency_iso_code', 'Currency ISO Code', 'Code ISO devise ', 'رمز ISO للعملة'),
(NULL, 'usd_exchange_rate', 'USD Exchange Rate', 'Taux d\'echange USD', 'سعر صرف الدولار الأمريكي'),
(NULL, 'currency_symbol', 'Currency Symbol', 'Symboles Devise', 'رمز العملة'),
(NULL, 'symbol_position', 'Symbol Position', 'Position symbole', 'موقف الرمز'),
(NULL, 'currency_position', 'Currency Position', 'Position devise', 'وضع العملة'),
(NULL, 'payment_gateway', 'Payment Gateway', 'Portail de paiement', 'بوابة الدفع'),
(NULL, 'gateway_name', 'Gateway Name', 'Nom passerelle', 'اسم البوابة'),
(NULL, 'gateway_setting', 'Gateway Setting', 'Reglage portail', 'إعداد البوابة'),
(NULL, 'add_payment_gateway', 'Add Payment Gateway', 'Ajouter Methode paiment', 'إضافة بوابة الدفع'),
(NULL, 'public_key', 'Public Key', 'ClÃ© publique', 'المفتاح العمومي'),
(NULL, 'private_key', 'Private Key', 'Clé privée', 'مفتاح سري'),
(NULL, 'shop_id', 'Shop ID', 'ID shop', 'معرف المتجر'),
(NULL, 'secret_key', 'Secret Key', 'ClÃ© secrete', 'المفتاح السري'),
(NULL, 'edit_payment_gateway', 'Edit Payment Gateway', 'Editer Methode de paiement', 'تحرير بوابة الدفع'),
(NULL, 'slider_list', 'Slider List', 'Liste des curseurs', 'قائمة المنزلق'),
(NULL, 'add_slider', 'Add Slider', 'Ajouter Slider', 'أضف شريط التمرير'),
(NULL, 'headline_fr', 'Headline French', 'Titre panier FR', 'العنوان رنسي  '),
(NULL, 'edit_slider', 'Edit Slider', 'Modifier le curseur', 'تحرير شريط التمرير'),
(NULL, 'social_app', 'Social App', 'Application sociale', 'التطبيق الاجتماعي'),
(NULL, 'edit_social_app', 'Edit Social App', 'Editer RS appli', 'تحرير التطبيق الاجتماعي'),
(NULL, 'social_link', 'Social Link', 'Lien social', 'الرابط الاجتماعي'),
(NULL, 'add_link', 'Add Link', 'Ajouter Lien', 'إضافة رابط'),
(NULL, 'link', 'Link', 'Lien', 'نهاية لهذه الغاية'),
(NULL, 'icon', 'Icon', 'IcÃ´ne', 'أيقونة'),
(NULL, 'edit_social_link', 'Edit Social Link', 'Edit les liens RS', 'تحرير الارتباط الاجتماعي'),
(NULL, 'transection_info', 'Transection Info', 'Info transaction', 'معلومات النقل'),
(NULL, 'sell', 'Sell', 'Vendre', 'باع'),
(NULL, 'article', 'Article', 'Article', 'مقالة - سلعة'),
(NULL, 'coin_amount', 'Coin Amount', 'Montat Crypto', 'مبلغ العملة'),
(NULL, 'coin_name', 'Coin Name', 'Nom de la pièce', 'اسم العملة'),
(NULL, 'buy_amount', 'Buy Amount', 'Montant achat', 'مبلغ الشراء'),
(NULL, 'sell_amount', 'Sell Amount', 'Montant Ã  vendre', 'مبلغ البيع'),
(NULL, 'wallet_data', 'Wallet ID', 'DonnÃ©es Wallet', 'معرف المحفظة'),
(NULL, 'usd_amount', 'USD Amount', 'Montant USD', 'المبلغ بالدولار الأمريكي'),
(NULL, 'rate_coin', 'Coin Rate', 'Taux coin', 'سعر العملة'),
(NULL, 'local_amount', 'Local Amount', 'Montant Local', 'المبلغ المحلي'),
(NULL, 'om_name', 'OM Name', 'Nom OM', 'اسم OM'),
(NULL, 'om_mobile_no', 'OM Phone No', 'NÂ° OM', 'OM رقم الهاتف'),
(NULL, 'transaction_no', 'Transaction No', 'NÂ° de transaction', 'رقم العملية التجارية'),
(NULL, 'idcard_no', 'ID Card No', 'NÂ° CNI', 'رقم بطاقة الهوية'),
(NULL, 'buy_list', 'Buy List', 'Buy list', 'قائمة الشراء'),
(NULL, 'add_buy', 'Add Buy', 'Ajouter Achat', 'أضف شراء'),
(NULL, 'transection_type', 'Transection Type', 'Type de transaction', 'نوع المعاملة'),
(NULL, 'payment_successfully', 'Payment Successfully', 'Paiement effectuÃ©', 'تم الدفع بنجاح'),
(NULL, 'payment_cancel', 'Payment Cancel', 'Paiement annulÃ©', 'إلغاء الدفع'),
(NULL, 'payment_successfully', 'Payment Successfully', 'Paiement effectuÃ©', 'تم الدفع بنجاح'),
(NULL, 'sell_list', 'Sell List', 'LIste de vente ', 'قائمة البيع'),
(NULL, 'add_sell', 'Add Sell', 'Ajouter Vente', 'أضف بيع'),
(NULL, 'edit_sell', 'Edit Sell', 'Modifier Vendre', 'تحرير بيع'),
(NULL, 'account_active_mail', 'Please check Email to activate your account', 'Activer votre mail', 'يرجى التحقق من البريد الإلكتروني لتفعيل حسابك'),
(NULL, 'accept_terms_privacy', 'You need to agree our Privacy Policy and Terms and Conditions.', 'Vous devez accepter notre politique de confidentialité et nos conditions générales.', 'يتحتاج إلى الموافقة على سياسة الخصوصية والشروط والأحكام الخاصة بنا.'),
(NULL, 'username_used', 'Username Already Used', 'Nom d\'utilisateur dÃ©jÃ  utilisÃ©', 'اسم المستخدم مستخدم بالفعل'),
(NULL, 'account_create_success_social', 'Account Created Successfully and Your Account activated', 'Compte crÃ©e avec succÃ¨s', 'تم إنشاء الحساب بنجاح وتفعيل حسابك'),
(NULL, 'email_used', 'Email Already Used', 'Adresse mail dÃ©jÃ  utilisÃ©', 'البريد الإلكتروني مستخدم بالفعل'),
(NULL, 'account_create_active_link', 'Account created successfully Activation link has been sent to your email address', 'Le compte a été créé avec succès Le lien d\'activation a été envoyé à votre adresse e-mail', 'تم إنشاء الحساب بنجاح تم إرسال رابط التنشيط إلى عنوان بريدك الإلكتروني'),
(NULL, 'active_account', 'Active Account', 'Compte actif', 'حساب نشط'),
(NULL, 'wrong_try_activation', 'Wrong Try', 'Mauvaise activation', 'المحاولة الخاطئة'),
(NULL, 'pay_now', 'Pay Now', 'Payer maintenant', 'ادفع الآن'),
(NULL, 'payment_successfully', 'Payment Successfully', 'Paiement effectuÃ©', 'تم الدفع بنجاح'),
(NULL, 'sell_successfully', 'Sell Successfully', 'Vente effectuÃ©e avec succÃ¨s', 'البيع بنجاح'),
(NULL, 'already_clicked', 'Already Clicked There', 'DÃ©ja ValidÃ©', 'تم النقر بالفعل هناك'),
(NULL, 'user_info', 'User Info', 'info utilisateur', 'معلومات المستخدم'),
(NULL, 'user_id', 'User ID', 'ID utilisateur', 'معرف المستخدم'),
(NULL, 'registered_ip', 'Registered IP', 'IP enregistrée', 'IP المسجل'),
(NULL, 'requested_ip', 'Requested IP', 'IP demandée', 'طلب IP'),
(NULL, 'transaction_status', 'Transaction Status', 'Status de la transaction', 'حالة عملية'),
(NULL, 'receive_status', 'Receive Status', 'Recevoir le statut', 'تلقي_حالة'),
(NULL, 'receive_complete', 'Receive Complete', 'Réception terminée', 'تلقي كاملة'),
(NULL, 'payment_status', 'Payment Status', 'Status de paiement', 'حالة السداد'),
(NULL, 'payment_complete', 'Payment Complete', 'Paiement terminé', 'الدفع تم'),
(NULL, 'url', 'URL', 'URL', 'URL'),
(NULL, 'app_id', 'App Id', 'ID appli', 'معرف التطبيق'),
(NULL, 'app_secret', 'App Secret', 'Secret Appli', 'سر التطبيق'),
(NULL, 'api_key', 'API Key', 'Clé API', 'مفتاح API'),
(NULL, 'app_name', 'App Name', 'Nom Appli', 'اسم التطبيق'),
(NULL, 'social_list', 'Social List', 'Liste sociale', 'القائمة الاجتماعية'),
(NULL, 'select_payment_method', 'Select Payment Method', 'Selectionner mode de paiement', 'اختار طريقة الدفع'),
(NULL, 'payable', 'Payable', 'Payable', 'مستحق الدفع'),
(NULL, 'rate', 'Rate', 'Évaluer', 'معدل'),
(NULL, 'how_do_you_receive_money', 'How do you receive money', 'Comment ReÃ§evoir votre argent', 'كيف تحصل على المال'),
(NULL, 'withdraw_method', 'Withdraw Method', 'Methode de retrait', 'طريقة السحب'),
(NULL, 'select_withdraw_method', 'Select Withdraw Method', 'Selectionner mÃ©thode de retrait', 'حدد طريقة السحب'),
(NULL, 'account_info', 'Account Info', 'Info compte', 'معلومات الحساب'),
(NULL, 'upload_docunemts', 'Upload Docunemts', 'Ajouter fichier', 'تحميل المستندات'),
(NULL, 'my_generation', 'My Generation', 'Mon Equipe', 'جيلي'),
(NULL, 'category', 'Category', 'CatÃ©gorie', 'فئة'),
(NULL, 'slider_h1_en', 'Slider H1 English', 'Curseur H1 Anglais', 'سلايدر H1 انجليزي'),
(NULL, 'slider_h1_fr', 'Slider H1 French', 'Curseur H1 Français', 'سلايدر H1 فرنسي'),
(NULL, 'slider_h2_en', 'Slider H2 English', 'Curseur H2 Anglais', 'سلايدر H2 الإنجليزية'),
(NULL, 'slider_h2_fr', 'Slider H2 French', 'Curseur H2 Français', 'سلايدر H2 فرنسي'),
(NULL, 'slider_h3_en', 'Slider H3 English', 'Curseur H3 Anglais', 'سلايدر H3 الإنجليزية'),
(NULL, 'slider_h3_fr', 'Slider H3 French', 'Curseur H3 Français', 'سلايدر H3 فرنسي'),
(NULL, 'complete', 'Complete', 'Complète', 'مكتمل'),
(NULL, 'refresh_currency', 'Refresh Currency', 'Actualiser la devise', 'تحديث العملة'),
(NULL, 'cryptocurrency', 'Crypto Currency', 'Crypto Monnaie', 'عملة مشفرة'),
(NULL, 'symbol', 'Symbol', 'Symbole', 'رمز'),
(NULL, 'please_select_cryptocurrency_first', 'Please Select CryptoCurrency First', 'Veuillez choisir une crypto monnaie', 'يرجى تحديد CryptoCurrency أولاً'),
(NULL, 'please_select_diffrent_payment_method', 'Please select Diffrent Payment Method', 'Selectionner une autre mÃ©thode de paiement', 'يرجى تحديد طريقة دفع مختلفة'),
(NULL, 'add_credit', 'Add Credit', 'Crediter Compte', 'إضافة رصيد'),
(NULL, 'credit', 'Credit', 'CrÃ©dit', 'تنسب إليه'),
(NULL, 'credit_list', 'Credit List', 'Liste De Crédit', 'قائمة الائتمان'),
(NULL, 'notes', 'Note', 'Notes', 'ملحوظة'),
(NULL, 'my_level_info', 'My Level Info', 'Info Niveau', 'معلومات مستواي'),
(NULL, 'slider', 'Slider', 'Slider', 'المنزلق'),
(NULL, 'exchange_setting', 'Exchange Setting', 'Reglage Echange', 'إعداد الصرف'),
(NULL, 'exchange_all_request', 'Exchange all Request', 'Toutes requÃªtes echanges', 'تبادل جميع الطلبات'),
(NULL, 'total_user', 'Total User', 'Nombre d\'utilisateurs', 'إجمالي المستخدم'),
(NULL, 'total_roi', 'Total ROI', 'Total ROI', 'إجمالي عائد الاستثمار'),
(NULL, 'total_commission', 'Total Commission', 'Total commission', 'إجمالي العمولة'),
(NULL, 'download_pdf', 'Download PDF', 'TÃ©lÃ©charger ', 'تحميل PDF'),
(NULL, 'view_all_news', 'View all news', 'AperÃ§u News', 'عرض كل الأخبار'),
(NULL, 'download_company_brochure', 'Download Company Brochure', 'TÃ©lÃ©chargez notre brochure', 'تحميل كتيب الشركة'),
(NULL, 'get_in_touch', 'Get in touch', 'Contactez-nous', 'ابقى على تواصل'),
(NULL, 'read_more', 'Read More', 'Lire plus', 'اقرأ أكثر'),
(NULL, 'know_more', 'Know more', 'Savoir plus', 'تعرف أكثر'),
(NULL, 'choose_plan', 'Choose plan', 'acheter', 'اختر الخطة'),
(NULL, 'latest_jobs', 'Latest Jobs', 'Latest Jobs', 'أحدث الوظائف'),
(NULL, 'website', 'Website', 'website', 'موقع الكتروني'),
(NULL, 'chose_one_of_the_following_methods', 'Chose One of the Following Methods.', 'chose_one_of_the_following_methods.', 'اختر إحدى الطرق التالية.'),
(NULL, 'sign_in_using_your_email_address', 'Sign in Using Your Email Address', 'Connectez-vous avec votre username ou email', 'تسجيل الدخول باستخدام عنوان البريد الإلكتروني الخاص بك'),
(NULL, 'forgot_password', 'Forgot Password', 'Mot De Passe Oublié', 'هل نسيت كلمة السر'),
(NULL, 'remember_me', 'Remember Me', 'Souviens-toi De Moi', 'تذكرنى'),
(NULL, 'username_or_email', 'Username or email', 'Username or email', 'اسم المستخدم أو البريد الالكتروني'),
(NULL, 'dont_have_an_account', 'Don\'t have an account', 'Don\'t have an account', 'ليس لديك حساب'),
(NULL, 'sign_up_now', 'Sign up Now', 'CrÃ©er un compte maintenant', 'أفتح حساب الأن'),
(NULL, 'send_code', 'Send Code', 'Send Code', 'أرسل الرمز'),
(NULL, 'sign_up', 'Sign Up', 'S\'inscrire', 'اشتراك'),
(NULL, 'already_user', 'Already User', 'Already User', 'بالفعل مستخدم'),
(NULL, 'sign_in_now', 'Sign In Now', 'Connectez-vous maintenant', 'قم بتسجيل دخولك الآن'),
(NULL, 'sign_up_for_free', 'Sign Up For Free', 'CrÃ©er un compte gratuitement', 'سجل مجانا'),
(NULL, 'join_thousands_of_companies_that_Use_globalcrypt_every_day', 'Join Thousands of Companies that Use Global Crypto Every Day', 'Join Thousands of Companies that Use Global Crypto Every Day', 'انضم إلى آلاف الشركات التي تستخدم العملات المشفرة العالمية كل يوم'),
(NULL, 'your_password_at_global_crypto_are_encrypted_and_secured', 'Your Password at the site is Encrypted And Secured', 'Votre mot de passe sur le site est crypté et sécurisé', 'ككلمة المرور الخاصة بك في الموقع مشفرة ومؤمنة  '),
(NULL, 'email_username_used', 'Email/Username Already Used', 'Email/Username Already Used', 'البريد الإلكتروني / اسم المستخدم مستخدم بالفعل'),
(NULL, 'address', 'Address', 'Adresse', 'تبوك'),
(NULL, 'phone', 'Phone', 'Phone', 'هاتف'),
(NULL, 'admin_align', 'Admin alignment', 'Admin alignment', 'محاذاة المسؤول'),
(NULL, 'office_time', 'Office time', 'Office time', 'وقت المكتب'),
(NULL, 'logo_web', 'Website logo', 'Website logo', 'شعار الموقع'),
(NULL, 'dashboard_logo', 'Dashboard logo', 'Dashboard logo', 'شعار لوحة القيادة'),
(NULL, 'advertisement', 'Advertisement', 'Advertisement', 'الإعلانات'),
(NULL, 'script', 'Script', 'Script', 'النصي'),
(NULL, 'add_advertisement', 'Add Advertisement', 'Add Advertisement', 'أضف إعلان'),
(NULL, 'page', 'Page', 'Page', 'صفحة'),
(NULL, 'embed_code', 'Embed code', 'Embed code', 'كود التضمين'),
(NULL, 'add_type', 'Add Type', 'Add Type', 'إضافة نوع'),
(NULL, 'edit_advertisement', 'Edit Advertisement', 'Edit Advertisement', 'تحرير إعلان'),
(NULL, 'host', 'Host', 'Host', 'مضيف'),
(NULL, 'port', 'Port', 'Port', 'ميناء'),
(NULL, 'apikey', 'API Key', 'API Key', 'مفتاح API'),
(NULL, 'mail_type', 'Mail Type', 'Mail Type', 'نوع البريد'),
(NULL, 'charset', 'Charset', 'Charset', 'محارف'),
(NULL, 'news', 'News', 'Nouvelles', 'أخبار'),
(NULL, 'news_list', 'News List', 'News List', 'قائمة الأخبار'),
(NULL, 'edit_news', 'Edit News', 'Edit News', 'تحرير الأخبار'),
(NULL, 'post_news', 'Post News', 'Post News', 'آخر الأخبار'),
(NULL, 'close', 'Close', 'Close', 'قريب'),
(NULL, 'contact_us', 'Contact Us', 'Contact Us', 'اتصل بنا'),
(NULL, 'watch_video', 'WATCH VIDEO', 'WATCH VIDEO', 'شاهد الفيديو'),
(NULL, 'about_bitcoin', 'About Bitcoin', 'About Bitcoin', 'حول بيتكوين'),
(NULL, 'get_start', 'Get Start', 'Get Start', 'ابدأ'),
(NULL, 'cryptocoins', 'Crypto Coins', 'Crypto Coins', 'عملات التشفير'),
(NULL, 'subscribe_to_our_newsletter', 'Subscribe to our newsletter!', 'Subscribe to our newsletter!', 'اشترك في نشرتنا الإخبارية!'),
(NULL, 'email_newslatter', 'Email Newsletter', 'Email Newsletter', 'النشرة البريد الإلكتروني'),
(NULL, 'services', 'Services', 'Services', 'خدمات'),
(NULL, 'our_company', 'Our Company', 'Our Company', 'شركتنا'),
(NULL, 'sign_in', 'Sign In', 'Connectez-vous', 'تسجيل الدخول'),
(NULL, 'join_the_new_yera_of_cryptocurrency_exchange', 'Join the new Yera of cryptocurrency exchange', 'Join the new Yera of cryptocurrency exchange', 'انضم إلى العام الجديد لتبادل العملات المشفرة'),
(NULL, 'access_the_cryptocurrency_experience_you_deserve', 'Access the cryptocurrency experience you deserve', 'Access the cryptocurrency experience you deserve', 'تمتع بالوصول إلى تجربة العملة المشفرة التي تستحقها'),
(NULL, 'home', 'Home', 'Accueil', 'مسكن'),
(NULL, 'scroll_to_top', 'Scroll to Top', 'Scroll to Top', 'انتقل إلى أعلى'),
(NULL, 'ticker', 'Ticker', 'Ticker', 'شريط'),
(NULL, 'price', 'Price', 'Prix', 'سعر'),
(NULL, 'capitalization', 'Capitalization', 'Capitalization', 'الرسملة'),
(NULL, '1d_change', '1D change', '1D change', '1D التغيير'),
(NULL, 'graph_24h', 'Graph 24H', 'Graph 24H', 'الرسم البياني 24 ح'),
(NULL, 'recent_post', 'Recent Post', 'Recent Post', 'المنشور الاخير'),
(NULL, 'my_social_link', 'My Social link', 'My Social link', 'الارتباط الاجتماعي الخاص بي'),
(NULL, 'tell_us_about_your_project', 'Tell Us About Your Project', 'Tell Us About Your Project', 'أخبرنا عن مشروعك'),
(NULL, 'company', 'Company', 'Company', 'شركة'),
(NULL, 'reset_your_password', 'Reset Your Password', 'Réinitialisez Votre Mot De Passe', 'اعد ضبط كلمه السر'),
(NULL, '24h_change', '24H change', '24H change', '24H التغيير'),
(NULL, '24h_volume', '24H Volume', '24H Volume', 'حجم 24H'),
(NULL, 'latitudelongitude', 'Latitude, Longitude', 'Latitude, Longitude', 'خطوط العرض والطول'),
(NULL, 'send_money', 'Send Money', 'Send Money', 'إرسال الأموال'),
(NULL, 'article', 'Article', 'article', 'مقالة - سلعة'),
(NULL, 'contact', 'Contact', 'Contact', 'اتصال'),
(NULL, 'team', 'Team', 'team', 'فريق'),
(NULL, 'client', 'Client', 'client', 'عميل'),
(NULL, 'service', 'Service', 'service', 'خدمة'),
(NULL, 'testimonial', 'Testimonial', 'testimonial', 'شهادة'),
(NULL, 'faq', 'F.A.Q', 'faq', 'التعليمات'),
(NULL, 'short_description_en', 'Short description english', 'Short Description', 'وصف قصير اللغة الإنجليزية'),
(NULL, 'long_description_en', 'Long description English', 'Long Description', 'وصف طويل باللغة الإنجليزية'),
(NULL, 'short_description_fr', 'Short description english', 'Short Description', 'وصف قصير اللغة الإنجليزية'),
(NULL, 'long_description_fr', 'Long description English', 'Long Description', 'وصف طويل باللغة الإنجليزية'),
(NULL, 'info', 'Information', 'Information', 'معلومة'),
(NULL, 'quote', 'Quote', 'Quote', 'يقتبس'),
(NULL, 'question_fr', 'Question French', 'Question French', 'سؤال الفرنسية'),
(NULL, 'question_en', 'Question English', 'Question English', 'سؤال اللغة الإنجليزية'),
(NULL, 'answer_en', 'Answer English', 'Answer English', 'أجب باللغة الإنجليزية'),
(NULL, 'answer_fr', 'Answer French', 'Answer French', 'أجب بالفرنسية'),
(NULL, 'content', 'Page Content', 'Page Content', 'محتوى الصفحة'),
(NULL, 'add_content', 'Add Content', 'Add Content', 'إضافة محتوى'),
(NULL, 'edit_content', 'Edit Content', 'Edit Content', 'تحرير المحتوى'),
(NULL, 'video', 'video (If Youtube Link)', 'video', 'فيديو (إذا كان رابط يوتيوب)'),
(NULL, 'add_faq', 'Add F.A.Q', 'Add faq', 'إضافة أسئلة وأجوبة'),
(NULL, 'add_testimonial', 'Add Testimonial', 'Add testimonial', 'أضف شهادة'),
(NULL, 'add_service', 'Add Service', 'Add service', 'أضف خدمة'),
(NULL, 'add_client', 'Add Client', 'Add client', 'إضافة عميل'),
(NULL, 'add_team', 'Add Team', 'Add team', 'اضافة فريق'),
(NULL, 'add_contact', 'Add Contact', 'Add contact', 'إضافة جهة اتصال'),
(NULL, 'add_article', 'Add Article', 'Add article', 'أضف المادة'),
(NULL, 'edit_article', 'edit Article', 'edit article', 'تحرير المقال'),
(NULL, 'edit_contact', 'edit Contact', 'edit contact', 'تحرير جهة الاتصال'),
(NULL, 'edit_team', 'edit Team', 'edit team', 'تحرير الفريق'),
(NULL, 'edit_client', 'edit Client', 'edit client', 'تحرير العميل'),
(NULL, 'edit_service', 'edit Service', 'edit service', 'تحرير الخدمة'),
(NULL, 'edit_testimonial', 'edit Testimonial', 'edit testimonial', 'تحرير التزكية'),
(NULL, 'edit_faq', 'edit F.A.Q', 'edit faq', 'تحرير أسئلة وأجوبة'),
(NULL, 'article_list', 'Article List', 'article', 'قائمة المقالات'),
(NULL, 'contact_list', 'Contact List', 'contact', 'قائمة الإتصال'),
(NULL, 'team_list', 'Team List', 'team', 'قائمة الفريق'),
(NULL, 'client_list', 'Client List', 'client', 'قائمة العملاء'),
(NULL, 'service_list', 'Service List', 'service', 'قائمة الخدمات'),
(NULL, 'testimonial_list', 'Testimonial List', 'testimonial', 'قائمة الشهادات'),
(NULL, 'faq_list', 'F.A.Q List', 'faq', 'قائمة الأسئلة الشائعة'),
(NULL, 'content_list', 'Page Content', 'Page Content', 'محتوى الصفحة'),
(NULL, 'add_teammember', 'Add Teammember', 'Add Teammember', 'إضافة عضو الفريق'),
(NULL, 'tooltip_package_name', 'Example: Silver Package', 'Example: Silver Package', 'مثال: الباقة الفضية'),
(NULL, 'tooltip_package_details', 'This is for Package Short Details', 'This is for Package Short Details.', 'هذا للحصول على تفاصيل الحزمة المختصرة'),
(NULL, 'tooltip_package_amount', 'Package Amount in Dollar. Example: 200', 'Package Amount in Dollar. Example: 200', 'مبلغ الحزمة بالدولار. '),
(NULL, 'tooltip_package_daily_roi', 'Please Set this field with Zero. Example: 0', 'Please Set this field with Zero. Example: 0', 'الرجاء تعيين هذا الحقل مع الصفر. '),
(NULL, 'tooltip_package_weekly_roi', 'Who buy this package they will get weekly ROI in Dollar. Example: 5. They will get every week 5 till them package period', 'Who buy this package they will get weekly ROI in Dollar. Example: 5. They will get every week 5 till them package period', 'الذين يشترون هذه الحزمة سيحصلون على عائد استثمار أسبوعي بالدولار. '),
(NULL, 'tooltip_package_monthly_roi', 'Sum of weekly ROI in a month', 'Sum of weekly ROI in a month', 'مجموع عائد الاستثمار الأسبوعي في الشهر'),
(NULL, 'tooltip_package_yearly_roi', 'Sum of weekly ROI in a Year', 'Sum of weekly ROI in a Year', 'مجموع عائد الاستثمار الأسبوعي في السنة'),
(NULL, 'tooltip_package_total_percent_roi', 'Total Persent Of ROI', 'Total Persent Of ROI', 'إجمالي النسبة المئوية لعائد الاستثمار'),
(NULL, 'tooltip_package_period', 'Package Period', 'Package Period', 'فترة الحزمة'),
(NULL, 'trading', 'Trading', 'Trade', 'تجارة'),
(NULL, 'trade_history', 'Trade History', 'Histoire Du Commerce', 'تاريخ التجارة'),
(NULL, 'market', 'Market', 'Marché', 'سوق'),
(NULL, 'coin_pair', 'Coin Pair', 'Coin Pair', 'زوج العملة'),
(NULL, 'pending_deposit', 'Pending Deposit', 'Demande de retrat en cours', 'في انتظار الإيداع'),
(NULL, 'email_and_sms_setting', 'Email And SMS Setting', 'Paramètres D\'e-mail Et De SMS', 'إعداد البريد الإلكتروني والرسائل القصيرة'),
(NULL, 'email_and_sms_gateway', 'Email And Sms Gateway', 'Email And Sms Gateway', 'بوابة البريد الإلكتروني والرسائل القصيرة'),
(NULL, 'trade', 'Trade', 'Commerce', 'تجارة'),
(NULL, 'referral_id', 'Referral ID', 'ID de parrainage', 'معرف الإحالة'),
(NULL, 'please_enter_valid_email', 'Please Enter Valid Email !!!', 'Please Enter Valid Email !!!', 'الرجاء إدخال بريد إلكتروني صحيح !!!'),
(NULL, 'already_subscribe', 'This Email Address already subscribed', 'This Email Address already subscribed', 'عنوان البريد الإلكتروني هذا مشترك بالفعل'),
(NULL, 'message_send_successfuly', 'TMessage send successfuly', 'Message send successfuly', 'تم ارسال الرسالة بنجاح'),
(NULL, 'message_send_fail', 'Message send Fail', 'Message send Fail', 'فشل إرسال الرسالة'),
(NULL, 'setup_payment_gateway', 'setup payment gateway', 'setup payment gateway', 'إعداد بوابة الدفع'),
(NULL, 'user_profile', 'User Profile', 'User Profile', 'ملف تعريفي للمستخدم'),
(NULL, 'client_id', 'Client Id', 'Client Id', 'معرف العميل'),
(NULL, 'client_secret', 'Client Secret', 'Client Secret', 'سر العميل'),
(NULL, 'notice', 'Notice', 'Remarquer', 'يلاحظ'),
(NULL, 'edit_notice', 'Edit Notice', 'Edit Notice', 'تحرير الإخطار'),
(NULL, 'language_list', 'Language List', 'Language List', 'قائمة اللغات'),
(NULL, 'phrase_list', 'Phrase List', 'Phrase List', 'قائمة العبارات'),
(NULL, 'label_added_successfully', 'Label added successfully!', 'Label added successfully!', 'تمت إضافة التسمية بنجاح!'),
(NULL, 'this_level_already_exist', 'This Level Already Exist!', 'This Level Already Exist!', 'هذا المستوى موجود بالفعل!'),
(NULL, 'you_successfully_deposit_the_amount', 'You successfully deposit the amount', 'You successfully deposit the amount', 'قمت بإيداع المبلغ بنجاح'),
(NULL, 'your_new_balance_is', 'Your new balance is', 'Your new balance is', 'رصيدك الجديد هو'),
(NULL, 'account_name', 'Account Name', 'Account Name', 'أسم الحساب'),
(NULL, 'account_no', 'Account No', 'Account No', 'رقم الحساب'),
(NULL, 'branch_name', 'Branch Name', 'Branch Name', 'اسم الفرع'),
(NULL, 'swift_code', 'SWIFT Code', 'SWIFT Code', 'رمز السرعة'),
(NULL, 'abn_no', 'BSB/Routing Number', 'BSB/Routing Number', 'BSB / رقم التوجيه'),
(NULL, 'country', 'Country', 'Country', 'دولة'),
(NULL, 'there_is_no_phone_number', 'There is no Phone number!!!', 'There is no Phone number!!!', 'لا يوجد رقم هاتف !!!'),
(NULL, 'coinpair', 'Coinpair', 'Coinpair', 'كوينبير'),
(NULL, 'edit_coinpair', 'Edit Coinpair', 'Edit Coinpair', 'تحرير Coinpair'),
(NULL, 'edit_coin', 'Edit coin', 'Edit coin', 'تحرير العملة'),
(NULL, 'coin_market', 'Coin Market', 'Marché Aux Pièces', 'سوق العملات'),
(NULL, 'edit_market', 'Edit Market', 'Modifier Le Marché', 'تحرير السوق'),
(NULL, 'leave_us_a_message', 'Leave us a message', 'Leave us a message', 'اترك لنا رسالة'),
(NULL, 'verify_type', 'verify type', 'verify type', 'تحقق من النوع'),
(NULL, 'gender', 'Gender', 'Gender', 'جنس'),
(NULL, 'id_number', 'Id  Number', 'Id Number', 'رقم الهوية'),
(NULL, 'verification_is_being_processed', 'Verification Is being Processed', 'Verification Is being Processed', 'التحقق قيد المعالجة'),
(NULL, 'cryptocoin', 'Cryptocoin', 'Cryptocoin french', 'العملة المشفرة'),
(NULL, 'please_setup_your_bank_account', 'Please setup bank account', 'Please setup bank account', 'الرجاء إعداد حساب مصرفي'),
(NULL, 'this_gateway_deactivated', 'This Gateway Deactivated', 'This Gateway Deactivated', 'تم إلغاء تنشيط هذه البوابة'),
(NULL, 'otp_send_to', 'OTP Send To', 'OTP Send To', 'OTP أرسل إلى'),
(NULL, 'your_weekly_limit_exceeded', 'Your weekly Limit exceeded', 'Your weekly exceeded ', 'تجاوز الحد الأسبوعي الخاص بك'),
(NULL, 'there_is_no_order_for_cancel', 'There is no order for cancel', 'There is no order for cancel', 'لا يوجد طلب للإلغاء'),
(NULL, 'request_canceled', 'Request Canceled', 'Demande Annulée', 'تم إلغاء الطلب'),
(NULL, 'referral_id_is_invalid', 'Referral ID is invalid', 'Referral ID is invalid', 'معرف الإحالة غير صالح'),
(NULL, 'invalid_ip_address', 'Invalid IP address', 'Invalid IP address', 'عنوان إب غير صالح'),
(NULL, 'please_activate_your_account', 'Please activate your account', 'Please activate your account', 'يرجى تفعيل حسابك'),
(NULL, 'already_regsister', 'Already regsister!!!', 'Already regsister!!!', 'مسجل بالفعل !!!'),
(NULL, 'this_account_is_now_pending', 'This account is now pending', 'This account is now pending', 'هذا الحساب معلق الآن'),
(NULL, 'this_account_is_suspend', 'This account is suspend', 'This account is suspend', 'هذا الحساب معلق'),
(NULL, 'something_wrong', 'Something wrong !!!', 'Something wrong !!!', 'هل هناك خطب ما !!!'),
(NULL, 'password_missmatch', 'Password Missmatch', 'password missmatch', 'كلمة المرور غير متطابقة'),
(NULL, 'invalid_authentication_code', 'Invalid Authentication Code', 'Invalid Authentication Code', 'رمز المصادقة غير صالح'),
(NULL, 'password_reset_code_send_check_your_email', 'Password reset code send.Check your email.', 'Password reset code send.Check your email.', 'إرسال رمز إعادة تعيين كلمة المرور. تحقق من بريدك الإلكتروني.'),
(NULL, 'email_required', 'email required', 'email required', 'أدخل عنوان بريدك الالكتروني!'),
(NULL, 'password_changed', 'Password has been changed', 'Password has been changed', 'تم تغيير كلمة المرور'),
(NULL, 'google_authenticator_disabled', 'Google Authenticator Disabled', 'Google Authenticator Disabled', 'Google Authenticator معطل'),
(NULL, 'google_authenticator_enabled', 'Google Authenticator Enabled', 'Google Authenticator Enabled', 'تم تمكين Google Authenticator'),
(NULL, 'this_account_already_activated', 'This account already activated', 'This account already activated', 'تم تنشيط هذا الحساب بالفعل'),
(NULL, 'total_balance', 'Total Balance', 'Total Balance', 'إجمالي الرصيد'),
(NULL, 'available_balance', 'Available Balance', 'Available balance', 'الرصيد المتوفر'),
(NULL, 'open', 'Open', 'Ouvert', 'فتح'),
(NULL, 'qty', 'QTY', 'QTY', 'الكمية'),
(NULL, 'finished_trade', 'Finished Trade', 'Finished Trade', 'التجارة النهائية'),
(NULL, 'deposit_crypto_dollar', 'Deposit(Crypto/Dollar)', 'Deposit(Crypto/Dollar)', 'إيداع (تشفير / دولار)'),
(NULL, 'us_dollar', 'US Dollar', 'US Dollar', 'الدولار الأمريكي'),
(NULL, 'available', 'Available', 'Disponible', 'متوفرة'),
(NULL, 'buy_orders', 'Buy Orders', 'Buy Orders', 'أوامر الشراء'),
(NULL, 'last_price', 'Last price', 'last price', 'السعر الاخير'),
(NULL, 'sell_orders', 'Sell Orders', 'Sell Orders', 'أوامر البيع'),
(NULL, '1hr_change', '1hr Change', '1hr Change', '1 ساعة التغيير'),
(NULL, '1hr_high', '1hr High', '1hr High', '1 ساعة عالية'),
(NULL, '1hr_low', '1hr Low', '1hr Low', '1 ساعة منخفضة'),
(NULL, '1hr_volume', '1hr Volume', '1hr Volume', 'حجم 1 ساعة'),
(NULL, 'estimated_open_price', 'Estimated open price', 'Estimated open price', 'سعر الافتتاح المقدر'),
(NULL, 'open_fees', 'Open fees', 'Open fees', 'فتح الرسوم'),
(NULL, 'market_depth', 'Market Depth', 'Market Depth', 'عمق السوق'),
(NULL, 'coin', 'Coin', 'Pièce De Monnaie', 'عملة'),
(NULL, 'market_price', 'Market Price', 'Market Price', 'سعر السوق'),
(NULL, 'volume', 'volume', 'volume', 'الصوت'),
(NULL, 'live_chat', 'Live Chat', 'Live Chat', 'دردشة مباشرة'),
(NULL, 'market_trade_history', 'Market Trade History', 'Market Trade History', 'تاريخ تجارة السوق'),
(NULL, 'Notices', 'notices', 'notices', 'إشعارات'),
(NULL, 'posted_by', 'Posted by', 'Posted by', 'منشور من طرف'),
(NULL, 'latest_form_our_blog', 'Latest form our blog', 'Latest form our blog', 'أحدث شكل على مدونتنا'),
(NULL, 'auth_code', 'Auth Code', 'AuthCode', 'كود المصادقة'),
(NULL, 'scan_this_barcode_using', 'Scan this BarCode using', 'Scan this BarCode using', 'امسح هذا الرمز الشريطي باستخدام ملفات'),
(NULL, 'google_authentication', 'Google Authentication', 'Google Authentication', 'مصادقة جوجل'),
(NULL, 'install_google_authentication', 'Install Google Authentication', 'Install Google Authentication', 'قم بتثبيت مصادقة Google'),
(NULL, 'if_you_are_unable_to_scan_the_qr_code_please_enter_this_code_manually_into_the_app.', 'If you are unable to scan the QR code, please enter this code manually into the app.', 'If you are unable to scan the QR code, please enter this code manually into the app.', 'إذا لم تتمكن من مسح رمز الاستجابة السريعة ضوئيًا ، فيرجى إدخال هذا الرمز يدويًا في التطبيق.'),
(NULL, 'open_order', 'Open Order', 'Open Order', 'طلب مفتوح'),
(NULL, 'complete_order', 'Complete Order', 'Complete Order', 'اكمل الطلب'),
(NULL, 'bank_setting', 'Bank Setup', 'Bank Setup', 'إعداد البنك'),
(NULL, 'payout_setup', 'Payout Setup', 'Payout Setup', 'إعداد الدفع'),
(NULL, 'account_login', 'Account Login', 'Account Login', 'تسجل الدخول'),
(NULL, 'we_never_share_your_email_with_anyone_else', 'We\'ll never share your email with anyone else', 'We\'ll never share your email with anyone else', 'لن نشارك بريدك الإلكتروني مع أي شخص آخر'),
(NULL, 'news_details', 'News Details', 'News Details', 'تفاصيل الخبر'),
(NULL, 'open_order_history', 'Open Order History', 'Open Order History', 'افتح محفوظات الطلبات'),
(NULL, 'required_qty', 'Required QTY', 'Qté requise', 'الكمية المطلوبة'),
(NULL, 'available_qty', 'Available Quantity ', 'quantité disponible', 'الكمية المتوفرة'),
(NULL, 'required_amount', 'Required Amount', 'Quantité requise', 'المبلغ المطلوب'),
(NULL, 'available_amount', 'Available Amount', 'Montant disponible', 'المبلغ المتاح'),
(NULL, 'complete_qty', 'Complete QTY', 'QTÉ complète', 'الكمية الكاملة'),
(NULL, 'complete_amount', 'Complete amount', 'Montant complet', 'المبلغ الكامل'),
(NULL, 'trade_time', 'Trade Time', 'Trade Time', 'وقت التجارة'),
(NULL, 'running', 'Running', 'Fonctionnement', 'ادارة'),
(NULL, '24hr_change', '24hr Change', '24hr Change', '24 ساعة التغيير'),
(NULL, '24hr_high', '24hr High', '24hr High', 'ارتفاع 24 ساعة'),
(NULL, '24hr_low', '24hr Low', '1hr Low', '24 ساعة منخفضة'),
(NULL, '24hr_volume', '24hr Volume', '24hr Volume', 'حجم 24 ساعة'),
(NULL, 'post_comment', 'Post Comment', 'Post Comment', 'أضف تعليقا'),
(NULL, 'account_created', 'Account Created', 'Account Created', 'تم إنشاء الحساب'),
(NULL, 'access_time', 'Access Time', 'Access Time', 'وقت الوصول'),
(NULL, 'user_agent', 'User Agent', 'User Agent', 'وكيل المستخدم'),
(NULL, 'passport', 'Passport', 'Passport', 'جواز سفر'),
(NULL, 'drivers_license', 'Driver license', 'Driver license', 'رخصة قيادة'),
(NULL, 'government_issued_id_card', 'Government-issued ID Card', 'Government-issued ID Card', 'بطاقة هوية صادرة عن جهة حكومية'),
(NULL, 'given_name', 'Given Name', 'Given Name', 'الاسم المعطى'),
(NULL, 'surname', 'Surname', 'Surname', 'اسم العائلة'),
(NULL, 'passport_nid_license_number', 'Passport/NID/License Number', 'Passport/NID/License Number', 'جواز السفر / NID / رقم الترخيص');
INSERT INTO `language` (`id`, `phrase`, `english`, `french`, `arabic`) VALUES
(NULL, 'account_register', 'Account Register', 'Account Register', 'تسجيل الحساب'),
(NULL, 'confirm_password', 'Confirm Password', 'Confirm Password', 'تأكيد كلمة المرور'),
(NULL, 'canceled', 'Canceled', 'Annulé', 'ألغيت'),
(NULL, 'completed', 'Completed', 'Complété', 'مكتمل'),
(NULL, 'crypto_dollar_currency', 'Crypto/Dollar Currency', 'Crypto/Dollar Currency', 'عملة التشفير / الدولار'),
(NULL, 'withdraw_no', 'Withdraw No', 'Withdraw No', 'سحب لا'),
(NULL, 'male', 'Male', 'Male', 'ذكر'),
(NULL, 'female', 'Female', 'Female', 'أنثى'),
(NULL, 'verify', 'KYC Verify', 'Verify', 'تحقق KYC'),
(NULL, 'server_problem', 'We are unable to send SMS at the moment.', 'Nous ne pouvons pas envoyer de SMS pour le moment.', 'نحن غير قادرين على إرسال الرسائل القصيرة في الوقت الحالي.'),
(NULL, 'verified', 'Verified', 'Vérifié', 'تم التحقق'),
(NULL, 'footer_menu1', 'Footer menu 1', 'Footer menu 1', 'قائمة التذييل 1'),
(NULL, 'footer_menu2', 'Footer menu 2', 'Footer menu 2', 'قائمة التذييل 2'),
(NULL, 'footer_menu3', 'Social Media', 'Social Media', 'وسائل التواصل الاجتماعي'),
(NULL, 'terms_of_use', 'Terms Of Use', 'Terms Of Use', 'تعليمات الاستخدام'),
(NULL, 'receiver_not_valid', 'Receiver not valid!!!', 'Receiver not valid!!!', 'المتلقي غير صالح !!!'),
(NULL, 'first_name_required', 'Please enter your name!', 'Please enter your name!', 'من فضلك أدخل إسمك!'),
(NULL, 'a_lowercase_letter', 'Please Enter a Lowercase letter !', 'Please enter a loswercase letter!', 'الرجاء إدخال حرف صغير!'),
(NULL, 'password_required', 'Please enter your password!', 'Please enter yYour password!', 'من فضلك أدخل رقمك السري!'),
(NULL, 'a_capital_uppercase_letter', 'Please Enter a Uppercase letter ! ', 'Please enter a upercase letter!', 'الرجاء إدخال حرف كبير!'),
(NULL, 'a_number', 'Please Enter a Number!', 'Please enter a number!', 'الرجاء إدخال رقم!'),
(NULL, 'a_special', 'Please Enter a Special Character !', 'Please enter a  special character!', 'الرجاء إدخال حرف خاص!'),
(NULL, 'please_enter_at_least_8_characters_input', 'Please enter at least eight characters!', 'Please enter at least eight characters!', 'الرجاء إدخال ثمانية أحرف على الأقل!'),
(NULL, 'confirm_password_must_be_filled_out', 'Please enter Confirm password!', 'Please enter Confirm password!', 'الرجاء إدخال تأكيد كلمة المرور!'),
(NULL, 'must_confirm_privacy_policy_and_terms_and_conditions', 'Must confirm privacy policy and terms and conditions', 'Must confirm privacy policy and terms and conditions', 'يجب تأكيد سياسة الخصوصية والشروط والأحكام'),
(NULL, 'phone_required', 'Enter your phone number!', 'Enter your phone number!', 'أدخل رقم هاتفك!'),
(NULL, 'email_required', 'Enter your email address!', 'Enter your email address!', 'أدخل عنوان بريدك الالكتروني!'),
(NULL, 'comments_required', 'Enter your comments!', 'Enter your comments!', 'أدخل تعليقاتك!'),
(NULL, 'first_name', 'Please enter your first name!', 'Please enter your first name!', 'يرجى ادخال الاسم الاول!'),
(NULL, 'f_name', 'First Name', 'First Name', 'الاسم الاول'),
(NULL, 'l_name', 'Last Name', 'Last Name', 'الكنية'),
(NULL, 'coin_full_name', 'Coin Full Name', 'Nom complet de la piÃ¨ce', 'الاسم الكامل للعملة'),
(NULL, 'coin_id', 'Coin Id', 'ID de piÃ¨ce', 'معرف العملة'),
(NULL, 'rank', 'Rank', 'Rang', 'مرتبة'),
(NULL, 'show_home', 'Show Home', 'Afficher la maison', 'عرض الصفحة الرئيسية'),
(NULL, 'yes', 'Yes', 'Oui', 'نعم'),
(NULL, 'no', 'No', 'Non', 'رقم'),
(NULL, 'coin_image/icon/logo', 'Coin Image/Icon/Logo', 'Image de piÃ¨ce / icÃ´ne / logo', 'صورة العملة / الرمز / الشعار'),
(NULL, 'coin_icon', 'Coin Icon', 'IcÃ´ne de piÃ¨ce de monnaie', 'رمز العملة'),
(NULL, 'full_name', 'Full Name', 'Nom complet', 'الاسم الكامل'),
(NULL, 'home_page/serial', 'Home Page/Serial', 'Page d\'accueil / SÃ©rie', 'الصفحة الرئيسية / المسلسل'),
(NULL, 'email_notification_settings', 'Email Notification Settings', 'Paramètres De Notification Par E-mail', 'إعدادات إعلام البريد الإلكتروني'),
(NULL, 'payout', 'Payout', 'Paiement', 'سيصرف'),
(NULL, 'commissin', 'Commissin', 'Commission', 'عمولة'),
(NULL, 'team_bonnus', 'Team Bonnus', 'Bonus d\'équipe', 'فريق بونوس'),
(NULL, 'sms_sending', 'SMS Sending', 'Envoi De SMS', 'إرسال الرسائل القصيرة'),
(NULL, 'exchange_market', 'Exchange Market', 'Marché Des Changes', 'سوق الصرف'),
(NULL, 'total_trade', 'Total Trade', 'Commerce Total', 'إجمالي التجارة'),
(NULL, 'total_crypto_fees', 'Total Crypto Fees', 'Total Des Frais De Crypto', 'إجمالي رسوم التشفير'),
(NULL, 'total_usd_fees', 'Total USD Fees', 'Frais Totaux En USD', 'إجمالي الرسوم بالدولار الأمريكي'),
(NULL, 'referral_bonus_usd', 'Referral Bonus USD', 'Bonus De Parrainage USD', 'مكافأة الإحالة بالدولار الأمريكي'),
(NULL, 'market_deposit', 'Market Deposit', 'DÃ©pÃ´t de marchÃ©', 'إيداع في السوق'),
(NULL, 'fees_collect', 'Fees Collect', 'Frais collectÃ©s', 'تحصيل الرسوم'),
(NULL, 'quantity', 'Quantity', 'QuantitÃ©', 'كمية'),
(NULL, 'required', 'Required', 'Obligatoire', 'مطلوب'),
(NULL, 'history', 'history', 'histoire', 'التاريخ'),
(NULL, 'back', 'Back', 'Retour', 'خلف'),
(NULL, 'important', 'Important', 'Important', 'مهم'),
(NULL, 'send_only', 'Send Only', 'Envoyer seulement', 'إرسال فقط'),
(NULL, 'deposit_address', 'deposit address', 'adresse de dÃ©pÃ´t', 'عنوان الإيداع'),
(NULL, 'sending_any_other_coin_or_token_to_this_address_may_result_in_the_loss_of_your_deposit', 'Sending any other coin or token to this address may result in the loss of your deposit', 'L\'envoi de toute autre piÃ¨ce ou jeton Ã  cette adresse peut entraÃ®ner la perte de votre dÃ©pÃ´t', 'قد يؤدي إرسال أي عملة أو رمز مميز آخر إلى هذا العنوان إلى فقدان الإيداع الخاص بك'),
(NULL, 'copy_address', 'Copy Address', 'Copier l\'adresse', 'نسخ العنوان'),
(NULL, 'payment_process', 'Payment Process', 'Processus de paiement', 'قدم الآن'),
(NULL, 'balance', 'Balance', 'Ã©quilibre', 'الرصيد'),
(NULL, 'flag', 'Flag', 'Drapeau', 'علَم'),
(NULL, 'menu_background_color', 'Menu Background Color', 'Couleur d\'arrière-plan du menu', 'لون خلفية القائمة'),
(NULL, 'menu_font_color', 'Menu Font Color', 'Couleur de la police du menu', 'لون خط القائمة'),
(NULL, 'footer_background_color', 'Footer Background Color', 'Couleur de fond du bas de page', 'لون خلفية التذييل'),
(NULL, 'footer_font_color', 'Footer Font Color', 'Couleur de la police du pied de page', 'لون خط التذييل'),
(NULL, 'button_background_color', 'Button Background Color', 'Couleur d\'arrière-plan du bouton', 'لون خلفية الزر'),
(NULL, 'button_font_color', 'Button Font Color', 'Couleur de la police du bouton', 'لون خط الزر'),
(NULL, 'theme_color', 'Theme Color', 'Couleur du thème', 'لون الموضوع'),
(NULL, 'newsletter_background_color', 'Newsletter Background Color', 'Couleur d\'arrière-plan de la newsletter', 'لون خلفية الرسالة الإخبارية'),
(NULL, 'newsletter_font_color', 'Newsletter Font Color', 'Couleur de police de la newsletter', 'لون خط الرسالة الإخبارية'),
(NULL, 'newsletter_images', 'Newsletter Images', 'Images de la newsletter', 'صور النشرة الإخبارية'),
(NULL, 'pending-withdraw', 'Pending withdraw', 'En attente de retrait', 'في انتظار سحب'),
(NULL, 'withdraw-list', 'Withdraw List', 'Retirer la liste', 'قائمة السحب'),
(NULL, 'pending-deposit', 'Pending Deposit', 'Dépôt en attente', 'في انتظار الإيداع'),
(NULL, 'deposit-list', 'Deposit List', 'Liste de dépôt', 'قائمة الودائع'),
(NULL, 'add-credit', 'Add Credit', 'Ajouter un crédit', 'إضافة رصيد'),
(NULL, 'open-order', 'Open Order', 'Commande Ouverte', 'طلب مفتوح'),
(NULL, 'trade-history', 'Trade History', 'Histoire Du Commerce', 'تاريخ التجارة'),
(NULL, 'exchanger', 'Exchanger', 'Échangeur', 'مبادل'),
(NULL, 'coin-pair', 'Coin Pair', 'Paire De Pièces', 'زوج العملة'),
(NULL, 'user', 'User', 'Utilisateur', 'المستعمل'),
(NULL, 'add-user', 'Add User', 'Ajouter un utilisateur', 'إضافة مستخدم'),
(NULL, 'user-list', 'user list', 'liste d\'utilisateur', 'قائمة المستخدم'),
(NULL, 'verify-user', 'Verify User', 'Vérifier L\'utilisateur', 'تحقق من المستخدم'),
(NULL, 'subscriber-list', 'Subscriber List', 'Liste D\'abonnés', 'قائمة المشتركين'),
(NULL, 'app-setting', 'App Setting', 'Réglage De L\'application', 'إعداد التطبيق'),
(NULL, 'block-list', 'Block List', 'Liste De Blocage', 'قائمة الحظر'),
(NULL, 'fees-setting', 'Fees Setting', 'établissement Des Frais', 'تحديد الرسوم'),
(NULL, 'transaction-setup', 'Transaction Setup', 'Configuration De La Transaction', 'إعداد المعاملات'),
(NULL, 'email-sms-gateway', 'Email Sms Gateway', 'Passerelle Sms Email', 'بوابة البريد الإلكتروني الرسائل القصيرة'),
(NULL, 'payment-gateway', 'Payment Gateway', 'Passerelle De Paiement', 'بوابة الدفع'),
(NULL, 'affiliation', 'Affiliation', 'Affiliation', 'الانتماء'),
(NULL, 'external-api-list', 'External Api List', 'Liste Des API Externes', 'قائمة Api الخارجية'),
(NULL, 'update-external-api', 'Update External Api', 'Mettre à Jour L\'API Externe', 'تحديث واجهة برمجة التطبيقات الخارجية'),
(NULL, 'phrase', 'Phrase', 'Phrase', 'عبارة'),
(NULL, 'edit-phrase', 'Edit Phrase', 'Modifier La Phrase', 'تحرير العبارة'),
(NULL, 'update-gateway', 'Update Gateway', 'Mettre à Jour La Passerelle', 'بوابة التحديث'),
(NULL, 'edit-user', 'Edit User', 'Modifier L\'utilisateur', 'تحرير العضو'),
(NULL, 'add-admin', 'Add Admin', 'Ajouter Un Administrateur', 'إضافة المسؤول'),
(NULL, 'admin-list', 'Admin List', 'Liste D\'administrateurs', 'قائمة المسؤول'),
(NULL, 'cms', 'CMS', 'CMS', 'سم'),
(NULL, 'themes-setting', 'Themes Setting', 'Réglage Des Thèmes', 'إعداد الموضوعات'),
(NULL, 'page-content-list', 'Page Content List', 'Liste De Contenu De Page', 'قائمة محتويات الصفحة'),
(NULL, 'faq-list', 'Faq List', 'Liste De Faq', 'قائمة الأسئلة الشائعة'),
(NULL, 'notice-list', 'Notice List', 'Liste D\'avis', 'قائمة الإشعارات'),
(NULL, 'edit-page-content', 'Edit Page Content', 'Modifier Le Contenu De La Page', 'تحرير محتوى الصفحة'),
(NULL, 'edit-faq', 'Edit Faq', 'Modifier La FAQ', 'تحرير التعليمات'),
(NULL, 'edit-notice', 'Edit Notice', 'Modifier L\'avis', 'تحرير الإخطار'),
(NULL, 'add-page-content', 'Add Page Content', 'Ajouter Du Contenu De Page', 'أضف محتوى الصفحة'),
(NULL, 'add-faq', 'Add Faq', 'Ajouter Une FAQ', 'أضف التعليمات'),
(NULL, 'news-list', 'News List', 'Liste De Nouvelles', 'قائمة الأخبار'),
(NULL, 'add-news', 'Add News', 'Ajouter Des Nouvelles', 'أضف أخبار'),
(NULL, 'edit-news', 'Edit News', 'Modifier Les Actualités', 'تحرير الأخبار'),
(NULL, 'category-list', 'Category List', 'Liste Des Catégories', 'قائمة الفئات'),
(NULL, 'add-category', 'Add Category', 'Ajouter Une Catégorie', 'إضافة فئة'),
(NULL, 'edit-category', 'Edit Category', 'Modifier La Catégorie', 'تحرير الفئة'),
(NULL, 'slider-list', 'Slider List', 'Liste De Curseurs', 'قائمة المنزلق'),
(NULL, 'add-slider', 'Add Slider', 'Ajouter Un Curseur', 'أضف شريط التمرير'),
(NULL, 'edit-slider', 'Edit Slider', 'Modifier Le Curseur', 'تحرير شريط التمرير'),
(NULL, 'social-link-list', 'Social Link List', 'Liste De Liens Sociaux', 'قائمة الروابط الاجتماعية'),
(NULL, 'edit-social-link', 'Edit Social Link', 'Modifier Le Lien Social', 'تحرير الارتباط الاجتماعي'),
(NULL, 'advertisement-list', 'Advertisement List', 'Liste De Publicités', 'قائمة الإعلانات'),
(NULL, 'add-advertisement', 'Add Advertisement', 'Ajouter Une Publicité', 'أضف إعلان'),
(NULL, 'edit-advertisement', 'Edit Advertisement', 'Modifier La Publicité', 'تحرير إعلان'),
(NULL, 'web-language-list', 'Web Language List', 'Liste Des Langues Web', 'قائمة لغة الويب'),
(NULL, 'autoupdate', 'Autoupdate', 'Mise à Jour Automatique', 'التحديث التلقائي'),
(NULL, 'latest-version', 'Latest Version', 'Dernière Version', 'احدث اصدار'),
(NULL, 'current-version', 'Current Version', 'Version Actuelle', 'النسخة الحالية'),
(NULL, 'subscriber', 'Subscriber', 'Abonné', 'مشترك'),
(NULL, 'affiliation-setup', 'Affiliation Setup', 'Configuration De L\'affiliation', 'إعداد الانتساب'),
(NULL, 'external-api', 'External API', 'API Externe', 'API الخارجية'),
(NULL, 'support', 'Support', 'Soutien', 'الدعم'),
(NULL, 'no-update-available', 'No Update Available', 'Pas De Mise A Jour Disponible', 'أي تحديث متاح'),
(NULL, 'full-name', 'Full Name', 'Nom Complet', 'الاسم الكامل'),
(NULL, 'initial-price', 'Initial Price', 'Prix ???initial', 'السعر المبدئي'),
(NULL, 'test_bdtask', 'Bdtask Limited', 'Bdtask limité', 'Bdtask المحدودة'),
(NULL, 'email_sms_template', 'E-mail And SMS Template', 'E-mail And SMS Template', 'قالب البريد الإلكتروني والرسائل القصيرة'),
(NULL, 'template-english', 'Template English', 'Modèle Anglais', 'نموذج باللغة الإنجليزية'),
(NULL, 'template-french', 'Template French', 'Modèle Français', 'قالب فرنسي'),
(NULL, 'template-name', 'Template Name', 'Nom Du Modèle', 'اسم القالب'),
(NULL, 'template-type', 'Template Type', 'Type De Modèle', 'نوع النموذج'),
(NULL, 'template-update', 'Template-update', 'Template-update', 'تحديث النموذج'),
(NULL, 'email-sms-template', 'Email Sms Template', 'Modèle De Courrier électronique SMS', 'نموذج البريد الإلكتروني SMS'),
(NULL, 'transfer_verification', 'Transfer Verification', 'Vérification Du Transfert', 'التحقق من التحويل'),
(NULL, 'transfer_success', 'Transfer Success', 'Succès Du Transfert', 'نجاح النقل'),
(NULL, 'withdraw_verification', 'Withdraw Verification', 'Retirer La Vérification', 'سحب التحقق'),
(NULL, 'withdraw_success', 'Withdraw Success', 'Retirer Le Succès', 'سحب النجاح'),
(NULL, 'profile_update', 'Profile Update', 'Mise à Jour Du Profil', 'تحديث الملف الشخصي'),
(NULL, 'deposit_success', 'Deposit Success', 'Réussite Du Dépôt', 'نجاح الإيداع'),
(NULL, 'registered', 'Registered', 'Inscrit', 'مسجل'),
(NULL, 'email_address', 'Email Address', 'Adresse E-mail', 'عنوان البريد الالكترونى'),
(NULL, 'template_type', 'Template Type', 'Type De Modèle', 'نوع النموذج'),
(NULL, 'subject_english', 'Subject English', 'Sujet Anglais', 'مادة الانجليزية'),
(NULL, 'subject_french', 'Subject French', 'Sujet Français', 'الموضوع الفرنسية'),
(NULL, 'purchase_key', 'Purchase Key', 'Clé D\'achat', 'مفتاح الشراء'),
(NULL, 'module', 'Module', 'Module', 'وحدة'),
(NULL, 'add_module', 'Add Module', 'Ajouter Un Module', 'إضافة وحدة'),
(NULL, 'overwrite', 'Overwrite', 'écraser', 'الكتابة فوق'),
(NULL, 'theme_uploaded_successfully', 'Theme Uploaded Successfully', 'Thème Téléchargé Avec Succès', 'تم تحميل الموضوع بنجاح'),
(NULL, 'there_was_a_problem_with_the_upload', 'There Was A Problem With The Upload', 'Il Y A Eu Un Problème Avec Le Téléchargement', 'كانت هناك مشكلة في التحميل'),
(NULL, 'invalid_purchase_key', 'Invalid Purchase Key', 'Clé D\'achat Invalide', 'مفتاح شراء غير صالح'),
(NULL, 'buy_now', 'Buy Now', 'Acheter Maintenant', 'اشتري الآن'),
(NULL, 'install', 'Install', 'Installer', 'تثبيت'),
(NULL, 'invalid_module', 'Invalid Module', 'Module Invalide', 'وحدة غير صالحة'),
(NULL, 'module_added_successfully', 'Module Added Successfully', 'Module Ajouté Avec Succès', 'تمت إضافة الوحدة بنجاح'),
(NULL, 'no_tables_are_registered_in_config', 'No Tables Are Registered_in Config', 'Aucune Table N\'est Enregistrée Dans La Configuration', 'لم يتم تسجيل أي جداول في التكوين'),
(NULL, 'themes', 'Themes', 'Thèmes', 'ثيمات'),
(NULL, 'module_list', 'Module List', 'Liste Des Modules', 'قائمة الوحدة'),
(NULL, 'theme_active_successfully', 'Theme Active Successfully', 'Thème Actif Avec Succès', 'تم تفعيل الموضوع بنجاح'),
(NULL, 'theme_name', 'Theme Name', 'Nom Du Thème', 'اسم الموضوع'),
(NULL, 'upload', 'Upload', 'Télécharger', 'تحميل'),
(NULL, 'downloaded_successfully', 'Downloaded Successfully', 'Téléchargé Avec Succès', 'تم التنزيل بنجاح'),
(NULL, 'failed_try_again', 'Failed Try Again', 'échec Réessayer', 'فشل - الرجاء المحاولة مرة أخرى'),
(NULL, 'no_theme_available', 'No Theme Available', 'Aucun Thème Disponible', 'لا يوجد موضوع متاح'),
(NULL, 'download', 'Download', 'Télécharger', 'تحميل'),
(NULL, 'theme_list', 'Theme List', 'Liste De Thèmes', 'قائمة الموضوع'),
(NULL, 'addon', 'Addon', 'Ajouter', 'اضافه'),
(NULL, 'add_theme', 'Add Theme', 'Ajouter Un Thème', 'إضافة موضوع'),
(NULL, 'download_theme', 'Download Theme', 'Télécharger Le Thème', 'تحميل الموضوع'),
(NULL, 'uninstall', 'Uninstall', 'Désinstaller', 'الغاء التثبيت'),
(NULL, 'please_wait', 'Please Wait', 'S\'il Vous Plaît, Attendez', 'أرجو الإنتظار'),
(NULL, 'current', 'Current', 'Actuel', 'تيار'),
(NULL, 'back_to_home', 'Back To Home', 'De Retour à La Maison', 'العودة إلى المنزل'),
(NULL, 'trading_history', 'Trading History', 'Historique Du Trading', 'تاريخ التداول'),
(NULL, 'latest_news', 'Latest News', 'Dernières Nouvelles', 'أحدث الأخبار'),
(NULL, 'create_an_account', 'Create An Account', 'Créer Un Compte', 'انشئ حساب'),
(NULL, 'to__trade', 'To  Trade', 'échanger', 'للتجارة'),
(NULL, 'log_in', 'Log In', 'S\'identifier', 'تسجيل الدخول'),
(NULL, 'white', 'WHITE', 'BLANC', 'أبيض'),
(NULL, 'dark', 'DARK', 'FONCÉ', 'مظلم'),
(NULL, 'enter_your_email_address_to_retrieve_your_password', 'Enter Your Email Address To Retrieve Your Password', 'Entrez Votre Adresse E-mail Pour Récupérer Votre Mot De Passe', 'أدخل عنوان بريدك الإلكتروني لاسترداد كلمة المرور الخاصة بك'),
(NULL, 'retrieve_password', 'Retrieve Password', 'Récupérer Mot De Passe', 'استرجاع كلمة المرور'),
(NULL, 'not_a_member_yet', 'Not A Member Yet', 'Pas Encore Membre', 'لست عضوا حتى الآن'),
(NULL, 'total_users', 'Total Users', 'Nombre Total D\'utilisateurs', 'إجمالي المستخدمين'),
(NULL, 'all_users', 'All Users', 'Tous Les Utilisateurs', 'جميع المستخدمين'),
(NULL, 'all_markets', 'All Markets', 'Tous Les Marchés', 'جميع الأسواق'),
(NULL, 'method', 'Method', 'Méthode', 'طريقة'),
(NULL, 'slider_title_engnilsh', 'Slider Title Engnilsh', 'Titre Du Curseur Engnilsh', 'عنوان المنزلق Engnilsh'),
(NULL, 'slider_h1', 'Slider H1', 'Curseur H1', 'المنزلق H1'),
(NULL, 'sub_title_english', 'Sub Title English', 'Sous-titre Anglais', 'الترجمة الإنجليزية'),
(NULL, 'slider_h2', 'Slider H2', 'Curseur H2', 'المنزلق H2'),
(NULL, 'button_text', 'Button Text', 'Texte Du Bouton', 'زر كتابة'),
(NULL, 'slider_h3', 'Slider H3', 'Curseur H3', 'المنزلق H3'),
(NULL, 'code', 'Code', 'Code', 'شفرة'),
(NULL, 'language_name', 'Language Name', 'Nom De La Langue', 'اسم اللغة'),
(NULL, 'add_coin_pair', 'Add Coin Pair', 'Ajouter Une Paire De Pièces', 'إضافة زوج عملات'),
(NULL, 'cryptocoin_add', 'Cryptocoin Add', 'Ajout De Crypto-monnaie', 'إضافة Cryptocoin'),
(NULL, 'add-coin-pair', 'Add-coin-pair', 'Ajouter Une Paire De Pièces', 'إضافة زوج عملات'),
(NULL, 'security', 'Security', 'Sécurité', 'حماية'),
(NULL, 'edita_dmin', 'Edita Dmin', 'Edita Dmin', 'إيديتا دمين'),
(NULL, 'edit-admin', 'Edit-admin', 'Edit-admin', 'تحرير المسؤول'),
(NULL, 'article1_en', 'Article1 En', 'Article1 Fr', 'المادة 1 En'),
(NULL, 'question_english', 'Question English', 'Question Anglais', 'سؤال اللغة الإنجليزية'),
(NULL, 'add-notice', 'Add-notice', 'Add-notice', 'إضافة إشعار'),
(NULL, 'edit-profile', 'Edit-profile', 'Editer Le Profil', 'تعديل الملف الشخصي'),
(NULL, '_phrase_name', ' Phrase Name', 'Nom De La Phrase', 'اسم العبارة'),
(NULL, 'cryptocoin-edit', 'Cryptocoin-edit', 'Crypto-monnaie-modifier', 'Cryptocoin تحرير'),
(NULL, 'edit-market', 'Edit-market', 'Edit-market', 'تحرير السوق'),
(NULL, 'edit-coin-pair', 'Edit-coin-pair', 'Modifier La Paire De Pièces', 'تحرير زوج العملة'),
(NULL, 'transaction_type', 'Transaction Type', 'Type De Transaction', 'نوع المعاملة'),
(NULL, 'account_type', 'Account Type', 'Type De Compte', 'نوع الحساب'),
(NULL, 'unverified', 'Unverified', 'Non Vérifié', 'لم يتم التحقق منه'),
(NULL, 'limit_amount', 'Limit Amount', 'Montant Limite', 'الحد المبلغ'),
(NULL, 'percent', 'Percent', 'Pour Cent', 'نسبه مئويه'),
(NULL, 'fixed', 'Fixed', 'Fixé', 'مُثَبَّت'),
(NULL, 'api_name', 'API Name', 'Nom De L\'API', 'اسم API'),
(NULL, 'merchant_id', 'Merchant Id', 'Identifiant Du Marchand', 'معرّف التاجر'),
(NULL, 'email_gateway', 'Email Gateway', 'Passerelle De Messagerie', 'بوابة البريد الإلكتروني'),
(NULL, 'sms_gateway', 'Sms Gateway', 'Passerelle Sms', 'بوابة الرسائل القصيرة'),
(NULL, 'credit-list', 'Credit-list', 'Liste De Crédit', 'قائمة الائتمان'),
(NULL, 'cryptocoin-add', 'Add Currency', 'Ajouter une devise', 'أضف العملة'),
(NULL, 'see_all_users', 'See All Users', 'Voir Tous Les Utilisateurs', 'انظر جميع المستخدمين'),
(NULL, 'see_all_markets', 'See All Markets', 'Voir Tous Les Marchés', 'انظر جميع الأسواق'),
(NULL, 'see_trade_history', 'See Trade History', 'Voir L\'historique Du Commerce', 'انظر تاريخ التجارة'),
(NULL, 'buy_&_sell', 'Buy & Sell', 'Acheter Vendre', 'شراء بيع'),
(NULL, 'deposit,_withdraw,_transfer', 'Deposit, Withdraw, Transfer', 'Dépôt, Retrait, Transfert', 'الإيداع والسحب والتحويل'),
(NULL, 'see_all_pending_withdraw', 'See All Pending Withdraw', 'Voir Tous Les Retraits En Attente', 'انظر كل الانسحاب المعلق'),
(NULL, 'see_all_trade_history', 'See All Trade History', 'Voir Toute L\'histoire Du Commerce', 'انظر جميع تاريخ التجارة'),
(NULL, 'user_growth_rate', 'USER GROWTH RATE', 'TAUX DE CROISSANCE DES UTILISATEURS', 'معدل نمو المستخدم'),
(NULL, 'email_sms_settings', 'Email Sms Settings', 'Paramètres De Messagerie électronique', 'إعدادات البريد الإلكتروني SMS'),
(NULL, 'email-sms-settings', 'Email-sms-settings', 'Email-sms-settings', 'إعدادات البريد الإلكتروني'),
(NULL, 'fees_collection', 'Fees Collection', 'Perception Des Frais', 'تحصيل الرسوم'),
(NULL, 'create_user', 'Create User', 'Créer Un Utilisateur', 'إنشاء مستخدم'),
(NULL, 'create_admin', 'Create Admin', 'Créer Un Administrateur', 'إنشاء المسؤول'),
(NULL, 'add-ons', 'Add-ons', 'Add-ons', 'الإضافات'),
(NULL, 'max_sell_currency_amount', 'Max Sell Currency Amount', 'Montant Maximal De La Devise De Vente', 'الحد الأقصى لمبلغ عملة البيع'),
(NULL, 'max_buy_currency_amount', 'Max Buy Currency Amount', 'Montant Maximal De La Devise D\'achat', 'الحد الأقصى لمبلغ عملة الشراء'),
(NULL, 'account', 'Account', 'Compte', 'الحساب'),
(NULL, 'google_captcha', 'Google Captcha', 'Google Capture', 'جوجل كابتشا'),
(NULL, 'add_captcha_at_your_domain', 'Add captcha at your domain', 'Domaine De Configuration', 'إضافة الكابتشا في المجال الخاص بك'),
(NULL, 'pages', 'Pages', 'Pages', 'الصفحات'),
(NULL, 'useful_links', 'Useful Links', 'Liens Utiles', 'روابط مفيدة'),
(NULL, 'check_your_email_server', 'Check Your Email Server', 'Vérifiez Votre Serveur De Messagerie', 'تحقق من خادم البريد الإلكتروني الخاص بك'),
(NULL, 'check_your_sms_gateway_', 'Check Your Sms Gateway ', 'Vérifiez Votre Passerelle SMS', 'تحقق من بوابة الرسائل القصيرة الخاصة بك'),
(NULL, 'mobile_no', 'Mobile No', 'Mobile Non', 'رقم الموبايل'),
(NULL, 'email_gateway_setup', 'Email Gateway Setup', 'Configuration De La Passerelle De Messagerie', 'إعداد بوابة البريد الإلكتروني'),
(NULL, 'sms_gateway_setup', 'SMS Gateway Setup', 'Configuration De La Passerelle SMS', 'إعداد بوابة الرسائل القصيرة'),
(NULL, 'check_your_sms_gateway', 'Check Your Sms Gateway', 'Vérifiez Votre Passerelle SMS', 'تحقق من بوابة الرسائل القصيرة الخاصة بك'),
(NULL, 'logo_type', 'Logo Type', 'Type De Logo', 'نوع الشعار'),
(NULL, 'log_type', 'Log Type', 'Type De Journal', 'نوع السجل'),
(NULL, 'body_background_color', 'Body Background Color', 'Couleur D\'arrière-plan Du Corps', 'لون خلفية الجسم'),
(NULL, 'body_font_color', 'Body Font Color', 'Couleur De La Police Du Corps', 'لون خط النص الأساسي'),
(NULL, 'top_footer_horizontal_border_color', 'Top Footer Horizontal Border Color', 'Couleur De La Bordure Horizontale Du Pied De Page Supérieur', 'لون الحد الأفقي في التذييل العلوي'),
(NULL, 'footer__menu_border_color', 'Footer  Menu Border Color', 'Couleur De La Bordure Du Menu Du Pied De Page', 'لون حدود قائمة التذييل'),
(NULL, 'footer_menu_border_color', 'Footer Menu Border Color', 'Couleur De La Bordure Du Menu Du Pied De Page', 'لون حدود قائمة التذييل'),
(NULL, 'bottom_footer_background_color', 'Bottom Footer Background Color', 'Couleur D\'arrière-plan Du Pied De Page Inférieur', 'لون خلفية التذييل السفلي'),
(NULL, 'bottom_footer_font_color', 'Bottom Footer Font Color', 'Couleur De Police Du Pied De Page Inférieur', 'لون خط التذييل السفلي'),
(NULL, 'form_background_color', 'Form Background Color', 'Couleur D\'arrière-plan Du Formulaire', 'لون خلفية النموذج'),
(NULL, 'form_border_color', 'Form Border Color', 'Couleur De La Bordure Du Formulaire', 'لون حدود النموذج'),
(NULL, 'form_label_color', 'Form Label Color', 'Couleur De L\'étiquette Du Formulaire', 'لون تسمية النموذج'),
(NULL, 'form_input_field_background_color', 'Form Input Field Background Color', 'Couleur d\'arrière-plan du champ de saisie du formulaire', 'لون خلفية حقل إدخال النموذج'),
(NULL, 'input_field_border_color', 'Input Field Border Color', 'Couleur De La Bordure Du Champ De Saisie', 'لون حدود حقل الإدخال'),
(NULL, 'input_field_color', 'Input Field Color', 'Couleur Du Champ De Saisie', 'لون حقل الإدخال'),
(NULL, 'verify_profile', 'Verify Profile', 'Vérifier Le Profil', 'تحقق من الملف الشخصي'),
(NULL, 'contact_with_us', 'Contact With Us', 'En Contact Avec Nous', 'اتصل بنا'),
(NULL, 'working_hours', 'Working Hours', 'Heures D\'ouverture', 'ساعات العمل'),
(NULL, 'phone_number', 'Phone Number', 'Numéro De Téléphone', 'رقم الهاتف'),
(NULL, 'bank_payment', 'Bank Payment', 'Paiement Bancaire', 'بنك'),
(NULL, 'themes_setting', 'Themes Setting', 'Réglage Des Thèmes', 'إعداد السمات'),
(NULL, 'page_content_list', 'Page Content List', 'Liste Du Contenu De La Page', 'قائمة محتويات الصفحة'),
(NULL, 'notice_list', 'Notice List', 'Liste Des Avis', 'قائمة الإشعارات'),
(NULL, 'category_list', 'Category List', 'Liste Des Catégories', 'قائمة الفئات'),
(NULL, 'social_link_list', 'Social Link List', 'Liste De Liens Sociaux', 'الرابط الاجتماعي'),
(NULL, 'advertisement_list', 'Advertisement List', 'Liste Des Publicités', 'قائمة الإعلانات'),
(NULL, 'web_language_list', 'Web Language List', 'Liste Des Langues Web', 'قائمة لغة الويب'),
(NULL, 'coinpayment', 'Coinpayment', 'Paiement Par Pièces', 'الدفع بالعملة المعدنية'),
(NULL, 'gourl', 'Gourl', 'Gourle', 'جورل'),
(NULL, 'paypal', 'Paypal', 'Pay Pal', 'باي بال'),
(NULL, 'transaction_setup', 'Transaction Setup', 'Configuration Des Transactions', 'إعداد المعاملات'),
(NULL, 'external_api_list', 'External Api List', 'Liste D\'API Externes', 'قائمة Api الخارجية'),
(NULL, 'bank_payment', 'Bank', 'Bank', 'بنك'),
(NULL, 'coinpayment', 'Coinpayment', 'Coinpayment', 'الدفع بالعملة المعدنية'),
(NULL, 'gourl', 'Gourl', 'Gourl', 'جورل'),
(NULL, 'paypal', 'Paypal', 'Paypal', 'باي بال'),
(NULL, 'paystack', 'Paystack', 'Pile de paie', 'رواتب'),
(NULL, 'stripe', 'Stripe', 'Stripe', 'شريط'),
(NULL, 'token_payment', 'Token', 'Token', 'رمز'),
(NULL, 'page_content_list', 'Page Content List', 'Page Content List', 'قائمة محتويات الصفحة'),
(NULL, 'themes_setting', 'Themes Setting', 'Themes Setting', 'إعداد السمات'),
(NULL, 'notice_list', 'Notice List', 'Notice List', 'قائمة الإشعارات'),
(NULL, 'category_list', 'Category List', 'Category List', 'قائمة الفئات'),
(NULL, 'social_link_list', 'Social Link', 'Social Link', 'الرابط الاجتماعي'),
(NULL, 'advertisement_list', 'Advertisement List', 'Advertisement List', 'قائمة الإعلانات'),
(NULL, 'web_language_list', 'Web Language List', 'Web Language List', 'قائمة لغة الويب'),
(NULL, 'transaction_setup', 'Transaction Setup', 'Transaction Setup', 'إعداد المعاملات'),
(NULL, 'external_api_list', 'External Api List', 'External Api List', 'قائمة Api الخارجية'),
(NULL, 'verify_users', 'Verify Users', 'Verify Users', 'تحقق من المستخدمين'),
(NULL, 'subscriber_list', 'Subscriber List', 'Subscriber List', 'قائمة المشتركين'),
(NULL, 'order_book', 'Order Book', 'Order Book', 'سجل الطلبيات'),
(NULL, 'trades', 'trades', 'trades', 'الصفقات'),
(NULL, 'order_placement', 'Order Placement', 'Order Placement', 'ترتيب التنسيب'),
(NULL, 'search_pair', 'Search Pair', 'Search Pair', 'بحث عن زوج'),
(NULL, 'more', 'More', 'More', 'أكثر'),
(NULL, 'from_date', 'From Date', 'Partir De La Date', 'من التاريخ'),
(NULL, 'to_date', 'To Date', 'À Ce Jour', 'حتي اليوم'),
(NULL, 'coins', 'Coins', 'Pièces De Monnaie', 'عملات معدنية'),
(NULL, 'select_coin', 'Select Coin', 'Sélectionnez La Pièce', 'اختر عملة'),
(NULL, 'select_status', 'Select Status', 'Sélectionnez Le Statut', 'حدد الحالة'),
(NULL, 'trade_type', 'Trade Type', 'Type De Commerce', 'نوع التجارة'),
(NULL, 'select_trade_type', 'Select Trade Type', 'Sélectionnez Le Type De Commerce', 'حدد نوع التجارة'),
(NULL, 'open_trade', 'Open Trade', 'Commerce Ouvert', 'فتح التجارة'),
(NULL, 'complete_trade', 'Complete Trade', 'Commerce Complet', 'التجارة الكاملة'),
(NULL, 'canceled_trade', 'Canceled Trade', 'Commerce Annulé', 'التجارة الملغاة'),
(NULL, 'bid_type', 'Bid Type', 'Type D\'enchère', 'نوع العطاء'),
(NULL, 'select_bid_type', 'Select Bid Type', 'Sélectionnez Le Type D\'enchère', 'حدد نوع العطاء'),
(NULL, 'receiver', 'Receiver', 'Receveur', 'المتلقي'),
(NULL, 'paytm', 'Paytm', 'Paytm', 'Paytm'),
(NULL, 'merchant_key', 'Merchant Key', 'Clé du marchand', 'مفتاح التاجر'),
(NULL, 'merchant_mid', 'Merchant MID', 'MID marchand', 'تاجر MID'),
(NULL, 'paytm', 'Paytm', 'Paytm', 'Paytm'),
(NULL, 'admin_password', 'Admin Password', 'Mot De Passe D administrateur', 'كلمة سر المشرف'),
(NULL, 'admin_wallet', 'Admin Wallet', 'Portefeuille Administrateur', 'محفظة المسؤول'),
(NULL, 'coin_symbol', 'Coin Symbol', 'Coin Symbol F', 'رمز العملة'),
(NULL, 'initial_price', 'Initial Price', 'Initial Price Fr', 'السعر المبدئي'),
(NULL, 'coin_logo', 'Coin Logo', 'Logo De PiÃ¨ce De Monnaie', 'شعار العملة'),
(NULL, 'contract_address', 'Contract Address', 'Adresse de contact', 'عنوان العقد'),
(NULL, 'creator', 'Creator ', 'CrÃƒÂ©ateur', 'المنشئ'),
(NULL, 'proof_type', 'Proof Type', 'Preuve Type', 'نوع الإثبات'),
(NULL, 'add_coin', 'Add Coin', 'Ajouter une piÃƒÂ¨ce', 'أضف عملة'),
(NULL, 'token_symbol', 'Token Symbol', 'Token Symbol fr', 'رمز الرمز'),
(NULL, 'decimal_value', 'Decimal Value', 'valeur dÃƒÂ©cimale', 'قيمة عشرية'),
(NULL, 'creator_address', 'Creator Address', 'Adresse Du CrÃ©ateur', 'عنوان المنشئ'),
(NULL, 'deposit_confirm', 'Deposit Confirm', 'DÃ©pÃ´t Confirmer', 'تأكيد الإيداع'),
(NULL, 'balance_receive_from_user', 'Balance Receive From User', 'Solde ReÃ§u De L\'utilisateur', 'استلام الرصيد من المستخدم'),
(NULL, 'sent_user_balance', 'Sent User Balance', 'Solde De L\'utilisateur EnvoyÃ©', 'رصيد المستخدم المرسل'),
(NULL, 'decimal', 'Decimal ', 'DÃ©cimal', 'عدد عشري'),
(NULL, 'supply', 'Supply ', 'La Fourniture', 'إمداد'),
(NULL, 'position', 'Position ', 'Positionner', 'موقع'),
(NULL, 'server_ip', 'Server IP', 'IP Du Serveur', 'خادم IP'),
(NULL, 'database_name', 'Database Name', 'Nom De La Base De DonnÃ©es', 'اسم قاعدة البيانات'),
(NULL, 'user_name', 'User Name', 'Nom D\'utilisateur', 'اسم االمستخدم'),
(NULL, 'infura_id', 'Infura ID', 'Identifiant Infura', 'معرف Infura'),
(NULL, 'minimum_amount', 'Minimum Amount', 'Montant Minimal', 'الحد الأدنى للمبلغ'),
(NULL, 'maximum_amount', 'Maximum Amount', 'QuantitÃ© Maximale', 'الحد الأقصى للمبلغ'),
(NULL, 'documentation', 'Documentations', 'Documentations fr', 'التوثيق'),
(NULL, 'note', 'Note ', 'Noter', 'ملحوظة'),
(NULL, 'you_can_use_above_link_for_cron_job_copy_and_past_at_cron_job_command_box', 'You Can Use Above Link For Cron Job. Copy And Past At Cron Job Command Box', 'Vous Pouvez Utiliser Le Lien Ci-dessus Pour Le Travail Cron.', 'يمكنك استخدام الرابط أعلاه لوظيفة Cron. '),
(NULL, 'set_cron_job_once_per_2_minutes', 'Set Cron Job Once Per 2 Minutes', 'DÃ©finir La TÃ¢che Cron Une Fois Toutes Les 2 Minutes', 'اضبط وظيفة كرون مرة واحدة في دقيقتين'),
(NULL, 'set_cron_job_once_per_5_minutes', 'Set Cron Job Once Per 5 Minutes', 'DÃ©finir La TÃ¢che Cron Une Fois Toutes Les 5 Minutes', 'اضبط وظيفة كرون مرة واحدة كل 5 دقائق'),
(NULL, 'initial', 'Initial ', 'Initiale', 'مبدئي'),
(NULL, 'create_your_infura_account', 'Create Your Infura Account', 'CrÃ©ez Votre Compte Infura', 'قم بإنشاء حساب Infura الخاص بك'),
(NULL, 'data_not_found', 'Data Not Found', 'DonnÃ©es Non TrouvÃ©es', 'لم يتم العثور على بيانات'),
(NULL, 'fund_received', 'Fund Received', 'Fonds ReÃ§u', 'تم استلام الأموال'),
(NULL, 'please_note', 'Please Note', 'Veuillez Noter', 'يرجى الملاحظة'),
(NULL, 'coins_will_be_deposited_when_you_add_amount_in_this_wallet', 'Coins Will Be Deposited, When You Add Amount In This Wallet', 'Les PiÃ¨ces Seront DÃ©posÃ©es Lorsque Vous Ajoutez Un Montant Dans Ce Portefeuille', 'سيتم إيداع العملات المعدنية ، عند إضافة مبلغ في هذه المحفظة'),
(NULL, 'your_transaction_validity_24_hours_please_deposit_this_wallet_immediately', 'Your Transaction Validity 2 Hours  Please Deposit This Wallet Immediately', 'ValiditÃ© De Votre Transaction 2 Heures Veuillez DÃ©poser Ce Portefeuille ImmÃ©diatement', 'صصلاحية معاملتك ساعتين يرجى إيداع هذه المحفظة على الفور  '),
(NULL, 'server_error_please_try_again', 'Server Error Please Try Again', 'Erreur De Serveur, Veuillez RÃ©essayer', 'خطأ في الخادم ، يرجى المحاولة مرة أخرى'),
(NULL, 'please_enter_minimum_amount', 'Please Enter Minimum Amount', 'Veuillez Saisir Le Montant Minimum', 'الرجاء إدخال الحد الأدنى للمبلغ'),
(NULL, 'and_maximum_amount', 'And Maximum Amount', 'Et Montant Maximum', 'والمبلغ الأقصى'),
(NULL, 'token_logo_url', 'Token Logo Url', 'URL Du Logo Du Jeton', 'عنوان URL لشعار الرمز المميز'),
(NULL, 'this_symbol_already_exist', 'This Symbol Already Exist', 'Ce Symbole Existe DÃ©jÃ ', 'هذا الرمز موجود بالفعل'),
(NULL, 'this_url_is_invalid', 'This URL Is Invalid', 'Cette URL N\'est Pas Valide', 'عنوان URL هذا غير صالح'),
(NULL, 'coin_logo_not_found', 'Coin Logo Not Found', 'Logo De La PiÃ¨ce Introuvable', 'لم يتم العثور على شعار العملة'),
(NULL, 'coin_added_successfully', 'Coin Added Successfully', 'PiÃ¨ce AjoutÃ©e Avec SuccÃ¨s', 'تمت إضافة العملة بنجاح'),
(NULL, 'your_withdraw_transaction_successfully_sent_please_wait_for_confirmation', 'Your Withdraw Transaction Successfully Sent, Please Wait For Confirmation', 'Votre Transaction De Retrait A Ã©tÃ© EnvoyÃ©e Avec SuccÃ¨s, Veuillez Attendre La Confirmation', 'تم إرسال معاملة السحب الخاصة بك بنجاح ، يرجى انتظار التأكيد'),
(NULL, 'your_confirmation_already_placed', 'Your Confirmation Already Placed', 'Votre Confirmation DÃ©jÃ  PlacÃ©e', 'تم تقديم التأكيد الخاص بك بالفعل'),
(NULL, 'your_user_name_or_password_is_wrong', 'Your User Name Or Password Is Wrong', 'Votre Nom D\'utilisateur Ou Mot De Passe Est Incorrect', 'اسم المستخدم أو كلمة المرور الخاصة بك خاطئة'),
(NULL, 'don_not_use_your_existing_database_in_your_project_please_use_another_database', 'Don Not Use Your Existing Database In Your Project,please Use Another Database', 'N\'utilisez Pas Votre Base De DonnÃ©es Existante Dans Votre Projet, Veuillez Utiliser Une Autre Base De DonnÃ©es', 'لا تستخدم قاعدة البيانات الموجودة في مشروعك ، يرجى استخدام قاعدة بيانات أخرى'),
(NULL, 'this_symbol_already_exists', 'This Symbol Already Exists', 'Ce Symbole Existe DÃ©jÃ ', 'هذا الرمز موجود بالفعل'),
(NULL, 'market_symbol', 'Market Symbol', 'Symbole Du MarchÃ©', 'رمز السوق'),
(NULL, 'available_serial', 'Available Serial', 'sÃ©rie disponible', 'المسلسل المتاح'),
(NULL, 'erc20_wallet', 'ERC20 Wallet Address', 'Portefeuille ERC20', 'عنوان محفظة ERC20'),
(NULL, 'erc20_private_key', 'ERC20 Private Key', 'ClÃ© PrivÃ©e ERC20', 'المفتاح الخاص ERC20'),
(NULL, 'erc20', 'ERC20 ', 'ERC20 fr', 'ERC20'),
(NULL, 'admin_bep20_wallet_setup', 'Admin BEP20 Wallet Setup', 'Configuration Du Portefeuille Administrateur BEP20', 'إعداد المحفظة المسؤول BEP20'),
(NULL, 'erc20_coin', 'ERC20 Coin', 'PiÃ¨ce De Monnaie ERC20', 'عملة ERC20'),
(NULL, 'add_erc20_coin', 'Add ERC20 Coin', 'Add Coin ERC20', 'أضف عملة ERC20'),
(NULL, 'erc20_market', 'ERC20 Market', 'MarchÃ© ERC20', 'سوق ERC20'),
(NULL, 'erc20_coin_pair', 'ERC20 Coin Pair', 'Paire De PiÃ¨ces ERC20', 'زوج العملات ERC20'),
(NULL, 'create_erc20_wallet', 'Admin ERC20 Wallet Setup', 'Admin ERC20 Wallet Setup', 'إعداد المحفظة الإدارية ERC20'),
(NULL, 'erc20_balance', 'ERC20 Balance', 'Balance ERC20', 'ميزان ERC20'),
(NULL, 'erc20_diposit_address', 'ERC20 Deposit Address', 'Adresse de dépôt ERC20', 'عنوان الإيداع ERC20'),
(NULL, 'rpc_url', 'RPC URL', 'URL RPC', 'عنوان URL لـ RPC'),
(NULL, 'subscription_payment', 'Subscription Payment', 'Paiement de labonnement', 'دفع الاشتراك'),
(NULL, 'set_cron_job_once_per_5_hours', 'Set Cron Job Once Per 5 Hours', 'Set Cron Job Once Per 5 Hours', 'اضبط وظيفة كرون مرة واحدة كل 5 ساعات'),
(NULL, 'your_transaction_validity_24_hours__please_deposit_this_wallet_immediately', 'Your transaction validity 24 hours please deposit this wallet immediately', 'Your transaction validity 24 hours please deposit this wallet as soon as possible', 'صلاحية معاملتك 24 ساعة ، يرجى إيداع هذه المحفظة على الفور'),
(NULL, 'upload_pdf', 'Upload pdf file', 'Téléchargez le fichier pdf', 'تحميل ملف pdf'),
(NULL, 'link_with_pdf', 'Link page with a pdf file', 'Page de lien avec un fichier pdf', 'صفحة الارتباط بملف pdf'),
(NULL, 'site_description', 'Meta Description', 'Meta Description', 'ميتا الوصف'),
(NULL, 'site_keywords', 'Meta Keywords', 'Méta-mots clés', 'كلمات دلالية'),
(NULL, 'page_height', 'Pdf Container Height', 'Hauteur du conteneur PDF', 'ارتفاع حاوية PDF'),
(NULL, 'bep20', 'BEP20', 'BEP20', 'BEP20'),
(NULL, 'bep20_wallet_address', 'BEP20 Wallet Address', 'BEP20 Wallet Address', 'عنوان المحفظة BEP20'),
(NULL, 'bep20_private_key', 'BEP20 Private Key', 'BEP20 Private Key', 'المفتاح الخاص BEP20'),
(NULL, 'tearms_conditions_text', 'I agree with your Privacy Policy and Terms and Conditions.', 'Je suis d\'accord avec votre politique de confidentialité et vos conditions d\'utilisation.', 'أأوافق على سياسة الخصوصية والشروط والأحكام الخاصة بك.'),
(NULL, 'bank_address', 'Bank Address', 'Adresse de la banque', 'عنوان البنك'),
(NULL, 'sid', 'Account SID', 'ID du compte', 'SID الحساب'),
(NULL, 'auth_token', 'Auth Token', 'Jeton d\'authentification', 'رمز المصادقة'),
(NULL, 'phone_number', 'Phone Number', 'Numéro de téléphone', 'رقم الهاتف'),
(NULL, 'default_pair', 'Is Default Coin Pair', 'Est la paire de pièces par défaut', 'هو زوج العملات الافتراضي'),
(NULL, 'show_trademenu_without_verify', 'Is show trading menu without login', 'Est-ce que le menu de trading est affiché sans connexion', 'هو إظهار قائمة التداول دون تسجيل الدخول'),
(NULL, 'phone-verify', 'Verify Phone', 'Vérifier le téléphone', 'تحقق من الهاتف'),
(NULL, 'email-verify', 'Verify Email', 'Vérifier les courriels', 'التحقق من البريد الإلكتروني'),
(NULL, 'code_didnot_match', 'Verification code didn\'t match', 'Le code de vérification ne correspond pas', 'رمز التحقق غير متطابق'),
(NULL, 'verify_text_email', 'Please enter the verification code that has been sent to your email, in the box below.', 'Veuillez entrer le code de vérification qui a été envoyé à votre adresse e-mail, dans la case ci-dessous.', 'الرجاء إدخال رمز التحقق الذي تم إرساله إلى بريدك الإلكتروني ، في المربع أدناه.'),
(NULL, 'verify_text_phone', 'Please enter the verification code that has been sent to your phone, in the box below.', 'Veuillez entrer le code de vérification qui a été envoyé à votre téléphone, dans la case ci-dessous.', 'الرجاء إدخال رمز التحقق الذي تم إرساله إلى هاتفك في المربع أدناه.'),
(NULL, 'verify_email', 'Email address verify', 'Vérification de l\'adresse e-mail', 'التحقق من البريد الإلكتروني'),
(NULL, 'verify_code', 'Verification code', 'Le code de vérification', 'رمز التحقق'),
(NULL, 'verify_email', 'Email verify', 'Vérification de l\'e-mail', 'التحقق من البريد الإلكتروني'),
(NULL, 'verify_phone', 'Phone verify', 'Vérification du téléphone', 'التحقق من الهاتف'),
(NULL, 'fiat_deposit', 'Fiat Deposit', 'Dépôt Fiat', 'إيداع فيات'),
(NULL, 'crypto_deposit', 'Crypto Deposit', 'Dépôt cryptographique', 'إيداع العملات المشفرة'),
(NULL, 'deposit_type', 'Deposit Type', 'Type de dépôt', 'نوع الإيداع'),
(NULL, 'deposit_network', 'Select Network', 'Réseau de dépôt', 'اختر شبكة'),
(NULL, 'crypto', 'Crypto', 'Crypto', 'تشفير'),
(NULL, 'currency', 'Currency', 'Devise', 'عملة'),
(NULL, 'deposit_with', 'Deposit With', 'Dépôt avec', 'إيداع مع'),
(NULL, 'blockchain_network', 'Blockchain Network', 'Réseau Blockchain', 'شبكة Blockchain'),
(NULL, 'coin_not_supported', 'This coin is not supported at this network, Please deposit with payment gateway!', 'Cette pièce n\'est pas prise en charge sur ce réseau, veuillez déposer avec la passerelle de paiement !', 'هذه العملة غير مدعومة في هذه الشبكة ، يرجى الإيداع ببوابة الدفع!'),
(NULL, 'transaction_hash', 'Transaction Hash', 'Hachage des transactions', 'تجزئة الصفقة'),
(NULL, 'withdraw_with', 'Withdraw With', 'Retirer avec', 'سحب مع'),
(NULL, 'crypto_currency', 'Crypto Currency', 'Monnaie cryptographique', 'عملة مشفرة'),
(NULL, 'fiat_currency', 'Fiat Currency', 'Monnaie fiduciaire', 'عملة ورقية'),
(NULL, 'coin_not_supported_withdraw', 'This coin is not supported at this network, Please withdraw with payment gateway!', 'Cette pièce n\'est pas prise en charge sur ce réseau, veuillez retirer avec la passerelle de paiement !', 'هذه العملة غير مدعومة في هذه الشبكة ، يرجى السحب ببوابة الدفع!'),
(NULL, 'verify_code_not_match', 'Your verify code did not match.', 'Votre code de vérification ne correspond pas.', 'رمز التحقق الخاص بك غير متطابق.'),
(NULL, 'fiat_withdraw_list', 'Fiat Withdraw List', 'Fiat retirer la liste', 'قائمة سحب فيات'),
(NULL, 'crypto_withdraw_list', 'Crypto Withdraw List', 'Liste de retrait de crypto', 'قائمة سحب العملات المشفرة'),
(NULL, 'processing', 'Processing..', 'Traitement..', 'يعالج..'),
(NULL, 'search', 'Search', 'chercher', 'يبحث'),
(NULL, 'profile_verification', 'Profile Verification', 'Vérification du profil', 'التحقق من الملف الشخصي'),
(NULL, 'login_successfully', 'You Are Logged In Successfully!', 'Vous êtes connecté avec succès !', 'لقد تم تسجيل دخولك بنجاح!'),
(NULL, 'cuurent_passowrd', 'Current Password', 'Mot de passe actuel', 'كلمة المرور الحالية'),
(NULL, 'current_passowrd', 'Current Password', 'Mot de passe actuel', 'كلمة المرور الحالية'),
(NULL, 'current_password', 'Current Password', 'Mot de passe actuel', 'كلمة المرور الحالية'),
(NULL, 'current_password', 'Current Password', 'Mot de passe actuel', 'كلمة المرور الحالية'),
(NULL, 'kyc_verify_success', 'KYC verify success', 'KYC vérifie le succès', 'تحقق KYC من النجاح'),
(NULL, 'kyc_verify_cancel', 'KYC verify cancel', 'KYC vérifier annuler', 'التحقق من KYC إلغاء'),
(NULL, 'kyc_verify', 'KYC Verify', 'KYC vérifie', 'تحقق  KYC'),
(NULL, 'kyc_verify_cancel', 'KYC verify cancel', 'KYC vérifier annuler', 'التحقق من KYC إلغاء'),
(NULL, 'verification_processing', 'Your verification already processing!', 'Votre vérification est déjà en cours de traitement !', 'التحقق الخاص بك قيد المعالجة بالفعل!'),
(NULL, 'require_verify', 'Required verification for showing trade menu', 'Vérification requise pour afficher le menu commercial', 'التحقق المطلوب لإظهار قائمة التجارة'),
(NULL, 'popular_cryptocurrencies', 'Popular cryptocurrencies', 'Crypto-monnaies populaires', 'العملات المشفرة الشعبية'),
(NULL, 'all_cryptos', 'All Cryptos', 'All Cryptos', 'جميع العملات المشفرة'),
(NULL, 'node_server_setup', 'Node Server Setup', 'configuration du serveur de nœuds', 'إعداد خادم العقدة'),
(NULL, 'bep20_coin', 'BEP20 Coin', 'Pièce De Monnaie Bep20', 'عملة BEP20'),
(NULL, 'add_bep20_coin', 'Add BEP20 Coin', 'Ajouter Une Pièce Bep20', 'أضف عملة BEP20'),
(NULL, 'bep20_market', 'Bep20 Market', 'Marché Bep20', 'سوق Bep20'),
(NULL, 'bep20_coin_pair', 'BEP20 Coin Pair', 'Paire De Pièces BEP20', 'زوج عملة BEP20'),
(NULL, 'bep20_transaction_setup', 'Bep20 Transaction Setup', 'Configuration Des Transactions BEP20', 'إعداد المعاملات Bep20'),
(NULL, 'bep20_balance', 'BEP20 Balance', 'Solde Bep20', 'BEP20 الرصيد'),
(NULL, 'bep20_diposit_address', 'Bep20 Deposit Address', 'Bep20 Adresse De Dépôt', 'عنوان إيداع Bep20'),
(NULL, 'bep20_coin_list', 'BEP20 Coin List', 'Liste De Pièces BEP20', 'قائمة العملات المعدنية BEP20'),
(NULL, 'find_your_rpc_url_from_here', 'Find your RPC URL from here.', 'Trouvez votre URL RPC à partir de maintenant ici.', 'ابحث عن عنوان URL الخاص بـ RPC من هنا.'),
(NULL, 'add_coin', 'Add Coin', 'Ajouter une pièce', 'أضف عملة'),
(NULL, 'add_erc20_coin', 'ADD ERC20 COIN', 'AJOUTER UNE PIÈCE ERC20', 'إضافة عملة ERC20'),
(NULL, 'add_bep20_coin', 'ADD BEP20 COIN', 'AJOUTER UNE PIÈCE BEP20', 'إضافة عملة BEP20'),
(NULL, 'report', 'Report', 'Signaler', 'تقرير'),
(NULL, 'trading_view_chart', 'TradingView Chart', 'Graphique de Tradingview', 'مخطط عرض التداول'),
(NULL, 'original_chart', 'Original Chart', 'Graphique d\'origine', 'الرسم البياني الأصلي'),
(NULL, 'receivable_amount', 'Receivable amount:', 'Montant à recevoir :', 'المبلغ المستحق:'),
(NULL, 'payeer_wallet', 'Payeer Wallet ', 'Portefeuille Payeur', 'محفظة بايير'),
(NULL, 'sign_out', 'Sign Out', 'Se déconnecter', 'خروج'),
(NULL, 'node_server_setup', 'Node Server Setup', 'Configuration du serveur de nœud', 'إعداد خادم العقدة'),
(NULL, 'admin_bep20_wallet_setup', 'Admin BEP20 Wallet Setup', 'Configuration du portefeuille administrateur BEP20', 'إعداد المحفظة المسؤول BEP20'),
(NULL, 'coin_request_bep20', 'Coin Request BEP20', 'Demande de pièces BEP20', 'طلب عملة BEP20'),
(NULL, 'documentation', 'Documentation', 'Documentation', 'توثيق'),
(NULL, 'addons', 'Addons', 'Compléments', 'الإضافات'),
(NULL, 'tutorial', 'Tutorial', 'Didacticiel', 'الدورة التعليمية'),
(NULL, 'support', 'Support', 'Soutien', 'الدعم'),
(NULL, 'network_type', 'Network Type', 'Type de réseau', 'نوع الشبكة'),
(NULL, 'requested', 'Requested', 'Demandé', 'مطلوب'),
(NULL, 'verify_manually', 'Verify manually', 'Vérifier manuellement', 'تحقق يدويًا'),
(NULL, 'minimum_limit', 'Minimum Limit', 'Limite minimale', 'الحد الأدنى'),
(NULL, 'maximum_weekly_limit', 'Maximum Weekly Limit', 'Limite hebdomadaire maximale', 'الحد الأسبوعي الأقصى'),
(NULL, 'monthly_limit', 'Monthly Limit', 'Limite mensuelle', 'الحد الشهري'),
(NULL, 'yearly_limit', 'Yearly Limit', 'Limite annuelle', 'الحد السنوي'),
(NULL, 'to', 'To', 'À', 'إلى'),
(NULL, 'gateway', 'Gateway', 'passerelle', 'بوابة'),
(NULL, 'add_phrase', 'Add Phrase', 'Ajouter une phrase', 'أضف عبارة'),
(NULL, 'label', 'Label', 'Étiquette', 'مُلصَق'),
(NULL, 'edit_phrase', 'Edit Phrase', 'Modifier La Phrase', 'تحرير العبارة'),
(NULL, 'search_phrase_or_label', 'Search Phrase OR Label', 'Rechercher une expression OU une étiquette', 'عبارة البحث أو التسمية'),
(NULL, 'import_phrase', 'Import Phrase', 'Importer une phrase', 'استيراد العبارة'),
(NULL, 'export_phrase', 'Export Phrase', 'Exporter la phrase', 'عبارة التصدير'),
(NULL, 'get_your_API_key', 'Get Your API Key', 'Obtenez votre clé API', 'احصل على مفتاح API الخاص بك'),
(NULL, 'create_account', 'Create Account', 'Créer un compte', 'إصنع حساب'),
(NULL, 'manual', 'Manual', 'Manuel', 'يدوي'),
(NULL, 'automatic', 'Automatic', 'Automatique', 'تلقائي'),
(NULL, 'debuging_active', 'Debuging Active', 'Débogage actif', 'التصحيح نشط'),
(NULL, 'supported_coin_text', 'Please enter all supported coin by (,) separate with no space like: BTC,ETH,LTC so on... ', 'Veuillez saisir toutes les pièces prises en charge par (,) séparément sans espace comme : BTC, ETH, LTC, etc.', 'الرجاء إدخال جميع العملات المدعومة بواسطة (،) منفصلة بدون مسافة مثل: BTC ، ETH ، LTC ، إلخ ...'),
(NULL, 'suported_coin', 'Suported Coin', 'Pièce prise en charge', 'العملة المدعومة'),
(NULL, 'debug_email', 'Debug Email', 'E-mail de débogage', 'تصحيح أخطاء البريد الإلكتروني'),
(NULL, 'secret', 'Secret', 'Secrète', 'سر'),
(NULL, 'your_merchant_id', 'Your Merchant ID', 'Votre identifiant marchand', 'معرف التاجر الخاص بك'),
(NULL, 'callback_url', 'Callback Url', 'URL de rappel', 'عاود الاتصال بالعنوان'),
(NULL, 'cancel_url', 'Cancel Url', 'URL d\'annulation', 'إلغاء عنوان Url'),
(NULL, 'success_url', 'Success Url', 'URL de réussite', 'رابط النجاح'),
(NULL, 'mode', 'Mode', 'Mode', 'الوضع'),
(NULL, 'live', 'Live', 'Vivre', 'يعيش'),
(NULL, 'Sandbox', 'SandBox', 'Bac à sable', 'SandBox'),
(NULL, 'get_api_key', 'Get API Key', 'Obtenir la clé API', 'احصل على مفتاح API'),
(NULL, 'api_key', 'API Key', 'clé API', 'مفتاح API'),
(NULL, 'premium', 'Premium', 'Prime', 'الممتازة'),
(NULL, 'free', 'Free', 'Libre', 'حر'),
(NULL, 'pay_with_card', 'Pay with Card', 'Payer par carte', 'الدفع بالبطاقة'),
(NULL, 'activated', 'Activated', 'Activé', 'مفعل'),
(NULL, 'theme_details', 'Theme Details', 'Détails du thème', 'تفاصيل الموضوع'),
(NULL, 'page_content', 'Page Content', 'Contenu de la page', 'محتوى الصفحة'),
(NULL, 'admin_erc20_wallet_setup', 'Admin ERC20 Wallet Setup', 'Configuration Du Portefeuille Administrateur ERC20', 'إعداد المحفظة المسؤول ERC20'),
(NULL, 'coin_request_erc20', 'Coin Request ERC20', 'Demande de pièces ERC20', 'طلب عملة ERC20'),
(NULL, 'allow_url_fopen', 'Its required the servers allow_url_fopen is enabled, should work well', 'Il est nécessaire que les serveurs allow_url_fopen soient activés, devraient bien fonctionner', 'مطلوب أن يتم تمكين الخوادم allow_url_fopen ، يجب أن تعمل بشكل جيد  '),
(NULL, 'server_configuration', 'Found in the server configuration by allow_url_fopen=Off', 'Trouvé dans la configuration du serveur par allow_url_fopen=Off', 'تم العثور عليه في تكوين الخادم عن طريق allow_url_fopen = Off');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `receiver_id` varchar(250) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL,
  `sender_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=unseen, 1=seen, 2=delete',
  `receiver_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=unseen, 1=seen, 2=delete',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  `image` varchar(255) DEFAULT NULL,
  `module_type` varchar(50) DEFAULT 'network',
  `directory` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `notification_type` varchar(45) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `details` longtext,
  `status` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SMS and Email notified data will be stored in this table.';

-- --------------------------------------------------------

--
-- Table structure for table `payeer_payments`
--

CREATE TABLE `payeer_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `m_operation_id` int(11) NOT NULL,
  `m_operation_ps` int(11) NOT NULL,
  `m_operation_date` varchar(100) NOT NULL,
  `m_operation_pay_date` varchar(100) NOT NULL,
  `m_shop` int(11) NOT NULL,
  `m_orderid` varchar(300) NOT NULL,
  `m_amount` varchar(100) NOT NULL,
  `m_curr` varchar(100) NOT NULL,
  `m_desc` varchar(300) NOT NULL,
  `m_status` varchar(100) NOT NULL,
  `m_sign` mediumtext NOT NULL,
  `lang` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateway`
--

CREATE TABLE `payment_gateway` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `getway_type` enum('Crypto','Fiat') DEFAULT 'Fiat',
  `identity` varchar(50) NOT NULL,
  `agent` varchar(100) NOT NULL,
  `public_key` text NOT NULL,
  `private_key` text NOT NULL,
  `shop_id` varchar(100) NOT NULL,
  `secret_key` varchar(100) NOT NULL,
  `data` text NOT NULL,
  `coinlist` text NULL,
  `status` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_gateway`
--


INSERT INTO `payment_gateway` (`id`, `getway_type`, `identity`, `agent`, `public_key`, `private_key`, `shop_id`, `secret_key`, `data`, `coinlist`, `status`) VALUES
(1, 'Crypto', 'bitcoin', 'GoUrl Payment', 'a:13:{s:7:\"bitcoin\";s:50:\"43137AACNNeySpeedcoin77SPDPUBaJBxvUGvX7KgmBcx9CGvb\";s:11:\"bitcoincash\";s:0:\"\";s:8:\"litecoin\";s:0:\"\";s:4:\"dash\";s:0:\"\";s:8:\"dogecoin\";s:0:\"\";s:9:\"speedcoin\";s:50:\"43137AACNNeySpeedcoin77SPDPUBaJBxvUGvX7KgmBcx9CGvb\";s:8:\"reddcoin\";s:0:\"\";s:7:\"potcoin\";s:0:\"\";s:11:\"feathercoin\";s:0:\"\";s:8:\"vertcoin\";s:0:\"\";s:8:\"peercoin\";s:0:\"\";s:12:\"monetaryunit\";s:0:\"\";s:17:\"universalcurrency\";s:0:\"\";}', 'a:13:{s:7:\"bitcoin\";s:50:\"43137AACNNeySpeedcoin77SPDPRVyzic8CEewfdazdv9HwdH2\";s:11:\"bitcoincash\";s:0:\"\";s:8:\"litecoin\";s:0:\"\";s:4:\"dash\";s:0:\"\";s:8:\"dogecoin\";s:0:\"\";s:9:\"speedcoin\";s:50:\"43137AACNNeySpeedcoin77SPDPRVyzic8CEewfdazdv9HwdH2\";s:8:\"reddcoin\";s:0:\"\";s:7:\"potcoin\";s:0:\"\";s:11:\"feathercoin\";s:0:\"\";s:8:\"vertcoin\";s:0:\"\";s:8:\"peercoin\";s:0:\"\";s:12:\"monetaryunit\";s:0:\"\";s:17:\"universalcurrency\";s:0:\"\";}', '', '', '', 'BTC,ETH,BCH,LTC,LTCT,DASH,DOGE,SPD,RDD,POT,FTC,VTC,PPC,MUE,UNIT,MHT', 1),
(2, 'Fiat', 'payeer', 'Payeer', '485146745', 'VsdHofTsuI6XOdjL', '', '', '', NULL, 1),
(3, 'Fiat', 'paystack', 'Paystack', 'pk_test_08e6678d24436a08e7cd2d236b4114c620811f9c', 'sk_test_ee101b8fea4c01b15631a16ded96b3a5c82b6540', '', 'efc16cf798cb00de6ef3', '', NULL, 1),
(4, 'Fiat', 'paypal', 'Paypal', 'AfmTkhn-GYb_HAsPayWeLDVTG39jNjGsJ3siJSNDs6QGr52KDLnAT28fIv4TVni5P3Dax8w1y-Libl_j', 'EHGJveSf9GJcbyQwgYmouRi9baBPKLPqeSYjYesiG4UJTSnQ45q3gwQdkB6TvFQAjkYm42D1P_Hqn340', '', 'sandbox', '', 'USD', 1),
(5, 'Fiat', 'stripe', 'Stripe', 'pk_test_BPLwYal0sn4KkKaDTzuj5oRq', 'sk_test_6J6dcwXf8ruEZGCvlC09C9NK', '', '', '', 'USD', 1),
(6, 'Crypto', 'coinpayment', 'CoinPayments', '0ef5d693629164125849eee7f24deeea058fde91a232b3091525724a480c2c34', '0e1Efced49C5e902a4abF65A01e4F41c040f58aa48f4A6b041e0508D45dc1164', '', '', '{\"marcent_id\":\"f8224829cda4268f107089fd92a469c6\",\"ipn_secret\":\"Bdtask@#2021\",\"debug_email\":\"turan.vuiyan@gmail.com\",\"debuging_active\":1,\"withdraw\":\"1\"}', 'BCH,LTCT,DOGE,DASH,SPD,RDD,POT,FTC,VTC,PPC,MUE,UNIT,TCB,MHT,ETH,USDT,USDT,USDC,ADA,XRP,BUSD,DOT,DOGE,AVAX,MATIC,SHIB,DAI,UNI,UNI,TRX,WBTC,ETC,LEO,LTC,NEAR,LINK,FTX,CRO,ATOM,WFLOW,BCH,VET,FIL,APE,MANA,SAND,XTZ,AXS,AAVE,QNT,EGLD,OKB,EOS,TUSD,TUSD,ZEC,CHZ,MKR,FTM,GRT,IOTA,BTT,USDP,PAX,LDO,CEL,HT,CRV,USDD,USDD,BAT,USDN,USDN,LRC,ENJ,ZIL,PAXG,GMT,NEXO,KAVA,1INCH,wROSE,GNO,CVX,TWT,GALA,GALA,COMP,SNX,HOT,ANKR,YFI,BTC,BNB', 1);


-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `email_verify` tinyint(1) NOT NULL DEFAULT 0 COMMENT ' 0=Not required, 1= Required ',
  `phone_verify` tinyint(1) NOT NULL DEFAULT 0 COMMENT ' 0=Not required, 1= Required ',
  `kyc_verify` tinyint(1) NOT NULL DEFAULT 0 COMMENT ' 0=Not required, 1= Required ',
  `update_notification` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`setting_id`, `title`, `description`, `siteDescription`, `sitekeywords`, `email`, `phone`, `logo`, `logo_web`, `favicon`, `language`, `site_align`, `footer_text`, `time_zone`, `latitude`, `office_time`, `show_trademenu_without_verify`, `email_verify`, `phone_verify`, `kyc_verify`, `update_notification`) VALUES
(1, 'Tradebox', 'Bangladesh Office B-25, Mannan Plaza, 4th Floor, Khilkhet Dhaka-1229, Bangladesh', 'Tradebox is offering new Bitcoin cryptocurrencies to the world market. We serve our members with products built in a fairer, more accessible, and efficient manner.\r\n', 'Tradebox, Buy, Crypto, Cryptocurrency Bitcoin US Dollar, Bitcoin Singapore Dollar, Bitcoin Canadian Dollar, Bitcoin Euro, Bitcoin Pound Sterling, Bitcoin Digital Gold, Bitcoin Platinum, Bitcoin Premium, Bitcoin US Dollar', 'business@bdtask.com', '+8801817584639 ', 'upload/settings/1660942254_c0c7ebf8e316fc6319ca.png', 'upload/settings/1660941959_856ff5d21bed33f3e16e.png', 'upload/settings/1660941090_3c8e4821460122facc6a.png', 'english', 'LTR', '2022 © Copyright Tradebox', 'Europe/Paris', '40.6700, -73.9400', 'Monday - Friday: 08:00 - 22:00\r\nSaturday, Sunday: Closed', 1, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sms_email_send_setup`
--

CREATE TABLE `sms_email_send_setup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `method` text NOT NULL,
  `deposit` int(11) DEFAULT NULL,
  `transfer` int(11) DEFAULT NULL,
  `withdraw` int(11) DEFAULT NULL,
  `payout` int(11) DEFAULT NULL,
  `commission` int(11) DEFAULT NULL,
  `team_bonnus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_email_send_setup`
--

INSERT INTO `sms_email_send_setup` (`id`, `method`, `deposit`, `transfer`, `withdraw`, `payout`, `commission`, `team_bonnus`) VALUES
(1, 'email', 1, 1, 1, NULL, NULL, NULL),
(2, 'sms', 1, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'tradebox_Default_Theme', 1, '2021-01-18 12:54:13', '2021-03-27 10:57:46');

-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- Table structure for table `web_category`
--

CREATE TABLE `web_category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) NOT NULL,
  `cat_name_en` varchar(100) NOT NULL,
  `cat_name_fr` varchar(100) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `cat_image` varchar(300) DEFAULT NULL,
  `cat_title1_en` varchar(100) DEFAULT NULL,
  `cat_title1_fr` varchar(100) DEFAULT NULL,
  `cat_title2_en` varchar(300) DEFAULT NULL,
  `cat_title2_fr` varchar(300) DEFAULT NULL,
  `menu` int(11) DEFAULT NULL COMMENT 'Header menu=1',
  `position_serial` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `web_category`
--

INSERT INTO `web_category` (`cat_id`, `slug`, `cat_name_en`, `cat_name_fr`, `parent_id`, `cat_image`, `cat_title1_en`, `cat_title1_fr`, `cat_title2_en`, `cat_title2_fr`, `menu`, `position_serial`, `status`) VALUES
(1, 'home', 'Home', 'Maison', 0, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 1, 1, 1),
(4, 'exchange', 'Exchange', 'Échange', 0, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', 'Exchange', '', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that', '', 1, 4, 1),
(8, 'about', 'About', 'Sur', 0, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', 'About Us', '', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that', '', 0, NULL, 1),
(9, 'news', 'News', 'Nouvelles', 0, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', 'Latest form our blog', '', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that', '', NULL, NULL, 1),
(16, 'register', 'Register', 'Register', 0, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, 0, 1),
(17, 'forgot-password', 'Forgot Password', 'Mot de Passe oublié', 0, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, NULL, 1),
(19, 'btc', 'BTC', '', 9, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, NULL, 1),
(20, 'eth', 'ETH', 'ETH', 9, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, 0, 1),
(21, 'ltc', 'LTC', 'LTC', 9, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, 0, 1),
(22, 'dash', 'DASH', 'DASH', 9, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, 0, 1),
(24, 'blockchain', 'Blockchain', 'Blockchain', 9, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, 0, 1),
(25, 'trading', 'Trading', 'Trading', 9, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, 0, 1),
(26, 'news-details', 'News Details', 'News Details', 0, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, 0, 1),
(27, 'mining', 'Mining', '', 9, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, NULL, 1),
(28, 'terms', 'Terms', 'terms', 1, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', 'term title english', 'turki title', 'category title english', 'dsf', 2, NULL, 1),
(29, 'notice', 'Notice', 'Noticeo', 0, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', '', '', '', '', 0, NULL, 1),
(30, 'faq', 'FAQ', 'FAQ', 30, 'upload/1613365281_db9ef32ca3cf3baef08f.jpg', ' Frequently asked questions', ' Frequently asked questions', ' frequently asked questions', ' Frequently asked questions', 2, NULL, 1),
(31, 'welcome-text', 'Welcome Text', 'Welcome Text', 0, '', 'Welcome Text', 'Welcome Text', '', '', 0, NULL, 1),
(32, 'coin-list', 'Coin List', 'Coin List', 0, 'upload/1613365281_db9ef32ca3cf3baef089.jpg', 'Coin List', 'Coin List', '', '', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `web_article`
--

CREATE TABLE `web_article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) DEFAULT NULL,
  `headline_en` varchar(300) DEFAULT NULL,
  `headline_fr` varchar(300) DEFAULT NULL,
  `pdflink` tinyint(4) NOT NULL DEFAULT '0',
  `article_pdf` varchar(150) DEFAULT NULL,
  `pageHeight` int(11) NOT NULL DEFAULT '800',
  `article_image` varchar(100) DEFAULT NULL,
  `custom_url` varchar(300) NOT NULL,
  `article1_en` longtext NOT NULL,
  `article1_fr` longtext NOT NULL,
  `article2_en` longtext NOT NULL,
  `article2_fr` longtext NOT NULL,
  `video` varchar(300) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `page_content` int(11) DEFAULT '0' COMMENT 'if this is a Page content set 1 else 0',
  `position_serial` int(11) NOT NULL,
  `publish_date` datetime NOT NULL,
  `publish_by` varchar(20) NOT NULL,
  `edit_history` int(11) NOT NULL,
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `web_article`
--

INSERT INTO `web_article` (`article_id`, `slug`, `headline_en`, `headline_fr`, `pdflink`, `article_pdf`, `pageHeight`, `article_image`, `custom_url`, `article1_en`, `article1_fr`, `article2_en`, `article2_fr`, `video`, `cat_id`, `page_content`, `position_serial`, `publish_date`, `publish_by`, `edit_history`) VALUES
(1, NULL, 'Contact', 'Contact Français Français Français Français Turkey', 0, NULL, 800, NULL, '', '1355 Market Street, Suite 900 San Francisco, CA 94103', '<div>\r\n<p>Phone <font color=\"#72afd2\"><span xss=removed>+1 (514) 352-1010</span></font><br>Fax <span xss=removed>+1 (514) 352-7511</span></p></div>', '<ul class=\"opening_hours\">\r\n <li>\r\n<p>Monday-Wednesday</p>\r\n <p>10 am - 6 pm</p></li>\r\n</ul>', '', NULL, 12, 0, 0, '2020-09-15 12:02:49', 'admin@demo.com', 0),
(2, NULL, 'Marketing Consultancy', 'Lorem ipsum ', 0, NULL, 800, NULL, '', 'write your answer\r\n', 'write your answer\r\n', '', '', NULL, 30, 0, 0, '2021-03-10 03:09:55', 'admin@demo.com', 0),
(3, NULL, NULL, NULL, 0, NULL, 800, NULL, '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam finibus vestibulum lacus non sodales. Aenean pretium augue tellus.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam finibus vestibulum lacus non sodales. Aenean pretium augue tellus.', '', '', NULL, 29, 0, 0, '2020-09-15 12:26:52', 'admin@demo.com', 0),
(4, NULL, NULL, NULL, 0, NULL, 800, NULL, '', 'Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. ', 'Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. ', '', '', NULL, 29, 0, 0, '2018-10-10 10:56:25', 'admin@demo.com', 0),
(5, NULL, NULL, NULL, 0, NULL, 800, NULL, '', 'Te cum mutat malorum. Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. ', 'Te cum mutat malorum. Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. ', '', '', NULL, 29, 0, 0, '2018-10-10 10:56:55', 'admin@demo.com', 0),
(6, NULL, NULL, NULL, 0, NULL, 800, NULL, '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Iam id ipsum absurdum, maximum malum neglegi. Satisne ergo pudori consulat, si quis sine teste libidini pareat?', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Iam id ipsum absurdum, maximum malum neglegi. Satisne ergo pudori consulat, si quis sine teste libidini pareat?', '', '', NULL, 29, 0, 0, '2018-10-10 10:58:48', 'admin@demo.com', 0),
(7, 'Make Each <span>Price Spike</span> And Dip Count', 'Make Each <span>Price Spike</span> And Dip Count', 'Make Each <span>Price Spike</span> And Dip Count', 0, NULL, 800, '', '', '<p><span style=\"color: rgb(165, 165, 165); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 15px; text-align: center;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum.</span><br></p>', '<p><span style=\"color: rgb(165, 165, 165); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 15px; text-align: center;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum.</span><br></p>', '', '', '', 34, 1, 1, '2018-11-03 06:15:00', 'admin@demo.com', 0),
(8, 'WELCOME TO Tradebox', 'WELCOME TO Tradebox', 'WELCOME TO Tradebox', 0, NULL, 800, '', '', '<p><span style=\"font-size:12pt\"><span style=\"font-size:13.5pt\"><span style=\"color:black\">Tradebox is offering new Bitcoin cryptocurrencies to the world market. We serve our members with products built in a fairer, more accessible, and efficient manner. </span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-size:13.5pt\"><span style=\"color:black\">We are a decentralized exchange (DEX) focused on&nbsp;offering a premier trading experience.&nbsp; </span></span></span></p>', '<p><span style=\"font-size:12pt\"><span style=\"font-size:13.5pt\"><span style=\"color:black\">TIMEx - True Internet Money Exchange is a new, wholly USA-based, and TIMEx-owned exchange platform offering new Bitcoin cryptocurrencies to the world market. We serve our members with products built in a fairer, more accessible, and efficient manner. </span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-size:13.5pt\"><span style=\"color:black\">We are a decentralized exchange (DEX) focused on&nbsp;offering a premier trading experience.&nbsp; </span></span></span></p>', '', '', '', 31, 1, 1, '2018-11-03 06:15:00', 'admin@demo.com', 0),
(9, NULL, 'Coin List', 'Coin List', 0, NULL, 0, '', '', '', '', '', '', '', 32, 1, 1, '2022-08-13 11:25:02', 'info@admin.com', 0),
(10, NULL, 'Terms', 'Terms', 0, NULL, 0, '', '', '', '', '', '', '', 28, 1, 1, '2022-08-13 11:25:02', 'info@admin.com', 0);

--
-- Table structure for table `web_language`
--

CREATE TABLE `web_language` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `flag` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `web_language`
--

INSERT INTO `web_language` (`id`, `name`, `flag`) VALUES
(1, 'English ', 'en'),
(2, 'Frence ', 'fr');

-- --------------------------------------------------------

--
-- Table structure for table `web_news`
--

CREATE TABLE `web_news` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) DEFAULT NULL,
  `headline_en` varchar(300) NOT NULL,
  `headline_fr` varchar(300) NOT NULL,
  `article_image` varchar(100) DEFAULT NULL,
  `custom_url` varchar(300) NOT NULL,
  `article1_en` longtext NOT NULL,
  `article1_fr` longtext NOT NULL,
  `article2_en` longtext NOT NULL,
  `article2_fr` longtext NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `position_serial` int(11) NOT NULL,
  `publish_date` datetime NOT NULL,
  `publish_by` varchar(20) NOT NULL,
  `edit_history` int(11) NOT NULL,
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `web_news`
--

INSERT INTO `web_news` (`article_id`, `slug`, `headline_en`, `headline_fr`, `article_image`, `custom_url`, `article1_en`, `article1_fr`, `article2_en`, `article2_fr`, `cat_id`, `parent_id`, `position_serial`, `publish_date`, `publish_by`, `edit_history`) VALUES
(4, 'south-africa-puts-onus-on-taxpayers-to-declare-all-cryptocurrency-income', 'South Africa Puts Onus on Taxpayers to Declare All Cryptocurrency Income', '', 'upload/news/166e293c430bdf835f0c6d6a127e4e13.jpg', '', '<div>Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. Autem ullum cu sed. Id per enim deserunt, vel an choro dolores voluptatum. His viderer civibus te, quis vero timeam te mel. Meis nulla nec id. Te eros ubique ius.</div><div><br></div><div>Pri nisl velit at. Ei lobortis forensibus dissentiunt sit, ius idque veritus in, in aeterno invenire usu. Esse inani inermis eam ea. Justo perfecto dignissim an pri, ea sit dico neglegentur, id mundi maiestatis vel. Eos eu stet dicit. Porro suscipiantur id usu, antiopam moderatius sit ne. Ei nulla torquatos ullamcorper sed, no stet graece instructior vel, eirmod vulputate an duo.</div><div><br></div><div>Splendide laboramus eam cu, veritus singulis vel et, essent assentior an vim. Prima paulo ut mei, no tota erat eam. Constituam consequuntur his ad. Ad ius libris labore, ex sumo regione eos. No ius vero apeirian.</div><div><br></div><div>Mollis integre persius ad nam. At agam constituam sit, an mea dolores iracundia conceptam, vis no atqui verear detracto. Et fugit ridens intellegam duo, eu facilisi erroribus duo. Et vix homero verear liberavisse, natum nonumes splendide usu at. Ea vis meliore offendit intellegebat. Ne mazim philosophia usu.</div><div><br></div><div>At mazim tacimates per. Ne reque tractatos mel, at eos case commodo. Cu animal constituam pri, ea nam ceteros copiosae philosophia. Ei modo fuisset pertinax vim, id vis tacimates interpretaris mediocritatem. Vel no esse scripserit, nostrum tacimates his te.</div><div><br></div><div>Corpora postulant voluptatum nam eu. Cum te agam delectus ullamcorper, nostrum perfecto an nam. Ne quo accusata adversarium, illud efficiantur te nam. At veri simul virtute mei, deleniti persecuti te mei. Ludus animal eam cu, an nulla prompta imperdiet vis. Est cu dicam soluta everti.</div><div><br></div><div>Aliquam feugait perfecto per ne, an adolescens sententiae vis, his no noster animal. At vim vidit apeirian appellantur, no graecis invidunt sea. Illud oblique ad ius, eum no partem consectetuer, equidem incorrupte cum cu. At usu docendi tibique evertitur. Duis deserunt pri at. Aeque tempor usu et, ex illum facer efficiendi nam.</div><div><br></div><div>Vel quodsi iracundia ne, eu audiam tibique mnesarchum est. Diam oporteat suavitate pri id. Eos latine euripidis ad, ad mei partem accommodare, nam at elitr vitae voluptaria. Id sea ceteros suscipiantur. Ne per viderer tacimates repudiare, sed id quaestio cotidieque. Ei hinc dolor putent usu, falli lucilius nam at.</div><div><br></div><div>Aperiam detracto qualisque cu sea, sea te deleniti scripserit. Option feugiat sit ei. Labore volumus instructior eos ne, id graecis antiopam assueverit vel, no appetere argumentum eloquentiam quo. Error option dolorum nam cu. Vim tantas populo et, te mea quem quando decore.</div><div><br></div><div>Duo ad elit aperiam. Et error aliquip mea. Cum ut facete assentior, ei vis dictas erroribus salutatus. Mea eu iusto volumus argumentum, sed eu quando regione indoctum.</div>', '', '', '', 21, NULL, 0, '2018-07-10 09:11:16', 'admin@demo.com', 0),
(5, 'neo-eos-litecoin-iota-and-stellar-technical-analysis-april-9-2018', 'NEO, EOS, Litecoin, IOTA and Stellar: Technical Analysis April 9, 2018', '', 'upload/news/b731dbe9143e088de015c0c844d40105.jpg', '', '<div>Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. Autem ullum cu sed. Id per enim deserunt, vel an choro dolores voluptatum. His viderer civibus te, quis vero timeam te mel. Meis nulla nec id. Te eros ubique ius.</div><div><br></div><div>Pri nisl velit at. Ei lobortis forensibus dissentiunt sit, ius idque veritus in, in aeterno invenire usu. Esse inani inermis eam ea. Justo perfecto dignissim an pri, ea sit dico neglegentur, id mundi maiestatis vel. Eos eu stet dicit. Porro suscipiantur id usu, antiopam moderatius sit ne. Ei nulla torquatos ullamcorper sed, no stet graece instructior vel, eirmod vulputate an duo.</div><div><br></div><div>Splendide laboramus eam cu, veritus singulis vel et, essent assentior an vim. Prima paulo ut mei, no tota erat eam. Constituam consequuntur his ad. Ad ius libris labore, ex sumo regione eos. No ius vero apeirian.</div><div><br></div><div>Mollis integre persius ad nam. At agam constituam sit, an mea dolores iracundia conceptam, vis no atqui verear detracto. Et fugit ridens intellegam duo, eu facilisi erroribus duo. Et vix homero verear liberavisse, natum nonumes splendide usu at. Ea vis meliore offendit intellegebat. Ne mazim philosophia usu.</div><div><br></div><div>At mazim tacimates per. Ne reque tractatos mel, at eos case commodo. Cu animal constituam pri, ea nam ceteros copiosae philosophia. Ei modo fuisset pertinax vim, id vis tacimates interpretaris mediocritatem. Vel no esse scripserit, nostrum tacimates his te.</div><div><br></div><div>Corpora postulant voluptatum nam eu. Cum te agam delectus ullamcorper, nostrum perfecto an nam. Ne quo accusata adversarium, illud efficiantur te nam. At veri simul virtute mei, deleniti persecuti te mei. Ludus animal eam cu, an nulla prompta imperdiet vis. Est cu dicam soluta everti.</div><div><br></div><div>Aliquam feugait perfecto per ne, an adolescens sententiae vis, his no noster animal. At vim vidit apeirian appellantur, no graecis invidunt sea. Illud oblique ad ius, eum no partem consectetuer, equidem incorrupte cum cu. At usu docendi tibique evertitur. Duis deserunt pri at. Aeque tempor usu et, ex illum facer efficiendi nam.</div><div><br></div><div>Vel quodsi iracundia ne, eu audiam tibique mnesarchum est. Diam oporteat suavitate pri id. Eos latine euripidis ad, ad mei partem accommodare, nam at elitr vitae voluptaria. Id sea ceteros suscipiantur. Ne per viderer tacimates repudiare, sed id quaestio cotidieque. Ei hinc dolor putent usu, falli lucilius nam at.</div><div><br></div><div>Aperiam detracto qualisque cu sea, sea te deleniti scripserit. Option feugiat sit ei. Labore volumus instructior eos ne, id graecis antiopam assueverit vel, no appetere argumentum eloquentiam quo. Error option dolorum nam cu. Vim tantas populo et, te mea quem quando decore.</div><div><br></div><div>Duo ad elit aperiam. Et error aliquip mea. Cum ut facete assentior, ei vis dictas erroribus salutatus. Mea eu iusto volumus argumentum, sed eu quando regione indoctum.</div>', '', '', '', 21, NULL, 0, '2018-07-10 09:11:02', 'admin@demo.com', 0),
(6, 'why-invest-in-dash', 'Why Invest in Dash?', '', 'upload/news/9d5c09ab5b25569514fa852e2d2c1483.jpg', '', '<div>Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. Autem ullum cu sed. Id per enim deserunt, vel an choro dolores voluptatum. His viderer civibus te, quis vero timeam te mel. Meis nulla nec id. Te eros ubique ius.</div><div><br></div><div>Pri nisl velit at. Ei lobortis forensibus dissentiunt sit, ius idque veritus in, in aeterno invenire usu. Esse inani inermis eam ea. Justo perfecto dignissim an pri, ea sit dico neglegentur, id mundi maiestatis vel. Eos eu stet dicit. Porro suscipiantur id usu, antiopam moderatius sit ne. Ei nulla torquatos ullamcorper sed, no stet graece instructior vel, eirmod vulputate an duo.</div><div><br></div><div>Splendide laboramus eam cu, veritus singulis vel et, essent assentior an vim. Prima paulo ut mei, no tota erat eam. Constituam consequuntur his ad. Ad ius libris labore, ex sumo regione eos. No ius vero apeirian.</div><div><br></div><div>Mollis integre persius ad nam. At agam constituam sit, an mea dolores iracundia conceptam, vis no atqui verear detracto. Et fugit ridens intellegam duo, eu facilisi erroribus duo. Et vix homero verear liberavisse, natum nonumes splendide usu at. Ea vis meliore offendit intellegebat. Ne mazim philosophia usu.</div><div><br></div><div>At mazim tacimates per. Ne reque tractatos mel, at eos case commodo. Cu animal constituam pri, ea nam ceteros copiosae philosophia. Ei modo fuisset pertinax vim, id vis tacimates interpretaris mediocritatem. Vel no esse scripserit, nostrum tacimates his te.</div><div><br></div><div>Corpora postulant voluptatum nam eu. Cum te agam delectus ullamcorper, nostrum perfecto an nam. Ne quo accusata adversarium, illud efficiantur te nam. At veri simul virtute mei, deleniti persecuti te mei. Ludus animal eam cu, an nulla prompta imperdiet vis. Est cu dicam soluta everti.</div><div><br></div><div>Aliquam feugait perfecto per ne, an adolescens sententiae vis, his no noster animal. At vim vidit apeirian appellantur, no graecis invidunt sea. Illud oblique ad ius, eum no partem consectetuer, equidem incorrupte cum cu. At usu docendi tibique evertitur. Duis deserunt pri at. Aeque tempor usu et, ex illum facer efficiendi nam.</div><div><br></div><div>Vel quodsi iracundia ne, eu audiam tibique mnesarchum est. Diam oporteat suavitate pri id. Eos latine euripidis ad, ad mei partem accommodare, nam at elitr vitae voluptaria. Id sea ceteros suscipiantur. Ne per viderer tacimates repudiare, sed id quaestio cotidieque. Ei hinc dolor putent usu, falli lucilius nam at.</div><div><br></div><div>Aperiam detracto qualisque cu sea, sea te deleniti scripserit. Option feugiat sit ei. Labore volumus instructior eos ne, id graecis antiopam assueverit vel, no appetere argumentum eloquentiam quo. Error option dolorum nam cu. Vim tantas populo et, te mea quem quando decore.</div><div><br></div><div>Duo ad elit aperiam. Et error aliquip mea. Cum ut facete assentior, ei vis dictas erroribus salutatus. Mea eu iusto volumus argumentum, sed eu quando regione indoctum.</div>', '', '', '', 22, NULL, 0, '2018-07-10 09:10:50', 'admin@demo.com', 0),
(7, 'asic-resistance-increasingly-hot-topic-in-crypto-as-monero-forks', 'ASIC Resistance Increasingly Hot Topic in Crypto as Monero Forks', '', 'upload/news/32083222f2430503659756a60d3b0b6b.jpg', '', '<div>Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. Autem ullum cu sed. Id per enim deserunt, vel an choro dolores voluptatum. His viderer civibus te, quis vero timeam te mel. Meis nulla nec id. Te eros ubique ius.</div><div><br></div><div>Pri nisl velit at. Ei lobortis forensibus dissentiunt sit, ius idque veritus in, in aeterno invenire usu. Esse inani inermis eam ea. Justo perfecto dignissim an pri, ea sit dico neglegentur, id mundi maiestatis vel. Eos eu stet dicit. Porro suscipiantur id usu, antiopam moderatius sit ne. Ei nulla torquatos ullamcorper sed, no stet graece instructior vel, eirmod vulputate an duo.</div><div><br></div><div>Splendide laboramus eam cu, veritus singulis vel et, essent assentior an vim. Prima paulo ut mei, no tota erat eam. Constituam consequuntur his ad. Ad ius libris labore, ex sumo regione eos. No ius vero apeirian.</div><div><br></div><div>Mollis integre persius ad nam. At agam constituam sit, an mea dolores iracundia conceptam, vis no atqui verear detracto. Et fugit ridens intellegam duo, eu facilisi erroribus duo. Et vix homero verear liberavisse, natum nonumes splendide usu at. Ea vis meliore offendit intellegebat. Ne mazim philosophia usu.</div><div><br></div><div>At mazim tacimates per. Ne reque tractatos mel, at eos case commodo. Cu animal constituam pri, ea nam ceteros copiosae philosophia. Ei modo fuisset pertinax vim, id vis tacimates interpretaris mediocritatem. Vel no esse scripserit, nostrum tacimates his te.</div><div><br></div><div>Corpora postulant voluptatum nam eu. Cum te agam delectus ullamcorper, nostrum perfecto an nam. Ne quo accusata adversarium, illud efficiantur te nam. At veri simul virtute mei, deleniti persecuti te mei. Ludus animal eam cu, an nulla prompta imperdiet vis. Est cu dicam soluta everti.</div><div><br></div><div>Aliquam feugait perfecto per ne, an adolescens sententiae vis, his no noster animal. At vim vidit apeirian appellantur, no graecis invidunt sea. Illud oblique ad ius, eum no partem consectetuer, equidem incorrupte cum cu. At usu docendi tibique evertitur. Duis deserunt pri at. Aeque tempor usu et, ex illum facer efficiendi nam.</div><div><br></div><div>Vel quodsi iracundia ne, eu audiam tibique mnesarchum est. Diam oporteat suavitate pri id. Eos latine euripidis ad, ad mei partem accommodare, nam at elitr vitae voluptaria. Id sea ceteros suscipiantur. Ne per viderer tacimates repudiare, sed id quaestio cotidieque. Ei hinc dolor putent usu, falli lucilius nam at.</div><div><br></div><div>Aperiam detracto qualisque cu sea, sea te deleniti scripserit. Option feugiat sit ei. Labore volumus instructior eos ne, id graecis antiopam assueverit vel, no appetere argumentum eloquentiam quo. Error option dolorum nam cu. Vim tantas populo et, te mea quem quando decore.</div><div><br></div><div>Duo ad elit aperiam. Et error aliquip mea. Cum ut facete assentior, ei vis dictas erroribus salutatus. Mea eu iusto volumus argumentum, sed eu quando regione indoctum.</div>', '', '', '', 19, NULL, 0, '2018-07-17 10:30:35', 'admin@demo.com', 0),
(8, 'canadian-mining-giant-hyperblock-acquires-cryptoglobal-for-106-million', 'CANADIAN MINING GIANT HYPERBLOCK ACQUIRES CRYPTOGLOBAL FOR $106 MILLION', '', 'upload/news/e56c8562afa3795f3c4c3ecccc3bfa83.jpg', '', '<div>Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. Autem ullum cu sed. Id per enim deserunt, vel an choro dolores voluptatum. His viderer civibus te, quis vero timeam te mel. Meis nulla nec id. Te eros ubique ius.</div><div><br></div><div>Pri nisl velit at. Ei lobortis forensibus dissentiunt sit, ius idque veritus in, in aeterno invenire usu. Esse inani inermis eam ea. Justo perfecto dignissim an pri, ea sit dico neglegentur, id mundi maiestatis vel. Eos eu stet dicit. Porro suscipiantur id usu, antiopam moderatius sit ne. Ei nulla torquatos ullamcorper sed, no stet graece instructior vel, eirmod vulputate an duo.</div><div><br></div><div>Splendide laboramus eam cu, veritus singulis vel et, essent assentior an vim. Prima paulo ut mei, no tota erat eam. Constituam consequuntur his ad. Ad ius libris labore, ex sumo regione eos. No ius vero apeirian.</div><div><br></div><div>Mollis integre persius ad nam. At agam constituam sit, an mea dolores iracundia conceptam, vis no atqui verear detracto. Et fugit ridens intellegam duo, eu facilisi erroribus duo. Et vix homero verear liberavisse, natum nonumes splendide usu at. Ea vis meliore offendit intellegebat. Ne mazim philosophia usu.</div><div><br></div><div>At mazim tacimates per. Ne reque tractatos mel, at eos case commodo. Cu animal constituam pri, ea nam ceteros copiosae philosophia. Ei modo fuisset pertinax vim, id vis tacimates interpretaris mediocritatem. Vel no esse scripserit, nostrum tacimates his te.</div><div><br></div><div>Corpora postulant voluptatum nam eu. Cum te agam delectus ullamcorper, nostrum perfecto an nam. Ne quo accusata adversarium, illud efficiantur te nam. At veri simul virtute mei, deleniti persecuti te mei. Ludus animal eam cu, an nulla prompta imperdiet vis. Est cu dicam soluta everti.</div><div><br></div><div>Aliquam feugait perfecto per ne, an adolescens sententiae vis, his no noster animal. At vim vidit apeirian appellantur, no graecis invidunt sea. Illud oblique ad ius, eum no partem consectetuer, equidem incorrupte cum cu. At usu docendi tibique evertitur. Duis deserunt pri at. Aeque tempor usu et, ex illum facer efficiendi nam.</div><div><br></div><div>Vel quodsi iracundia ne, eu audiam tibique mnesarchum est. Diam oporteat suavitate pri id. Eos latine euripidis ad, ad mei partem accommodare, nam at elitr vitae voluptaria. Id sea ceteros suscipiantur. Ne per viderer tacimates repudiare, sed id quaestio cotidieque. Ei hinc dolor putent usu, falli lucilius nam at.</div><div><br></div><div>Aperiam detracto qualisque cu sea, sea te deleniti scripserit. Option feugiat sit ei. Labore volumus instructior eos ne, id graecis antiopam assueverit vel, no appetere argumentum eloquentiam quo. Error option dolorum nam cu. Vim tantas populo et, te mea quem quando decore.</div><div><br></div><div>Duo ad elit aperiam. Et error aliquip mea. Cum ut facete assentior, ei vis dictas erroribus salutatus. Mea eu iusto volumus argumentum, sed eu quando regione indoctum.</div>', '', '', '', 27, NULL, 0, '2018-07-17 10:30:23', 'admin@demo.com', 0),
(9, 'how-can-blockchains-remove-the-pay-to-trade-barrier-in-the-market', 'How Can Blockchains Remove the ‘Pay to Trade’ Barrier in the Market?', '', 'upload/news/2ff94094fcfbe19daf303a479b9fad68.jpg', '', '<div>Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. Autem ullum cu sed. Id per enim deserunt, vel an choro dolores voluptatum. His viderer civibus te, quis vero timeam te mel. Meis nulla nec id. Te eros ubique ius.</div><div><br></div><div>Pri nisl velit at. Ei lobortis forensibus dissentiunt sit, ius idque veritus in, in aeterno invenire usu. Esse inani inermis eam ea. Justo perfecto dignissim an pri, ea sit dico neglegentur, id mundi maiestatis vel. Eos eu stet dicit. Porro suscipiantur id usu, antiopam moderatius sit ne. Ei nulla torquatos ullamcorper sed, no stet graece instructior vel, eirmod vulputate an duo.</div><div><br></div><div>Splendide laboramus eam cu, veritus singulis vel et, essent assentior an vim. Prima paulo ut mei, no tota erat eam. Constituam consequuntur his ad. Ad ius libris labore, ex sumo regione eos. No ius vero apeirian.</div><div><br></div><div>Mollis integre persius ad nam. At agam constituam sit, an mea dolores iracundia conceptam, vis no atqui verear detracto. Et fugit ridens intellegam duo, eu facilisi erroribus duo. Et vix homero verear liberavisse, natum nonumes splendide usu at. Ea vis meliore offendit intellegebat. Ne mazim philosophia usu.</div><div><br></div><div>At mazim tacimates per. Ne reque tractatos mel, at eos case commodo. Cu animal constituam pri, ea nam ceteros copiosae philosophia. Ei modo fuisset pertinax vim, id vis tacimates interpretaris mediocritatem. Vel no esse scripserit, nostrum tacimates his te.</div><div><br></div><div>Corpora postulant voluptatum nam eu. Cum te agam delectus ullamcorper, nostrum perfecto an nam. Ne quo accusata adversarium, illud efficiantur te nam. At veri simul virtute mei, deleniti persecuti te mei. Ludus animal eam cu, an nulla prompta imperdiet vis. Est cu dicam soluta everti.</div><div><br></div><div>Aliquam feugait perfecto per ne, an adolescens sententiae vis, his no noster animal. At vim vidit apeirian appellantur, no graecis invidunt sea. Illud oblique ad ius, eum no partem consectetuer, equidem incorrupte cum cu. At usu docendi tibique evertitur. Duis deserunt pri at. Aeque tempor usu et, ex illum facer efficiendi nam.</div><div><br></div><div>Vel quodsi iracundia ne, eu audiam tibique mnesarchum est. Diam oporteat suavitate pri id. Eos latine euripidis ad, ad mei partem accommodare, nam at elitr vitae voluptaria. Id sea ceteros suscipiantur. Ne per viderer tacimates repudiare, sed id quaestio cotidieque. Ei hinc dolor putent usu, falli lucilius nam at.</div><div><br></div><div>Aperiam detracto qualisque cu sea, sea te deleniti scripserit. Option feugiat sit ei. Labore volumus instructior eos ne, id graecis antiopam assueverit vel, no appetere argumentum eloquentiam quo. Error option dolorum nam cu. Vim tantas populo et, te mea quem quando decore.</div><div><br></div><div>Duo ad elit aperiam. Et error aliquip mea. Cum ut facete assentior, ei vis dictas erroribus salutatus. Mea eu iusto volumus argumentum, sed eu quando regione indoctum.</div>', '', '', '', 24, NULL, 0, '2018-07-10 09:13:25', 'admin@demo.com', 0),
(10, 'how-blockchain-is-making-it-easier-to-get', 'How Blockchain Is Making It Easier to Get', '', 'upload/news/44807c1619ecc1f8374b8930477187aa.jpg', '', '<div>Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. Autem ullum cu sed. Id per enim deserunt, vel an choro dolores voluptatum. His viderer civibus te, quis vero timeam te mel. Meis nulla nec id. Te eros ubique ius.</div><div><br></div><div>Pri nisl velit at. Ei lobortis forensibus dissentiunt sit, ius idque veritus in, in aeterno invenire usu. Esse inani inermis eam ea. Justo perfecto dignissim an pri, ea sit dico neglegentur, id mundi maiestatis vel. Eos eu stet dicit. Porro suscipiantur id usu, antiopam moderatius sit ne. Ei nulla torquatos ullamcorper sed, no stet graece instructior vel, eirmod vulputate an duo.</div><div><br></div><div>Splendide laboramus eam cu, veritus singulis vel et, essent assentior an vim. Prima paulo ut mei, no tota erat eam. Constituam consequuntur his ad. Ad ius libris labore, ex sumo regione eos. No ius vero apeirian.</div><div><br></div><div>Mollis integre persius ad nam. At agam constituam sit, an mea dolores iracundia conceptam, vis no atqui verear detracto. Et fugit ridens intellegam duo, eu facilisi erroribus duo. Et vix homero verear liberavisse, natum nonumes splendide usu at. Ea vis meliore offendit intellegebat. Ne mazim philosophia usu.</div><div><br></div><div>At mazim tacimates per. Ne reque tractatos mel, at eos case commodo. Cu animal constituam pri, ea nam ceteros copiosae philosophia. Ei modo fuisset pertinax vim, id vis tacimates interpretaris mediocritatem. Vel no esse scripserit, nostrum tacimates his te.</div><div><br></div><div>Corpora postulant voluptatum nam eu. Cum te agam delectus ullamcorper, nostrum perfecto an nam. Ne quo accusata adversarium, illud efficiantur te nam. At veri simul virtute mei, deleniti persecuti te mei. Ludus animal eam cu, an nulla prompta imperdiet vis. Est cu dicam soluta everti.</div><div><br></div><div>Aliquam feugait perfecto per ne, an adolescens sententiae vis, his no noster animal. At vim vidit apeirian appellantur, no graecis invidunt sea. Illud oblique ad ius, eum no partem consectetuer, equidem incorrupte cum cu. At usu docendi tibique evertitur. Duis deserunt pri at. Aeque tempor usu et, ex illum facer efficiendi nam.</div><div><br></div><div>Vel quodsi iracundia ne, eu audiam tibique mnesarchum est. Diam oporteat suavitate pri id. Eos latine euripidis ad, ad mei partem accommodare, nam at elitr vitae voluptaria. Id sea ceteros suscipiantur. Ne per viderer tacimates repudiare, sed id quaestio cotidieque. Ei hinc dolor putent usu, falli lucilius nam at.</div><div><br></div><div>Aperiam detracto qualisque cu sea, sea te deleniti scripserit. Option feugiat sit ei. Labore volumus instructior eos ne, id graecis antiopam assueverit vel, no appetere argumentum eloquentiam quo. Error option dolorum nam cu. Vim tantas populo et, te mea quem quando decore.</div><div><br></div><div>Duo ad elit aperiam. Et error aliquip mea. Cum ut facete assentior, ei vis dictas erroribus salutatus. Mea eu iusto volumus argumentum, sed eu quando regione indoctum.</div>', '', '', '', 24, NULL, 0, '2018-07-10 09:13:16', 'admin@demo.com', 0),
(11, 'ripple-price-technical-analysis-xrpusd', 'Ripple Price Technical Analysis – XRP/USD', '', 'upload/news/3c9de71155211697f38a3820ba36670d.jpg', '', '<div>Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. Autem ullum cu sed. Id per enim deserunt, vel an choro dolores voluptatum. His viderer civibus te, quis vero timeam te mel. Meis nulla nec id. Te eros ubique ius.</div><div><br></div><div>Pri nisl velit at. Ei lobortis forensibus dissentiunt sit, ius idque veritus in, in aeterno invenire usu. Esse inani inermis eam ea. Justo perfecto dignissim an pri, ea sit dico neglegentur, id mundi maiestatis vel. Eos eu stet dicit. Porro suscipiantur id usu, antiopam moderatius sit ne. Ei nulla torquatos ullamcorper sed, no stet graece instructior vel, eirmod vulputate an duo.</div><div><br></div><div>Splendide laboramus eam cu, veritus singulis vel et, essent assentior an vim. Prima paulo ut mei, no tota erat eam. Constituam consequuntur his ad. Ad ius libris labore, ex sumo regione eos. No ius vero apeirian.</div><div><br></div><div>Mollis integre persius ad nam. At agam constituam sit, an mea dolores iracundia conceptam, vis no atqui verear detracto. Et fugit ridens intellegam duo, eu facilisi erroribus duo. Et vix homero verear liberavisse, natum nonumes splendide usu at. Ea vis meliore offendit intellegebat. Ne mazim philosophia usu.</div><div><br></div><div>At mazim tacimates per. Ne reque tractatos mel, at eos case commodo. Cu animal constituam pri, ea nam ceteros copiosae philosophia. Ei modo fuisset pertinax vim, id vis tacimates interpretaris mediocritatem. Vel no esse scripserit, nostrum tacimates his te.</div><div><br></div><div>Corpora postulant voluptatum nam eu. Cum te agam delectus ullamcorper, nostrum perfecto an nam. Ne quo accusata adversarium, illud efficiantur te nam. At veri simul virtute mei, deleniti persecuti te mei. Ludus animal eam cu, an nulla prompta imperdiet vis. Est cu dicam soluta everti.</div><div><br></div><div>Aliquam feugait perfecto per ne, an adolescens sententiae vis, his no noster animal. At vim vidit apeirian appellantur, no graecis invidunt sea. Illud oblique ad ius, eum no partem consectetuer, equidem incorrupte cum cu. At usu docendi tibique evertitur. Duis deserunt pri at. Aeque tempor usu et, ex illum facer efficiendi nam.</div><div><br></div><div>Vel quodsi iracundia ne, eu audiam tibique mnesarchum est. Diam oporteat suavitate pri id. Eos latine euripidis ad, ad mei partem accommodare, nam at elitr vitae voluptaria. Id sea ceteros suscipiantur. Ne per viderer tacimates repudiare, sed id quaestio cotidieque. Ei hinc dolor putent usu, falli lucilius nam at.</div><div><br></div><div>Aperiam detracto qualisque cu sea, sea te deleniti scripserit. Option feugiat sit ei. Labore volumus instructior eos ne, id graecis antiopam assueverit vel, no appetere argumentum eloquentiam quo. Error option dolorum nam cu. Vim tantas populo et, te mea quem quando decore.</div><div><br></div><div>Duo ad elit aperiam. Et error aliquip mea. Cum ut facete assentior, ei vis dictas erroribus salutatus. Mea eu iusto volumus argumentum, sed eu quando regione indoctum.</div>', '', '', '', 25, NULL, 0, '2018-07-08 09:11:43', 'admin@demo.com', 0),
(12, 'bitfinex-introduces-trading-for-12-altcoins', 'Bitfinex Introduces Trading for 12 Altcoins', '', 'upload/news/bced67e1ee1ed3b2f3d4a10f9f71e78e.jpg', '', '<div>Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. Autem ullum cu sed. Id per enim deserunt, vel an choro dolores voluptatum. His viderer civibus te, quis vero timeam te mel. Meis nulla nec id. Te eros ubique ius.</div><div><br></div><div>Pri nisl velit at. Ei lobortis forensibus dissentiunt sit, ius idque veritus in, in aeterno invenire usu. Esse inani inermis eam ea. Justo perfecto dignissim an pri, ea sit dico neglegentur, id mundi maiestatis vel. Eos eu stet dicit. Porro suscipiantur id usu, antiopam moderatius sit ne. Ei nulla torquatos ullamcorper sed, no stet graece instructior vel, eirmod vulputate an duo.</div><div><br></div><div>Splendide laboramus eam cu, veritus singulis vel et, essent assentior an vim. Prima paulo ut mei, no tota erat eam. Constituam consequuntur his ad. Ad ius libris labore, ex sumo regione eos. No ius vero apeirian.</div><div><br></div><div>Mollis integre persius ad nam. At agam constituam sit, an mea dolores iracundia conceptam, vis no atqui verear detracto. Et fugit ridens intellegam duo, eu facilisi erroribus duo. Et vix homero verear liberavisse, natum nonumes splendide usu at. Ea vis meliore offendit intellegebat. Ne mazim philosophia usu.</div><div><br></div><div>At mazim tacimates per. Ne reque tractatos mel, at eos case commodo. Cu animal constituam pri, ea nam ceteros copiosae philosophia. Ei modo fuisset pertinax vim, id vis tacimates interpretaris mediocritatem. Vel no esse scripserit, nostrum tacimates his te.</div><div><br></div><div>Corpora postulant voluptatum nam eu. Cum te agam delectus ullamcorper, nostrum perfecto an nam. Ne quo accusata adversarium, illud efficiantur te nam. At veri simul virtute mei, deleniti persecuti te mei. Ludus animal eam cu, an nulla prompta imperdiet vis. Est cu dicam soluta everti.</div><div><br></div><div>Aliquam feugait perfecto per ne, an adolescens sententiae vis, his no noster animal. At vim vidit apeirian appellantur, no graecis invidunt sea. Illud oblique ad ius, eum no partem consectetuer, equidem incorrupte cum cu. At usu docendi tibique evertitur. Duis deserunt pri at. Aeque tempor usu et, ex illum facer efficiendi nam.</div><div><br></div><div>Vel quodsi iracundia ne, eu audiam tibique mnesarchum est. Diam oporteat suavitate pri id. Eos latine euripidis ad, ad mei partem accommodare, nam at elitr vitae voluptaria. Id sea ceteros suscipiantur. Ne per viderer tacimates repudiare, sed id quaestio cotidieque. Ei hinc dolor putent usu, falli lucilius nam at.</div><div><br></div><div>Aperiam detracto qualisque cu sea, sea te deleniti scripserit. Option feugiat sit ei. Labore volumus instructior eos ne, id graecis antiopam assueverit vel, no appetere argumentum eloquentiam quo. Error option dolorum nam cu. Vim tantas populo et, te mea quem quando decore.</div><div><br></div><div>Duo ad elit aperiam. Et error aliquip mea. Cum ut facete assentior, ei vis dictas erroribus salutatus. Mea eu iusto volumus argumentum, sed eu quando regione indoctum.</div>', '', '', '', 25, NULL, 0, '2018-07-10 09:35:43', 'admin@demo.com', 0),
(13, 'bitcoin-cash-price-trend-including-tether', 'Bitcoin Cash Price Trend Including Tether', '', 'upload/news/0656fe700249acfe0a5535b4ae2c0088.jpg', '', '<div>Lorem ipsum dolor sit amet, quo omittam moderatius in, te cum mutat malorum. Autem ullum cu sed. Id per enim deserunt, vel an choro dolores voluptatum. His viderer civibus te, quis vero timeam te mel. Meis nulla nec id. Te eros ubique ius.</div><div><br></div><div>Pri nisl velit at. Ei lobortis forensibus dissentiunt sit, ius idque veritus in, in aeterno invenire usu. Esse inani inermis eam ea. Justo perfecto dignissim an pri, ea sit dico neglegentur, id mundi maiestatis vel. Eos eu stet dicit. Porro suscipiantur id usu, antiopam moderatius sit ne. Ei nulla torquatos ullamcorper sed, no stet graece instructior vel, eirmod vulputate an duo.</div><div><br></div><div>Splendide laboramus eam cu, veritus singulis vel et, essent assentior an vim. Prima paulo ut mei, no tota erat eam. Constituam consequuntur his ad. Ad ius libris labore, ex sumo regione eos. No ius vero apeirian.</div><div><br></div><div>Mollis integre persius ad nam. At agam constituam sit, an mea dolores iracundia conceptam, vis no atqui verear detracto. Et fugit ridens intellegam duo, eu facilisi erroribus duo. Et vix homero verear liberavisse, natum nonumes splendide usu at. Ea vis meliore offendit intellegebat. Ne mazim philosophia usu.</div><div><br></div><div>At mazim tacimates per. Ne reque tractatos mel, at eos case commodo. Cu animal constituam pri, ea nam ceteros copiosae philosophia. Ei modo fuisset pertinax vim, id vis tacimates interpretaris mediocritatem. Vel no esse scripserit, nostrum tacimates his te.</div><div><br></div><div>Corpora postulant voluptatum nam eu. Cum te agam delectus ullamcorper, nostrum perfecto an nam. Ne quo accusata adversarium, illud efficiantur te nam. At veri simul virtute mei, deleniti persecuti te mei. Ludus animal eam cu, an nulla prompta imperdiet vis. Est cu dicam soluta everti.</div><div><br></div><div>Aliquam feugait perfecto per ne, an adolescens sententiae vis, his no noster animal. At vim vidit apeirian appellantur, no graecis invidunt sea. Illud oblique ad ius, eum no partem consectetuer, equidem incorrupte cum cu. At usu docendi tibique evertitur. Duis deserunt pri at. Aeque tempor usu et, ex illum facer efficiendi nam.</div><div><br></div><div>Vel quodsi iracundia ne, eu audiam tibique mnesarchum est. Diam oporteat suavitate pri id. Eos latine euripidis ad, ad mei partem accommodare, nam at elitr vitae voluptaria. Id sea ceteros suscipiantur. Ne per viderer tacimates repudiare, sed id quaestio cotidieque. Ei hinc dolor putent usu, falli lucilius nam at.</div><div><br></div><div>Aperiam detracto qualisque cu sea, sea te deleniti scripserit. Option feugiat sit ei. Labore volumus instructior eos ne, id graecis antiopam assueverit vel, no appetere argumentum eloquentiam quo. Error option dolorum nam cu. Vim tantas populo et, te mea quem quando decore.</div><div><br></div><div>Duo ad elit aperiam. Et error aliquip mea. Cum ut facete assentior, ei vis dictas erroribus salutatus. Mea eu iusto volumus argumentum, sed eu quando regione indoctum.</div>', '', '', '', 25, NULL, 0, '2018-07-10 09:36:00', 'admin@demo.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `web_slider`
--

CREATE TABLE `web_slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slider_h1_en` varchar(900) DEFAULT NULL,
  `slider_h1_fr` varchar(900) DEFAULT NULL,
  `slider_h2_en` varchar(900) DEFAULT NULL,
  `slider_h2_fr` varchar(900) DEFAULT NULL,
  `slider_h3_en` varchar(900) DEFAULT NULL,
  `slider_h3_fr` varchar(900) DEFAULT NULL,
  `slider_img` varchar(300) DEFAULT NULL,
  `custom_url` varchar(300) NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `web_slider`
--

INSERT INTO `web_slider` (`id`, `slider_h1_en`, `slider_h1_fr`, `slider_h2_en`, `slider_h2_fr`, `slider_h3_en`, `slider_h3_fr`, `slider_img`, `custom_url`, `status`) VALUES
(1, 'The Feature of Financing Technology is Here', '', 'It is a long established fact that a reader will be distracted.', '', 'Get in touch', '', 'upload/slider/1635412183_f2ae8cca01f1aa5cd933.png', 'https://www.bdtask.com/', 1),
(3, 'Take the world&#39;s  best  Cryptocurrency  Site.', '', 'Miker Ipsum is simply dummy text of the printing.', '', 'Start Now', '', 'upload/slider/1635412151_11703710f77dd17c1f6e.png', 'https://www.bdtask.com/', 1);

-- --------------------------------------------------------

--
-- Table structure for table `web_social_link`
--

CREATE TABLE `web_social_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `web_social_link`
--

INSERT INTO `web_social_link` (`id`, `name`, `link`, `icon`, `status`, `date`) VALUES
(1, 'Facebook', 'https://facebook.com', 'facebook', 1, '2020-12-07 12:52:22'),
(2, 'twitter', 'https://twitter.com', 'tumblr', 1, '2018-07-09 12:12:09'),
(3, 'linkedin', 'https:/linkdin.com', 'linkedin', 1, '2020-10-04 17:40:11'),
(4, 'youtube', 'https://www.youtube.com', 'dribbble', 0, '2021-03-09 01:47:57'),
(5, 'instagram', 'https://instagram.com', 'instagram', 0, '2021-03-09 01:47:37');

-- --------------------------------------------------------

--
-- Table structure for table `web_subscriber`
--

CREATE TABLE `web_subscriber` (
  `sub_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--
--
-- Indexes for table `cryptolist`
--
ALTER TABLE `cryptolist`
 
  ADD UNIQUE KEY `Id` (`Id`),
  ADD UNIQUE KEY `Symbol` (`Symbol`);

--
-- Indexes for table `crypto_payments`
--
ALTER TABLE `crypto_payments`
 
  ADD UNIQUE KEY `key3` (`boxID`,`orderID`,`userID`,`txID`,`amount`,`addr`),
  ADD KEY `boxID` (`boxID`),
  ADD KEY `boxType` (`boxType`),
  ADD KEY `userID` (`userID`),
  ADD KEY `countryID` (`countryID`),
  ADD KEY `orderID` (`orderID`),
  ADD KEY `amount` (`amount`),
  ADD KEY `amountUSD` (`amountUSD`),
  ADD KEY `coinLabel` (`coinLabel`),
  ADD KEY `unrecognised` (`unrecognised`),
  ADD KEY `addr` (`addr`),
  ADD KEY `txID` (`txID`),
  ADD KEY `txDate` (`txDate`),
  ADD KEY `txConfirmed` (`txConfirmed`),
  ADD KEY `txCheckDate` (`txCheckDate`),
  ADD KEY `processed` (`processed`),
  ADD KEY `processedDate` (`processedDate`),
  ADD KEY `recordCreated` (`recordCreated`),
  ADD KEY `key1` (`boxID`,`orderID`),
  ADD KEY `key2` (`boxID`,`orderID`,`userID`);


--
-- Indexes for table `dbt_coinpair`
--
ALTER TABLE `dbt_coinpair`
 
  ADD UNIQUE KEY `symbol` (`symbol`),
  ADD UNIQUE KEY `symbol_2` (`symbol`),
  ADD KEY `isDefault` (`isDefault`);


--
-- Indexes for table `dbt_cryptocoin`
--
ALTER TABLE `dbt_cryptocoin`  
  ADD UNIQUE KEY `Id` (`cid`);

--
-- Indexes for table `dbt_user`
--
ALTER TABLE `dbt_user`
 
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `web_article`
--
ALTER TABLE `web_article`
 
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `web_category`
--
ALTER TABLE `web_category`
 
  ADD UNIQUE KEY `slug` (`slug`);


--
-- Indexes for table `web_news`
--
ALTER TABLE `web_news`
 
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `web_subscriber`
--
ALTER TABLE `web_subscriber`
 
  ADD UNIQUE KEY `email` (`email`);
COMMIT;