-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 17, 2013 at 05:10 AM
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=289 ;

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
(82, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
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
(94, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'sidebars_widgets', 'a:9:{s:19:"wp_inactive_widgets";a:0:{}s:12:"sidebar_main";a:5:{i:0;s:14:"recent-posts-2";i:1;s:17:"recent-comments-2";i:2;s:10:"archives-2";i:3;s:12:"categories-2";i:4;s:6:"meta-2";}s:12:"sidebar_blog";a:0:{}s:12:"sidebar_page";N;s:11:"sidebar_job";N;s:12:"sidebar_user";N;s:14:"sidebar_submit";N;s:14:"sidebar_resume";N;s:13:"array_version";i:3;}', 'yes'),
(99, 'cron', 'a:4:{i:1379388731;a:1:{s:21:"jr_check_jobs_expired";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1379409887;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1379411937;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
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
(155, 'jr_child_theme', 'style-default.css', 'yes'),
(156, 'jr_use_logo', '', 'yes'),
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
(168, 'jr_show_sidebar', '', 'yes'),
(169, 'jr_show_searchbar', '', 'yes'),
(170, 'jr_show_filterbar', '', 'yes'),
(171, 'jr_show_empty_categories', '1', 'yes'),
(172, 'jr_jobs_submit_text', '', 'yes'),
(173, 'jr_jobs_default_expires', '30', 'yes'),
(174, 'jr_jobs_require_moderation', '', 'yes'),
(175, 'jr_allow_editing', 'yes', 'yes'),
(176, 'jr_editing_needs_approval', 'yes', 'yes'),
(177, 'jr_ad_stats_all', '', 'yes'),
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
(200, 'jr_admin_security', '', 'yes'),
(201, 'jr_captcha_enable', 'no', 'yes'),
(202, 'jr_captcha_public_key', '', 'yes'),
(203, 'jr_captcha_private_key', '', 'yes'),
(204, 'jr_captcha_theme', 'red', 'yes'),
(205, 'jr_antispam_question', 'Is fire &ldquo;<em>hot</em>&rdquo; or &ldquo;<em>cold</em>&rdquo;?', 'yes'),
(206, 'jr_antispam_answer', 'hot', 'yes'),
(207, 'jr_enable_header_banner', 'no', 'yes'),
(208, 'jr_header_banner', '', 'yes'),
(209, 'jr_enable_listing_banner', 'no', 'yes'),
(210, 'jr_listing_banner', '', 'yes'),
(211, 'jr_debug_mode', 'no', 'yes'),
(212, 'jr_enable_log', 'no', 'yes'),
(213, 'jr_google_jquery', 'no', 'yes'),
(214, 'jr_remove_wp_generator', 'no', 'yes'),
(215, 'jr_remove_admin_bar', 'no', 'yes'),
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
(288, '_transient_dash_de3249c4736ad3bd2cd29147c4a0d43e', '', 'no');

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
