-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 17, 2013 at 06:18 AM
-- Server version: 5.6.12
-- PHP Version: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `lokertki`
--
CREATE DATABASE IF NOT EXISTS `lokertki` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `lokertki`;

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Mr WordPress', '', 'http://wordpress.org/', '', '2013-09-16 09:22:13', '2013-09-16 09:22:13', 'Hi, this is a comment.\nTo delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_jr_alerts`
--

CREATE TABLE IF NOT EXISTS `wp_jr_alerts` (
  `post_id` bigint(20) NOT NULL,
  `alert_type` varchar(1024) NOT NULL,
  `last_user_id` bigint(20) DEFAULT NULL,
  `last_activity` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `post_id` (`post_id`),
  KEY `alert_type` (`alert_type`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wp_jr_counter_daily`
--

CREATE TABLE IF NOT EXISTS `wp_jr_counter_daily` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `time` date NOT NULL DEFAULT '0000-00-00',
  `postnum` int(11) NOT NULL,
  `postcount` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_jr_counter_total`
--

CREATE TABLE IF NOT EXISTS `wp_jr_counter_total` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `postnum` int(11) NOT NULL,
  `postcount` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_jr_customer_packs`
--

CREATE TABLE IF NOT EXISTS `wp_jr_customer_packs` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `pack_id` mediumint(9) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `pack_name` varchar(255) NOT NULL,
  `job_duration` varchar(255) DEFAULT '',
  `pack_expires` timestamp NULL DEFAULT NULL,
  `jobs_count` int(9) DEFAULT NULL,
  `jobs_limit` int(9) DEFAULT NULL,
  `job_offers_count` int(9) DEFAULT NULL,
  `job_offers` int(9) DEFAULT NULL,
  `feat_job_offers_count` int(9) DEFAULT NULL,
  `feat_job_offers` int(9) DEFAULT NULL,
  `access` varchar(255) DEFAULT '',
  `job_cats` varchar(255) DEFAULT '',
  `pack_order` smallint(3) DEFAULT '1',
  `pack_purchased` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_jr_job_packs`
--

CREATE TABLE IF NOT EXISTS `wp_jr_job_packs` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `pack_name` varchar(255) NOT NULL,
  `pack_description` longtext NOT NULL,
  `job_count` varchar(255) DEFAULT '',
  `pack_duration` varchar(255) DEFAULT '',
  `job_duration` varchar(255) DEFAULT '',
  `pack_cost` varchar(255) DEFAULT '',
  `job_offers` varchar(3) DEFAULT '',
  `feat_job_offers` varchar(3) DEFAULT '',
  `access` varchar(255) DEFAULT 'none',
  `job_cats` varchar(255) DEFAULT '',
  `pack_order` smallint(3) DEFAULT '1',
  `pack_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_jr_orders`
--

CREATE TABLE IF NOT EXISTS `wp_jr_orders` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending_payment',
  `cost` varchar(255) DEFAULT '',
  `job_id` bigint(20) DEFAULT NULL,
  `pack_id` bigint(20) DEFAULT NULL,
  `featured` int(1) NOT NULL DEFAULT '0',
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_date` timestamp NULL DEFAULT NULL,
  `payer_first_name` longtext,
  `payer_last_name` longtext,
  `payer_email` longtext,
  `payment_type` longtext,
  `approval_method` varchar(255) DEFAULT NULL,
  `payer_address` longtext,
  `transaction_id` longtext,
  `order_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_links`
--

INSERT INTO `wp_links` (`link_id`, `link_url`, `link_name`, `link_image`, `link_target`, `link_description`, `link_visible`, `link_owner`, `link_rating`, `link_updated`, `link_rel`, `link_notes`, `link_rss`) VALUES
(1, 'http://www.appthemes.com/', 'Premium WordPress Themes', '', '', '', 'Y', 1, 0, '0000-00-00 00:00:00', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=294 ;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/lokertki', 'yes'),
(2, 'blogname', 'Lowongan Kerja TKI', 'yes'),
(3, 'blogdescription', 'Just another WordPress site', 'yes'),
(4, 'users_can_register', '1', 'yes'),
(5, 'admin_email', 'webmaster@tukangbagus.com', 'yes'),
(6, 'start_of_week', '1', 'yes'),
(7, 'use_balanceTags', '0', 'yes'),
(8, 'use_smilies', '1', 'yes'),
(9, 'require_name_email', '1', 'yes'),
(10, 'comments_notify', '1', 'yes'),
(11, 'posts_per_rss', '10', 'yes'),
(12, 'rss_use_excerpt', '0', 'yes'),
(13, 'mailserver_url', 'mail.example.com', 'yes'),
(14, 'mailserver_login', 'login@example.com', 'yes'),
(15, 'mailserver_pass', 'password', 'yes'),
(16, 'mailserver_port', '110', 'yes'),
(17, 'default_category', '1', 'yes'),
(18, 'default_comment_status', 'open', 'yes'),
(19, 'default_ping_status', 'open', 'yes'),
(20, 'default_pingback_flag', '1', 'yes'),
(21, 'posts_per_page', '10', 'yes'),
(22, 'date_format', 'F j, Y', 'yes'),
(23, 'time_format', 'g:i a', 'yes'),
(24, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(25, 'links_recently_updated_prepend', '<em>', 'yes'),
(26, 'links_recently_updated_append', '</em>', 'yes'),
(27, 'links_recently_updated_time', '120', 'yes'),
(28, 'comment_moderation', '0', 'yes'),
(29, 'moderation_notify', '1', 'yes'),
(30, 'permalink_structure', '', 'yes'),
(31, 'gzipcompression', '0', 'yes'),
(32, 'hack_file', '0', 'yes'),
(33, 'blog_charset', 'UTF-8', 'yes'),
(34, 'moderation_keys', '', 'no'),
(35, 'active_plugins', 'a:0:{}', 'yes'),
(36, 'home', 'http://localhost/lokertki', 'yes'),
(37, 'category_base', '', 'yes'),
(38, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(39, 'advanced_edit', '0', 'yes'),
(40, 'comment_max_links', '2', 'yes'),
(41, 'gmt_offset', '0', 'yes'),
(42, 'default_email_category', '1', 'yes'),
(43, 'recently_edited', '', 'no'),
(44, 'template', 'jobroller-v1.6.4', 'yes'),
(45, 'stylesheet', 'jobroller-v1.6.4', 'yes'),
(46, 'comment_whitelist', '1', 'yes'),
(47, 'blacklist_keys', '', 'no'),
(48, 'comment_registration', '0', 'yes'),
(49, 'html_type', 'text/html', 'yes'),
(50, 'use_trackback', '0', 'yes'),
(51, 'default_role', 'contributor', 'yes'),
(52, 'db_version', '24448', 'yes'),
(53, 'uploads_use_yearmonth_folders', '1', 'yes'),
(54, 'upload_path', '', 'yes'),
(55, 'blog_public', '1', 'yes'),
(56, 'default_link_category', '2', 'yes'),
(57, 'show_on_front', 'posts', 'yes'),
(58, 'tag_base', '', 'yes'),
(59, 'show_avatars', '1', 'yes'),
(60, 'avatar_rating', 'G', 'yes'),
(61, 'upload_url_path', '', 'yes'),
(62, 'thumbnail_size_w', '150', 'yes'),
(63, 'thumbnail_size_h', '150', 'yes'),
(64, 'thumbnail_crop', '1', 'yes'),
(65, 'medium_size_w', '300', 'yes'),
(66, 'medium_size_h', '300', 'yes'),
(67, 'avatar_default', 'mystery', 'yes'),
(68, 'large_size_w', '1024', 'yes'),
(69, 'large_size_h', '1024', 'yes'),
(70, 'image_default_link_type', 'file', 'yes'),
(71, 'image_default_size', '', 'yes'),
(72, 'image_default_align', '', 'yes'),
(73, 'close_comments_for_old_posts', '0', 'yes'),
(74, 'close_comments_days_old', '14', 'yes'),
(75, 'thread_comments', '1', 'yes'),
(76, 'thread_comments_depth', '5', 'yes'),
(77, 'page_comments', '0', 'yes'),
(78, 'comments_per_page', '50', 'yes'),
(79, 'default_comments_page', 'newest', 'yes'),
(80, 'comment_order', 'asc', 'yes'),
(81, 'sticky_posts', 'a:0:{}', 'yes'),
(82, 'widget_categories', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(83, 'widget_text', 'a:0:{}', 'yes'),
(84, 'widget_rss', 'a:0:{}', 'yes'),
(85, 'uninstall_plugins', 'a:0:{}', 'no'),
(86, 'timezone_string', '', 'yes'),
(87, 'page_for_posts', '0', 'yes'),
(88, 'page_on_front', '0', 'yes'),
(89, 'default_post_format', '0', 'yes'),
(90, 'link_manager_enabled', '0', 'yes'),
(91, 'initial_db_version', '24448', 'yes'),
(92, 'wp_user_roles', 'a:8:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:64:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:14:"can_submit_job";b:1;s:16:"can_view_resumes";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:35:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:14:"can_submit_job";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:11:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;s:14:"can_submit_job";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:6:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:14:"can_submit_job";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:10:"job_seeker";a:2:{s:4:"name";s:10:"Job Seeker";s:12:"capabilities";a:4:{s:4:"read";b:1;s:10:"edit_posts";b:0;s:12:"delete_posts";b:0;s:17:"can_submit_resume";b:1;}}s:10:"job_lister";a:2:{s:4:"name";s:10:"Job Lister";s:12:"capabilities";a:4:{s:4:"read";b:1;s:10:"edit_posts";b:0;s:12:"delete_posts";b:0;s:14:"can_submit_job";b:1;}}s:9:"recruiter";a:2:{s:4:"name";s:9:"Recruiter";s:12:"capabilities";a:5:{s:4:"read";b:1;s:10:"edit_posts";b:0;s:12:"delete_posts";b:0;s:14:"can_submit_job";b:1;s:16:"can_view_resumes";b:1;}}}', 'yes'),
(93, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_recent-posts', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'widget_recent-comments', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_archives', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_meta', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'sidebars_widgets', 'a:9:{s:19:"wp_inactive_widgets";a:0:{}s:12:"sidebar_main";a:0:{}s:12:"sidebar_blog";a:0:{}s:12:"sidebar_page";a:0:{}s:11:"sidebar_job";a:0:{}s:12:"sidebar_user";a:0:{}s:14:"sidebar_submit";a:0:{}s:14:"sidebar_resume";a:0:{}s:13:"array_version";i:3;}', 'yes'),
(99, 'cron', 'a:4:{i:1379392331;a:1:{s:21:"jr_check_jobs_expired";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1379409887;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1379411937;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(101, '_site_transient_update_core', 'O:8:"stdClass":3:{s:7:"updates";a:0:{}s:15:"version_checked";s:5:"3.6.1";s:12:"last_checked";i:1379387130;}', 'yes'),
(102, '_site_transient_update_plugins', 'O:8:"stdClass":3:{s:12:"last_checked";i:1379387160;s:7:"checked";a:2:{s:19:"akismet/akismet.php";s:5:"2.5.9";s:9:"hello.php";s:3:"1.6";}s:8:"response";a:0:{}}', 'yes'),
(105, '_site_transient_update_themes', 'O:8:"stdClass":3:{s:12:"last_checked";i:1379387190;s:7:"checked";a:3:{s:16:"jobroller-v1.6.4";s:5:"1.6.4";s:14:"twentythirteen";s:3:"1.0";s:12:"twentytwelve";s:3:"1.2";}s:8:"response";a:0:{}}', 'yes'),
(106, '_site_transient_timeout_browser_7b3c8f5515f4dae0b11f5c777183690e', '1379928296', 'yes'),
(107, '_site_transient_browser_7b3c8f5515f4dae0b11f5c777183690e', 'a:9:{s:8:"platform";s:5:"Linux";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"29.0.1547.65";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(108, 'dashboard_widget_options', 'a:4:{s:25:"dashboard_recent_comments";a:1:{s:5:"items";i:5;}s:24:"dashboard_incoming_links";a:5:{s:4:"home";s:25:"http://localhost/lokertki";s:4:"link";s:101:"http://blogsearch.google.com/blogsearch?scoring=d&partner=wordpress&q=link:http://localhost/lokertki/";s:3:"url";s:134:"http://blogsearch.google.com/blogsearch_feeds?scoring=d&ie=utf-8&num=10&output=rss&partner=wordpress&q=link:http://localhost/lokertki/";s:5:"items";i:10;s:9:"show_date";b:0;}s:17:"dashboard_primary";a:7:{s:4:"link";s:26:"http://wordpress.org/news/";s:3:"url";s:31:"http://wordpress.org/news/feed/";s:5:"title";s:14:"WordPress Blog";s:5:"items";i:2;s:12:"show_summary";i:1;s:11:"show_author";i:0;s:9:"show_date";i:1;}s:19:"dashboard_secondary";a:7:{s:4:"link";s:28:"http://planet.wordpress.org/";s:3:"url";s:33:"http://planet.wordpress.org/feed/";s:5:"title";s:20:"Other WordPress News";s:5:"items";i:5;s:12:"show_summary";i:0;s:11:"show_author";i:0;s:9:"show_date";i:0;}}', 'yes'),
(110, 'can_compress_scripts', '1', 'yes'),
(130, '_transient_timeout_plugin_slugs', '1379409900', 'no'),
(131, '_transient_plugin_slugs', 'a:2:{i:0;s:19:"akismet/akismet.php";i:1;s:9:"hello.php";}', 'no'),
(142, '_site_transient_timeout_wporg_theme_feature_list', '1379338126', 'yes'),
(143, '_site_transient_wporg_theme_feature_list', 'a:5:{s:6:"Colors";a:15:{i:0;s:5:"black";i:1;s:4:"blue";i:2;s:5:"brown";i:3;s:4:"gray";i:4;s:5:"green";i:5;s:6:"orange";i:6;s:4:"pink";i:7;s:6:"purple";i:8;s:3:"red";i:9;s:6:"silver";i:10;s:3:"tan";i:11;s:5:"white";i:12;s:6:"yellow";i:13;s:4:"dark";i:14;s:5:"light";}s:7:"Columns";a:6:{i:0;s:10:"one-column";i:1;s:11:"two-columns";i:2;s:13:"three-columns";i:3;s:12:"four-columns";i:4;s:12:"left-sidebar";i:5;s:13:"right-sidebar";}s:5:"Width";a:2:{i:0;s:11:"fixed-width";i:1;s:14:"flexible-width";}s:8:"Features";a:19:{i:0;s:8:"blavatar";i:1;s:10:"buddypress";i:2;s:17:"custom-background";i:3;s:13:"custom-colors";i:4;s:13:"custom-header";i:5;s:11:"custom-menu";i:6;s:12:"editor-style";i:7;s:21:"featured-image-header";i:8;s:15:"featured-images";i:9;s:15:"flexible-header";i:10;s:20:"front-page-post-form";i:11;s:19:"full-width-template";i:12;s:12:"microformats";i:13;s:12:"post-formats";i:14;s:20:"rtl-language-support";i:15;s:11:"sticky-post";i:16;s:13:"theme-options";i:17;s:17:"threaded-comments";i:18;s:17:"translation-ready";}s:7:"Subject";a:3:{i:0;s:7:"holiday";i:1;s:13:"photoblogging";i:2;s:8:"seasonal";}}', 'yes'),
(145, 'ftp_credentials', 'a:3:{s:8:"hostname";s:9:"localhost";s:8:"username";s:5:"admin";s:15:"connection_type";s:3:"ftp";}', 'yes'),
(146, 'jr_check_jobs_expired', 'yes', 'yes'),
(149, 'theme_mods_twentythirteen', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1379327336;s:4:"data";a:3:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}}}}', 'yes'),
(150, 'current_theme', 'JobRoller', 'yes'),
(151, 'theme_mods_jobroller-v1.6.4', 'a:1:{i:0;b:0;}', 'yes'),
(152, 'theme_switched', '', 'yes'),
(153, 'jr_get_indeed_jobs', 'no', 'yes'),
(154, 'jr_indeed_xml_index', '0', 'yes'),
(155, 'jr_child_theme', 'style-pro-blue.css', 'yes'),
(156, 'jr_use_logo', 'no', 'yes'),
(157, 'jr_logo_url', '', 'yes'),
(158, 'jr_disable_blog', 'no', 'yes'),
(159, 'jr_feedburner_url', '', 'yes'),
(160, 'jr_twitter_id', '', 'yes'),
(161, 'jr_facebook_id', '', 'yes'),
(162, 'jr_sharethis_id', '', 'yes'),
(163, 'jr_google_analytics', '', 'yes'),
(164, 'jr_gmaps_lang', 'en', 'yes'),
(165, 'jr_gmaps_region', 'US', 'yes'),
(166, 'jr_distance_unit', 'mi', 'yes'),
(167, 'jr_allow_registration_password', 'yes', 'yes'),
(168, 'jr_show_sidebar', 'yes', 'yes'),
(169, 'jr_show_searchbar', 'yes', 'yes'),
(170, 'jr_show_filterbar', 'yes', 'yes'),
(171, 'jr_show_empty_categories', '1', 'yes'),
(172, 'jr_jobs_submit_text', '', 'yes'),
(173, 'jr_jobs_default_expires', '30', 'yes'),
(174, 'jr_jobs_require_moderation', 'yes', 'yes'),
(175, 'jr_allow_editing', 'yes', 'yes'),
(176, 'jr_editing_needs_approval', 'yes', 'yes'),
(177, 'jr_ad_stats_all', 'yes', 'yes'),
(178, 'jr_submit_how_to_apply_display', 'yes', 'yes'),
(179, 'jr_submit_cat_required', 'no', 'yes'),
(180, 'jr_enable_salary_field', 'yes', 'yes'),
(181, 'jr_html_allowed', 'yes', 'yes'),
(182, 'jr_expired_action', 'display_message', 'yes'),
(183, 'jr_allow_job_seekers', 'yes', 'yes'),
(184, 'jr_my_profile_button_text', 'Submit your Resume, update your profile, and allow employers to find <em>you</em>!', 'yes'),
(185, 'jr_submit_resume_button_text', 'Register as a Job Seeker to submit your Resume.', 'yes'),
(186, 'jr_resume_listing_visibility', 'listers', 'yes'),
(187, 'jr_resume_visibility', 'listers', 'yes'),
(188, 'jr_resume_show_contact_form', 'no', 'yes'),
(189, 'jr_featured_category_id', '2', 'yes'),
(190, 'jr_submit_page_id', '20', 'yes'),
(191, 'jr_edit_job_page_id', '21', 'yes'),
(192, 'jr_dashboard_page_id', '18', 'yes'),
(193, 'jr_user_profile_page_id', '15', 'yes'),
(194, 'jr_add_new_confirm_page_id', '19', 'yes'),
(195, 'jr_blog_page_id', '14', 'yes'),
(196, 'jr_date_archive_page_id', '13', 'yes'),
(197, 'jr_terms_page_id', '', 'yes'),
(198, 'jr_job_seeker_register_page_id', '', 'yes'),
(199, 'jr_job_seeker_resume_page_id', '16', 'yes'),
(200, 'jr_admin_security', 'manage_options', 'yes'),
(201, 'jr_captcha_enable', 'no', 'yes'),
(202, 'jr_captcha_public_key', '', 'yes'),
(203, 'jr_captcha_private_key', '', 'yes'),
(204, 'jr_captcha_theme', 'red', 'yes'),
(205, 'jr_antispam_question', 'Is fire “<em>hot</em>” or “<em>cold</em>”?', 'yes'),
(206, 'jr_antispam_answer', 'hot', 'yes'),
(207, 'jr_enable_header_banner', 'no', 'yes'),
(208, 'jr_header_banner', '', 'yes'),
(209, 'jr_enable_listing_banner', 'no', 'yes'),
(210, 'jr_listing_banner', '', 'yes'),
(211, 'jr_debug_mode', 'no', 'yes'),
(212, 'jr_enable_log', 'no', 'yes'),
(213, 'jr_google_jquery', 'no', 'yes'),
(214, 'jr_remove_wp_generator', 'yes', 'yes'),
(215, 'jr_remove_admin_bar', 'yes', 'yes'),
(216, 'jr_job_permalink', 'jobs', 'yes'),
(217, 'jr_job_cat_tax_permalink', 'job-category', 'yes'),
(218, 'jr_job_type_tax_permalink', 'job-type', 'yes'),
(219, 'jr_job_tag_tax_permalink', 'job-tag', 'yes'),
(220, 'jr_job_salary_tax_permalink', 'salary', 'yes'),
(221, 'jr_resume_permalink', 'resumes', 'yes'),
(222, 'jr_jobs_listing_cost', '', 'yes'),
(223, 'jr_allow_relist', 'yes', 'yes'),
(224, 'jr_jobs_relisting_cost', '', 'yes'),
(225, 'jr_cost_to_feature', '', 'yes'),
(226, 'jr_curr_symbol_pos', 'left', 'yes'),
(227, 'jr_curr_thousands_separator', 'comma', 'yes'),
(228, 'jr_curr_decimal_separator', 'decimal', 'yes'),
(229, 'jr_jobs_paypal_currency', '', 'yes'),
(230, 'jr_resume_require_subscription', 'no', 'yes'),
(231, 'jr_resume_subscription_notice', 'Sorry, you do not have permission to browse and view resumes. To access our resume database please subscribe using the button below.', 'yes'),
(232, 'jr_resume_subscr_recurr_type', 'manual', 'yes'),
(233, 'jr_resume_access_cost', '', 'yes'),
(234, 'jr_resume_access_length', '1', 'yes'),
(235, 'jr_resume_access_unit', 'M', 'yes'),
(236, 'jr_resume_allow_trial', 'no', 'yes'),
(237, 'jr_resume_trial_cost', '', 'yes'),
(238, 'jr_resume_trial_length', '1', 'yes'),
(239, 'jr_resume_trial_unit', 'M', 'yes'),
(240, 'jr_jobs_paypal_email', '', 'yes'),
(241, 'jr_enable_paypal_ipn', 'yes', 'yes'),
(242, 'jr_paypal_ipn_debug', '', 'yes'),
(243, 'jr_use_paypal_sandbox', 'no', 'yes'),
(244, 'jr_nu_admin_email', 'yes', 'yes'),
(245, 'jr_nu_custom_email', 'no', 'yes'),
(246, 'jr_nu_from_name', 'Lowongan Kerja TKI', 'yes'),
(247, 'jr_nu_from_email', 'webmaster@tukangbagus.com', 'yes'),
(248, 'jr_nu_email_subject', 'Thank you for registering, %username%', 'yes'),
(249, 'jr_nu_email_type', 'text/plain', 'yes'),
(250, 'jr_nu_email_body', '\nHi %username%,\n\nWelcome to %blogname%!\n\nBelow you will find your username and password which allows you to login to your user account.\n\n--------------------------\nUsername: %username%\nPassword: %password%\n\n%loginurl%\n--------------------------\n\nIf you have any questions, please just let us know.\n\nBest regards,\n\n\nYour %blogname% Team\n%siteurl%\n', 'yes'),
(251, 'jr_packs_dashboard_buy', 'no', 'yes'),
(252, 'jr_job_alerts', 'no', 'yes'),
(253, 'jr_job_alerts_feed', 'no', 'yes'),
(254, 'jr_job_alerts_from_name', 'Lowongan Kerja TKI', 'yes'),
(255, 'jr_job_alerts_from_email', 'webmaster@tukangbagus.com', 'yes'),
(256, 'jr_job_alerts_email_subject', 'Job Alerts', 'yes'),
(257, 'jr_job_alerts_email_type', 'text/html', 'yes'),
(258, 'jr_job_alerts_email_template', 'standard', 'yes'),
(259, 'jr_job_alerts_email_body', '\n\n%joblist%\n\nYou''re receiving this email because you''re subscribed to %blogname% job alerts. To unsubscribe please change the alert settings on your dashboard.\n\nBest regards,\nYour %blogname% Team\n%siteurl%\n\n', 'yes'),
(260, 'jr_job_alerts_job_body', '\n\n%jobtitle%\nby: %author% @ %jobtime%\nJob Type: %jobtype% | Job Category: %jobcat% | Company: %company% | Location: %location%\n\n%jobdetails%\n\n%permalink%\n\n<hr/>\n\n', 'yes'),
(261, 'jr_indeed_frontpage_cache', '3600', 'yes'),
(262, 'job_cat_children', 'a:0:{}', 'yes'),
(263, 'job_type_children', 'a:0:{}', 'yes'),
(264, 'job_salary_children', 'a:0:{}', 'yes'),
(265, 'resume_category_children', 'a:0:{}', 'yes'),
(266, 'jobroller_version', '1.6.4', 'yes'),
(279, '_transient_timeout_dash_20494a3d90a6669585674ed0eb8dcd8f', '1379430381', 'no'),
(280, '_transient_dash_20494a3d90a6669585674ed0eb8dcd8f', '<p><strong>RSS Error</strong>: WP HTTP Error: name lookup timed out</p>', 'no'),
(281, '_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51', '1379430381', 'no'),
(282, '_transient_dash_4077549d03da2e451c8b5f002294ff51', '<div class="rss-widget"><p><strong>RSS Error</strong>: WP HTTP Error: name lookup timed out</p></div>', 'no'),
(283, '_transient_timeout_dash_aa95765b5cc111c56d5993d476b1c2f0', '1379430381', 'no'),
(284, '_transient_dash_aa95765b5cc111c56d5993d476b1c2f0', '<div class="rss-widget"><p><strong>RSS Error</strong>: WP HTTP Error: name lookup timed out</p></div>', 'no'),
(285, '_site_transient_timeout_theme_roots', '1379388990', 'yes'),
(286, '_site_transient_theme_roots', 'a:3:{s:16:"jobroller-v1.6.4";s:7:"/themes";s:14:"twentythirteen";s:7:"/themes";s:12:"twentytwelve";s:7:"/themes";}', 'yes'),
(287, '_transient_timeout_dash_de3249c4736ad3bd2cd29147c4a0d43e', '1379430412', 'no'),
(288, '_transient_dash_de3249c4736ad3bd2cd29147c4a0d43e', '', 'no'),
(290, '_transient_timeout_feed_9d90be8b7cfb7ce27f0c719900f3f657', '1379432682', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(291, '_transient_feed_9d90be8b7cfb7ce27f0c719900f3f657', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:50:"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:8:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:9:"AppThemes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:24:"http://www.appthemes.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:24:"Premium WordPress Themes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 14 Sep 2013 17:20:08 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:29:"http://wordpress.org/?v=3.6.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:5:"image";a:1:{i:0;a:6:{s:4:"data";s:0:"";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:3:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:21:"http://appthemes.com/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:3:"url";a:1:{i:0;a:5:{s:4:"data";s:51:"http://img806.imageshack.us/img806/2708/logo2ev.jpg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:9:"AppThemes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:42:"\n		\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:6:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:36:"Clipper Powers Celebrity Coupon Site";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"http://feedproxy.google.com/~r/appthemes/~3/ReIbtu1NOyU/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"http://www.appthemes.com/blog/clipper-powers-celebrity-coupon-site/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 19 Aug 2013 10:04:12 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:4:"News";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"http://www.appthemes.com/?p=7719";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:319:"Celebrity couponer Kate Gosselin has a brand new coupon site and it&#8217;s running on the number one coupon theme for WordPress, Clipper! Have a peek at Kate&#8217;s Clipper site. Kate Gosselin was the star of Jon and Kate Plus 8 and was also a contestant on Dancing with the Stars. Turns out this reality TV [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Shannon Dunn";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:3455:"<p>Celebrity couponer Kate Gosselin has a brand new coupon site and it&#8217;s running on the number one coupon theme for WordPress, Clipper! Have a peek at <a href="http://couponsbykate.com/" title="CouponsByKate.com powered by Clipper Coupon Theme from AppThemes" target="_blank">Kate&#8217;s Clipper site</a>.</p>\n<p><img src="//cdn.appthemes.com/wp-content/uploads/2013/08/couponsbykate-home.png" alt="New Kate Gosselin coupon site powered by Clipper" width="648" height="859" class="alignnone size-full wp-image-7726" style="border:1px solid #000;" /></p>\n<p>Kate Gosselin was the star of Jon and Kate Plus 8 and was also a contestant on Dancing with the Stars. Turns out this reality TV star is also a big time couponer. She previously blogged for CouponCabin but wanted to have a coupon site of her very own.<span id="more-7719"></span></p>\n<p>Choosing Clipper was an easy decision for Kate. With eight kids and the demands of celebrity life tugging at her, Kate doesn&#8217;t have a ton of time to manage a coupon site. Fortunately, Clipper makes running a coupon site quick and easy. </p>\n<p>Powering this reality TV star&#8217;s coupon clipping site is no small task but Clipper is easily getting the job done. </p>\n<p>Kate&#8217;s site is packed with over 12,000 coupons provided by AppThemes partner, <a href="http://docs.appthemes.com/help/recommended-plugins/#Coupilia" title="Coupilia provides clean coupon code feeds for Clipper">Coupilia</a>. There&#8217;s plenty of traffic to the site, too. Miss Gosselin has over 150,000 Twitter followers and she&#8217;s tweeting news about her coupon deals daily. A cover story for People Magazine with a mention of CouponsByKate.com means even more traffic for Clipper to handle.</p>\n<p>The results are fantastic! A great custom child theme, snappy page loads and tons of coupons. Without a doubt, this is Clipper at it&#8217;s best!</p>\n<p>Want to Learn More?</p>\n<ul>\n<li><a href="http://www.appthemes.com/themes/clipper/" title="Clipper, the best coupon theme for WordPress">Find out more about Clipper</a></li>\n<li><a href="http://demos.appthemes.com/?theme=clipper" title="Clipper coupon theme demo">View the Clipper demo</a></li>\n<li><a href="http://docs.appthemes.com/help/recommended-plugins/#Coupilia" title="Coupon data feed for WordPress from Coupilia">Get tons of coupons from Coupilia</a></li>\n</ul>\n<div class="feedflare">\n<a href="http://feeds.feedburner.com/~ff/appthemes?a=ReIbtu1NOyU:Vb-B2FfpNhU:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/appthemes?d=yIl2AUoC8zA" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=ReIbtu1NOyU:Vb-B2FfpNhU:D7DqB2pKExk"><img src="http://feeds.feedburner.com/~ff/appthemes?i=ReIbtu1NOyU:Vb-B2FfpNhU:D7DqB2pKExk" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=ReIbtu1NOyU:Vb-B2FfpNhU:V_sGLiPBpWU"><img src="http://feeds.feedburner.com/~ff/appthemes?i=ReIbtu1NOyU:Vb-B2FfpNhU:V_sGLiPBpWU" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=ReIbtu1NOyU:Vb-B2FfpNhU:qj6IDK7rITs"><img src="http://feeds.feedburner.com/~ff/appthemes?d=qj6IDK7rITs" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=ReIbtu1NOyU:Vb-B2FfpNhU:gIN9vFwOqvQ"><img src="http://feeds.feedburner.com/~ff/appthemes?i=ReIbtu1NOyU:Vb-B2FfpNhU:gIN9vFwOqvQ" border="0"></img></a>\n</div><img src="http://feeds.feedburner.com/~r/appthemes/~4/ReIbtu1NOyU" height="1" width="1"/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:72:"http://www.appthemes.com/blog/clipper-powers-celebrity-coupon-site/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"6";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:42:"http://rssnamespace.org/feedburner/ext/1.0";a:1:{s:8:"origLink";a:1:{i:0;a:5:{s:4:"data";s:67:"http://www.appthemes.com/blog/clipper-powers-celebrity-coupon-site/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:57:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:6:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"Vantage 1.2 Released";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"http://feedproxy.google.com/~r/appthemes/~3/QZI9jzp5LKU/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:60:"http://www.appthemes.com/blog/vantage-1-2-released/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 22 May 2013 00:30:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:6:{i:0;a:5:{s:4:"data";s:7:"Updates";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:7:"appmaps";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:6:"events";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:4:"maps";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:4;a:5:{s:4:"data";s:19:"multiple categories";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:5;a:5:{s:4:"data";s:7:"vantage";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"http://www.appthemes.com/?p=7509";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:364:"Vantage 1.2 has been released! This release, Vantage&#8217;s most Event-ful release ever, really puts Vantage on the map big time. Vantage has navigated and sorted through many new features and excels across multiple categories of greatness. Check out this list of the highlighted features for version 1.2: Events Introducing Events, a new post type that [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Josh Ronk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:7479:"<p><a href="http://docs.appthemes.com/vantage/vantage-version-1-2/">Vantage 1.2 has been released</a>! This release, Vantage&#8217;s most <a href="#featured-event">Event</a>-ful release ever, really puts Vantage on the <a href="#featured-maps">map</a> big time. Vantage has <a href="#featured-nav">navigated</a> and <a href="#featured-sorting">sorted</a> through many new features and excels across <a href="#featured-multi-cat">multiple categories</a> of greatness.</p>\n<p>Check out this list of the highlighted features for version 1.2:</p>\n<h3 id="featured-events">Events</h3>\n<p>Introducing Events, a new post type that works right along side of Vantage&#8217;s Listings. Events are like Listings but are date based items used to show upcoming events.</p>\n<h4>Single Event View:</h4>\n<p><img class="alignnone size-full" style="border: 1px solid #666" title="Vantage 1.2 - Single Event View" src="//cdn.appthemes.com/wp-content/uploads/2013/05/event-single-close.png" alt="" width="648" /><span id="more-7509"></span></p>\n<h4>Event Date Filtered List:</h4>\n<p><img class="alignnone size-full" style="border: 1px solid #666" title="Vantage 1.2 - Events Date Filtered List" src="//cdn.appthemes.com/wp-content/uploads/2013/05/event-day-archive-dropdown.png" alt="" width="648" /></p>\n<h4>Event Form:</h4>\n<p><img class="alignnone size-full" style="border: 1px solid #666" title="Vantage 1.2 - Events Form" src="//cdn.appthemes.com/wp-content/uploads/2013/05/event-form.png" alt="" width="648" /></p>\n<h4>Threaded Comments:</h4>\n<p><img class="alignnone size-full" style="border: 1px solid #666" title="Vantage 1.2 - Events Comments" src="//cdn.appthemes.com/wp-content/uploads/2013/05/event-single-comments.png" alt="" width="648" /></p>\n<p>Just like listings, you can charge for events and allow featured events. Pricing for events is completely up to you &#8211; provide events for free or charge a fee. Events also comes with a whole new batch of widgets: create event button, popular events, recently added events, similar events and upcoming events. </p>\n<p>One more special, custom widget worth noting is the event attendees widget. This widget let&#8217;s users RSVP for event or see who else is attending an event. You can read more about this widget and how to use it in our <a href="http://docs.appthemes.com/tutorials/setting-up-and-using-the-event-attendees-widget">Setting Up and Using the Event Attendees Widget</a> tutorial.</p>\n<h3 id="featured-multi-cat">Multiple Categories Support and Category Surcharges</h3>\n<p>Multiple categories are now supported and are available for both Listings and Events. We also added category surcharges. Surcharges allow you to charge a little more for posting events in specific categories.<br />\n<img class="alignnone size-full" style="border: 1px solid #666" title="Vantage 1.2 - Category Surcharges" src="//cdn.appthemes.com/wp-content/uploads/2013/05/category-surcharges.png" alt="" width="648" /></p>\n<h3 id="featured-sorting">List Page Sorting</h3>\n<p>Vantage adds a ton of convenient sorting options for both events and listings.<br />\n<img class="alignnone size-full" style="border: 1px solid #666" title="Vantage 1.2 - Sorting" src="//cdn.appthemes.com/wp-content/uploads/2013/05/new-sort-ui.png" alt="" width="648" /></p>\n<h3>New AppMaps</h3>\n<p>In Vantage 1.2, we have moved map settings to a new location: Admin > Vantage > Geo Settings. This is done in anticipation of the soon-to-be-released AppMaps plugin which will allow alternatives to the Google Maps API that comes standard with Vantage. As before, the Geo Settings will control how Vantage works with map APIs to determine locations and distances.<br />\n<img class="alignnone size-full" style="border: 1px solid #666" title="Vantage 1.2 - AppMaps" src="//cdn.appthemes.com/wp-content/uploads/2013/05/app-maps-settings-close.png" alt="" width="648" /></p>\n<h3 id="featured-maps">Big Maps</h3>\n<p>There is now a widgetized sidebar and new widget that will display a big map at the top of the list pages. This new map widget will display different colored markers for Listings and Events. Each marker links directly to the Listing or Event.<br />\n<img class="alignnone size-full" style="border: 1px solid #666" title="Vantage 1.2 - Big Maps on List Pages" src="//cdn.appthemes.com/wp-content/uploads/2013/05/big-list-top-map.png" alt="" width="648" /></p>\n<h3 id="featured-nav">Driving Directions</h3>\n<p>The map widget now also includes Google driving directions. Driving directions are optional and can be enabled within the widget settings. With a simple button push, users can print the directions in an easily readable format.<br />\n<img class="alignnone size-full" style="border: 1px solid #666" title="Vantage 1.2 - Driving Directions" src="//cdn.appthemes.com/wp-content/uploads/2013/05/driving-directions-close.png" alt="" width="648" /></p>\n<h3>Contact Listing / Event Owner</h3>\n<p>Your visitors can now contact the Listing owners or Event organizers directly, through a popup contact form available on each Listing and Event page.<br />\n<img class="alignnone size-full" style="border: 1px solid #666" title="Vantage 1.2 - Contact Form" src="//cdn.appthemes.com/wp-content/uploads/2013/05/contact-event-organizer.png" alt="" width="648" /></p>\n<h2>How Do I get This Update?</h2>\n<p>That&#8217;s a huge list and there is an even longer list of resolved issues and code improvements that&#8217;s too long to list here. By now, you must be wondering how to get your hands on the new release. You can download a copy from your customer dashboard. Or better yet, download and install the <a href="http://www.appthemes.com/blog/new-plugin-to-keep-your-themes-healthy/">AppThemes Updater Plugin</a> to make updating a snap!</p>\n<h3>New Tutorials</h3>\n<p>To help you along with all these new improvements, we created new tutorials and updated some of our exiting tutorials. As always, our helpful support team is ready to assist you with any needs.</p>\n<ul>\n<li><a href="http://docs.appthemes.com/tutorials/setting-up-events">Setting Up Events in Vantage</a></li>\n<li><a href="http://docs.appthemes.com/tutorials/setting-up-and-using-the-event-attendees-widget">Setting Up and Using the Event Attendees Widget in Vantage</a></li>\n<li><a href="http://docs.appthemes.com/tutorials/setting-up-maps-and-using-map-widgets">Setting up maps and using map widgets</a></li>\n</ul>\n<div class="feedflare">\n<a href="http://feeds.feedburner.com/~ff/appthemes?a=QZI9jzp5LKU:Vzcwl_xLNJg:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/appthemes?d=yIl2AUoC8zA" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=QZI9jzp5LKU:Vzcwl_xLNJg:D7DqB2pKExk"><img src="http://feeds.feedburner.com/~ff/appthemes?i=QZI9jzp5LKU:Vzcwl_xLNJg:D7DqB2pKExk" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=QZI9jzp5LKU:Vzcwl_xLNJg:V_sGLiPBpWU"><img src="http://feeds.feedburner.com/~ff/appthemes?i=QZI9jzp5LKU:Vzcwl_xLNJg:V_sGLiPBpWU" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=QZI9jzp5LKU:Vzcwl_xLNJg:qj6IDK7rITs"><img src="http://feeds.feedburner.com/~ff/appthemes?d=qj6IDK7rITs" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=QZI9jzp5LKU:Vzcwl_xLNJg:gIN9vFwOqvQ"><img src="http://feeds.feedburner.com/~ff/appthemes?i=QZI9jzp5LKU:Vzcwl_xLNJg:gIN9vFwOqvQ" border="0"></img></a>\n</div><img src="http://feeds.feedburner.com/~r/appthemes/~4/QZI9jzp5LKU" height="1" width="1"/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:56:"http://www.appthemes.com/blog/vantage-1-2-released/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"34";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:42:"http://rssnamespace.org/feedburner/ext/1.0";a:1:{s:8:"origLink";a:1:{i:0;a:5:{s:4:"data";s:51:"http://www.appthemes.com/blog/vantage-1-2-released/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:63:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n		\n		\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:6:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:27:"JobRoller 1.7 Now Available";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"http://feedproxy.google.com/~r/appthemes/~3/gjJwTE164Ik/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:53:"http://www.appthemes.com/blog/jobroller-1-7/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 22 Apr 2013 15:27:21 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:8:{i:0;a:5:{s:4:"data";s:7:"Updates";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:17:"AppThemes coupons";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:19:"custom form builder";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:12:"custom forms";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:4;a:5:{s:4:"data";s:8:"gateways";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:5;a:5:{s:4:"data";s:9:"jobroller";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:6;a:5:{s:4:"data";s:12:"payments api";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:7;a:5:{s:4:"data";s:10:"recruiters";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"http://www.appthemes.com/?p=7168";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:336:"JobRoller 1.7 is here with some fantastic updates! Here&#8217;s a taste of what&#8217;s in JobRoller 1.7. Be sure to read the full post as there are important notes for those choosing to update to JobRoller 1.7. Custom Forms Those who already own Vantage, should already be familiar with this feature. It works like the normal [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Bruno Carreço";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:9499:"<p>JobRoller 1.7 is here with some fantastic updates! Here&#8217;s a taste of what&#8217;s in JobRoller 1.7. </p>\n<p><strong>Be sure to read the full post as there are important notes for those choosing to update to JobRoller 1.7.</strong></p>\n<p><a href="//cdn.appthemes.com/wp-content/uploads/2013/03/edit-custom-form.png"><img src="//cdn.appthemes.com/wp-content/uploads/2013/03/edit-custom-form.png" alt="edit-custom-form" width="640" height="273" class="aligncenter size-large wp-image-7169" /></a></p>\n<p><strong>Custom Forms</strong><br />\nThose who already own Vantage, should already be familiar with this feature. It works like the normal Posts menu on WP backend, but to create custom forms. Each new form can have any custom field type and can be assigned to one or multiple categories.<span id="more-7168"></span></p>\n<p>On JobRoller, custom forms can be created to provide additional fields to job listers when submitting jobs. When users select a job category assigned to a custom form it is presented with the custom fields. These can be optional or required.</p>\n<p>Additional fields are displayed after the job lister selects the job category.</p>\n<p><a href="//cdn.appthemes.com/wp-content/uploads/2013/03/custom-fields-e1364605446797.png"><img src="//cdn.appthemes.com/wp-content/uploads/2013/03/custom-fields-e1364605446797.png" alt="custom-fields" width="370" height="240" class="aligncenter size-full wp-image-7237" /></a></p>\n<p>Any values inserted on the custom fields are available on the job page, including file downloads.</p>\n<p><a href="//cdn.appthemes.com/wp-content/uploads/2013/03/job-page.png"><img src="//cdn.appthemes.com/wp-content/uploads/2013/03/job-page.png" alt="job-page" width="550" height="314" class="aligncenter size-full wp-image-7183" /></a></p>\n<p><strong>Payments</strong><br />\nOur powerful payments framework is now integrated with JobRoller 1.7 meaning that payment gateways are not limited to PayPal anymore. Bank Transfer is now an additional option and additional gateways can be purchased from our Marketplace. </p>\n<p>The payments framework adds it&#8217;s own menu on WP backend and allows site owners to easily manage all payment settings, plans and orders. This change also allowed to trim down the number of scattered menu pages and settings related with pricing and orders.</p>\n<p><a href="//cdn.appthemes.com/wp-content/uploads/2013/03/payments.png"><img src="//cdn.appthemes.com/wp-content/uploads/2013/03/payments.png" alt="payments" width="145" height="125" class="aligncenter size-full wp-image-7196" /></a></p>\n<p>Previous versions only allowed to create one single pricing plan, unless you used job packs. After 1.7, site owners choose a plan type, single or pack, create any number of job plan and assign them to any job category. Additionally, plans have their own relist price that enable job listers to relist jobs for free or at a lower price and can be set a usage limit, allowing to set trial or promotional limited plans.</p>\n<p><a href="//cdn.appthemes.com/wp-content/uploads/2013/03/job_plans.png"><img src="//cdn.appthemes.com/wp-content/uploads/2013/03/job_plans-1024x454.png" alt="job_plans" width="650" height="289" class="alignleft size-large wp-image-7203" /></a></p>\n<p>The resumes subscriptions pricing structure also changed and site owners can now create subscriptions plans, just like job plans.</p>\n<p><a href="//cdn.appthemes.com/wp-content/uploads/2013/03/resumes-plans.png"><img src="//cdn.appthemes.com/wp-content/uploads/2013/03/resumes-plans-1024x366.png" alt="resumes-plans" width="650" height="233" class="alignleft size-large wp-image-7207" /></a></p>\n<p><strong>Addons</strong><br />\nAddons are part of the payments framework, and are applied to jobs and users. Addons represent a special attribute assigned to a job or a user. For example, purchasing a plan with the &#8216;Browse Resumes&#8217; and &#8216;View Resumes&#8217; addon will give the job lister access to resumes for a limited duration. Purchasing a featured addon will make the purchased job featured on listings and/or category.</p>\n<p>There are 2 job addons, and 2 user addons:</p>\n<p>Featured Addons (applied to jobs):</p>\n<ul>\n<li>Feature on Homepage and Listings</li>\n<li>Feature on Category</li>\n</ul>\n<p>Resumes Addons (applied to users):</p>\n<ul>\n<li>Browse Resumes (allows buyer to browse resumes)</li>\n<li>View Resumes (allows buyer to view resumes)</li>\n</ul>\n<p><a href="//cdn.appthemes.com/wp-content/uploads/2013/03/addons.png"><img src="//cdn.appthemes.com/wp-content/uploads/2013/03/addons.png" alt="addons" width="524" height="277" class="aligncenter size-full wp-image-7210" /></a></p>\n<p>These addons can be included directly on a job plan for free, or purchased separately. Each paid addon can have it&#8217;s own price and duration, and included addons can be set a duration or usage limit. </p>\n<p>Addons are a great addition to JobRoller, as it will allow to further monetize your site.</p>\n<p><a href="//cdn.appthemes.com/wp-content/uploads/2013/03/pack-addons.png"><img src="//cdn.appthemes.com/wp-content/uploads/2013/03/pack-addons.png" alt="pack-addons" width="550" height="291" class="aligncenter size-full wp-image-7218" /></a></p>\n<p><strong>Recruiters</strong><br />\nSite owners have certainly noticed that the Recruiters role as been available in JobRoller for a while, but could only be assigned to a user from the backend. JobRoller 1.7 changes that, and there&#8217;s now an additional &#8216;Recruiter&#8217; role available on registration. This role is optional, and site owners can easily enable/disable Recruiters registration.</p>\n<p><a href="//cdn.appthemes.com/wp-content/uploads/2013/03/roles.png"><img src="//cdn.appthemes.com/wp-content/uploads/2013/03/roles.png" alt="roles" width="319" height="109" class="aligncenter size-full wp-image-7220" /></a></p>\n<p>Job listers and Recruiters can both submit jobs, but the addition of the Recruiter, allows site owners to control each role differently. For example, Resumes access can be limited to Recruiters, Job Listers or both. </p>\n<p><strong>More reCaptcha</strong><br />\nSecurity continues to be a priority so we added additional reCaptcha options to contact forms (including resumes), and to the apply online form.</p>\n<p><a href="//cdn.appthemes.com/wp-content/uploads/2013/03/apply-recpatcha.png"><img src="//cdn.appthemes.com/wp-content/uploads/2013/03/apply-recpatcha.png" alt="apply-recpatcha" width="340" height="189" class="aligncenter size-full wp-image-7230" /></a></p>\n<p><strong>Orders Available on Users Dashboards</strong><br />\nEach user can now access their orders history straight from their dashboard and track each order status.</p>\n<p><a href="//cdn.appthemes.com/wp-content/uploads/2013/03/orders-tab.png"><img src="//cdn.appthemes.com/wp-content/uploads/2013/03/orders-tab.png" alt="orders-tab" width="550" height="392" class="aligncenter size-full wp-image-7222" /></a></p>\n<p><strong>AppThemes Coupons</strong><br />\nWith the addition of the AppThemes Payments API, JobRoller is now compatible with the <a href="http://marketplace.appthemes.com/plugins/appthemes-coupons">AppThemes Coupons plugin</a>. Offer listing discounts and promos to the customers of your site. It&#8217;s a great way to get first-time customers to make that first listing or to get long-time customers to come back for more.</p>\n<p><strong>Much More</strong><br />\nThese are the major features coming with JobRoller 1.7, but they are not all. You can read the full list on the <a href="http://docs.appthemes.com/jobroller/jobroller-version-1-7">changelog</a>.</p>\n<h3>Upgrading from previous versions</h3>\n<p>When you activate JobRoller 1.7, all your previous settings, including pricing and orders will be automatically upgraded. No additional actions are needed.</p>\n<p><strong>Important Notes for Updating to JobRoller 1.7</strong></p>\n<ul>\n<li>The LinkedIn, CareerJet, or Simply Hired publisher plugins have been updated to version 1.1. If you are using any of these plugins and updating to JobRoller 1.7, you will need to update the plugin as well.</li>\n<li>At this time, recurring payments are only available with PayPal. Additionally, you must <a href="http://docs.appthemes.com/tutorials/setting-up-paypal-ipn">enable IPN</a> to use PayPal for recurring payments. Other gateways will be updated to work with recurring payments soon.</li>\n</ul>\n<div class="feedflare">\n<a href="http://feeds.feedburner.com/~ff/appthemes?a=gjJwTE164Ik:KW6UMhM2t9E:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/appthemes?d=yIl2AUoC8zA" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=gjJwTE164Ik:KW6UMhM2t9E:D7DqB2pKExk"><img src="http://feeds.feedburner.com/~ff/appthemes?i=gjJwTE164Ik:KW6UMhM2t9E:D7DqB2pKExk" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=gjJwTE164Ik:KW6UMhM2t9E:V_sGLiPBpWU"><img src="http://feeds.feedburner.com/~ff/appthemes?i=gjJwTE164Ik:KW6UMhM2t9E:V_sGLiPBpWU" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=gjJwTE164Ik:KW6UMhM2t9E:qj6IDK7rITs"><img src="http://feeds.feedburner.com/~ff/appthemes?d=qj6IDK7rITs" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=gjJwTE164Ik:KW6UMhM2t9E:gIN9vFwOqvQ"><img src="http://feeds.feedburner.com/~ff/appthemes?i=gjJwTE164Ik:KW6UMhM2t9E:gIN9vFwOqvQ" border="0"></img></a>\n</div><img src="http://feeds.feedburner.com/~r/appthemes/~4/gjJwTE164Ik" height="1" width="1"/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:49:"http://www.appthemes.com/blog/jobroller-1-7/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"26";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:42:"http://rssnamespace.org/feedburner/ext/1.0";a:1:{s:8:"origLink";a:1:{i:0;a:5:{s:4:"data";s:44:"http://www.appthemes.com/blog/jobroller-1-7/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:42:"\n		\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:6:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:15:"ClassiPress 3.3";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"http://feedproxy.google.com/~r/appthemes/~3/vySfHF5RllI/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:55:"http://www.appthemes.com/blog/classipress-3-3/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 20 Apr 2013 02:19:59 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:4:"News";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"http://www.appthemes.com/?p=7261";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:350:"ClassiPress 3.3 is finally here and it brings several new great features. We’ve listened to your feedback and have been working hard the last few months to bring you an even more feature-rich theme. Payments Our powerful payments framework is now integrated with ClassiPress 3.3 meaning that payment gateways are not limited to PayPal and [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:7:"meloniq";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:5893:"<p>ClassiPress 3.3 is finally here and it brings several new great features. We’ve listened to your feedback and have been working hard the last few months to bring you an even more feature-rich theme.</p>\n<p><img src="http://cdn.appthemes.com/wp-content/uploads/2013/04/classipress-overview-banner.png" alt="ClassiPress 3.3 responsive design" style="margin:0 0 0 20px;border-bottom:1px solid #CCC;" /></p>\n<p><strong>Payments</strong><br />\nOur powerful payments framework is now integrated with ClassiPress 3.3 meaning that payment gateways are not limited to PayPal and Bank Transfer anymore. Many additional gateways can be purchased from our <a href="http://marketplace.appthemes.com/plugins/payment-gateways/" title="Marketplace payment gateways" target="_blank">Marketplace</a>.<br />\n<span id="more-7261"></span><br />\nThe payments framework adds it’s own menu on WP backend and allows site owners to easily manage all payment settings and orders.<br />\n<a href="//cdn.appthemes.com/wp-content/uploads/2013/04/payments-menu.png"><img src="//cdn.appthemes.com/wp-content/uploads/2013/04/payments-menu.png" alt="Payments menu" width="155" height="135" class="aligncenter size-full wp-image-7262" /></a></p>\n<p>As of the 3.3, many of the payment related settings has been moved to the Payments menu:</p>\n<ul>\n<li>price formatting and payment currency selection, previously under &#8220;ClassiPress-&gt;Pricing&#8221;</li>\n<li>gateways, previously under &#8220;ClassiPress-&gt;Gateways&#8221;</li>\n<li>orders, previously under &#8220;ClassiPress-&gt;Transactions&#8221;</li>\n<li>coupons, previously under &#8220;ClassiPress-&gt;Coupons&#8221;. <em>Note: to continue use coupons you will need to install <a href="https://marketplace.appthemes.com/plugins/appthemes-coupons/" title="AppThemes Coupons plugin" target="_blank">Coupons</a> plugin</em></li>\n</ul>\n<p><a href="//cdn.appthemes.com/wp-content/uploads/2013/04/payments-settings.png"><img src="//cdn.appthemes.com/wp-content/uploads/2013/04/payments-settings.png" alt="Payments settings" width="611" height="611" class="aligncenter size-full wp-image-7277" /></a></p>\n<p><strong>Responsiveness</strong><br />\nClassiPress is now fully responsive which means it scales perfectly on mobile devices.<br />\n<a href="//cdn.appthemes.com/wp-content/uploads/2013/04/responsive-preview.png"><img src="//cdn.appthemes.com/wp-content/uploads/2013/04/responsive-preview.png" alt="Responsive preview" width="640" height="503" class="aligncenter size-full wp-image-7266" /></a></p>\n<p><strong>Settings pages</strong><br />\nWe have implemented new settings pages to make manage settings even easier. All settings are now stored in single WP option, and the select yes/no options has been converted into checkboxes.<br />\n<a href="//cdn.appthemes.com/wp-content/uploads/2013/04/settings-page.png"><img src="//cdn.appthemes.com/wp-content/uploads/2013/04/settings-page-300x171.png" alt="Settings page" width="300" height="171" class="aligncenter size-medium wp-image-7268" /></a></p>\n<p><strong>Widgets</strong><br />\nWe have added 2 new widgets which displays &#8216;Featured&#8217; &amp; &#8216;Sold&#8217; ads, and into our other widgets has been added items number control &#8211; you can specify now how many items to display.</p>\n<p><strong>WPML</strong><br />\nClassiPress is now fully compatible with <a href="http://wpml.org" target="_blank">WPML plugin</a> &#8211; you can translate your classified ads site to many languages! To make the things happen we have released <strong>free</strong> <a href="http://docs.appthemes.com/wpml-bridge-plugin">WPML Bridge plugin</a>.</p>\n<p><strong>Pre-Made Categories Files</strong><br />\nSetting up a classified site is easy with ClassiPress and we just made it easier. We have created a <a href="http://docs.appthemes.com/premade-category-files">pre-made categories file</a> that you can use to import over 800 categories to your ClassiPress site instantly. Better yet, it&#8217;s completely free. Get yours and save some time!</p>\n<p><strong>New ClassiPress Documents Section</strong><br />\nWe reorganized the <a href="http://docs.appthemes.com/cpress">ClassiPress documents</a> to make it easier to find the info you need. When you&#8217;re there, be sure to review the <a href="http://docs.appthemes.com/classipress/setting-up-payments-in-classipress-3-3">Setting up Payments in ClassiPress 3.3</a> tutorial.</p>\n<p><strong>Much More</strong><br />\nThese are the major features coming with ClassiPress 3.3, but they are not all. You can read the full list on the changelog.</p>\n<p><strong>Upgrading from previous versions</strong><br />\nWhen you activate ClassiPress 3.3, all your previous settings, including pricing, orders and coupons will be automatically upgraded. No additional actions are needed.</p>\n<div class="feedflare">\n<a href="http://feeds.feedburner.com/~ff/appthemes?a=vySfHF5RllI:VoOmUUMUYf8:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/appthemes?d=yIl2AUoC8zA" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=vySfHF5RllI:VoOmUUMUYf8:D7DqB2pKExk"><img src="http://feeds.feedburner.com/~ff/appthemes?i=vySfHF5RllI:VoOmUUMUYf8:D7DqB2pKExk" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=vySfHF5RllI:VoOmUUMUYf8:V_sGLiPBpWU"><img src="http://feeds.feedburner.com/~ff/appthemes?i=vySfHF5RllI:VoOmUUMUYf8:V_sGLiPBpWU" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=vySfHF5RllI:VoOmUUMUYf8:qj6IDK7rITs"><img src="http://feeds.feedburner.com/~ff/appthemes?d=qj6IDK7rITs" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=vySfHF5RllI:VoOmUUMUYf8:gIN9vFwOqvQ"><img src="http://feeds.feedburner.com/~ff/appthemes?i=vySfHF5RllI:VoOmUUMUYf8:gIN9vFwOqvQ" border="0"></img></a>\n</div><img src="http://feeds.feedburner.com/~r/appthemes/~4/vySfHF5RllI" height="1" width="1"/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:51:"http://www.appthemes.com/blog/classipress-3-3/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"34";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:42:"http://rssnamespace.org/feedburner/ext/1.0";a:1:{s:8:"origLink";a:1:{i:0;a:5:{s:4:"data";s:46:"http://www.appthemes.com/blog/classipress-3-3/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:42:"\n		\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:6:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:35:"Introducing our Latest Theme, Ideas";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"http://feedproxy.google.com/~r/appthemes/~3/rDIFkJR6avI/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:74:"http://www.appthemes.com/blog/introducing-our-latest-theme-ideas/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 05 Dec 2012 23:45:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:4:"News";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"http://www.appthemes.com/?p=6807";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:342:"Build your own customer feedback site with our latest theme, Ideas. Give your customers their own space to create, discuss, and vote for ideas or suggestions and engage them on your site. Ideas is a productivity theme which allows you to listen and engage your customers. Whether it’s a Web site suggestion, a new feature request [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Bruno Carreço";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:6334:"<p><a href="http://www.appthemes.com/themes/ideas"><img class="alignnone size-full wp-image-6889" src="//cdn.appthemes.com/wp-content/uploads/2012/12/ideas-screen-composite.jpg" alt="" width="650" height="210" /></a><strong>Build your own customer feedback site with our latest theme, Ideas.</strong> Give your customers their own space to create, discuss, and vote for ideas or suggestions and engage them on your site.</p>\n<p>Ideas is a productivity theme which allows you to listen and engage your customers. Whether it’s a Web site suggestion, a new feature request for your product or a debate site — the Ideas theme will help bridge the communication gap.<span id="more-6807"></span></p>\n<p>Forums are an effective tool for discussion but not so effective if you need to monitor customers feedback. Ideas collects and prioritizes feedback from customers in a structured way. Customers post their suggestions, organized in categories, and others vote up or down. Votes are limited, which helps focus on the essential.</p>\n<p>Ideas makes use of our “app framework”, meaning it&#8217;s fast, highly flexible and extensible. It also means a simple effective admin panel to control all the theme settings. We even use <a href="http://ideas.appthemes.com/" target="_blank">our own version</a> of the Ideas theme for our own customers to provide feedback.</p>\n<h3>Learn More</h3>\n<ul>\n<li>The <a href="http://www.appthemes.com/themes/ideas">Ideas overview page</a> outlines all the features and functions, complete with screenshots</li>\n<li>Test drive the theme by visiting the live <a href="http://demos.appthemes.com/?theme=ideas">Ideas demo</a> and <a href="http://demos.appthemes.com/?theme=ideas-admin">admin demo</a></li>\n</ul>\n<div id="attachment_6850" class="wp-caption alignleft" style="width: 140px"><a href="//cdn.appthemes.com/wp-content/uploads/2012/12/ideas_site.png"><img class="wp-image-6850       " style="height: 300px" src="//cdn.appthemes.com/wp-content/uploads/2012/12/ideas_site-451x1024.png" alt="Ideas Home Page" width="130" height="200" /></a><p class="wp-caption-text">Ideas Home Page</p></div>\n<div id="attachment_6853" class="wp-caption alignleft" style="width: 140px"><a href="//cdn.appthemes.com/wp-content/uploads/2012/12/ideas_single.png"><img class="size-full  wp-image-6853    " style="height: 300px" src="//cdn.appthemes.com/wp-content/uploads/2012/12/ideas_single-441x1024.png" alt="Ideas Single Idea" width="130" height="200" /></a><p class="wp-caption-text">Ideas Single Idea</p></div>\n<div id="attachment_6855" class="wp-caption alignleft" style="width: 140px"><a href="//cdn.appthemes.com/wp-content/uploads/2012/12/ideas_submit.png"><img class="size-full wp-image-6855    " style="height: 300px" src="//cdn.appthemes.com/wp-content/uploads/2012/12/ideas_submit-598x1024.png" alt="Ideas Submit Idea" width="130" height="200" /></a><p class="wp-caption-text">Idea Submit Idea</p></div>\n<div id="attachment_6854" class="wp-caption alignleft" style="width: 140px"><a href="//cdn.appthemes.com/wp-content/uploads/2012/12/ideas_dashboard.png"><img class="size-full wp-image-6854  " style="height: 300px" src="//cdn.appthemes.com/wp-content/uploads/2012/12/ideas_dashboard-593x1024.png" alt="Ideas User Dashboard" width="130" height="200" /></a><p class="wp-caption-text">Ideas User Dashboard</p></div>\n<div class="clr"></div>\n<h2>Main Features</h2>\n<p><strong>Control Votes</strong><br />\n<strong></strong>Site owners have full control over the total available votes for each user. Votes can be automatically reset each month.</p>\n<div><strong>Moderate Ideas</strong></div>\n<p>Control new Ideas before they are published. Idea authors are instantly notified by email as soon as their ideas are approved.</p>\n<p><strong>Independent Statuses &amp; Categories</strong><br />\nIdeas categories and statuses are custom taxonomies. You can add any statuses and/or categories separately from the posts categories and statuses.</p>\n<p><strong>Address Each Submission</strong><br />\nYour response to ideas are displayed at the top of the page so your customer base knows exactly where it currently stands.</p>\n<p><strong>Integrated Discussion Settings</strong><br />\nIdeas integrates with WordPress discussion settings. Control any discussion related options like threaded comments or comments moderation, directly from WordPress discussion page.</p>\n<p><strong>Fully-Functional Backend</strong><br />\nAdmins can add, edit and moderate ideas directly from the backend and there are additional panels that help communicate each idea’s status, publicly or internally. You can also view the total votes for the idea being edited and instantly reset it.</p>\n<p><strong>Widgets, Widgets and Widgets!</strong><br />\nIdeas works with all the native WordPress widgets plus custom widgets including: popular ideas, recent ideas, recent comments, quick info, idea voters and stats, for different locations in the theme.</p>\n<p>There&#8217;s plenty more features but we&#8217;re gonna stop here. Visit the <a href="/themes/ideas/">Ideas product page</a> for more details and screenshots.</p>\n<p>Already an AppThemes Club customer? Head on over to <a href="/cp/member.php">your dashboard</a> and download it now!</p>\n<div class="feedflare">\n<a href="http://feeds.feedburner.com/~ff/appthemes?a=rDIFkJR6avI:4yO9pko2a3U:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/appthemes?d=yIl2AUoC8zA" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=rDIFkJR6avI:4yO9pko2a3U:D7DqB2pKExk"><img src="http://feeds.feedburner.com/~ff/appthemes?i=rDIFkJR6avI:4yO9pko2a3U:D7DqB2pKExk" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=rDIFkJR6avI:4yO9pko2a3U:V_sGLiPBpWU"><img src="http://feeds.feedburner.com/~ff/appthemes?i=rDIFkJR6avI:4yO9pko2a3U:V_sGLiPBpWU" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=rDIFkJR6avI:4yO9pko2a3U:qj6IDK7rITs"><img src="http://feeds.feedburner.com/~ff/appthemes?d=qj6IDK7rITs" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=rDIFkJR6avI:4yO9pko2a3U:gIN9vFwOqvQ"><img src="http://feeds.feedburner.com/~ff/appthemes?i=rDIFkJR6avI:4yO9pko2a3U:gIN9vFwOqvQ" border="0"></img></a>\n</div><img src="http://feeds.feedburner.com/~r/appthemes/~4/rDIFkJR6avI" height="1" width="1"/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:70:"http://www.appthemes.com/blog/introducing-our-latest-theme-ideas/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"18";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:42:"http://rssnamespace.org/feedburner/ext/1.0";a:1:{s:8:"origLink";a:1:{i:0;a:5:{s:4:"data";s:65:"http://www.appthemes.com/blog/introducing-our-latest-theme-ideas/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:57:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:6:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:38:"Google Driving Directions for Vantage!";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"http://feedproxy.google.com/~r/appthemes/~3/iTXzEjRKg_Q/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:65:"http://www.appthemes.com/blog/google-directions-vantage/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 13 Nov 2012 21:51:50 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:6:{i:0;a:5:{s:4:"data";s:9:"Tutorials";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:3:"css";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:11:"Google Maps";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:15:"quality control";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:4;a:5:{s:4:"data";s:10:"taxonomies";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:5;a:5:{s:4:"data";s:7:"vantage";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"http://www.appthemes.com/?p=6565";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:352:"Wow! Josh Ronk, our Vantage developer surprised me with his tutorial today. It&#8217;s a really good one and I think you&#8217;re going to like it. How to Get There &#8211; Driving Directions Google Driving DirectionsI don&#8217;t think I need to explain the benefits of this one. If you have a geographically focused business directory, your [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Shannon Dunn";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:4243:"<p><img class="alignnone size-full wp-image-5398" title="tutorial-tuesdays" src="http://www.appthemes.com/wp-content/uploads/2012/07/tutorial-tuesdays.jpg" alt="Tutorial Tuesdays" width="650" height="210" /><br />\nWow! Josh Ronk, our Vantage developer surprised me with his tutorial today. It&#8217;s a really good one and I think you&#8217;re going to like it.</p>\n<h3><a href="http://docs.appthemes.com/tutorials/adding-google-driving-directions-service-to-google-maps" style="color:#666;text-decoration:none;">How to Get There &#8211; Driving Directions</a></h3>\n<p><a style="width: 100px; margin: -5px 0 15px 15px; display: block; float: right; font-size: 11px; text-align: center; line-height: normal;" href="http://docs.appthemes.com/tutorials/adding-google-driving-directions-service-to-google-maps"><img style="margin-bottom: -10px;" title="Google Driving Directions" src="http://www.appthemes.com/wp-content/uploads/2012/11/tutorial-google-directions.png" alt="Google Driving Directions" />Google Driving Directions</a>I don&#8217;t think I need to explain the benefits of this one. If you have a geographically focused business directory, your customers and end-users are going to love this. Josh shows you how to get it all set up &#8211; from HTML to Javascript to CSS. It&#8217;s the complete package. In the end, each business listing will have a simple &#8220;Get Directions&#8221; feature. Users enter their address in a field and directions show up under the Google map.<span id="more-6565"></span></p>\n<p>You&#8217;re going to want to try this one out. But remember, always create a <a href="https://docs.appthemes.com/tutorials/child-themes-vantage-getting-started-styling">child theme</a> first. When you&#8217;re ready to go, hop over and read Josh&#8217;s Adding <a href="http://docs.appthemes.com/tutorials/adding-google-driving-directions-service-to-google-maps">Google Driving Directions Service to Google Maps</a> tutorial.</p>\n<h3><a href="http://docs.appthemes.com/quality-control/adding-and-removing-taxonomies" style="color:#666;text-decoration:none;">Do the Taxonomy Dance</a></h3>\n<p><a style="width: 100px; margin: -5px 0 15px 15px; display: block; float: right; font-size: 11px; text-align: center; line-height: normal;" href="http://docs.appthemes.com/quality-control/adding-and-removing-taxonomies"><img style="margin-bottom: -10px;" title="Adding &amp; removing taxonomies" src="http://www.appthemes.com/wp-content/uploads/2012/11/tutorial-qc-taxonomies.png" alt="Adding &amp; removing taxonomies" />Adding &amp; removing taxonomies</a>Want to take more control of Quality Control? You can by removing and adding taxonomies to suit your needs. Quality Control has a few taxonomies to help you organize your tickets: Status, Priority, Milestone and of course Category and Tag. Maybe these are not enough for you? Add more. Perhaps you&#8217;re not interested in ticket status. Go ahead and remove it.</p>\n<p>Cristi Bruca shows how to do all this in his <a href="http://docs.appthemes.com/quality-control/adding-and-removing-taxonomies">Adding And Removing Taxonomies</a> tutorial. Read it and be a taxonomies master!</p>\n<div class="feedflare">\n<a href="http://feeds.feedburner.com/~ff/appthemes?a=iTXzEjRKg_Q:4ZnoOX9-Rp4:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/appthemes?d=yIl2AUoC8zA" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=iTXzEjRKg_Q:4ZnoOX9-Rp4:D7DqB2pKExk"><img src="http://feeds.feedburner.com/~ff/appthemes?i=iTXzEjRKg_Q:4ZnoOX9-Rp4:D7DqB2pKExk" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=iTXzEjRKg_Q:4ZnoOX9-Rp4:V_sGLiPBpWU"><img src="http://feeds.feedburner.com/~ff/appthemes?i=iTXzEjRKg_Q:4ZnoOX9-Rp4:V_sGLiPBpWU" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=iTXzEjRKg_Q:4ZnoOX9-Rp4:qj6IDK7rITs"><img src="http://feeds.feedburner.com/~ff/appthemes?d=qj6IDK7rITs" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=iTXzEjRKg_Q:4ZnoOX9-Rp4:gIN9vFwOqvQ"><img src="http://feeds.feedburner.com/~ff/appthemes?i=iTXzEjRKg_Q:4ZnoOX9-Rp4:gIN9vFwOqvQ" border="0"></img></a>\n</div><img src="http://feeds.feedburner.com/~r/appthemes/~4/iTXzEjRKg_Q" height="1" width="1"/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:61:"http://www.appthemes.com/blog/google-directions-vantage/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"19";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:42:"http://rssnamespace.org/feedburner/ext/1.0";a:1:{s:8:"origLink";a:1:{i:0;a:5:{s:4:"data";s:56:"http://www.appthemes.com/blog/google-directions-vantage/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:54:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:6:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:52:"ClassiPress Child Themes Tutorial Updated for CP 3.2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"http://feedproxy.google.com/~r/appthemes/~3/ORW5xp3bHUs/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:80:"http://www.appthemes.com/blog/classipress-child-theme-tutorial-updated/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 07 Nov 2012 01:59:01 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:5:{i:0;a:5:{s:4:"data";s:9:"Tutorials";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:12:"child themes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:11:"classipress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:3:"css";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:4;a:5:{s:4:"data";s:19:"WordPress functions";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"http://www.appthemes.com/?p=6531";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:406:"ClassiPress 3.2 is here! It&#8217;s time to update our ClassiPress child theme tutorials. This week, we&#8217;ll begin with the basics. We&#8217;ll continue to create more tutorials so you have all the instructions needed to create your own spectacular child theme for ClassiPress. ClassiPress Child Themes: Getting Started ClassiPress Child ThemesOur ClassiPress developer, Andrjez, kicks things [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Shannon Dunn";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:4523:"<p><img class="alignnone size-full wp-image-5398" title="tutorial-tuesdays" src="http://www.appthemes.com/wp-content/uploads/2012/07/tutorial-tuesdays.jpg" alt="Tutorial Tuesdays" width="650" height="210" /><br />\nClassiPress 3.2 is here! It&#8217;s time to update our ClassiPress child theme tutorials. This week, we&#8217;ll begin with the basics. We&#8217;ll continue to create more tutorials so you have all the instructions needed to create your own spectacular child theme for ClassiPress.</p>\n<h3><a href="http://docs.appthemes.com/classipress/creating-child-themes-for-classipress" style="color:#666;text-decoration:none;">ClassiPress Child Themes: Getting Started</a></h3>\n<p><a style="width: 100px; margin: -5px 0 15px 15px; display: block; float: right; font-size: 11px; text-align: center; line-height: normal;" href="http://docs.appthemes.com/classipress/creating-child-themes-for-classipress"><img style="margin-bottom: -10px;" title="ClassiPress Child Themes" src="http://www.appthemes.com/wp-content/uploads/2012/11/cp-child-themes-tutorial.png" alt="ClassiPress Child Themes" />ClassiPress Child Themes</a>Our ClassiPress developer, Andrjez, kicks things off with the basics. His ClassiPress child themes tutorial shows you the fundamentals of folder structure, styling and functionality. With this tutorial, you should be able to create a basic child theme for ClassiPress. If you&#8217;re a whiz with CSS and WordPress functions, you&#8217;ll be able to do even more. He also provides some clear examples of how changes can affect the layout and functionality of the parent theme.<span id="more-6531"></span></p>\n<p>Read his <a href="http://docs.appthemes.com/classipress/creating-child-themes-for-classipress">ClassiPress child theme tutorial</a> and start making your own child theme today.</p>\n<p>You might also want to check out another important ClassiPress tutorial from Andrjez. In it, Andrzej presents a check list of things that should be completed to <a href="http://docs.appthemes.com/classipress/classipress-3-2-child-themes-checklist">update child themes for ClassiPress 3.2</a>. This is a must read if you have an existing ClassiPress child theme and plan to upgrade to CP 3.2.</p>\n<h3>And Now, a Couple of Handy Tuts from Our Founder&#8230;</h3>\n<p>AppThemes founder, Dave Cowgill, never passes up an opportunity to learn how to do something new with WordPress. Each time he does, he writes a tutorial to share with the world. Sometimes these improvements seem to be small but they frequently have a big impact.</p>\n<p>This week, he has two new tuts that will help improve your WordPress posting productivity. His first lesson shows you how to <a href="http://docs.appthemes.com/tutorials/add-custom-buttons-wordpress-editor">add custom buttons to the WordPress editor</a>. These custom buttons give single-click capability to add tags to your post. Dave&#8217;s other tutorial shows you how to <a href="http://docs.appthemes.com/tutorials/post-via-email-using-wordpress-multisite">make posts via email using WordPress multisite</a>. This is going to be super useful if you&#8217;re always on the go. Now you can just make a post via email from your phone or other device.</p>\n<h3>Suggest a Tutorial</h3>\n<p><img src="http://www.appthemes.com/wp-content/uploads/2012/11/new-tuts.png" alt="Suggest new tutorials" title="new-tuts" width="648" height="380" class="alignnone size-full wp-image-6535" /></p>\n<div class="feedflare">\n<a href="http://feeds.feedburner.com/~ff/appthemes?a=ORW5xp3bHUs:gSlrscD64gk:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/appthemes?d=yIl2AUoC8zA" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=ORW5xp3bHUs:gSlrscD64gk:D7DqB2pKExk"><img src="http://feeds.feedburner.com/~ff/appthemes?i=ORW5xp3bHUs:gSlrscD64gk:D7DqB2pKExk" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=ORW5xp3bHUs:gSlrscD64gk:V_sGLiPBpWU"><img src="http://feeds.feedburner.com/~ff/appthemes?i=ORW5xp3bHUs:gSlrscD64gk:V_sGLiPBpWU" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=ORW5xp3bHUs:gSlrscD64gk:qj6IDK7rITs"><img src="http://feeds.feedburner.com/~ff/appthemes?d=qj6IDK7rITs" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=ORW5xp3bHUs:gSlrscD64gk:gIN9vFwOqvQ"><img src="http://feeds.feedburner.com/~ff/appthemes?i=ORW5xp3bHUs:gSlrscD64gk:gIN9vFwOqvQ" border="0"></img></a>\n</div><img src="http://feeds.feedburner.com/~r/appthemes/~4/ORW5xp3bHUs" height="1" width="1"/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:76:"http://www.appthemes.com/blog/classipress-child-theme-tutorial-updated/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"4";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:42:"http://rssnamespace.org/feedburner/ext/1.0";a:1:{s:8:"origLink";a:1:{i:0;a:5:{s:4:"data";s:71:"http://www.appthemes.com/blog/classipress-child-theme-tutorial-updated/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:54:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:6:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:55:"How to Create Job Listings and Add Resumes to JobRoller";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"http://feedproxy.google.com/~r/appthemes/~3/aNkUMWcOrUo/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:81:"http://www.appthemes.com/blog/jobroller-create-job-listings-and-resumes/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 24 Oct 2012 03:02:10 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:5:{i:0;a:5:{s:4:"data";s:9:"Tutorials";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:12:"job listings";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:9:"jobroller";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:7:"resumes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:4;a:5:{s:4:"data";s:5:"video";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"http://www.appthemes.com/?p=6439";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:354:"Today we have a couple of video tutorials that were requested by longtime customer, tbase. These tutorials cover two of the most basic but powerful and useful features in JobRoller: job listings and resumes. Job Listings, the Bread and Butter of JobRoller Create a Job ListingThis is what it&#8217;s all about, right? Allowing your site&#8217;s [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Shannon Dunn";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:4258:"<p><img class="alignnone size-full wp-image-5398" title="tutorial-tuesdays" src="http://www.appthemes.com/wp-content/uploads/2012/07/tutorial-tuesdays.jpg" alt="Tutorial Tuesdays" width="650" height="210" /><br />\nToday we have a couple of video tutorials that were requested by longtime customer, tbase. These tutorials cover two of the most basic but powerful and useful features in JobRoller: job listings and resumes.</p>\n<h3><a href="http://docs.appthemes.com/jobroller/create-a-job-listing-in-jobroller" style="color:#666;text-decoration:none;">Job Listings, the Bread and Butter of JobRoller</a></h3>\n<p><a style="width: 120px; margin: -5px 0 15px 15px; display: block; float: right; font-size: 11px; text-align: center;line-height:normal;" href="http://docs.appthemes.com/jobroller/create-a-job-listing-in-jobroller"><img title="Create a Job Listing" src="http://www.appthemes.com/wp-content/uploads/2012/10/video-thumb-submit-job.png" alt="Create a Job Listing" />Create a Job Listing</a>This is what it&#8217;s all about, right? Allowing your site&#8217;s users the opportunity to post jobs to your website is the engine that generates content, traffic and more. And with the ability to charge for listings, it makes JobRoller a potential income producing tool for your website.<span id="more-6439"></span></p>\n<p>JobRoller makes listing job opportunities a snap. Users can create and edit listings with ease. With the addition of TinyMCE text editor, users can format there job listings to fit their needs. To see how easy it is, check out our video tutorial on <a href="http://docs.appthemes.com/jobroller/create-a-job-listing-in-jobroller">creating job listings in JobRoller</a>.</p>\n<h3><a href="http://docs.appthemes.com/jobroller/adding-a-resume-to-jobroller" style="color:#666;text-decoration:none;">Resumes, the Frosting on the Cake</a></h3>\n<p><a style="width: 120px; margin: -5px 0 15px 15px; display: block; float: right; font-size: 11px; text-align: center;line-height:normal;" href="http://docs.appthemes.com/jobroller/adding-a-resume-to-jobroller"><img title="Add a resume" src="http://www.appthemes.com/wp-content/uploads/2012/10/video-thumb-add-resume.png" alt="Add a resume" />Add a resume</a>Job listings give companies and organizations the power to post job opportunities to your job board. But there are two sides to the job coin. Available candidates want an opportunity to market themselves to companies looking for qualified personnel. That&#8217;s were resumes come in.</p>\n<p>Each &#8216;job seeker&#8217; get&#8217;s their own dashboard where they can add one, two or more resumes that catalog the list of their unique qualifications. Just like job listings, JobRoller gives you the opportunity to monetize resumes by charging for job listings. It&#8217;s simple for a job seeker to post their resume. Our video tutorial about <a href="http://docs.appthemes.com/jobroller/adding-a-resume-to-jobroller">adding resumes to JobRoller</a>, shows you how.</p>\n<h3>Suggest a Tutorial</h3>\n<p>Thanks to tbase for suggesting these video tutorials. If you ave a tutorial that you want to see, let us know by leaving a comment below. Cheers!</p>\n<div class="feedflare">\n<a href="http://feeds.feedburner.com/~ff/appthemes?a=aNkUMWcOrUo:lvav_nr_3Xc:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/appthemes?d=yIl2AUoC8zA" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=aNkUMWcOrUo:lvav_nr_3Xc:D7DqB2pKExk"><img src="http://feeds.feedburner.com/~ff/appthemes?i=aNkUMWcOrUo:lvav_nr_3Xc:D7DqB2pKExk" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=aNkUMWcOrUo:lvav_nr_3Xc:V_sGLiPBpWU"><img src="http://feeds.feedburner.com/~ff/appthemes?i=aNkUMWcOrUo:lvav_nr_3Xc:V_sGLiPBpWU" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=aNkUMWcOrUo:lvav_nr_3Xc:qj6IDK7rITs"><img src="http://feeds.feedburner.com/~ff/appthemes?d=qj6IDK7rITs" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=aNkUMWcOrUo:lvav_nr_3Xc:gIN9vFwOqvQ"><img src="http://feeds.feedburner.com/~ff/appthemes?i=aNkUMWcOrUo:lvav_nr_3Xc:gIN9vFwOqvQ" border="0"></img></a>\n</div><img src="http://feeds.feedburner.com/~r/appthemes/~4/aNkUMWcOrUo" height="1" width="1"/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:77:"http://www.appthemes.com/blog/jobroller-create-job-listings-and-resumes/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"7";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:42:"http://rssnamespace.org/feedburner/ext/1.0";a:1:{s:8:"origLink";a:1:{i:0;a:5:{s:4:"data";s:72:"http://www.appthemes.com/blog/jobroller-create-job-listings-and-resumes/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:63:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n		\n		\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:6:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:37:"Introducing the AppThemes Marketplace";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"http://feedproxy.google.com/~r/appthemes/~3/7N3-hCKz8Go/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:77:"http://www.appthemes.com/blog/introducing-the-appthemes-marketplace/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 11 Oct 2012 13:31:42 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:8:{i:0;a:5:{s:4:"data";s:4:"News";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:12:"child themes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:11:"classipress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:7:"clipper";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:4;a:5:{s:4:"data";s:9:"jobroller";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:5;a:5:{s:4:"data";s:11:"marketplace";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:6;a:5:{s:4:"data";s:7:"plugins";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:7;a:5:{s:4:"data";s:7:"vantage";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"http://www.appthemes.com/?p=6347";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:339:"Wow! Today is a very exciting day! The brand new AppThemes Marketplace is officially open and ready for business. This online outlet of child themes and plugins is full of products meant to tap into the full potential of our already powerful application themes. Now&#8217;s your chance to blow away the barriers holding back your [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Shannon Dunn";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:8594:"<p><img src="http://www.appthemes.com/wp-content/uploads/2012/10/marketplace-intro1.jpg" alt="" title="marketplace-intro" width="650" height="210" class="alignnone size-full wp-image-6377" />Wow! Today is a very exciting day! The brand new <a href="http://marketplace.appthemes.com/" target="_blank">AppThemes Marketplace</a> is officially open and ready for business. This online outlet of child themes and plugins is full of products meant to tap into the full potential of our already powerful application themes. Now&#8217;s your chance to blow away the barriers holding back your internet business. Get bigger features. Choose more designs. Make your site everything you always wanted it to be.</p>\n<h3>Dazzling Child Themes</h3>\n<p>Our application themes are made to look great and the default designs deliver attractive layouts. The only problem is that hundreds of other sites have exactly the same look. You want something unique but hiring a designer can be costly and beyond budget constraints. Well forget all that because the AppThemes Marketplace is chock full of child themes that will bring your site to life. Colorful and attractive, the latest designs and the hippest graphics are available to you. You’re site is going to look fantastic and stand out above the rest.<span id="more-6347"></span></p>\n<p>Of course, for some child themes, it’s not just about looks but functions and features, too. It can be as simple as adding sliders and galleries to revamping the whole theme to fit a niche industry. Or how about responsive child themes that can be viewed on all devices? Now that’s something almost everyone would love.</p>\n<div id="attachment_4572" class="wp-caption alignleft" style="width: 140px"><a href="http://marketplace.appthemes.com/child-themes/jobroller/prima"><img class="size-full wp-image-4572" title="Prima Child Theme" src="http://www.appthemes.com/wp-content/uploads/2012/10/child-prima.png" alt="Prima Child Theme" width="130" height="200" /></a><p class="wp-caption-text">Prima Child Theme</p></div>\n<div id="attachment_4572" class="wp-caption alignleft" style="width: 140px"><a href="https://marketplace.appthemes.com/child-themes/classipress/phoenix"><img class="size-full wp-image-4572" title="Phoenix Child Theme" src="http://www.appthemes.com/wp-content/uploads/2012/10/child-phoenix.png" alt="Phoenix Child Theme" width="130" height="200" /></a><p class="wp-caption-text">Phoenix Child Theme</p></div>\n<div id="attachment_4572" class="wp-caption alignleft" style="width: 140px"><a href="https://marketplace.appthemes.com/child-themes/vantage/zpgids"><img class="size-full wp-image-4572" title="zpGids Child Theme" src="http://www.appthemes.com/wp-content/uploads/2012/10/child-zpgids.png" alt="zpGids Child Theme" width="130" height="200" /></a><p class="wp-caption-text">zpGids Child Theme</p></div>\n<div id="attachment_4572" class="wp-caption alignleft" style="width: 140px"><a href="https://marketplace.appthemes.com/child-themes/classipress/classiclean"><img class="size-full wp-image-4572" title="ClassiClean Child Theme" src="http://www.appthemes.com/wp-content/uploads/2012/10/child-classiclean.png" alt="ClassiClean Child Theme" width="130" height="200" /></a><p class="wp-caption-text">ClassiClean Child Theme</p></div>\n<p>These child themes not only look and work great but they’re priced right, too. A custom redesign would cost hundreds of dollars, but you’re going to find a brand new look for far less. Priced from $29 to $59, these child themes give you a lot of bang for the buck!</p>\n<p>Make your site stand out, check out <a href="http://marketplace.appthemes.com/child-themes">child themes in the AppThemes Marketplace</a>.</p>\n<h3>Productive Plugins</h3>\n<p>We can’t build themes that include every feature under the sun. The result would be utterly unusable. Instead, we focus on building lean, robust and very usable application themes with an essential set of core features. Building this way, you get better themes and fewer problems.<br />\n<a href="https://marketplace.appthemes.com/plugins/sidebar-search"><img src="http://marketplace.appthemes.com/files/2012/09/Sidebar-Search-Featured-Iimage.jpg" alt="Sidebar Search plugin" title="Sidebar Search plugin" style="margin:25px 8px;padding:3px;border:1px solid #CCC;float:left;" /></a><a href="https://marketplace.appthemes.com/plugins/fxtender-pro"><img src="http://marketplace.appthemes.com/files/2012/07/FXtender-thumbnail.png" alt="FXtender plugin" title="FXtender plugin" style="margin:25px 8px;padding:3px;border:1px solid #CCC;float:left;" /></a><a href="https://marketplace.appthemes.com/plugins/daddy-like"><img src="http://marketplace.appthemes.com/files/2012/09/daddy-likes-190x130.png" alt="Daddy Like plugin" title="Daddy Like plugin" style="margin:25px 8px;padding:3px;border:1px solid #CCC;float:left;" /></a><br />\nSo we give you a great theme to start with and now we’re giving you the ability to add functions and features that make your site perform at peak levels. Your online business is unique and Marketplace plugins allow you to pick and choose the advanced features you want. Each plugin provides a targeted feature with specific value to site-owners. Mix and match to make the site you always wanted. With developers creating new plugins all the time, there will be no shortage of options to choose from. </p>\n<p>Add high-performance features to your site, view <a href="http://marketplace.appthemes.com/plugins">plugins in the AppThemes Marketplace</a>.</p>\n<h3>Community Created, AppThemes Tested</h3>\n<p>The AppThemes community has thrived and it’s attracted a fair amount of talented developers and designers. We invited the best from the community to create products for our marketplace launch. These people know our themes as well as anyone. They are rock solid developers and designers that know how to create great products. You can be sure that their child themes and plugins live up to our rigorous standards. But just to be sure, we test every item sold in the Marketplace. Each one has our seal of approval.<br />\n<img src="http://www.appthemes.com/wp-content/uploads/2012/10/MP-devs.png" title="AppThemes Marketplace developers" alt="AppThemes Marketplace developers" width="650" height="77" class="alignnone size-full wp-image-6356" /><br />\nSo we have some top-notch code wranglers and pixel pushers, but what about support? Each Marketplace developer is committed to supporting their product to the fullest. AppThemes customers will be able to get personalized support direct from the developer in our forums. And we’re keeping Marketplace developers in the loop when it comes to theme updates and changes. We’ll make sure they have ample time to update plugins and child themes. The goal is to create an interruption-free experience for you.</p>\n<h3>This is Going to Grow and Grow and Grow</h3>\n<p>This is just the start. AppThemes has created many items for the Marketplace and will continue to add more. We’re sure that our community developers will continue to create many more items, too. In fact, maybe you have a plugin or child theme you would like to offer to AppThemes customers. If so, check out our guide to selling in the AppThemes Marketplace.</p>\n<p>We’re excited to see how the Marketplace grows and we’re excited to see how your site will benefit from new designs and added features. Check out the <a href="http://marketplace.appthemes.com">AppThemes Marketplace</a> and let us know what you think!</p>\n<div class="feedflare">\n<a href="http://feeds.feedburner.com/~ff/appthemes?a=7N3-hCKz8Go:I1fW7tF59BE:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/appthemes?d=yIl2AUoC8zA" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=7N3-hCKz8Go:I1fW7tF59BE:D7DqB2pKExk"><img src="http://feeds.feedburner.com/~ff/appthemes?i=7N3-hCKz8Go:I1fW7tF59BE:D7DqB2pKExk" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=7N3-hCKz8Go:I1fW7tF59BE:V_sGLiPBpWU"><img src="http://feeds.feedburner.com/~ff/appthemes?i=7N3-hCKz8Go:I1fW7tF59BE:V_sGLiPBpWU" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=7N3-hCKz8Go:I1fW7tF59BE:qj6IDK7rITs"><img src="http://feeds.feedburner.com/~ff/appthemes?d=qj6IDK7rITs" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=7N3-hCKz8Go:I1fW7tF59BE:gIN9vFwOqvQ"><img src="http://feeds.feedburner.com/~ff/appthemes?i=7N3-hCKz8Go:I1fW7tF59BE:gIN9vFwOqvQ" border="0"></img></a>\n</div><img src="http://feeds.feedburner.com/~r/appthemes/~4/7N3-hCKz8Go" height="1" width="1"/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:73:"http://www.appthemes.com/blog/introducing-the-appthemes-marketplace/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"8";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:42:"http://rssnamespace.org/feedburner/ext/1.0";a:1:{s:8:"origLink";a:1:{i:0;a:5:{s:4:"data";s:68:"http://www.appthemes.com/blog/introducing-the-appthemes-marketplace/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:66:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n		\n		\n		\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:6:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:59:"How to Prepare Your Site or Child Theme for ClassiPress 3.2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"http://feedproxy.google.com/~r/appthemes/~3/xMJtDBs40Hw/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:89:"http://www.appthemes.com/blog/prepare-your-site-child-theme-for-classipress-3-2/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 09 Oct 2012 22:18:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:9:{i:0;a:5:{s:4:"data";s:9:"Tutorials";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:9:"analytics";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:3:"css";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:9:"marketing";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:4;a:5:{s:4:"data";s:4:"poll";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:5;a:5:{s:4:"data";s:3:"rss";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:6;a:5:{s:4:"data";s:6:"survey";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:7;a:5:{s:4:"data";s:9:"wordpress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:8;a:5:{s:4:"data";s:16:"wordpress editor";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:32:"http://www.appthemes.com/?p=6336";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:334:"Attention: anyone using a child theme with ClassiPress or developers that have created a child theme for ClassiPress should absolutely read this post! ClassiPress 3.2 Child Theme ChecklistAs you know, the creation of Vantage brings a lot of changes to our other themes. The goal is to make all our themes a little more alike [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Shannon Dunn";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:4514:"<p><img class="alignnone size-full wp-image-5398" title="tutorial-tuesdays" src="http://www.appthemes.com/wp-content/uploads/2012/07/tutorial-tuesdays.jpg" alt="Tutorial Tuesdays" width="650" height="210" /><br />\n<strong>Attention: anyone using a child theme with ClassiPress or developers that have created a child theme for ClassiPress should absolutely read this post!</strong></p>\n<p><a style="width: 100px; margin: -5px 0 15px 15px; display: block; float: right; font-size: 11px; text-align: center;line-height:normal;" href="http://docs.appthemes.com/classipress/classipress-3-2-child-themes-checklist"><img style="margin-bottom: -10px;" title="ClassiPress 3.2 Child Theme Checklist" src="http://www.appthemes.com/wp-content/uploads/2012/10/tutorial-cp-wrappers.png" alt="ClassiPress 3.2 Child Theme Checklist" />ClassiPress 3.2 Child Theme Checklist</a>As you know, the creation of Vantage brings a lot of changes to our other themes. The goal is to make all our themes a little more alike and a little less different. Common functions should use standardized code. Common features should be similar from theme to theme to theme. The benefits are great. Themes are easier to maintain, they&#8217;re easier to build and much, much more.</p>\n<p>While we strive to implement these changes with minimal impact, there are some changes that are going to require a little extra work on your part when you update to newer versions. With ClassiPress 3.2 on the way, we want to give everyone ample opportunity to prepare for changes that might have an impact on your site.<span id="more-6336"></span></p>\n<p>Our ClassiPress developer, Andrzej Piotrowski has created a <a href="http://docs.appthemes.com/classipress/classipress-3-2-child-themes-checklist">checklist of debugging tasks</a> for anyone that uses or has developed child themes for ClassiPress. The list is pretty short and should not take too long to complete. Once you complete the tasks, you should be in pretty good shape for the official release of ClassiPress 3.2.</p>\n<h3>How Do I Know if I Need to Make Changes?</h3>\n<p>If you&#8217;re not a developer, you might be thinking, &#8220;oh my gosh, I have no idea what I&#8217;m supposed to do!&#8221; Worry not, this tutorial is mostly for advanced users and developers. Just to be sure, here are some simple guidelines to determine if the changes mentioned above will affect you:</p>\n<ul>\n<li>If you&#8217;re a novice user &#8211; you&#8217;re not a developer &#8211; and you bought and simply installed ClassiPress on your site, you probably do not need to do anything.</li>\n<li>If you bought and installed a child theme, you will want to contact the developer of your child theme and ask them what their plans are for updating.</li>\n<li>If you hired a developer to modify your theme in any way, you will want to contact that developer and direct them to the <a href="http://docs.appthemes.com/classipress/classipress-3-2-child-themes-checklist">checklist</a>.</li>\n<li>If you have created a child theme or modified the theme code in any way (not recommended), then you really should read the <a href="http://docs.appthemes.com/classipress/classipress-3-2-child-themes-checklist">checklist</a>.</li>\n</ul>\n<h3>Suggest a Tutorial</h3>\n<p>Child themes and custom things. Action hooks and custom looks. Plugins, filters, PHP. We provide these tuts to you for free! Tell us in the comments what you want to see.</p>\n<div class="feedflare">\n<a href="http://feeds.feedburner.com/~ff/appthemes?a=xMJtDBs40Hw:fP4MfBHteyo:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/appthemes?d=yIl2AUoC8zA" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=xMJtDBs40Hw:fP4MfBHteyo:D7DqB2pKExk"><img src="http://feeds.feedburner.com/~ff/appthemes?i=xMJtDBs40Hw:fP4MfBHteyo:D7DqB2pKExk" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=xMJtDBs40Hw:fP4MfBHteyo:V_sGLiPBpWU"><img src="http://feeds.feedburner.com/~ff/appthemes?i=xMJtDBs40Hw:fP4MfBHteyo:V_sGLiPBpWU" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=xMJtDBs40Hw:fP4MfBHteyo:qj6IDK7rITs"><img src="http://feeds.feedburner.com/~ff/appthemes?d=qj6IDK7rITs" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/appthemes?a=xMJtDBs40Hw:fP4MfBHteyo:gIN9vFwOqvQ"><img src="http://feeds.feedburner.com/~ff/appthemes?i=xMJtDBs40Hw:fP4MfBHteyo:gIN9vFwOqvQ" border="0"></img></a>\n</div><img src="http://feeds.feedburner.com/~r/appthemes/~4/xMJtDBs40Hw" height="1" width="1"/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:85:"http://www.appthemes.com/blog/prepare-your-site-child-theme-for-classipress-3-2/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:2:"11";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:42:"http://rssnamespace.org/feedburner/ext/1.0";a:1:{s:8:"origLink";a:1:{i:0;a:5:{s:4:"data";s:80:"http://www.appthemes.com/blog/prepare-your-site-child-theme-for-classipress-3-2/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:44:"http://purl.org/rss/1.0/modules/syndication/";a:2:{s:12:"updatePeriod";a:1:{i:0;a:5:{s:4:"data";s:6:"hourly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:15:"updateFrequency";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:2:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";s:4:"href";s:37:"http://feeds.feedburner.com/appthemes";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:2:{s:3:"rel";s:3:"hub";s:4:"href";s:32:"http://pubsubhubbub.appspot.com/";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:42:"http://rssnamespace.org/feedburner/ext/1.0";a:3:{s:4:"info";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:1:{s:3:"uri";s:9:"appthemes";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:14:"emailServiceId";a:1:{i:0;a:5:{s:4:"data";s:9:"appthemes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:18:"feedburnerHostname";a:1:{i:0;a:5:{s:4:"data";s:28:"http://feedburner.google.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://www.w3.org/2003/01/geo/wgs84_pos#";a:2:{s:3:"lat";a:1:{i:0;a:5:{s:4:"data";s:9:"37.789228";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"long";a:1:{i:0;a:5:{s:4:"data";s:11:"-122.395701";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:14:{s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:16:"content-encoding";s:4:"gzip";s:10:"connection";s:5:"close";s:18:"alternate-protocol";s:7:"80:quic";s:13:"cache-control";s:18:"private, max-age=0";s:4:"date";s:29:"Tue, 17 Sep 2013 03:44:38 GMT";s:4:"etag";s:27:"qFsfaKUHwsQqMDDDdh83f2UvPjk";s:7:"expires";s:29:"Tue, 17 Sep 2013 03:44:38 GMT";s:13:"last-modified";s:29:"Tue, 17 Sep 2013 01:53:46 GMT";s:6:"server";s:3:"GSE";s:7:"warning";s:41:"214 cbtmip3xmp08 "Transformation applied"";s:19:"x-cflo-cache-result";s:11:"TCP_NC_MISS";s:22:"x-content-type-options";s:7:"nosniff";s:16:"x-xss-protection";s:13:"1; mode=block";}s:5:"build";s:14:"20130708171016";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(292, '_transient_timeout_feed_mod_9d90be8b7cfb7ce27f0c719900f3f657', '1379432682', 'no'),
(293, '_transient_feed_mod_9d90be8b7cfb7ce27f0c719900f3f657', '1379389482', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(12, 9, '_wp_page_template', 'tpl-login.php'),
(13, 10, '_wp_page_template', 'tpl-registration.php'),
(14, 11, '_wp_page_template', 'tpl-password-recovery.php'),
(15, 12, '_wp_page_template', 'tpl-password-reset.php'),
(16, 13, '_wp_page_template', 'tpl-jobs-by-date.php'),
(17, 14, '_wp_page_template', 'tpl-blog.php'),
(18, 15, '_wp_page_template', 'tpl-profile.php'),
(19, 16, '_wp_page_template', 'tpl-edit-resume.php'),
(20, 17, '_wp_page_template', 'tpl-contact.php'),
(21, 18, '_wp_page_template', 'tpl-dashboard.php'),
(22, 19, '_wp_page_template', 'tpl-add-new-confirm.php'),
(23, 20, '_wp_page_template', 'tpl-submit.php'),
(24, 21, '_wp_page_template', 'tpl-edit-job.php');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2013-09-16 09:22:13', '2013-09-16 09:22:13', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2013-09-16 09:22:13', '2013-09-16 09:22:13', '', 0, 'http://localhost/lokertki/?p=1', 0, 'post', '', 1),
(2, 1, '2013-09-16 09:22:13', '2013-09-16 09:22:13', 'This is an example page. It''s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I''m a bike messenger by day, aspiring actor by night, and this is my blog. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin'' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href="http://localhost/lokertki/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'publish', 'open', 'open', '', 'sample-page', '', '', '2013-09-16 09:22:13', '2013-09-16 09:22:13', '', 0, 'http://localhost/lokertki/?page_id=2', 0, 'page', '', 0),
(3, 1, '2013-09-16 09:24:56', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2013-09-16 09:24:56', '0000-00-00 00:00:00', '', 0, 'http://localhost/lokertki/?p=3', 0, 'post', '', 0),
(9, 1, '2013-09-16 10:28:57', '2013-09-16 10:28:57', '', 'Login', '', 'publish', 'open', 'open', '', 'login', '', '', '2013-09-16 10:28:57', '2013-09-16 10:28:57', '', 0, 'http://localhost/lokertki/?page_id=9', 0, 'page', '', 0),
(10, 1, '2013-09-16 10:28:57', '2013-09-16 10:28:57', '', 'Register', '', 'publish', 'open', 'open', '', 'register', '', '', '2013-09-16 10:28:57', '2013-09-16 10:28:57', '', 0, 'http://localhost/lokertki/?page_id=10', 0, 'page', '', 0),
(11, 1, '2013-09-16 10:28:57', '2013-09-16 10:28:57', '', 'Password Recovery', '', 'publish', 'open', 'open', '', 'password-recovery', '', '', '2013-09-16 10:28:57', '2013-09-16 10:28:57', '', 0, 'http://localhost/lokertki/?page_id=11', 0, 'page', '', 0),
(12, 1, '2013-09-16 10:28:57', '2013-09-16 10:28:57', '', 'Password Reset', '', 'publish', 'open', 'open', '', 'password-reset', '', '', '2013-09-16 10:28:57', '2013-09-16 10:28:57', '', 0, 'http://localhost/lokertki/?page_id=12', 0, 'page', '', 0),
(13, 1, '2013-09-16 10:29:01', '2013-09-16 10:29:01', '', 'Job Date Archive', '', 'publish', 'open', 'open', '', 'date', '', '', '2013-09-16 10:29:01', '2013-09-16 10:29:01', '', 0, 'http://localhost/lokertki/?page_id=13', 0, 'page', '', 0),
(14, 1, '2013-09-16 10:29:01', '2013-09-16 10:29:01', '', 'Blog', '', 'publish', 'open', 'open', '', 'blog', '', '', '2013-09-16 10:29:01', '2013-09-16 10:29:01', '', 0, 'http://localhost/lokertki/?page_id=14', 0, 'page', '', 0),
(15, 1, '2013-09-16 10:29:01', '2013-09-16 10:29:01', '', 'My Profile', '', 'publish', 'open', 'open', '', 'profile', '', '', '2013-09-16 10:29:01', '2013-09-16 10:29:01', '', 0, 'http://localhost/lokertki/?page_id=15', 0, 'page', '', 0),
(16, 1, '2013-09-16 10:29:01', '2013-09-16 10:29:01', '', 'Edit Resume', '', 'publish', 'open', 'open', '', 'resume', '', '', '2013-09-16 10:29:01', '2013-09-16 10:29:01', '', 15, 'http://localhost/lokertki/?page_id=16', 0, 'page', '', 0),
(17, 1, '2013-09-16 10:29:01', '2013-09-16 10:29:01', '', 'Contact', '', 'publish', 'open', 'open', '', 'contact', '', '', '2013-09-16 10:29:01', '2013-09-16 10:29:01', '', 0, 'http://localhost/lokertki/?page_id=17', 0, 'page', '', 0),
(18, 1, '2013-09-16 10:29:01', '2013-09-16 10:29:01', '', 'My Dashboard', '', 'publish', 'open', 'open', '', 'dashboard', '', '', '2013-09-16 10:29:01', '2013-09-16 10:29:01', '', 0, 'http://localhost/lokertki/?page_id=18', 0, 'page', '', 0),
(19, 1, '2013-09-16 10:29:01', '2013-09-16 10:29:01', '', 'Submit Confirmation', '', 'publish', 'open', 'open', '', 'addnewconfirm', '', '', '2013-09-16 10:29:01', '2013-09-16 10:29:01', '', 0, 'http://localhost/lokertki/?page_id=19', 0, 'page', '', 0),
(20, 1, '2013-09-16 10:29:02', '2013-09-16 10:29:02', '', 'Submit', '', 'publish', 'open', 'open', '', 'submit', '', '', '2013-09-16 10:29:02', '2013-09-16 10:29:02', '', 0, 'http://localhost/lokertki/?page_id=20', 0, 'page', '', 0),
(21, 1, '2013-09-16 10:29:02', '2013-09-16 10:29:02', '', 'Edit Job', '', 'publish', 'open', 'open', '', 'edit-job', '', '', '2013-09-16 10:29:02', '2013-09-16 10:29:02', '', 0, 'http://localhost/lokertki/?page_id=21', 0, 'page', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=78 ;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'Featured', 'featured', 0),
(3, 'Full-Time', 'full-time', 0),
(4, 'Part-Time', 'part-time', 0),
(5, 'Freelance', 'freelance', 0),
(6, 'Temporary', 'temporary', 0),
(7, 'Internship', 'internship', 0),
(8, 'Less than 20,000', 'less-than-20000', 0),
(9, '20,000 - 40,000', '20000-40000', 0),
(10, '40,000 - 60,000', '40000-60000', 0),
(11, '60,000 - 80,000', '60000-80000', 0),
(12, '80,000 - 100,000', '80000-100000', 0),
(13, '100,000 and above', '100000-and-above', 0),
(14, 'Mandarin', 'mandarin', 0),
(15, 'English', 'english', 0),
(16, 'Spanish', 'spanish', 0),
(17, 'Arabic', 'arabic', 0),
(18, 'Hindi/Urdu', 'hindiurdu', 0),
(19, 'Bengali', 'bengali', 0),
(20, 'Portuguese', 'portuguese', 0),
(21, 'Russian', 'russian', 0),
(22, 'Japanese', 'japanese', 0),
(23, 'German', 'german', 0),
(24, 'French', 'french', 0),
(25, 'Italian', 'italian', 0),
(26, 'Admin', 'admin', 0),
(27, 'Accounting', 'accounting', 0),
(28, 'Agriculture', 'agriculture', 0),
(29, 'Aviation', 'aviation', 0),
(30, 'Automotive', 'automotive', 0),
(31, 'Architecture', 'architecture', 0),
(32, 'Advertising', 'advertising', 0),
(33, 'Banking', 'banking', 0),
(34, 'Building', 'building', 0),
(35, 'Construction', 'construction', 0),
(36, 'Catering', 'catering', 0),
(37, 'Charity', 'charity', 0),
(38, 'Childcare', 'childcare', 0),
(39, 'Customer Service', 'customer-service', 0),
(40, 'Driving', 'driving', 0),
(41, 'Design', 'design', 0),
(42, 'Defence', 'defence', 0),
(43, 'Engineering', 'engineering', 0),
(44, 'Executive', 'executive', 0),
(45, 'Education', 'education', 0),
(46, 'Electronics', 'electronics', 0),
(47, 'Environmental', 'environmental', 0),
(48, 'Finance', 'finance', 0),
(49, 'Government', 'government', 0),
(50, 'Hospitality', 'hospitality', 0),
(51, 'Health', 'health', 0),
(52, 'IT', 'it', 0),
(53, 'Industrial', 'industrial', 0),
(54, 'Insurance', 'insurance', 0),
(55, 'Leisure', 'leisure', 0),
(56, 'Law', 'law', 0),
(57, 'Logistics', 'logistics', 0),
(58, 'Marketing', 'marketing', 0),
(59, 'Medical', 'medical', 0),
(60, 'Manufacturing', 'manufacturing', 0),
(61, 'Media', 'media', 0),
(62, 'Mechanical', 'mechanical', 0),
(63, 'Nursing', 'nursing', 0),
(64, 'Public Sector', 'public-sector', 0),
(65, 'Pharmaceutical', 'pharmaceutical', 0),
(66, 'Retail', 'retail', 0),
(67, 'Recruitment', 'recruitment', 0),
(68, 'Social Care', 'social-care', 0),
(69, 'Security', 'security', 0),
(70, 'Secretarial', 'secretarial', 0),
(71, 'Scientific', 'scientific', 0),
(72, 'Sports', 'sports', 0),
(73, 'Surveying', 'surveying', 0),
(74, 'Travel', 'travel', 0),
(75, 'Telecommunications', 'telecommunications', 0),
(76, 'Tourism', 'tourism', 0),
(77, 'Other', 'other', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(1, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=83 ;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'job_cat', '', 0, 0),
(3, 3, 'job_type', '', 0, 0),
(4, 4, 'job_type', '', 0, 0),
(5, 5, 'job_type', '', 0, 0),
(6, 6, 'job_type', '', 0, 0),
(7, 7, 'job_type', '', 0, 0),
(8, 8, 'job_salary', '', 0, 0),
(9, 9, 'job_salary', '', 0, 0),
(10, 10, 'job_salary', '', 0, 0),
(11, 11, 'job_salary', '', 0, 0),
(12, 12, 'job_salary', '', 0, 0),
(13, 13, 'job_salary', '', 0, 0),
(14, 14, 'resume_languages', '', 0, 0),
(15, 15, 'resume_languages', '', 0, 0),
(16, 16, 'resume_languages', '', 0, 0),
(17, 17, 'resume_languages', '', 0, 0),
(18, 18, 'resume_languages', '', 0, 0),
(19, 19, 'resume_languages', '', 0, 0),
(20, 20, 'resume_languages', '', 0, 0),
(21, 21, 'resume_languages', '', 0, 0),
(22, 22, 'resume_languages', '', 0, 0),
(23, 23, 'resume_languages', '', 0, 0),
(24, 24, 'resume_languages', '', 0, 0),
(25, 25, 'resume_languages', '', 0, 0),
(26, 26, 'resume_category', '', 0, 0),
(27, 27, 'resume_category', '', 0, 0),
(28, 28, 'resume_category', '', 0, 0),
(29, 29, 'resume_category', '', 0, 0),
(30, 30, 'resume_category', '', 0, 0),
(31, 31, 'resume_category', '', 0, 0),
(32, 32, 'resume_category', '', 0, 0),
(33, 33, 'resume_category', '', 0, 0),
(34, 34, 'resume_category', '', 0, 0),
(35, 35, 'resume_category', '', 0, 0),
(36, 36, 'resume_category', '', 0, 0),
(37, 37, 'resume_category', '', 0, 0),
(38, 38, 'resume_category', '', 0, 0),
(39, 39, 'resume_category', '', 0, 0),
(40, 40, 'resume_category', '', 0, 0),
(41, 41, 'resume_category', '', 0, 0),
(42, 42, 'resume_category', '', 0, 0),
(43, 43, 'resume_category', '', 0, 0),
(44, 44, 'resume_category', '', 0, 0),
(45, 45, 'resume_category', '', 0, 0),
(46, 46, 'resume_category', '', 0, 0),
(47, 47, 'resume_category', '', 0, 0),
(48, 48, 'resume_category', '', 0, 0),
(49, 49, 'resume_category', '', 0, 0),
(50, 50, 'resume_category', '', 0, 0),
(51, 51, 'resume_category', '', 0, 0),
(52, 52, 'resume_category', '', 0, 0),
(53, 53, 'resume_category', '', 0, 0),
(54, 54, 'resume_category', '', 0, 0),
(55, 55, 'resume_category', '', 0, 0),
(56, 56, 'resume_category', '', 0, 0),
(57, 57, 'resume_category', '', 0, 0),
(58, 58, 'resume_category', '', 0, 0),
(59, 59, 'resume_category', '', 0, 0),
(60, 60, 'resume_category', '', 0, 0),
(61, 61, 'resume_category', '', 0, 0),
(62, 62, 'resume_category', '', 0, 0),
(63, 63, 'resume_category', '', 0, 0),
(64, 64, 'resume_category', '', 0, 0),
(65, 65, 'resume_category', '', 0, 0),
(66, 66, 'resume_category', '', 0, 0),
(67, 67, 'resume_category', '', 0, 0),
(68, 68, 'resume_category', '', 0, 0),
(69, 69, 'resume_category', '', 0, 0),
(70, 70, 'resume_category', '', 0, 0),
(71, 71, 'resume_category', '', 0, 0),
(72, 72, 'resume_category', '', 0, 0),
(73, 73, 'resume_category', '', 0, 0),
(74, 74, 'resume_category', '', 0, 0),
(75, 75, 'resume_category', '', 0, 0),
(76, 76, 'resume_category', '', 0, 0),
(77, 77, 'resume_category', '', 0, 0),
(78, 3, 'resume_job_type', '', 0, 0),
(79, 4, 'resume_job_type', '', 0, 0),
(80, 5, 'resume_job_type', '', 0, 0),
(81, 6, 'resume_job_type', '', 0, 0),
(82, 7, 'resume_job_type', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'first_name', ''),
(2, 1, 'last_name', ''),
(3, 1, 'nickname', 'admin'),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'wp_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', 'wp330_toolbar,wp330_saving_widgets,wp340_choose_image_from_library,wp340_customize_current_theme_link,wp350_media,wp360_revisions,wp360_locks'),
(13, 1, 'show_welcome_panel', '1'),
(14, 1, 'wp_dashboard_quick_press_last_post_id', '3'),
(15, 1, 'last_login', '2013-09-17 03:05:39');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BLLsA08XKenP65iIAa1/riVI67RfHg1', 'admin', 'webmaster@tukangbagus.com', '', '2013-09-16 09:22:13', '', 0, 'admin');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
