/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table tb_album
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_album`;

CREATE TABLE `tb_album` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '相册名称',
  `cover` varchar(70) NOT NULL COMMENT '相册封面',
  `posttime` datetime NOT NULL,
  `ishide` tinyint(1) NOT NULL,
  `rank` tinyint(3) NOT NULL DEFAULT '0',
  `photonum` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tb_album` WRITE;
/*!40000 ALTER TABLE `tb_album` DISABLE KEYS */;

INSERT INTO `tb_album` (`id`, `name`, `cover`, `posttime`, `ishide`, `rank`, `photonum`)
VALUES
	(14,'test','/static/upload/smallpic/20161028/1477619114139919902.jpg','2016-10-28 01:45:23',0,1,0);

/*!40000 ALTER TABLE `tb_album` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_link`;

CREATE TABLE `tb_link` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `sitename` varchar(80) NOT NULL DEFAULT '' COMMENT '网站名字',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '友链URL地址',
  `rank` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tb_link` WRITE;
/*!40000 ALTER TABLE `tb_link` DISABLE KEYS */;

INSERT INTO `tb_link` (`id`, `sitename`, `url`, `rank`)
VALUES
	(1,'justudy','http://www.igo9go.cn',0);

/*!40000 ALTER TABLE `tb_link` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_mood
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_mood`;

CREATE TABLE `tb_mood` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 NOT NULL,
  `cover` varchar(70) CHARACTER SET utf8 NOT NULL DEFAULT '/static/upload/defaultcover.png' COMMENT '说说图片',
  `posttime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table tb_option
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_option`;

CREATE TABLE `tb_option` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tb_option` WRITE;
/*!40000 ALTER TABLE `tb_option` DISABLE KEYS */;

INSERT INTO `tb_option` (`id`, `name`, `value`)
VALUES
	(1,'sitename','justudy'),
	(2,'siteurl','http://goblog.igo9go.com'),
	(3,'subtitle','带着相机去旅行'),
	(4,'pagesize','5'),
	(5,'keywords','摄影'),
	(6,'description','来一场说走就走的旅行'),
	(8,'theme','double'),
	(9,'timezone','8'),
	(10,'stat',''),
	(11,'weibo','http://weibo.com/u/2454210802'),
	(12,'github','https://github.com/igo9go'),
	(16,'duoshuo','doubleliu'),
	(17,'albumsize','9'),
	(18,'nickname','');

/*!40000 ALTER TABLE `tb_option` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_photo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_photo`;

CREATE TABLE `tb_photo` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `albumid` mediumint(8) NOT NULL COMMENT '所属相册ID',
  `des` varchar(100) NOT NULL COMMENT '照片描述',
  `posttime` datetime NOT NULL COMMENT '上传时间',
  `url` varchar(70) NOT NULL COMMENT '照片URL地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`%` */ /*!50003 TRIGGER `InsertPhoto` AFTER INSERT ON `tb_photo` FOR EACH ROW update tb_album set photonum=photonum+1 where id = new.albumid */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table tb_post
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_post`;

CREATE TABLE `tb_post` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `author` varchar(15) NOT NULL DEFAULT '' COMMENT '作者',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `color` varchar(7) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `urlname` varchar(100) NOT NULL DEFAULT '' COMMENT 'url名',
  `urltype` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'url访问形式',
  `content` mediumtext NOT NULL COMMENT '内容',
  `tags` varchar(100) NOT NULL DEFAULT '' COMMENT '标签',
  `views` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态{0:正常,1:草稿,2:回收站}',
  `posttime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发布时间',
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `istop` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `cover` varchar(70) DEFAULT '/static/upload/defaultcover.png' COMMENT '文章封面',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `posttime` (`posttime`),
  KEY `urlname` (`urlname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tb_post` WRITE;
/*!40000 ALTER TABLE `tb_post` DISABLE KEYS */;

INSERT INTO `tb_post` (`id`, `userid`, `author`, `title`, `color`, `urlname`, `urltype`, `content`, `tags`, `views`, `status`, `posttime`, `updated`, `istop`, `cover`)
VALUES
	(13,1,'admin','e2e2e21e','','',0,'<p>qdqwdqwdqwdqdddwqdwqdqwdwqdqdwq</p>',',21,',2,0,'2016-10-27 15:07:28','2016-10-27 15:08:06',0,'/static/upload/smallpic/20161027/1477552066302935382.png'),
	(14,1,'admin','e2e2e21e','','',0,'<p>qdqwdqwdqwdqdddwqdwqdqwdwqdqdwq</p>',',21,',2,0,'2016-10-27 15:07:28','2016-10-27 15:08:06',0,'/static/upload/smallpic/20161027/1477552066302935382.png'),
	(15,1,'admin','e2e2e21e','','',0,'<p>qdqwdqwdqwdqdddwqdwqdqwdwqdqdwq</p>',',21,',1,0,'2016-10-27 15:07:28','2016-10-27 15:08:06',0,'/static/upload/smallpic/20161027/1477552066302935382.png'),
	(16,1,'admin','e2e2e21e','','',0,'<p>qdqwdqwdqwdqdddwqdwqdqwdwqdqdwq</p>',',21,',8,0,'2016-10-27 15:07:28','2016-10-27 15:08:06',0,'/static/upload/smallpic/20161027/1477552066302935382.png'),
	(17,1,'admin','e2e2e21e','','',0,'<p>qdqwdqwdqwdqdddwqdwqdqwdwqdqdwq</p>',',21,',1,0,'2016-10-27 15:07:28','2016-10-27 15:08:06',0,'/static/upload/smallpic/20161027/1477552066302935382.png'),
	(30,1,'admin','go语言的http包','','',0,'<h1 id=\"h1_0\" style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; font-size: 24px; font-weight: 500;\">http服务</h1><h2 id=\"h2_1\" style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; font-size: 22px; font-weight: 500;\">引子，http的hello world</h2><p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin-bottom: 16px;\">如果要搜索“go http helloworld”的话，多半会搜索到以下代码</p><pre class=\"hljs go\" style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; overflow-x: auto; padding: 2px; background-color: rgb(63, 63, 63); color: rgb(220, 220, 220); border-radius: 3px; line-height: 1.4; word-wrap: normal; font-size: 13px; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace;\">package&nbsp;mainimport&nbsp;(&nbsp;&nbsp;&nbsp;&nbsp;&quot;io&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&quot;net/http&quot;)func&nbsp;main()&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;http.HandleFunc(&quot;/&quot;,&nbsp;sayhello)\r\n&nbsp;&nbsp;&nbsp;&nbsp;http.ListenAndServe(&quot;:8080&quot;,&nbsp;nil)\r\n}func&nbsp;sayhello(w&nbsp;http.ResponseWriter,&nbsp;r&nbsp;*http.Request)&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;io.WriteString(w,&nbsp;&quot;hello&nbsp;world&quot;)\r\n}</pre><p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin-bottom: 16px;\">这时，如果用浏览器访问localhost:8080的话，可以看到“hello world”<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/>main里的内容解释：</p><ol style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin-left: 30px; padding: 8px 15px;\" class=\" list-paddingleft-2\"><li><p>首先注册一个sayhello函数给“/”，当浏览器浏览“/”的时候，会调用sayhello函数</p></li><li><p>其次开始监听和服务，“:8080”表示本机所有的ip地址的8080口</p></li></ol><h2 id=\"h2_2\" style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; font-size: 22px; font-weight: 500;\">最简单的http服务</h2><p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin-bottom: 16px;\">现在开始，我由简入深的一步一步介绍net/http包<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/>首先，请先忘记引子里的<code style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; border-radius: 3px; padding: 2px; font-size: 13px;\">http.HandleFunc(&quot;/&quot;, sayhello)</code>，这个要到很后面才提到</p><p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin-bottom: 16px;\">其实要使用http包，一句话就可以了，代码如下</p><pre class=\"hljs go\" style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; overflow-x: auto; padding: 2px; background-color: rgb(63, 63, 63); color: rgb(220, 220, 220); border-radius: 3px; line-height: 1.4; word-wrap: normal; font-size: 13px; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace;\">package&nbsp;mainimport&nbsp;&quot;net/http&quot;func&nbsp;main()&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;http.ListenAndServe(&quot;:8080&quot;,&nbsp;nil)\r\n}</pre><p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin-bottom: 16px;\">访问网页后会发现，提示的不是“无法访问”，而是”页面没找到“，说明http已经开始服务了，只是没有找到页面<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/>由此可以看出，访问什么路径显示什么网页 这件事情，和ListenAndServe的第2个参数有关</p><p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin-bottom: 16px;\">查询<a href=\"http://gowalker.org/net/http#ListenAndServe\" style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; outline: 0px; border: none; transition: color 0.3s; text-decoration: none; color: rgb(68, 102, 187);\">ListenAndServe的文档</a>可知，第2个参数是一个<a href=\"http://gowalker.org/net/http#Handler\" style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; outline: 0px; border: none; transition: color 0.3s; text-decoration: none; color: rgb(68, 102, 187);\">Hander</a><br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/><a href=\"http://gowalker.org/net/http#Handler\" style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; outline: 0px; border: none; transition: color 0.3s; text-decoration: none; color: rgb(68, 102, 187);\">Hander</a>是啥呢，它是一个接口。这个接口很简单，只要某个struct有<code style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; border-radius: 3px; padding: 2px; font-size: 13px;\">ServeHTTP(http.ResponseWriter, *http.Request)</code>这个方法，那这个struct就自动实现了<a href=\"http://gowalker.org/net/http#Handler\" style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; outline: 0px; border: none; transition: color 0.3s; text-decoration: none; color: rgb(68, 102, 187);\">Hander</a>接口</p><p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin-bottom: 16px;\">显示什么网页取决于第二个参数Hander，Hander又只有1个ServeHTTP<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/>所以可以证明，显示什么网页取决于ServeHTTP</p><p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin-bottom: 16px;\">那就ServeHTTP方法，他需要2个参数，一个是http.ResponseWriter，另一个是<em style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\">http.Request<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/>往http.ResponseWriter写入什么内容，浏览器的网页源码就是什么内容&nbsp;</em>http.Request里面是封装了，浏览器发过来的请求（包含路径、浏览器类型等等）</p><h2 id=\"h2_3\" style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; font-size: 22px; font-weight: 500;\">认识http.ResponseWriter</h2><p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin-bottom: 16px;\">把上面“网页未找到”的代码改一下，让大家认识一下<code style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; border-radius: 3px; padding: 2px; font-size: 13px;\">http.ResponseWriter</code><br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/>看清楚了，ServeHTTP方法是自己写的啊，自己去实现</p><pre class=\"hljs go\" style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; overflow-x: auto; padding: 2px; background-color: rgb(63, 63, 63); color: rgb(220, 220, 220); border-radius: 3px; line-height: 1.4; word-wrap: normal; font-size: 13px; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace;\">package&nbsp;mainimport&nbsp;(&nbsp;&nbsp;&nbsp;&nbsp;&quot;io&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&quot;net/http&quot;)type&nbsp;a&nbsp;struct{}func&nbsp;(*a)&nbsp;ServeHTTP(w&nbsp;http.ResponseWriter,&nbsp;r&nbsp;*http.Request)&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;io.WriteString(w,&nbsp;&quot;hello&nbsp;world&nbsp;version&nbsp;1.&quot;)\r\n}func&nbsp;main()&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;http.ListenAndServe(&quot;:8080&quot;,&nbsp;&amp;a{})//第2个参数需要实现Hander的struct，a满足}</pre><p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin-bottom: 16px;\">现在<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/>访问localhost:8080的话，可以看到“hello world version 1.”<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/>访问localhost:8080/abc的话，可以看到“hello world version 1.”<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/>访问localhost:8080/123的话，可以看到“hello world version 1.”<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/>事实上访问任何路径都是“hello world version 1.”</p><p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin-bottom: 16px;\">哦，原来是这样，当<code style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; border-radius: 3px; padding: 2px; font-size: 13px;\">http.ListenAndServe(&quot;:8080&quot;, &amp;a{})</code>后，开始等待有访问请求<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/>一旦有访问请求过来，http包帮我们处理了一系列动作后，最后他会去调用a的<code style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; border-radius: 3px; padding: 2px; font-size: 13px;\">ServeHTTP</code>这个方法，并把自己已经处理好的<code style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; border-radius: 3px; padding: 2px; font-size: 13px;\">http.ResponseWriter, *http.Request</code>传进去<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/>而a的<code style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; border-radius: 3px; padding: 2px; font-size: 13px;\">ServeHTTP</code>这个方法，拿到<code style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; border-radius: 3px; padding: 2px; font-size: 13px;\">*http.ResponseWriter</code>后，并往里面写东西，客户端的网页就显示出来了</p><h2 id=\"h2_4\" style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; font-size: 22px; font-weight: 500;\">认识*http.Request</h2><p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin-bottom: 16px;\">现在把上面的代码再改一下，让大家认识一下<code style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; border-radius: 3px; padding: 2px; font-size: 13px;\">*http.Request</code></p><pre class=\"hljs go\" style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; overflow-x: auto; padding: 2px; background-color: rgb(63, 63, 63); color: rgb(220, 220, 220); border-radius: 3px; line-height: 1.4; word-wrap: normal; font-size: 13px; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace;\">package&nbsp;mainimport&nbsp;(&nbsp;&nbsp;&nbsp;&nbsp;&quot;io&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&quot;net/http&quot;)type&nbsp;a&nbsp;struct{}func&nbsp;(*a)&nbsp;ServeHTTP(w&nbsp;http.ResponseWriter,&nbsp;r&nbsp;*http.Request)&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;path&nbsp;:=&nbsp;r.URL.String()&nbsp;//获得访问的路径\r\n&nbsp;&nbsp;&nbsp;&nbsp;io.WriteString(w,&nbsp;path)\r\n}func&nbsp;main()&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;http.ListenAndServe(&quot;:8080&quot;,&nbsp;&amp;a{})//第2个参数需要实现Hander接口的struct，a满足}</pre><p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin-bottom: 16px;\">现在<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/>访问localhost:8080的话，可以看到“/”<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/>访问localhost:8080/abc的话，可以看到“/abc”<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/>访问localhost:8080/123的话，可以看到“/123”</p><h2 id=\"h2_5\" style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; font-size: 22px; font-weight: 500;\">最傻的网站</h2><p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin-bottom: 16px;\">如果再加上一些判断的话，一个最傻的可运行网站就出来了，如下</p><pre class=\"hljs go\" style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; overflow-x: auto; padding: 2px; background-color: rgb(63, 63, 63); color: rgb(220, 220, 220); border-radius: 3px; line-height: 1.4; word-wrap: normal; font-size: 13px; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace;\">package&nbsp;mainimport&nbsp;(&nbsp;&nbsp;&nbsp;&nbsp;&quot;io&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&quot;net/http&quot;)type&nbsp;a&nbsp;struct{}func&nbsp;(*a)&nbsp;ServeHTTP(w&nbsp;http.ResponseWriter,&nbsp;r&nbsp;*http.Request)&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;path&nbsp;:=&nbsp;r.URL.String()&nbsp;&nbsp;&nbsp;&nbsp;switch&nbsp;path&nbsp;{&nbsp;&nbsp;&nbsp;&nbsp;case&nbsp;&quot;/&quot;:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;io.WriteString(w,&nbsp;&quot;&lt;h1&gt;root&lt;/h1&gt;&lt;a&nbsp;href=\\&quot;abc\\&quot;&gt;abc&lt;/a&gt;&quot;)&nbsp;&nbsp;&nbsp;&nbsp;case&nbsp;&quot;/abc&quot;:\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;io.WriteString(w,&nbsp;&quot;&lt;h1&gt;abc&lt;/h1&gt;&lt;a&nbsp;href=\\&quot;/\\&quot;&gt;root&lt;/a&gt;&quot;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n}func&nbsp;main()&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;http.ListenAndServe(&quot;:8080&quot;,&nbsp;&amp;a{})//第2个参数需要实现Hander接口的struct，a满足}</pre><p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin-bottom: 16px;\">运行后，可以看出，一个case就是一个页面<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/>如果一个网站有上百个页面，那是否要上百个case？<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/>很不幸，是的<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/>那管理起来岂不是要累死？<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/>要累死，不过，还好有ServeMux</p><h2 id=\"h2_6\" style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; font-size: 22px; font-weight: 500;\">用ServeMux拯救最傻的网站</h2><p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin-bottom: 16px;\">现在来介绍<a href=\"http://gowalker.org/net/http#ServeMux\" style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; outline: 0px; border: none; transition: color 0.3s; text-decoration: none; color: rgb(68, 102, 187);\">ServeMux</a></p><p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin-bottom: 16px;\">ServeMux大致作用是，他有一张map表，map里的key记录的是r.URL.String()，而value记录的是一个方法，这个方法和ServeHTTP是一样的，这个方法有一个别名，叫<a href=\"http://gowalker.org/net/http#HandlerFunc\" style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; outline: 0px; border: none; transition: color 0.3s; text-decoration: none; color: rgb(68, 102, 187);\">HandlerFunc</a><br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/>ServeMux还有一个方法名字是<a href=\"http://gowalker.org/net/http#ServeMux_Handle\" style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; outline: 0px; border: none; transition: color 0.3s; text-decoration: none; color: rgb(68, 102, 187);\">Handle</a>，他是用来注册<a href=\"http://gowalker.org/net/http#HandlerFunc\" style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; outline: 0px; border: none; transition: color 0.3s; text-decoration: none; color: rgb(68, 102, 187);\">HandlerFunc</a>&nbsp;的<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/>ServeMux还有另一个方法名字是ServeHTTP，这样ServeMux是实现Handler接口的，否者无法当http.ListenAndServe的第二个参数传输</p><p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin-bottom: 16px;\">代码来了</p><pre class=\"hljs go\" style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; overflow-x: auto; padding: 2px; background-color: rgb(63, 63, 63); color: rgb(220, 220, 220); border-radius: 3px; line-height: 1.4; word-wrap: normal; font-size: 13px; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace;\">package&nbsp;mainimport&nbsp;(&nbsp;&nbsp;&nbsp;&nbsp;&quot;net/http&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&quot;io&quot;)type&nbsp;b&nbsp;struct{}func&nbsp;(*b)&nbsp;ServeHTTP(w&nbsp;http.ResponseWriter,&nbsp;r&nbsp;*http.Request)&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;io.WriteString(w,&nbsp;&quot;hello&quot;)\r\n}func&nbsp;main()&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;mux&nbsp;:=&nbsp;http.NewServeMux()\r\n&nbsp;&nbsp;&nbsp;&nbsp;mux.Handle(&quot;/h&quot;,&nbsp;&amp;b{})\r\n&nbsp;&nbsp;&nbsp;&nbsp;http.ListenAndServe(&quot;:8080&quot;,&nbsp;mux)\r\n}</pre><p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin-bottom: 16px;\">解释一下<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/><code style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; border-radius: 3px; padding: 2px; font-size: 13px;\">mux := http.NewServeMux()</code>:新建一个ServeMux。<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/><code style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; border-radius: 3px; padding: 2px; font-size: 13px;\">mux.Handle(&quot;/&quot;, &amp;b{})</code>:注册路由，把&quot;/&quot;注册给b这个实现Handler接口的struct，注册到map表中。<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/><code style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; border-radius: 3px; padding: 2px; font-size: 13px;\">http.ListenAndServe(&quot;:8080&quot;, mux)</code>第二个参数是mux。<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/>运行时，因为第二个参数是mux，所以http会调用mux的ServeHTTP方法。<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/>ServeHTTP方法执行时，会检查map表（表里有一条数据，key是“/h”，value是&amp;b{}的ServeHTTP方法）<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/>如果用户访问<code style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; border-radius: 3px; padding: 2px; font-size: 13px;\">/h</code>的话，mux因为匹配上了，mux的ServeHTTP方法会去调用&amp;b{}的 ServeHTTP方法，从而打印hello<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/>如果用户访问<code style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; border-radius: 3px; padding: 2px; font-size: 13px;\">/abc</code>的话，mux因为没有匹配上，从而打印404 page not found</p><p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin-bottom: 16px;\"><strong style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\">ServeMux就是个二传手！</strong></p><h2 id=\"h2_7\" style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; font-size: 22px; font-weight: 500;\">ServeMux的HandleFunc方法</h2><p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin-bottom: 16px;\">发现了没有，b这个struct仅仅是为了装一个ServeHTTP而存在，所以能否跳过b呢，ServeMux说：可以<a href=\"http://gowalker.org/net/http#ServeMux_HandleFunc\" style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; outline: 0px; border: none; transition: color 0.3s; text-decoration: none; color: rgb(68, 102, 187);\">mux.HandleFunc</a>是用来注册func到map表中的</p><pre class=\"hljs go\" style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; overflow-x: auto; padding: 2px; background-color: rgb(63, 63, 63); color: rgb(220, 220, 220); border-radius: 3px; line-height: 1.4; word-wrap: normal; font-size: 13px; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace;\">package&nbsp;mainimport&nbsp;(&nbsp;&nbsp;&nbsp;&nbsp;&quot;net/http&quot;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&quot;io&quot;)func&nbsp;main()&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;mux&nbsp;:=&nbsp;http.NewServeMux()\r\n&nbsp;&nbsp;&nbsp;&nbsp;mux.HandleFunc(&quot;/h&quot;,&nbsp;func(w&nbsp;http.ResponseWriter,&nbsp;r&nbsp;*http.Request)&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;io.WriteString(w,&nbsp;&quot;hello&quot;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;})\r\n&nbsp;&nbsp;&nbsp;&nbsp;mux.HandleFunc(&quot;/bye&quot;,&nbsp;func(w&nbsp;http.ResponseWriter,&nbsp;r&nbsp;*http.Request)&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;io.WriteString(w,&nbsp;&quot;byebye&quot;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;})\r\n&nbsp;&nbsp;&nbsp;&nbsp;mux.HandleFunc(&quot;/hello&quot;,&nbsp;sayhello)\r\n&nbsp;&nbsp;&nbsp;&nbsp;http.ListenAndServe(&quot;:8080&quot;,&nbsp;mux)\r\n}func&nbsp;sayhello(w&nbsp;http.ResponseWriter,&nbsp;r&nbsp;*http.Request)&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;io.WriteString(w,&nbsp;&quot;hello&nbsp;world&quot;)\r\n}</pre><h2 id=\"h2_8\" style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; font-size: 22px; font-weight: 500;\">ServeMux的白话解释</h2><p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin-bottom: 16px;\">如果把http服务想象成一个公司的话 没有ServeMux的话，就像这个公司只有1个人--老板，什么事情都是由老板来做（自己写switch） 包括做业务（“/sales”），做帐（“/account”），内勤（“/management”），扫地（“/cleaner”）</p><p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin-bottom: 16px;\">后来老板招了4个人，负责上面的4件事情，那老板要做的就是根据情况转发就是了，比如做业务的事情，自己就不用去跑客户了，交给销售经理去做，并给销售经理一些资源（包括客户名称地址什么的）<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/>上面代码里的<code style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; border-radius: 3px; padding: 2px; font-size: 13px;\">type b struct{}</code>就是个销售经理，资源就是<code style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; border-radius: 3px; padding: 2px; font-size: 13px;\">w http.ResponseWriter, r *http.Request</code>，老板要工作的就是ServeMux要做的工作</p><p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin-bottom: 16px;\">以上的代码就做了一层转发，老板给销售经理事情后，销售经理去跑客户了，也就结束了</p><p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin-bottom: 16px;\">实际生活中，销售经理不会自己去跑客户的，他也会把接来的活转给更下面的业务员<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/>那时，销售经理自己也变成一个ServeMux了</p><p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin-bottom: 16px;\">所以为了可以ServeMux套ServeMux，需要改造一下ServeMux的ServeHTTP，改完后可以嵌套无限层，把要做的事情不断的细化<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/>到最后要真正做事情的人，只需要关心自己要做的事情就可以了，自己做自己份内的事，一个大公司就运作起来了</p><h2 id=\"h2_9\" style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; font-size: 22px; font-weight: 500;\">回到开头</h2><p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin-bottom: 16px;\">回到开头，有让大家先忘掉<code style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; border-radius: 3px; padding: 2px; font-size: 13px;\">http.HandleFunc(&quot;/&quot;, sayhello)</code>&nbsp;<em style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\">请先忘记引子里的<code style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; border-radius: 3px; padding: 2px; font-size: 13px;\">http.HandleFunc(&quot;/&quot;, sayhello)</code>，这个要到很后面才提到</em></p><p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin-bottom: 16px;\">当<code style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; border-radius: 3px; padding: 2px; font-size: 13px;\">http.ListenAndServe(&quot;:8080&quot;, nil)</code>的第2个参数是nil时<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\"/>http内部会自己建立一个叫DefaultServeMux的ServeMux，因为这个ServeMux是http自己维护的，如果要向这个ServeMux注册的话，就要用http.HandleFunc这个方法啦，现在看很简单吧</p><p><br/></p>',',go,',1,0,'2016-10-31 09:27:57','2016-10-31 09:30:09',0,'/static/upload/smallpic/20161031/1477877398919697963.jpeg');

/*!40000 ALTER TABLE `tb_post` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_tag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_tag`;

CREATE TABLE `tb_tag` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '标签名',
  `count` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '使用次数',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tb_tag` WRITE;
/*!40000 ALTER TABLE `tb_tag` DISABLE KEYS */;

INSERT INTO `tb_tag` (`id`, `name`, `count`)
VALUES
	(10,'21',1),
	(11,'go',1);

/*!40000 ALTER TABLE `tb_tag` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_tag_post
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_tag_post`;

CREATE TABLE `tb_tag_post` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tagid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '标签id',
  `postid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '内容id',
  `poststatus` tinyint(3) NOT NULL DEFAULT '0' COMMENT '内容状态',
  `posttime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发布时间',
  PRIMARY KEY (`id`),
  KEY `tagid` (`tagid`),
  KEY `postid` (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tb_tag_post` WRITE;
/*!40000 ALTER TABLE `tb_tag_post` DISABLE KEYS */;

INSERT INTO `tb_tag_post` (`id`, `tagid`, `postid`, `poststatus`, `posttime`)
VALUES
	(56,10,13,0,'2016-10-27 15:08:06'),
	(57,11,30,0,'2016-10-31 09:30:09');

/*!40000 ALTER TABLE `tb_tag_post` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `logincount` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `lastip` varchar(15) NOT NULL DEFAULT '0' COMMENT '最后登录ip',
  `lastlogin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后登录时间',
  `authkey` char(10) NOT NULL DEFAULT '' COMMENT '登录key',
  `active` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否激活',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;

INSERT INTO `tb_user` (`id`, `username`, `password`, `email`, `logincount`, `lastip`, `lastlogin`, `authkey`, `active`)
VALUES
	(1,'admin','21232f297a57a5a743894a0e4a801fc3','admin@admin.com',9,'127.0.0.1','2016-10-31 09:16:23','',1),
	(2,'root','21232f297a57a5a743894a0e4a801fc3','',1,'127.0.0.1','2016-10-31 14:22:44','',1);

/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
