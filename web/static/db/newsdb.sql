/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.5.25a : Database - newsdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`newsdb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `newsdb`;

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) DEFAULT NULL,
  `content` text,
  `ip_addr` varchar(20) DEFAULT NULL,
  `comment_date` datetime DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

insert  into `comment`(`c_id`,`news_id`,`content`,`ip_addr`,`comment_date`) values (5,1,'你正是2','172.16.4.53','2019-03-19 15:11:51'),(7,104,'qqq','172.16.4.53','2019-03-19 15:15:08'),(8,104,'qqq\n\n       ','172.16.4.53','2019-03-19 15:15:40'),(9,104,'<ul class=\"list-group\"><li class=\"list-group-item\">172.16.4.53:[2019-03-19 15:15:40]:qqq</li><li class=\"list-group-item\" style=\"margin-bottom: -1px;\">172.16.4.53:[2019-03-19 15:15:08]:qqq</li></ul>\n\n       ','172.16.4.53','2019-03-19 15:17:44'),(10,106,'NIZAIMA','172.16.4.53','2019-03-19 15:45:54'),(11,106,'AA','172.16.4.53','2019-03-19 15:45:59'),(12,106,'11','172.16.4.53','2019-03-19 15:46:18'),(13,71,'飞哥很帅','172.16.4.53','2019-03-19 15:47:08'),(14,104,'','172.16.4.53','2019-03-19 16:08:39'),(15,104,'','172.16.4.53','2019-03-19 16:09:05'),(16,104,'111','172.16.4.53','2019-03-19 16:09:15'),(17,104,'222','172.16.4.53','2019-03-19 16:09:34'),(18,104,'123','172.16.4.53','2019-03-19 16:09:52'),(19,104,'172.16.4.53:[2019-03-19 16:09:05]:\n172.16.4.53:[2019-03-19 16:08:39]:','172.16.4.53','2019-03-19 16:10:07'),(20,104,'72.16.4.53:[2019-03-19 16:09:05]: 172.16.4.53:[2019-03-19 16:08:39]:72.16.4.53:[2019-03-19 16:09:05]: 172.16.4.53:[2019-03-19 16:08:39]:72.16.4.53:[2019-03-19 16:09:05]: 172.16.4.53:[2019-03-19 16:08:39]:','172.16.4.53','2019-03-19 16:10:19'),(21,104,'qqqq','172.16.4.53','2019-03-19 16:11:22'),(22,104,'172.16.4.53:[2019-03-19 16:11:22]:qqqq\n172.16.4.53:[2019-03-19 16:10:19]:72.16.4.53:[2019-03-19 16:09:05]: 172.16.4.53:[2019-03-19 16:08:39]:72.16.4.53:[2019-03-19 16:09:05]: 172.16.4.53:[2019-03-19 16:08:39]:72.16.4.53:[2019-03-19 16:09:05]: 172.16.4.53:[2019-03-19 16:08:39]:\n172.16.4.53:[2019-03-19 16:10:07]:172.16.4.53:[2019-03-19 16:09:05]: 172.16.4.53:[2019-03-19 16:08:39]:\n172.16.4.53:[2019-03-19 16:09:52]:123\n172.16.4.53:[2019-03-19 16:09:34]:222\n172.16.4.53:[2019-03-19 16:09:15]:111\n172.16.4.53:[2019-03-19 16:09:05]:\n172.16.4.53:[2019-03-19 16:08:39]:\n172.16.4.53:[2019-03-19 15:17:44]:\n172.16.4.53:[2019-03-19 15:15:40','172.16.4.53','2019-03-19 16:11:34'),(23,104,'aa','172.16.4.53','2019-03-19 16:14:21'),(26,104,'啊啊啊啊啊啊啊啊\n','172.16.4.51','2019-03-19 16:15:54'),(27,104,'asddddd','172.16.4.34','2019-03-19 16:16:01'),(28,104,'asssssssssss','172.16.4.34','2019-03-19 16:16:04'),(29,104,'ssssssssss','172.16.4.34','2019-03-19 16:16:06'),(30,104,'aaaa','172.16.4.44','2019-03-19 16:16:07'),(32,104,'x','172.16.4.48','2019-03-19 16:16:14'),(36,104,'O.0\n0.O','172.16.4.44','2019-03-19 16:16:29'),(37,104,'GG   SMD','172.16.4.34','2019-03-19 16:16:42'),(38,104,'神评','172.16.4.26','2019-03-19 16:16:43'),(39,104,'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss','172.16.4.34','2019-03-19 16:17:03'),(40,104,'牛逼','172.16.4.33','2019-03-19 16:17:05'),(41,104,'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss','0:0:0:0:0:0:0:1','2019-03-19 16:27:02'),(42,110,'香港少女穿热裤短裙便利店偷零食被捕2香港少女穿热裤短裙便利店偷零食被捕2香港少女穿热裤短裙便利店偷零食被捕2香港少女穿热裤短裙便利店偷零食被捕2香港少女穿热裤短裙便利店偷零食被捕2香港少女穿热裤短裙便利店偷零食被捕2香港少女穿热裤短裙便利店偷零食被捕2香港少女穿热裤短裙便利店偷零食被捕2香港少女穿热裤短裙便利店偷零食被捕2香港少女穿热裤短裙便利店偷零食被捕2香港少女穿热裤短裙便利店偷零食被捕2香港少女穿热裤短裙便利店偷零食被捕2香港少女穿热裤短裙便利店偷零食被捕2香港少女穿热裤短裙便利店偷零食被捕2','172.16.4.34','2019-03-19 16:27:12'),(43,110,'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss','172.16.4.34','2019-03-19 16:27:21'),(44,104,'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss','0:0:0:0:0:0:0:1','2019-03-19 16:29:23'),(46,104,'我是一楼','172.16.4.26','2019-03-19 16:38:06'),(47,104,'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss','0:0:0:0:0:0:0:1','2019-03-19 16:38:09'),(48,104,'二楼也是我','172.16.4.26','2019-03-19 16:39:15'),(49,104,'厉害୧(๑•̀◡•́๑)૭','172.16.4.43','2019-03-19 16:39:43'),(50,104,'真香!!','172.16.4.46','2019-03-19 08:46:51'),(51,104,'真香','172.16.4.46','2019-03-19 08:47:36');

/*Table structure for table `link` */

DROP TABLE IF EXISTS `link`;

CREATE TABLE `link` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `link_name` varchar(50) DEFAULT NULL,
  `link_url` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `link_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `link` */

insert  into `link`(`link_id`,`link_name`,`link_url`,`email`,`link_order`) values (1,'中软','http://www.chinasofti.com','123456@qq.com',2),(2,'百度','qq@qq.com','http://www.baidu.com',2),(3,'CSDN','http://www.csdn.com',NULL,3),(6,'超链2',NULL,NULL,6),(10,'开源中国','http://www.oschina.net','123@qq.com',1);

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `context` text,
  `author` varchar(20) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL,
  `is_image` int(11) DEFAULT NULL,
  `image_url` varchar(100) DEFAULT NULL,
  `click` int(11) DEFAULT NULL,
  `is_hot` int(11) DEFAULT NULL,
  PRIMARY KEY (`news_id`),
  KEY `news_news_type_type_id_fk` (`type_id`),
  CONSTRAINT `news_news_type_type_id_fk` FOREIGN KEY (`type_id`) REFERENCES `news_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`news_id`,`title`,`context`,`author`,`type_id`,`publish_date`,`is_image`,`image_url`,`click`,`is_hot`) values (1,'是是安全性，广泛应用于个人PC、数据中心','Java是一种可以撰写跨平台应用软件的面向对象的程序设计语言，是由Sun Microsystems公司于1995年5月推出的Java程序设计语言和Java平台（即JavaSE, JavaEE, JavaME）的总称。Java 技术具有卓越的通用性、高效性、平台移植性和安全性，广泛应用于个人PC、数据中心、游戏控制台、科学超级计算机、移动电话和互联网，同时拥有全球最大的开发者专业社群。在全球云计算和移动互联网的产业环境下，Java更具备了显著优势和广阔前景。','222',1,'0201-01-01 00:00:00',1,'4.jpg',220,1),(49,'213啊','213444我','21344',3,'2019-03-04 17:23:44',1,'2.jpg',8,1),(50,'汪峰是互联网上名副其实的King','<p>不知不觉在百度百家写了很多东西了，多得都吓到自己了，主要是一路写到现在，仍然是文笔幼稚、面目可憎，阿弥陀佛，善哉善哉。</p>\r\n\r\n<p>处于多年的媒体习惯，写东西对我来说不仅仅是满足一己私欲，同时也想借此了解一下网友们口味，美其名曰趋势、指数、习惯。而在这个过程中我真的发现了一点什么。往下看。（括号里为阅读量）</p>\r\n','飞飞',1,'2019-03-01 15:17:07',1,'3.jpg',2,1),(51,'马来西亚巫师作法再寻失联飞机：这次更奇葩','马航客机MH370失联已经进入第六天了，但搜寻依然没有取得突破性的进展。<br />\r\n此前曾有报道称为了搜寻失联的马航客机，马来西亚不惜用尽各种方法，只要不违反伊斯兰教教义，欢迎任何人参与搜索行动，甚至连马来巫师也不例外。<br />\r\n著名马来巫师伊布拉欣马今（IbrahimMatZin）曾于前日前往吉隆坡国际机场，以透过灵异力量寻找失踪飞机所在位置。他在吉隆坡国际机场入口处祈祷后表示有两种感觉，即飞机还在空中飞或已坠海，但不会坠落在陆地上。<br />\r\n随而昨天，伊布拉欣马今在吉隆坡机场继续做法，这次的道具更加奇葩，除了专门的&ldquo;法器&rdquo;之外还动用了两个椰子，但报道中并未提及这次的结果如何，不知道这次大师会得出什么结论。<br />\r\n<img alt=\"\" src=\"newsImg/1.jpg\" /><br />\r\n<img alt=\"\" src=\"newsImg/2.jpg\" /><br />\r\n<img alt=\"\" src=\"newsImg/3.jpg\" /><br />\r\n<img alt=\"\" src=\"newsImg/4.jpg\" /><br />\r\n<img alt=\"\" src=\"newsImg/5.jpg\" /><br />\r\n&nbsp;','飞飞',2,'2019-03-01 18:54:57',1,'2.jpg',23,1),(52,'娱乐新闻1','娱乐新闻1','飞飞',1,'2019-03-01 20:41:24',1,'1.jpg',3,1),(53,'娱乐新闻2','娱乐新闻2','飞飞',1,'2019-03-01 20:41:58',0,NULL,3,1),(64,'娱乐新闻3','娱乐新闻3','飞飞',1,'2019-03-01 21:18:17',0,NULL,2,0),(65,'娱乐新闻4','娱乐新闻4','飞飞',1,'2019-03-01 21:18:17',0,NULL,0,0),(66,'娱乐新闻5','娱乐新闻5','飞飞',1,'2019-03-01 21:18:17',0,NULL,0,0),(67,'娱乐新闻6','娱乐新闻6','飞飞',1,'2019-03-01 21:18:17',0,NULL,0,0),(68,'娱乐新闻7','娱乐新闻7','飞飞',1,'2019-03-01 21:18:17',0,NULL,1,0),(69,'娱乐新闻8','娱乐新闻8','飞飞',1,'2019-03-01 21:18:17',0,NULL,0,0),(71,'政治新闻2','政治新闻8','飞飞',2,'2019-03-01 22:01:56',0,NULL,38,0),(72,'政治新闻3','政治新闻8','飞飞',2,'2019-03-01 22:01:56',0,NULL,1,0),(73,'政治新闻4','政治新闻8','飞飞',2,'2019-03-01 22:01:56',0,NULL,11,0),(74,'政治新闻5','政治新闻8','飞飞',2,'2019-03-01 22:01:56',0,NULL,1,0),(75,'政治新闻6','政治新闻8','飞飞',2,'2019-03-01 22:01:56',0,NULL,1,0),(76,'政治新闻7','政治新闻8','飞飞',2,'2019-03-01 22:01:56',0,NULL,2,0),(77,'政治新闻8','政治新闻8','飞飞',2,'2019-03-01 22:01:56',0,NULL,0,0),(78,'经济新闻1','经济新闻8','飞飞',3,'2019-03-01 22:14:56',0,NULL,9,0),(79,'经济新闻3','经济新闻8','飞飞',3,'2019-03-01 22:14:56',0,NULL,0,0),(80,'经济新闻3','经济新闻8','飞飞',3,'2019-03-01 22:14:56',0,NULL,0,0),(81,'经济新闻4','经济新闻8','飞飞',3,'2019-03-01 22:14:56',0,NULL,0,0),(82,'经济新闻5','经济新闻8','飞飞',3,'2019-03-01 22:14:56',0,NULL,0,0),(83,'经济新闻6','经济新闻8','飞飞',3,'2019-03-01 22:14:56',0,NULL,0,0),(84,'经济新闻7','经济新闻8','飞飞',3,'2019-03-01 22:14:56',0,NULL,0,0),(85,'经济新闻8','经济新闻8','飞飞',3,'2019-03-01 22:14:56',0,NULL,0,0),(86,'文化新闻1','文化新闻8','飞飞',4,'2019-03-01 22:20:38',0,NULL,1,0),(87,'文化新闻4','文化新闻8','飞飞',4,'2019-03-01 22:20:38',0,NULL,0,0),(88,'文化新闻4','文化新闻8','飞飞',4,'2019-03-01 22:20:38',0,NULL,0,0),(89,'文化新闻4','文化新闻8','飞飞',4,'2019-03-01 22:20:38',0,NULL,0,0),(90,'文化新闻5','文化新闻8','飞飞',4,'2019-03-01 22:20:38',0,NULL,0,0),(91,'文化新闻6','文化新闻8','飞飞',4,'2019-03-01 22:20:38',0,NULL,0,0),(92,'文化新闻7','文化新闻8','飞飞',4,'2019-03-01 22:20:38',0,NULL,0,0),(93,'文化新闻8','文化新闻8','飞飞',4,'2019-03-01 22:20:38',0,NULL,0,0),(94,'小道新闻1','小道新闻8','飞飞',5,'2019-03-01 22:21:03',0,NULL,4,0),(95,'小道新闻5','小道新闻8','飞飞',5,'2019-03-01 22:21:03',0,NULL,1,0),(97,'小道新闻5','小道新闻8','飞飞',5,'2019-03-01 22:21:03',0,NULL,1,0),(98,'小道新闻5','小道新闻8','飞飞',5,'2019-03-01 22:21:03',0,NULL,1,0),(99,'小道新闻6','小道新闻8','飞飞',5,'2019-03-01 22:21:03',0,NULL,1,0),(100,'小道新闻7','小道新闻8','飞飞',5,'2019-03-01 22:21:03',0,NULL,1,0),(101,'小道新闻8','小道新闻8','飞飞',5,'2019-03-01 22:21:03',0,NULL,1,0),(102,'西安幼儿园被指近3年都给孩子吃过药','<p>&nbsp;</p>\r\n<img alt=\"西安幼儿园被指近3年都给孩子吃过药\" src=\"http://img1.gtimg.com/news/pics/hv1/5/34/1542/100277225.jpg\" />\r\n<p>&nbsp;</p>\r\n\r\n<p>一名家长情绪激动</p>\r\n\r\n<p>&nbsp;</p>\r\n<img alt=\"西安幼儿园被指近3年都给孩子吃过药\" src=\"http://img1.gtimg.com/news/pics/hv1/8/34/1542/100277228.jpg\" />\r\n<p>&nbsp;</p>\r\n\r\n<p>家长在幼儿园墙上写下愤怒的语言</p>\r\n\r\n<p>&nbsp;</p>\r\n<img alt=\"西安幼儿园被指近3年都给孩子吃过药\" src=\"http://img1.gtimg.com/news/pics/hv1/6/34/1542/100277226.jpg\" />\r\n<p>&nbsp;</p>\r\n\r\n<p>涉事的幼儿园</p>\r\n\r\n<p>&nbsp;</p>\r\n<img alt=\"西安幼儿园被指近3年都给孩子吃过药\" src=\"http://img1.gtimg.com/news/pics/hv1/7/34/1542/100277227.jpg\" />\r\n<p>&nbsp;</p>\r\n\r\n<p>病毒灵</p>\r\n\r\n<p>西安一家幼儿园被曝在未告知家长的情况下，长期给园内幼儿集体服用抗病毒药物&ldquo;病毒灵&rdquo;。不少孩子被发现存在头晕、腿疼、肚子疼等相同症状，引发众多家长的强烈不满。</p>\r\n\r\n<p>目前，西安市相关部门已开始调查并进行紧急处置，幼儿园园长及相关人员已被警方控制，但关于此事的诸多疑点仍有待解开。</p>\r\n\r\n<p>幼儿园从何时开始给孩子集体服药？给孩子服药出于什么目的？服用这种药物会带来什么样的副作用？西安市有关部门12日对记者称，对于这些问题暂时没有详细的调查结论可以提供。</p>\r\n\r\n<p>□综合新华社电、《华商报》、《<a href=\"http://t.qq.com/xmzkarts#pref=qqcom.keyword\" target=\"_blank\">新民周刊</a>》</p>\r\n\r\n<p><strong>事件 幼儿园私自给幼儿服用&ldquo;病毒灵&rdquo;</strong></p>\r\n\r\n<p>陕西省宋庆龄基金会枫韵幼儿园位于西安市高新区风韵蓝湾小区内，共有690名幼儿。根据家长们的介绍，2007年，幼儿园开园，法人代表孙雪红，院长为赵宝英。</p>\r\n\r\n<p>从2019年3月初开始，陆续有家长发现自己的孩子在幼儿园服用了不明药物。个别有心的家长让孩子将所服的药物带回家中，发现白色药片上面写着&ldquo;ABOB&rdquo;字样，查询后才知道这是一种俗称&ldquo;病毒灵&rdquo;的抗病毒药物。</p>\r\n\r\n<p>根据药物说明，这种药物用于流感病毒及疱疹病毒感染，其不良反应可引起出汗、食欲不振及低血糖等。</p>\r\n\r\n<p>有家长获悉，1999年12月11日国家药监局对地方标准的病毒灵公布停用，理由是效果不确切。还有家长获悉，&ldquo;盐酸吗啉胍片&rdquo;用于小白鼠实验出现小白鼠后代畸形的现象，这更加剧了家长们的担心。</p>\r\n\r\n<p>3月10日，有家长通过微博反映了这一情况，引起众多家长的关注和不满。11日，数十名家长聚集在幼儿园讨要说法，并一度将幼儿园周边道路围堵。</p>\r\n\r\n<p>3月12日上午，记者来到枫韵幼儿园，这里的小操场上正在举行西安市有关部门与家长的沟通会。记者在现场看到，幼儿园多个教室凌乱不堪，医务室内一片狼藉，遍地都是各种文件资料。参加沟通会的许多家长情绪激动，有的人还当场流下眼泪，情绪激动地要求政府部门加大力度处理此事。</p>\r\n\r\n<p><strong>反应 一些男孩子下身红肿、尿不出</strong></p>\r\n\r\n<p>当枫韵幼儿园给幼儿集体服药的秘密被意外发现后，数百名家长闹开了，昌女士这才发现原来自己孩子的症状在这所幼儿园的幼儿中间非常普遍。</p>\r\n\r\n<p>因为给幼儿集体服药的丑闻曝光，3月11日，枫韵幼儿园陷入了瘫痪，家长们集体罢课，并围堵在校门口讨要说法，个别家长因情绪激动围堵附近的道路，被警方带离。</p>\r\n\r\n<p>一位女家长说起这件事情绪激动:&ldquo;千挑万选给孩子找了这家幼儿园，怎么能想到会出这种事情!&rdquo;这位家长说，她的孩子曾说过膝盖疼、腿疼，半夜能疼醒，她觉得肯定是孩子白天跑累了，孩子说肚子疼不想上学，她骂孩子偷懒，以为是孩子不想上学的借口，她没想到，这或许是孩子服药出现的副作用。说到这里，现场十几名家长哭成一片。</p>\r\n\r\n<p>家长们总结了孩子出现的趋同性不良反应:长期便秘、肚子疼、腿疼、出汗、食欲不振。一位家长现场带来了刚刚给孩子做完的体检报告，6岁的孩子被查出肾积水，家长也怀疑是否和服药有关。</p>\r\n\r\n<p><strong>调查 幼儿园近3年都给孩子吃过药</strong></p>\r\n\r\n<p>目前，西安市教育局、食药监局、卫生局、公安局等有关单位组成处置工作小组，进驻幼儿园调查此事。幼儿园业务园长赵宝英、后勤副园长兼保健医生黄林侠被调查人员问话。</p>\r\n\r\n<p>孩子在幼儿园到底吃了多少&ldquo;病毒灵&rdquo;?枫韵幼儿园法人代表孙雪红表示，2012年确实给幼儿吃过&ldquo;病毒灵&rdquo;，当时是禽流感高发期，但在201年，幼儿园开园务会议时，她明确提出，禽流感已过，必须禁止继续使用&ldquo;病毒灵&rdquo;，没想到，今年保健医生再次给孩子用了这个药。</p>\r\n\r\n<p>3月11日，有家长在幼儿园的医务室找到的几张用药记录显示，201年3月6日、7日，3月1日、14日、15日，幼儿园给小班、中班和大班的孩子集体服用&ldquo;病毒灵&rdquo;。还有2019年的服药记录，分别是2月1日、14日，3月5日、6日、7日。但幼儿园到底给孩子们服药多长时间，调查组还在调查。</p>\r\n\r\n<p><strong>各方回应</strong></p>\r\n\r\n<p><strong>官方:幼儿服用的&ldquo;病毒灵&rdquo;毒性小</strong></p>\r\n\r\n<p>记者从西安市政府了解到，西安市卫生局组织多家医院的药剂科、神经内科、感染科、呼吸科专家，对枫韵幼儿园给在园儿童服用药品的适应症、禁忌症、疗效、毒副作用等方面进行讨论。</p>\r\n\r\n<p>经专家讨论认为:一是枫韵幼儿园使用的病毒灵为国药准字号药物，药品在有效期内，有儿童服用剂量说明INSERT INTO t_news VALUES(10mg/kg)，为处方用药;二是经讨论及查阅相关文献，预防性用药效果不明显;三是&ldquo;病毒灵&rdquo;的不良反应可引起出汗、食欲不振及低血糖等反应，查阅此药的相关文献及资料，未见其他不良反应;四是在服药方面，日服用量未超过说明书的剂量，单次剂量仅小班孩子略微超量，且服用时间为2-3天，未长时间服用，引起蓄积毒副作用的可能性较小;五是如出现不适症状，建议医学观察。</p>\r\n\r\n<p><strong>家长:专家作出的结论过于草率</strong></p>\r\n\r\n<p>但接受记者采访的多位家长对上述结论并不认可。在3月12日举行的沟通会上，许多家长提出政府部门组织专家作出的结论过于草率，药物对孩子身体是否造成长期性损害不能轻易下结论。一些家长甚至提出在政府出资的情况下自行带孩子进行独立检查，以确定孩子的身体状况。</p>\r\n\r\n<p>对于幼儿园给孩子服药的目的，虽然官方尚无定论，但许多家长有着自己的看法。</p>\r\n\r\n<p>一些家长告诉记者，枫韵幼儿园是一所民办幼儿园，每月收费1100元到1200元左右。按照收费办法，如果幼儿缺勤幼儿园就要给家长退费。如超过十天缺勤，就要退一半的托费。园方为了确保孩子不生病，保证幼儿出勤率，才会给孩子服用这种抗病毒药物。</p>\r\n\r\n<p><strong>事件追问</strong></p>\r\n\r\n<p><strong>幼儿园的1万粒药从哪来的?</strong></p>\r\n\r\n<p>关于药物来源，西安市食品药品监督管理局药品稽查分局负责人表示，3月10日晚，接家长举报后，稽查人员在幼儿园保健室发现一瓶&ldquo;病毒灵&rdquo;，里面只有3粒，当场对药品进行查封，在检查中还发现一张幼儿园购进药品的票据，显示该药是在西安一家药品批发企业批发的，该企业有资质，幼儿园一次批发100瓶，也就是1万粒。</p>\r\n\r\n<p>那么，孩子们服用的药品本身是否安全?该人士表示，多部门对市内一些零售药店里的&ldquo;病毒灵&rdquo;进行了检查，没有发现与幼儿园内同一批次的药，目前在甘肃天水市找到同一批次的&ldquo;病毒灵&rdquo;，正联系对方向西安发货。药品稽查分局收到该药后，将第一时间送往西安市食品药品检验所检验。</p>\r\n\r\n<p><strong>保健医生可以开处方药吗?</strong></p>\r\n\r\n<p>事发后，枫韵幼儿园后勤副园长兼保健医生黄林侠被警方控制。该幼儿园法人代表接受采访时表示，幼儿园的保健医生是有医师资格证的。</p>\r\n\r\n<p>经查，黄林侠目前只能提供一张广东省发的医师资格证的复印件，但按照规定，从业医师必须在从业机构所在地的卫生部门注册后，才有医师资格。据查，黄林侠并没有在雁塔区注册，所以，黄林侠没有给幼儿开处方药的资质，而&ldquo;病毒灵&rdquo;就属于处方药。</p>\r\n\r\n<p>3月10日，不需要任何处方等凭证，记者在含光北路一家药店轻松购买了一瓶&ldquo;病毒灵&rdquo;，处方药是否一定要凭处方购买呢?西安交大二附院儿科教授侯伟表示，按照规定，处方药必须凭借医生处方去药店或医院购买，但在实际中，药店执行不严格，没有处方也能买到处方药。</p>\r\n','飞飞',4,'2019-03-01 23:00:11',1,'1.jpg',9,1),(103,'昆明火车站暴恐案直击:暴徒见人就砍现场混乱血腥','<img alt=\"\" src=\"newsImg/1.jpg\" /><br />\r\n<br />\r\n　3月1日晚拍摄的昆明火车站一售票大厅外散落的行李INSERT INTO t_news VALUES(手机拍摄)。3月1日晚9时20分，10余名统一着装的暴徒蒙面持刀在云南昆明火车站广场、售票厅等处砍杀无辜群众，截至3月2日1时，暴力案件已造成28名群众遇难、11名群众受伤。公安干警当场击毙5名暴徒，其余暴徒仍在围捕中。新华社记者蔺以光摄<br />\r\n<br />\r\n　　昆明火车站暴力恐怖事件直击<br />\r\n<br />\r\n　　新华网北京３月２日新媒体专电INSERT INTO t_news VALUES(新华社&ldquo;中国网事&rdquo;记者)３月１日晚９时２０分，１０余名统一着装的暴徒蒙面持刀在云南昆明火车站广场、售票厅等处砍杀无辜群众，截至３月２日１时，暴力案件已造成２８名群众遇难、１１３名群众受伤。公安干警当场击毙５名暴徒，其余暴徒仍在围捕中。<br />\r\n<br />\r\n　　云南省政法委认为，这是一起有组织、有计划、严重暴力恐怖袭击事件，性质极其恶劣，并对后续工作进行迅速安排。<br />\r\n<br />\r\n　　暴徒如此残忍，竟在人群密集的车站持刀肆意砍杀无辜群众。人们不禁要问：这些人为什么要这样心狠？<br />\r\n&nbsp;','飞飞',4,'2019-03-01 23:14:48',1,'2.jpg',16,1),(114,'哈哈','<p>啊啊啊</p>\n','2哈',2,'2019-03-04 16:00:00',1,'',0,1),(117,'11','','11',2,'2019-03-11 16:00:00',0,'',0,1),(121,'11','<p><img alt=\"\" src=\"http://localhost/31575a1100534e6f86be14c136365f6a_mv.jpg\" style=\"height:313px; width:500px\" /></p>\n','11',1,'2019-03-12 16:00:00',1,'31575a1100534e6f86be14c136365f6a_mv.jpg',0,1),(132,'好好的一天','<p><img alt=\"\" src=\"http://localhost/d7ff0a4cd26b4681b008fce50ff1111a_timg.jpg\" style=\"height:315px; width:560px\" /></p>\n','小飞',6,'2019-03-23 06:51:11',1,'d7ff0a4cd26b4681b008fce50ff1111a_timg.jpg',1,0),(133,'11','<p><img alt=\"\" src=\"http://localhost/31575a1100534e6f86be14c136365f6a_mv.jpg\" style=\"height:313px; width:500px\" /></p>\n','11',1,'2019-03-22 16:00:00',1,'',0,0),(134,'123123','<p>123<img alt=\"\" src=\"http://localhost/9934dab8cc4448f78e85ea6fae11a1b0_3.jpg\" style=\"height:313px; width:500px\" /></p>\n','123',7,'2019-03-22 16:00:00',1,'9934dab8cc4448f78e85ea6fae11a1b0_3.jpg',0,1),(135,'123abcaaaa','<p><img alt=\"\" src=\"/cce555978051486eb0cf3ed7a3ec1897_mv.jpg\" style=\"height:313px; width:500px\" /></p>\n','123456',1,'2019-03-22 16:00:00',1,'',0,1),(136,'1000111','<p>12312312312</p>\n','1000',2,'2019-03-22 16:00:00',0,'',0,0);

/*Table structure for table `news_type` */

DROP TABLE IF EXISTS `news_type`;

CREATE TABLE `news_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `news_type` */

insert  into `news_type`(`type_id`,`type_name`) values (1,'娱乐新闻'),(2,'政治新闻'),(3,'经济新闻'),(4,'文化新闻'),(5,'小道新闻'),(6,'太原新闻'),(7,'123456'),(9,'请求'),(19,'小小'),(20,'222');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `salt` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`salt`) values (1,'pig123','pig123',NULL),(2,'admin123','admin123',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
