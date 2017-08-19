-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2017 at 12:36 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `youphptube`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
`id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `clean_name` varchar(45) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `iconClass` varchar(45) NOT NULL DEFAULT 'fa fa-folder'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `clean_name`, `created`, `modified`, `iconClass`) VALUES
(1, 'New', 'new', '2017-08-17 10:14:34', '2017-08-17 07:24:20', 'fa fa-check-circle-o'),
(2, 'Trending', 'trending', '2017-08-17 07:23:43', '2017-08-17 07:23:43', 'fa fa-arrow-circle-o-up'),
(3, 'Recommended', 'recommended', '2017-08-17 07:24:50', '2017-08-17 07:24:50', 'fa fa-angellist');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
`id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `videos_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `configurations`
--

CREATE TABLE IF NOT EXISTS `configurations` (
  `id` int(11) NOT NULL,
  `video_resolution` varchar(12) NOT NULL,
  `users_id` int(11) NOT NULL,
  `version` varchar(10) NOT NULL,
  `webSiteTitle` varchar(45) NOT NULL DEFAULT 'YouPHPTube',
  `language` varchar(6) NOT NULL DEFAULT 'en',
  `contactEmail` varchar(45) NOT NULL,
  `modified` datetime NOT NULL,
  `created` datetime NOT NULL,
  `authGoogle_id` varchar(255) DEFAULT NULL,
  `authGoogle_key` varchar(255) DEFAULT NULL,
  `authGoogle_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `authFacebook_id` varchar(255) DEFAULT NULL,
  `authFacebook_key` varchar(255) DEFAULT NULL,
  `authFacebook_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `authCanUploadVideos` tinyint(1) NOT NULL DEFAULT '0',
  `authCanComment` tinyint(1) NOT NULL DEFAULT '1',
  `head` text,
  `logo` varchar(255) DEFAULT NULL,
  `logo_small` varchar(255) DEFAULT NULL,
  `adsense` text,
  `mode` enum('Youtube','Gallery') DEFAULT 'Youtube',
  `disable_analytics` tinyint(1) DEFAULT '0',
  `session_timeout` int(11) DEFAULT '3600',
  `autoplay` tinyint(1) DEFAULT NULL,
  `theme` varchar(45) DEFAULT 'default',
  `smtp` tinyint(1) DEFAULT NULL,
  `smtpAuth` tinyint(1) DEFAULT NULL,
  `smtpSecure` varchar(45) DEFAULT NULL COMMENT '''ssl''; // secure transfer enabled REQUIRED for Gmail',
  `smtpHost` varchar(100) DEFAULT NULL COMMENT '"smtp.gmail.com"',
  `smtpUsername` varchar(45) DEFAULT NULL COMMENT '"email@gmail.com"',
  `smtpPassword` varchar(45) DEFAULT NULL,
  `smtpPort` int(11) DEFAULT NULL,
  `encoderURL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `configurations`
--

INSERT INTO `configurations` (`id`, `video_resolution`, `users_id`, `version`, `webSiteTitle`, `language`, `contactEmail`, `modified`, `created`, `authGoogle_id`, `authGoogle_key`, `authGoogle_enabled`, `authFacebook_id`, `authFacebook_key`, `authFacebook_enabled`, `authCanUploadVideos`, `authCanComment`, `head`, `logo`, `logo_small`, `adsense`, `mode`, `disable_analytics`, `session_timeout`, `autoplay`, `theme`, `smtp`, `smtpAuth`, `smtpSecure`, `smtpHost`, `smtpUsername`, `smtpPassword`, `smtpPort`, `encoderURL`) VALUES
(1, '858:480', 1, '4.0', 'Video', 'us', 'deep@gmail.com', '2017-08-17 10:14:34', '2017-08-17 10:14:34', '', '', 0, '', '', 0, 0, 1, '', 'videos/userPhoto/logo.png', 'videos/userPhoto/logoSmall.png', '', 'Gallery', 1, 3600, 0, 'cerulean', 0, 0, '', '', '', '', 0, 'https://encoder.youphptube.com/');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE IF NOT EXISTS `likes` (
`id` int(11) NOT NULL,
  `like` int(1) NOT NULL DEFAULT '0' COMMENT '1 = Like\n0 = Does not metter\n-1 = Dislike',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `videos_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `playlists`
--

CREATE TABLE IF NOT EXISTS `playlists` (
`id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `status` enum('public','private') NOT NULL DEFAULT 'public'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `playlists_has_videos`
--

CREATE TABLE IF NOT EXISTS `playlists_has_videos` (
  `playlists_id` int(11) NOT NULL,
  `videos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subscribes`
--

CREATE TABLE IF NOT EXISTS `subscribes` (
`id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` enum('a','i') NOT NULL DEFAULT 'a',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '1' COMMENT 'subscribes to user channel'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `user` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `status` enum('a','i') NOT NULL DEFAULT 'a',
  `photoURL` varchar(255) DEFAULT NULL,
  `lastLogin` datetime DEFAULT NULL,
  `recoverPass` varchar(255) DEFAULT NULL,
  `backgroundURL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user`, `name`, `email`, `password`, `created`, `modified`, `isAdmin`, `status`, `photoURL`, `lastLogin`, `recoverPass`, `backgroundURL`) VALUES
(1, 'admin', NULL, NULL, '5103c3584b063c431bd1268e9b5e76fb', '2017-08-17 10:14:34', '2017-08-17 10:59:32', 1, 'a', NULL, '2017-08-17 10:59:32', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE IF NOT EXISTS `users_groups` (
`id` int(11) NOT NULL,
  `group_name` varchar(45) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_has_users_groups`
--

CREATE TABLE IF NOT EXISTS `users_has_users_groups` (
  `users_id` int(11) NOT NULL,
  `users_groups_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE IF NOT EXISTS `videos` (
`id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `clean_title` varchar(255) NOT NULL,
  `description` text,
  `views_count` int(11) NOT NULL DEFAULT '0',
  `status` enum('a','i','e','x','d','xmp4','xwebm','xmp3','xogg','ximg') NOT NULL DEFAULT 'e' COMMENT 'a = active\ni = inactive\ne = encoding\nx = encoding error\nd = downloading\nxmp4 = encoding mp4 error \nxwebm = encoding webm error \nxmp3 = encoding mp3 error \nxogg = encoding ogg error \nximg = get image error',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `users_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `duration` varchar(15) NOT NULL,
  `type` enum('audio','video') NOT NULL DEFAULT 'video',
  `videoDownloadedLink` varchar(255) DEFAULT NULL,
  `order` int(10) unsigned NOT NULL DEFAULT '1',
  `rotation` smallint(6) DEFAULT '0',
  `zoom` float DEFAULT '1',
  `youtubeId` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `title`, `clean_title`, `description`, `views_count`, `status`, `created`, `modified`, `users_id`, `categories_id`, `filename`, `duration`, `type`, `videoDownloadedLink`, `order`, `rotation`, `zoom`, `youtubeId`) VALUES
(1, 'Section Intro', 'section-intro', '1. Section Intro', 40, 'a', '2017-08-09 00:00:00', '2017-08-18 11:21:33', 1, 1, '1', '20', 'video', NULL, 1, 0, 1, NULL),
(2, 'Async Basics', 'async-basics', '1. Section Intro', 4, 'a', '2017-08-09 00:00:00', '2017-08-18 11:06:18', 1, 1, '2', '20', 'video', NULL, 1, 0, 1, NULL),
(3, 'Call Stack & Event Loop', 'call-stack-event-loop', 'Call Stack & Event Loop', 0, 'a', '2017-08-09 00:00:00', '2017-08-17 06:55:08', 1, 1, '3', '200', 'video', NULL, 1, 0, 1, NULL),
(4, '4. Callback Functions & APIs', 'callback-func', '4. Callback Functions & APIs', 1, 'a', '2017-08-09 00:00:00', '2017-08-17 07:01:59', 1, 1, '4', '500', 'video', NULL, 1, 0, 1, NULL),
(5, '5. Pretty Printing Objects', 'pretty-printing', '5. Pretty Printing Objects', 0, 'a', '2017-08-09 00:00:00', '2017-08-17 06:55:08', 1, 1, '5', '10:20:00', 'video', NULL, 1, 0, 1, NULL),
(6, '6. What Makes up an HTTP Request', 'what-make', '6. What Makes up an HTTP Request', 0, 'a', '2017-08-09 00:00:00', '2017-08-17 06:55:08', 1, 2, '6', '10:20:00', 'video', NULL, 1, 0, 1, NULL),
(7, '7. Pretty Printing Objects', 'pretty-printing1', '7. Pretty Printing Objects', 0, 'a', '2017-08-09 00:00:00', '2017-08-17 06:55:08', 1, 3, '5', '1:20:00', 'video', NULL, 1, 0, 1, NULL),
(8, 'Call Stack & Event Loop', 'call-stack-event-loop1', 'Call Stack & Event Loop', 0, 'a', '2017-08-09 00:00:00', '2017-08-17 06:55:08', 1, 3, '3', '200', 'video', NULL, 1, 0, 1, NULL),
(9, '7. Pretty Printing Objects', 'pretty-printing11', '7. Pretty Printing Objects', 3, 'a', '2017-08-09 00:00:00', '2017-08-17 08:35:48', 1, 3, '5', '1:20:00', 'video', NULL, 1, 0, 1, NULL),
(10, '4. Callback Functions & APIs', 'callback-func1', '4. Callback Functions & APIs', 1, 'a', '2017-08-09 00:00:00', '2017-08-17 07:01:59', 1, 1, '4', '500', 'video', NULL, 1, 0, 1, NULL),
(11, '11. Callback Functions & APIs', 'c1allback-func1', '11. Callback Functions & APIs', 1, 'a', '2017-08-09 00:00:00', '2017-08-17 07:01:59', 1, 1, '4', '500', 'video', NULL, 1, 0, 1, NULL),
(12, 'Call Stack & Event Loop', 'call-st12ack-event-loop1', 'Call Stack & Event Loop', 0, 'a', '2017-08-09 00:00:00', '2017-08-17 06:55:08', 1, 3, '3', '200', 'video', NULL, 1, 0, 1, NULL),
(13, '13. Pretty Printing Objects', 'p1retty-printing1', '13. Pretty Printing Objects', 0, 'a', '2017-08-09 00:00:00', '2017-08-17 06:55:08', 1, 3, '5', '1:20:00', 'video', NULL, 1, 0, 1, NULL),
(14, 'Section Intro', 'section-intro1', '1. Section Intro', 8, 'a', '2017-08-09 00:00:00', '2017-08-18 11:24:01', 1, 1, '1', '20', 'video', NULL, 1, 0, 1, NULL),
(15, '5. Pretty Printing Objects', 'pretty-prin1ting11', '5. Pretty Printing Objects', 2, 'a', '2017-08-09 00:00:00', '2017-08-18 07:20:59', 1, 1, '5', '10:20:00', 'video', NULL, 1, 0, 1, NULL),
(16, '4. Callback Functions & APIs', 'callbac1k-func', '4. Callback Functions & APIs', 1, 'a', '2017-08-09 00:00:00', '2017-08-17 07:01:59', 1, 1, '4', '500', 'video', NULL, 1, 0, 1, NULL),
(17, '4. Callback Functions & APIs', 'callb17ack-func', '4. Callback Functions & APIs', 1, 'a', '2017-08-09 00:00:00', '2017-08-17 07:01:59', 1, 1, '4', '500', 'video', NULL, 1, 0, 1, NULL),
(18, 'Async Basics', 'async-basics18', '1. Section Intro', 1, 'a', '2017-08-09 00:00:00', '2017-08-17 06:56:24', 1, 1, '2', '20', 'video', NULL, 1, 0, 1, NULL),
(19, '7. Pretty Printing Objects', 'pretty-printing119', '7. Pretty Printing Objects', 0, 'a', '2017-08-09 00:00:00', '2017-08-17 06:55:08', 1, 3, '5', '1:20:00', 'video', NULL, 1, 0, 1, NULL),
(20, '5. Pretty Printing Objects', 'p20retty-printing', '5. Pretty Printing Objects', 0, 'a', '2017-08-09 00:00:00', '2017-08-17 06:55:08', 1, 1, '5', '10:20:00', 'video', NULL, 1, 0, 1, NULL),
(21, '11. Callback Functions & APIs', 'c1allback-func121', '11. Callback Functions & APIs', 3, 'a', '2017-08-09 00:00:00', '2017-08-18 07:21:26', 1, 1, '4', '500', 'video', NULL, 1, 0, 1, NULL),
(22, '6. What Makes up an HTTP Request', 'what-make22', '6. What Makes up an HTTP Request', 0, 'a', '2017-08-09 00:00:00', '2017-08-17 06:55:08', 1, 2, '6', '10:20:00', 'video', NULL, 1, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `videos_group_view`
--

CREATE TABLE IF NOT EXISTS `videos_group_view` (
`id` int(11) NOT NULL,
  `users_groups_id` int(11) NOT NULL,
  `videos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `videos_statistics`
--

CREATE TABLE IF NOT EXISTS `videos_statistics` (
`id` int(11) NOT NULL,
  `when` datetime NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `videos_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `videos_statistics`
--

INSERT INTO `videos_statistics` (`id`, `when`, `ip`, `users_id`, `videos_id`) VALUES
(1, '2017-08-17 06:49:27', '::1', NULL, 1),
(2, '2017-08-17 06:49:41', '::1', 1, 1),
(3, '2017-08-17 06:50:08', '::1', 1, 1),
(4, '2017-08-17 06:52:00', '::1', 1, 1),
(5, '2017-08-17 06:52:31', '::1', 1, 1),
(6, '2017-08-17 06:55:08', '::1', 1, 1),
(7, '2017-08-17 06:56:24', '::1', 1, 2),
(8, '2017-08-17 07:01:59', '::1', 1, 4),
(9, '2017-08-17 07:48:42', '::1', NULL, 1),
(10, '2017-08-17 07:57:13', '::1', NULL, 9),
(11, '2017-08-17 08:35:38', '::1', NULL, 9),
(12, '2017-08-17 08:35:48', '::1', NULL, 9),
(13, '2017-08-17 11:02:05', '::1', 1, 1),
(14, '2017-08-17 11:02:16', '::1', 1, 1),
(15, '2017-08-18 07:19:33', '::1', NULL, 1),
(16, '2017-08-18 07:20:00', '::1', NULL, 15),
(17, '2017-08-18 07:20:59', '::1', NULL, 15),
(18, '2017-08-18 07:21:12', '::1', NULL, 1),
(19, '2017-08-18 07:21:16', '::1', NULL, 1),
(20, '2017-08-18 07:21:21', '::1', NULL, 21),
(21, '2017-08-18 07:21:26', '::1', NULL, 21),
(22, '2017-08-18 07:21:58', '::1', NULL, 1),
(23, '2017-08-18 07:36:35', '::1', NULL, 1),
(24, '2017-08-18 07:38:20', '::1', NULL, 1),
(25, '2017-08-18 07:47:56', '::1', NULL, 1),
(26, '2017-08-18 07:49:32', '::1', NULL, 1),
(27, '2017-08-18 07:49:45', '::1', NULL, 1),
(28, '2017-08-18 07:50:25', '::1', NULL, 1),
(29, '2017-08-18 07:51:10', '::1', NULL, 1),
(30, '2017-08-18 07:51:24', '::1', NULL, 1),
(31, '2017-08-18 07:56:09', '::1', NULL, 1),
(32, '2017-08-18 10:50:25', '::1', NULL, 1),
(33, '2017-08-18 10:57:15', '::1', NULL, 1),
(34, '2017-08-18 10:59:19', '::1', NULL, 1),
(35, '2017-08-18 11:01:10', '::1', NULL, 1),
(36, '2017-08-18 11:02:20', '::1', NULL, 1),
(37, '2017-08-18 11:03:06', '::1', NULL, 1),
(38, '2017-08-18 11:04:08', '::1', NULL, 1),
(39, '2017-08-18 11:04:34', '::1', NULL, 1),
(40, '2017-08-18 11:04:44', '::1', NULL, 2),
(41, '2017-08-18 11:05:15', '::1', NULL, 2),
(42, '2017-08-18 11:06:18', '::1', NULL, 2),
(43, '2017-08-18 11:06:37', '::1', NULL, 1),
(44, '2017-08-18 11:06:46', '::1', NULL, 1),
(45, '2017-08-18 11:14:42', '::1', NULL, 1),
(46, '2017-08-18 11:16:52', '::1', NULL, 1),
(47, '2017-08-18 11:17:16', '::1', NULL, 1),
(48, '2017-08-18 11:17:34', '::1', NULL, 1),
(49, '2017-08-18 11:18:09', '::1', NULL, 1),
(50, '2017-08-18 11:19:21', '::1', NULL, 1),
(51, '2017-08-18 11:20:51', '::1', NULL, 1),
(52, '2017-08-18 11:21:33', '::1', NULL, 1),
(53, '2017-08-18 11:24:01', '::1', NULL, 14);

-- --------------------------------------------------------

--
-- Table structure for table `video_ads`
--

CREATE TABLE IF NOT EXISTS `video_ads` (
`id` int(11) NOT NULL,
  `ad_title` varchar(255) NOT NULL,
  `starts` datetime NOT NULL,
  `finish` datetime DEFAULT NULL,
  `skip_after_seconds` int(4) DEFAULT NULL,
  `redirect` varchar(300) DEFAULT NULL,
  `finish_max_clicks` int(11) DEFAULT NULL,
  `finish_max_prints` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `videos_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `video_ads_logs`
--

CREATE TABLE IF NOT EXISTS `video_ads_logs` (
`id` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `clicked` tinyint(1) NOT NULL DEFAULT '0',
  `ip` varchar(45) NOT NULL,
  `video_ads_id` int(11) NOT NULL,
  `users_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `video_documents`
--

CREATE TABLE IF NOT EXISTS `video_documents` (
`id` int(11) NOT NULL,
  `doc_name` varchar(255) NOT NULL,
  `doc_description` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `blob` blob NOT NULL,
  `videos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `clean_name_UNIQUE` (`clean_name`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_comments_videos1_idx` (`videos_id`), ADD KEY `fk_comments_users1_idx` (`users_id`);

--
-- Indexes for table `configurations`
--
ALTER TABLE `configurations`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_configurations_users1_idx` (`users_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_likes_videos1_idx` (`videos_id`), ADD KEY `fk_likes_users1_idx` (`users_id`);

--
-- Indexes for table `playlists`
--
ALTER TABLE `playlists`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_playlists_users1_idx` (`users_id`);

--
-- Indexes for table `playlists_has_videos`
--
ALTER TABLE `playlists_has_videos`
 ADD PRIMARY KEY (`playlists_id`,`videos_id`), ADD KEY `fk_playlists_has_videos_videos1_idx` (`videos_id`), ADD KEY `fk_playlists_has_videos_playlists1_idx` (`playlists_id`);

--
-- Indexes for table `subscribes`
--
ALTER TABLE `subscribes`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_subscribes_users1_idx` (`users_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `user_UNIQUE` (`user`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_has_users_groups`
--
ALTER TABLE `users_has_users_groups`
 ADD PRIMARY KEY (`users_id`,`users_groups_id`), ADD UNIQUE KEY `index_user_groups_unique` (`users_groups_id`,`users_id`), ADD KEY `fk_users_has_users_groups_users_groups1_idx` (`users_groups_id`), ADD KEY `fk_users_has_users_groups_users1_idx` (`users_id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `clean_title_UNIQUE` (`clean_title`), ADD KEY `fk_videos_users_idx` (`users_id`), ADD KEY `fk_videos_categories1_idx` (`categories_id`), ADD KEY `index5` (`order`);

--
-- Indexes for table `videos_group_view`
--
ALTER TABLE `videos_group_view`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_videos_group_view_users_groups1_idx` (`users_groups_id`), ADD KEY `fk_videos_group_view_videos1_idx` (`videos_id`);

--
-- Indexes for table `videos_statistics`
--
ALTER TABLE `videos_statistics`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_videos_statistics_users1_idx` (`users_id`), ADD KEY `fk_videos_statistics_videos1_idx` (`videos_id`);

--
-- Indexes for table `video_ads`
--
ALTER TABLE `video_ads`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_video_ads_videos1_idx` (`videos_id`), ADD KEY `fk_video_ads_categories1_idx` (`categories_id`);

--
-- Indexes for table `video_ads_logs`
--
ALTER TABLE `video_ads_logs`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_video_ads_logs_users1_idx` (`users_id`), ADD KEY `fk_video_ads_logs_video_ads1_idx` (`video_ads_id`);

--
-- Indexes for table `video_documents`
--
ALTER TABLE `video_documents`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_video_documents_videos1_idx` (`videos_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `playlists`
--
ALTER TABLE `playlists`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `subscribes`
--
ALTER TABLE `subscribes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `videos_group_view`
--
ALTER TABLE `videos_group_view`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `videos_statistics`
--
ALTER TABLE `videos_statistics`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `video_ads`
--
ALTER TABLE `video_ads`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `video_ads_logs`
--
ALTER TABLE `video_ads_logs`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `video_documents`
--
ALTER TABLE `video_documents`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
ADD CONSTRAINT `fk_comments_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_comments_videos1` FOREIGN KEY (`videos_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `configurations`
--
ALTER TABLE `configurations`
ADD CONSTRAINT `fk_configurations_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
ADD CONSTRAINT `fk_likes_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_likes_videos1` FOREIGN KEY (`videos_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `playlists`
--
ALTER TABLE `playlists`
ADD CONSTRAINT `fk_playlists_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `playlists_has_videos`
--
ALTER TABLE `playlists_has_videos`
ADD CONSTRAINT `fk_playlists_has_videos_playlists1` FOREIGN KEY (`playlists_id`) REFERENCES `playlists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_playlists_has_videos_videos1` FOREIGN KEY (`videos_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subscribes`
--
ALTER TABLE `subscribes`
ADD CONSTRAINT `fk_subscribes_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users_has_users_groups`
--
ALTER TABLE `users_has_users_groups`
ADD CONSTRAINT `fk_users_has_users_groups_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_users_has_users_groups_users_groups1` FOREIGN KEY (`users_groups_id`) REFERENCES `users_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `videos_group_view`
--
ALTER TABLE `videos_group_view`
ADD CONSTRAINT `fk_videos_group_view_users_groups1` FOREIGN KEY (`users_groups_id`) REFERENCES `users_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_videos_group_view_videos1` FOREIGN KEY (`videos_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `videos_statistics`
--
ALTER TABLE `videos_statistics`
ADD CONSTRAINT `fk_videos_statistics_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_videos_statistics_videos1` FOREIGN KEY (`videos_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `video_ads`
--
ALTER TABLE `video_ads`
ADD CONSTRAINT `fk_video_ads_categories1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_video_ads_videos1` FOREIGN KEY (`videos_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `video_ads_logs`
--
ALTER TABLE `video_ads_logs`
ADD CONSTRAINT `fk_video_ads_logs_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_video_ads_logs_video_ads1` FOREIGN KEY (`video_ads_id`) REFERENCES `video_ads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `video_documents`
--
ALTER TABLE `video_documents`
ADD CONSTRAINT `fk_video_documents_videos1` FOREIGN KEY (`videos_id`) REFERENCES `videos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;