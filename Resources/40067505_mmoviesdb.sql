-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 25, 2019 at 06:19 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

DROP DATABASE IF EXISTS 40067505_mmoviesdb;

CREATE Database 40067505_mmoviesdb;
USE 40067505_mmoviesdb;


-- --------------------------------------------------------

--
-- Stand-in structure for view `activeuser`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `activeuser`;
CREATE TABLE IF NOT EXISTS `activeuser` (
`UserID` int(11)
,`Surname` varchar(30)
,`Firstname` varchar(30)
,`Email` varchar(50)
,`DateJoined` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `adminlist`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `adminlist`;
CREATE TABLE IF NOT EXISTS `adminlist` (
`Surname` varchar(30)
,`Firstname` varchar(30)
,`Email` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `discuserlist`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `discuserlist`;
CREATE TABLE IF NOT EXISTS `discuserlist` (
`Surname` varchar(30)
,`Firstname` varchar(30)
,`Email` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `discussion`
--

DROP TABLE IF EXISTS `discussion`;
CREATE TABLE IF NOT EXISTS `discussion` (
  `DiscussionID` int(11) NOT NULL AUTO_INCREMENT,
  `DisCommentID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`DiscussionID`),
  UNIQUE KEY `DisCommentID` (`DisCommentID`),
  KEY `UserID` (`UserID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `discussion`
--

INSERT INTO `discussion` (`DiscussionID`, `DisCommentID`, `UserID`) VALUES
(1, 1, 49),
(2, 13, 6),
(3, 10, 24),
(4, 9, 34),
(5, 18, 25),
(6, 3, 26),
(7, 20, 15),
(8, 5, 48),
(9, 12, 3),
(10, 16, 11),
(11, 2, 31),
(12, 17, 31),
(13, 19, 40),
(14, 6, 45),
(15, 15, 38),
(16, 11, 47),
(17, 7, 20),
(18, 14, 19),
(19, 4, 16),
(20, 8, 19),
(32, 34, 52);

-- --------------------------------------------------------

--
-- Table structure for table `discussioncomment`
--

DROP TABLE IF EXISTS `discussioncomment`;
CREATE TABLE IF NOT EXISTS `discussioncomment` (
  `DisCommentID` int(11) NOT NULL AUTO_INCREMENT,
  `Comment` varchar(200) NOT NULL,
  `Time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`DisCommentID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `discussioncomment`
--

INSERT INTO `discussioncomment` (`DisCommentID`, `Comment`, `Time`) VALUES
(1, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', '2019-04-24 18:34:55'),
(2, 'Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula co', '2019-04-24 18:34:55'),
(3, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rho', '2019-04-24 18:34:55'),
(4, 'Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non ', '2019-04-24 18:34:55'),
(5, 'Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nul', '2019-04-24 18:34:55'),
(6, 'Aliquam erat volutpat. In congue. Etiam justo.', '2019-04-24 18:34:55'),
(7, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristiq', '2019-04-24 18:34:55'),
(8, 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutp', '2019-04-24 18:34:55'),
(9, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', '2019-04-24 18:34:55'),
(10, 'Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam conval', '2019-04-24 18:34:55'),
(11, 'Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', '2019-04-24 18:34:55'),
(12, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', '2019-04-24 18:34:55'),
(13, 'Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a od', '2019-04-24 18:34:55'),
(14, 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagit', '2019-04-24 18:34:55'),
(15, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.', '2019-04-24 18:34:55'),
(16, 'Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', '2019-04-24 18:34:55'),
(17, 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.', '2019-04-24 18:34:55'),
(18, 'Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', '2019-04-24 18:34:55'),
(19, 'Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus.', '2019-04-24 18:34:55'),
(20, 'Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', '2019-04-24 18:34:55'),
(34, 'Interesting Discussion Board!', '2019-04-25 19:14:01');

-- --------------------------------------------------------

--
-- Stand-in structure for view `disdata`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `disdata`;
CREATE TABLE IF NOT EXISTS `disdata` (
`DiscussionID` int(11)
,`Firstname` varchar(30)
,`Surname` varchar(30)
,`Avatar` varchar(100)
,`Comment` varchar(200)
,`Time` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `filmcount`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `filmcount`;
CREATE TABLE IF NOT EXISTS `filmcount` (
`COUNT(DISTINCT FilmID)` bigint(21)
,`FilmRating` varchar(3)
);

-- --------------------------------------------------------

--
-- Table structure for table `films`
--

DROP TABLE IF EXISTS `films`;
CREATE TABLE IF NOT EXISTS `films` (
  `FilmID` int(11) NOT NULL AUTO_INCREMENT,
  `FilmName` varchar(100) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `FilmRating` varchar(3) NOT NULL,
  `FilmImg` varchar(150) NOT NULL,
  PRIMARY KEY (`FilmID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `films`
--

INSERT INTO `films` (`FilmID`, `FilmName`, `Description`, `FilmRating`, `FilmImg`) VALUES
(1, 'Jack Frost', 'Poisn by predom alpha-adrenocpt agonists, self-harm, init', 'U', 'http://dummyimage.com/212x123.png/ff4444/ffffff'),
(2, 'American Dream', 'Poisn by antigonadtr/antiestr/antiandrg, NEC, assault, init', 'PG', 'http://dummyimage.com/224x131.png/cc0000/ffffff'),
(3, 'Asterix and the Gauls (Astérix le Gaulois)', 'Disp fx of middle third of navic bone of l wrist, sequela', 'U', 'http://dummyimage.com/250x183.bmp/ff4444/ffffff'),
(4, 'Tusk', 'Other fractures of lower end of right radius, sequela', 'U', 'http://dummyimage.com/202x212.png/ff4444/ffffff'),
(5, 'Mrs. Brown (a.k.a. Her Majesty, Mrs. Brown)', 'Poisoning by otorhino drugs and prep, assault, sequela', 'PG', 'http://dummyimage.com/194x114.png/dddddd/000000'),
(6, 'Absolute Giganten', 'Congenital occlusion of ureteropelvic junction', 'PG', 'http://dummyimage.com/210x234.bmp/dddddd/000000'),
(7, 'Zatoichi\'s Pilgrimage (Zatôichi umi o wataru) (Zatôichi 14)', 'Quad preg, unable to dtrm num plcnta & amnio sacs, first tri', 'U', 'http://dummyimage.com/153x187.jpg/dddddd/000000'),
(8, 'Female', 'Hemiplegic migraine, intractable', '12a', 'http://dummyimage.com/135x150.jpg/ff4444/ffffff'),
(9, 'Fall Time', 'Walked into wall', 'U', 'http://dummyimage.com/141x124.png/5fa2dd/ffffff'),
(10, 'Cooking with Stella', 'Flail joint, left elbow', '15', 'http://dummyimage.com/209x136.jpg/cc0000/ffffff'),
(11, 'Wedding Party, The (Die Bluthochzeit)', 'Underdosing of keratolyt/keratplst/hair trmt drug, subs', 'U', 'http://dummyimage.com/138x170.png/ff4444/ffffff'),
(12, 'Giant Spider Invasion, The', 'Person outside pk-up/van inj in clsn w hv veh in traf, init', 'PG', 'http://dummyimage.com/169x168.png/dddddd/000000'),
(13, 'Chaperone, The', 'Type 1 diab with prolif diab rtnop without mclr edema, unsp', '15', 'http://dummyimage.com/235x106.jpg/dddddd/000000'),
(14, 'Comfort of Strangers, The', 'Injury of facial nerve, right side, initial encounter', '12', 'http://dummyimage.com/226x230.bmp/dddddd/000000'),
(15, 'The Devil Thumbs a Ride', 'Breakdown (mechanical) of int fix of bone of l low leg, init', '18', 'http://dummyimage.com/204x128.bmp/ff4444/ffffff'),
(16, 'Wild Party, The', 'Superficial foreign body, left lower leg, initial encounter', 'U', 'http://dummyimage.com/218x206.jpg/cc0000/ffffff'),
(17, 'The Key', 'Myeloid leukemia, unspecified', 'PG', 'http://dummyimage.com/103x202.png/ff4444/ffffff'),
(18, 'Chris Rock: Bring the Pain', 'Nondisp spiral fx shaft of ulna, l arm, 7thH', '18', 'http://dummyimage.com/128x239.jpg/ff4444/ffffff'),
(19, 'Tenderness (Hellyys)', 'Sltr-haris Type I physl fx upr end r fibula, 7thD', '18', 'http://dummyimage.com/171x121.png/5fa2dd/ffffff'),
(20, 'Time to Die (Tiempo de morir)', 'Glare sensitivity', '18', 'http://dummyimage.com/208x152.bmp/cc0000/ffffff'),
(21, 'Spartacus', 'Unsp mtrcy rider injured in collision w oth mv in traf, subs', '12', 'http://dummyimage.com/101x186.png/5fa2dd/ffffff'),
(22, 'Stuck in Love', 'Poisoning by macrolides, intentional self-harm, subs encntr', '15', 'http://dummyimage.com/137x126.png/ff4444/ffffff'),
(23, 'Heartbeats (Les amours imaginaires)', 'Occup of bus injured in collision w 2/3-whl mv in traf, init', 'PG', 'http://dummyimage.com/234x137.bmp/5fa2dd/ffffff'),
(24, 'What\'s Up, Tiger Lily?', 'Fx oth skull and facial bones, unspecified side, 7thG', '12a', 'http://dummyimage.com/226x102.bmp/5fa2dd/ffffff'),
(25, 'Nights and Weekends', 'Thrombosis due to nervous system prosth dev/grft, sequela', '12a', 'http://dummyimage.com/236x212.jpg/cc0000/ffffff'),
(26, 'Snug as a Bug (U Pana Boga za piecem)', 'War op involving oth explosn and fragments, civilian, init', '18', 'http://dummyimage.com/211x186.jpg/5fa2dd/ffffff'),
(27, 'Jingle All the Way', 'Inj unsp blood vess at abdomen, lower back and pelvis level', '15', 'http://dummyimage.com/113x119.png/cc0000/ffffff'),
(28, 'Everything', 'Contusion of left hand', '12', 'http://dummyimage.com/112x138.bmp/5fa2dd/ffffff'),
(29, 'Fabulous Baker Boys, The', 'Moderate laceration of body of pancreas, initial encounter', '12a', 'http://dummyimage.com/198x184.jpg/cc0000/ffffff'),
(30, 'Piece of the Action, A', 'Displacement of surgically created arteriovenous shunt, init', 'U', 'http://dummyimage.com/191x119.bmp/dddddd/000000'),
(31, 'Bulworth', 'Fall into natrl body of water strk botm cause oth inj, subs', 'U', 'http://dummyimage.com/133x100.jpg/cc0000/ffffff'),
(32, 'Midsummer Night\'s Sex Comedy, A', 'Acute and subacute iridocyclitis', 'U', 'http://dummyimage.com/226x158.jpg/cc0000/ffffff'),
(33, 'Johnny English Reborn', 'Fall from, out of or through window, subsequent encounter', '12', 'http://dummyimage.com/159x238.png/dddddd/000000'),
(34, 'Lackawanna Blues', 'Corrosion of unspecified degree of left upper arm', '12', 'http://dummyimage.com/139x138.bmp/cc0000/ffffff'),
(35, 'Passion Fish', 'Pnctr w fb of l little finger w/o damage to nail, init', 'U', 'http://dummyimage.com/146x185.bmp/5fa2dd/ffffff'),
(36, 'Thin Ice', 'Disp fx of lateral condyle of r tibia, 7thD', '12', 'http://dummyimage.com/203x222.bmp/dddddd/000000'),
(37, 'Tribes', 'Cerebral infarction due to embolism of precerebral arteries', '12a', 'http://dummyimage.com/149x177.png/cc0000/ffffff'),
(38, 'You Will Meet a Tall Dark Stranger', 'Puncture wound with foreign body of pansies, sequela', '12', 'http://dummyimage.com/243x175.png/dddddd/000000'),
(39, 'House of Tolerance', 'Disp fx of middle third of navicular bone of l wrist, init', 'PG', 'http://dummyimage.com/234x109.png/dddddd/000000'),
(40, 'Graveyard of Honor (Shin jingi no hakaba)', 'Atrophic flaccid tympanic membrane, unspecified ear', 'U', 'http://dummyimage.com/220x213.bmp/5fa2dd/ffffff'),
(41, 'Villa Rides!', 'Nondisp oblique fx shaft of unsp tibia, 7thF', '15', 'http://dummyimage.com/125x171.png/dddddd/000000'),
(42, 'Scar, The (Blizna)', 'Traum rupture of ligament of r rng fngr at MCP/IP jt, subs', 'PG', 'http://dummyimage.com/213x170.png/dddddd/000000'),
(43, 'Costa Brava', 'Legal intervnt w unsp firearm disch, suspect injured, init', '15', 'http://dummyimage.com/134x230.jpg/cc0000/ffffff'),
(44, 'Breathless (À bout de souffle)', 'Age-rel osteopor w current path fracture, r humerus, init', 'PG', 'http://dummyimage.com/224x177.jpg/cc0000/ffffff'),
(45, 'Quatermass and the Pit', 'Nondisp fx of body of unsp calcaneus, init for clos fx', 'PG', 'http://dummyimage.com/116x156.png/dddddd/000000'),
(46, 'Stop-Loss', 'Other specified arthritis, left shoulder', 'U', 'http://dummyimage.com/231x217.png/dddddd/000000'),
(47, 'Imaginary Heroes', 'Bipolar disord, in full remis, most recent episode hypomanic', 'PG', 'http://dummyimage.com/238x173.jpg/ff4444/ffffff'),
(48, 'M. Hulot’s Holiday (Mr. Hulot\'s Holiday) (Vacances de Monsieur Hulot, Les)', 'Disorder of fatty-acid metabolism, unspecified', 'PG', 'http://dummyimage.com/184x118.jpg/cc0000/ffffff'),
(49, 'Reckoning, The', 'Activity, vacuuming', '12', 'http://dummyimage.com/241x211.png/5fa2dd/ffffff'),
(50, 'Rock \'N\' Roll High School', 'Sprain of unspecified parts of left shoulder girdle', 'U', 'http://dummyimage.com/106x125.jpg/dddddd/000000');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `LogID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `IpAddress` varchar(16) NOT NULL,
  `DateAccessed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LogID`),
  KEY `UserID` (`UserID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`LogID`, `UserID`, `IpAddress`, `DateAccessed`) VALUES
(1, 14, '165.217.98.116', '2018-11-19 00:00:00'),
(2, 14, '25.200.36.229', '2018-11-08 00:00:00'),
(3, 16, '135.49.71.152', '2018-12-26 00:00:00'),
(4, 32, '55.30.167.223', '2018-12-14 00:00:00'),
(5, 42, '121.181.55.74', '2018-12-13 00:00:00'),
(6, 28, '8.195.51.80', '2018-11-16 00:00:00'),
(7, 29, '113.98.245.95', '2018-10-24 00:00:00'),
(8, 44, '59.16.144.17', '2018-10-30 00:00:00'),
(9, 17, '217.95.241.209', '2018-11-22 00:00:00'),
(10, 6, '242.36.155.251', '2018-10-07 00:00:00'),
(11, 18, '223.241.233.110', '2018-12-11 00:00:00'),
(12, 28, '49.26.14.239', '2018-11-27 00:00:00'),
(13, 37, '236.151.161.111', '2018-12-09 00:00:00'),
(14, 19, '240.206.175.240', '2018-12-02 00:00:00'),
(15, 26, '14.252.136.210', '2018-10-17 00:00:00'),
(16, 46, '2.196.124.68', '2018-12-15 00:00:00'),
(17, 44, '62.182.144.241', '2018-10-10 00:00:00'),
(18, 1, '18.123.143.109', '2018-12-04 00:00:00'),
(19, 3, '175.141.145.143', '2018-11-17 00:00:00'),
(20, 40, '236.130.147.176', '2018-12-12 00:00:00'),
(21, 21, '175.182.102.129', '2019-01-01 00:00:00'),
(22, 27, '138.118.175.6', '2018-10-16 00:00:00'),
(23, 6, '135.104.141.111', '2018-10-28 00:00:00'),
(24, 30, '194.58.205.228', '2019-01-08 00:00:00'),
(25, 23, '73.176.134.88', '2018-12-22 00:00:00'),
(26, 9, '208.45.48.47', '2018-11-02 00:00:00'),
(27, 25, '56.221.196.125', '2019-01-03 00:00:00'),
(28, 48, '152.42.169.36', '2018-11-05 00:00:00'),
(29, 37, '154.31.80.49', '2018-12-01 00:00:00'),
(30, 13, '77.223.239.243', '2018-11-27 00:00:00'),
(73, 52, '::1', '2019-04-25 19:10:54');

-- --------------------------------------------------------

--
-- Stand-in structure for view `nonrevfilms`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `nonrevfilms`;
CREATE TABLE IF NOT EXISTS `nonrevfilms` (
`FilmID` int(11)
,`FilmName` varchar(100)
,`Description` varchar(200)
);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `ProfileID` int(11) NOT NULL AUTO_INCREMENT,
  `Bio` varchar(200) DEFAULT 'None!',
  `Avatar` varchar(100) DEFAULT '	 http://dummyimage.com/250x250.jpg/cc0000/ffffff',
  `FavMovie` varchar(30) DEFAULT 'None!',
  PRIMARY KEY (`ProfileID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`ProfileID`, `Bio`, `Avatar`, `FavMovie`) VALUES
(1, 'Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', NULL, 'Abbott and Costello Meet Dr. J'),
(2, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', NULL, 'Wesley Willis: The Daddy of Ro'),
(3, 'Praesent blandit.', NULL, 'Night at the Roxbury, A'),
(4, 'Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id ', NULL, 'Texas Carnival'),
(5, 'Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit ', NULL, 'Bad Asses (Bad Ass 2)'),
(6, 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in', NULL, 'City of Your Final Destination'),
(7, 'Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mu', NULL, 'Elevator Girl'),
(8, 'In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at ', NULL, 'Kidnapped'),
(9, 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.', NULL, 'Ixcanul Volcano'),
(10, 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien', NULL, 'Topper'),
(11, 'Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra ped', NULL, 'Luzhin Defence, The'),
(12, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacini', NULL, 'Iraq in Fragments'),
(13, 'Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.', NULL, 'Catching Hell'),
(14, 'Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 'http://dummyimage.com/250x250.jpg/333333/ffffff', 'Sittin\' on a Backyard Fence'),
(15, 'Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ', NULL, 'Charlie Chan in Panama'),
(16, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at n', NULL, 'Boys Next Door, The'),
(17, 'Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tinc', NULL, 'Richard Pryor Here and Now'),
(18, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio.', NULL, 'Zombie Island Massacre'),
(19, 'Maecenas rhoncus aliquam lacus.', NULL, 'Color Me Blood Red'),
(20, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', 'https://dummyimage.com/250x250.jpg/green/black', 'Empire of the Sun'),
(21, 'testbio', 'http://dummyimage.com/250x250.jpg/cc0000/ffffff', 'Test: The Movie'),
(32, 'Short and sweet bio', '	 http://dummyimage.com/250x250.jpg/cc0000/ffffff', 'Test');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `ReviewID` int(11) NOT NULL AUTO_INCREMENT,
  `RevCommentID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `FilmID` int(11) NOT NULL,
  PRIMARY KEY (`ReviewID`),
  UNIQUE KEY `RevCommentID` (`RevCommentID`),
  KEY `UserID` (`UserID`) USING BTREE,
  KEY `FilmID` (`FilmID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`ReviewID`, `RevCommentID`, `UserID`, `FilmID`) VALUES
(1, 19, 20, 43),
(2, 1, 37, 13),
(3, 5, 32, 25),
(4, 4, 21, 22),
(5, 14, 8, 38),
(6, 9, 41, 17),
(7, 18, 12, 24),
(8, 6, 15, 22),
(9, 15, 21, 45),
(10, 10, 49, 14),
(11, 7, 31, 11),
(12, 8, 28, 24),
(13, 3, 50, 43),
(14, 12, 48, 16),
(15, 16, 12, 12),
(16, 13, 16, 27),
(17, 11, 2, 30),
(18, 20, 24, 33),
(19, 17, 3, 18),
(20, 2, 29, 47),
(25, 25, 52, 33);

-- --------------------------------------------------------

--
-- Table structure for table `reviewcomment`
--

DROP TABLE IF EXISTS `reviewcomment`;
CREATE TABLE IF NOT EXISTS `reviewcomment` (
  `RevCommentID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(40) NOT NULL,
  `Comment` varchar(200) NOT NULL,
  `Rating` varchar(1) NOT NULL,
  PRIMARY KEY (`RevCommentID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviewcomment`
--

INSERT INTO `reviewcomment` (`RevCommentID`, `Title`, `Comment`, `Rating`) VALUES
(1, 'The First Review', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa ', '4'),
(2, 'Not so good', 'Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrice', '1'),
(3, 'Not as good as the first film :/', 'In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi', '2'),
(4, 'Can\'t wait to watch the sequel', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pelle', '5'),
(5, '4/5 Film', 'Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ', '4'),
(6, 'Lived up to the hype!', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi ves', '5'),
(7, 'Funny Film', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pelle', '4'),
(8, '!!!!!', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. ', '1'),
(9, 'A Cool Review', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primi', '3'),
(10, 'Can\'t say i like it', 'Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices p', '1'),
(11, 'Not worth the ticket cost', 'In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu ma', '1'),
(12, 'I\'ve seen better', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ul', '3'),
(13, 'Bad film but nice staff', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, c', '2'),
(14, 'had a great time!', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rho', '5'),
(15, 'not terrible', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praese', '3'),
(16, 'wont be watching again', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phas', '1'),
(17, '5/5 Film', 'Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare cons', '5'),
(18, 'Would watch again :D ', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ul', '5'),
(19, 'Worst Film EVER!', 'Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices p', '1'),
(20, 'Test Title!', 'Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.', '4'),
(21, 'New Review', 'Test Comment', '3'),
(25, 'Classic Comedy', 'test comment to show reviews can be added via the side nav menu!', '4');

-- --------------------------------------------------------

--
-- Stand-in structure for view `reviewdata`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `reviewdata`;
CREATE TABLE IF NOT EXISTS `reviewdata` (
`ReviewID` int(11)
,`Firstname` varchar(30)
,`Surname` varchar(30)
,`FilmName` varchar(100)
,`Title` varchar(40)
,`Comment` varchar(200)
,`Rating` varchar(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `reviewlist`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `reviewlist`;
CREATE TABLE IF NOT EXISTS `reviewlist` (
`FilmID` int(11)
,`FilmName` varchar(100)
,`RevCommentID` int(11)
,`Comment` varchar(200)
,`Rating` varchar(1)
);

-- --------------------------------------------------------

--
-- Table structure for table `userprofile`
--

DROP TABLE IF EXISTS `userprofile`;
CREATE TABLE IF NOT EXISTS `userprofile` (
  `ProfLinkID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `ProfileID` int(11) NOT NULL,
  PRIMARY KEY (`ProfLinkID`),
  UNIQUE KEY `UserID` (`UserID`),
  UNIQUE KEY `ProfileID` (`ProfileID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userprofile`
--

INSERT INTO `userprofile` (`ProfLinkID`, `UserID`, `ProfileID`) VALUES
(1, 10, 10),
(2, 27, 6),
(3, 33, 17),
(4, 50, 12),
(5, 5, 2),
(6, 23, 11),
(7, 48, 4),
(8, 38, 20),
(9, 42, 13),
(10, 12, 5),
(11, 1, 16),
(12, 4, 15),
(13, 7, 8),
(14, 3, 19),
(15, 40, 1),
(16, 37, 3),
(17, 43, 18),
(18, 41, 14),
(19, 35, 7),
(20, 16, 9),
(21, 59, 21),
(33, 52, 32);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Firstname` varchar(30) NOT NULL,
  `Surname` varchar(30) NOT NULL,
  `Password` varchar(40) NOT NULL,
  `DOB` date NOT NULL,
  `Email` varchar(50) NOT NULL,
  `DateJoined` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Active` int(1) NOT NULL DEFAULT '1',
  `Admin` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Firstname`, `Surname`, `Password`, `DOB`, `Email`, `DateJoined`, `Active`, `Admin`) VALUES
(1, 'Marijn', 'Timmermann', 'EN9YHbAj', '1993-08-02', 'mtimmermann0@artisteer.com', '2019-03-20 00:00:00', 0, 1),
(2, 'Ardeen', 'Bothe', 'dnG91AImvGmX', '1936-12-12', 'abothe1@moonfruit.com', '2019-03-21 00:00:00', 0, 1),
(3, 'Alida', 'Gilleson', 'Lak9kSSIe', '1969-05-08', 'agilleson2@hao123.com', '2019-03-29 00:00:00', 0, 0),
(4, 'Jerrie', 'Dirr', '7GBSoe', '1949-06-20', 'jdirr3@archive.org', '2019-02-06 00:00:00', 0, 1),
(5, 'Debby', 'Levene', 'YUTpUB', '1936-06-02', 'dlevene4@mit.edu', '2019-03-30 00:00:00', 0, 0),
(6, 'Spenser', 'Hurdiss', '5rZF6wJb8g', '1940-04-20', 'shurdiss5@macromedia.com', '2019-03-18 00:00:00', 1, 0),
(7, 'Tadd', 'Stanbro', 'khxc8Jg', '1997-06-25', 'tstanbro6@adobe.com', '2019-03-29 00:00:00', 0, 1),
(8, 'Lothario', 'Polak', 'SRWncD4YSulx', '1920-05-09', 'lpolak7@shutterfly.com', '2019-03-04 00:00:00', 1, 1),
(9, 'Marice', 'Baldelli', 'LPLyBaRst', '1943-05-28', 'mbaldelli8@nymag.com', '2019-02-10 00:00:00', 1, 1),
(10, 'Crista', 'Strover', 'Ydu3TFfuunFQ', '1949-01-23', 'cstrover9@altervista.org', '2019-01-09 00:00:00', 1, 0),
(11, 'Jaye', 'Joiner', '5vvBk9', '1921-11-22', 'jjoinera@admin.ch', '2019-03-01 00:00:00', 0, 0),
(12, 'Grace', 'Skyppe', 'Jh9fg8In5', '1971-11-24', 'gskyppeb@google.ca', '2019-03-18 00:00:00', 0, 1),
(13, 'Angela', 'Pasticznyk', 'NScDhvl', '1932-12-05', 'apasticznykc@state.tx.us', '2019-02-21 00:00:00', 1, 1),
(14, 'Hattie', 'Haggart', 'xKhA0zkG44sk', '1964-12-13', 'hhaggartd@wikispaces.com', '2019-03-23 00:00:00', 1, 1),
(15, 'Jemie', 'Witter', 'JEMfxQzZOSbU', '1984-10-26', 'jwittere@123-reg.co.uk', '2019-02-18 00:00:00', 1, 1),
(16, 'Godart', 'Burth', 'djfLqE', '1980-11-23', 'gburthf@blogspot.com', '2019-01-24 00:00:00', 1, 1),
(17, 'Pepita', 'Raunds', 'rsGRrgD4GklO', '1969-05-13', 'praundsg@geocities.com', '2019-03-15 00:00:00', 0, 1),
(18, 'Linet', 'Blunsum', 'PofvN7c', '1989-07-23', 'lblunsumh@google.co.jp', '2019-03-24 00:00:00', 1, 1),
(19, 'Garrott', 'Keavy', 'GVMbh6N9', '1980-03-19', 'gkeavyi@jimdo.com', '2019-03-25 00:00:00', 0, 1),
(20, 'Karly', 'Scotter', 'iOsYc4k', '1921-11-13', 'kscotterj@wordpress.com', '2019-03-31 00:00:00', 0, 1),
(21, 'Gerianna', 'Pocock', 'INGeR5bIFPN', '1930-12-01', 'gpocockk@hud.gov', '2019-02-13 00:00:00', 0, 0),
(22, 'Bryant', 'Brewin', 'AUZaDrA', '1984-04-24', 'bbrewinl@csmonitor.com', '2019-02-01 00:00:00', 0, 1),
(23, 'Bernie', 'Van Arsdale', '5b6r53hkc8lt', '1946-06-06', 'bvanarsdalem@theguardian.com', '2019-03-16 00:00:00', 1, 1),
(24, 'Gerianna', 'Bamling', 'XzU9DCaErw', '1962-08-26', 'gbamlingn@businesswire.com', '2019-03-25 00:00:00', 1, 0),
(25, 'Rriocard', 'Duffett', 'GVrmmjWUrQZ', '1953-09-04', 'rduffetto@opensource.org', '2019-03-10 00:00:00', 0, 0),
(26, 'Marne', 'Isaak', 'u0X1VmbDnnA', '1979-02-09', 'misaakp@ihg.com', '2019-03-01 00:00:00', 1, 0),
(27, 'Holly', 'Teal', 'Og4dV1U', '1956-05-30', 'htealq@about.com', '2019-03-01 00:00:00', 0, 0),
(28, 'Myranda', 'Kesey', 'ogLrKF', '1945-08-05', 'mkeseyr@typepad.com', '2019-03-01 00:00:00', 0, 0),
(29, 'Elliott', 'Burfield', 'uEi59VBHL', '1958-08-28', 'eburfields@archive.org', '2019-03-01 00:00:00', 1, 0),
(30, 'Walt', 'Grise', 'UVZToWVFpEI', '1967-08-08', 'wgriset@macromedia.com', '2019-03-01 00:00:00', 0, 1),
(31, 'Heath', 'Jagger', '5TwLCVvl3Xu', '1991-09-11', 'hjaggeru@telegraph.co.uk', '2019-03-01 00:00:00', 0, 0),
(32, 'Daniele', 'Pengilly', 'm0L8NCzAgq9', '1983-05-21', 'dpengillyv@ameblo.jp', '2019-03-01 00:00:00', 0, 0),
(33, 'Gwyn', 'Dacks', 'yTwWSjSn', '1955-05-18', 'gdacksw@irs.gov', '2019-03-01 00:00:00', 0, 0),
(34, 'Ivette', 'Craddy', 'lvQGngKhztAu', '1976-12-22', 'icraddyx@google.com.br', '2019-03-01 00:00:00', 1, 0),
(35, 'Ericka', 'Mazonowicz', 'YGjtysQtWZ', '1984-06-02', 'emazonowiczy@oaic.gov.au', '2019-03-01 00:00:00', 0, 1),
(36, 'Armand', 'Duke', 'Mji4aj2fRMy', '1971-03-18', 'adukez@unesco.org', '2019-03-01 00:00:00', 0, 1),
(37, 'Guido', 'Dunsmuir', 'q4dHHzi1H', '1973-07-31', 'gdunsmuir10@t-online.de', '2019-03-01 00:00:00', 0, 1),
(38, 'Keelby', 'Comsty', 'lKNcE09GZWfE', '1946-10-05', 'kcomsty11@si.edu', '2019-03-01 00:00:00', 0, 1),
(39, 'Jackie', 'Pleasants', 'dO6vUa', '1965-03-03', 'jpleasants12@typepad.com', '2019-03-01 00:00:00', 1, 1),
(40, 'Martha', 'Luparti', 'kk4wmPU', '1990-05-22', 'mluparti13@multiply.com', '2019-03-01 00:00:00', 1, 1),
(41, 'Laurens', 'Aiers', 'tIeTdiLWm', '1953-09-21', 'laiers14@mit.edu', '2019-03-01 00:00:00', 1, 1),
(42, 'Cleon', 'Tarborn', 'oZwWjI', '1939-12-05', 'ctarborn15@pcworld.com', '2019-03-01 00:00:00', 0, 0),
(43, 'Abdul', 'Gratten', 'K3Pbp69fJipF', '1978-11-15', 'agratten16@nifty.com', '2019-03-01 00:00:00', 1, 0),
(44, 'Shurlocke', 'Cockayne', 'W19EXEti5qKI', '1954-03-22', 'scockayne17@umich.edu', '2019-03-01 00:00:00', 1, 1),
(45, 'Barret', 'Mellody', '1MqCKLIM', '1953-02-22', 'bmellody18@vinaora.com', '2019-03-01 00:00:00', 0, 1),
(46, 'Barby', 'MacGiffin', 'HFqYkvr1T', '1942-08-14', 'bmacgiffin19@github.io', '2019-03-01 00:00:00', 0, 1),
(47, 'Lanny', 'McDirmid', 'Jtr5Daer', '1926-11-02', 'lmcdirmid1a@loc.gov', '2019-03-01 00:00:00', 1, 0),
(48, 'Paulie', 'Gunton', '53msLZx', '1985-02-15', 'pgunton1b@sourceforge.net', '2019-03-01 00:00:00', 0, 1),
(49, 'Wallie', 'Vautre', 'UY7fuom8', '1994-05-12', 'wvautre1c@blogspot.com', '2019-03-01 00:00:00', 0, 0),
(50, 'Culley', 'Pitcaithly', '4so88YKgL', '1936-05-01', 'cpitcaithly1d@vk.com', '2019-03-01 00:00:00', 0, 1),
(52, 'Eden', 'Clark', 'testpass', '1996-02-01', 'edenc18@outlook.com', '2019-03-12 23:35:01', 1, 0),
(59, 'test', 'test', 'test', '2000-01-01', 'test@test.test', '2019-03-25 17:33:16', 1, 0);

-- --------------------------------------------------------

--
-- Structure for view `activeuser`
--
DROP TABLE IF EXISTS `activeuser`;

CREATE ALGORITHM=UNDEFINED DEFINER=`40067505`@`%` SQL SECURITY DEFINER VIEW `activeuser`  AS  select `users`.`UserID` AS `UserID`,`users`.`Surname` AS `Surname`,`users`.`Firstname` AS `Firstname`,`users`.`Email` AS `Email`,`users`.`DateJoined` AS `DateJoined` from `users` where (`users`.`Active` = 1) order by `users`.`DateJoined`,`users`.`Surname` ;

-- --------------------------------------------------------

--
-- Structure for view `adminlist`
--
DROP TABLE IF EXISTS `adminlist`;

CREATE ALGORITHM=UNDEFINED DEFINER=`40067505`@`%` SQL SECURITY DEFINER VIEW `adminlist`  AS  select `users`.`Surname` AS `Surname`,`users`.`Firstname` AS `Firstname`,`users`.`Email` AS `Email` from `users` where (`users`.`Admin` = 1) order by `users`.`Surname` ;

-- --------------------------------------------------------

--
-- Structure for view `discuserlist`
--
DROP TABLE IF EXISTS `discuserlist`;

CREATE ALGORITHM=UNDEFINED DEFINER=`40067505`@`%` SQL SECURITY DEFINER VIEW `discuserlist`  AS  select `users`.`Surname` AS `Surname`,`users`.`Firstname` AS `Firstname`,`users`.`Email` AS `Email` from `users` where `users`.`UserID` in (select `discussion`.`UserID` from `discussion`) order by `users`.`Surname` ;

-- --------------------------------------------------------

--
-- Structure for view `disdata`
--
DROP TABLE IF EXISTS `disdata`;

CREATE ALGORITHM=UNDEFINED DEFINER=`40067505`@`%` SQL SECURITY DEFINER VIEW `disdata`  AS  select `discussion`.`DiscussionID` AS `DiscussionID`,`users`.`Firstname` AS `Firstname`,`users`.`Surname` AS `Surname`,`profile`.`Avatar` AS `Avatar`,`discussioncomment`.`Comment` AS `Comment`,`discussioncomment`.`Time` AS `Time` from ((((`discussion` join `users` on((`discussion`.`UserID` = `users`.`UserID`))) left join `userprofile` on((`discussion`.`UserID` = `userprofile`.`UserID`))) left join `profile` on((`userprofile`.`ProfileID` = `profile`.`ProfileID`))) join `discussioncomment` on((`discussion`.`DisCommentID` = `discussioncomment`.`DisCommentID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `filmcount`
--
DROP TABLE IF EXISTS `filmcount`;

CREATE ALGORITHM=UNDEFINED DEFINER=`40067505`@`%` SQL SECURITY DEFINER VIEW `filmcount`  AS  select count(distinct `films`.`FilmID`) AS `COUNT(DISTINCT FilmID)`,`films`.`FilmRating` AS `FilmRating` from `films` group by `films`.`FilmRating` ;

-- --------------------------------------------------------

--
-- Structure for view `nonrevfilms`
--
DROP TABLE IF EXISTS `nonrevfilms`;

CREATE ALGORITHM=UNDEFINED DEFINER=`40067505`@`%` SQL SECURITY DEFINER VIEW `nonrevfilms`  AS  select `films`.`FilmID` AS `FilmID`,`films`.`FilmName` AS `FilmName`,`films`.`Description` AS `Description` from `films` where (not(`films`.`FilmID` in (select `review`.`FilmID` from `review`))) order by `films`.`FilmName` ;

-- --------------------------------------------------------

--
-- Structure for view `reviewdata`
--
DROP TABLE IF EXISTS `reviewdata`;

CREATE ALGORITHM=UNDEFINED DEFINER=`40067505`@`%` SQL SECURITY DEFINER VIEW `reviewdata`  AS  select `review`.`ReviewID` AS `ReviewID`,`users`.`Firstname` AS `Firstname`,`users`.`Surname` AS `Surname`,`films`.`FilmName` AS `FilmName`,`reviewcomment`.`Title` AS `Title`,`reviewcomment`.`Comment` AS `Comment`,`reviewcomment`.`Rating` AS `Rating` from (((`review` join `users` on((`review`.`UserID` = `users`.`UserID`))) join `reviewcomment` on((`review`.`RevCommentID` = `reviewcomment`.`RevCommentID`))) join `films` on((`review`.`FilmID` = `films`.`FilmID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `reviewlist`
--
DROP TABLE IF EXISTS `reviewlist`;

CREATE ALGORITHM=UNDEFINED DEFINER=`40067505`@`%` SQL SECURITY DEFINER VIEW `reviewlist`  AS  select `films`.`FilmID` AS `FilmID`,`films`.`FilmName` AS `FilmName`,`review`.`RevCommentID` AS `RevCommentID`,`reviewcomment`.`Comment` AS `Comment`,`reviewcomment`.`Rating` AS `Rating` from ((`films` join `review` on((`films`.`FilmID` = `review`.`FilmID`))) join `reviewcomment` on((`review`.`RevCommentID` = `reviewcomment`.`RevCommentID`))) order by `films`.`FilmName`,`review`.`RevCommentID` desc ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `discussion`
--
ALTER TABLE `discussion`
  ADD CONSTRAINT `discussion_ibfk_1` FOREIGN KEY (`DisCommentID`) REFERENCES `discussioncomment` (`DisCommentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `discussion_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `log_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`RevCommentID`) REFERENCES `reviewcomment` (`RevCommentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `review_ibfk_3` FOREIGN KEY (`FilmID`) REFERENCES `films` (`FilmID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `userprofile`
--
ALTER TABLE `userprofile`
  ADD CONSTRAINT `userprofile_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userprofile_ibfk_2` FOREIGN KEY (`ProfileID`) REFERENCES `profile` (`ProfileID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
