/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 100138
 Source Host           : localhost:3306
 Source Schema         : backstage-ims

 Target Server Type    : MySQL
 Target Server Version : 100138
 File Encoding         : 65001

 Date: 05/09/2019 10:46:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `classify_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, 'Element Men', '1', '<p>首先我们需要修改路由的嵌套规则，因为在导航中我们还涉及到二级导航。同时，我们在路由的 meta 信息中定义 nav 属性，属性中包含 icon 和 title 用于定义其导航的图表和标题。</p>', '2019-07-15 10:45:59');
INSERT INTO `article` VALUES (2, '任务要求：', '1', '<ol><li>使用公共的 models 封装 M 层。</li><li>完成用户管理增删改查。</li><li>完成分类管理增删改查。</li></ol><p><br></p>', '2019-07-15 10:45:59');
INSERT INTO `article` VALUES (3, '高尔达', '3', '<p><span style=\"color: rgb(48, 68, 85); background-color: rgb(255, 255, 255);\">一个&nbsp;</span><code style=\"color: rgb(214, 50, 0); background-color: rgb(248, 248, 248);\">errorCaptured</code><span style=\"color: rgb(48, 68, 85); background-color: rgb(255, 255, 255);\">&nbsp;钩子能够返回&nbsp;</span><code style=\"color: rgb(214, 50, 0); background-color: rgb(248, 248, 248);\">false</code><span style=\"color: rgb(48, 68, 85); background-color: rgb(255, 255, 255);\">&nbsp;以阻止错误继续向上传播。本质上是说“这个错误已经被搞定了且应该被忽略”。它会阻止其它任何会被这个错误唤起的&nbsp;</span><code style=\"color: rgb(214, 50, 0); background-color: rgb(248, 248, 248);\">errorCaptured</code><span style=\"color: rgb(48, 68, 85); background-color: rgb(255, 255, 255);\">&nbsp;钩子和全局的&nbsp;</span><code style=\"color: rgb(214, 50, 0); background-color: rgb(248, 248, 248);\">config.errorHandler</code><span style=\"color: rgb(48, 68, 85); background-color: rgb(255, 255, 255);\">。</span></p>', '2019-07-16 09:39:49');
INSERT INTO `article` VALUES (4, '《拿手好戏》之吉利寻觅至今的混动技术 ', '4', '<p>[汽车之家 <a href=\"https://www.autohome.com.cn/tech/\" target=\"_blank\">技术·设计频道</a>]&nbsp;当不知道选橙汁还是苹果汁的时候，往往很多人会选择mix（混合）果汁，mix方式解决了选择困难症朋友的问题。在传统燃油车和纯电动车之间也有一种mix产品——混合动力汽车。混动技术门槛较高，所以当初新能源汽车趋势崭露头角的时候，很多中国品牌直接选择了放弃，而将重心放在研发纯电动上。</p><p><strong>很多人说“世界上只有两种混动，一种是丰田混动，另一种是其他混动”，这句话确实很形象地表达了过去20年时间里，丰田混动技术在全球的霸主地位。但，这并不代表别人没有机会，德国人不相信、美国人不相信，中国人也同样不相信。</strong>比如，十几年前的吉利就开始了混动技术之路，而且今天仍执着如故……</p>', '2019-07-25 15:35:05');
INSERT INTO `article` VALUES (5, '推荐耀智版和耀享版 博瑞GE购车手册 ', '4', '<p>博瑞GE的动力上分为插电混动（PHEV）和轻度混动（MHEV）两种，在我们拿到它的测试车之前，先给大家分析一下各个配置车型之间的差异，看看哪款车型的性价比最高。博瑞GE一共有八款车型，其中三款为插电混动版本，五款为轻度混动版本，价格从13.68-19.98万元。</p>', '2019-07-25 15:40:11');
INSERT INTO `article` VALUES (6, '“黑八奇迹”的预演 博瑞GE对比C 260 L ', '4', '<p>&nbsp;这次我们不做雅阁天籁(<a href=\"https://vr.autohome.com.cn/car/15006?sceneName=scene_2080&amp;pvareaid=3274107\" target=\"_blank\">3年0息</a>)凯美瑞这种常规对比了，也来个狠的吧：吉利博瑞GE对比奔驰C 260 L。你没看错，一个是中国品牌最强中型车，另一个是中型豪华轿车的标杆，两者看上去竞争关系不大，毕竟品牌和定位的差别明显，指导价也差出去一半儿了。实际上这俩车的车型级别、动力系统什么的都能对上号。<a href=\"https://www.autohome.com.cn/4762/\" target=\"_blank\">博瑞GE</a>(<a href=\"https://car.autohome.com.cn/config/series/4762.html\" target=\"_blank\">参数</a>|<a href=\"https://leads.autohome.com.cn/landingpage/views/pc/pcInquiry/id_10001344/channelid_29/?seriesid=4762&amp;eid=1|1|37|3|203736|302100\" target=\"_blank\">询价</a>)能上演“黑八奇迹”吗？C 260 L（下文或简称C级）会受到威胁吗？</p>', '2019-07-25 15:42:39');

-- ----------------------------
-- Table structure for classify
-- ----------------------------
DROP TABLE IF EXISTS `classify`;
CREATE TABLE `classify`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classify` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of classify
-- ----------------------------
INSERT INTO `classify` VALUES (1, '汽车', 'porsche', NULL);
INSERT INTO `classify` VALUES (3, '高达', '隔壁老王', NULL);
INSERT INTO `classify` VALUES (4, NULL, '吉利', NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `operation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '666', '13825409682', '1', '2019-07-15 10:45:59', NULL);
INSERT INTO `user` VALUES (2, '董钊', '15917772201', '1', '2019-07-15 09:45:40', NULL);
INSERT INTO `user` VALUES (5, '下雨天', '13431870348', '1', '2019-07-25 11:49:08', NULL);
INSERT INTO `user` VALUES (6, '666', '13825409682', '1', '2019-07-25 11:51:12', NULL);
INSERT INTO `user` VALUES (7, '董先生', '13825409682', '1', '2019-07-25 11:54:42', NULL);

SET FOREIGN_KEY_CHECKS = 1;
