CREATE TABLE `taberogu_infos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) NOT NULL COMMENT '店の名前',
  `point` float(11) DEFAULT NULL COMMENT '食べログ評価',
  `budget` varchar(100) NOT NULL  COMMENT '予算',
  `url` varchar(100) DEFAULT NULL COMMENT '詳細url',
  `tel` varchar(100) DEFAULT NULL COMMENT '店の電話番号',
  `address` varchar(100) DEFAULT NULL COMMENT '住所',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;