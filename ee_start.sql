-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2016 at 05:02 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ee_start`
--

-- --------------------------------------------------------

--
-- Table structure for table `exp_actions`
--

CREATE TABLE `exp_actions` (
  `action_id` int(4) UNSIGNED NOT NULL,
  `class` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `method` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `csrf_exempt` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exp_actions`
--

INSERT INTO `exp_actions` (`action_id`, `class`, `method`, `csrf_exempt`) VALUES
(1, 'Channel', 'submit_entry', 0),
(2, 'Channel', 'filemanager_endpoint', 0),
(3, 'Channel', 'smiley_pop', 0),
(4, 'Channel', 'combo_loader', 0),
(5, 'Comment', 'insert_new_comment', 0),
(6, 'Comment_mcp', 'delete_comment_notification', 0),
(7, 'Comment', 'comment_subscribe', 0),
(8, 'Comment', 'edit_comment', 0),
(9, 'Rte', 'get_js', 0),
(10, 'Search', 'do_search', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exp_captcha`
--

CREATE TABLE `exp_captcha` (
  `captcha_id` bigint(13) UNSIGNED NOT NULL,
  `date` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `word` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_categories`
--

CREATE TABLE `exp_categories` (
  `cat_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `group_id` int(6) UNSIGNED NOT NULL,
  `parent_id` int(4) UNSIGNED NOT NULL,
  `cat_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cat_url_title` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `cat_description` text COLLATE utf8_unicode_ci,
  `cat_image` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cat_order` int(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_fields`
--

CREATE TABLE `exp_category_fields` (
  `field_id` int(6) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `group_id` int(4) UNSIGNED NOT NULL,
  `field_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `field_label` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `field_type` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `field_list_items` text COLLATE utf8_unicode_ci NOT NULL,
  `field_maxl` smallint(3) NOT NULL DEFAULT '128',
  `field_ta_rows` tinyint(2) NOT NULL DEFAULT '8',
  `field_default_fmt` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `field_show_fmt` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `field_text_direction` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ltr',
  `field_required` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `field_order` int(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_field_data`
--

CREATE TABLE `exp_category_field_data` (
  `cat_id` int(4) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `group_id` int(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_groups`
--

CREATE TABLE `exp_category_groups` (
  `group_id` int(6) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `group_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'a',
  `exclude_group` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `field_html_formatting` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `can_edit_categories` text COLLATE utf8_unicode_ci,
  `can_delete_categories` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_posts`
--

CREATE TABLE `exp_category_posts` (
  `entry_id` int(10) UNSIGNED NOT NULL,
  `cat_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channels`
--

CREATE TABLE `exp_channels` (
  `channel_id` int(6) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `channel_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `channel_title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `channel_url` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `channel_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `channel_lang` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_comment_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cat_group` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_group` int(4) UNSIGNED DEFAULT NULL,
  `deft_status` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `field_group` int(4) UNSIGNED DEFAULT NULL,
  `search_excerpt` int(4) UNSIGNED DEFAULT NULL,
  `deft_category` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deft_comments` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `channel_require_membership` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `channel_max_chars` int(5) UNSIGNED DEFAULT NULL,
  `channel_html_formatting` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `extra_publish_controls` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `channel_allow_img_urls` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `channel_auto_link_urls` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `channel_notify` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `channel_notify_emails` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_url` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_system_enabled` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `comment_require_membership` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `comment_moderate` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `comment_max_chars` int(5) UNSIGNED DEFAULT '5000',
  `comment_timelock` int(5) UNSIGNED NOT NULL DEFAULT '0',
  `comment_require_email` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `comment_text_formatting` char(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'xhtml',
  `comment_html_formatting` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'safe',
  `comment_allow_img_urls` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `comment_auto_link_urls` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `comment_notify` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `comment_notify_authors` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `comment_notify_emails` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_expiration` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `search_results_url` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rss_url` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enable_versioning` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `max_revisions` smallint(4) UNSIGNED NOT NULL DEFAULT '10',
  `default_entry_title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_field_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Title',
  `url_title_prefix` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `live_look_template` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data`
--

CREATE TABLE `exp_channel_data` (
  `entry_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `channel_id` int(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_entries_autosave`
--

CREATE TABLE `exp_channel_entries_autosave` (
  `entry_id` int(10) UNSIGNED NOT NULL,
  `original_entry_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `channel_id` int(4) UNSIGNED NOT NULL,
  `author_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `url_title` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `versioning_enabled` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `view_count_one` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `view_count_two` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `view_count_three` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `view_count_four` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `sticky` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `year` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `month` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `day` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `entry_data` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_fields`
--

CREATE TABLE `exp_channel_fields` (
  `field_id` int(6) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `group_id` int(4) UNSIGNED NOT NULL,
  `field_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `field_label` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `field_instructions` text COLLATE utf8_unicode_ci,
  `field_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `field_list_items` text COLLATE utf8_unicode_ci NOT NULL,
  `field_pre_populate` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `field_pre_channel_id` int(6) UNSIGNED DEFAULT NULL,
  `field_pre_field_id` int(6) UNSIGNED DEFAULT NULL,
  `field_ta_rows` tinyint(2) DEFAULT '8',
  `field_maxl` smallint(3) DEFAULT NULL,
  `field_required` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `field_text_direction` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ltr',
  `field_search` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `field_is_hidden` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `field_fmt` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'xhtml',
  `field_show_fmt` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `field_order` int(3) UNSIGNED NOT NULL,
  `field_content_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'any',
  `field_settings` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_form_settings`
--

CREATE TABLE `exp_channel_form_settings` (
  `channel_form_settings_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `channel_id` int(6) UNSIGNED NOT NULL DEFAULT '0',
  `default_status` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `allow_guest_posts` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `default_author` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_member_groups`
--

CREATE TABLE `exp_channel_member_groups` (
  `group_id` smallint(4) UNSIGNED NOT NULL,
  `channel_id` int(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_titles`
--

CREATE TABLE `exp_channel_titles` (
  `entry_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `channel_id` int(4) UNSIGNED NOT NULL,
  `author_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `url_title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `versioning_enabled` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `view_count_one` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `view_count_two` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `view_count_three` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `view_count_four` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `sticky` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `year` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `month` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `day` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_comments`
--

CREATE TABLE `exp_comments` (
  `comment_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) DEFAULT '1',
  `entry_id` int(10) UNSIGNED DEFAULT '0',
  `channel_id` int(4) UNSIGNED DEFAULT '1',
  `author_id` int(10) UNSIGNED DEFAULT '0',
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT '0',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_date` int(10) DEFAULT NULL,
  `edit_date` int(10) DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_comment_subscriptions`
--

CREATE TABLE `exp_comment_subscriptions` (
  `subscription_id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED DEFAULT NULL,
  `member_id` int(10) DEFAULT '0',
  `email` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subscription_date` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notification_sent` char(1) COLLATE utf8_unicode_ci DEFAULT 'n',
  `hash` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_content_types`
--

CREATE TABLE `exp_content_types` (
  `content_type_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exp_content_types`
--

INSERT INTO `exp_content_types` (`content_type_id`, `name`) VALUES
(2, 'channel'),
(1, 'grid');

-- --------------------------------------------------------

--
-- Table structure for table `exp_cp_log`
--

CREATE TABLE `exp_cp_log` (
  `id` int(10) NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `member_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `act_date` int(10) NOT NULL,
  `action` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exp_cp_log`
--

INSERT INTO `exp_cp_log` (`id`, `site_id`, `member_id`, `username`, `ip_address`, `act_date`, `action`) VALUES
(1, 1, 1, 'inkavn', '::1', 1469783788, 'Logged in'),
(2, 1, 1, 'inkavn', '::1', 1469807771, 'Logged in'),
(3, 1, 1, 'inkavn', '::1', 1469845103, 'Logged in'),
(4, 1, 1, 'inkavn', '::1', 1469850828, 'Logged out'),
(5, 1, 1, 'inkavn', '::1', 1469852937, 'Logged in');

-- --------------------------------------------------------

--
-- Table structure for table `exp_developer_log`
--

CREATE TABLE `exp_developer_log` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL,
  `viewed` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `description` text COLLATE utf8_unicode_ci,
  `function` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `line` int(10) UNSIGNED DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deprecated_since` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `use_instead` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `template_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_group` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addon_module` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addon_method` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `snippets` text COLLATE utf8_unicode_ci,
  `hash` char(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache`
--

CREATE TABLE `exp_email_cache` (
  `cache_id` int(6) UNSIGNED NOT NULL,
  `cache_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total_sent` int(6) UNSIGNED NOT NULL,
  `from_name` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `from_email` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `recipient` text COLLATE utf8_unicode_ci NOT NULL,
  `cc` text COLLATE utf8_unicode_ci NOT NULL,
  `bcc` text COLLATE utf8_unicode_ci NOT NULL,
  `recipient_array` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `plaintext_alt` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `mailtype` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `text_fmt` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `wordwrap` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `attachments` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache_mg`
--

CREATE TABLE `exp_email_cache_mg` (
  `cache_id` int(6) UNSIGNED NOT NULL,
  `group_id` smallint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache_ml`
--

CREATE TABLE `exp_email_cache_ml` (
  `cache_id` int(6) UNSIGNED NOT NULL,
  `list_id` smallint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_console_cache`
--

CREATE TABLE `exp_email_console_cache` (
  `cache_id` int(6) UNSIGNED NOT NULL,
  `cache_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `member_id` int(10) UNSIGNED NOT NULL,
  `member_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `recipient` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `recipient_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_entry_versioning`
--

CREATE TABLE `exp_entry_versioning` (
  `version_id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(4) UNSIGNED NOT NULL,
  `author_id` int(10) UNSIGNED NOT NULL,
  `version_date` int(10) NOT NULL,
  `version_data` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_extensions`
--

CREATE TABLE `exp_extensions` (
  `extension_id` int(10) UNSIGNED NOT NULL,
  `class` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `method` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hook` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `settings` text COLLATE utf8_unicode_ci NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '10',
  `version` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exp_extensions`
--

INSERT INTO `exp_extensions` (`extension_id`, `class`, `method`, `hook`, `settings`, `priority`, `version`, `enabled`) VALUES
(1, 'Rte_ext', 'myaccount_nav_setup', 'myaccount_nav_setup', '', 10, '1.0.1', 'y'),
(2, 'Rte_ext', 'cp_menu_array', 'cp_menu_array', '', 10, '1.0.1', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_fieldtypes`
--

CREATE TABLE `exp_fieldtypes` (
  `fieldtype_id` int(4) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `has_global_settings` char(1) COLLATE utf8_unicode_ci DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exp_fieldtypes`
--

INSERT INTO `exp_fieldtypes` (`fieldtype_id`, `name`, `version`, `settings`, `has_global_settings`) VALUES
(1, 'select', '1.0.0', 'YTowOnt9', 'n'),
(2, 'text', '1.0.0', 'YTowOnt9', 'n'),
(3, 'textarea', '1.0.0', 'YTowOnt9', 'n'),
(4, 'date', '1.0.0', 'YTowOnt9', 'n'),
(5, 'email_address', '1.0.0', 'YTowOnt9', 'n'),
(6, 'file', '1.0.0', 'YTowOnt9', 'n'),
(7, 'grid', '1.0.0', 'YTowOnt9', 'n'),
(8, 'multi_select', '1.0.0', 'YTowOnt9', 'n'),
(9, 'checkboxes', '1.0.0', 'YTowOnt9', 'n'),
(10, 'radio', '1.0.0', 'YTowOnt9', 'n'),
(11, 'relationship', '1.0.0', 'YTowOnt9', 'n'),
(12, 'rte', '1.0.1', 'YTowOnt9', 'n'),
(13, 'toggle', '1.0.0', 'YTowOnt9', 'n'),
(14, 'url', '1.0.0', 'YTowOnt9', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_field_groups`
--

CREATE TABLE `exp_field_groups` (
  `group_id` int(4) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `group_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_files`
--

CREATE TABLE `exp_files` (
  `file_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED DEFAULT '1',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upload_location_id` int(4) UNSIGNED DEFAULT '0',
  `mime_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_size` int(10) DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `credit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uploaded_by_member_id` int(10) UNSIGNED DEFAULT '0',
  `upload_date` int(10) DEFAULT NULL,
  `modified_by_member_id` int(10) UNSIGNED DEFAULT '0',
  `modified_date` int(10) DEFAULT NULL,
  `file_hw_original` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exp_files`
--

INSERT INTO `exp_files` (`file_id`, `site_id`, `title`, `upload_location_id`, `mime_type`, `file_name`, `file_size`, `description`, `credit`, `location`, `uploaded_by_member_id`, `upload_date`, `modified_by_member_id`, `modified_date`, `file_hw_original`) VALUES
(1, 1, 'slide1.jpg', 6, 'image/jpeg', 'slide1.jpg', 66836, '', '', '', 1, 1469813171, 1, 1469813171, '400 980'),
(2, 1, 's1.png', 6, 'image/png', 's1.png', 4690, '', '', '', 1, 1469813521, 1, 1469813521, '127 127'),
(3, 1, 's2.png', 6, 'image/png', 's2.png', 6840, '', '', '', 1, 1469813526, 1, 1469813526, '127 127'),
(4, 1, 's3.png', 6, 'image/png', 's3.png', 5489, '', '', '', 1, 1469813531, 1, 1469813531, '127 127'),
(5, 1, 's4.png', 6, 'image/png', 's4.png', 5939, '', '', '', 1, 1469813539, 1, 1469813539, '127 127'),
(6, 1, 'f1.jpg', 6, 'image/jpeg', 'f1.jpg', 11192, '', '', '', 1, 1469813545, 1, 1469813545, '300 310'),
(7, 1, 'f2.jpg', 6, 'image/jpeg', 'f2.jpg', 33352, '', '', '', 1, 1469813551, 1, 1469813551, '300 310'),
(8, 1, 'f3.jpg', 6, 'image/jpeg', 'f3.jpg', 27075, '', '', '', 1, 1469813556, 1, 1469813556, '300 310'),
(9, 1, 't1.png', 6, 'image/png', 't1.png', 20849, '', '', '', 1, 1469813773, 1, 1469813773, '84 103'),
(10, 1, 't2.png', 6, 'image/png', 't2.png', 20347, '', '', '', 1, 1469813779, 1, 1469813779, '84 103'),
(11, 1, 't3.png', 6, 'image/png', 't3.png', 20122, '', '', '', 1, 1469813784, 1, 1469813784, '84 103'),
(12, 1, 't-bn.png', 6, 'image/png', 't-bn.png', 2243, '', '', '', 1, 1469813791, 1, 1469813791, '46 46'),
(13, 1, 'youtube.png', 6, 'image/png', 'youtube.png', 2929, '', '', '', 1, 1469813798, 1, 1469813798, '33 33'),
(14, 1, 'fb.png', 6, 'image/png', 'fb.png', 2519, '', '', '', 1, 1469813803, 1, 1469813803, '33 33'),
(15, 1, 'insta.png', 6, 'image/png', 'insta.png', 3031, '', '', '', 1, 1469813810, 1, 1469813810, '33 33'),
(16, 1, 'pin.png', 6, 'image/png', 'pin.png', 3062, '', '', '', 1, 1469813816, 1, 1469813816, '33 33'),
(17, 1, 'b1.jpg', 6, 'image/jpeg', 'b1.jpg', 10127, '', '', '', 1, 1469813825, 1, 1469813825, '108 163'),
(18, 1, 'b2.jpg', 6, 'image/jpeg', 'b2.jpg', 9871, '', '', '', 1, 1469813831, 1, 1469813831, '108 163'),
(19, 1, 'b3.jpg', 6, 'image/jpeg', 'b3.jpg', 3809, '', '', '', 1, 1469813838, 1, 1469813838, '108 163'),
(20, 1, 'b4.jpg', 6, 'image/jpeg', 'b4.jpg', 6851, '', '', '', 1, 1469813843, 1, 1469813843, '108 163'),
(21, 1, 'b.png', 6, 'image/png', 'b.png', 1290, '', '', '', 1, 1469814142, 1, 1469814142, '11 34');

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_categories`
--

CREATE TABLE `exp_file_categories` (
  `file_id` int(10) UNSIGNED DEFAULT NULL,
  `cat_id` int(10) UNSIGNED DEFAULT NULL,
  `sort` int(10) UNSIGNED DEFAULT '0',
  `is_cover` char(1) COLLATE utf8_unicode_ci DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_dimensions`
--

CREATE TABLE `exp_file_dimensions` (
  `id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `upload_location_id` int(4) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `short_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `resize_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `width` int(10) DEFAULT '0',
  `height` int(10) DEFAULT '0',
  `watermark_id` int(4) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_watermarks`
--

CREATE TABLE `exp_file_watermarks` (
  `wm_id` int(4) UNSIGNED NOT NULL,
  `wm_name` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wm_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'text',
  `wm_image_path` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wm_test_image_path` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wm_use_font` char(1) COLLATE utf8_unicode_ci DEFAULT 'y',
  `wm_font` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wm_font_size` int(3) UNSIGNED DEFAULT NULL,
  `wm_text` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wm_vrt_alignment` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'top',
  `wm_hor_alignment` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'left',
  `wm_padding` int(3) UNSIGNED DEFAULT NULL,
  `wm_opacity` int(3) UNSIGNED DEFAULT NULL,
  `wm_hor_offset` int(4) UNSIGNED DEFAULT NULL,
  `wm_vrt_offset` int(4) UNSIGNED DEFAULT NULL,
  `wm_x_transp` int(4) DEFAULT NULL,
  `wm_y_transp` int(4) DEFAULT NULL,
  `wm_font_color` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wm_use_drop_shadow` char(1) COLLATE utf8_unicode_ci DEFAULT 'y',
  `wm_shadow_distance` int(3) UNSIGNED DEFAULT NULL,
  `wm_shadow_color` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_global_variables`
--

CREATE TABLE `exp_global_variables` (
  `variable_id` int(6) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `variable_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `variable_data` text COLLATE utf8_unicode_ci NOT NULL,
  `edit_date` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_grid_columns`
--

CREATE TABLE `exp_grid_columns` (
  `col_id` int(10) UNSIGNED NOT NULL,
  `field_id` int(10) UNSIGNED DEFAULT NULL,
  `content_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `col_order` int(3) UNSIGNED DEFAULT NULL,
  `col_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `col_label` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `col_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `col_instructions` text COLLATE utf8_unicode_ci,
  `col_required` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `col_search` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `col_width` int(3) UNSIGNED DEFAULT NULL,
  `col_settings` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_html_buttons`
--

CREATE TABLE `exp_html_buttons` (
  `id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `tag_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `tag_open` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `tag_close` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `accesskey` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `tag_order` int(3) UNSIGNED NOT NULL,
  `tag_row` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `classname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exp_html_buttons`
--

INSERT INTO `exp_html_buttons` (`id`, `site_id`, `member_id`, `tag_name`, `tag_open`, `tag_close`, `accesskey`, `tag_order`, `tag_row`, `classname`) VALUES
(1, 1, 0, 'html_btn_bold', '<strong>', '</strong>', 'b', 1, '1', 'html-bold'),
(2, 1, 0, 'html_btn_italic', '<em>', '</em>', 'i', 2, '1', 'html-italic'),
(3, 1, 0, 'html_btn_blockquote', '<blockquote>', '</blockquote>', 'q', 3, '1', 'html-quote'),
(4, 1, 0, 'html_btn_anchor', '<a href="[![Link:!:http://]!]"(!( title="[![Title]!]")!)>', '</a>', 'a', 4, '1', 'html-link'),
(5, 1, 0, 'html_btn_picture', '<img src="[![Link:!:http://]!]" alt="[![Alternative text]!]" />', '', '', 5, '1', 'html-upload');

-- --------------------------------------------------------

--
-- Table structure for table `exp_layout_publish`
--

CREATE TABLE `exp_layout_publish` (
  `layout_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `channel_id` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `layout_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `field_layout` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_layout_publish_member_groups`
--

CREATE TABLE `exp_layout_publish_member_groups` (
  `layout_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_members`
--

CREATE TABLE `exp_members` (
  `member_id` int(10) UNSIGNED NOT NULL,
  `group_id` smallint(4) NOT NULL DEFAULT '0',
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `screen_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `unique_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `crypt_key` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `occupation` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interests` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bday_d` int(2) DEFAULT NULL,
  `bday_m` int(2) DEFAULT NULL,
  `bday_y` int(4) DEFAULT NULL,
  `aol_im` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `yahoo_im` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `msn_im` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icq` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `signature` text COLLATE utf8_unicode_ci,
  `avatar_filename` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_width` int(4) UNSIGNED DEFAULT NULL,
  `avatar_height` int(4) UNSIGNED DEFAULT NULL,
  `photo_filename` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_width` int(4) UNSIGNED DEFAULT NULL,
  `photo_height` int(4) UNSIGNED DEFAULT NULL,
  `sig_img_filename` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sig_img_width` int(4) UNSIGNED DEFAULT NULL,
  `sig_img_height` int(4) UNSIGNED DEFAULT NULL,
  `ignore_list` text COLLATE utf8_unicode_ci,
  `private_messages` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `accept_messages` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `last_view_bulletins` int(10) NOT NULL DEFAULT '0',
  `last_bulletin_date` int(10) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `join_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_visit` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total_entries` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_comment_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_email_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `in_authorlist` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `accept_admin_email` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `accept_user_email` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `notify_by_default` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `notify_of_pm` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `display_avatars` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `display_signatures` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `parse_smileys` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `smart_notifications` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `language` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_format` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_format` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `include_seconds` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile_theme` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forum_theme` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tracker` text COLLATE utf8_unicode_ci,
  `template_size` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '28',
  `notepad` text COLLATE utf8_unicode_ci,
  `notepad_size` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '18',
  `bookmarklets` text COLLATE utf8_unicode_ci,
  `quick_links` text COLLATE utf8_unicode_ci,
  `quick_tabs` text COLLATE utf8_unicode_ci,
  `show_sidebar` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `pmember_id` int(10) NOT NULL DEFAULT '0',
  `rte_enabled` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `rte_toolset_id` int(10) NOT NULL DEFAULT '0',
  `cp_homepage` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp_homepage_channel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp_homepage_custom` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exp_members`
--

INSERT INTO `exp_members` (`member_id`, `group_id`, `username`, `screen_name`, `password`, `salt`, `unique_id`, `crypt_key`, `authcode`, `email`, `url`, `location`, `occupation`, `interests`, `bday_d`, `bday_m`, `bday_y`, `aol_im`, `yahoo_im`, `msn_im`, `icq`, `bio`, `signature`, `avatar_filename`, `avatar_width`, `avatar_height`, `photo_filename`, `photo_width`, `photo_height`, `sig_img_filename`, `sig_img_width`, `sig_img_height`, `ignore_list`, `private_messages`, `accept_messages`, `last_view_bulletins`, `last_bulletin_date`, `ip_address`, `join_date`, `last_visit`, `last_activity`, `total_entries`, `total_comments`, `total_forum_topics`, `total_forum_posts`, `last_entry_date`, `last_comment_date`, `last_forum_post_date`, `last_email_date`, `in_authorlist`, `accept_admin_email`, `accept_user_email`, `notify_by_default`, `notify_of_pm`, `display_avatars`, `display_signatures`, `parse_smileys`, `smart_notifications`, `language`, `timezone`, `time_format`, `date_format`, `include_seconds`, `profile_theme`, `forum_theme`, `tracker`, `template_size`, `notepad`, `notepad_size`, `bookmarklets`, `quick_links`, `quick_tabs`, `show_sidebar`, `pmember_id`, `rte_enabled`, `rte_toolset_id`, `cp_homepage`, `cp_homepage_channel`, `cp_homepage_custom`) VALUES
(1, 1, 'inkavn', 'inkavn', 'c902c6bef4399035af989f2d1eca18456eea28067857028ee4e197fd0652b6fb9a53b0891ffd991bc8bc9a82a3de5350e4d9d23d7448b77f2b004166f5abbd26', '&E(`VRFb6V$4$uuH:dn57{Eb`/u4BvE`TyFH9NFB*,FD6h>^j1#uee~WK75wP2afh4J*<5i*Igx3Rp7w44yrix9lP:)0kDA)%>n3oe&L.i2<Iy'')nvB?-y/87_u5x?:@', '3a4a5745baf9477e1dd4e09f59e4b44904f6a909', '7425922dc7bcc868be682e931ae60f8211a8e373', NULL, 'thesuperinka@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '::1', 1469783779, 1469814719, 1469855666, 0, 0, 0, 0, 0, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'Europe/Berlin', NULL, NULL, NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, '', NULL, 'n', 0, 'y', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_bulletin_board`
--

CREATE TABLE `exp_member_bulletin_board` (
  `bulletin_id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(10) UNSIGNED NOT NULL,
  `bulletin_group` int(8) UNSIGNED NOT NULL,
  `bulletin_date` int(10) UNSIGNED NOT NULL,
  `hash` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bulletin_expires` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `bulletin_message` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_data`
--

CREATE TABLE `exp_member_data` (
  `member_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exp_member_data`
--

INSERT INTO `exp_member_data` (`member_id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_fields`
--

CREATE TABLE `exp_member_fields` (
  `m_field_id` int(4) UNSIGNED NOT NULL,
  `m_field_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `m_field_label` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `m_field_description` text COLLATE utf8_unicode_ci NOT NULL,
  `m_field_type` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `m_field_list_items` text COLLATE utf8_unicode_ci NOT NULL,
  `m_field_ta_rows` tinyint(2) DEFAULT '8',
  `m_field_maxl` smallint(3) DEFAULT NULL,
  `m_field_width` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_field_search` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `m_field_required` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_public` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `m_field_reg` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_cp_reg` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_fmt` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `m_field_show_fmt` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `m_field_order` int(3) UNSIGNED DEFAULT NULL,
  `m_field_text_direction` char(3) COLLATE utf8_unicode_ci DEFAULT 'ltr'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_groups`
--

CREATE TABLE `exp_member_groups` (
  `group_id` smallint(4) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `group_title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `group_description` text COLLATE utf8_unicode_ci NOT NULL,
  `is_locked` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_view_offline_system` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_view_online_system` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `can_access_cp` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `can_access_footer_report_bug` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_footer_new_ticket` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_footer_user_guide` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_files` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_design` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_addons` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_members` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_sys_prefs` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_comm` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_utilities` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_data` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_logs` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_admin_channels` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_admin_design` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_members` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_admin_mbr_groups` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_admin_mbr_templates` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_ban_users` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_admin_addons` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_categories` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_categories` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_view_other_entries` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_other_entries` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_assign_post_authors` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_self_entries` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_all_entries` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_view_other_comments` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_own_comments` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_own_comments` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_all_comments` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_all_comments` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_moderate_comments` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_send_cached_email` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_email_member_groups` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_email_from_profile` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_view_profiles` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_html_buttons` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_self` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `mbr_delete_notify_emails` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `can_post_comments` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `exclude_from_moderation` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_search` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `search_flood_control` mediumint(5) UNSIGNED NOT NULL,
  `can_send_private_messages` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `prv_msg_send_limit` smallint(5) UNSIGNED NOT NULL DEFAULT '20',
  `prv_msg_storage_limit` smallint(5) UNSIGNED NOT NULL DEFAULT '60',
  `can_attach_in_private_messages` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_send_bulletins` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `include_in_authorlist` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `include_in_memberlist` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `cp_homepage` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp_homepage_channel` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cp_homepage_custom` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `can_create_entries` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_self_entries` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_upload_new_files` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_files` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_files` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_upload_new_toolsets` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_toolsets` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_toolsets` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_upload_directories` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_upload_directories` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_upload_directories` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_channels` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_channels` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_channels` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_channel_fields` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_channel_fields` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_channel_fields` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_statuses` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_statuses` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_statuses` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_categories` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_member_groups` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_member_groups` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_member_groups` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_members` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_members` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_new_templates` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_templates` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_templates` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_template_groups` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_template_groups` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_template_groups` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_template_partials` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_template_partials` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_template_partials` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_template_variables` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_template_variables` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_template_variables` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_security_settings` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_translate` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_import` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_sql_manager` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exp_member_groups`
--

INSERT INTO `exp_member_groups` (`group_id`, `site_id`, `group_title`, `group_description`, `is_locked`, `can_view_offline_system`, `can_view_online_system`, `can_access_cp`, `can_access_footer_report_bug`, `can_access_footer_new_ticket`, `can_access_footer_user_guide`, `can_access_files`, `can_access_design`, `can_access_addons`, `can_access_members`, `can_access_sys_prefs`, `can_access_comm`, `can_access_utilities`, `can_access_data`, `can_access_logs`, `can_admin_channels`, `can_admin_design`, `can_delete_members`, `can_admin_mbr_groups`, `can_admin_mbr_templates`, `can_ban_users`, `can_admin_addons`, `can_edit_categories`, `can_delete_categories`, `can_view_other_entries`, `can_edit_other_entries`, `can_assign_post_authors`, `can_delete_self_entries`, `can_delete_all_entries`, `can_view_other_comments`, `can_edit_own_comments`, `can_delete_own_comments`, `can_edit_all_comments`, `can_delete_all_comments`, `can_moderate_comments`, `can_send_cached_email`, `can_email_member_groups`, `can_email_from_profile`, `can_view_profiles`, `can_edit_html_buttons`, `can_delete_self`, `mbr_delete_notify_emails`, `can_post_comments`, `exclude_from_moderation`, `can_search`, `search_flood_control`, `can_send_private_messages`, `prv_msg_send_limit`, `prv_msg_storage_limit`, `can_attach_in_private_messages`, `can_send_bulletins`, `include_in_authorlist`, `include_in_memberlist`, `cp_homepage`, `cp_homepage_channel`, `cp_homepage_custom`, `can_create_entries`, `can_edit_self_entries`, `can_upload_new_files`, `can_edit_files`, `can_delete_files`, `can_upload_new_toolsets`, `can_edit_toolsets`, `can_delete_toolsets`, `can_create_upload_directories`, `can_edit_upload_directories`, `can_delete_upload_directories`, `can_create_channels`, `can_edit_channels`, `can_delete_channels`, `can_create_channel_fields`, `can_edit_channel_fields`, `can_delete_channel_fields`, `can_create_statuses`, `can_delete_statuses`, `can_edit_statuses`, `can_create_categories`, `can_create_member_groups`, `can_delete_member_groups`, `can_edit_member_groups`, `can_create_members`, `can_edit_members`, `can_create_new_templates`, `can_edit_templates`, `can_delete_templates`, `can_create_template_groups`, `can_edit_template_groups`, `can_delete_template_groups`, `can_create_template_partials`, `can_edit_template_partials`, `can_delete_template_partials`, `can_create_template_variables`, `can_delete_template_variables`, `can_edit_template_variables`, `can_access_security_settings`, `can_access_translate`, `can_access_import`, `can_access_sql_manager`) VALUES
(1, 1, 'Super Admin', '', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', NULL, 'y', 'y', 'y', 0, 'y', 20, 60, 'y', 'y', 'y', 'y', NULL, 0, NULL, 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y'),
(2, 1, 'Banned', '', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', NULL, 'n', 'n', 'n', 60, 'n', 20, 60, 'n', 'n', 'n', 'n', NULL, 0, NULL, 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n'),
(3, 1, 'Guests', '', 'n', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', NULL, 'n', 'n', 'n', 10, 'n', 20, 60, 'n', 'n', 'n', 'y', NULL, 0, NULL, 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n'),
(4, 1, 'Pending', '', 'n', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', NULL, 'n', 'n', 'n', 10, 'n', 20, 60, 'n', 'n', 'n', 'y', NULL, 0, NULL, 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n'),
(5, 1, 'Members', '', 'n', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'y', 'y', 'y', NULL, 'n', 'n', 'n', 10, 'y', 20, 60, 'y', 'n', 'n', 'y', NULL, 0, NULL, 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_homepage`
--

CREATE TABLE `exp_member_homepage` (
  `member_id` int(10) UNSIGNED NOT NULL,
  `recent_entries` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'l',
  `recent_entries_order` int(3) UNSIGNED NOT NULL DEFAULT '0',
  `recent_comments` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'l',
  `recent_comments_order` int(3) UNSIGNED NOT NULL DEFAULT '0',
  `recent_members` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `recent_members_order` int(3) UNSIGNED NOT NULL DEFAULT '0',
  `site_statistics` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'r',
  `site_statistics_order` int(3) UNSIGNED NOT NULL DEFAULT '0',
  `member_search_form` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `member_search_form_order` int(3) UNSIGNED NOT NULL DEFAULT '0',
  `notepad` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'r',
  `notepad_order` int(3) UNSIGNED NOT NULL DEFAULT '0',
  `bulletin_board` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'r',
  `bulletin_board_order` int(3) UNSIGNED NOT NULL DEFAULT '0',
  `pmachine_news_feed` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `pmachine_news_feed_order` int(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exp_member_homepage`
--

INSERT INTO `exp_member_homepage` (`member_id`, `recent_entries`, `recent_entries_order`, `recent_comments`, `recent_comments_order`, `recent_members`, `recent_members_order`, `site_statistics`, `site_statistics_order`, `member_search_form`, `member_search_form_order`, `notepad`, `notepad_order`, `bulletin_board`, `bulletin_board_order`, `pmachine_news_feed`, `pmachine_news_feed_order`) VALUES
(1, 'l', 1, 'l', 2, 'n', 0, 'r', 1, 'n', 0, 'r', 2, 'r', 0, 'l', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_search`
--

CREATE TABLE `exp_member_search` (
  `search_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `search_date` int(10) UNSIGNED NOT NULL,
  `keywords` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `fields` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `total_results` int(8) UNSIGNED NOT NULL,
  `query` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_attachments`
--

CREATE TABLE `exp_message_attachments` (
  `attachment_id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `message_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `attachment_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `attachment_hash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `attachment_extension` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `attachment_location` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `attachment_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `attachment_size` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `is_temp` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_copies`
--

CREATE TABLE `exp_message_copies` (
  `copy_id` int(10) UNSIGNED NOT NULL,
  `message_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sender_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `recipient_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `message_received` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `message_read` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `message_time_read` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `attachment_downloaded` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `message_folder` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `message_authcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message_deleted` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `message_status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_data`
--

CREATE TABLE `exp_message_data` (
  `message_id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `message_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `message_subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message_body` text COLLATE utf8_unicode_ci NOT NULL,
  `message_tracking` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `message_attachments` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `message_recipients` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message_cc` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message_hide_cc` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `message_sent_copy` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `total_recipients` int(5) UNSIGNED NOT NULL DEFAULT '0',
  `message_status` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_folders`
--

CREATE TABLE `exp_message_folders` (
  `member_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `folder1_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'InBox',
  `folder2_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Sent',
  `folder3_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `folder4_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `folder5_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `folder6_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `folder7_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `folder8_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `folder9_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `folder10_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_listed`
--

CREATE TABLE `exp_message_listed` (
  `listed_id` int(10) UNSIGNED NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `listed_member` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `listed_description` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `listed_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'blocked'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_modules`
--

CREATE TABLE `exp_modules` (
  `module_id` int(4) UNSIGNED NOT NULL,
  `module_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `module_version` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `has_cp_backend` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `has_publish_fields` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exp_modules`
--

INSERT INTO `exp_modules` (`module_id`, `module_name`, `module_version`, `has_cp_backend`, `has_publish_fields`) VALUES
(1, 'Channel', '2.0.1', 'n', 'n'),
(2, 'Comment', '2.3.2', 'y', 'n'),
(3, 'Stats', '2.0.0', 'n', 'n'),
(4, 'Rte', '1.0.1', 'y', 'n'),
(5, 'File', '1.0.0', 'n', 'n'),
(6, 'Filepicker', '1.0', 'y', 'n'),
(7, 'Search', '2.2.2', 'n', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_module_member_groups`
--

CREATE TABLE `exp_module_member_groups` (
  `group_id` smallint(4) UNSIGNED NOT NULL,
  `module_id` mediumint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_online_users`
--

CREATE TABLE `exp_online_users` (
  `online_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `in_forum` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `anon` char(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exp_online_users`
--

INSERT INTO `exp_online_users` (`online_id`, `site_id`, `member_id`, `in_forum`, `name`, `ip_address`, `date`, `anon`) VALUES
(3, 1, 0, 'n', '', '::1', 1469845099, ''),
(4, 1, 0, 'n', '', '::1', 1469975921, '');

-- --------------------------------------------------------

--
-- Table structure for table `exp_password_lockout`
--

CREATE TABLE `exp_password_lockout` (
  `lockout_id` int(10) UNSIGNED NOT NULL,
  `login_date` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exp_password_lockout`
--

INSERT INTO `exp_password_lockout` (`lockout_id`, `login_date`, `ip_address`, `user_agent`, `username`) VALUES
(1, 1469783785, '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `exp_plugins`
--

CREATE TABLE `exp_plugins` (
  `plugin_id` int(10) UNSIGNED NOT NULL,
  `plugin_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `plugin_package` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `plugin_version` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `is_typography_related` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_relationships`
--

CREATE TABLE `exp_relationships` (
  `relationship_id` int(6) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `child_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `field_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `grid_field_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `grid_col_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `grid_row_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `order` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_remember_me`
--

CREATE TABLE `exp_remember_me` (
  `remember_me_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `member_id` int(10) DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8_unicode_ci DEFAULT '',
  `admin_sess` tinyint(1) DEFAULT '0',
  `site_id` int(4) DEFAULT '1',
  `expiration` int(10) DEFAULT '0',
  `last_refresh` int(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_reset_password`
--

CREATE TABLE `exp_reset_password` (
  `reset_id` int(10) UNSIGNED NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL,
  `resetcode` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `date` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_revision_tracker`
--

CREATE TABLE `exp_revision_tracker` (
  `tracker_id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `item_table` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `item_field` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `item_date` int(10) NOT NULL,
  `item_author_id` int(10) UNSIGNED NOT NULL,
  `item_data` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_rte_tools`
--

CREATE TABLE `exp_rte_tools` (
  `tool_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` char(1) COLLATE utf8_unicode_ci DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exp_rte_tools`
--

INSERT INTO `exp_rte_tools` (`tool_id`, `name`, `class`, `enabled`) VALUES
(1, 'Blockquote', 'Blockquote_rte', 'y'),
(2, 'Bold', 'Bold_rte', 'y'),
(3, 'Headings', 'Headings_rte', 'y'),
(4, 'Image', 'Image_rte', 'y'),
(5, 'Italic', 'Italic_rte', 'y'),
(6, 'Link', 'Link_rte', 'y'),
(7, 'Ordered List', 'Ordered_list_rte', 'y'),
(8, 'Underline', 'Underline_rte', 'y'),
(9, 'Unordered List', 'Unordered_list_rte', 'y'),
(10, 'View Source', 'View_source_rte', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_rte_toolsets`
--

CREATE TABLE `exp_rte_toolsets` (
  `toolset_id` int(10) UNSIGNED NOT NULL,
  `member_id` int(10) DEFAULT '0',
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tools` text COLLATE utf8_unicode_ci,
  `enabled` char(1) COLLATE utf8_unicode_ci DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exp_rte_toolsets`
--

INSERT INTO `exp_rte_toolsets` (`toolset_id`, `member_id`, `name`, `tools`, `enabled`) VALUES
(1, 0, 'Default', '3|2|5|1|9|7|6|4|10', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_search`
--

CREATE TABLE `exp_search` (
  `search_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `site_id` int(4) NOT NULL DEFAULT '1',
  `search_date` int(10) NOT NULL,
  `keywords` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `total_results` int(6) NOT NULL,
  `per_page` tinyint(3) UNSIGNED NOT NULL,
  `query` mediumtext COLLATE utf8_unicode_ci,
  `custom_fields` mediumtext COLLATE utf8_unicode_ci,
  `result_page` varchar(70) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_search_log`
--

CREATE TABLE `exp_search_log` (
  `id` int(10) NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `member_id` int(10) UNSIGNED NOT NULL,
  `screen_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `search_date` int(10) NOT NULL,
  `search_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `search_terms` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_security_hashes`
--

CREATE TABLE `exp_security_hashes` (
  `hash_id` int(10) UNSIGNED NOT NULL,
  `date` int(10) UNSIGNED NOT NULL,
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `hash` varchar(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exp_security_hashes`
--

INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `session_id`, `hash`) VALUES
(1, 1469783789, '27dd24b5f1440694009e5a7022bdb68c81cf8c12', '3c8744fb3d4903519dc5e5bf1c496670143b4d44'),
(2, 1469807771, '5ae4cd2baeece6da5cb589b19d763b177c5ced60', 'df2f41f7af2af03d923f02149027b7a35ac671af'),
(4, 1469852937, '5a2c2deb06792883b433dee148377c040b904e47', 'ceb4ae5ca26f93b052cd1f971e4f99607b59b1cb');

-- --------------------------------------------------------

--
-- Table structure for table `exp_sessions`
--

CREATE TABLE `exp_sessions` (
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `admin_sess` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `login_state` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fingerprint` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `sess_start` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `can_debug` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exp_sessions`
--

INSERT INTO `exp_sessions` (`session_id`, `member_id`, `admin_sess`, `ip_address`, `user_agent`, `login_state`, `fingerprint`, `sess_start`, `last_activity`, `can_debug`) VALUES
('5a2c2deb06792883b433dee148377c040b904e47', 1, 0, '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', NULL, '7605e64a7d3264b01c935a283c34258e', 1469852937, 1469855666, 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_sites`
--

CREATE TABLE `exp_sites` (
  `site_id` int(5) UNSIGNED NOT NULL,
  `site_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `site_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `site_description` text COLLATE utf8_unicode_ci,
  `site_system_preferences` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `site_member_preferences` text COLLATE utf8_unicode_ci NOT NULL,
  `site_template_preferences` text COLLATE utf8_unicode_ci NOT NULL,
  `site_channel_preferences` text COLLATE utf8_unicode_ci NOT NULL,
  `site_bootstrap_checksums` text COLLATE utf8_unicode_ci NOT NULL,
  `site_pages` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exp_sites`
--

INSERT INTO `exp_sites` (`site_id`, `site_label`, `site_name`, `site_description`, `site_system_preferences`, `site_member_preferences`, `site_template_preferences`, `site_channel_preferences`, `site_bootstrap_checksums`, `site_pages`) VALUES
(1, 'EEshop', 'default_site', NULL, 'YTo4Nzp7czoxMDoiaXNfc2l0ZV9vbiI7czoxOiJ5IjtzOjEwOiJzaXRlX2luZGV4IjtzOjk6ImluZGV4LnBocCI7czo4OiJzaXRlX3VybCI7czozMzoiaHR0cDovL2xvY2FsaG9zdC9pY3QvZWUvc3RhcnQvc3IvIjtzOjY6ImNwX3VybCI7TjtzOjE2OiJ0aGVtZV9mb2xkZXJfdXJsIjtzOjQwOiJodHRwOi8vbG9jYWxob3N0L2ljdC9lZS9zdGFydC9zci90aGVtZXMvIjtzOjE3OiJ0aGVtZV9mb2xkZXJfcGF0aCI7czo0MDoiQzpceGFtcHAyXGh0ZG9jc1xpY3RcZWVcc3RhcnRcc3JcdGhlbWVzXCI7czoxNToid2VibWFzdGVyX2VtYWlsIjtzOjIyOiJ0aGVzdXBlcmlua2FAZ21haWwuY29tIjtzOjE0OiJ3ZWJtYXN0ZXJfbmFtZSI7czowOiIiO3M6MjA6ImNoYW5uZWxfbm9tZW5jbGF0dXJlIjtzOjc6ImNoYW5uZWwiO3M6MTA6Im1heF9jYWNoZXMiO3M6MzoiMTUwIjtzOjExOiJjYXB0Y2hhX3VybCI7czo0OToiaHR0cDovL2xvY2FsaG9zdC9pY3QvZWUvc3RhcnQvc3IvaW1hZ2VzL2NhcHRjaGFzLyI7czoxMjoiY2FwdGNoYV9wYXRoIjtzOjQ5OiJDOlx4YW1wcDJcaHRkb2NzXGljdFxlZVxzdGFydFxzclxpbWFnZXNcY2FwdGNoYXNcIjtzOjEyOiJjYXB0Y2hhX2ZvbnQiO3M6MToieSI7czoxMjoiY2FwdGNoYV9yYW5kIjtzOjE6InkiO3M6MjM6ImNhcHRjaGFfcmVxdWlyZV9tZW1iZXJzIjtzOjE6Im4iO3M6MTU6InJlcXVpcmVfY2FwdGNoYSI7czoxOiJuIjtzOjE4OiJlbmFibGVfc3FsX2NhY2hpbmciO3M6MToibiI7czoxODoiZm9yY2VfcXVlcnlfc3RyaW5nIjtzOjE6Im4iO3M6MTM6InNob3dfcHJvZmlsZXIiO3M6MToibiI7czoxNToiaW5jbHVkZV9zZWNvbmRzIjtzOjE6Im4iO3M6MTM6ImNvb2tpZV9kb21haW4iO3M6MDoiIjtzOjExOiJjb29raWVfcGF0aCI7czowOiIiO3M6MTU6ImNvb2tpZV9odHRwb25seSI7TjtzOjEzOiJjb29raWVfc2VjdXJlIjtOO3M6MjA6IndlYnNpdGVfc2Vzc2lvbl90eXBlIjtzOjE6ImMiO3M6MTU6ImNwX3Nlc3Npb25fdHlwZSI7czoxOiJjIjtzOjIxOiJhbGxvd191c2VybmFtZV9jaGFuZ2UiO3M6MToieSI7czoxODoiYWxsb3dfbXVsdGlfbG9naW5zIjtzOjE6InkiO3M6MTY6InBhc3N3b3JkX2xvY2tvdXQiO3M6MToieSI7czoyNToicGFzc3dvcmRfbG9ja291dF9pbnRlcnZhbCI7czoxOiIxIjtzOjIwOiJyZXF1aXJlX2lwX2Zvcl9sb2dpbiI7czoxOiJ5IjtzOjIyOiJyZXF1aXJlX2lwX2Zvcl9wb3N0aW5nIjtzOjE6InkiO3M6MjQ6InJlcXVpcmVfc2VjdXJlX3Bhc3N3b3JkcyI7czoxOiJuIjtzOjE5OiJhbGxvd19kaWN0aW9uYXJ5X3B3IjtzOjE6InkiO3M6MjM6Im5hbWVfb2ZfZGljdGlvbmFyeV9maWxlIjtzOjA6IiI7czoxNzoieHNzX2NsZWFuX3VwbG9hZHMiO3M6MToieSI7czoxNToicmVkaXJlY3RfbWV0aG9kIjtzOjc6InJlZnJlc2giO3M6OToiZGVmdF9sYW5nIjtzOjc6ImVuZ2xpc2giO3M6ODoieG1sX2xhbmciO3M6MjoiZW4iO3M6MTI6InNlbmRfaGVhZGVycyI7czoxOiJ5IjtzOjExOiJnemlwX291dHB1dCI7czoxOiJuIjtzOjIxOiJkZWZhdWx0X3NpdGVfdGltZXpvbmUiO3M6MTY6IkFzaWEvSG9fQ2hpX01pbmgiO3M6MTE6ImRhdGVfZm9ybWF0IjtzOjg6IiVuLyVqLyVZIjtzOjExOiJ0aW1lX2Zvcm1hdCI7czoyOiIxMiI7czoxMzoibWFpbF9wcm90b2NvbCI7czo0OiJtYWlsIjtzOjExOiJzbXRwX3NlcnZlciI7czowOiIiO3M6OToic210cF9wb3J0IjtOO3M6MTM6InNtdHBfdXNlcm5hbWUiO3M6MDoiIjtzOjEzOiJzbXRwX3Bhc3N3b3JkIjtzOjA6IiI7czoxMToiZW1haWxfZGVidWciO3M6MToibiI7czoxMzoiZW1haWxfY2hhcnNldCI7czo1OiJ1dGYtOCI7czoxNToiZW1haWxfYmF0Y2htb2RlIjtzOjE6Im4iO3M6MTY6ImVtYWlsX2JhdGNoX3NpemUiO3M6MDoiIjtzOjExOiJtYWlsX2Zvcm1hdCI7czo1OiJwbGFpbiI7czo5OiJ3b3JkX3dyYXAiO3M6MToieSI7czoyMjoiZW1haWxfY29uc29sZV90aW1lbG9jayI7czoxOiI1IjtzOjIyOiJsb2dfZW1haWxfY29uc29sZV9tc2dzIjtzOjE6InkiO3M6MTY6ImxvZ19zZWFyY2hfdGVybXMiO3M6MToieSI7czoxOToiZGVueV9kdXBsaWNhdGVfZGF0YSI7czoxOiJ5IjtzOjI0OiJyZWRpcmVjdF9zdWJtaXR0ZWRfbGlua3MiO3M6MToibiI7czoxNjoiZW5hYmxlX2NlbnNvcmluZyI7czoxOiJuIjtzOjE0OiJjZW5zb3JlZF93b3JkcyI7czowOiIiO3M6MTg6ImNlbnNvcl9yZXBsYWNlbWVudCI7czowOiIiO3M6MTA6ImJhbm5lZF9pcHMiO3M6MDoiIjtzOjEzOiJiYW5uZWRfZW1haWxzIjtzOjA6IiI7czoxNjoiYmFubmVkX3VzZXJuYW1lcyI7czowOiIiO3M6MTk6ImJhbm5lZF9zY3JlZW5fbmFtZXMiO3M6MDoiIjtzOjEwOiJiYW5fYWN0aW9uIjtzOjg6InJlc3RyaWN0IjtzOjExOiJiYW5fbWVzc2FnZSI7czozNDoiVGhpcyBzaXRlIGlzIGN1cnJlbnRseSB1bmF2YWlsYWJsZSI7czoxNToiYmFuX2Rlc3RpbmF0aW9uIjtzOjIxOiJodHRwOi8vd3d3LnlhaG9vLmNvbS8iO3M6MTY6ImVuYWJsZV9lbW90aWNvbnMiO3M6MToieSI7czoxMjoiZW1vdGljb25fdXJsIjtzOjQ4OiJodHRwOi8vbG9jYWxob3N0L2ljdC9lZS9zdGFydC9zci9pbWFnZXMvc21pbGV5cy8iO3M6MTk6InJlY291bnRfYmF0Y2hfdG90YWwiO3M6NDoiMTAwMCI7czoxNzoibmV3X3ZlcnNpb25fY2hlY2siO3M6MToieSI7czoxNzoiZW5hYmxlX3Rocm90dGxpbmciO3M6MToibiI7czoxNzoiYmFuaXNoX21hc2tlZF9pcHMiO3M6MToieSI7czoxNDoibWF4X3BhZ2VfbG9hZHMiO3M6MjoiMTAiO3M6MTM6InRpbWVfaW50ZXJ2YWwiO3M6MToiOCI7czoxMjoibG9ja291dF90aW1lIjtzOjI6IjMwIjtzOjE1OiJiYW5pc2htZW50X3R5cGUiO3M6NzoibWVzc2FnZSI7czoxNDoiYmFuaXNobWVudF91cmwiO3M6MDoiIjtzOjE4OiJiYW5pc2htZW50X21lc3NhZ2UiO3M6NTA6IllvdSBoYXZlIGV4Y2VlZGVkIHRoZSBhbGxvd2VkIHBhZ2UgbG9hZCBmcmVxdWVuY3kuIjtzOjE3OiJlbmFibGVfc2VhcmNoX2xvZyI7czoxOiJ5IjtzOjE5OiJtYXhfbG9nZ2VkX3NlYXJjaGVzIjtzOjM6IjUwMCI7czoxMToicnRlX2VuYWJsZWQiO3M6MToieSI7czoyMjoicnRlX2RlZmF1bHRfdG9vbHNldF9pZCI7czoxOiIxIjtzOjEzOiJmb3J1bV90cmlnZ2VyIjtOO30=', 'YTo0Nzp7czoxMDoidW5fbWluX2xlbiI7czoxOiI0IjtzOjEwOiJwd19taW5fbGVuIjtzOjE6IjUiO3M6MjU6ImFsbG93X21lbWJlcl9yZWdpc3RyYXRpb24iO3M6MToibiI7czoyNToiYWxsb3dfbWVtYmVyX2xvY2FsaXphdGlvbiI7czoxOiJ5IjtzOjE4OiJyZXFfbWJyX2FjdGl2YXRpb24iO3M6NToiZW1haWwiO3M6MjM6Im5ld19tZW1iZXJfbm90aWZpY2F0aW9uIjtzOjE6Im4iO3M6MjM6Im1icl9ub3RpZmljYXRpb25fZW1haWxzIjtzOjA6IiI7czoyNDoicmVxdWlyZV90ZXJtc19vZl9zZXJ2aWNlIjtzOjE6InkiO3M6MjA6ImRlZmF1bHRfbWVtYmVyX2dyb3VwIjtzOjE6IjUiO3M6MTU6InByb2ZpbGVfdHJpZ2dlciI7czo2OiJtZW1iZXIiO3M6MTI6Im1lbWJlcl90aGVtZSI7czo3OiJkZWZhdWx0IjtzOjE0OiJlbmFibGVfYXZhdGFycyI7czoxOiJ5IjtzOjIwOiJhbGxvd19hdmF0YXJfdXBsb2FkcyI7czoxOiJuIjtzOjEwOiJhdmF0YXJfdXJsIjtzOjQ4OiJodHRwOi8vbG9jYWxob3N0L2ljdC9lZS9zdGFydC9zci9pbWFnZXMvYXZhdGFycy8iO3M6MTE6ImF2YXRhcl9wYXRoIjtzOjQ4OiJDOlx4YW1wcDJcaHRkb2NzXGljdFxlZVxzdGFydFxzclxpbWFnZXNcYXZhdGFyc1wiO3M6MTY6ImF2YXRhcl9tYXhfd2lkdGgiO3M6MzoiMTAwIjtzOjE3OiJhdmF0YXJfbWF4X2hlaWdodCI7czozOiIxMDAiO3M6MTM6ImF2YXRhcl9tYXhfa2IiO3M6MjoiNTAiO3M6MTM6ImVuYWJsZV9waG90b3MiO3M6MToibiI7czo5OiJwaG90b191cmwiO3M6NTQ6Imh0dHA6Ly9sb2NhbGhvc3QvaWN0L2VlL3N0YXJ0L3NyL2ltYWdlcy9tZW1iZXJfcGhvdG9zLyI7czoxMDoicGhvdG9fcGF0aCI7czo1NDoiQzpceGFtcHAyXGh0ZG9jc1xpY3RcZWVcc3RhcnRcc3JcaW1hZ2VzXG1lbWJlcl9waG90b3NcIjtzOjE1OiJwaG90b19tYXhfd2lkdGgiO3M6MzoiMTAwIjtzOjE2OiJwaG90b19tYXhfaGVpZ2h0IjtzOjM6IjEwMCI7czoxMjoicGhvdG9fbWF4X2tiIjtzOjI6IjUwIjtzOjE2OiJhbGxvd19zaWduYXR1cmVzIjtzOjE6InkiO3M6MTM6InNpZ19tYXhsZW5ndGgiO3M6MzoiNTAwIjtzOjIxOiJzaWdfYWxsb3dfaW1nX2hvdGxpbmsiO3M6MToibiI7czoyMDoic2lnX2FsbG93X2ltZ191cGxvYWQiO3M6MToibiI7czoxMToic2lnX2ltZ191cmwiO3M6NjI6Imh0dHA6Ly9sb2NhbGhvc3QvaWN0L2VlL3N0YXJ0L3NyL2ltYWdlcy9zaWduYXR1cmVfYXR0YWNobWVudHMvIjtzOjEyOiJzaWdfaW1nX3BhdGgiO3M6NjI6IkM6XHhhbXBwMlxodGRvY3NcaWN0XGVlXHN0YXJ0XHNyXGltYWdlc1xzaWduYXR1cmVfYXR0YWNobWVudHNcIjtzOjE3OiJzaWdfaW1nX21heF93aWR0aCI7czozOiI0ODAiO3M6MTg6InNpZ19pbWdfbWF4X2hlaWdodCI7czoyOiI4MCI7czoxNDoic2lnX2ltZ19tYXhfa2IiO3M6MjoiMzAiO3M6MTU6InBydl9tc2dfZW5hYmxlZCI7czoxOiJ5IjtzOjI1OiJwcnZfbXNnX2FsbG93X2F0dGFjaG1lbnRzIjtzOjE6InkiO3M6MTk6InBydl9tc2dfdXBsb2FkX3BhdGgiO3M6NTU6IkM6XHhhbXBwMlxodGRvY3NcaWN0XGVlXHN0YXJ0XHNyXGltYWdlc1xwbV9hdHRhY2htZW50c1wiO3M6MjM6InBydl9tc2dfbWF4X2F0dGFjaG1lbnRzIjtzOjE6IjMiO3M6MjI6InBydl9tc2dfYXR0YWNoX21heHNpemUiO3M6MzoiMjUwIjtzOjIwOiJwcnZfbXNnX2F0dGFjaF90b3RhbCI7czozOiIxMDAiO3M6MTk6InBydl9tc2dfaHRtbF9mb3JtYXQiO3M6NDoic2FmZSI7czoxODoicHJ2X21zZ19hdXRvX2xpbmtzIjtzOjE6InkiO3M6MTc6InBydl9tc2dfbWF4X2NoYXJzIjtzOjQ6IjYwMDAiO3M6MTk6Im1lbWJlcmxpc3Rfb3JkZXJfYnkiO3M6MTE6InRvdGFsX3Bvc3RzIjtzOjIxOiJtZW1iZXJsaXN0X3NvcnRfb3JkZXIiO3M6NDoiZGVzYyI7czoyMDoibWVtYmVybGlzdF9yb3dfbGltaXQiO3M6MjoiMjAiO3M6Mjg6ImFwcHJvdmVkX21lbWJlcl9ub3RpZmljYXRpb24iO047czoyODoiZGVjbGluZWRfbWVtYmVyX25vdGlmaWNhdGlvbiI7Tjt9', 'YTo3OntzOjIyOiJlbmFibGVfdGVtcGxhdGVfcm91dGVzIjtzOjE6InkiO3M6MTE6InN0cmljdF91cmxzIjtzOjE6InkiO3M6ODoic2l0ZV80MDQiO3M6MDoiIjtzOjE5OiJzYXZlX3RtcGxfcmV2aXNpb25zIjtzOjE6Im4iO3M6MTg6Im1heF90bXBsX3JldmlzaW9ucyI7czoxOiI1IjtzOjE1OiJzYXZlX3RtcGxfZmlsZXMiO3M6MToibiI7czoxODoidG1wbF9maWxlX2Jhc2VwYXRoIjtOO30=', 'YToxMzp7czoyMzoiYXV0b19hc3NpZ25fY2F0X3BhcmVudHMiO3M6MToieSI7czoyMzoiYXV0b19jb252ZXJ0X2hpZ2hfYXNjaWkiO3M6MToibiI7czoyMzoiY29tbWVudF9lZGl0X3RpbWVfbGltaXQiO047czoyNzoiY29tbWVudF9tb2RlcmF0aW9uX292ZXJyaWRlIjtOO3M6MjI6ImNvbW1lbnRfd29yZF9jZW5zb3JpbmciO047czoxNToiZW5hYmxlX2NvbW1lbnRzIjtOO3M6MTg6ImltYWdlX2xpYnJhcnlfcGF0aCI7czowOiIiO3M6MjE6ImltYWdlX3Jlc2l6ZV9wcm90b2NvbCI7czozOiJnZDIiO3M6MjI6Im5ld19wb3N0c19jbGVhcl9jYWNoZXMiO3M6MToieSI7czoyMjoicmVzZXJ2ZWRfY2F0ZWdvcnlfd29yZCI7czo4OiJjYXRlZ29yeSI7czoxNjoidGh1bWJuYWlsX3ByZWZpeCI7czo1OiJ0aHVtYiI7czoxNzoidXNlX2NhdGVnb3J5X25hbWUiO3M6MToibiI7czoxNDoid29yZF9zZXBhcmF0b3IiO3M6NDoiZGFzaCI7fQ==', 'YToxOntzOjQyOiJDOlx4YW1wcDJcaHRkb2NzXGljdFxlZVxzdGFydFxzci9pbmRleC5waHAiO3M6MzI6IjcxMWIxMjdjMmMyZTE0ZDNkMTMzZmQxYTMxNDRiZTcxIjt9', '');

-- --------------------------------------------------------

--
-- Table structure for table `exp_snippets`
--

CREATE TABLE `exp_snippets` (
  `snippet_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) NOT NULL,
  `snippet_name` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `snippet_contents` text COLLATE utf8_unicode_ci,
  `edit_date` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_specialty_templates`
--

CREATE TABLE `exp_specialty_templates` (
  `template_id` int(6) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `enable_template` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'y',
  `template_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `data_title` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `template_type` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_subtype` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_data` text COLLATE utf8_unicode_ci NOT NULL,
  `template_notes` text COLLATE utf8_unicode_ci,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exp_specialty_templates`
--

INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_type`, `template_subtype`, `template_data`, `template_notes`, `edit_date`, `last_author_id`) VALUES
(1, 1, 'y', 'offline_template', '', 'system', NULL, '<html>\n<head>\n\n<title>System Offline</title>\n\n<style type="text/css">\n\nbody {\nbackground-color:	#ffffff;\nmargin:				50px;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n\na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#999999 1px solid;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n</style>\n\n</head>\n\n<body>\n\n<div id="content">\n\n<h1>System Offline</h1>\n\n<p>This site is currently offline</p>\n\n</div>\n\n</body>\n\n</html>', NULL, 1469783780, 0),
(2, 1, 'y', 'message_template', '', 'system', NULL, '<html>\n<head>\n\n<title>{title}</title>\n\n<meta http-equiv=''content-type'' content=''text/html; charset={charset}'' />\n\n{meta_refresh}\n\n<style type="text/css">\n\nbody {\nbackground-color:	#ffffff;\nmargin:				50px;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n\na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:active {\ncolor:				#ccc;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#000 1px solid;\nbackground-color: 	#DEDFE3;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n\nul {\nmargin-bottom: 		16px;\n}\n\nli {\nlist-style:			square;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		8px;\nmargin-bottom: 		8px;\ncolor: 				#000;\n}\n\n</style>\n\n</head>\n\n<body>\n\n<div id="content">\n\n<h1>{heading}</h1>\n\n{content}\n\n<p>{link}</p>\n\n</div>\n\n</body>\n\n</html>', NULL, 1469783780, 0),
(3, 1, 'y', 'admin_notify_reg', 'Notification of new member registration', 'email', 'members', 'New member registration site: {site_name}\n\nScreen name: {name}\nUser name: {username}\nEmail: {email}\n\nYour control panel URL: {control_panel_url}', NULL, 1469783780, 0),
(4, 1, 'y', 'admin_notify_entry', 'A new channel entry has been posted', 'email', 'content', 'A new entry has been posted in the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nPosted by: {name}\nEmail: {email}\n\nTo read the entry please visit:\n{entry_url}\n', NULL, 1469783780, 0),
(5, 1, 'y', 'admin_notify_comment', 'You have just received a comment', 'email', 'comments', 'You have just received a comment for the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at:\n{comment_url}\n\nPosted by: {name}\nEmail: {email}\nURL: {url}\nLocation: {location}\n\n{comment}', NULL, 1469783780, 0),
(6, 1, 'y', 'mbr_activation_instructions', 'Enclosed is your activation code', 'email', 'members', 'Thank you for your new member registration.\n\nTo activate your new account, please visit the following URL:\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}\n\n{site_url}', NULL, 1469783780, 0),
(7, 1, 'y', 'forgot_password_instructions', 'Login information', 'email', 'members', '{name},\n\nTo reset your password, please go to the following page:\n\n{reset_url}\n\nThen log in with your username: {username}\n\nIf you do not wish to reset your password, ignore this message. It will expire in 24 hours.\n\n{site_name}\n{site_url}', NULL, 1469783780, 0),
(8, 1, 'y', 'validated_member_notify', 'Your membership account has been activated', 'email', 'members', '{name},\n\nYour membership account has been activated and is ready for use.\n\nThank You!\n\n{site_name}\n{site_url}', NULL, 1469783780, 0),
(9, 1, 'y', 'decline_member_validation', 'Your membership account has been declined', 'email', 'members', '{name},\n\nWe''re sorry but our staff has decided not to validate your membership.\n\n{site_name}\n{site_url}', NULL, 1469783780, 0),
(10, 1, 'y', 'comment_notification', 'Someone just responded to your comment', 'email', 'comments', '{name_of_commenter} just responded to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}', NULL, 1469783780, 0),
(11, 1, 'y', 'comments_opened_notification', 'New comments have been added', 'email', 'comments', 'Responses have been added to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comments at the following URL:\n{comment_url}\n\n{comments}\n{comment}\n{/comments}\n\nTo stop receiving notifications for this entry, click here:\n{notification_removal_url}', NULL, 1469783780, 0),
(12, 1, 'y', 'private_message_notification', 'Someone has sent you a Private Message', 'email', 'private_messages', '\n{recipient_name},\n\n{sender_name} has just sent you a Private Message titled ‘{message_subject}’.\n\nYou can see the Private Message by logging in and viewing your inbox at:\n{site_url}\n\nContent:\n\n{message_content}\n\nTo stop receiving notifications of Private Messages, turn the option off in your Email Settings.\n\n{site_name}\n{site_url}', NULL, 1469783780, 0),
(13, 1, 'y', 'pm_inbox_full', 'Your private message mailbox is full', 'email', 'private_messages', '{recipient_name},\n\n{sender_name} has just attempted to send you a Private Message,\nbut your inbox is full, exceeding the maximum of {pm_storage_limit}.\n\nPlease log in and remove unwanted messages from your inbox at:\n{site_url}', NULL, 1469783780, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_stats`
--

CREATE TABLE `exp_stats` (
  `stat_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `total_members` mediumint(7) NOT NULL DEFAULT '0',
  `recent_member_id` int(10) NOT NULL DEFAULT '0',
  `recent_member` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_comment_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_visitor_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `most_visitors` mediumint(7) NOT NULL DEFAULT '0',
  `most_visitor_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_cache_clear` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exp_stats`
--

INSERT INTO `exp_stats` (`stat_id`, `site_id`, `total_members`, `recent_member_id`, `recent_member`, `total_entries`, `total_forum_topics`, `total_forum_posts`, `total_comments`, `last_entry_date`, `last_forum_post_date`, `last_comment_date`, `last_visitor_date`, `most_visitors`, `most_visitor_date`, `last_cache_clear`) VALUES
(1, 1, 1, 1, 'inkavn', 0, 0, 0, 0, 1469783779, 0, 0, 1469975921, 2, 1469810512, 1469783779);

-- --------------------------------------------------------

--
-- Table structure for table `exp_statuses`
--

CREATE TABLE `exp_statuses` (
  `status_id` int(6) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `group_id` int(4) UNSIGNED NOT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status_order` int(3) UNSIGNED NOT NULL,
  `highlight` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exp_statuses`
--

INSERT INTO `exp_statuses` (`status_id`, `site_id`, `group_id`, `status`, `status_order`, `highlight`) VALUES
(1, 1, 1, 'open', 1, '009933'),
(2, 1, 1, 'closed', 2, '990000');

-- --------------------------------------------------------

--
-- Table structure for table `exp_status_groups`
--

CREATE TABLE `exp_status_groups` (
  `group_id` int(4) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `group_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exp_status_groups`
--

INSERT INTO `exp_status_groups` (`group_id`, `site_id`, `group_name`) VALUES
(1, 1, 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `exp_status_no_access`
--

CREATE TABLE `exp_status_no_access` (
  `status_id` int(6) UNSIGNED NOT NULL,
  `member_group` smallint(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_templates`
--

CREATE TABLE `exp_templates` (
  `template_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `group_id` int(6) UNSIGNED NOT NULL,
  `template_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `template_type` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'webpage',
  `template_data` mediumtext COLLATE utf8_unicode_ci,
  `template_notes` text COLLATE utf8_unicode_ci,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cache` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `refresh` int(6) UNSIGNED NOT NULL DEFAULT '0',
  `no_auth_bounce` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enable_http_auth` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `allow_php` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `php_parse_location` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'o',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `protect_javascript` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exp_templates`
--

INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `template_type`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`, `protect_javascript`) VALUES
(1, 1, 1, 'index', 'webpage', '{embed="embeds/header" title="Clothes Shop"}\n{embed="embeds/slide"}\n{embed="embeds/featured"}\n{embed="embeds/services"}\n{embed="embeds/testimonial"}\n{embed="embeds/blog"}\n{embed="embeds/footer"}', '', 1469812569, 1, 'n', 0, '1', 'n', 'y', 'o', 0, 'n'),
(2, 1, 2, 'index', 'webpage', '', NULL, 1469809061, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n'),
(3, 1, 2, 'main', 'css', '\n\n.mt10 {margin-top: 10px;}\n.mt20 {margin-top: 20px;}\nbody {font-family: Arial;}\n#header {background-color: #292a29;height: 60px;}\n.logo span {font-size:42px;color:#FFF;font-weight: 600;letter-spacing: 3px;}\n\n.navbar.navbar-default{float:right;background-color: #292a29;border-color: #292a29;border-radius: 0px;}\nul.nav.navbar-nav.ext-menu{padding:0px;}\nul.nav.navbar-nav.ext-menu li {}\nul.nav.navbar-nav.ext-menu > li > a {color:#FFF;border-right: 1px solid #fff;padding: 0px;margin-top: 15px;padding-right: 15px;padding-left: 15px;}\nul.nav.navbar-nav.ext-menu li:last-child a {border-right: none;padding-right: 0px;}\nul.nav.navbar-nav.ext-menu > li > a > b {padding-left:2px;}\n.navbar-default .navbar-nav>.active>a, .navbar-default .navbar-nav>.active>a:focus, .navbar-default .navbar-nav>.active>a:hover {color:#FFF;background-color: #292a29}\n.collapse.navbar-collapse {padding: 0px}\n.caret {margin-left: 5px;color:#f47107;}\n\n.dropdown-menu li a {color:#292a29 !important;}\n.dropdown-menu>li>a:focus, .dropdown-menu>li>a:hover {background-color: #f47107; color:#FFF!important;}\n\n\ndiv.slide > div.container {position: relative;}\n\n.btn-bs {color:#a87c71;}\n.customNavigation a {position: absolute;top: 45%;z-index: 2;font-size: 20px;border: 2px solid #a87c71;border-radius: 50%;height: 30px;width: 30px;padding-left: 9px;padding-top: 2px;text-decoration: none;cursor: pointer;}\n.customNavigation a.prev-bs {left:30px;}\n.customNavigation a.next-bs {right:30px;}\n\n.f-title{text-align: center;    position: relative;}\n.f-title span {text-align: center;text-transform: uppercase;font-size: 20px;font-weight: 600;overflow: hidden;}\n.f-title span:before,.f-title span:after {  background-color: #c2c2c2;content: "";display: inline-block;height: 1px;position: absolute;top:50%;vertical-align: middle;width: 40%;}\n.f-title span:before {right: 50%;margin-right: 10%;}\n.f-title span:after {left: 50%;margin-left: 10%;}\n.f-content {text-align: center;}\n.f-one {border: 1px solid #dedede;}\n.f-one-title {border: 1px solid #dedede;height: 50px;background: #f1f1f1;padding-top: 15px;}\n.f-one-title span {color: #fd3f3d;font-size: 18px;font-weight: 600;}\n\n.s-title{text-align: center;position: relative;}\n.s-title span {text-align: center;text-transform: uppercase;font-size: 20px;font-weight: 600;overflow: hidden;}\n.s-title span:before,.s-title span:after {  background-color: #c2c2c2;content: "";display: inline-block;height: 1px;position: absolute;top:50%;vertical-align: middle;width: 36%;}\n.s-title span:before {right: 50%;margin-right: 14%;}\n.s-title span:after {left: 50%;margin-left: 14%;}\n.s-content {text-align: center;}\n.s-one-title{padding-top: 20px;padding-bottom: 10px}\n.s-one-title span {color: #000;font-size: 18px;font-weight: 300;text-transform: uppercase;}\n.s-one-des {font-size: 13px;padding-left: 5%;padding-right: 5%;}\n\n.t-title{text-align: center;position: relative;}\n.t-title span {text-align: center;text-transform: uppercase;font-size: 20px;font-weight: 600;overflow: hidden;}\n.t-title span:before,.t-title span:after {  background-color: #c2c2c2;content: "";display: inline-block;height: 1px;position: absolute;top:50%;vertical-align: middle;width: 36%;}\n.t-title span:before {right: 50%;margin-right: 14%;}\n.t-title span:after {left: 50%;margin-left: 14%;}\n.t-feedback {padding-top: 20px;padding-bottom: 30px;border-radius: 10px;border:1px solid #dedede;}\n.t-feedback {background-image: url(images/uploads/t-bn.png), url(images/uploads/b.png);\n			 background-position: 20px 20px, 50% 100%;\n			 background-repeat: no-repeat;}\n.t-feedback p {height:80px;padding-left: 80px;font-size: 14px;font-style: italic;}\n.t-name {padding-left: 20px;}\n.t-name span {font-weight: 600;text-transform: capitalize;}\n.t-feedback:after{    content: "";\n    position: absolute;\n    top: 100%;\n    left: 50%;\n    border-top: 8px solid #ccc;\n    border-left: 8px solid transparent;\n    border-right: 8px solid transparent;\n    margin-left: -8px;}\n.t-avt{text-align: center;}\n.t-avt img {margin-top: 10px;display: inline !important;width: auto!important;}\n\n.b-title{text-align: center;position: relative;}\n.b-title span {text-align: center;text-transform: uppercase;font-size: 20px;font-weight: 600;overflow: hidden;}\n.b-title span:before,.b-title span:after {  background-color: #c2c2c2;content: "";display: inline-block;height: 1px;position: absolute;top:50%;vertical-align: middle;width: 40%;}\n.b-title span:before {right: 50%;margin-right: 10%;}\n.b-title span:after {left: 50%;margin-left: 10%;}\n.media {margin-bottom: 15px;}\n.media-left {padding-right: 20px;}\n.media-heading {font-weight: 600;}\n.media-body a {text-decoration: none;}\n.media-body a h5{color:#000;}\n.media-body a p{color:#666666;}\n.media-body a h5:hover {color:#df2228;}\n.media-body a p:hover {;color:#006666;}\n.media-body p {padding-top: 10px;padding-bottom: 10px;font-size: 13px;width: 85%;height: 68px;overflow: hidden;line-height: 1.5;}\n\n.footer {background-color: #292a29;margin-top: 50px;color: #FFF}\n.ftb-title{border-bottom: 1px solid #fff;padding-bottom: 5px;}\n.ftb-title span{font-size: 18px;text-transform: uppercase;line-height: 1.8;}\n.footer-block ul {padding-top: 10px;padding-left: 0px;list-style: none;}\n.footer-block ul li a {color:#fff;text-decoration: none;font-size: 13px;}\n.footer-block ul li a:hover {color: #337ab7;}\n.about-menu{padding-right: 30px;}\n.cus-menu{padding-left: 50px;padding-right: 30px;}\n.social-menu {padding-left: 50px;padding-right: 30px}\n\nul.social {padding-top: 20px;}\nul.social li {float:left;padding-right: 26px;}\nul.social li:last-child{padding-right: 0px;float:right;}', '', 1469814123, 1, 'n', 0, '1', 'n', 'n', 'o', 0, 'n'),
(4, 1, 3, 'index', 'webpage', '', NULL, 1469809782, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n');
INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `template_type`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`, `protect_javascript`) VALUES
(5, 1, 3, 'bootstrap.min', 'css', '/*!\n * Bootstrap v3.3.6 (http://getbootstrap.com)\n * Copyright 2011-2015 Twitter, Inc.\n * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)\n *//*! normalize.css v3.0.3 | MIT License | github.com/necolas/normalize.css */html{font-family:sans-serif;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%}body{margin:0}article,aside,details,figcaption,figure,footer,header,hgroup,main,menu,nav,section,summary{display:block}audio,canvas,progress,video{display:inline-block;vertical-align:baseline}audio:not([controls]){display:none;height:0}[hidden],template{display:none}a{background-color:transparent}a:active,a:hover{outline:0}abbr[title]{border-bottom:1px dotted}b,strong{font-weight:700}dfn{font-style:italic}h1{margin:.67em 0;font-size:2em}mark{color:#000;background:#ff0}small{font-size:80%}sub,sup{position:relative;font-size:75%;line-height:0;vertical-align:baseline}sup{top:-.5em}sub{bottom:-.25em}img{border:0}svg:not(:root){overflow:hidden}figure{margin:1em 40px}hr{height:0;-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box}pre{overflow:auto}code,kbd,pre,samp{font-family:monospace,monospace;font-size:1em}button,input,optgroup,select,textarea{margin:0;font:inherit;color:inherit}button{overflow:visible}button,select{text-transform:none}button,html input[type=button],input[type=reset],input[type=submit]{-webkit-appearance:button;cursor:pointer}button[disabled],html input[disabled]{cursor:default}button::-moz-focus-inner,input::-moz-focus-inner{padding:0;border:0}input{line-height:normal}input[type=checkbox],input[type=radio]{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;padding:0}input[type=number]::-webkit-inner-spin-button,input[type=number]::-webkit-outer-spin-button{height:auto}input[type=search]{-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box;-webkit-appearance:textfield}input[type=search]::-webkit-search-cancel-button,input[type=search]::-webkit-search-decoration{-webkit-appearance:none}fieldset{padding:.35em .625em .75em;margin:0 2px;border:1px solid silver}legend{padding:0;border:0}textarea{overflow:auto}optgroup{font-weight:700}table{border-spacing:0;border-collapse:collapse}td,th{padding:0}/*! Source: https://github.com/h5bp/html5-boilerplate/blob/master/src/css/main.css */@media print{*,:after,:before{color:#000!important;text-shadow:none!important;background:0 0!important;-webkit-box-shadow:none!important;box-shadow:none!important}a,a:visited{text-decoration:underline}a[href]:after{content:" (" attr(href) ")"}abbr[title]:after{content:" (" attr(title) ")"}a[href^="javascript:"]:after,a[href^="#"]:after{content:""}blockquote,pre{border:1px solid #999;page-break-inside:avoid}thead{display:table-header-group}img,tr{page-break-inside:avoid}img{max-width:100%!important}h2,h3,p{orphans:3;widows:3}h2,h3{page-break-after:avoid}.navbar{display:none}.btn>.caret,.dropup>.btn>.caret{border-top-color:#000!important}.label{border:1px solid #000}.table{border-collapse:collapse!important}.table td,.table th{background-color:#fff!important}.table-bordered td,.table-bordered th{border:1px solid #ddd!important}}@font-face{font-family:''Glyphicons Halflings'';src:url(../fonts/glyphicons-halflings-regular.eot);src:url(../fonts/glyphicons-halflings-regular.eot?#iefix) format(''embedded-opentype''),url(../fonts/glyphicons-halflings-regular.woff2) format(''woff2''),url(../fonts/glyphicons-halflings-regular.woff) format(''woff''),url(../fonts/glyphicons-halflings-regular.ttf) format(''truetype''),url(../fonts/glyphicons-halflings-regular.svg#glyphicons_halflingsregular) format(''svg'')}.glyphicon{position:relative;top:1px;display:inline-block;font-family:''Glyphicons Halflings'';font-style:normal;font-weight:400;line-height:1;-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale}.glyphicon-asterisk:before{content:"\\002a"}.glyphicon-plus:before{content:"\\002b"}.glyphicon-eur:before,.glyphicon-euro:before{content:"\\20ac"}.glyphicon-minus:before{content:"\\2212"}.glyphicon-cloud:before{content:"\\2601"}.glyphicon-envelope:before{content:"\\2709"}.glyphicon-pencil:before{content:"\\270f"}.glyphicon-glass:before{content:"\\e001"}.glyphicon-music:before{content:"\\e002"}.glyphicon-search:before{content:"\\e003"}.glyphicon-heart:before{content:"\\e005"}.glyphicon-star:before{content:"\\e006"}.glyphicon-star-empty:before{content:"\\e007"}.glyphicon-user:before{content:"\\e008"}.glyphicon-film:before{content:"\\e009"}.glyphicon-th-large:before{content:"\\e010"}.glyphicon-th:before{content:"\\e011"}.glyphicon-th-list:before{content:"\\e012"}.glyphicon-ok:before{content:"\\e013"}.glyphicon-remove:before{content:"\\e014"}.glyphicon-zoom-in:before{content:"\\e015"}.glyphicon-zoom-out:before{content:"\\e016"}.glyphicon-off:before{content:"\\e017"}.glyphicon-signal:before{content:"\\e018"}.glyphicon-cog:before{content:"\\e019"}.glyphicon-trash:before{content:"\\e020"}.glyphicon-home:before{content:"\\e021"}.glyphicon-file:before{content:"\\e022"}.glyphicon-time:before{content:"\\e023"}.glyphicon-road:before{content:"\\e024"}.glyphicon-download-alt:before{content:"\\e025"}.glyphicon-download:before{content:"\\e026"}.glyphicon-upload:before{content:"\\e027"}.glyphicon-inbox:before{content:"\\e028"}.glyphicon-play-circle:before{content:"\\e029"}.glyphicon-repeat:before{content:"\\e030"}.glyphicon-refresh:before{content:"\\e031"}.glyphicon-list-alt:before{content:"\\e032"}.glyphicon-lock:before{content:"\\e033"}.glyphicon-flag:before{content:"\\e034"}.glyphicon-headphones:before{content:"\\e035"}.glyphicon-volume-off:before{content:"\\e036"}.glyphicon-volume-down:before{content:"\\e037"}.glyphicon-volume-up:before{content:"\\e038"}.glyphicon-qrcode:before{content:"\\e039"}.glyphicon-barcode:before{content:"\\e040"}.glyphicon-tag:before{content:"\\e041"}.glyphicon-tags:before{content:"\\e042"}.glyphicon-book:before{content:"\\e043"}.glyphicon-bookmark:before{content:"\\e044"}.glyphicon-print:before{content:"\\e045"}.glyphicon-camera:before{content:"\\e046"}.glyphicon-font:before{content:"\\e047"}.glyphicon-bold:before{content:"\\e048"}.glyphicon-italic:before{content:"\\e049"}.glyphicon-text-height:before{content:"\\e050"}.glyphicon-text-width:before{content:"\\e051"}.glyphicon-align-left:before{content:"\\e052"}.glyphicon-align-center:before{content:"\\e053"}.glyphicon-align-right:before{content:"\\e054"}.glyphicon-align-justify:before{content:"\\e055"}.glyphicon-list:before{content:"\\e056"}.glyphicon-indent-left:before{content:"\\e057"}.glyphicon-indent-right:before{content:"\\e058"}.glyphicon-facetime-video:before{content:"\\e059"}.glyphicon-picture:before{content:"\\e060"}.glyphicon-map-marker:before{content:"\\e062"}.glyphicon-adjust:before{content:"\\e063"}.glyphicon-tint:before{content:"\\e064"}.glyphicon-edit:before{content:"\\e065"}.glyphicon-share:before{content:"\\e066"}.glyphicon-check:before{content:"\\e067"}.glyphicon-move:before{content:"\\e068"}.glyphicon-step-backward:before{content:"\\e069"}.glyphicon-fast-backward:before{content:"\\e070"}.glyphicon-backward:before{content:"\\e071"}.glyphicon-play:before{content:"\\e072"}.glyphicon-pause:before{content:"\\e073"}.glyphicon-stop:before{content:"\\e074"}.glyphicon-forward:before{content:"\\e075"}.glyphicon-fast-forward:before{content:"\\e076"}.glyphicon-step-forward:before{content:"\\e077"}.glyphicon-eject:before{content:"\\e078"}.glyphicon-chevron-left:before{content:"\\e079"}.glyphicon-chevron-right:before{content:"\\e080"}.glyphicon-plus-sign:before{content:"\\e081"}.glyphicon-minus-sign:before{content:"\\e082"}.glyphicon-remove-sign:before{content:"\\e083"}.glyphicon-ok-sign:before{content:"\\e084"}.glyphicon-question-sign:before{content:"\\e085"}.glyphicon-info-sign:before{content:"\\e086"}.glyphicon-screenshot:before{content:"\\e087"}.glyphicon-remove-circle:before{content:"\\e088"}.glyphicon-ok-circle:before{content:"\\e089"}.glyphicon-ban-circle:before{content:"\\e090"}.glyphicon-arrow-left:before{content:"\\e091"}.glyphicon-arrow-right:before{content:"\\e092"}.glyphicon-arrow-up:before{content:"\\e093"}.glyphicon-arrow-down:before{content:"\\e094"}.glyphicon-share-alt:before{content:"\\e095"}.glyphicon-resize-full:before{content:"\\e096"}.glyphicon-resize-small:before{content:"\\e097"}.glyphicon-exclamation-sign:before{content:"\\e101"}.glyphicon-gift:before{content:"\\e102"}.glyphicon-leaf:before{content:"\\e103"}.glyphicon-fire:before{content:"\\e104"}.glyphicon-eye-open:before{content:"\\e105"}.glyphicon-eye-close:before{content:"\\e106"}.glyphicon-warning-sign:before{content:"\\e107"}.glyphicon-plane:before{content:"\\e108"}.glyphicon-calendar:before{content:"\\e109"}.glyphicon-random:before{content:"\\e110"}.glyphicon-comment:before{content:"\\e111"}.glyphicon-magnet:before{content:"\\e112"}.glyphicon-chevron-up:before{content:"\\e113"}.glyphicon-chevron-down:before{content:"\\e114"}.glyphicon-retweet:before{content:"\\e115"}.glyphicon-shopping-cart:before{content:"\\e116"}.glyphicon-folder-close:before{content:"\\e117"}.glyphicon-folder-open:before{content:"\\e118"}.glyphicon-resize-vertical:before{content:"\\e119"}.glyphicon-resize-horizontal:before{content:"\\e120"}.glyphicon-hdd:before{content:"\\e121"}.glyphicon-bullhorn:before{content:"\\e122"}.glyphicon-bell:before{content:"\\e123"}.glyphicon-certificate:before{content:"\\e124"}.glyphicon-thumbs-up:before{content:"\\e125"}.glyphicon-thumbs-down:before{content:"\\e126"}.glyphicon-hand-right:before{content:"\\e127"}.glyphicon-hand-left:before{content:"\\e128"}.glyphicon-hand-up:before{content:"\\e129"}.glyphicon-hand-down:before{content:"\\e130"}.glyphicon-circle-arrow-right:before{content:"\\e131"}.glyphicon-circle-arrow-left:before{content:"\\e132"}.glyphicon-circle-arrow-up:before{content:"\\e133"}.glyphicon-circle-arrow-down:before{content:"\\e134"}.glyphicon-globe:before{content:"\\e135"}.glyphicon-wrench:before{content:"\\e136"}.glyphicon-tasks:before{content:"\\e137"}.glyphicon-filter:before{content:"\\e138"}.glyphicon-briefcase:before{content:"\\e139"}.glyphicon-fullscreen:before{content:"\\e140"}.glyphicon-dashboard:before{content:"\\e141"}.glyphicon-paperclip:before{content:"\\e142"}.glyphicon-heart-empty:before{content:"\\e143"}.glyphicon-link:before{content:"\\e144"}.glyphicon-phone:before{content:"\\e145"}.glyphicon-pushpin:before{content:"\\e146"}.glyphicon-usd:before{content:"\\e148"}.glyphicon-gbp:before{content:"\\e149"}.glyphicon-sort:before{content:"\\e150"}.glyphicon-sort-by-alphabet:before{content:"\\e151"}.glyphicon-sort-by-alphabet-alt:before{content:"\\e152"}.glyphicon-sort-by-order:before{content:"\\e153"}.glyphicon-sort-by-order-alt:before{content:"\\e154"}.glyphicon-sort-by-attributes:before{content:"\\e155"}.glyphicon-sort-by-attributes-alt:before{content:"\\e156"}.glyphicon-unchecked:before{content:"\\e157"}.glyphicon-expand:before{content:"\\e158"}.glyphicon-collapse-down:before{content:"\\e159"}.glyphicon-collapse-up:before{content:"\\e160"}.glyphicon-log-in:before{content:"\\e161"}.glyphicon-flash:before{content:"\\e162"}.glyphicon-log-out:before{content:"\\e163"}.glyphicon-new-window:before{content:"\\e164"}.glyphicon-record:before{content:"\\e165"}.glyphicon-save:before{content:"\\e166"}.glyphicon-open:before{content:"\\e167"}.glyphicon-saved:before{content:"\\e168"}.glyphicon-import:before{content:"\\e169"}.glyphicon-export:before{content:"\\e170"}.glyphicon-send:before{content:"\\e171"}.glyphicon-floppy-disk:before{content:"\\e172"}.glyphicon-floppy-saved:before{content:"\\e173"}.glyphicon-floppy-remove:before{content:"\\e174"}.glyphicon-floppy-save:before{content:"\\e175"}.glyphicon-floppy-open:before{content:"\\e176"}.glyphicon-credit-card:before{content:"\\e177"}.glyphicon-transfer:before{content:"\\e178"}.glyphicon-cutlery:before{content:"\\e179"}.glyphicon-header:before{content:"\\e180"}.glyphicon-compressed:before{content:"\\e181"}.glyphicon-earphone:before{content:"\\e182"}.glyphicon-phone-alt:before{content:"\\e183"}.glyphicon-tower:before{content:"\\e184"}.glyphicon-stats:before{content:"\\e185"}.glyphicon-sd-video:before{content:"\\e186"}.glyphicon-hd-video:before{content:"\\e187"}.glyphicon-subtitles:before{content:"\\e188"}.glyphicon-sound-stereo:before{content:"\\e189"}.glyphicon-sound-dolby:before{content:"\\e190"}.glyphicon-sound-5-1:before{content:"\\e191"}.glyphicon-sound-6-1:before{content:"\\e192"}.glyphicon-sound-7-1:before{content:"\\e193"}.glyphicon-copyright-mark:before{content:"\\e194"}.glyphicon-registration-mark:before{content:"\\e195"}.glyphicon-cloud-download:before{content:"\\e197"}.glyphicon-cloud-upload:before{content:"\\e198"}.glyphicon-tree-conifer:before{content:"\\e199"}.glyphicon-tree-deciduous:before{content:"\\e200"}.glyphicon-cd:before{content:"\\e201"}.glyphicon-save-file:before{content:"\\e202"}.glyphicon-open-file:before{content:"\\e203"}.glyphicon-level-up:before{content:"\\e204"}.glyphicon-copy:before{content:"\\e205"}.glyphicon-paste:before{content:"\\e206"}.glyphicon-alert:before{content:"\\e209"}.glyphicon-equalizer:before{content:"\\e210"}.glyphicon-king:before{content:"\\e211"}.glyphicon-queen:before{content:"\\e212"}.glyphicon-pawn:before{content:"\\e213"}.glyphicon-bishop:before{content:"\\e214"}.glyphicon-knight:before{content:"\\e215"}.glyphicon-baby-formula:before{content:"\\e216"}.glyphicon-tent:before{content:"\\26fa"}.glyphicon-blackboard:before{content:"\\e218"}.glyphicon-bed:before{content:"\\e219"}.glyphicon-apple:before{content:"\\f8ff"}.glyphicon-erase:before{content:"\\e221"}.glyphicon-hourglass:before{content:"\\231b"}.glyphicon-lamp:before{content:"\\e223"}.glyphicon-duplicate:before{content:"\\e224"}.glyphicon-piggy-bank:before{content:"\\e225"}.glyphicon-scissors:before{content:"\\e226"}.glyphicon-bitcoin:before{content:"\\e227"}.glyphicon-btc:before{content:"\\e227"}.glyphicon-xbt:before{content:"\\e227"}.glyphicon-yen:before{content:"\\00a5"}.glyphicon-jpy:before{content:"\\00a5"}.glyphicon-ruble:before{content:"\\20bd"}.glyphicon-rub:before{content:"\\20bd"}.glyphicon-scale:before{content:"\\e230"}.glyphicon-ice-lolly:before{content:"\\e231"}.glyphicon-ice-lolly-tasted:before{content:"\\e232"}.glyphicon-education:before{content:"\\e233"}.glyphicon-option-horizontal:before{content:"\\e234"}.glyphicon-option-vertical:before{content:"\\e235"}.glyphicon-menu-hamburger:before{content:"\\e236"}.glyphicon-modal-window:before{content:"\\e237"}.glyphicon-oil:before{content:"\\e238"}.glyphicon-grain:before{content:"\\e239"}.glyphicon-sunglasses:before{content:"\\e240"}.glyphicon-text-size:before{content:"\\e241"}.glyphicon-text-color:before{content:"\\e242"}.glyphicon-text-background:before{content:"\\e243"}.glyphicon-object-align-top:before{content:"\\e244"}.glyphicon-object-align-bottom:before{content:"\\e245"}.glyphicon-object-align-horizontal:before{content:"\\e246"}.glyphicon-object-align-left:before{content:"\\e247"}.glyphicon-object-align-vertical:before{content:"\\e248"}.glyphicon-object-align-right:before{content:"\\e249"}.glyphicon-triangle-right:before{content:"\\e250"}.glyphicon-triangle-left:before{content:"\\e251"}.glyphicon-triangle-bottom:before{content:"\\e252"}.glyphicon-triangle-top:before{content:"\\e253"}.glyphicon-console:before{content:"\\e254"}.glyphicon-superscript:before{content:"\\e255"}.glyphicon-subscript:before{content:"\\e256"}.glyphicon-menu-left:before{content:"\\e257"}.glyphicon-menu-right:before{content:"\\e258"}.glyphicon-menu-down:before{content:"\\e259"}.glyphicon-menu-up:before{content:"\\e260"}*{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}:after,:before{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}html{font-size:10px;-webkit-tap-highlight-color:rgba(0,0,0,0)}body{font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;font-size:14px;line-height:1.42857143;color:#333;background-color:#fff}button,input,select,textarea{font-family:inherit;font-size:inherit;line-height:inherit}a{color:#337ab7;text-decoration:none}a:focus,a:hover{color:#23527c;text-decoration:underline}a:focus{outline:thin dotted;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px}figure{margin:0}img{vertical-align:middle}.carousel-inner>.item>a>img,.carousel-inner>.item>img,.img-responsive,.thumbnail a>img,.thumbnail>img{display:block;max-width:100%;height:auto}.img-rounded{border-radius:6px}.img-thumbnail{display:inline-block;max-width:100%;height:auto;padding:4px;line-height:1.42857143;background-color:#fff;border:1px solid #ddd;border-radius:4px;-webkit-transition:all .2s ease-in-out;-o-transition:all .2s ease-in-out;transition:all .2s ease-in-out}.img-circle{border-radius:50%}hr{margin-top:20px;margin-bottom:20px;border:0;border-top:1px solid #eee}.sr-only{position:absolute;width:1px;height:1px;padding:0;margin:-1px;overflow:hidden;clip:rect(0,0,0,0);border:0}.sr-only-focusable:active,.sr-only-focusable:focus{position:static;width:auto;height:auto;margin:0;overflow:visible;clip:auto}[role=button]{cursor:pointer}.h1,.h2,.h3,.h4,.h5,.h6,h1,h2,h3,h4,h5,h6{font-family:inherit;font-weight:500;line-height:1.1;color:inherit}.h1 .small,.h1 small,.h2 .small,.h2 small,.h3 .small,.h3 small,.h4 .small,.h4 small,.h5 .small,.h5 small,.h6 .small,.h6 small,h1 .small,h1 small,h2 .small,h2 small,h3 .small,h3 small,h4 .small,h4 small,h5 .small,h5 small,h6 .small,h6 small{font-weight:400;line-height:1;color:#777}.h1,.h2,.h3,h1,h2,h3{margin-top:20px;margin-bottom:10px}.h1 .small,.h1 small,.h2 .small,.h2 small,.h3 .small,.h3 small,h1 .small,h1 small,h2 .small,h2 small,h3 .small,h3 small{font-size:65%}.h4,.h5,.h6,h4,h5,h6{margin-top:10px;margin-bottom:10px}.h4 .small,.h4 small,.h5 .small,.h5 small,.h6 .small,.h6 small,h4 .small,h4 small,h5 .small,h5 small,h6 .small,h6 small{font-size:75%}.h1,h1{font-size:36px}.h2,h2{font-size:30px}.h3,h3{font-size:24px}.h4,h4{font-size:18px}.h5,h5{font-size:14px}.h6,h6{font-size:12px}p{margin:0 0 10px}.lead{margin-bottom:20px;font-size:16px;font-weight:300;line-height:1.4}@media (min-width:768px){.lead{font-size:21px}}.small,small{font-size:85%}.mark,mark{padding:.2em;background-color:#fcf8e3}.text-left{text-align:left}.text-right{text-align:right}.text-center{text-align:center}.text-justify{text-align:justify}.text-nowrap{white-space:nowrap}.text-lowercase{text-transform:lowercase}.text-uppercase{text-transform:uppercase}.text-capitalize{text-transform:capitalize}.text-muted{color:#777}.text-primary{color:#337ab7}a.text-primary:focus,a.text-primary:hover{color:#286090}.text-success{color:#3c763d}a.text-success:focus,a.text-success:hover{color:#2b542c}.text-info{color:#31708f}a.text-info:focus,a.text-info:hover{color:#245269}.text-warning{color:#8a6d3b}a.text-warning:focus,a.text-warning:hover{color:#66512c}.text-danger{color:#a94442}a.text-danger:focus,a.text-danger:hover{color:#843534}.bg-primary{color:#fff;background-color:#337ab7}a.bg-primary:focus,a.bg-primary:hover{background-color:#286090}.bg-success{background-color:#dff0d8}a.bg-success:focus,a.bg-success:hover{background-color:#c1e2b3}.bg-info{background-color:#d9edf7}a.bg-info:focus,a.bg-info:hover{background-color:#afd9ee}.bg-warning{background-color:#fcf8e3}a.bg-warning:focus,a.bg-warning:hover{background-color:#f7ecb5}.bg-danger{background-color:#f2dede}a.bg-danger:focus,a.bg-danger:hover{background-color:#e4b9b9}.page-header{padding-bottom:9px;margin:40px 0 20px;border-bottom:1px solid #eee}ol,ul{margin-top:0;margin-bottom:10px}ol ol,ol ul,ul ol,ul ul{margin-bottom:0}.list-unstyled{padding-left:0;list-style:none}.list-inline{padding-left:0;margin-left:-5px;list-style:none}.list-inline>li{display:inline-block;padding-right:5px;padding-left:5px}dl{margin-top:0;margin-bottom:20px}dd,dt{line-height:1.42857143}dt{font-weight:700}dd{margin-left:0}@media (min-width:768px){.dl-horizontal dt{float:left;width:160px;overflow:hidden;clear:left;text-align:right;text-overflow:ellipsis;white-space:nowrap}.dl-horizontal dd{margin-left:180px}}abbr[data-original-title],abbr[title]{cursor:help;border-bottom:1px dotted #777}.initialism{font-size:90%;text-transform:uppercase}blockquote{padding:10px 20px;margin:0 0 20px;font-size:17.5px;border-left:5px solid #eee}blockquote ol:last-child,blockquote p:last-child,blockquote ul:last-child{margin-bottom:0}blockquote .small,blockquote footer,blockquote small{display:block;font-size:80%;line-height:1.42857143;color:#777}blockquote .small:before,blockquote footer:before,blockquote small:before{content:''\\2014 \\00A0''}.blockquote-reverse,blockquote.pull-right{padding-right:15px;padding-left:0;text-align:right;border-right:5px solid #eee;border-left:0}.blockquote-reverse .small:before,.blockquote-reverse footer:before,.blockquote-reverse small:before,blockquote.pull-right .small:before,blockquote.pull-right footer:before,blockquote.pull-right small:before{content:''''}.blockquote-reverse .small:after,.blockquote-reverse footer:after,.blockquote-reverse small:after,blockquote.pull-right .small:after,blockquote.pull-right footer:after,blockquote.pull-right small:after{content:''\\00A0 \\2014''}address{margin-bottom:20px;font-style:normal;line-height:1.42857143}code,kbd,pre,samp{font-family:Menlo,Monaco,Consolas,"Courier New",monospace}code{padding:2px 4px;font-size:90%;color:#c7254e;background-color:#f9f2f4;border-radius:4px}kbd{padding:2px 4px;font-size:90%;color:#fff;background-color:#333;border-radius:3px;-webkit-box-shadow:inset 0 -1px 0 rgba(0,0,0,.25);box-shadow:inset 0 -1px 0 rgba(0,0,0,.25)}kbd kbd{padding:0;font-size:100%;font-weight:700;-webkit-box-shadow:none;box-shadow:none}pre{display:block;padding:9.5px;margin:0 0 10px;font-size:13px;line-height:1.42857143;color:#333;word-break:break-all;word-wrap:break-word;background-color:#f5f5f5;border:1px solid #ccc;border-radius:4px}pre code{padding:0;font-size:inherit;color:inherit;white-space:pre-wrap;background-color:transparent;border-radius:0}.pre-scrollable{max-height:340px;overflow-y:scroll}.container{padding-right:15px;padding-left:15px;margin-right:auto;margin-left:auto}@media (min-width:768px){.container{width:750px}}@media (min-width:992px){.container{width:970px}}@media (min-width:1200px){.container{width:1170px}}.container-fluid{padding-right:15px;padding-left:15px;margin-right:auto;margin-left:auto}.row{margin-right:-15px;margin-left:-15px}.col-lg-1,.col-lg-10,.col-lg-11,.col-lg-12,.col-lg-2,.col-lg-3,.col-lg-4,.col-lg-5,.col-lg-6,.col-lg-7,.col-lg-8,.col-lg-9,.col-md-1,.col-md-10,.col-md-11,.col-md-12,.col-md-2,.col-md-3,.col-md-4,.col-md-5,.col-md-6,.col-md-7,.col-md-8,.col-md-9,.col-sm-1,.col-sm-10,.col-sm-11,.col-sm-12,.col-sm-2,.col-sm-3,.col-sm-4,.col-sm-5,.col-sm-6,.col-sm-7,.col-sm-8,.col-sm-9,.col-xs-1,.col-xs-10,.col-xs-11,.col-xs-12,.col-xs-2,.col-xs-3,.col-xs-4,.col-xs-5,.col-xs-6,.col-xs-7,.col-xs-8,.col-xs-9{position:relative;min-height:1px;padding-right:15px;padding-left:15px}.col-xs-1,.col-xs-10,.col-xs-11,.col-xs-12,.col-xs-2,.col-xs-3,.col-xs-4,.col-xs-5,.col-xs-6,.col-xs-7,.col-xs-8,.col-xs-9{float:left}.col-xs-12{width:100%}.col-xs-11{width:91.66666667%}.col-xs-10{width:83.33333333%}.col-xs-9{width:75%}.col-xs-8{width:66.66666667%}.col-xs-7{width:58.33333333%}.col-xs-6{width:50%}.col-xs-5{width:41.66666667%}.col-xs-4{width:33.33333333%}.col-xs-3{width:25%}.col-xs-2{width:16.66666667%}.col-xs-1{width:8.33333333%}.col-xs-pull-12{right:100%}.col-xs-pull-11{right:91.66666667%}.col-xs-pull-10{right:83.33333333%}.col-xs-pull-9{right:75%}.col-xs-pull-8{right:66.66666667%}.col-xs-pull-7{right:58.33333333%}.col-xs-pull-6{right:50%}.col-xs-pull-5{right:41.66666667%}.col-xs-pull-4{right:33.33333333%}.col-xs-pull-3{right:25%}.col-xs-pull-2{right:16.66666667%}.col-xs-pull-1{right:8.33333333%}.col-xs-pull-0{right:auto}.col-xs-push-12{left:100%}.col-xs-push-11{left:91.66666667%}.col-xs-push-10{left:83.33333333%}.col-xs-push-9{left:75%}.col-xs-push-8{left:66.66666667%}.col-xs-push-7{left:58.33333333%}.col-xs-push-6{left:50%}.col-xs-push-5{left:41.66666667%}.col-xs-push-4{left:33.33333333%}.col-xs-push-3{left:25%}.col-xs-push-2{left:16.66666667%}.col-xs-push-1{left:8.33333333%}.col-xs-push-0{left:auto}.col-xs-offset-12{margin-left:100%}.col-xs-offset-11{margin-left:91.66666667%}.col-xs-offset-10{margin-left:83.33333333%}.col-xs-offset-9{margin-left:75%}.col-xs-offset-8{margin-left:66.66666667%}.col-xs-offset-7{margin-left:58.33333333%}.col-xs-offset-6{margin-left:50%}.col-xs-offset-5{margin-left:41.66666667%}.col-xs-offset-4{margin-left:33.33333333%}.col-xs-offset-3{margin-left:25%}.col-xs-offset-2{margin-left:16.66666667%}.col-xs-offset-1{margin-left:8.33333333%}.col-xs-offset-0{margin-left:0}@media (min-width:768px){.col-sm-1,.col-sm-10,.col-sm-11,.col-sm-12,.col-sm-2,.col-sm-3,.col-sm-4,.col-sm-5,.col-sm-6,.col-sm-7,.col-sm-8,.col-sm-9{float:left}.col-sm-12{width:100%}.col-sm-11{width:91.66666667%}.col-sm-10{width:83.33333333%}.col-sm-9{width:75%}.col-sm-8{width:66.66666667%}.col-sm-7{width:58.33333333%}.col-sm-6{width:50%}.col-sm-5{width:41.66666667%}.col-sm-4{width:33.33333333%}.col-sm-3{width:25%}.col-sm-2{width:16.66666667%}.col-sm-1{width:8.33333333%}.col-sm-pull-12{right:100%}.col-sm-pull-11{right:91.66666667%}.col-sm-pull-10{right:83.33333333%}.col-sm-pull-9{right:75%}.col-sm-pull-8{right:66.66666667%}.col-sm-pull-7{right:58.33333333%}.col-sm-pull-6{right:50%}.col-sm-pull-5{right:41.66666667%}.col-sm-pull-4{right:33.33333333%}.col-sm-pull-3{right:25%}.col-sm-pull-2{right:16.66666667%}.col-sm-pull-1{right:8.33333333%}.col-sm-pull-0{right:auto}.col-sm-push-12{left:100%}.col-sm-push-11{left:91.66666667%}.col-sm-push-10{left:83.33333333%}.col-sm-push-9{left:75%}.col-sm-push-8{left:66.66666667%}.col-sm-push-7{left:58.33333333%}.col-sm-push-6{left:50%}.col-sm-push-5{left:41.66666667%}.col-sm-push-4{left:33.33333333%}.col-sm-push-3{left:25%}.col-sm-push-2{left:16.66666667%}.col-sm-push-1{left:8.33333333%}.col-sm-push-0{left:auto}.col-sm-offset-12{margin-left:100%}.col-sm-offset-11{margin-left:91.66666667%}.col-sm-offset-10{margin-left:83.33333333%}.col-sm-offset-9{margin-left:75%}.col-sm-offset-8{margin-left:66.66666667%}.col-sm-offset-7{margin-left:58.33333333%}.col-sm-offset-6{margin-left:50%}.col-sm-offset-5{margin-left:41.66666667%}.col-sm-offset-4{margin-left:33.33333333%}.col-sm-offset-3{margin-left:25%}.col-sm-offset-2{margin-left:16.66666667%}.col-sm-offset-1{margin-left:8.33333333%}.col-sm-offset-0{margin-left:0}}@media (min-width:992px){.col-md-1,.col-md-10,.col-md-11,.col-md-12,.col-md-2,.col-md-3,.col-md-4,.col-md-5,.col-md-6,.col-md-7,.col-md-8,.col-md-9{float:left}.col-md-12{width:100%}.col-md-11{width:91.66666667%}.col-md-10{width:83.33333333%}.col-md-9{width:75%}.col-md-8{width:66.66666667%}.col-md-7{width:58.33333333%}.col-md-6{width:50%}.col-md-5{width:41.66666667%}.col-md-4{width:33.33333333%}.col-md-3{width:25%}.col-md-2{width:16.66666667%}.col-md-1{width:8.33333333%}.col-md-pull-12{right:100%}.col-md-pull-11{right:91.66666667%}.col-md-pull-10{right:83.33333333%}.col-md-pull-9{right:75%}.col-md-pull-8{right:66.66666667%}.col-md-pull-7{right:58.33333333%}.col-md-pull-6{right:50%}.col-md-pull-5{right:41.66666667%}.col-md-pull-4{right:33.33333333%}.col-md-pull-3{right:25%}.col-md-pull-2{right:16.66666667%}.col-md-pull-1{right:8.33333333%}.col-md-pull-0{right:auto}.col-md-push-12{left:100%}.col-md-push-11{left:91.66666667%}.col-md-push-10{left:83.33333333%}.col-md-push-9{left:75%}.col-md-push-8{left:66.66666667%}.col-md-push-7{left:58.33333333%}.col-md-push-6{left:50%}.col-md-push-5{left:41.66666667%}.col-md-push-4{left:33.33333333%}.col-md-push-3{left:25%}.col-md-push-2{left:16.66666667%}.col-md-push-1{left:8.33333333%}.col-md-push-0{left:auto}.col-md-offset-12{margin-left:100%}.col-md-offset-11{margin-left:91.66666667%}.col-md-offset-10{margin-left:83.33333333%}.col-md-offset-9{margin-left:75%}.col-md-offset-8{margin-left:66.66666667%}.col-md-offset-7{margin-left:58.33333333%}.col-md-offset-6{margin-left:50%}.col-md-offset-5{margin-left:41.66666667%}.col-md-offset-4{margin-left:33.33333333%}.col-md-offset-3{margin-left:25%}.col-md-offset-2{margin-left:16.66666667%}.col-md-offset-1{margin-left:8.33333333%}.col-md-offset-0{margin-left:0}}@media (min-width:1200px){.col-lg-1,.col-lg-10,.col-lg-11,.col-lg-12,.col-lg-2,.col-lg-3,.col-lg-4,.col-lg-5,.col-lg-6,.col-lg-7,.col-lg-8,.col-lg-9{float:left}.col-lg-12{width:100%}.col-lg-11{width:91.66666667%}.col-lg-10{width:83.33333333%}.col-lg-9{width:75%}.col-lg-8{width:66.66666667%}.col-lg-7{width:58.33333333%}.col-lg-6{width:50%}.col-lg-5{width:41.66666667%}.col-lg-4{width:33.33333333%}.col-lg-3{width:25%}.col-lg-2{width:16.66666667%}.col-lg-1{width:8.33333333%}.col-lg-pull-12{right:100%}.col-lg-pull-11{right:91.66666667%}.col-lg-pull-10{right:83.33333333%}.col-lg-pull-9{right:75%}.col-lg-pull-8{right:66.66666667%}.col-lg-pull-7{right:58.33333333%}.col-lg-pull-6{right:50%}.col-lg-pull-5{right:41.66666667%}.col-lg-pull-4{right:33.33333333%}.col-lg-pull-3{right:25%}.col-lg-pull-2{right:16.66666667%}.col-lg-pull-1{right:8.33333333%}.col-lg-pull-0{right:auto}.col-lg-push-12{left:100%}.col-lg-push-11{left:91.66666667%}.col-lg-push-10{left:83.33333333%}.col-lg-push-9{left:75%}.col-lg-push-8{left:66.66666667%}.col-lg-push-7{left:58.33333333%}.col-lg-push-6{left:50%}.col-lg-push-5{left:41.66666667%}.col-lg-push-4{left:33.33333333%}.col-lg-push-3{left:25%}.col-lg-push-2{left:16.66666667%}.col-lg-push-1{left:8.33333333%}.col-lg-push-0{left:auto}.col-lg-offset-12{margin-left:100%}.col-lg-offset-11{margin-left:91.66666667%}.col-lg-offset-10{margin-left:83.33333333%}.col-lg-offset-9{margin-left:75%}.col-lg-offset-8{margin-left:66.66666667%}.col-lg-offset-7{margin-left:58.33333333%}.col-lg-offset-6{margin-left:50%}.col-lg-offset-5{margin-left:41.66666667%}.col-lg-offset-4{margin-left:33.33333333%}.col-lg-offset-3{margin-left:25%}.col-lg-offset-2{margin-left:16.66666667%}.col-lg-offset-1{margin-left:8.33333333%}.col-lg-offset-0{margin-left:0}}table{background-color:transparent}caption{padding-top:8px;padding-bottom:8px;color:#777;text-align:left}th{text-align:left}.table{width:100%;max-width:100%;margin-bottom:20px}.table>tbody>tr>td,.table>tbody>tr>th,.table>tfoot>tr>td,.table>tfoot>tr>th,.table>thead>tr>td,.table>thead>tr>th{padding:8px;line-height:1.42857143;vertical-align:top;border-top:1px solid #ddd}.table>thead>tr>th{vertical-align:bottom;border-bottom:2px solid #ddd}.table>caption+thead>tr:first-child>td,.table>caption+thead>tr:first-child>th,.table>colgroup+thead>tr:first-child>td,.table>colgroup+thead>tr:first-child>th,.table>thead:first-child>tr:first-child>td,.table>thead:first-child>tr:first-child>th{border-top:0}.table>tbody+tbody{border-top:2px solid #ddd}.table .table{background-color:#fff}.table-condensed>tbody>tr>td,.table-condensed>tbody>tr>th,.table-condensed>tfoot>tr>td,.table-condensed>tfoot>tr>th,.table-condensed>thead>tr>td,.table-condensed>thead>tr>th{padding:5px}.table-bordered{border:1px solid #ddd}.table-bordered>tbody>tr>td,.table-bordered>tbody>tr>th,.table-bordered>tfoot>tr>td,.table-bordered>tfoot>tr>th,.table-bordered>thead>tr>td,.table-bordered>thead>tr>th{border:1px solid #ddd}.table-bordered>thead>tr>td,.table-bordered>thead>tr>th{border-bottom-width:2px}.table-striped>tbody>tr:nth-of-type(odd){background-color:#f9f9f9}.table-hover>tbody>tr:hover{background-color:#f5f5f5}table col[class*=col-]{position:static;display:table-column;float:none}table td[class*=col-],table th[class*=col-]{position:static;display:table-cell;float:none}.table>tbody>tr.active>td,.table>tbody>tr.active>th,.table>tbody>tr>td.active,.table>tbody>tr>th.active,.table>tfoot>tr.active>td,.table>tfoot>tr.active>th,.table>tfoot>tr>td.active,.table>tfoot>tr>th.active,.table>thead>tr.active>td,.table>thead>tr.active>th,.table>thead>tr>td.active,.table>thead>tr>th.active{background-color:#f5f5f5}.table-hover>tbody>tr.active:hover>td,.table-hover>tbody>tr.active:hover>th,.table-hover>tbody>tr:hover>.active,.table-hover>tbody>tr>td.active:hover,.table-hover>tbody>tr>th.active:hover{background-color:#e8e8e8}.table>tbody>tr.success>td,.table>tbody>tr.success>th,.table>tbody>tr>td.success,.table>tbody>tr>th.success,.table>tfoot>tr.success>td,.table>tfoot>tr.success>th,.table>tfoot>tr>td.success,.table>tfoot>tr>th.success,.table>thead>tr.success>td,.table>thead>tr.success>th,.table>thead>tr>td.success,.table>thead>tr>th.success{background-color:#dff0d8}.table-hover>tbody>tr.success:hover>td,.table-hover>tbody>tr.success:hover>th,.table-hover>tbody>tr:hover>.success,.table-hover>tbody>tr>td.success:hover,.table-hover>tbody>tr>th.success:hover{background-color:#d0e9c6}.table>tbody>tr.info>td,.table>tbody>tr.info>th,.table>tbody>tr>td.info,.table>tbody>tr>th.info,.table>tfoot>tr.info>td,.table>tfoot>tr.info>th,.table>tfoot>tr>td.info,.table>tfoot>tr>th.info,.table>thead>tr.info>td,.table>thead>tr.info>th,.table>thead>tr>td.info,.table>thead>tr>th.info{background-color:#d9edf7}.table-hover>tbody>tr.info:hover>td,.table-hover>tbody>tr.info:hover>th,.table-hover>tbody>tr:hover>.info,.table-hover>tbody>tr>td.info:hover,.table-hover>tbody>tr>th.info:hover{background-color:#c4e3f3}.table>tbody>tr.warning>td,.table>tbody>tr.warning>th,.table>tbody>tr>td.warning,.table>tbody>tr>th.warning,.table>tfoot>tr.warning>td,.table>tfoot>tr.warning>th,.table>tfoot>tr>td.warning,.table>tfoot>tr>th.warning,.table>thead>tr.warning>td,.table>thead>tr.warning>th,.table>thead>tr>td.warning,.table>thead>tr>th.warning{background-color:#fcf8e3}.table-hover>tbody>tr.warning:hover>td,.table-hover>tbody>tr.warning:hover>th,.table-hover>tbody>tr:hover>.warning,.table-hover>tbody>tr>td.warning:hover,.table-hover>tbody>tr>th.warning:hover{background-color:#faf2cc}.table>tbody>tr.danger>td,.table>tbody>tr.danger>th,.table>tbody>tr>td.danger,.table>tbody>tr>th.danger,.table>tfoot>tr.danger>td,.table>tfoot>tr.danger>th,.table>tfoot>tr>td.danger,.table>tfoot>tr>th.danger,.table>thead>tr.danger>td,.table>thead>tr.danger>th,.table>thead>tr>td.danger,.table>thead>tr>th.danger{background-color:#f2dede}.table-hover>tbody>tr.danger:hover>td,.table-hover>tbody>tr.danger:hover>th,.table-hover>tbody>tr:hover>.danger,.table-hover>tbody>tr>td.danger:hover,.table-hover>tbody>tr>th.danger:hover{background-color:#ebcccc}.table-responsive{min-height:.01%;overflow-x:auto}@media screen and (max-width:767px){.table-responsive{width:100%;margin-bottom:15px;overflow-y:hidden;-ms-overflow-style:-ms-autohiding-scrollbar;border:1px solid #ddd}.table-responsive>.table{margin-bottom:0}.table-responsive>.table>tbody>tr>td,.table-responsive>.table>tbody>tr>th,.table-responsive>.table>tfoot>tr>td,.table-responsive>.table>tfoot>tr>th,.table-responsive>.table>thead>tr>td,.table-responsive>.table>thead>tr>th{white-space:nowrap}.table-responsive>.table-bordered{border:0}.table-responsive>.table-bordered>tbody>tr>td:first-child,.table-responsive>.table-bordered>tbody>tr>th:first-child,.table-responsive>.table-bordered>tfoot>tr>td:first-child,.table-responsive>.table-bordered>tfoot>tr>th:first-child,.table-responsive>.table-bordered>thead>tr>td:first-child,.table-responsive>.table-bordered>thead>tr>th:first-child{border-left:0}.table-responsive>.table-bordered>tbody>tr>td:last-child,.table-responsive>.table-bordered>tbody>tr>th:last-child,.table-responsive>.table-bordered>tfoot>tr>td:last-child,.table-responsive>.table-bordered>tfoot>tr>th:last-child,.table-responsive>.table-bordered>thead>tr>td:last-child,.table-responsive>.table-bordered>thead>tr>th:last-child{border-right:0}.table-responsive>.table-bordered>tbody>tr:last-child>td,.table-responsive>.table-bordered>tbody>tr:last-child>th,.table-responsive>.table-bordered>tfoot>tr:last-child>td,.table-responsive>.table-bordered>tfoot>tr:last-child>th{border-bottom:0}}fieldset{min-width:0;padding:0;margin:0;border:0}legend{display:block;width:100%;padding:0;margin-bottom:20px;font-size:21px;line-height:inherit;color:#333;border:0;border-bottom:1px solid #e5e5e5}label{display:inline-block;max-width:100%;margin-bottom:5px;font-weight:700}input[type=search]{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}input[type=checkbox],input[type=radio]{margin:4px 0 0;margin-top:1px\\9;line-height:normal}input[type=file]{display:block}input[type=range]{display:block;width:100%}select[multiple],select[size]{height:auto}input[type=file]:focus,input[type=checkbox]:focus,input[type=radio]:focus{outline:thin dotted;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px}output{display:block;padding-top:7px;font-size:14px;line-height:1.42857143;color:#555}.form-control{display:block;width:100%;height:34px;padding:6px 12px;font-size:14px;line-height:1.42857143;color:#555;background-color:#fff;background-image:none;border:1px solid #ccc;border-radius:4px;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075);box-shadow:inset 0 1px 1px rgba(0,0,0,.075);-webkit-transition:border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;-o-transition:border-color ease-in-out .15s,box-shadow ease-in-out .15s;transition:border-color ease-in-out .15s,box-shadow ease-in-out .15s}.form-control:focus{border-color:#66afe9;outline:0;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)}.form-control::-moz-placeholder{color:#999;opacity:1}.form-control:-ms-input-placeholder{color:#999}.form-control::-webkit-input-placeholder{color:#999}.form-control::-ms-expand{background-color:transparent;border:0}.form-control[disabled],.form-control[readonly],fieldset[disabled] .form-control{background-color:#eee;opacity:1}.form-control[disabled],fieldset[disabled] .form-control{cursor:not-allowed}textarea.form-control{height:auto}input[type=search]{-webkit-appearance:none}@media screen and (-webkit-min-device-pixel-ratio:0){input[type=date].form-control,input[type=time].form-control,input[type=datetime-local].form-control,input[type=month].form-control{line-height:34px}.input-group-sm input[type=date],.input-group-sm input[type=time],.input-group-sm input[type=datetime-local],.input-group-sm input[type=month],input[type=date].input-sm,input[type=time].input-sm,input[type=datetime-local].input-sm,input[type=month].input-sm{line-height:30px}.input-group-lg input[type=date],.input-group-lg input[type=time],.input-group-lg input[type=datetime-local],.input-group-lg input[type=month],input[type=date].input-lg,input[type=time].input-lg,input[type=datetime-local].input-lg,input[type=month].input-lg{line-height:46px}}.form-group{margin-bottom:15px}.checkbox,.radio{position:relative;display:block;margin-top:10px;margin-bottom:10px}.checkbox label,.radio label{min-height:20px;padding-left:20px;margin-bottom:0;font-weight:400;cursor:pointer}.checkbox input[type=checkbox],.checkbox-inline input[type=checkbox],.radio input[type=radio],.radio-inline input[type=radio]{position:absolute;margin-top:4px\\9;margin-left:-20px}.checkbox+.checkbox,.radio+.radio{margin-top:-5px}.checkbox-inline,.radio-inline{position:relative;display:inline-block;padding-left:20px;margin-bottom:0;font-weight:400;vertical-align:middle;cursor:pointer}.checkbox-inline+.checkbox-inline,.radio-inline+.radio-inline{margin-top:0;margin-left:10px}fieldset[disabled] input[type=checkbox],fieldset[disabled] input[type=radio],input[type=checkbox].disabled,input[type=checkbox][disabled],input[type=radio].disabled,input[type=radio][disabled]{cursor:not-allowed}.checkbox-inline.disabled,.radio-inline.disabled,fieldset[disabled] .checkbox-inline,fieldset[disabled] .radio-inline{cursor:not-allowed}.checkbox.disabled label,.radio.disabled label,fieldset[disabled] .checkbox label,fieldset[disabled] .radio label{cursor:not-allowed}.form-control-static{min-height:34px;padding-top:7px;padding-bottom:7px;margin-bottom:0}.form-control-static.input-lg,.form-control-static.input-sm{padding-right:0;padding-left:0}.input-sm{height:30px;padding:5px 10px;font-size:12px;line-height:1.5;border-radius:3px}select.input-sm{height:30px;line-height:30px}select[multiple].input-sm,textarea.input-sm{height:auto}.form-group-sm .form-control{height:30px;padding:5px 10px;font-size:12px;line-height:1.5;border-radius:3px}.form-group-sm select.form-control{height:30px;line-height:30px}.form-group-sm select[multiple].form-control,.form-group-sm textarea.form-control{height:auto}.form-group-sm .form-control-static{height:30px;min-height:32px;padding:6px 10px;font-size:12px;line-height:1.5}.input-lg{height:46px;padding:10px 16px;font-size:18px;line-height:1.3333333;border-radius:6px}select.input-lg{height:46px;line-height:46px}select[multiple].input-lg,textarea.input-lg{height:auto}.form-group-lg .form-control{height:46px;padding:10px 16px;font-size:18px;line-height:1.3333333;border-radius:6px}.form-group-lg select.form-control{height:46px;line-height:46px}.form-group-lg select[multiple].form-control,.form-group-lg textarea.form-control{height:auto}.form-group-lg .form-control-static{height:46px;min-height:38px;padding:11px 16px;font-size:18px;line-height:1.3333333}.has-feedback{position:relative}.has-feedback .form-control{padding-right:42.5px}.form-control-feedback{position:absolute;top:0;right:0;z-index:2;display:block;width:34px;height:34px;line-height:34px;text-align:center;pointer-events:none}.form-group-lg .form-control+.form-control-feedback,.input-group-lg+.form-control-feedback,.input-lg+.form-control-feedback{width:46px;height:46px;line-height:46px}.form-group-sm .form-control+.form-control-feedback,.input-group-sm+.form-control-feedback,.input-sm+.form-control-feedback{width:30px;height:30px;line-height:30px}.has-success .checkbox,.has-success .checkbox-inline,.has-success .control-label,.has-success .help-block,.has-success .radio,.has-success .radio-inline,.has-success.checkbox label,.has-success.checkbox-inline label,.has-success.radio label,.has-success.radio-inline label{color:#3c763d}.has-success .form-control{border-color:#3c763d;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075);box-shadow:inset 0 1px 1px rgba(0,0,0,.075)}.has-success .form-control:focus{border-color:#2b542c;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #67b168;box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #67b168}.has-success .input-group-addon{color:#3c763d;background-color:#dff0d8;border-color:#3c763d}.has-success .form-control-feedback{color:#3c763d}.has-warning .checkbox,.has-warning .checkbox-inline,.has-warning .control-label,.has-warning .help-block,.has-warning .radio,.has-warning .radio-inline,.has-warning.checkbox label,.has-warning.checkbox-inline label,.has-warning.radio label,.has-warning.radio-inline label{color:#8a6d3b}.has-warning .form-control{border-color:#8a6d3b;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075);box-shadow:inset 0 1px 1px rgba(0,0,0,.075)}.has-warning .form-control:focus{border-color:#66512c;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #c0a16b;box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #c0a16b}.has-warning .input-group-addon{color:#8a6d3b;background-color:#fcf8e3;border-color:#8a6d3b}.has-warning .form-control-feedback{color:#8a6d3b}.has-error .checkbox,.has-error .checkbox-inline,.has-error .control-label,.has-error .help-block,.has-error .radio,.has-error .radio-inline,.has-error.checkbox label,.has-error.checkbox-inline label,.has-error.radio label,.has-error.radio-inline label{color:#a94442}.has-error .form-control{border-color:#a94442;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075);box-shadow:inset 0 1px 1px rgba(0,0,0,.075)}.has-error .form-control:focus{border-color:#843534;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #ce8483;box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #ce8483}.has-error .input-group-addon{color:#a94442;background-color:#f2dede;border-color:#a94442}.has-error .form-control-feedback{color:#a94442}.has-feedback label~.form-control-feedback{top:25px}.has-feedback label.sr-only~.form-control-feedback{top:0}.help-block{display:block;margin-top:5px;margin-bottom:10px;color:#737373}@media (min-width:768px){.form-inline .form-group{display:inline-block;margin-bottom:0;vertical-align:middle}.form-inline .form-control{display:inline-block;width:auto;vertical-align:middle}.form-inline .form-control-static{display:inline-block}.form-inline .input-group{display:inline-table;vertical-align:middle}.form-inline .input-group .form-control,.form-inline .input-group .input-group-addon,.form-inline .input-group .input-group-btn{width:auto}.form-inline .input-group>.form-control{width:100%}.form-inline .control-label{margin-bottom:0;vertical-align:middle}.form-inline .checkbox,.form-inline .radio{display:inline-block;margin-top:0;margin-bottom:0;vertical-align:middle}.form-inline .checkbox label,.form-inline .radio label{padding-left:0}.form-inline .checkbox input[type=checkbox],.form-inline .radio input[type=radio]{position:relative;margin-left:0}.form-inline .has-feedback .form-control-feedback{top:0}}.form-horizontal .checkbox,.form-horizontal .checkbox-inline,.form-horizontal .radio,.form-horizontal .radio-inline{padding-top:7px;margin-top:0;margin-bottom:0}.form-horizontal .checkbox,.form-horizontal .radio{min-height:27px}.form-horizontal .form-group{margin-right:-15px;margin-left:-15px}@media (min-width:768px){.form-horizontal .control-label{padding-top:7px;margin-bottom:0;text-align:right}}.form-horizontal .has-feedback .form-control-feedback{right:15px}@media (min-width:768px){.form-horizontal .form-group-lg .control-label{padding-top:11px;font-size:18px}}@media (min-width:768px){.form-horizontal .form-group-sm .control-label{padding-top:6px;font-size:12px}}.btn{display:inline-block;padding:6px 12px;margin-bottom:0;font-size:14px;font-weight:400;line-height:1.42857143;text-align:center;white-space:nowrap;vertical-align:middle;-ms-touch-action:manipulation;touch-action:manipulation;cursor:pointer;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;background-image:none;border:1px solid transparent;border-radius:4px}.btn.active.focus,.btn.active:focus,.btn.focus,.btn:active.focus,.btn:active:focus,.btn:focus{outline:thin dotted;outline:5px auto -webkit-focus-ring-color;outline-offset:-2px}.btn.focus,.btn:focus,.btn:hover{color:#333;text-decoration:none}.btn.active,.btn:active{background-image:none;outline:0;-webkit-box-shadow:inset 0 3px 5px rgba(0,0,0,.125);box-shadow:inset 0 3px 5px rgba(0,0,0,.125)}.btn.disabled,.btn[disabled],fieldset[disabled] .btn{cursor:not-allowed;filter:alpha(opacity=65);-webkit-box-shadow:none;box-shadow:none;opacity:.65}a.btn.disabled,fieldset[disabled] a.btn{pointer-events:none}.btn-default{color:#333;background-color:#fff;border-color:#ccc}.btn-default.focus,.btn-default:focus{color:#333;background-color:#e6e6e6;border-color:#8c8c8c}.btn-default:hover{color:#333;background-color:#e6e6e6;border-color:#adadad}.btn-default.active,.btn-default:active,.open>.dropdown-toggle.btn-default{color:#333;background-color:#e6e6e6;border-color:#adadad}.btn-default.active.focus,.btn-default.active:focus,.btn-default.active:hover,.btn-default:active.focus,.btn-default:active:focus,.btn-default:active:hover,.open>.dropdown-toggle.btn-default.focus,.open>.dropdown-toggle.btn-default:focus,.open>.dropdown-toggle.btn-default:hover{color:#333;background-color:#d4d4d4;border-color:#8c8c8c}.btn-default.active,.btn-default:active,.open>.dropdown-toggle.btn-default{background-image:none}.btn-default.disabled.focus,.btn-default.disabled:focus,.btn-default.disabled:hover,.btn-default[disabled].focus,.btn-default[disabled]:focus,.btn-default[disabled]:hover,fieldset[disabled] .btn-default.focus,fieldset[disabled] .btn-default:focus,fieldset[disabled] .btn-default:hover{background-color:#fff;border-color:#ccc}.btn-default .badge{color:#fff;background-color:#333}.btn-primary{color:#fff;background-color:#337ab7;border-color:#2e6da4}.btn-primary.focus,.btn-primary:focus{color:#fff;background-color:#286090;border-color:#122b40}.btn-primary:hover{color:#fff;background-color:#286090;border-color:#204d74}.btn-primary.active,.btn-primary:active,.open>.dropdown-toggle.btn-primary{color:#fff;background-color:#286090;border-color:#204d74}.btn-primary.active.focus,.btn-primary.active:focus,.btn-primary.active:hover,.btn-primary:active.focus,.btn-primary:active:focus,.btn-primary:active:hover,.open>.dropdown-toggle.btn-primary.focus,.open>.dropdown-toggle.btn-primary:focus,.open>.dropdown-toggle.btn-primary:hover{color:#fff;background-color:#204d74;border-color:#122b40}.btn-primary.active,.btn-primary:active,.open>.dropdown-toggle.btn-primary{background-image:none}.btn-primary.disabled.focus,.btn-primary.disabled:focus,.btn-primary.disabled:hover,.btn-primary[disabled].focus,.btn-primary[disabled]:focus,.btn-primary[disabled]:hover,fieldset[disabled] .btn-primary.focus,fieldset[disabled] .btn-primary:focus,fieldset[disabled] .btn-primary:hover{background-color:#337ab7;border-color:#2e6da4}.btn-primary .badge{color:#337ab7;background-color:#fff}.btn-success{color:#fff;background-color:#5cb85c;border-color:#4cae4c}.btn-success.focus,.btn-success:focus{color:#fff;background-color:#449d44;border-color:#255625}.btn-success:hover{color:#fff;background-color:#449d44;border-color:#398439}.btn-success.active,.btn-success:active,.open>.dropdown-toggle.btn-success{color:#fff;background-color:#449d44;border-color:#398439}.btn-success.active.focus,.btn-success.active:focus,.btn-success.active:hover,.btn-success:active.focus,.btn-success:active:focus,.btn-success:active:hover,.open>.dropdown-toggle.btn-success.focus,.open>.dropdown-toggle.btn-success:focus,.open>.dropdown-toggle.btn-success:hover{color:#fff;background-color:#398439;border-color:#255625}.btn-success.active,.btn-success:active,.open>.dropdown-toggle.btn-success{background-image:none}.btn-success.disabled.focus,.btn-success.disabled:focus,.btn-success.disabled:hover,.btn-success[disabled].focus,.btn-success[disabled]:focus,.btn-success[disabled]:hover,fieldset[disabled] .btn-success.focus,fieldset[disabled] .btn-success:focus,fieldset[disabled] .btn-success:hover{background-color:#5cb85c;border-color:#4cae4c}.btn-success .badge{color:#5cb85c;background-color:#fff}.btn-info{color:#fff;background-color:#5bc0de;border-color:#46b8da}.btn-info.focus,.btn-info:focus{color:#fff;background-color:#31b0d5;border-color:#1b6d85}.btn-info:hover{color:#fff;background-color:#31b0d5;border-color:#269abc}.btn-info.active,.btn-info:active,.open>.dropdown-toggle.btn-info{color:#fff;background-color:#31b0d5;border-color:#269abc}.btn-info.active.focus,.btn-info.active:focus,.btn-info.active:hover,.btn-info:active.focus,.btn-info:active:focus,.btn-info:active:hover,.open>.dropdown-toggle.btn-info.focus,.open>.dropdown-toggle.btn-info:focus,.open>.dropdown-toggle.btn-info:hover{color:#fff;background-color:#269abc;border-color:#1b6d85}.btn-info.active,.btn-info:active,.open>.dropdown-toggle.btn-info{background-image:none}.btn-info.disabled.focus,.btn-info.disabled:focus,.btn-info.disabled:hover,.btn-info[disabled].focus,.btn-info[disabled]:focus,.btn-info[disabled]:hover,fieldset[disabled] .btn-info.focus,fieldset[disabled] .btn-info:focus,fieldset[disabled] .btn-info:hover{background-color:#5bc0de;border-color:#46b8da}.btn-info .badge{color:#5bc0de;background-color:#fff}.btn-warning{color:#fff;background-color:#f0ad4e;border-color:#eea236}.btn-warning.focus,.btn-warning:focus{color:#fff;background-color:#ec971f;border-color:#985f0d}.btn-warning:hover{color:#fff;background-color:#ec971f;border-color:#d58512}.btn-warning.active,.btn-warning:active,.open>.dropdown-toggle.btn-warning{color:#fff;background-color:#ec971f;border-color:#d58512}.btn-warning.active.focus,.btn-warning.active:focus,.btn-warning.active:hover,.btn-warning:active.focus,.btn-warning:active:focus,.btn-warning:active:hover,.open>.dropdown-toggle.btn-warning.focus,.open>.dropdown-toggle.btn-warning:focus,.open>.dropdown-toggle.btn-warning:hover{color:#fff;background-color:#d58512;border-color:#985f0d}.btn-warning.active,.btn-warning:active,.open>.dropdown-toggle.btn-warning{background-image:none}.btn-warning.disabled.focus,.btn-warning.disabled:focus,.btn-warning.disabled:hover,.btn-warning[disabled].focus,.btn-warning[disabled]:focus,.btn-warning[disabled]:hover,fieldset[disabled] .btn-warning.focus,fieldset[disabled] .btn-warning:focus,fieldset[disabled] .btn-warning:hover{background-color:#f0ad4e;border-color:#eea236}.btn-warning .badge{color:#f0ad4e;background-color:#fff}.btn-danger{color:#fff;background-color:#d9534f;border-color:#d43f3a}.btn-danger.focus,.btn-danger:focus{color:#fff;background-color:#c9302c;border-color:#761c19}.btn-danger:hover{color:#fff;background-color:#c9302c;border-color:#ac2925}.btn-danger.active,.btn-danger:active,.open>.dropdown-toggle.btn-danger{color:#fff;background-color:#c9302c;border-color:#ac2925}.btn-danger.active.focus,.btn-danger.active:focus,.btn-danger.active:hover,.btn-danger:active.focus,.btn-danger:active:focus,.btn-danger:active:hover,.open>.dropdown-toggle.btn-danger.focus,.open>.dropdown-toggle.btn-danger:focus,.open>.dropdown-toggle.btn-danger:hover{color:#fff;background-color:#ac2925;border-color:#761c19}.btn-danger.active,.btn-danger:active,.open>.dropdown-toggle.btn-danger{background-image:none}.btn-danger.disabled.focus,.btn-danger.disabled:focus,.btn-danger.disabled:hover,.btn-danger[disabled].focus,.btn-danger[disabled]:focus,.btn-danger[disabled]:hover,fieldset[disabled] .btn-danger.focus,fieldset[disabled] .btn-danger:focus,fieldset[disabled] .btn-danger:hover{background-color:#d9534f;border-color:#d43f3a}.btn-danger .badge{color:#d9534f;background-color:#fff}.btn-link{font-weight:400;color:#337ab7;border-radius:0}.btn-link,.btn-link.active,.btn-link:active,.btn-link[disabled],fieldset[disabled] .btn-link{background-color:transparent;-webkit-box-shadow:none;box-shadow:none}.btn-link,.btn-link:active,.btn-link:focus,.btn-link:hover{border-color:transparent}.btn-link:focus,.btn-link:hover{color:#23527c;text-decoration:underline;background-color:transparent}.btn-link[disabled]:focus,.btn-link[disabled]:hover,fieldset[disabled] .btn-link:focus,fieldset[disabled] .btn-link:hover{color:#777;text-decoration:none}.btn-group-lg>.btn,.btn-lg{padding:10px 16px;font-size:18px;line-height:1.3333333;border-radius:6px}.btn-group-sm>.btn,.btn-sm{padding:5px 10px;font-size:12px;line-height:1.5;border-radius:3px}.btn-group-xs>.btn,.btn-xs{padding:1px 5px;font-size:12px;line-height:1.5;border-radius:3px}.btn-block{display:block;width:100%}.btn-block+.btn-block{margin-top:5px}input[type=button].btn-block,input[type=reset].btn-block,input[type=submit].btn-block{width:100%}.fade{opacity:0;-webkit-transition:opacity .15s linear;-o-transition:opacity .15s linear;transition:opacity .15s linear}.fade.in{opacity:1}.collapse{display:none}.collapse.in{display:block}tr.collapse.in{display:table-row}tbody.collapse.in{display:table-row-group}.collapsing{position:relative;height:0;overflow:hidden;-webkit-transition-timing-function:ease;-o-transition-timing-function:ease;transition-timing-function:ease;-webkit-transition-duration:.35s;-o-transition-duration:.35s;transition-duration:.35s;-webkit-transition-property:height,visibility;-o-transition-property:height,visibility;transition-property:height,visibility}.caret{display:inline-block;width:0;height:0;margin-left:2px;vertical-align:middle;border-top:4px dashed;border-top:4px solid\\9;border-right:4px solid transparent;border-left:4px solid transparent}.dropdown,.dropup{position:relative}.dropdown-toggle:focus{outline:0}.dropdown-menu{position:absolute;top:100%;left:0;z-index:1000;display:none;float:left;min-width:160px;padding:5px 0;margin:2px 0 0;font-size:14px;text-align:left;list-style:none;background-color:#fff;-webkit-background-clip:padding-box;background-clip:padding-box;border:1px solid #ccc;border:1px solid rgba(0,0,0,.15);border-radius:4px;-webkit-box-shadow:0 6px 12px rgba(0,0,0,.175);box-shadow:0 6px 12px rgba(0,0,0,.175)}.dropdown-menu.pull-right{right:0;left:auto}.dropdown-menu .divider{height:1px;margin:9px 0;overflow:hidden;background-color:#e5e5e5}.dropdown-menu>li>a{display:block;padding:3px 20px;clear:both;font-weight:400;line-height:1.42857143;color:#333;white-space:nowrap}.dropdown-menu>li>a:focus,.dropdown-menu>li>a:hover{color:#262626;text-decoration:none;background-color:#f5f5f5}.dropdown-menu>.active>a,.dropdown-menu>.active>a:focus,.dropdown-menu>.active>a:hover{color:#fff;text-decoration:none;background-color:#337ab7;outline:0}.dropdown-menu>.disabled>a,.dropdown-menu>.disabled>a:focus,.dropdown-menu>.disabled>a:hover{color:#777}.dropdown-menu>.disabled>a:focus,.dropdown-menu>.disabled>a:hover{text-decoration:none;cursor:not-allowed;background-color:transparent;background-image:none;filter:progid:DXImageTransform.Microsoft.gradient(enabled=false)}.open>.dropdown-menu{display:block}.open>a{outline:0}.dropdown-menu-right{right:0;left:auto}.dropdown-menu-left{right:auto;left:0}.dropdown-header{display:block;padding:3px 20px;font-size:12px;line-height:1.42857143;color:#777;white-space:nowrap}.dropdown-backdrop{position:fixed;top:0;right:0;bottom:0;left:0;z-index:990}.pull-right>.dropdown-menu{right:0;left:auto}.dropup .caret,.navbar-fixed-bottom .dropdown .caret{content:"";border-top:0;border-bottom:4px dashed;border-bottom:4px solid\\9}.dropup .dropdown-menu,.navbar-fixed-bottom .dropdown .dropdown-menu{top:auto;bottom:100%;margin-bottom:2px}@media (min-width:768px){.navbar-right .dropdown-menu{right:0;left:auto}.navbar-right .dropdown-menu-left{right:auto;left:0}}.btn-group,.btn-group-vertical{position:relative;display:inline-block;vertical-align:middle}.btn-group-vertical>.btn,.btn-group>.btn{position:relative;float:left}.btn-group-vertical>.btn.active,.btn-group-vertical>.btn:active,.btn-group-vertical>.btn:focus,.btn-group-vertical>.btn:hover,.btn-group>.btn.active,.btn-group>.btn:active,.btn-group>.btn:focus,.btn-group>.btn:hover{z-index:2}.btn-group .btn+.btn,.btn-group .btn+.btn-group,.btn-group .btn-group+.btn,.btn-group .btn-group+.btn-group{margin-left:-1px}.btn-toolbar{margin-left:-5px}.btn-toolbar .btn,.btn-toolbar .btn-group,.btn-toolbar .input-group{float:left}.btn-toolbar>.btn,.btn-toolbar>.btn-group,.btn-toolbar>.input-group{margin-left:5px}.btn-group>.btn:not(:first-child):not(:last-child):not(.dropdown-toggle){border-radius:0}.btn-group>.btn:first-child{margin-left:0}.btn-group>.btn:first-child:not(:last-child):not(.dropdown-toggle){border-top-right-radius:0;border-bottom-right-radius:0}.btn-group>.btn:last-child:not(:first-child),.btn-group>.dropdown-toggle:not(:first-child){border-top-left-radius:0;border-bottom-left-radius:0}.btn-group>.btn-group{float:left}.btn-group>.btn-group:not(:first-child):not(:last-child)>.btn{border-radius:0}.btn-group>.btn-group:first-child:not(:last-child)>.btn:last-child,.btn-group>.btn-group:first-child:not(:last-child)>.dropdown-toggle{border-top-right-radius:0;border-bottom-right-radius:0}.btn-group>.btn-group:last-child:not(:first-child)>.btn:first-child{border-top-left-radius:0;border-bottom-left-radius:0}.btn-group .dropdown-toggle:active,.btn-group.open .dropdown-toggle{outline:0}.btn-group>.btn+.dropdown-toggle{padding-right:8px;padding-left:8px}.btn-group>.btn-lg+.dropdown-toggle{padding-right:12px;padding-left:12px}.btn-group.open .dropdown-toggle{-webkit-box-shadow:inset 0 3px 5px rgba(0,0,0,.125);box-shadow:inset 0 3px 5px rgba(0,0,0,.125)}.btn-group.open .dropdown-toggle.btn-link{-webkit-box-shadow:none;box-shadow:none}.btn .caret{margin-left:0}.btn-lg .caret{border-width:5px 5px 0;border-bottom-width:0}.dropup .btn-lg .caret{border-width:0 5px 5px}.btn-group-vertical>.btn,.btn-group-vertical>.btn-group,.btn-group-vertical>.btn-group>.btn{display:block;float:none;width:100%;max-width:100%}.btn-group-vertical>.btn-group>.btn{float:none}.btn-group-vertical>.btn+.btn,.btn-group-vertical>.btn+.btn-group,.btn-group-vertical>.btn-group+.btn,.btn-group-vertical>.btn-group+.btn-group{margin-top:-1px;margin-left:0}.btn-group-vertical>.btn:not(:first-child):not(:last-child){border-radius:0}.btn-group-vertical>.btn:first-child:not(:last-child){border-top-left-radius:4px;border-top-right-radius:4px;border-bottom-right-radius:0;border-bottom-left-radius:0}.btn-group-vertical>.btn:last-child:not(:first-child){border-top-left-radius:0;border-top-right-radius:0;border-bottom-right-radius:4px;border-bottom-left-radius:4px}.btn-group-vertical>.btn-group:not(:first-child):not(:last-child)>.btn{border-radius:0}.btn-group-vertical>.btn-group:first-child:not(:last-child)>.btn:last-child,.btn-group-vertical>.btn-group:first-child:not(:last-child)>.dropdown-toggle{border-bottom-right-radius:0;border-bottom-left-radius:0}.btn-group-vertical>.btn-group:last-child:not(:first-child)>.btn:first-child{border-top-left-radius:0;border-top-right-radius:0}.btn-group-justified{display:table;width:100%;table-layout:fixed;border-collapse:separate}.btn-group-justified>.btn,.btn-group-justified>.btn-group{display:table-cell;float:none;width:1%}.btn-group-justified>.btn-group .btn{width:100%}.btn-group-justified>.btn-group .dropdown-menu{left:auto}[data-toggle=buttons]>.btn input[type=checkbox],[data-toggle=buttons]>.btn input[type=radio],[data-toggle=buttons]>.btn-group>.btn input[type=checkbox],[data-toggle=buttons]>.btn-group>.btn input[type=radio]{position:absolute;clip:rect(0,0,0,0);pointer-events:none}.input-group{position:relative;display:table;border-collapse:separate}.input-group[class*=col-]{float:none;padding-right:0;padding-left:0}.input-group .form-control{position:relative;z-index:2;float:left;width:100%;margin-bottom:0}.input-group .form-control:focus{z-index:3}.input-group-lg>.form-control,.input-group-lg>.input-group-addon,.input-group-lg>.input-group-btn>.btn{height:46px;padding:10px 16px;font-size:18px;line-height:1.3333333;border-radius:6px}select.input-group-lg>.form-control,select.input-group-lg>.input-group-addon,select.input-group-lg>.input-group-btn>.btn{height:46px;line-height:46px}select[multiple].input-group-lg>.form-control,select[multiple].input-group-lg>.input-group-addon,select[multiple].input-group-lg>.input-group-btn>.btn,textarea.input-group-lg>.form-control,textarea.input-group-lg>.input-group-addon,textarea.input-group-lg>.input-group-btn>.btn{height:auto}.input-group-sm>.form-control,.input-group-sm>.input-group-addon,.input-group-sm>.input-group-btn>.btn{height:30px;padding:5px 10px;font-size:12px;line-height:1.5;border-radius:3px}select.input-group-sm>.form-control,select.input-group-sm>.input-group-addon,select.input-group-sm>.input-group-btn>.btn{height:30px;line-height:30px}select[multiple].input-group-sm>.form-control,select[multiple].input-group-sm>.input-group-addon,select[multiple].input-group-sm>.input-group-btn>.btn,textarea.input-group-sm>.form-control,textarea.input-group-sm>.input-group-addon,textarea.input-group-sm>.input-group-btn>.btn{height:auto}.input-group .form-control,.input-group-addon,.input-group-btn{display:table-cell}.input-group .form-control:not(:first-child):not(:last-child),.input-group-addon:not(:first-child):not(:last-child),.input-group-btn:not(:first-child):not(:last-child){border-radius:0}.input-group-addon,.input-group-btn{width:1%;white-space:nowrap;vertical-align:middle}.input-group-addon{padding:6px 12px;font-size:14px;font-weight:400;line-height:1;color:#555;text-align:center;background-color:#eee;border:1px solid #ccc;border-radius:4px}.input-group-addon.input-sm{padding:5px 10px;font-size:12px;border-radius:3px}.input-group-addon.input-lg{padding:10px 16px;font-size:18px;border-radius:6px}.input-group-addon input[type=checkbox],.input-group-addon input[type=radio]{margin-top:0}.input-group .form-control:first-child,.input-group-addon:first-child,.input-group-btn:first-child>.btn,.input-group-btn:first-child>.btn-group>.btn,.input-group-btn:first-child>.dropdown-toggle,.input-group-btn:last-child>.btn-group:not(:last-child)>.btn,.input-group-btn:last-child>.btn:not(:last-child):not(.dropdown-toggle){border-top-right-radius:0;border-bottom-right-radius:0}.input-group-addon:first-child{border-right:0}.input-group .form-control:last-child,.input-group-addon:last-child,.input-group-btn:first-child>.btn-group:not(:first-child)>.btn,.input-group-btn:first-child>.btn:not(:first-child),.input-group-btn:last-child>.btn,.input-group-btn:last-child>.btn-group>.btn,.input-group-btn:last-child>.dropdown-toggle{border-top-left-radius:0;border-bottom-left-radius:0}.input-group-addon:last-child{border-left:0}.input-group-btn{position:relative;font-size:0;white-space:nowrap}.input-group-btn>.btn{position:relative}.input-group-btn>.btn+.btn{margin-left:-1px}.input-group-btn>.btn:active,.input-group-btn>.btn:focus,.input-group-btn>.btn:hover{z-index:2}.input-group-btn:first-child>.btn,.input-group-btn:first-child>.btn-group{margin-right:-1px}.input-group-btn:last-child>.btn,.input-group-btn:last-child>.btn-group{z-index:2;margin-left:-1px}.nav{padding-left:0;margin-bottom:0;list-style:none}.nav>li{position:relative;display:block}.nav>li>a{position:relative;display:block;padding:10px 15px}.nav>li>a:focus,.nav>li>a:hover{text-decoration:none;background-color:#eee}.nav>li.disabled>a{color:#777}.nav>li.disabled>a:focus,.nav>li.disabled>a:hover{color:#777;text-decoration:none;cursor:not-allowed;background-color:transparent}.nav .open>a,.nav .open>a:focus,.nav .open>a:hover{background-color:#eee;border-color:#337ab7}.nav .nav-divider{height:1px;margin:9px 0;overflow:hidden;background-color:#e5e5e5}.nav>li>a>img{max-width:none}.nav-tabs{border-bottom:1px solid #ddd}.nav-tabs>li{float:left;margin-bottom:-1px}.nav-tabs>li>a{margin-right:2px;line-height:1.42857143;border:1px solid transparent;border-radius:4px 4px 0 0}.nav-tabs>li>a:hover{border-color:#eee #eee #ddd}.nav-tabs>li.active>a,.nav-tabs>li.active>a:focus,.nav-tabs>li.active>a:hover{color:#555;cursor:default;background-color:#fff;border:1px solid #ddd;border-bottom-color:transparent}.nav-tabs.nav-justified{width:100%;border-bottom:0}.nav-tabs.nav-justified>li{float:none}.nav-tabs.nav-justified>li>a{margin-bottom:5px;text-align:center}.nav-tabs.nav-justified>.dropdown .dropdown-menu{top:auto;left:auto}@media (min-width:768px){.nav-tabs.nav-justified>li{display:table-cell;width:1%}.nav-tabs.nav-justified>li>a{margin-bottom:0}}.nav-tabs.nav-justified>li>a{margin-right:0;border-radius:4px}.nav-tabs.nav-justified>.active>a,.nav-tabs.nav-justified>.active>a:focus,.nav-tabs.nav-justified>.active>a:hover{border:1px solid #ddd}@media (min-width:768px){.nav-tabs.nav-justified>li>a{border-bottom:1px solid #ddd;border-radius:4px 4px 0 0}.nav-tabs.nav-justified>.active>a,.nav-tabs.nav-justified>.active>a:focus,.nav-tabs.nav-justified>.active>a:hover{border-bottom-color:#fff}}.nav-pills>li{float:left}.nav-pills>li>a{border-radius:4px}.nav-pills>li+li{margin-left:2px}.nav-pills>li.active>a,.nav-pills>li.active>a:focus,.nav-pills>li.active>a:hover{color:#fff;background-color:#337ab7}.nav-stacked>li{float:none}.nav-stacked>li+li{margin-top:2px;margin-left:0}.nav-justified{width:100%}.nav-justified>li{float:none}.nav-justified>li>a{margin-bottom:5px;text-align:center}.nav-justified>.dropdown .dropdown-menu{top:auto;left:auto}@media (min-width:768px){.nav-justified>li{display:table-cell;width:1%}.nav-justified>li>a{margin-bottom:0}}.nav-tabs-justified{border-bottom:0}.nav-tabs-justified>li>a{margin-right:0;border-radius:4px}.nav-tabs-justified>.active>a,.nav-tabs-justified>.active>a:focus,.nav-tabs-justified>.active>a:hover{border:1px solid #ddd}@media (min-width:768px){.nav-tabs-justified>li>a{border-bottom:1px solid #ddd;border-radius:4px 4px 0 0}.nav-tabs-justified>.active>a,.nav-tabs-justified>.active>a:focus,.nav-tabs-justified>.active>a:hover{border-bottom-color:#fff}}.tab-content>.tab-pane{display:none}.tab-content>.active{display:block}.nav-tabs .dropdown-menu{margin-top:-1px;border-top-left-radius:0;border-top-right-radius:0}.navbar{position:relative;min-height:50px;margin-bottom:20px;border:1px solid transparent}@media (min-width:768px){.navbar{border-radius:4px}}@media (min-width:768px){.navbar-header{float:left}}.navbar-collapse{padding-right:15px;padding-left:15px;overflow-x:visible;-webkit-overflow-scrolling:touch;border-top:1px solid transparent;-webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,.1);box-shadow:inset 0 1px 0 rgba(255,255,255,.1)}.navbar-collapse.in{overflow-y:auto}@media (min-width:768px){.navbar-collapse{width:auto;border-top:0;-webkit-box-shadow:none;box-shadow:none}.navbar-collapse.collapse{display:block!important;height:auto!important;padding-bottom:0;overflow:visible!important}.navbar-collapse.in{overflow-y:visible}.navbar-fixed-bottom .navbar-collapse,.navbar-fixed-top .navbar-collapse,.navbar-static-top .navbar-collapse{padding-right:0;padding-left:0}}.navbar-fixed-bottom .navbar-collapse,.navbar-fixed-top .navbar-collapse{max-height:340px}@media (max-device-width:480px) and (orientation:landscape){.navbar-fixed-bottom .navbar-collapse,.navbar-fixed-top .navbar-collapse{max-height:200px}}.container-fluid>.navbar-collapse,.container-fluid>.navbar-header,.container>.navbar-collapse,.container>.navbar-header{margin-right:-15px;margin-left:-15px}@media (min-width:768px){.container-fluid>.navbar-collapse,.container-fluid>.navbar-header,.container>.navbar-collapse,.container>.navbar-header{margin-right:0;margin-left:0}}.navbar-static-top{z-index:1000;border-width:0 0 1px}@media (min-width:768px){.navbar-static-top{border-radius:0}}.navbar-fixed-bottom,.navbar-fixed-top{position:fixed;right:0;left:0;z-index:1030}@media (min-width:768px){.navbar-fixed-bottom,.navbar-fixed-top{border-radius:0}}.navbar-fixed-top{top:0;border-width:0 0 1px}.navbar-fixed-bottom{bottom:0;margin-bottom:0;border-width:1px 0 0}.navbar-brand{float:left;height:50px;padding:15px 15px;font-size:18px;line-height:20px}.navbar-brand:focus,.navbar-brand:hover{text-decoration:none}.navbar-brand>img{display:block}@media (min-width:768px){.navbar>.container .navbar-brand,.navbar>.container-fluid .navbar-brand{margin-left:-15px}}.navbar-toggle{position:relative;float:right;padding:9px 10px;margin-top:8px;margin-right:15px;margin-bottom:8px;background-color:transparent;background-image:none;border:1px solid transparent;border-radius:4px}.navbar-toggle:focus{outline:0}.navbar-toggle .icon-bar{display:block;width:22px;height:2px;border-radius:1px}.navbar-toggle .icon-bar+.icon-bar{margin-top:4px}@media (min-width:768px){.navbar-toggle{display:none}}.navbar-nav{margin:7.5px -15px}.navbar-nav>li>a{padding-top:10px;padding-bottom:10px;line-height:20px}@media (max-width:767px){.navbar-nav .open .dropdown-menu{position:static;float:none;width:auto;margin-top:0;background-color:transparent;border:0;-webkit-box-shadow:none;box-shadow:none}.navbar-nav .open .dropdown-menu .dropdown-header,.navbar-nav .open .dropdown-menu>li>a{padding:5px 15px 5px 25px}.navbar-nav .open .dropdown-menu>li>a{line-height:20px}.navbar-nav .open .dropdown-menu>li>a:focus,.navbar-nav .open .dropdown-menu>li>a:hover{background-image:none}}@media (min-width:768px){.navbar-nav{float:left;margin:0}.navbar-nav>li{float:left}.navbar-nav>li>a{padding-top:15px;padding-bottom:15px}}.navbar-form{padding:10px 15px;margin-top:8px;margin-right:-15px;margin-bottom:8px;margin-left:-15px;border-top:1px solid transparent;border-bottom:1px solid transparent;-webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,.1),0 1px 0 rgba(255,255,255,.1);box-shadow:inset 0 1px 0 rgba(255,255,255,.1),0 1px 0 rgba(255,255,255,.1)}@media (min-width:768px){.navbar-form .form-group{display:inline-block;margin-bottom:0;vertical-align:middle}.navbar-form .form-control{display:inline-block;width:auto;vertical-align:middle}.navbar-form .form-control-static{display:inline-block}.navbar-form .input-group{display:inline-table;vertical-align:middle}.navbar-form .input-group .form-control,.navbar-form .input-group .input-group-addon,.navbar-form .input-group .input-group-btn{width:auto}.navbar-form .input-group>.form-control{width:100%}.navbar-form .control-label{margin-bottom:0;vertical-align:middle}.navbar-form .checkbox,.navbar-form .radio{display:inline-block;margin-top:0;margin-bottom:0;vertical-align:middle}.navbar-form .checkbox label,.navbar-form .radio label{padding-left:0}.navbar-form .checkbox input[type=checkbox],.navbar-form .radio input[type=radio]{position:relative;margin-left:0}.navbar-form .has-feedback .form-control-feedback{top:0}}@media (max-width:767px){.navbar-form .form-group{margin-bottom:5px}.navbar-form .form-group:last-child{margin-bottom:0}}@media (min-width:768px){.navbar-form{width:auto;padding-top:0;padding-bottom:0;margin-right:0;margin-left:0;border:0;-webkit-box-shadow:none;box-shadow:none}}.navbar-nav>li>.dropdown-menu{margin-top:0;border-top-left-radius:0;border-top-right-radius:0}.navbar-fixed-bottom .navbar-nav>li>.dropdown-menu{margin-bottom:0;border-top-left-radius:4px;border-top-right-radius:4px;border-bottom-right-radius:0;border-bottom-left-radius:0}.navbar-btn{margin-top:8px;margin-bottom:8px}.navbar-btn.btn-sm{margin-top:10px;margin-bottom:10px}.navbar-btn.btn-xs{margin-top:14px;margin-bottom:14px}.navbar-text{margin-top:15px;margin-bottom:15px}@media (min-width:768px){.navbar-text{float:left;margin-right:15px;margin-left:15px}}@media (min-width:768px){.navbar-left{float:left!important}.navbar-right{float:right!important;margin-right:-15px}.navbar-right~.navbar-right{margin-right:0}}.navbar-default{background-color:#f8f8f8;border-color:#e7e7e7}.navbar-default .navbar-brand{color:#777}.navbar-default .navbar-brand:focus,.navbar-default .navbar-brand:hover{color:#5e5e5e;background-color:transparent}.navbar-default .navbar-text{color:#777}.navbar-default .navbar-nav>li>a{color:#777}.navbar-default .navbar-nav>li>a:focus,.navbar-default .navbar-nav>li>a:hover{color:#333;background-color:transparent}.navbar-default .navbar-nav>.active>a,.navbar-default .navbar-nav>.active>a:focus,.navbar-default .navbar-nav>.active>a:hover{color:#555;background-color:#e7e7e7}.navbar-default .navbar-nav>.disabled>a,.navbar-default .navbar-nav>.disabled>a:focus,.navbar-default .navbar-nav>.disabled>a:hover{color:#ccc;background-color:transparent}.navbar-default .navbar-toggle{border-color:#ddd}.navbar-default .navbar-toggle:focus,.navbar-default .navbar-toggle:hover{background-color:#ddd}.navbar-default .navbar-toggle .icon-bar{background-color:#888}.navbar-default .navbar-collapse,.navbar-default .navbar-form{border-color:#e7e7e7}.navbar-default .navbar-nav>.open>a,.navbar-default .navbar-nav>.open>a:focus,.navbar-default .navbar-nav>.open>a:hover{color:#555;background-color:#e7e7e7}@media (max-width:767px){.navbar-default .navbar-nav .open .dropdown-menu>li>a{color:#777}.navbar-default .navbar-nav .open .dropdown-menu>li>a:focus,.navbar-default .navbar-nav .open .dropdown-menu>li>a:hover{color:#333;background-color:transparent}.navbar-default .navbar-nav .open .dropdown-menu>.active>a,.navbar-default .navbar-nav .open .dropdown-menu>.active>a:focus,.navbar-default .navbar-nav .open .dropdown-menu>.active>a:hover{color:#555;background-color:#e7e7e7}.navbar-default .navbar-nav .open .dropdown-menu>.disabled>a,.navbar-default .navbar-nav .open .dropdown-menu>.disabled>a:focus,.navbar-default .navbar-nav .open .dropdown-menu>.disabled>a:hover{color:#ccc;background-color:transparent}}.navbar-default .navbar-link{color:#777}.navbar-default .navbar-link:hover{color:#333}.navbar-default .btn-link{color:#777}.navbar-default .btn-link:focus,.navbar-default .btn-link:hover{color:#333}.navbar-default .btn-link[disabled]:focus,.navbar-default .btn-link[disabled]:hover,fieldset[disabled] .navbar-default .btn-link:focus,fieldset[disabled] .navbar-default .btn-link:hover{color:#ccc}.navbar-inverse{background-color:#222;border-color:#080808}.navbar-inverse .navbar-brand{color:#9d9d9d}.navbar-inverse .navbar-brand:focus,.navbar-inverse .navbar-brand:hover{color:#fff;background-color:transparent}.navbar-inverse .navbar-text{color:#9d9d9d}.navbar-inverse .navbar-nav>li>a{color:#9d9d9d}.navbar-inverse .navbar-nav>li>a:focus,.navbar-inverse .navbar-nav>li>a:hover{color:#fff;background-color:transparent}.navbar-inverse .navbar-nav>.active>a,.navbar-inverse .navbar-nav>.active>a:focus,.navbar-inverse .navbar-nav>.active>a:hover{color:#fff;background-color:#080808}.navbar-inverse .navbar-nav>.disabled>a,.navbar-inverse .navbar-nav>.disabled>a:focus,.navbar-inverse .navbar-nav>.disabled>a:hover{color:#444;background-color:transparent}.navbar-inverse .navbar-toggle{border-color:#333}.navbar-inverse .navbar-toggle:focus,.navbar-inverse .navbar-toggle:hover{background-color:#333}.navbar-inverse .navbar-toggle .icon-bar{background-color:#fff}.navbar-inverse .navbar-collapse,.navbar-inverse .navbar-form{border-color:#101010}.navbar-inverse .navbar-nav>.open>a,.navbar-inverse .navbar-nav>.open>a:focus,.navbar-inverse .navbar-nav>.open>a:hover{color:#fff;background-color:#080808}@media (max-width:767px){.navbar-inverse .navbar-nav .open .dropdown-menu>.dropdown-header{border-color:#080808}.navbar-inverse .navbar-nav .open .dropdown-menu .divider{background-color:#080808}.navbar-inverse .navbar-nav .open .dropdown-menu>li>a{color:#9d9d9d}.navbar-inverse .navbar-nav .open .dropdown-menu>li>a:focus,.navbar-inverse .navbar-nav .open .dropdown-menu>li>a:hover{color:#fff;background-color:transparent}.navbar-inverse .navbar-nav .open .dropdown-menu>.active>a,.navbar-inverse .navbar-nav .open .dropdown-menu>.active>a:focus,.navbar-inverse .navbar-nav .open .dropdown-menu>.active>a:hover{color:#fff;background-color:#080808}.navbar-inverse .navbar-nav .open .dropdown-menu>.disabled>a,.navbar-inverse .navbar-nav .open .dropdown-menu>.disabled>a:focus,.navbar-inverse .navbar-nav .open .dropdown-menu>.disabled>a:hover{color:#444;background-color:transparent}}.navbar-inverse .navbar-link{color:#9d9d9d}.navbar-inverse .navbar-link:hover{color:#fff}.navbar-inverse .btn-link{color:#9d9d9d}.navbar-inverse .btn-link:focus,.navbar-inverse .btn-link:hover{color:#fff}.navbar-inverse .btn-link[disabled]:focus,.navbar-inverse .btn-link[disabled]:hover,fieldset[disabled] .navbar-inverse .btn-link:focus,fieldset[disabled] .navbar-inverse .btn-link:hover{color:#444}.breadcrumb{padding:8px 15px;margin-bottom:20px;list-style:none;background-color:#f5f5f5;border-radius:4px}.breadcrumb>li{display:inline-block}.breadcrumb>li+li:before{padding:0 5px;color:#ccc;content:"/\\00a0"}.breadcrumb>.active{color:#777}.pagination{display:inline-block;padding-left:0;margin:20px 0;border-radius:4px}.pagination>li{display:inline}.pagination>li>a,.pagination>li>span{position:relative;float:left;padding:6px 12px;margin-left:-1px;line-height:1.42857143;color:#337ab7;text-decoration:none;background-color:#fff;border:1px solid #ddd}.pagination>li:first-child>a,.pagination>li:first-child>span{margin-left:0;border-top-left-radius:4px;border-bottom-left-radius:4px}.pagination>li:last-child>a,.pagination>li:last-child>span{border-top-right-radius:4px;border-bottom-right-radius:4px}.pagination>li>a:focus,.pagination>li>a:hover,.pagination>li>span:focus,.pagination>li>span:hover{z-index:2;color:#23527c;background-color:#eee;border-color:#ddd}.pagination>.active>a,.pagination>.active>a:focus,.pagination>.active>a:hover,.pagination>.active>span,.pagination>.active>span:focus,.pagination>.active>span:hover{z-index:3;color:#fff;cursor:default;background-color:#337ab7;border-color:#337ab7}.pagination>.disabled>a,.pagination>.disabled>a:focus,.pagination>.disabled>a:hover,.pagination>.disabled>span,.pagination>.disabled>span:focus,.pagination>.disabled>span:hover{color:#777;cursor:not-allowed;background-color:#fff;border-color:#ddd}.pagination-lg>li>a,.pagination-lg>li>span{padding:10px 16px;font-size:18px;line-height:1.3333333}.pagination-lg>li:first-child>a,.pagination-lg>li:first-child>span{border-top-left-radius:6px;border-bottom-left-radius:6px}.pagination-lg>li:last-child>a,.pagination-lg>li:last-child>span{border-top-right-radius:6px;border-bottom-right-radius:6px}.pagination-sm>li>a,.pagination-sm>li>span{padding:5px 10px;font-size:12px;line-height:1.5}.pagination-sm>li:first-child>a,.pagination-sm>li:first-child>span{border-top-left-radius:3px;border-bottom-left-radius:3px}.pagination-sm>li:last-child>a,.pagination-sm>li:last-child>span{border-top-right-radius:3px;border-bottom-right-radius:3px}.pager{padding-left:0;margin:20px 0;text-align:center;list-style:none}.pager li{display:inline}.pager li>a,.pager li>span{display:inline-block;padding:5px 14px;background-color:#fff;border:1px solid #ddd;border-radius:15px}.pager li>a:focus,.pager li>a:hover{text-decoration:none;background-color:#eee}.pager .next>a,.pager .next>span{float:right}.pager .previous>a,.pager .previous>span{float:left}.pager .disabled>a,.pager .disabled>a:focus,.pager .disabled>a:hover,.pager .disabled>span{color:#777;cursor:not-allowed;background-color:#fff}.label{display:inline;padding:.2em .6em .3em;font-size:75%;font-weight:700;line-height:1;color:#fff;text-align:center;white-space:nowrap;vertical-align:baseline;border-radius:.25em}a.label:focus,a.label:hover{color:#fff;text-decoration:none;cursor:pointer}.label:empty{display:none}.btn .label{position:relative;top:-1px}.label-default{background-color:#777}.label-default[href]:focus,.label-default[href]:hover{background-color:#5e5e5e}.label-primary{background-color:#337ab7}.label-primary[href]:focus,.label-primary[href]:hover{background-color:#286090}.label-success{background-color:#5cb85c}.label-success[href]:focus,.label-success[href]:hover{background-color:#449d44}.label-info{background-color:#5bc0de}.label-info[href]:focus,.label-info[href]:hover{background-color:#31b0d5}.label-warning{background-color:#f0ad4e}.label-warning[href]:focus,.label-warning[href]:hover{background-color:#ec971f}.label-danger{background-color:#d9534f}.label-danger[href]:focus,.label-danger[href]:hover{background-color:#c9302c}.badge{display:inline-block;min-width:10px;padding:3px 7px;font-size:12px;font-weight:700;line-height:1;color:#fff;text-align:center;white-space:nowrap;vertical-align:middle;background-color:#777;border-radius:10px}.badge:empty{display:none}.btn .badge{position:relative;top:-1px}.btn-group-xs>.btn .badge,.btn-xs .badge{top:0;padding:1px 5px}a.badge:focus,a.badge:hover{color:#fff;text-decoration:none;cursor:pointer}.list-group-item.active>.badge,.nav-pills>.active>a>.badge{color:#337ab7;background-color:#fff}.list-group-item>.badge{float:right}.list-group-item>.badge+.badge{margin-right:5px}.nav-pills>li>a>.badge{margin-left:3px}.jumbotron{padding-top:30px;padding-bottom:30px;margin-bottom:30px;color:inherit;background-color:#eee}.jumbotron .h1,.jumbotron h1{color:inherit}.jumbotron p{margin-bottom:15px;font-size:21px;font-weight:200}.jumbotron>hr{border-top-color:#d5d5d5}.container .jumbotron,.container-fluid .jumbotron{padding-right:15px;padding-left:15px;border-radius:6px}.jumbotron .container{max-width:100%}@media screen and (min-width:768px){.jumbotron{padding-top:48px;padding-bottom:48px}.container .jumbotron,.container-fluid .jumbotron{padding-right:60px;padding-left:60px}.jumbotron .h1,.jumbotron h1{font-size:63px}}.thumbnail{display:block;padding:4px;margin-bottom:20px;line-height:1.42857143;background-color:#fff;border:1px solid #ddd;border-radius:4px;-webkit-transition:border .2s ease-in-out;-o-transition:border .2s ease-in-out;transition:border .2s ease-in-out}.thumbnail a>img,.thumbnail>img{margin-right:auto;margin-left:auto}a.thumbnail.active,a.thumbnail:focus,a.thumbnail:hover{border-color:#337ab7}.thumbnail .caption{padding:9px;color:#333}.alert{padding:15px;margin-bottom:20px;border:1px solid transparent;border-radius:4px}.alert h4{margin-top:0;color:inherit}.alert .alert-link{font-weight:700}.alert>p,.alert>ul{margin-bottom:0}.alert>p+p{margin-top:5px}.alert-dismissable,.alert-dismissible{padding-right:35px}.alert-dismissable .close,.alert-dismissible .close{position:relative;top:-2px;right:-21px;color:inherit}.alert-success{color:#3c763d;background-color:#dff0d8;border-color:#d6e9c6}.alert-success hr{border-top-color:#c9e2b3}.alert-success .alert-link{color:#2b542c}.alert-info{color:#31708f;background-color:#d9edf7;border-color:#bce8f1}.alert-info hr{border-top-color:#a6e1ec}.alert-info .alert-link{color:#245269}.alert-warning{color:#8a6d3b;background-color:#fcf8e3;border-color:#faebcc}.alert-warning hr{border-top-color:#f7e1b5}.alert-warning .alert-link{color:#66512c}.alert-danger{color:#a94442;background-color:#f2dede;border-color:#ebccd1}.alert-danger hr{border-top-color:#e4b9c0}.alert-danger .alert-link{color:#843534}@-webkit-keyframes progress-bar-stripes{from{background-position:40px 0}to{background-position:0 0}}@-o-keyframes progress-bar-stripes{from{background-position:40px 0}to{background-position:0 0}}@keyframes progress-bar-stripes{from{background-position:40px 0}to{background-position:0 0}}.progress{height:20px;margin-bottom:20px;overflow:hidden;background-color:#f5f5f5;border-radius:4px;-webkit-box-shadow:inset 0 1px 2px rgba(0,0,0,.1);box-shadow:inset 0 1px 2px rgba(0,0,0,.1)}.progress-bar{float:left;width:0;height:100%;font-size:12px;line-height:20px;color:#fff;text-align:center;background-color:#337ab7;-webkit-box-shadow:inset 0 -1px 0 rgba(0,0,0,.15);box-shadow:inset 0 -1px 0 rgba(0,0,0,.15);-webkit-transition:width .6s ease;-o-transition:width .6s ease;transition:width .6s ease}.progress-bar-striped,.progress-striped .progress-bar{background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);-webkit-background-size:40px 40px;background-size:40px 40px}.progress-bar.active,.progress.active .progress-bar{-webkit-animation:progress-bar-stripes 2s linear infinite;-o-animation:progress-bar-stripes 2s linear infinite;animation:progress-bar-stripes 2s linear infinite}.progress-bar-success{background-color:#5cb85c}.progress-striped .progress-bar-success{background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent)}.progress-bar-info{background-color:#5bc0de}.progress-striped .progress-bar-info{background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent)}.progress-bar-warning{background-color:#f0ad4e}.progress-striped .progress-bar-warning{background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent)}.progress-bar-danger{background-color:#d9534f}.progress-striped .progress-bar-danger{background-image:-webkit-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:-o-linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent);background-image:linear-gradient(45deg,rgba(255,255,255,.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,.15) 50%,rgba(255,255,255,.15) 75%,transparent 75%,transparent)}.media{margin-top:15px}.media:first-child{margin-top:0}.media,.media-body{overflow:hidden;zoom:1}.media-body{width:10000px}.media-object{display:block}.media-object.img-thumbnail{max-width:none}.media-right,.media>.pull-right{padding-left:10px}.media-left,.media>.pull-left{padding-right:10px}.media-body,.media-left,.media-right{display:table-cell;vertical-align:top}.media-middle{vertical-align:middle}.media-bottom{vertical-align:bottom}.media-heading{margin-top:0;margin-bottom:5px}.media-list{padding-left:0;list-style:none}.list-group{padding-left:0;margin-bottom:20px}.list-group-item{position:relative;display:block;padding:10px 15px;margin-bottom:-1px;background-color:#fff;border:1px solid #ddd}.list-group-item:first-child{border-top-left-radius:4px;border-top-right-radius:4px}.list-group-item:last-child{margin-bottom:0;border-bottom-right-radius:4px;border-bottom-left-radius:4px}a.list-group-item,button.list-group-item{color:#555}a.list-group-item .list-group-item-heading,button.list-group-item .list-group-item-heading{color:#333}a.list-group-item:focus,a.list-group-item:hover,button.list-group-item:focus,button.list-group-item:hover{color:#555;text-decoration:none;background-color:#f5f5f5}button.list-group-item{width:100%;text-align:left}.list-group-item.disabled,.list-group-item.disabled:focus,.list-group-item.disabled:hover{color:#777;cursor:not-allowed;background-color:#eee}.list-group-item.disabled .list-group-item-heading,.list-group-item.disabled:focus .list-group-item-heading,.list-group-item.disabled:hover .list-group-item-heading{color:inherit}.list-group-item.disabled .list-group-item-text,.list-group-item.disabled:focus .list-group-item-text,.list-group-item.disabled:hover .list-group-item-text{color:#777}.list-group-item.active,.list-group-item.active:focus,.list-group-item.active:hover{z-index:2;color:#fff;background-color:#337ab7;border-color:#337ab7}.list-group-item.active .list-group-item-heading,.list-group-item.active .list-group-item-heading>.small,.list-group-item.active .list-group-item-heading>small,.list-group-item.active:focus .list-group-item-heading,.list-group-item.active:focus .list-group-item-heading>.small,.list-group-item.active:focus .list-group-item-heading>small,.list-group-item.active:hover .list-group-item-heading,.list-group-item.active:hover .list-group-item-heading>.small,.list-group-item.active:hover .list-group-item-heading>small{color:inherit}.list-group-item.active .list-group-item-text,.list-group-item.active:focus .list-group-item-text,.list-group-item.active:hover .list-group-item-text{color:#c7ddef}.list-group-item-success{color:#3c763d;background-color:#dff0d8}a.list-group-item-success,button.list-group-item-success{color:#3c763d}a.list-group-item-success .list-group-item-heading,button.list-group-item-success .list-group-item-heading{color:inherit}a.list-group-item-success:focus,a.list-group-item-success:hover,button.list-group-item-success:focus,button.list-group-item-success:hover{color:#3c763d;background-color:#d0e9c6}a.list-group-item-success.active,a.list-group-item-success.active:focus,a.list-group-item-success.active:hover,button.list-group-item-success.active,button.list-group-item-success.active:focus,button.list-group-item-success.active:hover{color:#fff;background-color:#3c763d;border-color:#3c763d}.list-group-item-info{color:#31708f;background-color:#d9edf7}a.list-group-item-info,button.list-group-item-info{color:#31708f}a.list-group-item-info .list-group-item-heading,button.list-group-item-info .list-group-item-heading{color:inherit}a.list-group-item-info:focus,a.list-group-item-info:hover,button.list-group-item-info:focus,button.list-group-item-info:hover{color:#31708f;background-color:#c4e3f3}a.list-group-item-info.active,a.list-group-item-info.active:focus,a.list-group-item-info.active:hover,button.list-group-item-info.active,button.list-group-item-info.active:focus,button.list-group-item-info.active:hover{color:#fff;background-color:#31708f;border-color:#31708f}.list-group-item-warning{color:#8a6d3b;background-color:#fcf8e3}a.list-group-item-warning,button.list-group-item-warning{color:#8a6d3b}a.list-group-item-warning .list-group-item-heading,button.list-group-item-warning .list-group-item-heading{color:inherit}a.list-group-item-warning:focus,a.list-group-item-warning:hover,button.list-group-item-warning:focus,button.list-group-item-warning:hover{color:#8a6d3b;background-color:#faf2cc}a.list-group-item-warning.active,a.list-group-item-warning.active:focus,a.list-group-item-warning.active:hover,button.list-group-item-warning.active,button.list-group-item-warning.active:focus,button.list-group-item-warning.active:hover{color:#fff;background-color:#8a6d3b;border-color:#8a6d3b}.list-group-item-danger{color:#a94442;background-color:#f2dede}a.list-group-item-danger,button.list-group-item-danger{color:#a94442}a.list-group-item-danger .list-group-item-heading,button.list-group-item-danger .list-group-item-heading{color:inherit}a.list-group-item-danger:focus,a.list-group-item-danger:hover,button.list-group-item-danger:focus,button.list-group-item-danger:hover{color:#a94442;background-color:#ebcccc}a.list-group-item-danger.active,a.list-group-item-danger.active:focus,a.list-group-item-danger.active:hover,button.list-group-item-danger.active,button.list-group-item-danger.active:focus,button.list-group-item-danger.active:hover{color:#fff;background-color:#a94442;border-color:#a94442}.list-group-item-heading{margin-top:0;margin-bottom:5px}.list-group-item-text{margin-bottom:0;line-height:1.3}.panel{margin-bottom:20px;background-color:#fff;border:1px solid transparent;border-radius:4px;-webkit-box-shadow:0 1px 1px rgba(0,0,0,.05);box-shadow:0 1px 1px rgba(0,0,0,.05)}.panel-body{padding:15px}.panel-heading{padding:10px 15px;border-bottom:1px solid transparent;border-top-left-radius:3px;border-top-right-radius:3px}.panel-heading>.dropdown .dropdown-toggle{color:inherit}.panel-title{margin-top:0;margin-bottom:0;font-size:16px;color:inherit}.panel-title>.small,.panel-title>.small>a,.panel-title>a,.panel-title>small,.panel-title>small>a{color:inherit}.panel-footer{padding:10px 15px;background-color:#f5f5f5;border-top:1px solid #ddd;border-bottom-right-radius:3px;border-bottom-left-radius:3px}.panel>.list-group,.panel>.panel-collapse>.list-group{margin-bottom:0}.panel>.list-group .list-group-item,.panel>.panel-collapse>.list-group .list-group-item{border-width:1px 0;border-radius:0}.panel>.list-group:first-child .list-group-item:first-child,.panel>.panel-collapse>.list-group:first-child .list-group-item:first-child{border-top:0;border-top-left-radius:3px;border-top-right-radius:3px}.panel>.list-group:last-child .list-group-item:last-child,.panel>.panel-collapse>.list-group:last-child .list-group-item:last-child{border-bottom:0;border-bottom-right-radius:3px;border-bottom-left-radius:3px}.panel>.panel-heading+.panel-collapse>.list-group .list-group-item:first-child{border-top-left-radius:0;border-top-right-radius:0}.panel-heading+.list-group .list-group-item:first-child{border-top-width:0}.list-group+.panel-footer{border-top-width:0}.panel>.panel-collapse>.table,.panel>.table,.panel>.table-responsive>.table{margin-bottom:0}.panel>.panel-collapse>.table caption,.panel>.table caption,.panel>.table-responsive>.table caption{padding-right:15px;padding-left:15px}.panel>.table-responsive:first-child>.table:first-child,.panel>.table:first-child{border-top-left-radius:3px;border-top-right-radius:3px}.panel>.table-responsive:first-child>.table:first-child>tbody:first-child>tr:first-child,.panel>.table-responsive:first-child>.table:first-child>thead:first-child>tr:first-child,.panel>.table:first-child>tbody:first-child>tr:first-child,.panel>.table:first-child>thead:first-child>tr:first-child{border-top-left-radius:3px;border-top-right-radius:3px}.panel>.table-responsive:first-child>.table:first-child>tbody:first-child>tr:first-child td:first-child,.panel>.table-responsive:first-child>.table:first-child>tbody:first-child>tr:first-child th:first-child,.panel>.table-responsive:first-child>.table:first-child>thead:first-child>tr:first-child td:first-child,.panel>.table-responsive:first-child>.table:first-child>thead:first-child>tr:first-child th:first-child,.panel>.table:first-child>tbody:first-child>tr:first-child td:first-child,.panel>.table:first-child>tbody:first-child>tr:first-child th:first-child,.panel>.table:first-child>thead:first-child>tr:first-child td:first-child,.panel>.table:first-child>thead:first-child>tr:first-child th:first-child{border-top-left-radius:3px}.panel>.table-responsive:first-child>.table:first-child>tbody:first-child>tr:first-child td:last-child,.panel>.table-responsive:first-child>.table:first-child>tbody:first-child>tr:first-child th:last-child,.panel>.table-responsive:first-child>.table:first-child>thead:first-child>tr:first-child td:last-child,.panel>.table-responsive:first-child>.table:first-child>thead:first-child>tr:first-child th:last-child,.panel>.table:first-child>tbody:first-child>tr:first-child td:last-child,.panel>.table:first-child>tbody:first-child>tr:first-child th:last-child,.panel>.table:first-child>thead:first-child>tr:first-child td:last-child,.panel>.table:first-child>thead:first-child>tr:first-child th:last-child{border-top-right-radius:3px}.panel>.table-responsive:last-child>.table:last-child,.panel>.table:last-child{border-bottom-right-radius:3px;border-bottom-left-radius:3px}.panel>.table-responsive:last-child>.table:last-child>tbody:last-child>tr:last-child,.panel>.table-responsive:last-child>.table:last-child>tfoot:last-child>tr:last-child,.panel>.table:last-child>tbody:last-child>tr:last-child,.panel>.table:last-child>tfoot:last-child>tr:last-child{border-bottom-right-radius:3px;border-bottom-left-radius:3px}.panel>.table-responsive:last-child>.table:last-child>tbody:last-child>tr:last-child td:first-child,.panel>.table-responsive:last-child>.table:last-child>tbody:last-child>tr:last-child th:first-child,.panel>.table-responsive:last-child>.table:last-child>tfoot:last-child>tr:last-child td:first-child,.panel>.table-responsive:last-child>.table:last-child>tfoot:last-child>tr:last-child th:first-child,.panel>.table:last-child>tbody:last-child>tr:last-child td:first-child,.panel>.table:last-child>tbody:last-child>tr:last-child th:first-child,.panel>.table:last-child>tfoot:last-child>tr:last-child td:first-child,.panel>.table:last-child>tfoot:last-child>tr:last-child th:first-child{border-bottom-left-radius:3px}.panel>.table-responsive:last-child>.table:last-child>tbody:last-child>tr:last-child td:last-child,.panel>.table-responsive:last-child>.table:last-child>tbody:last-child>tr:last-child th:last-child,.panel>.table-responsive:last-child>.table:last-child>tfoot:last-child>tr:last-child td:last-child,.panel>.table-responsive:last-child>.table:last-child>tfoot:last-child>tr:last-child th:last-child,.panel>.table:last-child>tbody:last-child>tr:last-child td:last-child,.panel>.table:last-child>tbody:last-child>tr:last-child th:last-child,.panel>.table:last-child>tfoot:last-child>tr:last-child td:last-child,.panel>.table:last-child>tfoot:last-child>tr:last-child th:last-child{border-bottom-right-radius:3px}.panel>.panel-body+.table,.panel>.panel-body+.table-responsive,.panel>.table+.panel-body,.panel>.table-responsive+.panel-body{border-top:1px solid #ddd}.panel>.table>tbody:first-child>tr:first-child td,.panel>.table>tbody:first-child>tr:first-child th{border-top:0}.panel>.table-bordered,.panel>.table-responsive>.table-bordered{border:0}.panel>.table-bordered>tbody>tr>td:first-child,.panel>.table-bordered>tbody>tr>th:first-child,.panel>.table-bordered>tfoot>tr>td:first-child,.panel>.table-bordered>tfoot>tr>th:first-child,.panel>.table-bordered>thead>tr>td:first-child,.panel>.table-bordered>thead>tr>th:first-child,.panel>.table-responsive>.table-bordered>tbody>tr>td:first-child,.panel>.table-responsive>.table-bordered>tbody>tr>th:first-child,.panel>.table-responsive>.table-bordered>tfoot>tr>td:first-child,.panel>.table-responsive>.table-bordered>tfoot>tr>th:first-child,.panel>.table-responsive>.table-bordered>thead>tr>td:first-child,.panel>.table-responsive>.table-bordered>thead>tr>th:first-child{border-left:0}.panel>.table-bordered>tbody>tr>td:last-child,.panel>.table-bordered>tbody>tr>th:last-child,.panel>.table-bordered>tfoot>tr>td:last-child,.panel>.table-bordered>tfoot>tr>th:last-child,.panel>.table-bordered>thead>tr>td:last-child,.panel>.table-bordered>thead>tr>th:last-child,.panel>.table-responsive>.table-bordered>tbody>tr>td:last-child,.panel>.table-responsive>.table-bordered>tbody>tr>th:last-child,.panel>.table-responsive>.table-bordered>tfoot>tr>td:last-child,.panel>.table-responsive>.table-bordered>tfoot>tr>th:last-child,.panel>.table-responsive>.table-bordered>thead>tr>td:last-child,.panel>.table-responsive>.table-bordered>thead>tr>th:last-child{border-right:0}.panel>.table-bordered>tbody>tr:first-child>td,.panel>.table-bordered>tbody>tr:first-child>th,.panel>.table-bordered>thead>tr:first-child>td,.panel>.table-bordered>thead>tr:first-child>th,.panel>.table-responsive>.table-bordered>tbody>tr:first-child>td,.panel>.table-responsive>.table-bordered>tbody>tr:first-child>th,.panel>.table-responsive>.table-bordered>thead>tr:first-child>td,.panel>.table-responsive>.table-bordered>thead>tr:first-child>th{border-bottom:0}.panel>.table-bordered>tbody>tr:last-child>td,.panel>.table-bordered>tbody>tr:last-child>th,.panel>.table-bordered>tfoot>tr:last-child>td,.panel>.table-bordered>tfoot>tr:last-child>th,.panel>.table-responsive>.table-bordered>tbody>tr:last-child>td,.panel>.table-responsive>.table-bordered>tbody>tr:last-child>th,.panel>.table-responsive>.table-bordered>tfoot>tr:last-child>td,.panel>.table-responsive>.table-bordered>tfoot>tr:last-child>th{border-bottom:0}.panel>.table-responsive{margin-bottom:0;border:0}.panel-group{margin-bottom:20px}.panel-group .panel{margin-bottom:0;border-radius:4px}.panel-group .panel+.panel{margin-top:5px}.panel-group .panel-heading{border-bottom:0}.panel-group .panel-heading+.panel-collapse>.list-group,.panel-group .panel-heading+.panel-collapse>.panel-body{border-top:1px solid #ddd}.panel-group .panel-footer{border-top:0}.panel-group .panel-footer+.panel-collapse .panel-body{border-bottom:1px solid #ddd}.panel-default{border-color:#ddd}.panel-default>.panel-heading{color:#333;background-color:#f5f5f5;border-color:#ddd}.panel-default>.panel-heading+.panel-collapse>.panel-body{border-top-color:#ddd}.panel-default>.panel-heading .badge{color:#f5f5f5;background-color:#333}.panel-default>.panel-footer+.panel-collapse>.panel-body{border-bottom-color:#ddd}.panel-primary{border-color:#337ab7}.panel-primary>.panel-heading{color:#fff;background-color:#337ab7;border-color:#337ab7}.panel-primary>.panel-heading+.panel-collapse>.panel-body{border-top-color:#337ab7}.panel-primary>.panel-heading .badge{color:#337ab7;background-color:#fff}.panel-primary>.panel-footer+.panel-collapse>.panel-body{border-bottom-color:#337ab7}.panel-success{border-color:#d6e9c6}.panel-success>.panel-heading{color:#3c763d;background-color:#dff0d8;border-color:#d6e9c6}.panel-success>.panel-heading+.panel-collapse>.panel-body{border-top-color:#d6e9c6}.panel-success>.panel-heading .badge{color:#dff0d8;background-color:#3c763d}.panel-success>.panel-footer+.panel-collapse>.panel-body{border-bottom-color:#d6e9c6}.panel-info{border-color:#bce8f1}.panel-info>.panel-heading{color:#31708f;background-color:#d9edf7;border-color:#bce8f1}.panel-info>.panel-heading+.panel-collapse>.panel-body{border-top-color:#bce8f1}.panel-info>.panel-heading .badge{color:#d9edf7;background-color:#31708f}.panel-info>.panel-footer+.panel-collapse>.panel-body{border-bottom-color:#bce8f1}.panel-warning{border-color:#faebcc}.panel-warning>.panel-heading{color:#8a6d3b;background-color:#fcf8e3;border-color:#faebcc}.panel-warning>.panel-heading+.panel-collapse>.panel-body{border-top-color:#faebcc}.panel-warning>.panel-heading .badge{color:#fcf8e3;background-color:#8a6d3b}.panel-warning>.panel-footer+.panel-collapse>.panel-body{border-bottom-color:#faebcc}.panel-danger{border-color:#ebccd1}.panel-danger>.panel-heading{color:#a94442;background-color:#f2dede;border-color:#ebccd1}.panel-danger>.panel-heading+.panel-collapse>.panel-body{border-top-color:#ebccd1}.panel-danger>.panel-heading .badge{color:#f2dede;background-color:#a94442}.panel-danger>.panel-footer+.panel-collapse>.panel-body{border-bottom-color:#ebccd1}.embed-responsive{position:relative;display:block;height:0;padding:0;overflow:hidden}.embed-responsive .embed-responsive-item,.embed-responsive embed,.embed-responsive iframe,.embed-responsive object,.embed-responsive video{position:absolute;top:0;bottom:0;left:0;width:100%;height:100%;border:0}.embed-responsive-16by9{padding-bottom:56.25%}.embed-responsive-4by3{padding-bottom:75%}.well{min-height:20px;padding:19px;margin-bottom:20px;background-color:#f5f5f5;border:1px solid #e3e3e3;border-radius:4px;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.05);box-shadow:inset 0 1px 1px rgba(0,0,0,.05)}.well blockquote{border-color:#ddd;border-color:rgba(0,0,0,.15)}.well-lg{padding:24px;border-radius:6px}.well-sm{padding:9px;border-radius:3px}.close{float:right;font-size:21px;font-weight:700;line-height:1;color:#000;text-shadow:0 1px 0 #fff;filter:alpha(opacity=20);opacity:.2}.close:focus,.close:hover{color:#000;text-decoration:none;cursor:pointer;filter:alpha(opacity=50);opacity:.5}button.close{-webkit-appearance:none;padding:0;cursor:pointer;background:0 0;border:0}.modal-open{overflow:hidden}.modal{position:fixed;top:0;right:0;bottom:0;left:0;z-index:1050;display:none;overflow:hidden;-webkit-overflow-scrolling:touch;outline:0}.modal.fade .modal-dialog{-webkit-transition:-webkit-transform .3s ease-out;-o-transition:-o-transform .3s ease-out;transition:transform .3s ease-out;-webkit-transform:translate(0,-25%);-ms-transform:translate(0,-25%);-o-transform:translate(0,-25%);transform:translate(0,-25%)}.modal.in .modal-dialog{-webkit-transform:translate(0,0);-ms-transform:translate(0,0);-o-transform:translate(0,0);transform:translate(0,0)}.modal-open .modal{overflow-x:hidden;overflow-y:auto}.modal-dialog{position:relative;width:auto;margin:10px}.modal-content{position:relative;background-color:#fff;-webkit-background-clip:padding-box;background-clip:padding-box;border:1px solid #999;border:1px solid rgba(0,0,0,.2);border-radius:6px;outline:0;-webkit-box-shadow:0 3px 9px rgba(0,0,0,.5);box-shadow:0 3px 9px rgba(0,0,0,.5)}.modal-backdrop{position:fixed;top:0;right:0;bottom:0;left:0;z-index:1040;background-color:#000}.modal-backdrop.fade{filter:alpha(opacity=0);opacity:0}.modal-backdrop.in{filter:alpha(opacity=50);opacity:.5}.modal-header{padding:15px;border-bottom:1px solid #e5e5e5}.modal-header .close{margin-top:-2px}.modal-title{margin:0;line-height:1.42857143}.modal-body{position:relative;padding:15px}.modal-footer{padding:15px;text-align:right;border-top:1px solid #e5e5e5}.modal-footer .btn+.btn{margin-bottom:0;margin-left:5px}.modal-footer .btn-group .btn+.btn{margin-left:-1px}.modal-footer .btn-block+.btn-block{margin-left:0}.modal-scrollbar-measure{position:absolute;top:-9999px;width:50px;height:50px;overflow:scroll}@media (min-width:768px){.modal-dialog{width:600px;margin:30px auto}.modal-content{-webkit-box-shadow:0 5px 15px rgba(0,0,0,.5);box-shadow:0 5px 15px rgba(0,0,0,.5)}.modal-sm{width:300px}}@media (min-width:992px){.modal-lg{width:900px}}.tooltip{position:absolute;z-index:1070;display:block;font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;font-size:12px;font-style:normal;font-weight:400;line-height:1.42857143;text-align:left;text-align:start;text-decoration:none;text-shadow:none;text-transform:none;letter-spacing:normal;word-break:normal;word-spacing:normal;word-wrap:normal;white-space:normal;filter:alpha(opacity=0);opacity:0;line-break:auto}.tooltip.in{filter:alpha(opacity=90);opacity:.9}.tooltip.top{padding:5px 0;margin-top:-3px}.tooltip.right{padding:0 5px;margin-left:3px}.tooltip.bottom{padding:5px 0;margin-top:3px}.tooltip.left{padding:0 5px;margin-left:-3px}.tooltip-inner{max-width:200px;padding:3px 8px;color:#fff;text-align:center;background-color:#000;border-radius:4px}.tooltip-arrow{position:absolute;width:0;height:0;border-color:transparent;border-style:solid}.tooltip.top .tooltip-arrow{bottom:0;left:50%;margin-left:-5px;border-width:5px 5px 0;border-top-color:#000}.tooltip.top-left .tooltip-arrow{right:5px;bottom:0;margin-bottom:-5px;border-width:5px 5px 0;border-top-color:#000}.tooltip.top-right .tooltip-arrow{bottom:0;left:5px;margin-bottom:-5px;border-width:5px 5px 0;border-top-color:#000}.tooltip.right .tooltip-arrow{top:50%;left:0;margin-top:-5px;border-width:5px 5px 5px 0;border-right-color:#000}.tooltip.left .tooltip-arrow{top:50%;right:0;margin-top:-5px;border-width:5px 0 5px 5px;border-left-color:#000}.tooltip.bottom .tooltip-arrow{top:0;left:50%;margin-left:-5px;border-width:0 5px 5px;border-bottom-color:#000}.tooltip.bottom-left .tooltip-arrow{top:0;right:5px;margin-top:-5px;border-width:0 5px 5px;border-bottom-color:#000}.tooltip.bottom-right .tooltip-arrow{top:0;left:5px;margin-top:-5px;border-width:0 5px 5px;border-bottom-color:#000}.popover{position:absolute;top:0;left:0;z-index:1060;display:none;max-width:276px;padding:1px;font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;font-size:14px;font-style:normal;font-weight:400;line-height:1.42857143;text-align:left;text-align:start;text-decoration:none;text-shadow:none;text-transform:none;letter-spacing:normal;word-break:normal;word-spacing:normal;word-wrap:normal;white-space:normal;background-color:#fff;-webkit-background-clip:padding-box;background-clip:padding-box;border:1px solid #ccc;border:1px solid rgba(0,0,0,.2);border-radius:6px;-webkit-box-shadow:0 5px 10px rgba(0,0,0,.2);box-shadow:0 5px 10px rgba(0,0,0,.2);line-break:auto}.popover.top{margin-top:-10px}.popover.right{margin-left:10px}.popover.bottom{margin-top:10px}.popover.left{margin-left:-10px}.popover-title{padding:8px 14px;margin:0;font-size:14px;background-color:#f7f7f7;border-bottom:1px solid #ebebeb;border-radius:5px 5px 0 0}.popover-content{padding:9px 14px}.popover>.arrow,.popover>.arrow:after{position:absolute;display:block;width:0;height:0;border-color:transparent;border-style:solid}.popover>.arrow{border-width:11px}.popover>.arrow:after{content:"";border-width:10px}.popover.top>.arrow{bottom:-11px;left:50%;margin-left:-11px;border-top-color:#999;border-top-color:rgba(0,0,0,.25);border-bottom-width:0}.popover.top>.arrow:after{bottom:1px;margin-left:-10px;content:" ";border-top-color:#fff;border-bottom-width:0}.popover.right>.arrow{top:50%;left:-11px;margin-top:-11px;border-right-color:#999;border-right-color:rgba(0,0,0,.25);border-left-width:0}.popover.right>.arrow:after{bottom:-10px;left:1px;content:" ";border-right-color:#fff;border-left-width:0}.popover.bottom>.arrow{top:-11px;left:50%;margin-left:-11px;border-top-width:0;border-bottom-color:#999;border-bottom-color:rgba(0,0,0,.25)}.popover.bottom>.arrow:after{top:1px;margin-left:-10px;content:" ";border-top-width:0;border-bottom-color:#fff}.popover.left>.arrow{top:50%;right:-11px;margin-top:-11px;border-right-width:0;border-left-color:#999;border-left-color:rgba(0,0,0,.25)}.popover.left>.arrow:after{right:1px;bottom:-10px;content:" ";border-right-width:0;border-left-color:#fff}.carousel{position:relative}.carousel-inner{position:relative;width:100%;overflow:hidden}.carousel-inner>.item{position:relative;display:none;-webkit-transition:.6s ease-in-out left;-o-transition:.6s ease-in-out left;transition:.6s ease-in-out left}.carousel-inner>.item>a>img,.carousel-inner>.item>img{line-height:1}@media all and (transform-3d),(-webkit-transform-3d){.carousel-inner>.item{-webkit-transition:-webkit-transform .6s ease-in-out;-o-transition:-o-transform .6s ease-in-out;transition:transform .6s ease-in-out;-webkit-backface-visibility:hidden;backface-visibility:hidden;-webkit-perspective:1000px;perspective:1000px}.carousel-inner>.item.active.right,.carousel-inner>.item.next{left:0;-webkit-transform:translate3d(100%,0,0);transform:translate3d(100%,0,0)}.carousel-inner>.item.active.left,.carousel-inner>.item.prev{left:0;-webkit-transform:translate3d(-100%,0,0);transform:translate3d(-100%,0,0)}.carousel-inner>.item.active,.carousel-inner>.item.next.left,.carousel-inner>.item.prev.right{left:0;-webkit-transform:translate3d(0,0,0);transform:translate3d(0,0,0)}}.carousel-inner>.active,.carousel-inner>.next,.carousel-inner>.prev{display:block}.carousel-inner>.active{left:0}.carousel-inner>.next,.carousel-inner>.prev{position:absolute;top:0;width:100%}.carousel-inner>.next{left:100%}.carousel-inner>.prev{left:-100%}.carousel-inner>.next.left,.carousel-inner>.prev.right{left:0}.carousel-inner>.active.left{left:-100%}.carousel-inner>.active.right{left:100%}.carousel-control{position:absolute;top:0;bottom:0;left:0;width:15%;font-size:20px;color:#fff;text-align:center;text-shadow:0 1px 2px rgba(0,0,0,.6);background-color:rgba(0,0,0,0);filter:alpha(opacity=50);opacity:.5}.carousel-control.left{background-image:-webkit-linear-gradient(left,rgba(0,0,0,.5) 0,rgba(0,0,0,.0001) 100%);background-image:-o-linear-gradient(left,rgba(0,0,0,.5) 0,rgba(0,0,0,.0001) 100%);background-image:-webkit-gradient(linear,left top,right top,from(rgba(0,0,0,.5)),to(rgba(0,0,0,.0001)));background-image:linear-gradient(to right,rgba(0,0,0,.5) 0,rgba(0,0,0,.0001) 100%);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#80000000'', endColorstr=''#00000000'', GradientType=1);background-repeat:repeat-x}.carousel-control.right{right:0;left:auto;background-image:-webkit-linear-gradient(left,rgba(0,0,0,.0001) 0,rgba(0,0,0,.5) 100%);background-image:-o-linear-gradient(left,rgba(0,0,0,.0001) 0,rgba(0,0,0,.5) 100%);background-image:-webkit-gradient(linear,left top,right top,from(rgba(0,0,0,.0001)),to(rgba(0,0,0,.5)));background-image:linear-gradient(to right,rgba(0,0,0,.0001) 0,rgba(0,0,0,.5) 100%);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=''#00000000'', endColorstr=''#80000000'', GradientType=1);background-repeat:repeat-x}.carousel-control:focus,.carousel-control:hover{color:#fff;text-decoration:none;filter:alpha(opacity=90);outline:0;opacity:.9}.carousel-control .glyphicon-chevron-left,.carousel-control .glyphicon-chevron-right,.carousel-control .icon-next,.carousel-control .icon-prev{position:absolute;top:50%;z-index:5;display:inline-block;margin-top:-10px}.carousel-control .glyphicon-chevron-left,.carousel-control .icon-prev{left:50%;margin-left:-10px}.carousel-control .glyphicon-chevron-right,.carousel-control .icon-next{right:50%;margin-right:-10px}.carousel-control .icon-next,.carousel-control .icon-prev{width:20px;height:20px;font-family:serif;line-height:1}.carousel-control .icon-prev:before{content:''\\2039''}.carousel-control .icon-next:before{content:''\\203a''}.carousel-indicators{position:absolute;bottom:10px;left:50%;z-index:15;width:60%;padding-left:0;margin-left:-30%;text-align:center;list-style:none}.carousel-indicators li{display:inline-block;width:10px;height:10px;margin:1px;text-indent:-999px;cursor:pointer;background-color:#000\\9;background-color:rgba(0,0,0,0);border:1px solid #fff;border-radius:10px}.carousel-indicators .active{width:12px;height:12px;margin:0;background-color:#fff}.carousel-caption{position:absolute;right:15%;bottom:20px;left:15%;z-index:10;padding-top:20px;padding-bottom:20px;color:#fff;text-align:center;text-shadow:0 1px 2px rgba(0,0,0,.6)}.carousel-caption .btn{text-shadow:none}@media screen and (min-width:768px){.carousel-control .glyphicon-chevron-left,.carousel-control .glyphicon-chevron-right,.carousel-control .icon-next,.carousel-control .icon-prev{width:30px;height:30px;margin-top:-10px;font-size:30px}.carousel-control .glyphicon-chevron-left,.carousel-control .icon-prev{margin-left:-10px}.carousel-control .glyphicon-chevron-right,.carousel-control .icon-next{margin-right:-10px}.carousel-caption{right:20%;left:20%;padding-bottom:30px}.carousel-indicators{bottom:20px}}.btn-group-vertical>.btn-group:after,.btn-group-vertical>.btn-group:before,.btn-toolbar:after,.btn-toolbar:before,.clearfix:after,.clearfix:before,.container-fluid:after,.container-fluid:before,.container:after,.container:before,.dl-horizontal dd:after,.dl-horizontal dd:before,.form-horizontal .form-group:after,.form-horizontal .form-group:before,.modal-footer:after,.modal-footer:before,.modal-header:after,.modal-header:before,.nav:after,.nav:before,.navbar-collapse:after,.navbar-collapse:before,.navbar-header:after,.navbar-header:before,.navbar:after,.navbar:before,.pager:after,.pager:before,.panel-body:after,.panel-body:before,.row:after,.row:before{display:table;content:" "}.btn-group-vertical>.btn-group:after,.btn-toolbar:after,.clearfix:after,.container-fluid:after,.container:after,.dl-horizontal dd:after,.form-horizontal .form-group:after,.modal-footer:after,.modal-header:after,.nav:after,.navbar-collapse:after,.navbar-header:after,.navbar:after,.pager:after,.panel-body:after,.row:after{clear:both}.center-block{display:block;margin-right:auto;margin-left:auto}.pull-right{float:right!important}.pull-left{float:left!important}.hide{display:none!important}.show{display:block!important}.invisible{visibility:hidden}.text-hide{font:0/0 a;color:transparent;text-shadow:none;background-color:transparent;border:0}.hidden{display:none!important}.affix{position:fixed}@-ms-viewport{width:device-width}.visible-lg,.visible-md,.visible-sm,.visible-xs{display:none!important}.visible-lg-block,.visible-lg-inline,.visible-lg-inline-block,.visible-md-block,.visible-md-inline,.visible-md-inline-block,.visible-sm-block,.visible-sm-inline,.visible-sm-inline-block,.visible-xs-block,.visible-xs-inline,.visible-xs-inline-block{display:none!important}@media (max-width:767px){.visible-xs{display:block!important}table.visible-xs{display:table!important}tr.visible-xs{display:table-row!important}td.visible-xs,th.visible-xs{display:table-cell!important}}@media (max-width:767px){.visible-xs-block{display:block!important}}@media (max-width:767px){.visible-xs-inline{display:inline!important}}@media (max-width:767px){.visible-xs-inline-block{display:inline-block!important}}@media (min-width:768px) and (max-width:991px){.visible-sm{display:block!important}table.visible-sm{display:table!important}tr.visible-sm{display:table-row!important}td.visible-sm,th.visible-sm{display:table-cell!important}}@media (min-width:768px) and (max-width:991px){.visible-sm-block{display:block!important}}@media (min-width:768px) and (max-width:991px){.visible-sm-inline{display:inline!important}}@media (min-width:768px) and (max-width:991px){.visible-sm-inline-block{display:inline-block!important}}@media (min-width:992px) and (max-width:1199px){.visible-md{display:block!important}table.visible-md{display:table!important}tr.visible-md{display:table-row!important}td.visible-md,th.visible-md{display:table-cell!important}}@media (min-width:992px) and (max-width:1199px){.visible-md-block{display:block!important}}@media (min-width:992px) and (max-width:1199px){.visible-md-inline{display:inline!important}}@media (min-width:992px) and (max-width:1199px){.visible-md-inline-block{display:inline-block!important}}@media (min-width:1200px){.visible-lg{display:block!important}table.visible-lg{display:table!important}tr.visible-lg{display:table-row!important}td.visible-lg,th.visible-lg{display:table-cell!important}}@media (min-width:1200px){.visible-lg-block{display:block!important}}@media (min-width:1200px){.visible-lg-inline{display:inline!important}}@media (min-width:1200px){.visible-lg-inline-block{display:inline-block!important}}@media (max-width:767px){.hidden-xs{display:none!important}}@media (min-width:768px) and (max-width:991px){.hidden-sm{display:none!important}}@media (min-width:992px) and (max-width:1199px){.hidden-md{display:none!important}}@media (min-width:1200px){.hidden-lg{display:none!important}}.visible-print{display:none!important}@media print{.visible-print{display:block!important}table.visible-print{display:table!important}tr.visible-print{display:table-row!important}td.visible-print,th.visible-print{display:table-cell!important}}.visible-print-block{display:none!important}@media print{.visible-print-block{display:block!important}}.visible-print-inline{display:none!important}@media print{.visible-print-inline{display:inline!important}}.visible-print-inline-block{display:none!important}@media print{.visible-print-inline-block{display:inline-block!important}}@media print{.hidden-print{display:none!important}}\n/*# sourceMappingURL=bootstrap.min.css.map */', '', 1469810182, 1, 'n', 0, '5', 'n', 'n', 'o', 0, 'n');
INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `template_type`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`, `protect_javascript`) VALUES
(6, 1, 4, 'index', 'webpage', '', NULL, 1469810268, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n'),
(7, 1, 4, 'font-awesome.min', 'css', '/*!\n *  Font Awesome 4.6.3 by @davegandy - http://fontawesome.io - @fontawesome\n *  License - http://fontawesome.io/license (Font: SIL OFL 1.1, CSS: MIT License)\n */@font-face{font-family:''FontAwesome'';src:url(''fonts/fontawesome-webfont.eot?v=4.6.3'');src:url(''fonts/fontawesome-webfont.eot?#iefix&v=4.6.3'') format(''embedded-opentype''),url(''fonts/fontawesome-webfont.woff2?v=4.6.3'') format(''woff2''),url(''fonts/fontawesome-webfont.woff?v=4.6.3'') format(''woff''),url(''fonts/fontawesome-webfont.ttf?v=4.6.3'') format(''truetype''),url(''fonts/fontawesome-webfont.svg?v=4.6.3#fontawesomeregular'') format(''svg'');font-weight:normal;font-style:normal}.fa{display:inline-block;font:normal normal normal 14px/1 FontAwesome;font-size:inherit;text-rendering:auto;-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale}.fa-lg{font-size:1.33333333em;line-height:.75em;vertical-align:-15%}.fa-2x{font-size:2em}.fa-3x{font-size:3em}.fa-4x{font-size:4em}.fa-5x{font-size:5em}.fa-fw{width:1.28571429em;text-align:center}.fa-ul{padding-left:0;margin-left:2.14285714em;list-style-type:none}.fa-ul>li{position:relative}.fa-li{position:absolute;left:-2.14285714em;width:2.14285714em;top:.14285714em;text-align:center}.fa-li.fa-lg{left:-1.85714286em}.fa-border{padding:.2em .25em .15em;border:solid .08em #eee;border-radius:.1em}.fa-pull-left{float:left}.fa-pull-right{float:right}.fa.fa-pull-left{margin-right:.3em}.fa.fa-pull-right{margin-left:.3em}.pull-right{float:right}.pull-left{float:left}.fa.pull-left{margin-right:.3em}.fa.pull-right{margin-left:.3em}.fa-spin{-webkit-animation:fa-spin 2s infinite linear;animation:fa-spin 2s infinite linear}.fa-pulse{-webkit-animation:fa-spin 1s infinite steps(8);animation:fa-spin 1s infinite steps(8)}@-webkit-keyframes fa-spin{0%{-webkit-transform:rotate(0deg);transform:rotate(0deg)}100%{-webkit-transform:rotate(359deg);transform:rotate(359deg)}}@keyframes fa-spin{0%{-webkit-transform:rotate(0deg);transform:rotate(0deg)}100%{-webkit-transform:rotate(359deg);transform:rotate(359deg)}}.fa-rotate-90{-ms-filter:"progid:DXImageTransform.Microsoft.BasicImage(rotation=1)";-webkit-transform:rotate(90deg);-ms-transform:rotate(90deg);transform:rotate(90deg)}.fa-rotate-180{-ms-filter:"progid:DXImageTransform.Microsoft.BasicImage(rotation=2)";-webkit-transform:rotate(180deg);-ms-transform:rotate(180deg);transform:rotate(180deg)}.fa-rotate-270{-ms-filter:"progid:DXImageTransform.Microsoft.BasicImage(rotation=3)";-webkit-transform:rotate(270deg);-ms-transform:rotate(270deg);transform:rotate(270deg)}.fa-flip-horizontal{-ms-filter:"progid:DXImageTransform.Microsoft.BasicImage(rotation=0, mirror=1)";-webkit-transform:scale(-1, 1);-ms-transform:scale(-1, 1);transform:scale(-1, 1)}.fa-flip-vertical{-ms-filter:"progid:DXImageTransform.Microsoft.BasicImage(rotation=2, mirror=1)";-webkit-transform:scale(1, -1);-ms-transform:scale(1, -1);transform:scale(1, -1)}:root .fa-rotate-90,:root .fa-rotate-180,:root .fa-rotate-270,:root .fa-flip-horizontal,:root .fa-flip-vertical{filter:none}.fa-stack{position:relative;display:inline-block;width:2em;height:2em;line-height:2em;vertical-align:middle}.fa-stack-1x,.fa-stack-2x{position:absolute;left:0;width:100%;text-align:center}.fa-stack-1x{line-height:inherit}.fa-stack-2x{font-size:2em}.fa-inverse{color:#fff}.fa-glass:before{content:"\\f000"}.fa-music:before{content:"\\f001"}.fa-search:before{content:"\\f002"}.fa-envelope-o:before{content:"\\f003"}.fa-heart:before{content:"\\f004"}.fa-star:before{content:"\\f005"}.fa-star-o:before{content:"\\f006"}.fa-user:before{content:"\\f007"}.fa-film:before{content:"\\f008"}.fa-th-large:before{content:"\\f009"}.fa-th:before{content:"\\f00a"}.fa-th-list:before{content:"\\f00b"}.fa-check:before{content:"\\f00c"}.fa-remove:before,.fa-close:before,.fa-times:before{content:"\\f00d"}.fa-search-plus:before{content:"\\f00e"}.fa-search-minus:before{content:"\\f010"}.fa-power-off:before{content:"\\f011"}.fa-signal:before{content:"\\f012"}.fa-gear:before,.fa-cog:before{content:"\\f013"}.fa-trash-o:before{content:"\\f014"}.fa-home:before{content:"\\f015"}.fa-file-o:before{content:"\\f016"}.fa-clock-o:before{content:"\\f017"}.fa-road:before{content:"\\f018"}.fa-download:before{content:"\\f019"}.fa-arrow-circle-o-down:before{content:"\\f01a"}.fa-arrow-circle-o-up:before{content:"\\f01b"}.fa-inbox:before{content:"\\f01c"}.fa-play-circle-o:before{content:"\\f01d"}.fa-rotate-right:before,.fa-repeat:before{content:"\\f01e"}.fa-refresh:before{content:"\\f021"}.fa-list-alt:before{content:"\\f022"}.fa-lock:before{content:"\\f023"}.fa-flag:before{content:"\\f024"}.fa-headphones:before{content:"\\f025"}.fa-volume-off:before{content:"\\f026"}.fa-volume-down:before{content:"\\f027"}.fa-volume-up:before{content:"\\f028"}.fa-qrcode:before{content:"\\f029"}.fa-barcode:before{content:"\\f02a"}.fa-tag:before{content:"\\f02b"}.fa-tags:before{content:"\\f02c"}.fa-book:before{content:"\\f02d"}.fa-bookmark:before{content:"\\f02e"}.fa-print:before{content:"\\f02f"}.fa-camera:before{content:"\\f030"}.fa-font:before{content:"\\f031"}.fa-bold:before{content:"\\f032"}.fa-italic:before{content:"\\f033"}.fa-text-height:before{content:"\\f034"}.fa-text-width:before{content:"\\f035"}.fa-align-left:before{content:"\\f036"}.fa-align-center:before{content:"\\f037"}.fa-align-right:before{content:"\\f038"}.fa-align-justify:before{content:"\\f039"}.fa-list:before{content:"\\f03a"}.fa-dedent:before,.fa-outdent:before{content:"\\f03b"}.fa-indent:before{content:"\\f03c"}.fa-video-camera:before{content:"\\f03d"}.fa-photo:before,.fa-image:before,.fa-picture-o:before{content:"\\f03e"}.fa-pencil:before{content:"\\f040"}.fa-map-marker:before{content:"\\f041"}.fa-adjust:before{content:"\\f042"}.fa-tint:before{content:"\\f043"}.fa-edit:before,.fa-pencil-square-o:before{content:"\\f044"}.fa-share-square-o:before{content:"\\f045"}.fa-check-square-o:before{content:"\\f046"}.fa-arrows:before{content:"\\f047"}.fa-step-backward:before{content:"\\f048"}.fa-fast-backward:before{content:"\\f049"}.fa-backward:before{content:"\\f04a"}.fa-play:before{content:"\\f04b"}.fa-pause:before{content:"\\f04c"}.fa-stop:before{content:"\\f04d"}.fa-forward:before{content:"\\f04e"}.fa-fast-forward:before{content:"\\f050"}.fa-step-forward:before{content:"\\f051"}.fa-eject:before{content:"\\f052"}.fa-chevron-left:before{content:"\\f053"}.fa-chevron-right:before{content:"\\f054"}.fa-plus-circle:before{content:"\\f055"}.fa-minus-circle:before{content:"\\f056"}.fa-times-circle:before{content:"\\f057"}.fa-check-circle:before{content:"\\f058"}.fa-question-circle:before{content:"\\f059"}.fa-info-circle:before{content:"\\f05a"}.fa-crosshairs:before{content:"\\f05b"}.fa-times-circle-o:before{content:"\\f05c"}.fa-check-circle-o:before{content:"\\f05d"}.fa-ban:before{content:"\\f05e"}.fa-arrow-left:before{content:"\\f060"}.fa-arrow-right:before{content:"\\f061"}.fa-arrow-up:before{content:"\\f062"}.fa-arrow-down:before{content:"\\f063"}.fa-mail-forward:before,.fa-share:before{content:"\\f064"}.fa-expand:before{content:"\\f065"}.fa-compress:before{content:"\\f066"}.fa-plus:before{content:"\\f067"}.fa-minus:before{content:"\\f068"}.fa-asterisk:before{content:"\\f069"}.fa-exclamation-circle:before{content:"\\f06a"}.fa-gift:before{content:"\\f06b"}.fa-leaf:before{content:"\\f06c"}.fa-fire:before{content:"\\f06d"}.fa-eye:before{content:"\\f06e"}.fa-eye-slash:before{content:"\\f070"}.fa-warning:before,.fa-exclamation-triangle:before{content:"\\f071"}.fa-plane:before{content:"\\f072"}.fa-calendar:before{content:"\\f073"}.fa-random:before{content:"\\f074"}.fa-comment:before{content:"\\f075"}.fa-magnet:before{content:"\\f076"}.fa-chevron-up:before{content:"\\f077"}.fa-chevron-down:before{content:"\\f078"}.fa-retweet:before{content:"\\f079"}.fa-shopping-cart:before{content:"\\f07a"}.fa-folder:before{content:"\\f07b"}.fa-folder-open:before{content:"\\f07c"}.fa-arrows-v:before{content:"\\f07d"}.fa-arrows-h:before{content:"\\f07e"}.fa-bar-chart-o:before,.fa-bar-chart:before{content:"\\f080"}.fa-twitter-square:before{content:"\\f081"}.fa-facebook-square:before{content:"\\f082"}.fa-camera-retro:before{content:"\\f083"}.fa-key:before{content:"\\f084"}.fa-gears:before,.fa-cogs:before{content:"\\f085"}.fa-comments:before{content:"\\f086"}.fa-thumbs-o-up:before{content:"\\f087"}.fa-thumbs-o-down:before{content:"\\f088"}.fa-star-half:before{content:"\\f089"}.fa-heart-o:before{content:"\\f08a"}.fa-sign-out:before{content:"\\f08b"}.fa-linkedin-square:before{content:"\\f08c"}.fa-thumb-tack:before{content:"\\f08d"}.fa-external-link:before{content:"\\f08e"}.fa-sign-in:before{content:"\\f090"}.fa-trophy:before{content:"\\f091"}.fa-github-square:before{content:"\\f092"}.fa-upload:before{content:"\\f093"}.fa-lemon-o:before{content:"\\f094"}.fa-phone:before{content:"\\f095"}.fa-square-o:before{content:"\\f096"}.fa-bookmark-o:before{content:"\\f097"}.fa-phone-square:before{content:"\\f098"}.fa-twitter:before{content:"\\f099"}.fa-facebook-f:before,.fa-facebook:before{content:"\\f09a"}.fa-github:before{content:"\\f09b"}.fa-unlock:before{content:"\\f09c"}.fa-credit-card:before{content:"\\f09d"}.fa-feed:before,.fa-rss:before{content:"\\f09e"}.fa-hdd-o:before{content:"\\f0a0"}.fa-bullhorn:before{content:"\\f0a1"}.fa-bell:before{content:"\\f0f3"}.fa-certificate:before{content:"\\f0a3"}.fa-hand-o-right:before{content:"\\f0a4"}.fa-hand-o-left:before{content:"\\f0a5"}.fa-hand-o-up:before{content:"\\f0a6"}.fa-hand-o-down:before{content:"\\f0a7"}.fa-arrow-circle-left:before{content:"\\f0a8"}.fa-arrow-circle-right:before{content:"\\f0a9"}.fa-arrow-circle-up:before{content:"\\f0aa"}.fa-arrow-circle-down:before{content:"\\f0ab"}.fa-globe:before{content:"\\f0ac"}.fa-wrench:before{content:"\\f0ad"}.fa-tasks:before{content:"\\f0ae"}.fa-filter:before{content:"\\f0b0"}.fa-briefcase:before{content:"\\f0b1"}.fa-arrows-alt:before{content:"\\f0b2"}.fa-group:before,.fa-users:before{content:"\\f0c0"}.fa-chain:before,.fa-link:before{content:"\\f0c1"}.fa-cloud:before{content:"\\f0c2"}.fa-flask:before{content:"\\f0c3"}.fa-cut:before,.fa-scissors:before{content:"\\f0c4"}.fa-copy:before,.fa-files-o:before{content:"\\f0c5"}.fa-paperclip:before{content:"\\f0c6"}.fa-save:before,.fa-floppy-o:before{content:"\\f0c7"}.fa-square:before{content:"\\f0c8"}.fa-navicon:before,.fa-reorder:before,.fa-bars:before{content:"\\f0c9"}.fa-list-ul:before{content:"\\f0ca"}.fa-list-ol:before{content:"\\f0cb"}.fa-strikethrough:before{content:"\\f0cc"}.fa-underline:before{content:"\\f0cd"}.fa-table:before{content:"\\f0ce"}.fa-magic:before{content:"\\f0d0"}.fa-truck:before{content:"\\f0d1"}.fa-pinterest:before{content:"\\f0d2"}.fa-pinterest-square:before{content:"\\f0d3"}.fa-google-plus-square:before{content:"\\f0d4"}.fa-google-plus:before{content:"\\f0d5"}.fa-money:before{content:"\\f0d6"}.fa-caret-down:before{content:"\\f0d7"}.fa-caret-up:before{content:"\\f0d8"}.fa-caret-left:before{content:"\\f0d9"}.fa-caret-right:before{content:"\\f0da"}.fa-columns:before{content:"\\f0db"}.fa-unsorted:before,.fa-sort:before{content:"\\f0dc"}.fa-sort-down:before,.fa-sort-desc:before{content:"\\f0dd"}.fa-sort-up:before,.fa-sort-asc:before{content:"\\f0de"}.fa-envelope:before{content:"\\f0e0"}.fa-linkedin:before{content:"\\f0e1"}.fa-rotate-left:before,.fa-undo:before{content:"\\f0e2"}.fa-legal:before,.fa-gavel:before{content:"\\f0e3"}.fa-dashboard:before,.fa-tachometer:before{content:"\\f0e4"}.fa-comment-o:before{content:"\\f0e5"}.fa-comments-o:before{content:"\\f0e6"}.fa-flash:before,.fa-bolt:before{content:"\\f0e7"}.fa-sitemap:before{content:"\\f0e8"}.fa-umbrella:before{content:"\\f0e9"}.fa-paste:before,.fa-clipboard:before{content:"\\f0ea"}.fa-lightbulb-o:before{content:"\\f0eb"}.fa-exchange:before{content:"\\f0ec"}.fa-cloud-download:before{content:"\\f0ed"}.fa-cloud-upload:before{content:"\\f0ee"}.fa-user-md:before{content:"\\f0f0"}.fa-stethoscope:before{content:"\\f0f1"}.fa-suitcase:before{content:"\\f0f2"}.fa-bell-o:before{content:"\\f0a2"}.fa-coffee:before{content:"\\f0f4"}.fa-cutlery:before{content:"\\f0f5"}.fa-file-text-o:before{content:"\\f0f6"}.fa-building-o:before{content:"\\f0f7"}.fa-hospital-o:before{content:"\\f0f8"}.fa-ambulance:before{content:"\\f0f9"}.fa-medkit:before{content:"\\f0fa"}.fa-fighter-jet:before{content:"\\f0fb"}.fa-beer:before{content:"\\f0fc"}.fa-h-square:before{content:"\\f0fd"}.fa-plus-square:before{content:"\\f0fe"}.fa-angle-double-left:before{content:"\\f100"}.fa-angle-double-right:before{content:"\\f101"}.fa-angle-double-up:before{content:"\\f102"}.fa-angle-double-down:before{content:"\\f103"}.fa-angle-left:before{content:"\\f104"}.fa-angle-right:before{content:"\\f105"}.fa-angle-up:before{content:"\\f106"}.fa-angle-down:before{content:"\\f107"}.fa-desktop:before{content:"\\f108"}.fa-laptop:before{content:"\\f109"}.fa-tablet:before{content:"\\f10a"}.fa-mobile-phone:before,.fa-mobile:before{content:"\\f10b"}.fa-circle-o:before{content:"\\f10c"}.fa-quote-left:before{content:"\\f10d"}.fa-quote-right:before{content:"\\f10e"}.fa-spinner:before{content:"\\f110"}.fa-circle:before{content:"\\f111"}.fa-mail-reply:before,.fa-reply:before{content:"\\f112"}.fa-github-alt:before{content:"\\f113"}.fa-folder-o:before{content:"\\f114"}.fa-folder-open-o:before{content:"\\f115"}.fa-smile-o:before{content:"\\f118"}.fa-frown-o:before{content:"\\f119"}.fa-meh-o:before{content:"\\f11a"}.fa-gamepad:before{content:"\\f11b"}.fa-keyboard-o:before{content:"\\f11c"}.fa-flag-o:before{content:"\\f11d"}.fa-flag-checkered:before{content:"\\f11e"}.fa-terminal:before{content:"\\f120"}.fa-code:before{content:"\\f121"}.fa-mail-reply-all:before,.fa-reply-all:before{content:"\\f122"}.fa-star-half-empty:before,.fa-star-half-full:before,.fa-star-half-o:before{content:"\\f123"}.fa-location-arrow:before{content:"\\f124"}.fa-crop:before{content:"\\f125"}.fa-code-fork:before{content:"\\f126"}.fa-unlink:before,.fa-chain-broken:before{content:"\\f127"}.fa-question:before{content:"\\f128"}.fa-info:before{content:"\\f129"}.fa-exclamation:before{content:"\\f12a"}.fa-superscript:before{content:"\\f12b"}.fa-subscript:before{content:"\\f12c"}.fa-eraser:before{content:"\\f12d"}.fa-puzzle-piece:before{content:"\\f12e"}.fa-microphone:before{content:"\\f130"}.fa-microphone-slash:before{content:"\\f131"}.fa-shield:before{content:"\\f132"}.fa-calendar-o:before{content:"\\f133"}.fa-fire-extinguisher:before{content:"\\f134"}.fa-rocket:before{content:"\\f135"}.fa-maxcdn:before{content:"\\f136"}.fa-chevron-circle-left:before{content:"\\f137"}.fa-chevron-circle-right:before{content:"\\f138"}.fa-chevron-circle-up:before{content:"\\f139"}.fa-chevron-circle-down:before{content:"\\f13a"}.fa-html5:before{content:"\\f13b"}.fa-css3:before{content:"\\f13c"}.fa-anchor:before{content:"\\f13d"}.fa-unlock-alt:before{content:"\\f13e"}.fa-bullseye:before{content:"\\f140"}.fa-ellipsis-h:before{content:"\\f141"}.fa-ellipsis-v:before{content:"\\f142"}.fa-rss-square:before{content:"\\f143"}.fa-play-circle:before{content:"\\f144"}.fa-ticket:before{content:"\\f145"}.fa-minus-square:before{content:"\\f146"}.fa-minus-square-o:before{content:"\\f147"}.fa-level-up:before{content:"\\f148"}.fa-level-down:before{content:"\\f149"}.fa-check-square:before{content:"\\f14a"}.fa-pencil-square:before{content:"\\f14b"}.fa-external-link-square:before{content:"\\f14c"}.fa-share-square:before{content:"\\f14d"}.fa-compass:before{content:"\\f14e"}.fa-toggle-down:before,.fa-caret-square-o-down:before{content:"\\f150"}.fa-toggle-up:before,.fa-caret-square-o-up:before{content:"\\f151"}.fa-toggle-right:before,.fa-caret-square-o-right:before{content:"\\f152"}.fa-euro:before,.fa-eur:before{content:"\\f153"}.fa-gbp:before{content:"\\f154"}.fa-dollar:before,.fa-usd:before{content:"\\f155"}.fa-rupee:before,.fa-inr:before{content:"\\f156"}.fa-cny:before,.fa-rmb:before,.fa-yen:before,.fa-jpy:before{content:"\\f157"}.fa-ruble:before,.fa-rouble:before,.fa-rub:before{content:"\\f158"}.fa-won:before,.fa-krw:before{content:"\\f159"}.fa-bitcoin:before,.fa-btc:before{content:"\\f15a"}.fa-file:before{content:"\\f15b"}.fa-file-text:before{content:"\\f15c"}.fa-sort-alpha-asc:before{content:"\\f15d"}.fa-sort-alpha-desc:before{content:"\\f15e"}.fa-sort-amount-asc:before{content:"\\f160"}.fa-sort-amount-desc:before{content:"\\f161"}.fa-sort-numeric-asc:before{content:"\\f162"}.fa-sort-numeric-desc:before{content:"\\f163"}.fa-thumbs-up:before{content:"\\f164"}.fa-thumbs-down:before{content:"\\f165"}.fa-youtube-square:before{content:"\\f166"}.fa-youtube:before{content:"\\f167"}.fa-xing:before{content:"\\f168"}.fa-xing-square:before{content:"\\f169"}.fa-youtube-play:before{content:"\\f16a"}.fa-dropbox:before{content:"\\f16b"}.fa-stack-overflow:before{content:"\\f16c"}.fa-instagram:before{content:"\\f16d"}.fa-flickr:before{content:"\\f16e"}.fa-adn:before{content:"\\f170"}.fa-bitbucket:before{content:"\\f171"}.fa-bitbucket-square:before{content:"\\f172"}.fa-tumblr:before{content:"\\f173"}.fa-tumblr-square:before{content:"\\f174"}.fa-long-arrow-down:before{content:"\\f175"}.fa-long-arrow-up:before{content:"\\f176"}.fa-long-arrow-left:before{content:"\\f177"}.fa-long-arrow-right:before{content:"\\f178"}.fa-apple:before{content:"\\f179"}.fa-windows:before{content:"\\f17a"}.fa-android:before{content:"\\f17b"}.fa-linux:before{content:"\\f17c"}.fa-dribbble:before{content:"\\f17d"}.fa-skype:before{content:"\\f17e"}.fa-foursquare:before{content:"\\f180"}.fa-trello:before{content:"\\f181"}.fa-female:before{content:"\\f182"}.fa-male:before{content:"\\f183"}.fa-gittip:before,.fa-gratipay:before{content:"\\f184"}.fa-sun-o:before{content:"\\f185"}.fa-moon-o:before{content:"\\f186"}.fa-archive:before{content:"\\f187"}.fa-bug:before{content:"\\f188"}.fa-vk:before{content:"\\f189"}.fa-weibo:before{content:"\\f18a"}.fa-renren:before{content:"\\f18b"}.fa-pagelines:before{content:"\\f18c"}.fa-stack-exchange:before{content:"\\f18d"}.fa-arrow-circle-o-right:before{content:"\\f18e"}.fa-arrow-circle-o-left:before{content:"\\f190"}.fa-toggle-left:before,.fa-caret-square-o-left:before{content:"\\f191"}.fa-dot-circle-o:before{content:"\\f192"}.fa-wheelchair:before{content:"\\f193"}.fa-vimeo-square:before{content:"\\f194"}.fa-turkish-lira:before,.fa-try:before{content:"\\f195"}.fa-plus-square-o:before{content:"\\f196"}.fa-space-shuttle:before{content:"\\f197"}.fa-slack:before{content:"\\f198"}.fa-envelope-square:before{content:"\\f199"}.fa-wordpress:before{content:"\\f19a"}.fa-openid:before{content:"\\f19b"}.fa-institution:before,.fa-bank:before,.fa-university:before{content:"\\f19c"}.fa-mortar-board:before,.fa-graduation-cap:before{content:"\\f19d"}.fa-yahoo:before{content:"\\f19e"}.fa-google:before{content:"\\f1a0"}.fa-reddit:before{content:"\\f1a1"}.fa-reddit-square:before{content:"\\f1a2"}.fa-stumbleupon-circle:before{content:"\\f1a3"}.fa-stumbleupon:before{content:"\\f1a4"}.fa-delicious:before{content:"\\f1a5"}.fa-digg:before{content:"\\f1a6"}.fa-pied-piper-pp:before{content:"\\f1a7"}.fa-pied-piper-alt:before{content:"\\f1a8"}.fa-drupal:before{content:"\\f1a9"}.fa-joomla:before{content:"\\f1aa"}.fa-language:before{content:"\\f1ab"}.fa-fax:before{content:"\\f1ac"}.fa-building:before{content:"\\f1ad"}.fa-child:before{content:"\\f1ae"}.fa-paw:before{content:"\\f1b0"}.fa-spoon:before{content:"\\f1b1"}.fa-cube:before{content:"\\f1b2"}.fa-cubes:before{content:"\\f1b3"}.fa-behance:before{content:"\\f1b4"}.fa-behance-square:before{content:"\\f1b5"}.fa-steam:before{content:"\\f1b6"}.fa-steam-square:before{content:"\\f1b7"}.fa-recycle:before{content:"\\f1b8"}.fa-automobile:before,.fa-car:before{content:"\\f1b9"}.fa-cab:before,.fa-taxi:before{content:"\\f1ba"}.fa-tree:before{content:"\\f1bb"}.fa-spotify:before{content:"\\f1bc"}.fa-deviantart:before{content:"\\f1bd"}.fa-soundcloud:before{content:"\\f1be"}.fa-database:before{content:"\\f1c0"}.fa-file-pdf-o:before{content:"\\f1c1"}.fa-file-word-o:before{content:"\\f1c2"}.fa-file-excel-o:before{content:"\\f1c3"}.fa-file-powerpoint-o:before{content:"\\f1c4"}.fa-file-photo-o:before,.fa-file-picture-o:before,.fa-file-image-o:before{content:"\\f1c5"}.fa-file-zip-o:before,.fa-file-archive-o:before{content:"\\f1c6"}.fa-file-sound-o:before,.fa-file-audio-o:before{content:"\\f1c7"}.fa-file-movie-o:before,.fa-file-video-o:before{content:"\\f1c8"}.fa-file-code-o:before{content:"\\f1c9"}.fa-vine:before{content:"\\f1ca"}.fa-codepen:before{content:"\\f1cb"}.fa-jsfiddle:before{content:"\\f1cc"}.fa-life-bouy:before,.fa-life-buoy:before,.fa-life-saver:before,.fa-support:before,.fa-life-ring:before{content:"\\f1cd"}.fa-circle-o-notch:before{content:"\\f1ce"}.fa-ra:before,.fa-resistance:before,.fa-rebel:before{content:"\\f1d0"}.fa-ge:before,.fa-empire:before{content:"\\f1d1"}.fa-git-square:before{content:"\\f1d2"}.fa-git:before{content:"\\f1d3"}.fa-y-combinator-square:before,.fa-yc-square:before,.fa-hacker-news:before{content:"\\f1d4"}.fa-tencent-weibo:before{content:"\\f1d5"}.fa-qq:before{content:"\\f1d6"}.fa-wechat:before,.fa-weixin:before{content:"\\f1d7"}.fa-send:before,.fa-paper-plane:before{content:"\\f1d8"}.fa-send-o:before,.fa-paper-plane-o:before{content:"\\f1d9"}.fa-history:before{content:"\\f1da"}.fa-circle-thin:before{content:"\\f1db"}.fa-header:before{content:"\\f1dc"}.fa-paragraph:before{content:"\\f1dd"}.fa-sliders:before{content:"\\f1de"}.fa-share-alt:before{content:"\\f1e0"}.fa-share-alt-square:before{content:"\\f1e1"}.fa-bomb:before{content:"\\f1e2"}.fa-soccer-ball-o:before,.fa-futbol-o:before{content:"\\f1e3"}.fa-tty:before{content:"\\f1e4"}.fa-binoculars:before{content:"\\f1e5"}.fa-plug:before{content:"\\f1e6"}.fa-slideshare:before{content:"\\f1e7"}.fa-twitch:before{content:"\\f1e8"}.fa-yelp:before{content:"\\f1e9"}.fa-newspaper-o:before{content:"\\f1ea"}.fa-wifi:before{content:"\\f1eb"}.fa-calculator:before{content:"\\f1ec"}.fa-paypal:before{content:"\\f1ed"}.fa-google-wallet:before{content:"\\f1ee"}.fa-cc-visa:before{content:"\\f1f0"}.fa-cc-mastercard:before{content:"\\f1f1"}.fa-cc-discover:before{content:"\\f1f2"}.fa-cc-amex:before{content:"\\f1f3"}.fa-cc-paypal:before{content:"\\f1f4"}.fa-cc-stripe:before{content:"\\f1f5"}.fa-bell-slash:before{content:"\\f1f6"}.fa-bell-slash-o:before{content:"\\f1f7"}.fa-trash:before{content:"\\f1f8"}.fa-copyright:before{content:"\\f1f9"}.fa-at:before{content:"\\f1fa"}.fa-eyedropper:before{content:"\\f1fb"}.fa-paint-brush:before{content:"\\f1fc"}.fa-birthday-cake:before{content:"\\f1fd"}.fa-area-chart:before{content:"\\f1fe"}.fa-pie-chart:before{content:"\\f200"}.fa-line-chart:before{content:"\\f201"}.fa-lastfm:before{content:"\\f202"}.fa-lastfm-square:before{content:"\\f203"}.fa-toggle-off:before{content:"\\f204"}.fa-toggle-on:before{content:"\\f205"}.fa-bicycle:before{content:"\\f206"}.fa-bus:before{content:"\\f207"}.fa-ioxhost:before{content:"\\f208"}.fa-angellist:before{content:"\\f209"}.fa-cc:before{content:"\\f20a"}.fa-shekel:before,.fa-sheqel:before,.fa-ils:before{content:"\\f20b"}.fa-meanpath:before{content:"\\f20c"}.fa-buysellads:before{content:"\\f20d"}.fa-connectdevelop:before{content:"\\f20e"}.fa-dashcube:before{content:"\\f210"}.fa-forumbee:before{content:"\\f211"}.fa-leanpub:before{content:"\\f212"}.fa-sellsy:before{content:"\\f213"}.fa-shirtsinbulk:before{content:"\\f214"}.fa-simplybuilt:before{content:"\\f215"}.fa-skyatlas:before{content:"\\f216"}.fa-cart-plus:before{content:"\\f217"}.fa-cart-arrow-down:before{content:"\\f218"}.fa-diamond:before{content:"\\f219"}.fa-ship:before{content:"\\f21a"}.fa-user-secret:before{content:"\\f21b"}.fa-motorcycle:before{content:"\\f21c"}.fa-street-view:before{content:"\\f21d"}.fa-heartbeat:before{content:"\\f21e"}.fa-venus:before{content:"\\f221"}.fa-mars:before{content:"\\f222"}.fa-mercury:before{content:"\\f223"}.fa-intersex:before,.fa-transgender:before{content:"\\f224"}.fa-transgender-alt:before{content:"\\f225"}.fa-venus-double:before{content:"\\f226"}.fa-mars-double:before{content:"\\f227"}.fa-venus-mars:before{content:"\\f228"}.fa-mars-stroke:before{content:"\\f229"}.fa-mars-stroke-v:before{content:"\\f22a"}.fa-mars-stroke-h:before{content:"\\f22b"}.fa-neuter:before{content:"\\f22c"}.fa-genderless:before{content:"\\f22d"}.fa-facebook-official:before{content:"\\f230"}.fa-pinterest-p:before{content:"\\f231"}.fa-whatsapp:before{content:"\\f232"}.fa-server:before{content:"\\f233"}.fa-user-plus:before{content:"\\f234"}.fa-user-times:before{content:"\\f235"}.fa-hotel:before,.fa-bed:before{content:"\\f236"}.fa-viacoin:before{content:"\\f237"}.fa-train:before{content:"\\f238"}.fa-subway:before{content:"\\f239"}.fa-medium:before{content:"\\f23a"}.fa-yc:before,.fa-y-combinator:before{content:"\\f23b"}.fa-optin-monster:before{content:"\\f23c"}.fa-opencart:before{content:"\\f23d"}.fa-expeditedssl:before{content:"\\f23e"}.fa-battery-4:before,.fa-battery-full:before{content:"\\f240"}.fa-battery-3:before,.fa-battery-three-quarters:before{content:"\\f241"}.fa-battery-2:before,.fa-battery-half:before{content:"\\f242"}.fa-battery-1:before,.fa-battery-quarter:before{content:"\\f243"}.fa-battery-0:before,.fa-battery-empty:before{content:"\\f244"}.fa-mouse-pointer:before{content:"\\f245"}.fa-i-cursor:before{content:"\\f246"}.fa-object-group:before{content:"\\f247"}.fa-object-ungroup:before{content:"\\f248"}.fa-sticky-note:before{content:"\\f249"}.fa-sticky-note-o:before{content:"\\f24a"}.fa-cc-jcb:before{content:"\\f24b"}.fa-cc-diners-club:before{content:"\\f24c"}.fa-clone:before{content:"\\f24d"}.fa-balance-scale:before{content:"\\f24e"}.fa-hourglass-o:before{content:"\\f250"}.fa-hourglass-1:before,.fa-hourglass-start:before{content:"\\f251"}.fa-hourglass-2:before,.fa-hourglass-half:before{content:"\\f252"}.fa-hourglass-3:before,.fa-hourglass-end:before{content:"\\f253"}.fa-hourglass:before{content:"\\f254"}.fa-hand-grab-o:before,.fa-hand-rock-o:before{content:"\\f255"}.fa-hand-stop-o:before,.fa-hand-paper-o:before{content:"\\f256"}.fa-hand-scissors-o:before{content:"\\f257"}.fa-hand-lizard-o:before{content:"\\f258"}.fa-hand-spock-o:before{content:"\\f259"}.fa-hand-pointer-o:before{content:"\\f25a"}.fa-hand-peace-o:before{content:"\\f25b"}.fa-trademark:before{content:"\\f25c"}.fa-registered:before{content:"\\f25d"}.fa-creative-commons:before{content:"\\f25e"}.fa-gg:before{content:"\\f260"}.fa-gg-circle:before{content:"\\f261"}.fa-tripadvisor:before{content:"\\f262"}.fa-odnoklassniki:before{content:"\\f263"}.fa-odnoklassniki-square:before{content:"\\f264"}.fa-get-pocket:before{content:"\\f265"}.fa-wikipedia-w:before{content:"\\f266"}.fa-safari:before{content:"\\f267"}.fa-chrome:before{content:"\\f268"}.fa-firefox:before{content:"\\f269"}.fa-opera:before{content:"\\f26a"}.fa-internet-explorer:before{content:"\\f26b"}.fa-tv:before,.fa-television:before{content:"\\f26c"}.fa-contao:before{content:"\\f26d"}.fa-500px:before{content:"\\f26e"}.fa-amazon:before{content:"\\f270"}.fa-calendar-plus-o:before{content:"\\f271"}.fa-calendar-minus-o:before{content:"\\f272"}.fa-calendar-times-o:before{content:"\\f273"}.fa-calendar-check-o:before{content:"\\f274"}.fa-industry:before{content:"\\f275"}.fa-map-pin:before{content:"\\f276"}.fa-map-signs:before{content:"\\f277"}.fa-map-o:before{content:"\\f278"}.fa-map:before{content:"\\f279"}.fa-commenting:before{content:"\\f27a"}.fa-commenting-o:before{content:"\\f27b"}.fa-houzz:before{content:"\\f27c"}.fa-vimeo:before{content:"\\f27d"}.fa-black-tie:before{content:"\\f27e"}.fa-fonticons:before{content:"\\f280"}.fa-reddit-alien:before{content:"\\f281"}.fa-edge:before{content:"\\f282"}.fa-credit-card-alt:before{content:"\\f283"}.fa-codiepie:before{content:"\\f284"}.fa-modx:before{content:"\\f285"}.fa-fort-awesome:before{content:"\\f286"}.fa-usb:before{content:"\\f287"}.fa-product-hunt:before{content:"\\f288"}.fa-mixcloud:before{content:"\\f289"}.fa-scribd:before{content:"\\f28a"}.fa-pause-circle:before{content:"\\f28b"}.fa-pause-circle-o:before{content:"\\f28c"}.fa-stop-circle:before{content:"\\f28d"}.fa-stop-circle-o:before{content:"\\f28e"}.fa-shopping-bag:before{content:"\\f290"}.fa-shopping-basket:before{content:"\\f291"}.fa-hashtag:before{content:"\\f292"}.fa-bluetooth:before{content:"\\f293"}.fa-bluetooth-b:before{content:"\\f294"}.fa-percent:before{content:"\\f295"}.fa-gitlab:before{content:"\\f296"}.fa-wpbeginner:before{content:"\\f297"}.fa-wpforms:before{content:"\\f298"}.fa-envira:before{content:"\\f299"}.fa-universal-access:before{content:"\\f29a"}.fa-wheelchair-alt:before{content:"\\f29b"}.fa-question-circle-o:before{content:"\\f29c"}.fa-blind:before{content:"\\f29d"}.fa-audio-description:before{content:"\\f29e"}.fa-volume-control-phone:before{content:"\\f2a0"}.fa-braille:before{content:"\\f2a1"}.fa-assistive-listening-systems:before{content:"\\f2a2"}.fa-asl-interpreting:before,.fa-american-sign-language-interpreting:before{content:"\\f2a3"}.fa-deafness:before,.fa-hard-of-hearing:before,.fa-deaf:before{content:"\\f2a4"}.fa-glide:before{content:"\\f2a5"}.fa-glide-g:before{content:"\\f2a6"}.fa-signing:before,.fa-sign-language:before{content:"\\f2a7"}.fa-low-vision:before{content:"\\f2a8"}.fa-viadeo:before{content:"\\f2a9"}.fa-viadeo-square:before{content:"\\f2aa"}.fa-snapchat:before{content:"\\f2ab"}.fa-snapchat-ghost:before{content:"\\f2ac"}.fa-snapchat-square:before{content:"\\f2ad"}.fa-pied-piper:before{content:"\\f2ae"}.fa-first-order:before{content:"\\f2b0"}.fa-yoast:before{content:"\\f2b1"}.fa-themeisle:before{content:"\\f2b2"}.fa-google-plus-circle:before,.fa-google-plus-official:before{content:"\\f2b3"}.fa-fa:before,.fa-font-awesome:before{content:"\\f2b4"}.sr-only{position:absolute;width:1px;height:1px;padding:0;margin:-1px;overflow:hidden;clip:rect(0, 0, 0, 0);border:0}.sr-only-focusable:active,.sr-only-focusable:focus{position:static;width:auto;height:auto;margin:0;overflow:visible;clip:auto}\n', '', 1469811558, 1, 'n', 0, '5', 'n', 'n', 'o', 0, 'n'),
(8, 1, 5, 'index', 'webpage', '', NULL, 1469810555, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n'),
(9, 1, 5, 'owl.carousel.min', 'css', '.owl-carousel .animated{-webkit-animation-duration:1000ms;animation-duration:1000ms;-webkit-animation-fill-mode:both;animation-fill-mode:both}.owl-carousel .owl-animated-in{z-index:0}.owl-carousel .owl-animated-out{z-index:1}.owl-carousel .fadeOut{-webkit-animation-name:fadeOut;animation-name:fadeOut}@-webkit-keyframes fadeOut{0%{opacity:1}100%{opacity:0}}@keyframes fadeOut{0%{opacity:1}100%{opacity:0}}.owl-height{-webkit-transition:height 500ms ease-in-out;-moz-transition:height 500ms ease-in-out;-ms-transition:height 500ms ease-in-out;-o-transition:height 500ms ease-in-out;transition:height 500ms ease-in-out}.owl-carousel{display:none;width:100%;-webkit-tap-highlight-color:transparent;position:relative;z-index:1}.owl-carousel .owl-stage{position:relative;-ms-touch-action:pan-Y}.owl-carousel .owl-stage:after{content:".";display:block;clear:both;visibility:hidden;line-height:0;height:0}.owl-carousel .owl-stage-outer{position:relative;overflow:hidden;-webkit-transform:translate3d(0px,0,0)}.owl-carousel .owl-controls .owl-dot,.owl-carousel .owl-controls .owl-nav .owl-next,.owl-carousel .owl-controls .owl-nav .owl-prev{cursor:pointer;cursor:hand;-webkit-user-select:none;-khtml-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none}.owl-carousel.owl-loaded{display:block}.owl-carousel.owl-loading{opacity:0;display:block}.owl-carousel.owl-hidden{opacity:0}.owl-carousel .owl-refresh .owl-item{display:none}.owl-carousel .owl-item{position:relative;min-height:1px;float:left;-webkit-backface-visibility:hidden;-webkit-tap-highlight-color:transparent;-webkit-touch-callout:none;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none}.owl-carousel .owl-item img{display:block;width:100%;-webkit-transform-style:preserve-3d}.owl-carousel.owl-text-select-on .owl-item{-webkit-user-select:auto;-moz-user-select:auto;-ms-user-select:auto;user-select:auto}.owl-carousel .owl-grab{cursor:move;cursor:-webkit-grab;cursor:-o-grab;cursor:-ms-grab;cursor:grab}.owl-carousel.owl-rtl{direction:rtl}.owl-carousel.owl-rtl .owl-item{float:right}.no-js .owl-carousel{display:block}.owl-carousel .owl-item .owl-lazy{opacity:0;-webkit-transition:opacity 400ms ease;-moz-transition:opacity 400ms ease;-ms-transition:opacity 400ms ease;-o-transition:opacity 400ms ease;transition:opacity 400ms ease}.owl-carousel .owl-item img{transform-style:preserve-3d}.owl-carousel .owl-video-wrapper{position:relative;height:100%;background:#000}.owl-carousel .owl-video-play-icon{position:absolute;height:80px;width:80px;left:50%;top:50%;margin-left:-40px;margin-top:-40px;background:url(owl.video.play.png) no-repeat;cursor:pointer;z-index:1;-webkit-backface-visibility:hidden;-webkit-transition:scale 100ms ease;-moz-transition:scale 100ms ease;-ms-transition:scale 100ms ease;-o-transition:scale 100ms ease;transition:scale 100ms ease}.owl-carousel .owl-video-play-icon:hover{-webkit-transition:scale(1.3,1.3);-moz-transition:scale(1.3,1.3);-ms-transition:scale(1.3,1.3);-o-transition:scale(1.3,1.3);transition:scale(1.3,1.3)}.owl-carousel .owl-video-playing .owl-video-play-icon,.owl-carousel .owl-video-playing .owl-video-tn{display:none}.owl-carousel .owl-video-tn{opacity:0;height:100%;background-position:center center;background-repeat:no-repeat;-webkit-background-size:contain;-moz-background-size:contain;-o-background-size:contain;background-size:contain;-webkit-transition:opacity 400ms ease;-moz-transition:opacity 400ms ease;-ms-transition:opacity 400ms ease;-o-transition:opacity 400ms ease;transition:opacity 400ms ease}.owl-carousel .owl-video-frame{position:relative;z-index:1}', '', 1469810609, 1, 'n', 0, '5', 'n', 'n', 'o', 0, 'n'),
(10, 1, 5, 'owl.theme.default.min', 'css', '.owl-theme .owl-controls{margin-top:10px;text-align:center;-webkit-tap-highlight-color:transparent}.owl-theme .owl-controls .owl-nav [class*=owl-]{color:#fff;font-size:14px;margin:5px;padding:4px 7px;background:#d6d6d6;display:inline-block;cursor:pointer;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px}.owl-theme .owl-controls .owl-nav [class*=owl-]:hover{background:#869791;color:#fff;text-decoration:none}.owl-theme .owl-controls .owl-nav .disabled{opacity:.5;cursor:default}.owl-theme .owl-dots .owl-dot{display:inline-block;zoom:1;*display:inline}.owl-theme .owl-dots .owl-dot span{width:10px;height:10px;margin:5px 7px;background:#d6d6d6;display:block;-webkit-backface-visibility:visible;-webkit-transition:opacity 200ms ease;-moz-transition:opacity 200ms ease;-ms-transition:opacity 200ms ease;-o-transition:opacity 200ms ease;transition:opacity 200ms ease;-webkit-border-radius:30px;-moz-border-radius:30px;border-radius:30px}.owl-theme .owl-dots .owl-dot.active span,.owl-theme .owl-dots .owl-dot:hover span{background:#869791}', '', 1469810618, 1, 'n', 0, '5', 'n', 'n', 'o', 0, 'n'),
(11, 1, 3, 'bootstrap.m', 'js', NULL, NULL, 1469811156, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n');
INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `template_type`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`, `protect_javascript`) VALUES
(12, 1, 5, 'owl.carousel', 'js', '/**\n * Owl carousel\n * @version 2.0.0\n * @author Bartosz Wojciechowski\n * @license The MIT License (MIT)\n * @todo Lazy Load Icon\n * @todo prevent animationend bubling\n * @todo itemsScaleUp\n * @todo Test Zepto\n * @todo stagePadding calculate wrong active classes\n */\n;(function($, window, document, undefined) {\n\n	var drag, state, e;\n\n	/**\n	 * Template for status information about drag and touch events.\n	 * @private\n	 */\n	drag = {\n		start: 0,\n		startX: 0,\n		startY: 0,\n		current: 0,\n		currentX: 0,\n		currentY: 0,\n		offsetX: 0,\n		offsetY: 0,\n		distance: null,\n		startTime: 0,\n		endTime: 0,\n		updatedX: 0,\n		targetEl: null\n	};\n\n	/**\n	 * Template for some status informations.\n	 * @private\n	 */\n	state = {\n		isTouch: false,\n		isScrolling: false,\n		isSwiping: false,\n		direction: false,\n		inMotion: false\n	};\n\n	/**\n	 * Event functions references.\n	 * @private\n	 */\n	e = {\n		_onDragStart: null,\n		_onDragMove: null,\n		_onDragEnd: null,\n		_transitionEnd: null,\n		_resizer: null,\n		_responsiveCall: null,\n		_goToLoop: null,\n		_checkVisibile: null\n	};\n\n	/**\n	 * Creates a carousel.\n	 * @class The Owl Carousel.\n	 * @public\n	 * @param {HTMLElement|jQuery} element - The element to create the carousel for.\n	 * @param {Object} [options] - The options\n	 */\n	function Owl(element, options) {\n\n		/**\n		 * Current settings for the carousel.\n		 * @public\n		 */\n		this.settings = null;\n\n		/**\n		 * Current options set by the caller including defaults.\n		 * @public\n		 */\n		this.options = $.extend({}, Owl.Defaults, options);\n\n		/**\n		 * Plugin element.\n		 * @public\n		 */\n		this.$element = $(element);\n\n		/**\n		 * Caches informations about drag and touch events.\n		 */\n		this.drag = $.extend({}, drag);\n\n		/**\n		 * Caches some status informations.\n		 * @protected\n		 */\n		this.state = $.extend({}, state);\n\n		/**\n		 * @protected\n		 * @todo Must be documented\n		 */\n		this.e = $.extend({}, e);\n\n		/**\n		 * References to the running plugins of this carousel.\n		 * @protected\n		 */\n		this._plugins = {};\n\n		/**\n		 * Currently suppressed events to prevent them from beeing retriggered.\n		 * @protected\n		 */\n		this._supress = {};\n\n		/**\n		 * Absolute current position.\n		 * @protected\n		 */\n		this._current = null;\n\n		/**\n		 * Animation speed in milliseconds.\n		 * @protected\n		 */\n		this._speed = null;\n\n		/**\n		 * Coordinates of all items in pixel.\n		 * @todo The name of this member is missleading.\n		 * @protected\n		 */\n		this._coordinates = [];\n\n		/**\n		 * Current breakpoint.\n		 * @todo Real media queries would be nice.\n		 * @protected\n		 */\n		this._breakpoint = null;\n\n		/**\n		 * Current width of the plugin element.\n		 */\n		this._width = null;\n\n		/**\n		 * All real items.\n		 * @protected\n		 */\n		this._items = [];\n\n		/**\n		 * All cloned items.\n		 * @protected\n		 */\n		this._clones = [];\n\n		/**\n		 * Merge values of all items.\n		 * @todo Maybe this could be part of a plugin.\n		 * @protected\n		 */\n		this._mergers = [];\n\n		/**\n		 * Invalidated parts within the update process.\n		 * @protected\n		 */\n		this._invalidated = {};\n\n		/**\n		 * Ordered list of workers for the update process.\n		 * @protected\n		 */\n		this._pipe = [];\n\n		$.each(Owl.Plugins, $.proxy(function(key, plugin) {\n			this._plugins[key[0].toLowerCase() + key.slice(1)]\n				= new plugin(this);\n		}, this));\n\n		$.each(Owl.Pipe, $.proxy(function(priority, worker) {\n			this._pipe.push({\n				''filter'': worker.filter,\n				''run'': $.proxy(worker.run, this)\n			});\n		}, this));\n\n		this.setup();\n		this.initialize();\n	}\n\n	/**\n	 * Default options for the carousel.\n	 * @public\n	 */\n	Owl.Defaults = {\n		items: 3,\n		loop: false,\n		center: false,\n\n		mouseDrag: true,\n		touchDrag: true,\n		pullDrag: true,\n		freeDrag: false,\n\n		margin: 0,\n		stagePadding: 0,\n\n		merge: false,\n		mergeFit: true,\n		autoWidth: false,\n\n		startPosition: 0,\n		rtl: false,\n\n		smartSpeed: 250,\n		fluidSpeed: false,\n		dragEndSpeed: false,\n\n		responsive: {},\n		responsiveRefreshRate: 200,\n		responsiveBaseElement: window,\n		responsiveClass: false,\n\n		fallbackEasing: ''swing'',\n\n		info: false,\n\n		nestedItemSelector: false,\n		itemElement: ''div'',\n		stageElement: ''div'',\n\n		// Classes and Names\n		themeClass: ''owl-theme'',\n		baseClass: ''owl-carousel'',\n		itemClass: ''owl-item'',\n		centerClass: ''center'',\n		activeClass: ''active''\n	};\n\n	/**\n	 * Enumeration for width.\n	 * @public\n	 * @readonly\n	 * @enum {String}\n	 */\n	Owl.Width = {\n		Default: ''default'',\n		Inner: ''inner'',\n		Outer: ''outer''\n	};\n\n	/**\n	 * Contains all registered plugins.\n	 * @public\n	 */\n	Owl.Plugins = {};\n\n	/**\n	 * Update pipe.\n	 */\n	Owl.Pipe = [ {\n		filter: [ ''width'', ''items'', ''settings'' ],\n		run: function(cache) {\n			cache.current = this._items && this._items[this.relative(this._current)];\n		}\n	}, {\n		filter: [ ''items'', ''settings'' ],\n		run: function() {\n			var cached = this._clones,\n				clones = this.$stage.children(''.cloned'');\n\n			if (clones.length !== cached.length || (!this.settings.loop && cached.length > 0)) {\n				this.$stage.children(''.cloned'').remove();\n				this._clones = [];\n			}\n		}\n	}, {\n		filter: [ ''items'', ''settings'' ],\n		run: function() {\n			var i, n,\n				clones = this._clones,\n				items = this._items,\n				delta = this.settings.loop ? clones.length - Math.max(this.settings.items * 2, 4) : 0;\n\n			for (i = 0, n = Math.abs(delta / 2); i < n; i++) {\n				if (delta > 0) {\n					this.$stage.children().eq(items.length + clones.length - 1).remove();\n					clones.pop();\n					this.$stage.children().eq(0).remove();\n					clones.pop();\n				} else {\n					clones.push(clones.length / 2);\n					this.$stage.append(items[clones[clones.length - 1]].clone().addClass(''cloned''));\n					clones.push(items.length - 1 - (clones.length - 1) / 2);\n					this.$stage.prepend(items[clones[clones.length - 1]].clone().addClass(''cloned''));\n				}\n			}\n		}\n	}, {\n		filter: [ ''width'', ''items'', ''settings'' ],\n		run: function() {\n			var rtl = (this.settings.rtl ? 1 : -1),\n				width = (this.width() / this.settings.items).toFixed(3),\n				coordinate = 0, merge, i, n;\n\n			this._coordinates = [];\n			for (i = 0, n = this._clones.length + this._items.length; i < n; i++) {\n				merge = this._mergers[this.relative(i)];\n				merge = (this.settings.mergeFit && Math.min(merge, this.settings.items)) || merge;\n				coordinate += (this.settings.autoWidth ? this._items[this.relative(i)].width() + this.settings.margin : width * merge) * rtl;\n\n				this._coordinates.push(coordinate);\n			}\n		}\n	}, {\n		filter: [ ''width'', ''items'', ''settings'' ],\n		run: function() {\n			var i, n, width = (this.width() / this.settings.items).toFixed(3), css = {\n				''width'': Math.abs(this._coordinates[this._coordinates.length - 1]) + this.settings.stagePadding * 2,\n				''padding-left'': this.settings.stagePadding || '''',\n				''padding-right'': this.settings.stagePadding || ''''\n			};\n\n			this.$stage.css(css);\n\n			css = { ''width'': this.settings.autoWidth ? ''auto'' : width - this.settings.margin };\n			css[this.settings.rtl ? ''margin-left'' : ''margin-right''] = this.settings.margin;\n\n			if (!this.settings.autoWidth && $.grep(this._mergers, function(v) { return v > 1 }).length > 0) {\n				for (i = 0, n = this._coordinates.length; i < n; i++) {\n					css.width = Math.abs(this._coordinates[i]) - Math.abs(this._coordinates[i - 1] || 0) - this.settings.margin;\n					this.$stage.children().eq(i).css(css);\n				}\n			} else {\n				this.$stage.children().css(css);\n			}\n		}\n	}, {\n		filter: [ ''width'', ''items'', ''settings'' ],\n		run: function(cache) {\n			cache.current && this.reset(this.$stage.children().index(cache.current));\n		}\n	}, {\n		filter: [ ''position'' ],\n		run: function() {\n			this.animate(this.coordinates(this._current));\n		}\n	}, {\n		filter: [ ''width'', ''position'', ''items'', ''settings'' ],\n		run: function() {\n			var rtl = this.settings.rtl ? 1 : -1,\n				padding = this.settings.stagePadding * 2,\n				begin = this.coordinates(this.current()) + padding,\n				end = begin + this.width() * rtl,\n				inner, outer, matches = [], i, n;\n\n			for (i = 0, n = this._coordinates.length; i < n; i++) {\n				inner = this._coordinates[i - 1] || 0;\n				outer = Math.abs(this._coordinates[i]) + padding * rtl;\n\n				if ((this.op(inner, ''<='', begin) && (this.op(inner, ''>'', end)))\n					|| (this.op(outer, ''<'', begin) && this.op(outer, ''>'', end))) {\n					matches.push(i);\n				}\n			}\n\n			this.$stage.children(''.'' + this.settings.activeClass).removeClass(this.settings.activeClass);\n			this.$stage.children('':eq('' + matches.join(''), :eq('') + '')'').addClass(this.settings.activeClass);\n\n			if (this.settings.center) {\n				this.$stage.children(''.'' + this.settings.centerClass).removeClass(this.settings.centerClass);\n				this.$stage.children().eq(this.current()).addClass(this.settings.centerClass);\n			}\n		}\n	} ];\n\n	/**\n	 * Initializes the carousel.\n	 * @protected\n	 */\n	Owl.prototype.initialize = function() {\n		this.trigger(''initialize'');\n\n		this.$element\n			.addClass(this.settings.baseClass)\n			.addClass(this.settings.themeClass)\n			.toggleClass(''owl-rtl'', this.settings.rtl);\n\n		// check support\n		this.browserSupport();\n\n		if (this.settings.autoWidth && this.state.imagesLoaded !== true) {\n			var imgs, nestedSelector, width;\n			imgs = this.$element.find(''img'');\n			nestedSelector = this.settings.nestedItemSelector ? ''.'' + this.settings.nestedItemSelector : undefined;\n			width = this.$element.children(nestedSelector).width();\n\n			if (imgs.length && width <= 0) {\n				this.preloadAutoWidthImages(imgs);\n				return false;\n			}\n		}\n\n		this.$element.addClass(''owl-loading'');\n\n		// create stage\n		this.$stage = $(''<'' + this.settings.stageElement + '' class="owl-stage"/>'')\n			.wrap(''<div class="owl-stage-outer">'');\n\n		// append stage\n		this.$element.append(this.$stage.parent());\n\n		// append content\n		this.replace(this.$element.children().not(this.$stage.parent()));\n\n		// set view width\n		this._width = this.$element.width();\n\n		// update view\n		this.refresh();\n\n		this.$element.removeClass(''owl-loading'').addClass(''owl-loaded'');\n\n		// attach generic events\n		this.eventsCall();\n\n		// attach generic events\n		this.internalEvents();\n\n		// attach custom control events\n		this.addTriggerableEvents();\n\n		this.trigger(''initialized'');\n	};\n\n	/**\n	 * Setups the current settings.\n	 * @todo Remove responsive classes. Why should adaptive designs be brought into IE8?\n	 * @todo Support for media queries by using `matchMedia` would be nice.\n	 * @public\n	 */\n	Owl.prototype.setup = function() {\n		var viewport = this.viewport(),\n			overwrites = this.options.responsive,\n			match = -1,\n			settings = null;\n\n		if (!overwrites) {\n			settings = $.extend({}, this.options);\n		} else {\n			$.each(overwrites, function(breakpoint) {\n				if (breakpoint <= viewport && breakpoint > match) {\n					match = Number(breakpoint);\n				}\n			});\n\n			settings = $.extend({}, this.options, overwrites[match]);\n			delete settings.responsive;\n\n			// responsive class\n			if (settings.responsiveClass) {\n				this.$element.attr(''class'', function(i, c) {\n					return c.replace(/\\b owl-responsive-\\S+/g, '''');\n				}).addClass(''owl-responsive-'' + match);\n			}\n		}\n\n		if (this.settings === null || this._breakpoint !== match) {\n			this.trigger(''change'', { property: { name: ''settings'', value: settings } });\n			this._breakpoint = match;\n			this.settings = settings;\n			this.invalidate(''settings'');\n			this.trigger(''changed'', { property: { name: ''settings'', value: this.settings } });\n		}\n	};\n\n	/**\n	 * Updates option logic if necessery.\n	 * @protected\n	 */\n	Owl.prototype.optionsLogic = function() {\n		// Toggle Center class\n		this.$element.toggleClass(''owl-center'', this.settings.center);\n\n		// if items number is less than in body\n		if (this.settings.loop && this._items.length < this.settings.items) {\n			this.settings.loop = false;\n		}\n\n		if (this.settings.autoWidth) {\n			this.settings.stagePadding = false;\n			this.settings.merge = false;\n		}\n	};\n\n	/**\n	 * Prepares an item before add.\n	 * @todo Rename event parameter `content` to `item`.\n	 * @protected\n	 * @returns {jQuery|HTMLElement} - The item container.\n	 */\n	Owl.prototype.prepare = function(item) {\n		var event = this.trigger(''prepare'', { content: item });\n\n		if (!event.data) {\n			event.data = $(''<'' + this.settings.itemElement + ''/>'')\n				.addClass(this.settings.itemClass).append(item)\n		}\n\n		this.trigger(''prepared'', { content: event.data });\n\n		return event.data;\n	};\n\n	/**\n	 * Updates the view.\n	 * @public\n	 */\n	Owl.prototype.update = function() {\n		var i = 0,\n			n = this._pipe.length,\n			filter = $.proxy(function(p) { return this[p] }, this._invalidated),\n			cache = {};\n\n		while (i < n) {\n			if (this._invalidated.all || $.grep(this._pipe[i].filter, filter).length > 0) {\n				this._pipe[i].run(cache);\n			}\n			i++;\n		}\n\n		this._invalidated = {};\n	};\n\n	/**\n	 * Gets the width of the view.\n	 * @public\n	 * @param {Owl.Width} [dimension=Owl.Width.Default] - The dimension to return.\n	 * @returns {Number} - The width of the view in pixel.\n	 */\n	Owl.prototype.width = function(dimension) {\n		dimension = dimension || Owl.Width.Default;\n		switch (dimension) {\n			case Owl.Width.Inner:\n			case Owl.Width.Outer:\n				return this._width;\n			default:\n				return this._width - this.settings.stagePadding * 2 + this.settings.margin;\n		}\n	};\n\n	/**\n	 * Refreshes the carousel primarily for adaptive purposes.\n	 * @public\n	 */\n	Owl.prototype.refresh = function() {\n		if (this._items.length === 0) {\n			return false;\n		}\n\n		var start = new Date().getTime();\n\n		this.trigger(''refresh'');\n\n		this.setup();\n\n		this.optionsLogic();\n\n		// hide and show methods helps here to set a proper widths,\n		// this prevents scrollbar to be calculated in stage width\n		this.$stage.addClass(''owl-refresh'');\n\n		this.update();\n\n		this.$stage.removeClass(''owl-refresh'');\n\n		this.state.orientation = window.orientation;\n\n		this.watchVisibility();\n\n		this.trigger(''refreshed'');\n	};\n\n	/**\n	 * Save internal event references and add event based functions.\n	 * @protected\n	 */\n	Owl.prototype.eventsCall = function() {\n		// Save events references\n		this.e._onDragStart = $.proxy(function(e) {\n			this.onDragStart(e);\n		}, this);\n		this.e._onDragMove = $.proxy(function(e) {\n			this.onDragMove(e);\n		}, this);\n		this.e._onDragEnd = $.proxy(function(e) {\n			this.onDragEnd(e);\n		}, this);\n		this.e._onResize = $.proxy(function(e) {\n			this.onResize(e);\n		}, this);\n		this.e._transitionEnd = $.proxy(function(e) {\n			this.transitionEnd(e);\n		}, this);\n		this.e._preventClick = $.proxy(function(e) {\n			this.preventClick(e);\n		}, this);\n	};\n\n	/**\n	 * Checks window `resize` event.\n	 * @protected\n	 */\n	Owl.prototype.onThrottledResize = function() {\n		window.clearTimeout(this.resizeTimer);\n		this.resizeTimer = window.setTimeout(this.e._onResize, this.settings.responsiveRefreshRate);\n	};\n\n	/**\n	 * Checks window `resize` event.\n	 * @protected\n	 */\n	Owl.prototype.onResize = function() {\n		if (!this._items.length) {\n			return false;\n		}\n\n		if (this._width === this.$element.width()) {\n			return false;\n		}\n\n		if (this.trigger(''resize'').isDefaultPrevented()) {\n			return false;\n		}\n\n		this._width = this.$element.width();\n\n		this.invalidate(''width'');\n\n		this.refresh();\n\n		this.trigger(''resized'');\n	};\n\n	/**\n	 * Checks for touch/mouse drag event type and add run event handlers.\n	 * @protected\n	 */\n	Owl.prototype.eventsRouter = function(event) {\n		var type = event.type;\n\n		if (type === "mousedown" || type === "touchstart") {\n			this.onDragStart(event);\n		} else if (type === "mousemove" || type === "touchmove") {\n			this.onDragMove(event);\n		} else if (type === "mouseup" || type === "touchend") {\n			this.onDragEnd(event);\n		} else if (type === "touchcancel") {\n			this.onDragEnd(event);\n		}\n	};\n\n	/**\n	 * Checks for touch/mouse drag options and add necessery event handlers.\n	 * @protected\n	 */\n	Owl.prototype.internalEvents = function() {\n		var isTouch = isTouchSupport(),\n			isTouchIE = isTouchSupportIE();\n\n		if (this.settings.mouseDrag){\n			this.$stage.on(''mousedown'', $.proxy(function(event) { this.eventsRouter(event) }, this));\n			this.$stage.on(''dragstart'', function() { return false });\n			this.$stage.get(0).onselectstart = function() { return false };\n		} else {\n			this.$element.addClass(''owl-text-select-on'');\n		}\n\n		if (this.settings.touchDrag && !isTouchIE){\n			this.$stage.on(''touchstart touchcancel'', $.proxy(function(event) { this.eventsRouter(event) }, this));\n		}\n\n		// catch transitionEnd event\n		if (this.transitionEndVendor) {\n			this.on(this.$stage.get(0), this.transitionEndVendor, this.e._transitionEnd, false);\n		}\n\n		// responsive\n		if (this.settings.responsive !== false) {\n			this.on(window, ''resize'', $.proxy(this.onThrottledResize, this));\n		}\n	};\n\n	/**\n	 * Handles touchstart/mousedown event.\n	 * @protected\n	 * @param {Event} event - The event arguments.\n	 */\n	Owl.prototype.onDragStart = function(event) {\n		var ev, isTouchEvent, pageX, pageY, animatedPos;\n\n		ev = event.originalEvent || event || window.event;\n\n		// prevent right click\n		if (ev.which === 3 || this.state.isTouch) {\n			return false;\n		}\n\n		if (ev.type === ''mousedown'') {\n			this.$stage.addClass(''owl-grab'');\n		}\n\n		this.trigger(''drag'');\n		this.drag.startTime = new Date().getTime();\n		this.speed(0);\n		this.state.isTouch = true;\n		this.state.isScrolling = false;\n		this.state.isSwiping = false;\n		this.drag.distance = 0;\n\n		pageX = getTouches(ev).x;\n		pageY = getTouches(ev).y;\n\n		// get stage position left\n		this.drag.offsetX = this.$stage.position().left;\n		this.drag.offsetY = this.$stage.position().top;\n\n		if (this.settings.rtl) {\n			this.drag.offsetX = this.$stage.position().left + this.$stage.width() - this.width()\n				+ this.settings.margin;\n		}\n\n		// catch position // ie to fix\n		if (this.state.inMotion && this.support3d) {\n			animatedPos = this.getTransformProperty();\n			this.drag.offsetX = animatedPos;\n			this.animate(animatedPos);\n			this.state.inMotion = true;\n		} else if (this.state.inMotion && !this.support3d) {\n			this.state.inMotion = false;\n			return false;\n		}\n\n		this.drag.startX = pageX - this.drag.offsetX;\n		this.drag.startY = pageY - this.drag.offsetY;\n\n		this.drag.start = pageX - this.drag.startX;\n		this.drag.targetEl = ev.target || ev.srcElement;\n		this.drag.updatedX = this.drag.start;\n\n		// to do/check\n		// prevent links and images dragging;\n		if (this.drag.targetEl.tagName === "IMG" || this.drag.targetEl.tagName === "A") {\n			this.drag.targetEl.draggable = false;\n		}\n\n		$(document).on(''mousemove.owl.dragEvents mouseup.owl.dragEvents touchmove.owl.dragEvents touchend.owl.dragEvents'', $.proxy(function(event) {this.eventsRouter(event)},this));\n	};\n\n	/**\n	 * Handles the touchmove/mousemove events.\n	 * @todo Simplify\n	 * @protected\n	 * @param {Event} event - The event arguments.\n	 */\n	Owl.prototype.onDragMove = function(event) {\n		var ev, isTouchEvent, pageX, pageY, minValue, maxValue, pull;\n\n		if (!this.state.isTouch) {\n			return;\n		}\n\n		if (this.state.isScrolling) {\n			return;\n		}\n\n		ev = event.originalEvent || event || window.event;\n\n		pageX = getTouches(ev).x;\n		pageY = getTouches(ev).y;\n\n		// Drag Direction\n		this.drag.currentX = pageX - this.drag.startX;\n		this.drag.currentY = pageY - this.drag.startY;\n		this.drag.distance = this.drag.currentX - this.drag.offsetX;\n\n		// Check move direction\n		if (this.drag.distance < 0) {\n			this.state.direction = this.settings.rtl ? ''right'' : ''left'';\n		} else if (this.drag.distance > 0) {\n			this.state.direction = this.settings.rtl ? ''left'' : ''right'';\n		}\n		// Loop\n		if (this.settings.loop) {\n			if (this.op(this.drag.currentX, ''>'', this.coordinates(this.minimum())) && this.state.direction === ''right'') {\n				this.drag.currentX -= (this.settings.center && this.coordinates(0)) - this.coordinates(this._items.length);\n			} else if (this.op(this.drag.currentX, ''<'', this.coordinates(this.maximum())) && this.state.direction === ''left'') {\n				this.drag.currentX += (this.settings.center && this.coordinates(0)) - this.coordinates(this._items.length);\n			}\n		} else {\n			// pull\n			minValue = this.settings.rtl ? this.coordinates(this.maximum()) : this.coordinates(this.minimum());\n			maxValue = this.settings.rtl ? this.coordinates(this.minimum()) : this.coordinates(this.maximum());\n			pull = this.settings.pullDrag ? this.drag.distance / 5 : 0;\n			this.drag.currentX = Math.max(Math.min(this.drag.currentX, minValue + pull), maxValue + pull);\n		}\n\n		// Lock browser if swiping horizontal\n\n		if ((this.drag.distance > 8 || this.drag.distance < -8)) {\n			if (ev.preventDefault !== undefined) {\n				ev.preventDefault();\n			} else {\n				ev.returnValue = false;\n			}\n			this.state.isSwiping = true;\n		}\n\n		this.drag.updatedX = this.drag.currentX;\n\n		// Lock Owl if scrolling\n		if ((this.drag.currentY > 16 || this.drag.currentY < -16) && this.state.isSwiping === false) {\n			this.state.isScrolling = true;\n			this.drag.updatedX = this.drag.start;\n		}\n\n		this.animate(this.drag.updatedX);\n	};\n\n	/**\n	 * Handles the touchend/mouseup events.\n	 * @protected\n	 */\n	Owl.prototype.onDragEnd = function(event) {\n		var compareTimes, distanceAbs, closest;\n\n		if (!this.state.isTouch) {\n			return;\n		}\n\n		if (event.type === ''mouseup'') {\n			this.$stage.removeClass(''owl-grab'');\n		}\n\n		this.trigger(''dragged'');\n\n		// prevent links and images dragging;\n		this.drag.targetEl.removeAttribute("draggable");\n\n		// remove drag event listeners\n\n		this.state.isTouch = false;\n		this.state.isScrolling = false;\n		this.state.isSwiping = false;\n\n		// to check\n		if (this.drag.distance === 0 && this.state.inMotion !== true) {\n			this.state.inMotion = false;\n			return false;\n		}\n\n		// prevent clicks while scrolling\n\n		this.drag.endTime = new Date().getTime();\n		compareTimes = this.drag.endTime - this.drag.startTime;\n		distanceAbs = Math.abs(this.drag.distance);\n\n		// to test\n		if (distanceAbs > 3 || compareTimes > 300) {\n			this.removeClick(this.drag.targetEl);\n		}\n\n		closest = this.closest(this.drag.updatedX);\n\n		this.speed(this.settings.dragEndSpeed || this.settings.smartSpeed);\n		this.current(closest);\n		this.invalidate(''position'');\n		this.update();\n\n		// if pullDrag is off then fire transitionEnd event manually when stick\n		// to border\n		if (!this.settings.pullDrag && this.drag.updatedX === this.coordinates(closest)) {\n			this.transitionEnd();\n		}\n\n		this.drag.distance = 0;\n\n		$(document).off(''.owl.dragEvents'');\n	};\n\n	/**\n	 * Attaches `preventClick` to disable link while swipping.\n	 * @protected\n	 * @param {HTMLElement} [target] - The target of the `click` event.\n	 */\n	Owl.prototype.removeClick = function(target) {\n		this.drag.targetEl = target;\n		$(target).on(''click.preventClick'', this.e._preventClick);\n		// to make sure click is removed:\n		window.setTimeout(function() {\n			$(target).off(''click.preventClick'');\n		}, 300);\n	};\n\n	/**\n	 * Suppresses click event.\n	 * @protected\n	 * @param {Event} ev - The event arguments.\n	 */\n	Owl.prototype.preventClick = function(ev) {\n		if (ev.preventDefault) {\n			ev.preventDefault();\n		} else {\n			ev.returnValue = false;\n		}\n		if (ev.stopPropagation) {\n			ev.stopPropagation();\n		}\n		$(ev.target).off(''click.preventClick'');\n	};\n\n	/**\n	 * Catches stage position while animate (only CSS3).\n	 * @protected\n	 * @returns\n	 */\n	Owl.prototype.getTransformProperty = function() {\n		var transform, matrix3d;\n\n		transform = window.getComputedStyle(this.$stage.get(0), null).getPropertyValue(this.vendorName + ''transform'');\n		// var transform = this.$stage.css(this.vendorName + ''transform'')\n		transform = transform.replace(/matrix(3d)?\\(|\\)/g, '''').split('','');\n		matrix3d = transform.length === 16;\n\n		return matrix3d !== true ? transform[4] : transform[12];\n	};\n\n	/**\n	 * Gets absolute position of the closest item for a coordinate.\n	 * @todo Setting `freeDrag` makes `closest` not reusable. See #165.\n	 * @protected\n	 * @param {Number} coordinate - The coordinate in pixel.\n	 * @return {Number} - The absolute position of the closest item.\n	 */\n	Owl.prototype.closest = function(coordinate) {\n		var position = -1, pull = 30, width = this.width(), coordinates = this.coordinates();\n\n		if (!this.settings.freeDrag) {\n			// check closest item\n			$.each(coordinates, $.proxy(function(index, value) {\n				if (coordinate > value - pull && coordinate < value + pull) {\n					position = index;\n				} else if (this.op(coordinate, ''<'', value)\n					&& this.op(coordinate, ''>'', coordinates[index + 1] || value - width)) {\n					position = this.state.direction === ''left'' ? index + 1 : index;\n				}\n				return position === -1;\n			}, this));\n		}\n\n		if (!this.settings.loop) {\n			// non loop boundries\n			if (this.op(coordinate, ''>'', coordinates[this.minimum()])) {\n				position = coordinate = this.minimum();\n			} else if (this.op(coordinate, ''<'', coordinates[this.maximum()])) {\n				position = coordinate = this.maximum();\n			}\n		}\n\n		return position;\n	};\n\n	/**\n	 * Animates the stage.\n	 * @public\n	 * @param {Number} coordinate - The coordinate in pixels.\n	 */\n	Owl.prototype.animate = function(coordinate) {\n		this.trigger(''translate'');\n		this.state.inMotion = this.speed() > 0;\n\n		if (this.support3d) {\n			this.$stage.css({\n				transform: ''translate3d('' + coordinate + ''px'' + '',0px, 0px)'',\n				transition: (this.speed() / 1000) + ''s''\n			});\n		} else if (this.state.isTouch) {\n			this.$stage.css({\n				left: coordinate + ''px''\n			});\n		} else {\n			this.$stage.animate({\n				left: coordinate\n			}, this.speed() / 1000, this.settings.fallbackEasing, $.proxy(function() {\n				if (this.state.inMotion) {\n					this.transitionEnd();\n				}\n			}, this));\n		}\n	};\n\n	/**\n	 * Sets the absolute position of the current item.\n	 * @public\n	 * @param {Number} [position] - The new absolute position or nothing to leave it unchanged.\n	 * @returns {Number} - The absolute position of the current item.\n	 */\n	Owl.prototype.current = function(position) {\n		if (position === undefined) {\n			return this._current;\n		}\n\n		if (this._items.length === 0) {\n			return undefined;\n		}\n\n		position = this.normalize(position);\n\n		if (this._current !== position) {\n			var event = this.trigger(''change'', { property: { name: ''position'', value: position } });\n\n			if (event.data !== undefined) {\n				position = this.normalize(event.data);\n			}\n\n			this._current = position;\n\n			this.invalidate(''position'');\n\n			this.trigger(''changed'', { property: { name: ''position'', value: this._current } });\n		}\n\n		return this._current;\n	};\n\n	/**\n	 * Invalidates the given part of the update routine.\n	 * @param {String} part - The part to invalidate.\n	 */\n	Owl.prototype.invalidate = function(part) {\n		this._invalidated[part] = true;\n	}\n\n	/**\n	 * Resets the absolute position of the current item.\n	 * @public\n	 * @param {Number} position - The absolute position of the new item.\n	 */\n	Owl.prototype.reset = function(position) {\n		position = this.normalize(position);\n\n		if (position === undefined) {\n			return;\n		}\n\n		this._speed = 0;\n		this._current = position;\n\n		this.suppress([ ''translate'', ''translated'' ]);\n\n		this.animate(this.coordinates(position));\n\n		this.release([ ''translate'', ''translated'' ]);\n	};\n\n	/**\n	 * Normalizes an absolute or a relative position for an item.\n	 * @public\n	 * @param {Number} position - The absolute or relative position to normalize.\n	 * @param {Boolean} [relative=false] - Whether the given position is relative or not.\n	 * @returns {Number} - The normalized position.\n	 */\n	Owl.prototype.normalize = function(position, relative) {\n		var n = (relative ? this._items.length : this._items.length + this._clones.length);\n\n		if (!$.isNumeric(position) || n < 1) {\n			return undefined;\n		}\n\n		if (this._clones.length) {\n			position = ((position % n) + n) % n;\n		} else {\n			position = Math.max(this.minimum(relative), Math.min(this.maximum(relative), position));\n		}\n\n		return position;\n	};\n\n	/**\n	 * Converts an absolute position for an item into a relative position.\n	 * @public\n	 * @param {Number} position - The absolute position to convert.\n	 * @returns {Number} - The converted position.\n	 */\n	Owl.prototype.relative = function(position) {\n		position = this.normalize(position);\n		position = position - this._clones.length / 2;\n		return this.normalize(position, true);\n	};\n\n	/**\n	 * Gets the maximum position for an item.\n	 * @public\n	 * @param {Boolean} [relative=false] - Whether to return an absolute position or a relative position.\n	 * @returns {Number}\n	 */\n	Owl.prototype.maximum = function(relative) {\n		var maximum, width, i = 0, coordinate,\n			settings = this.settings;\n\n		if (relative) {\n			return this._items.length - 1;\n		}\n\n		if (!settings.loop && settings.center) {\n			maximum = this._items.length - 1;\n		} else if (!settings.loop && !settings.center) {\n			maximum = this._items.length - settings.items;\n		} else if (settings.loop || settings.center) {\n			maximum = this._items.length + settings.items;\n		} else if (settings.autoWidth || settings.merge) {\n			revert = settings.rtl ? 1 : -1;\n			width = this.$stage.width() - this.$element.width();\n			while (coordinate = this.coordinates(i)) {\n				if (coordinate * revert >= width) {\n					break;\n				}\n				maximum = ++i;\n			}\n		} else {\n			throw ''Can not detect maximum absolute position.''\n		}\n\n		return maximum;\n	};\n\n	/**\n	 * Gets the minimum position for an item.\n	 * @public\n	 * @param {Boolean} [relative=false] - Whether to return an absolute position or a relative position.\n	 * @returns {Number}\n	 */\n	Owl.prototype.minimum = function(relative) {\n		if (relative) {\n			return 0;\n		}\n\n		return this._clones.length / 2;\n	};\n\n	/**\n	 * Gets an item at the specified relative position.\n	 * @public\n	 * @param {Number} [position] - The relative position of the item.\n	 * @return {jQuery|Array.<jQuery>} - The item at the given position or all items if no position was given.\n	 */\n	Owl.prototype.items = function(position) {\n		if (position === undefined) {\n			return this._items.slice();\n		}\n\n		position = this.normalize(position, true);\n		return this._items[position];\n	};\n\n	/**\n	 * Gets an item at the specified relative position.\n	 * @public\n	 * @param {Number} [position] - The relative position of the item.\n	 * @return {jQuery|Array.<jQuery>} - The item at the given position or all items if no position was given.\n	 */\n	Owl.prototype.mergers = function(position) {\n		if (position === undefined) {\n			return this._mergers.slice();\n		}\n\n		position = this.normalize(position, true);\n		return this._mergers[position];\n	};\n\n	/**\n	 * Gets the absolute positions of clones for an item.\n	 * @public\n	 * @param {Number} [position] - The relative position of the item.\n	 * @returns {Array.<Number>} - The absolute positions of clones for the item or all if no position was given.\n	 */\n	Owl.prototype.clones = function(position) {\n		var odd = this._clones.length / 2,\n			even = odd + this._items.length,\n			map = function(index) { return index % 2 === 0 ? even + index / 2 : odd - (index + 1) / 2 };\n\n		if (position === undefined) {\n			return $.map(this._clones, function(v, i) { return map(i) });\n		}\n\n		return $.map(this._clones, function(v, i) { return v === position ? map(i) : null });\n	};\n\n	/**\n	 * Sets the current animation speed.\n	 * @public\n	 * @param {Number} [speed] - The animation speed in milliseconds or nothing to leave it unchanged.\n	 * @returns {Number} - The current animation speed in milliseconds.\n	 */\n	Owl.prototype.speed = function(speed) {\n		if (speed !== undefined) {\n			this._speed = speed;\n		}\n\n		return this._speed;\n	};\n\n	/**\n	 * Gets the coordinate of an item.\n	 * @todo The name of this method is missleanding.\n	 * @public\n	 * @param {Number} position - The absolute position of the item within `minimum()` and `maximum()`.\n	 * @returns {Number|Array.<Number>} - The coordinate of the item in pixel or all coordinates.\n	 */\n	Owl.prototype.coordinates = function(position) {\n		var coordinate = null;\n\n		if (position === undefined) {\n			return $.map(this._coordinates, $.proxy(function(coordinate, index) {\n				return this.coordinates(index);\n			}, this));\n		}\n\n		if (this.settings.center) {\n			coordinate = this._coordinates[position];\n			coordinate += (this.width() - coordinate + (this._coordinates[position - 1] || 0)) / 2 * (this.settings.rtl ? -1 : 1);\n		} else {\n			coordinate = this._coordinates[position - 1] || 0;\n		}\n\n		return coordinate;\n	};\n\n	/**\n	 * Calculates the speed for a translation.\n	 * @protected\n	 * @param {Number} from - The absolute position of the start item.\n	 * @param {Number} to - The absolute position of the target item.\n	 * @param {Number} [factor=undefined] - The time factor in milliseconds.\n	 * @returns {Number} - The time in milliseconds for the translation.\n	 */\n	Owl.prototype.duration = function(from, to, factor) {\n		return Math.min(Math.max(Math.abs(to - from), 1), 6) * Math.abs((factor || this.settings.smartSpeed));\n	};\n\n	/**\n	 * Slides to the specified item.\n	 * @public\n	 * @param {Number} position - The position of the item.\n	 * @param {Number} [speed] - The time in milliseconds for the transition.\n	 */\n	Owl.prototype.to = function(position, speed) {\n		if (this.settings.loop) {\n			var distance = position - this.relative(this.current()),\n				revert = this.current(),\n				before = this.current(),\n				after = this.current() + distance,\n				direction = before - after < 0 ? true : false,\n				items = this._clones.length + this._items.length;\n\n			if (after < this.settings.items && direction === false) {\n				revert = before + this._items.length;\n				this.reset(revert);\n			} else if (after >= items - this.settings.items && direction === true) {\n				revert = before - this._items.length;\n				this.reset(revert);\n			}\n			window.clearTimeout(this.e._goToLoop);\n			this.e._goToLoop = window.setTimeout($.proxy(function() {\n				this.speed(this.duration(this.current(), revert + distance, speed));\n				this.current(revert + distance);\n				this.update();\n			}, this), 30);\n		} else {\n			this.speed(this.duration(this.current(), position, speed));\n			this.current(position);\n			this.update();\n		}\n	};\n\n	/**\n	 * Slides to the next item.\n	 * @public\n	 * @param {Number} [speed] - The time in milliseconds for the transition.\n	 */\n	Owl.prototype.next = function(speed) {\n		speed = speed || false;\n		this.to(this.relative(this.current()) + 1, speed);\n	};\n\n	/**\n	 * Slides to the previous item.\n	 * @public\n	 * @param {Number} [speed] - The time in milliseconds for the transition.\n	 */\n	Owl.prototype.prev = function(speed) {\n		speed = speed || false;\n		this.to(this.relative(this.current()) - 1, speed);\n	};\n\n	/**\n	 * Handles the end of an animation.\n	 * @protected\n	 * @param {Event} event - The event arguments.\n	 */\n	Owl.prototype.transitionEnd = function(event) {\n\n		// if css2 animation then event object is undefined\n		if (event !== undefined) {\n			event.stopPropagation();\n\n			// Catch only owl-stage transitionEnd event\n			if ((event.target || event.srcElement || event.originalTarget) !== this.$stage.get(0)) {\n				return false;\n			}\n		}\n\n		this.state.inMotion = false;\n		this.trigger(''translated'');\n	};\n\n	/**\n	 * Gets viewport width.\n	 * @protected\n	 * @return {Number} - The width in pixel.\n	 */\n	Owl.prototype.viewport = function() {\n		var width;\n		if (this.options.responsiveBaseElement !== window) {\n			width = $(this.options.responsiveBaseElement).width();\n		} else if (window.innerWidth) {\n			width = window.innerWidth;\n		} else if (document.documentElement && document.documentElement.clientWidth) {\n			width = document.documentElement.clientWidth;\n		} else {\n			throw ''Can not detect viewport width.'';\n		}\n		return width;\n	};\n\n	/**\n	 * Replaces the current content.\n	 * @public\n	 * @param {HTMLElement|jQuery|String} content - The new content.\n	 */\n	Owl.prototype.replace = function(content) {\n		this.$stage.empty();\n		this._items = [];\n\n		if (content) {\n			content = (content instanceof jQuery) ? content : $(content);\n		}\n\n		if (this.settings.nestedItemSelector) {\n			content = content.find(''.'' + this.settings.nestedItemSelector);\n		}\n\n		content.filter(function() {\n			return this.nodeType === 1;\n		}).each($.proxy(function(index, item) {\n			item = this.prepare(item);\n			this.$stage.append(item);\n			this._items.push(item);\n			this._mergers.push(item.find(''[data-merge]'').andSelf(''[data-merge]'').attr(''data-merge'') * 1 || 1);\n		}, this));\n\n		this.reset($.isNumeric(this.settings.startPosition) ? this.settings.startPosition : 0);\n\n		this.invalidate(''items'');\n	};\n\n	/**\n	 * Adds an item.\n	 * @todo Use `item` instead of `content` for the event arguments.\n	 * @public\n	 * @param {HTMLElement|jQuery|String} content - The item content to add.\n	 * @param {Number} [position] - The relative position at which to insert the item otherwise the item will be added to the end.\n	 */\n	Owl.prototype.add = function(content, position) {\n		position = position === undefined ? this._items.length : this.normalize(position, true);\n\n		this.trigger(''add'', { content: content, position: position });\n\n		if (this._items.length === 0 || position === this._items.length) {\n			this.$stage.append(content);\n			this._items.push(content);\n			this._mergers.push(content.find(''[data-merge]'').andSelf(''[data-merge]'').attr(''data-merge'') * 1 || 1);\n		} else {\n			this._items[position].before(content);\n			this._items.splice(position, 0, content);\n			this._mergers.splice(position, 0, content.find(''[data-merge]'').andSelf(''[data-merge]'').attr(''data-merge'') * 1 || 1);\n		}\n\n		this.invalidate(''items'');\n\n		this.trigger(''added'', { content: content, position: position });\n	};\n\n	/**\n	 * Removes an item by its position.\n	 * @todo Use `item` instead of `content` for the event arguments.\n	 * @public\n	 * @param {Number} position - The relative position of the item to remove.\n	 */\n	Owl.prototype.remove = function(position) {\n		position = this.normalize(position, true);\n\n		if (position === undefined) {\n			return;\n		}\n\n		this.trigger(''remove'', { content: this._items[position], position: position });\n\n		this._items[position].remove();\n		this._items.splice(position, 1);\n		this._mergers.splice(position, 1);\n\n		this.invalidate(''items'');\n\n		this.trigger(''removed'', { content: null, position: position });\n	};\n\n	/**\n	 * Adds triggerable events.\n	 * @protected\n	 */\n	Owl.prototype.addTriggerableEvents = function() {\n		var handler = $.proxy(function(callback, event) {\n			return $.proxy(function(e) {\n				if (e.relatedTarget !== this) {\n					this.suppress([ event ]);\n					callback.apply(this, [].slice.call(arguments, 1));\n					this.release([ event ]);\n				}\n			}, this);\n		}, this);\n\n		$.each({\n			''next'': this.next,\n			''prev'': this.prev,\n			''to'': this.to,\n			''destroy'': this.destroy,\n			''refresh'': this.refresh,\n			''replace'': this.replace,\n			''add'': this.add,\n			''remove'': this.remove\n		}, $.proxy(function(event, callback) {\n			this.$element.on(event + ''.owl.carousel'', handler(callback, event + ''.owl.carousel''));\n		}, this));\n\n	};\n\n	/**\n	 * Watches the visibility of the carousel element.\n	 * @protected\n	 */\n	Owl.prototype.watchVisibility = function() {\n\n		// test on zepto\n		if (!isElVisible(this.$element.get(0))) {\n			this.$element.addClass(''owl-hidden'');\n			window.clearInterval(this.e._checkVisibile);\n			this.e._checkVisibile = window.setInterval($.proxy(checkVisible, this), 500);\n		}\n\n		function isElVisible(el) {\n			return el.offsetWidth > 0 && el.offsetHeight > 0;\n		}\n\n		function checkVisible() {\n			if (isElVisible(this.$element.get(0))) {\n				this.$element.removeClass(''owl-hidden'');\n				this.refresh();\n				window.clearInterval(this.e._checkVisibile);\n			}\n		}\n	};\n\n	/**\n	 * Preloads images with auto width.\n	 * @protected\n	 * @todo Still to test\n	 */\n	Owl.prototype.preloadAutoWidthImages = function(imgs) {\n		var loaded, that, $el, img;\n\n		loaded = 0;\n		that = this;\n		imgs.each(function(i, el) {\n			$el = $(el);\n			img = new Image();\n\n			img.onload = function() {\n				loaded++;\n				$el.attr(''src'', img.src);\n				$el.css(''opacity'', 1);\n				if (loaded >= imgs.length) {\n					that.state.imagesLoaded = true;\n					that.initialize();\n				}\n			};\n\n			img.src = $el.attr(''src'') || $el.attr(''data-src'') || $el.attr(''data-src-retina'');\n		});\n	};\n\n	/**\n	 * Destroys the carousel.\n	 * @public\n	 */\n	Owl.prototype.destroy = function() {\n\n		if (this.$element.hasClass(this.settings.themeClass)) {\n			this.$element.removeClass(this.settings.themeClass);\n		}\n\n		if (this.settings.responsive !== false) {\n			$(window).off(''resize.owl.carousel'');\n		}\n\n		if (this.transitionEndVendor) {\n			this.off(this.$stage.get(0), this.transitionEndVendor, this.e._transitionEnd);\n		}\n\n		for ( var i in this._plugins) {\n			this._plugins[i].destroy();\n		}\n\n		if (this.settings.mouseDrag || this.settings.touchDrag) {\n			this.$stage.off(''mousedown touchstart touchcancel'');\n			$(document).off(''.owl.dragEvents'');\n			this.$stage.get(0).onselectstart = function() {};\n			this.$stage.off(''dragstart'', function() { return false });\n		}\n\n		// remove event handlers in the ".owl.carousel" namespace\n		this.$element.off(''.owl'');\n\n		this.$stage.children(''.cloned'').remove();\n		this.e = null;\n		this.$element.removeData(''owlCarousel'');\n\n		this.$stage.children().contents().unwrap();\n		this.$stage.children().unwrap();\n		this.$stage.unwrap();\n	};\n\n	/**\n	 * Operators to calculate right-to-left and left-to-right.\n	 * @protected\n	 * @param {Number} [a] - The left side operand.\n	 * @param {String} [o] - The operator.\n	 * @param {Number} [b] - The right side operand.\n	 */\n	Owl.prototype.op = function(a, o, b) {\n		var rtl = this.settings.rtl;\n		switch (o) {\n			case ''<'':\n				return rtl ? a > b : a < b;\n			case ''>'':\n				return rtl ? a < b : a > b;\n			case ''>='':\n				return rtl ? a <= b : a >= b;\n			case ''<='':\n				return rtl ? a >= b : a <= b;\n			default:\n				break;\n		}\n	};\n\n	/**\n	 * Attaches to an internal event.\n	 * @protected\n	 * @param {HTMLElement} element - The event source.\n	 * @param {String} event - The event name.\n	 * @param {Function} listener - The event handler to attach.\n	 * @param {Boolean} capture - Wether the event should be handled at the capturing phase or not.\n	 */\n	Owl.prototype.on = function(element, event, listener, capture) {\n		if (element.addEventListener) {\n			element.addEventListener(event, listener, capture);\n		} else if (element.attachEvent) {\n			element.attachEvent(''on'' + event, listener);\n		}\n	};\n\n	/**\n	 * Detaches from an internal event.\n	 * @protected\n	 * @param {HTMLElement} element - The event source.\n	 * @param {String} event - The event name.\n	 * @param {Function} listener - The attached event handler to detach.\n	 * @param {Boolean} capture - Wether the attached event handler was registered as a capturing listener or not.\n	 */\n	Owl.prototype.off = function(element, event, listener, capture) {\n		if (element.removeEventListener) {\n			element.removeEventListener(event, listener, capture);\n		} else if (element.detachEvent) {\n			element.detachEvent(''on'' + event, listener);\n		}\n	};\n\n	/**\n	 * Triggers an public event.\n	 * @protected\n	 * @param {String} name - The event name.\n	 * @param {*} [data=null] - The event data.\n	 * @param {String} [namespace=.owl.carousel] - The event namespace.\n	 * @returns {Event} - The event arguments.\n	 */\n	Owl.prototype.trigger = function(name, data, namespace) {\n		var status = {\n			item: { count: this._items.length, index: this.current() }\n		}, handler = $.camelCase(\n			$.grep([ ''on'', name, namespace ], function(v) { return v })\n				.join(''-'').toLowerCase()\n		), event = $.Event(\n			[ name, ''owl'', namespace || ''carousel'' ].join(''.'').toLowerCase(),\n			$.extend({ relatedTarget: this }, status, data)\n		);\n\n		if (!this._supress[name]) {\n			$.each(this._plugins, function(name, plugin) {\n				if (plugin.onTrigger) {\n					plugin.onTrigger(event);\n				}\n			});\n\n			this.$element.trigger(event);\n\n			if (this.settings && typeof this.settings[handler] === ''function'') {\n				this.settings[handler].apply(this, event);\n			}\n		}\n\n		return event;\n	};\n\n	/**\n	 * Suppresses events.\n	 * @protected\n	 * @param {Array.<String>} events - The events to suppress.\n	 */\n	Owl.prototype.suppress = function(events) {\n		$.each(events, $.proxy(function(index, event) {\n			this._supress[event] = true;\n		}, this));\n	}\n\n	/**\n	 * Releases suppressed events.\n	 * @protected\n	 * @param {Array.<String>} events - The events to release.\n	 */\n	Owl.prototype.release = function(events) {\n		$.each(events, $.proxy(function(index, event) {\n			delete this._supress[event];\n		}, this));\n	}\n\n	/**\n	 * Checks the availability of some browser features.\n	 * @protected\n	 */\n	Owl.prototype.browserSupport = function() {\n		this.support3d = isPerspective();\n\n		if (this.support3d) {\n			this.transformVendor = isTransform();\n\n			// take transitionend event name by detecting transition\n			var endVendors = [ ''transitionend'', ''webkitTransitionEnd'', ''transitionend'', ''oTransitionEnd'' ];\n			this.transitionEndVendor = endVendors[isTransition()];\n\n			// take vendor name from transform name\n			this.vendorName = this.transformVendor.replace(/Transform/i, '''');\n			this.vendorName = this.vendorName !== '''' ? ''-'' + this.vendorName.toLowerCase() + ''-'' : '''';\n		}\n\n		this.state.orientation = window.orientation;\n	};\n\n	/**\n	 * Get touch/drag coordinats.\n	 * @private\n	 * @param {event} - mousedown/touchstart event\n	 * @returns {object} - Contains X and Y of current mouse/touch position\n	 */\n\n	function getTouches(event) {\n		if (event.touches !== undefined) {\n			return {\n				x: event.touches[0].pageX,\n				y: event.touches[0].pageY\n			};\n		}\n\n		if (event.touches === undefined) {\n			if (event.pageX !== undefined) {\n				return {\n					x: event.pageX,\n					y: event.pageY\n				};\n			}\n\n		if (event.pageX === undefined) {\n			return {\n					x: event.clientX,\n					y: event.clientY\n				};\n			}\n		}\n	}\n\n	/**\n	 * Checks for CSS support.\n	 * @private\n	 * @param {Array} array - The CSS properties to check for.\n	 * @returns {Array} - Contains the supported CSS property name and its index or `false`.\n	 */\n	function isStyleSupported(array) {\n		var p, s, fake = document.createElement(''div''), list = array;\n		for (p in list) {\n			s = list[p];\n			if (typeof fake.style[s] !== ''undefined'') {\n				fake = null;\n				return [ s, p ];\n			}\n		}\n		return [ false ];\n	}\n\n	/**\n	 * Checks for CSS transition support.\n	 * @private\n	 * @todo Realy bad design\n	 * @returns {Number}\n	 */\n	function isTransition() {\n		return isStyleSupported([ ''transition'', ''WebkitTransition'', ''MozTransition'', ''OTransition'' ])[1];\n	}\n\n	/**\n	 * Checks for CSS transform support.\n	 * @private\n	 * @returns {String} The supported property name or false.\n	 */\n	function isTransform() {\n		return isStyleSupported([ ''transform'', ''WebkitTransform'', ''MozTransform'', ''OTransform'', ''msTransform'' ])[0];\n	}\n\n	/**\n	 * Checks for CSS perspective support.\n	 * @private\n	 * @returns {String} The supported property name or false.\n	 */\n	function isPerspective() {\n		return isStyleSupported([ ''perspective'', ''webkitPerspective'', ''MozPerspective'', ''OPerspective'', ''MsPerspective'' ])[0];\n	}\n\n	/**\n	 * Checks wether touch is supported or not.\n	 * @private\n	 * @returns {Boolean}\n	 */\n	function isTouchSupport() {\n		return ''ontouchstart'' in window || !!(navigator.msMaxTouchPoints);\n	}\n\n	/**\n	 * Checks wether touch is supported or not for IE.\n	 * @private\n	 * @returns {Boolean}\n	 */\n	function isTouchSupportIE() {\n		return window.navigator.msPointerEnabled;\n	}\n\n	/**\n	 * The jQuery Plugin for the Owl Carousel\n	 * @public\n	 */\n	$.fn.owlCarousel = function(options) {\n		return this.each(function() {\n			if (!$(this).data(''owlCarousel'')) {\n				$(this).data(''owlCarousel'', new Owl(this, options));\n			}\n		});\n	};\n\n	/**\n	 * The constructor for the jQuery Plugin\n	 * @public\n	 */\n	$.fn.owlCarousel.Constructor = Owl;\n\n})(window.Zepto || window.jQuery, window, document);\n\n/**\n * Lazy Plugin\n * @version 2.0.0\n * @author Bartosz Wojciechowski\n * @license The MIT License (MIT)\n */\n;(function($, window, document, undefined) {\n\n	/**\n	 * Creates the lazy plugin.\n	 * @class The Lazy Plugin\n	 * @param {Owl} carousel - The Owl Carousel\n	 */\n	var Lazy = function(carousel) {\n\n		/**\n		 * Reference to the core.\n		 * @protected\n		 * @type {Owl}\n		 */\n		this._core = carousel;\n\n		/**\n		 * Already loaded items.\n		 * @protected\n		 * @type {Array.<jQuery>}\n		 */\n		this._loaded = [];\n\n		/**\n		 * Event handlers.\n		 * @protected\n		 * @type {Object}\n		 */\n		this._handlers = {\n			''initialized.owl.carousel change.owl.carousel'': $.proxy(function(e) {\n				if (!e.namespace) {\n					return;\n				}\n\n				if (!this._core.settings || !this._core.settings.lazyLoad) {\n					return;\n				}\n\n				if ((e.property && e.property.name == ''position'') || e.type == ''initialized'') {\n					var settings = this._core.settings,\n						n = (settings.center && Math.ceil(settings.items / 2) || settings.items),\n						i = ((settings.center && n * -1) || 0),\n						position = ((e.property && e.property.value) || this._core.current()) + i,\n						clones = this._core.clones().length,\n						load = $.proxy(function(i, v) { this.load(v) }, this);\n\n					while (i++ < n) {\n						this.load(clones / 2 + this._core.relative(position));\n						clones && $.each(this._core.clones(this._core.relative(position++)), load);\n					}\n				}\n			}, this)\n		};\n\n		// set the default options\n		this._core.options = $.extend({}, Lazy.Defaults, this._core.options);\n\n		// register event handler\n		this._core.$element.on(this._handlers);\n	}\n\n	/**\n	 * Default options.\n	 * @public\n	 */\n	Lazy.Defaults = {\n		lazyLoad: false\n	}\n\n	/**\n	 * Loads all resources of an item at the specified position.\n	 * @param {Number} position - The absolute position of the item.\n	 * @protected\n	 */\n	Lazy.prototype.load = function(position) {\n		var $item = this._core.$stage.children().eq(position),\n			$elements = $item && $item.find(''.owl-lazy'');\n\n		if (!$elements || $.inArray($item.get(0), this._loaded) > -1) {\n			return;\n		}\n\n		$elements.each($.proxy(function(index, element) {\n			var $element = $(element), image,\n				url = (window.devicePixelRatio > 1 && $element.attr(''data-src-retina'')) || $element.attr(''data-src'');\n\n			this._core.trigger(''load'', { element: $element, url: url }, ''lazy'');\n\n			if ($element.is(''img'')) {\n				$element.one(''load.owl.lazy'', $.proxy(function() {\n					$element.css(''opacity'', 1);\n					this._core.trigger(''loaded'', { element: $element, url: url }, ''lazy'');\n				}, this)).attr(''src'', url);\n			} else {\n				image = new Image();\n				image.onload = $.proxy(function() {\n					$element.css({\n						''background-image'': ''url('' + url + '')'',\n						''opacity'': ''1''\n					});\n					this._core.trigger(''loaded'', { element: $element, url: url }, ''lazy'');\n				}, this);\n				image.src = url;\n			}\n		}, this));\n\n		this._loaded.push($item.get(0));\n	}\n\n	/**\n	 * Destroys the plugin.\n	 * @public\n	 */\n	Lazy.prototype.destroy = function() {\n		var handler, property;\n\n		for (handler in this.handlers) {\n			this._core.$element.off(handler, this.handlers[handler]);\n		}\n		for (property in Object.getOwnPropertyNames(this)) {\n			typeof this[property] != ''function'' && (this[property] = null);\n		}\n	}\n\n	$.fn.owlCarousel.Constructor.Plugins.Lazy = Lazy;\n\n})(window.Zepto || window.jQuery, window, document);\n\n/**\n * AutoHeight Plugin\n * @version 2.0.0\n * @author Bartosz Wojciechowski\n * @license The MIT License (MIT)\n */\n;(function($, window, document, undefined) {\n\n	/**\n	 * Creates the auto height plugin.\n	 * @class The Auto Height Plugin\n	 * @param {Owl} carousel - The Owl Carousel\n	 */\n	var AutoHeight = function(carousel) {\n		/**\n		 * Reference to the core.\n		 * @protected\n		 * @type {Owl}\n		 */\n		this._core = carousel;\n\n		/**\n		 * All event handlers.\n		 * @protected\n		 * @type {Object}\n		 */\n		this._handlers = {\n			''initialized.owl.carousel'': $.proxy(function() {\n				if (this._core.settings.autoHeight) {\n					this.update();\n				}\n			}, this),\n			''changed.owl.carousel'': $.proxy(function(e) {\n				if (this._core.settings.autoHeight && e.property.name == ''position''){\n					this.update();\n				}\n			}, this),\n			''loaded.owl.lazy'': $.proxy(function(e) {\n				if (this._core.settings.autoHeight && e.element.closest(''.'' + this._core.settings.itemClass)\n					=== this._core.$stage.children().eq(this._core.current())) {\n					this.update();\n				}\n			}, this)\n		};\n\n		// set default options\n		this._core.options = $.extend({}, AutoHeight.Defaults, this._core.options);\n\n		// register event handlers\n		this._core.$element.on(this._handlers);\n	};\n\n	/**\n	 * Default options.\n	 * @public\n	 */\n	AutoHeight.Defaults = {\n		autoHeight: false,\n		autoHeightClass: ''owl-height''\n	};\n\n	/**\n	 * Updates the view.\n	 */\n	AutoHeight.prototype.update = function() {\n		this._core.$stage.parent()\n			.height(this._core.$stage.children().eq(this._core.current()).height())\n			.addClass(this._core.settings.autoHeightClass);\n	};\n\n	AutoHeight.prototype.destroy = function() {\n		var handler, property;\n\n		for (handler in this._handlers) {\n			this._core.$element.off(handler, this._handlers[handler]);\n		}\n		for (property in Object.getOwnPropertyNames(this)) {\n			typeof this[property] != ''function'' && (this[property] = null);\n		}\n	};\n\n	$.fn.owlCarousel.Constructor.Plugins.AutoHeight = AutoHeight;\n\n})(window.Zepto || window.jQuery, window, document);\n\n/**\n * Video Plugin\n * @version 2.0.0\n * @author Bartosz Wojciechowski\n * @license The MIT License (MIT)\n */\n;(function($, window, document, undefined) {\n\n	/**\n	 * Creates the video plugin.\n	 * @class The Video Plugin\n	 * @param {Owl} carousel - The Owl Carousel\n	 */\n	var Video = function(carousel) {\n		/**\n		 * Reference to the core.\n		 * @protected\n		 * @type {Owl}\n		 */\n		this._core = carousel;\n\n		/**\n		 * Cache all video URLs.\n		 * @protected\n		 * @type {Object}\n		 */\n		this._videos = {};\n\n		/**\n		 * Current playing item.\n		 * @protected\n		 * @type {jQuery}\n		 */\n		this._playing = null;\n\n		/**\n		 * Whether this is in fullscreen or not.\n		 * @protected\n		 * @type {Boolean}\n		 */\n		this._fullscreen = false;\n\n		/**\n		 * All event handlers.\n		 * @protected\n		 * @type {Object}\n		 */\n		this._handlers = {\n			''resize.owl.carousel'': $.proxy(function(e) {\n				if (this._core.settings.video && !this.isInFullScreen()) {\n					e.preventDefault();\n				}\n			}, this),\n			''refresh.owl.carousel changed.owl.carousel'': $.proxy(function(e) {\n				if (this._playing) {\n					this.stop();\n				}\n			}, this),\n			''prepared.owl.carousel'': $.proxy(function(e) {\n				var $element = $(e.content).find(''.owl-video'');\n				if ($element.length) {\n					$element.css(''display'', ''none'');\n					this.fetch($element, $(e.content));\n				}\n			}, this)\n		};\n\n		// set default options\n		this._core.options = $.extend({}, Video.Defaults, this._core.options);\n\n		// register event handlers\n		this._core.$element.on(this._handlers);\n\n		this._core.$element.on(''click.owl.video'', ''.owl-video-play-icon'', $.proxy(function(e) {\n			this.play(e);\n		}, this));\n	};\n\n	/**\n	 * Default options.\n	 * @public\n	 */\n	Video.Defaults = {\n		video: false,\n		videoHeight: false,\n		videoWidth: false\n	};\n\n	/**\n	 * Gets the video ID and the type (YouTube/Vimeo only).\n	 * @protected\n	 * @param {jQuery} target - The target containing the video data.\n	 * @param {jQuery} item - The item containing the video.\n	 */\n	Video.prototype.fetch = function(target, item) {\n\n		var type = target.attr(''data-vimeo-id'') ? ''vimeo'' : ''youtube'',\n			id = target.attr(''data-vimeo-id'') || target.attr(''data-youtube-id''),\n			width = target.attr(''data-width'') || this._core.settings.videoWidth,\n			height = target.attr(''data-height'') || this._core.settings.videoHeight,\n			url = target.attr(''href'');\n\n		if (url) {\n			id = url.match(/(http:|https:|)\\/\\/(player.|www.)?(vimeo\\.com|youtu(be\\.com|\\.be|be\\.googleapis\\.com))\\/(video\\/|embed\\/|watch\\?v=|v\\/)?([A-Za-z0-9._%-]*)(\\&\\S+)?/);\n\n			if (id[3].indexOf(''youtu'') > -1) {\n				type = ''youtube'';\n			} else if (id[3].indexOf(''vimeo'') > -1) {\n				type = ''vimeo'';\n			} else {\n				throw new Error(''Video URL not supported.'');\n			}\n			id = id[6];\n		} else {\n			throw new Error(''Missing video URL.'');\n		}\n\n		this._videos[url] = {\n			type: type,\n			id: id,\n			width: width,\n			height: height\n		};\n\n		item.attr(''data-video'', url);\n\n		this.thumbnail(target, this._videos[url]);\n	};\n\n	/**\n	 * Creates video thumbnail.\n	 * @protected\n	 * @param {jQuery} target - The target containing the video data.\n	 * @param {Object} info - The video info object.\n	 * @see `fetch`\n	 */\n	Video.prototype.thumbnail = function(target, video) {\n\n		var tnLink,\n			icon,\n			path,\n			dimensions = video.width && video.height ? ''style="width:'' + video.width + ''px;height:'' + video.height + ''px;"'' : '''',\n			customTn = target.find(''img''),\n			srcType = ''src'',\n			lazyClass = '''',\n			settings = this._core.settings,\n			create = function(path) {\n				icon = ''<div class="owl-video-play-icon"></div>'';\n\n				if (settings.lazyLoad) {\n					tnLink = ''<div class="owl-video-tn '' + lazyClass + ''" '' + srcType + ''="'' + path + ''"></div>'';\n				} else {\n					tnLink = ''<div class="owl-video-tn" style="opacity:1;background-image:url('' + path + '')"></div>'';\n				}\n				target.after(tnLink);\n				target.after(icon);\n			};\n\n		// wrap video content into owl-video-wrapper div\n		target.wrap(''<div class="owl-video-wrapper"'' + dimensions + ''></div>'');\n\n		if (this._core.settings.lazyLoad) {\n			srcType = ''data-src'';\n			lazyClass = ''owl-lazy'';\n		}\n\n		// custom thumbnail\n		if (customTn.length) {\n			create(customTn.attr(srcType));\n			customTn.remove();\n			return false;\n		}\n\n		if (video.type === ''youtube'') {\n			path = "http://img.youtube.com/vi/" + video.id + "/hqdefault.jpg";\n			create(path);\n		} else if (video.type === ''vimeo'') {\n			$.ajax({\n				type: ''GET'',\n				url: ''http://vimeo.com/api/v2/video/'' + video.id + ''.json'',\n				jsonp: ''callback'',\n				dataType: ''jsonp'',\n				success: function(data) {\n					path = data[0].thumbnail_large;\n					create(path);\n				}\n			});\n		}\n	};\n\n	/**\n	 * Stops the current video.\n	 * @public\n	 */\n	Video.prototype.stop = function() {\n		this._core.trigger(''stop'', null, ''video'');\n		this._playing.find(''.owl-video-frame'').remove();\n		this._playing.removeClass(''owl-video-playing'');\n		this._playing = null;\n	};\n\n	/**\n	 * Starts the current video.\n	 * @public\n	 * @param {Event} ev - The event arguments.\n	 */\n	Video.prototype.play = function(ev) {\n		this._core.trigger(''play'', null, ''video'');\n\n		if (this._playing) {\n			this.stop();\n		}\n\n		var target = $(ev.target || ev.srcElement),\n			item = target.closest(''.'' + this._core.settings.itemClass),\n			video = this._videos[item.attr(''data-video'')],\n			width = video.width || ''100%'',\n			height = video.height || this._core.$stage.height(),\n			html, wrap;\n\n		if (video.type === ''youtube'') {\n			html = ''<iframe width="'' + width + ''" height="'' + height + ''" src="http://www.youtube.com/embed/''\n				+ video.id + ''?autoplay=1&v='' + video.id + ''" frameborder="0" allowfullscreen></iframe>'';\n		} else if (video.type === ''vimeo'') {\n			html = ''<iframe src="http://player.vimeo.com/video/'' + video.id + ''?autoplay=1" width="'' + width\n				+ ''" height="'' + height\n				+ ''" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>'';\n		}\n\n		item.addClass(''owl-video-playing'');\n		this._playing = item;\n\n		wrap = $(''<div style="height:'' + height + ''px; width:'' + width + ''px" class="owl-video-frame">''\n			+ html + ''</div>'');\n		target.after(wrap);\n	};\n\n	/**\n	 * Checks whether an video is currently in full screen mode or not.\n	 * @todo Bad style because looks like a readonly method but changes members.\n	 * @protected\n	 * @returns {Boolean}\n	 */\n	Video.prototype.isInFullScreen = function() {\n\n		// if Vimeo Fullscreen mode\n		var element = document.fullscreenElement || document.mozFullScreenElement\n			|| document.webkitFullscreenElement;\n\n		if (element && $(element).parent().hasClass(''owl-video-frame'')) {\n			this._core.speed(0);\n			this._fullscreen = true;\n		}\n\n		if (element && this._fullscreen && this._playing) {\n			return false;\n		}\n\n		// comming back from fullscreen\n		if (this._fullscreen) {\n			this._fullscreen = false;\n			return false;\n		}\n\n		// check full screen mode and window orientation\n		if (this._playing) {\n			if (this._core.state.orientation !== window.orientation) {\n				this._core.state.orientation = window.orientation;\n				return false;\n			}\n		}\n\n		return true;\n	};\n\n	/**\n	 * Destroys the plugin.\n	 */\n	Video.prototype.destroy = function() {\n		var handler, property;\n\n		this._core.$element.off(''click.owl.video'');\n\n		for (handler in this._handlers) {\n			this._core.$element.off(handler, this._handlers[handler]);\n		}\n		for (property in Object.getOwnPropertyNames(this)) {\n			typeof this[property] != ''function'' && (this[property] = null);\n		}\n	};\n\n	$.fn.owlCarousel.Constructor.Plugins.Video = Video;\n\n})(window.Zepto || window.jQuery, window, document);\n\n/**\n * Animate Plugin\n * @version 2.0.0\n * @author Bartosz Wojciechowski\n * @license The MIT License (MIT)\n */\n;(function($, window, document, undefined) {\n\n	/**\n	 * Creates the animate plugin.\n	 * @class The Navigation Plugin\n	 * @param {Owl} scope - The Owl Carousel\n	 */\n	var Animate = function(scope) {\n		this.core = scope;\n		this.core.options = $.extend({}, Animate.Defaults, this.core.options);\n		this.swapping = true;\n		this.previous = undefined;\n		this.next = undefined;\n\n		this.handlers = {\n			''change.owl.carousel'': $.proxy(function(e) {\n				if (e.property.name == ''position'') {\n					this.previous = this.core.current();\n					this.next = e.property.value;\n				}\n			}, this),\n			''drag.owl.carousel dragged.owl.carousel translated.owl.carousel'': $.proxy(function(e) {\n				this.swapping = e.type == ''translated'';\n			}, this),\n			''translate.owl.carousel'': $.proxy(function(e) {\n				if (this.swapping && (this.core.options.animateOut || this.core.options.animateIn)) {\n					this.swap();\n				}\n			}, this)\n		};\n\n		this.core.$element.on(this.handlers);\n	};\n\n	/**\n	 * Default options.\n	 * @public\n	 */\n	Animate.Defaults = {\n		animateOut: false,\n		animateIn: false\n	};\n\n	/**\n	 * Toggles the animation classes whenever an translations starts.\n	 * @protected\n	 * @returns {Boolean|undefined}\n	 */\n	Animate.prototype.swap = function() {\n\n		if (this.core.settings.items !== 1 || !this.core.support3d) {\n			return;\n		}\n\n		this.core.speed(0);\n\n		var left,\n			clear = $.proxy(this.clear, this),\n			previous = this.core.$stage.children().eq(this.previous),\n			next = this.core.$stage.children().eq(this.next),\n			incoming = this.core.settings.animateIn,\n			outgoing = this.core.settings.animateOut;\n\n		if (this.core.current() === this.previous) {\n			return;\n		}\n\n		if (outgoing) {\n			left = this.core.coordinates(this.previous) - this.core.coordinates(this.next);\n			previous.css( { ''left'': left + ''px'' } )\n				.addClass(''animated owl-animated-out'')\n				.addClass(outgoing)\n				.one(''webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend'', clear);\n		}\n\n		if (incoming) {\n			next.addClass(''animated owl-animated-in'')\n				.addClass(incoming)\n				.one(''webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend'', clear);\n		}\n	};\n\n	Animate.prototype.clear = function(e) {\n		$(e.target).css( { ''left'': '''' } )\n			.removeClass(''animated owl-animated-out owl-animated-in'')\n			.removeClass(this.core.settings.animateIn)\n			.removeClass(this.core.settings.animateOut);\n		this.core.transitionEnd();\n	}\n\n	/**\n	 * Destroys the plugin.\n	 * @public\n	 */\n	Animate.prototype.destroy = function() {\n		var handler, property;\n\n		for (handler in this.handlers) {\n			this.core.$element.off(handler, this.handlers[handler]);\n		}\n		for (property in Object.getOwnPropertyNames(this)) {\n			typeof this[property] != ''function'' && (this[property] = null);\n		}\n	};\n\n	$.fn.owlCarousel.Constructor.Plugins.Animate = Animate;\n\n})(window.Zepto || window.jQuery, window, document);\n\n/**\n * Autoplay Plugin\n * @version 2.0.0\n * @author Bartosz Wojciechowski\n * @license The MIT License (MIT)\n */\n;(function($, window, document, undefined) {\n\n	/**\n	 * Creates the autoplay plugin.\n	 * @class The Autoplay Plugin\n	 * @param {Owl} scope - The Owl Carousel\n	 */\n	var Autoplay = function(scope) {\n		this.core = scope;\n		this.core.options = $.extend({}, Autoplay.Defaults, this.core.options);\n\n		this.handlers = {\n			''translated.owl.carousel refreshed.owl.carousel'': $.proxy(function() {\n				this.autoplay();\n			}, this),\n			''play.owl.autoplay'': $.proxy(function(e, t, s) {\n				this.play(t, s);\n			}, this),\n			''stop.owl.autoplay'': $.proxy(function() {\n				this.stop();\n			}, this),\n			''mouseover.owl.autoplay'': $.proxy(function() {\n				if (this.core.settings.autoplayHoverPause) {\n					this.pause();\n				}\n			}, this),\n			''mouseleave.owl.autoplay'': $.proxy(function() {\n				if (this.core.settings.autoplayHoverPause) {\n					this.autoplay();\n				}\n			}, this)\n		};\n\n		this.core.$element.on(this.handlers);\n	};\n\n	/**\n	 * Default options.\n	 * @public\n	 */\n	Autoplay.Defaults = {\n		autoplay: false,\n		autoplayTimeout: 5000,\n		autoplayHoverPause: false,\n		autoplaySpeed: false\n	};\n\n	/**\n	 * @protected\n	 * @todo Must be documented.\n	 */\n	Autoplay.prototype.autoplay = function() {\n		if (this.core.settings.autoplay && !this.core.state.videoPlay) {\n			window.clearInterval(this.interval);\n\n			this.interval = window.setInterval($.proxy(function() {\n				this.play();\n			}, this), this.core.settings.autoplayTimeout);\n		} else {\n			window.clearInterval(this.interval);\n		}\n	};\n\n	/**\n	 * Starts the autoplay.\n	 * @public\n	 * @param {Number} [timeout] - ...\n	 * @param {Number} [speed] - ...\n	 * @returns {Boolean|undefined} - ...\n	 * @todo Must be documented.\n	 */\n	Autoplay.prototype.play = function(timeout, speed) {\n		// if tab is inactive - doesnt work in <IE10\n		if (document.hidden === true) {\n			return;\n		}\n\n		if (this.core.state.isTouch || this.core.state.isScrolling\n			|| this.core.state.isSwiping || this.core.state.inMotion) {\n			return;\n		}\n\n		if (this.core.settings.autoplay === false) {\n			window.clearInterval(this.interval);\n			return;\n		}\n\n		this.core.next(this.core.settings.autoplaySpeed);\n	};\n\n	/**\n	 * Stops the autoplay.\n	 * @public\n	 */\n	Autoplay.prototype.stop = function() {\n		window.clearInterval(this.interval);\n	};\n\n	/**\n	 * Pauses the autoplay.\n	 * @public\n	 */\n	Autoplay.prototype.pause = function() {\n		window.clearInterval(this.interval);\n	};\n\n	/**\n	 * Destroys the plugin.\n	 */\n	Autoplay.prototype.destroy = function() {\n		var handler, property;\n\n		window.clearInterval(this.interval);\n\n		for (handler in this.handlers) {\n			this.core.$element.off(handler, this.handlers[handler]);\n		}\n		for (property in Object.getOwnPropertyNames(this)) {\n			typeof this[property] != ''function'' && (this[property] = null);\n		}\n	};\n\n	$.fn.owlCarousel.Constructor.Plugins.autoplay = Autoplay;\n\n})(window.Zepto || window.jQuery, window, document);\n\n/**\n * Navigation Plugin\n * @version 2.0.0\n * @author Artus Kolanowski\n * @license The MIT License (MIT)\n */\n;(function($, window, document, undefined) {\n	''use strict'';\n\n	/**\n	 * Creates the navigation plugin.\n	 * @class The Navigation Plugin\n	 * @param {Owl} carousel - The Owl Carousel.\n	 */\n	var Navigation = function(carousel) {\n		/**\n		 * Reference to the core.\n		 * @protected\n		 * @type {Owl}\n		 */\n		this._core = carousel;\n\n		/**\n		 * Indicates whether the plugin is initialized or not.\n		 * @protected\n		 * @type {Boolean}\n		 */\n		this._initialized = false;\n\n		/**\n		 * The current paging indexes.\n		 * @protected\n		 * @type {Array}\n		 */\n		this._pages = [];\n\n		/**\n		 * All DOM elements of the user interface.\n		 * @protected\n		 * @type {Object}\n		 */\n		this._controls = {};\n\n		/**\n		 * Markup for an indicator.\n		 * @protected\n		 * @type {Array.<String>}\n		 */\n		this._templates = [];\n\n		/**\n		 * The carousel element.\n		 * @type {jQuery}\n		 */\n		this.$element = this._core.$element;\n\n		/**\n		 * Overridden methods of the carousel.\n		 * @protected\n		 * @type {Object}\n		 */\n		this._overrides = {\n			next: this._core.next,\n			prev: this._core.prev,\n			to: this._core.to\n		};\n\n		/**\n		 * All event handlers.\n		 * @protected\n		 * @type {Object}\n		 */\n		this._handlers = {\n			''prepared.owl.carousel'': $.proxy(function(e) {\n				if (this._core.settings.dotsData) {\n					this._templates.push($(e.content).find(''[data-dot]'').andSelf(''[data-dot]'').attr(''data-dot''));\n				}\n			}, this),\n			''add.owl.carousel'': $.proxy(function(e) {\n				if (this._core.settings.dotsData) {\n					this._templates.splice(e.position, 0, $(e.content).find(''[data-dot]'').andSelf(''[data-dot]'').attr(''data-dot''));\n				}\n			}, this),\n			''remove.owl.carousel prepared.owl.carousel'': $.proxy(function(e) {\n				if (this._core.settings.dotsData) {\n					this._templates.splice(e.position, 1);\n				}\n			}, this),\n			''change.owl.carousel'': $.proxy(function(e) {\n				if (e.property.name == ''position'') {\n					if (!this._core.state.revert && !this._core.settings.loop && this._core.settings.navRewind) {\n						var current = this._core.current(),\n							maximum = this._core.maximum(),\n							minimum = this._core.minimum();\n						e.data = e.property.value > maximum\n							? current >= maximum ? minimum : maximum\n							: e.property.value < minimum ? maximum : e.property.value;\n					}\n				}\n			}, this),\n			''changed.owl.carousel'': $.proxy(function(e) {\n				if (e.property.name == ''position'') {\n					this.draw();\n				}\n			}, this),\n			''refreshed.owl.carousel'': $.proxy(function() {\n				if (!this._initialized) {\n					this.initialize();\n					this._initialized = true;\n				}\n				this._core.trigger(''refresh'', null, ''navigation'');\n				this.update();\n				this.draw();\n				this._core.trigger(''refreshed'', null, ''navigation'');\n			}, this)\n		};\n\n		// set default options\n		this._core.options = $.extend({}, Navigation.Defaults, this._core.options);\n\n		// register event handlers\n		this.$element.on(this._handlers);\n	}\n\n	/**\n	 * Default options.\n	 * @public\n	 * @todo Rename `slideBy` to `navBy`\n	 */\n	Navigation.Defaults = {\n		nav: false,\n		navRewind: true,\n		navText: [ ''prev'', ''next'' ],\n		navSpeed: false,\n		navElement: ''div'',\n		navContainer: false,\n		navContainerClass: ''owl-nav'',\n		navClass: [ ''owl-prev'', ''owl-next'' ],\n		slideBy: 1,\n		dotClass: ''owl-dot'',\n		dotsClass: ''owl-dots'',\n		dots: true,\n		dotsEach: false,\n		dotData: false,\n		dotsSpeed: false,\n		dotsContainer: false,\n		controlsClass: ''owl-controls''\n	}\n\n	/**\n	 * Initializes the layout of the plugin and extends the carousel.\n	 * @protected\n	 */\n	Navigation.prototype.initialize = function() {\n		var $container, override,\n			options = this._core.settings;\n\n		// create the indicator template\n		if (!options.dotsData) {\n			this._templates = [ $(''<div>'')\n				.addClass(options.dotClass)\n				.append($(''<span>''))\n				.prop(''outerHTML'') ];\n		}\n\n		// create controls container if needed\n		if (!options.navContainer || !options.dotsContainer) {\n			this._controls.$container = $(''<div>'')\n				.addClass(options.controlsClass)\n				.appendTo(this.$element);\n		}\n\n		// create DOM structure for absolute navigation\n		this._controls.$indicators = options.dotsContainer ? $(options.dotsContainer)\n			: $(''<div>'').hide().addClass(options.dotsClass).appendTo(this._controls.$container);\n\n		this._controls.$indicators.on(''click'', ''div'', $.proxy(function(e) {\n			var index = $(e.target).parent().is(this._controls.$indicators)\n				? $(e.target).index() : $(e.target).parent().index();\n\n			e.preventDefault();\n\n			this.to(index, options.dotsSpeed);\n		}, this));\n\n		// create DOM structure for relative navigation\n		$container = options.navContainer ? $(options.navContainer)\n			: $(''<div>'').addClass(options.navContainerClass).prependTo(this._controls.$container);\n\n		this._controls.$next = $(''<'' + options.navElement + ''>'');\n		this._controls.$previous = this._controls.$next.clone();\n\n		this._controls.$previous\n			.addClass(options.navClass[0])\n			.html(options.navText[0])\n			.hide()\n			.prependTo($container)\n			.on(''click'', $.proxy(function(e) {\n				this.prev(options.navSpeed);\n			}, this));\n		this._controls.$next\n			.addClass(options.navClass[1])\n			.html(options.navText[1])\n			.hide()\n			.appendTo($container)\n			.on(''click'', $.proxy(function(e) {\n				this.next(options.navSpeed);\n			}, this));\n\n		// override public methods of the carousel\n		for (override in this._overrides) {\n			this._core[override] = $.proxy(this[override], this);\n		}\n	}\n\n	/**\n	 * Destroys the plugin.\n	 * @protected\n	 */\n	Navigation.prototype.destroy = function() {\n		var handler, control, property, override;\n\n		for (handler in this._handlers) {\n			this.$element.off(handler, this._handlers[handler]);\n		}\n		for (control in this._controls) {\n			this._controls[control].remove();\n		}\n		for (override in this.overides) {\n			this._core[override] = this._overrides[override];\n		}\n		for (property in Object.getOwnPropertyNames(this)) {\n			typeof this[property] != ''function'' && (this[property] = null);\n		}\n	}\n\n	/**\n	 * Updates the internal state.\n	 * @protected\n	 */\n	Navigation.prototype.update = function() {\n		var i, j, k,\n			options = this._core.settings,\n			lower = this._core.clones().length / 2,\n			upper = lower + this._core.items().length,\n			size = options.center || options.autoWidth || options.dotData\n				? 1 : options.dotsEach || options.items;\n\n		if (options.slideBy !== ''page'') {\n			options.slideBy = Math.min(options.slideBy, options.items);\n		}\n\n		if (options.dots || options.slideBy == ''page'') {\n			this._pages = [];\n\n			for (i = lower, j = 0, k = 0; i < upper; i++) {\n				if (j >= size || j === 0) {\n					this._pages.push({\n						start: i - lower,\n						end: i - lower + size - 1\n					});\n					j = 0, ++k;\n				}\n				j += this._core.mergers(this._core.relative(i));\n			}\n		}\n	}\n\n	/**\n	 * Draws the user interface.\n	 * @todo The option `dotData` wont work.\n	 * @protected\n	 */\n	Navigation.prototype.draw = function() {\n		var difference, i, html = '''',\n			options = this._core.settings,\n			$items = this._core.$stage.children(),\n			index = this._core.relative(this._core.current());\n\n		if (options.nav && !options.loop && !options.navRewind) {\n			this._controls.$previous.toggleClass(''disabled'', index <= 0);\n			this._controls.$next.toggleClass(''disabled'', index >= this._core.maximum());\n		}\n\n		this._controls.$previous.toggle(options.nav);\n		this._controls.$next.toggle(options.nav);\n\n		if (options.dots) {\n			difference = this._pages.length - this._controls.$indicators.children().length;\n\n			if (options.dotData && difference !== 0) {\n				for (i = 0; i < this._controls.$indicators.children().length; i++) {\n					html += this._templates[this._core.relative(i)];\n				}\n				this._controls.$indicators.html(html);\n			} else if (difference > 0) {\n				html = new Array(difference + 1).join(this._templates[0]);\n				this._controls.$indicators.append(html);\n			} else if (difference < 0) {\n				this._controls.$indicators.children().slice(difference).remove();\n			}\n\n			this._controls.$indicators.find(''.active'').removeClass(''active'');\n			this._controls.$indicators.children().eq($.inArray(this.current(), this._pages)).addClass(''active'');\n		}\n\n		this._controls.$indicators.toggle(options.dots);\n	}\n\n	/**\n	 * Extends event data.\n	 * @protected\n	 * @param {Event} event - The event object which gets thrown.\n	 */\n	Navigation.prototype.onTrigger = function(event) {\n		var settings = this._core.settings;\n\n		event.page = {\n			index: $.inArray(this.current(), this._pages),\n			count: this._pages.length,\n			size: settings && (settings.center || settings.autoWidth || settings.dotData\n				? 1 : settings.dotsEach || settings.items)\n		};\n	}\n\n	/**\n	 * Gets the current page position of the carousel.\n	 * @protected\n	 * @returns {Number}\n	 */\n	Navigation.prototype.current = function() {\n		var index = this._core.relative(this._core.current());\n		return $.grep(this._pages, function(o) {\n			return o.start <= index && o.end >= index;\n		}).pop();\n	}\n\n	/**\n	 * Gets the current succesor/predecessor position.\n	 * @protected\n	 * @returns {Number}\n	 */\n	Navigation.prototype.getPosition = function(successor) {\n		var position, length,\n			options = this._core.settings;\n\n		if (options.slideBy == ''page'') {\n			position = $.inArray(this.current(), this._pages);\n			length = this._pages.length;\n			successor ? ++position : --position;\n			position = this._pages[((position % length) + length) % length].start;\n		} else {\n			position = this._core.relative(this._core.current());\n			length = this._core.items().length;\n			successor ? position += options.slideBy : position -= options.slideBy;\n		}\n		return position;\n	}\n\n	/**\n	 * Slides to the next item or page.\n	 * @public\n	 * @param {Number} [speed=false] - The time in milliseconds for the transition.\n	 */\n	Navigation.prototype.next = function(speed) {\n		$.proxy(this._overrides.to, this._core)(this.getPosition(true), speed);\n	}\n\n	/**\n	 * Slides to the previous item or page.\n	 * @public\n	 * @param {Number} [speed=false] - The time in milliseconds for the transition.\n	 */\n	Navigation.prototype.prev = function(speed) {\n		$.proxy(this._overrides.to, this._core)(this.getPosition(false), speed);\n	}\n\n	/**\n	 * Slides to the specified item or page.\n	 * @public\n	 * @param {Number} position - The position of the item or page.\n	 * @param {Number} [speed] - The time in milliseconds for the transition.\n	 * @param {Boolean} [standard=false] - Whether to use the standard behaviour or not.\n	 */\n	Navigation.prototype.to = function(position, speed, standard) {\n		var length;\n\n		if (!standard) {\n			length = this._pages.length;\n			$.proxy(this._overrides.to, this._core)(this._pages[((position % length) + length) % length].start, speed);\n		} else {\n			$.proxy(this._overrides.to, this._core)(position, speed);\n		}\n	}\n\n	$.fn.owlCarousel.Constructor.Plugins.Navigation = Navigation;\n\n})(window.Zepto || window.jQuery, window, document);\n\n/**\n * Hash Plugin\n * @version 2.0.0\n * @author Artus Kolanowski\n * @license The MIT License (MIT)\n */\n;(function($, window, document, undefined) {\n	''use strict'';\n\n	/**\n	 * Creates the hash plugin.\n	 * @class The Hash Plugin\n	 * @param {Owl} carousel - The Owl Carousel\n	 */\n	var Hash = function(carousel) {\n		/**\n		 * Reference to the core.\n		 * @protected\n		 * @type {Owl}\n		 */\n		this._core = carousel;\n\n		/**\n		 * Hash table for the hashes.\n		 * @protected\n		 * @type {Object}\n		 */\n		this._hashes = {};\n\n		/**\n		 * The carousel element.\n		 * @type {jQuery}\n		 */\n		this.$element = this._core.$element;\n\n		/**\n		 * All event handlers.\n		 * @protected\n		 * @type {Object}\n		 */\n		this._handlers = {\n			''initialized.owl.carousel'': $.proxy(function() {\n				if (this._core.settings.startPosition == ''URLHash'') {\n					$(window).trigger(''hashchange.owl.navigation'');\n				}\n			}, this),\n			''prepared.owl.carousel'': $.proxy(function(e) {\n				var hash = $(e.content).find(''[data-hash]'').andSelf(''[data-hash]'').attr(''data-hash'');\n				this._hashes[hash] = e.content;\n			}, this)\n		};\n\n		// set default options\n		this._core.options = $.extend({}, Hash.Defaults, this._core.options);\n\n		// register the event handlers\n		this.$element.on(this._handlers);\n\n		// register event listener for hash navigation\n		$(window).on(''hashchange.owl.navigation'', $.proxy(function() {\n			var hash = window.location.hash.substring(1),\n				items = this._core.$stage.children(),\n				position = this._hashes[hash] && items.index(this._hashes[hash]) || 0;\n\n			if (!hash) {\n				return false;\n			}\n\n			this._core.to(position, false, true);\n		}, this));\n	}\n\n	/**\n	 * Default options.\n	 * @public\n	 */\n	Hash.Defaults = {\n		URLhashListener: false\n	}\n\n	/**\n	 * Destroys the plugin.\n	 * @public\n	 */\n	Hash.prototype.destroy = function() {\n		var handler, property;\n\n		$(window).off(''hashchange.owl.navigation'');\n\n		for (handler in this._handlers) {\n			this._core.$element.off(handler, this._handlers[handler]);\n		}\n		for (property in Object.getOwnPropertyNames(this)) {\n			typeof this[property] != ''function'' && (this[property] = null);\n		}\n	}\n\n	$.fn.owlCarousel.Constructor.Plugins.Hash = Hash;\n\n})(window.Zepto || window.jQuery, window, document);\n', '', 1469811251, 1, 'n', 0, '11', 'n', 'n', 'o', 0, 'n');
INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `template_type`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`, `protect_javascript`) VALUES
(13, 1, 1, 'global', 'js', '    $(''ul.nav li.dropdown'').hover(function() {\n	  $(this).find(''.dropdown-menu'').stop(true, true).delay(200).fadeIn(500);\n	}, function() {\n	  $(this).find(''.dropdown-menu'').stop(true, true).delay(200).fadeOut(500);\n	});\n', '', 1469811357, 1, 'n', 0, '11', 'n', 'n', 'o', 0, 'n'),
(14, 1, 6, 'index', 'webpage', '', NULL, 1469811749, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n'),
(15, 1, 6, 'header', 'webpage', '<!DOCTYPE html>\n<html lang="en">\n  <head>\n    <meta charset="utf-8">\n    <meta http-equiv="X-UA-Compatible" content="IE=edge">\n    <meta name="viewport" content="width=device-width, initial-scale=1">\n    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->\n    <title>{embed:title}</title>\n\n    <!-- Bootstrap -->\n    <link rel="stylesheet" type="text/css" media="all" href="{stylesheet=''bootstrap/bootstrap.min''}" />\n\n    <!-- Font Awesome -->\n	<link rel="stylesheet" type="text/css" media="all" href="{stylesheet=''font-awesome/font-awesome.min''}" />\n    \n\n	<link rel="stylesheet" type="text/css" media="all" href="{stylesheet=''owlcarousel/owl.carousel.min''}" />\n	<link rel="stylesheet" type="text/css" media="all" href="{stylesheet=''owlcarousel/owl.theme.default.min''}" />\n    \n    <link rel="stylesheet" type="text/css" media="all" href="{stylesheet=''styles/main''}" />\n\n    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->\n    <!-- WARNING: Respond.js doesn''t work if you view the page via file:// -->\n    <!--[if lt IE 9]>\n      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>\n      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>\n    <![endif]-->\n  </head>\n  <body>\n    <div class="container-fluid">\n    <header id="header">\n      <div class="container">\n      <div class="row">\n          <div class="col-xs-12 col-sm-12 col-md-3">\n            <div class="logo">\n              <span>CLOTHES</span>\n            </div>\n          </div>\n          <div class="col-xs-12 col-sm-12 col-md-9">\n\n            <nav class = "navbar navbar-default" role = "navigation">\n               <div class = "navbar-header">\n                  <button type = "button" class = "navbar-toggle" \n                     data-toggle = "collapse" data-target = "#navbar-collapse">\n                     <span class = "sr-only">Toggle navigation</span>\n                     <span class = "icon-bar"></span>\n                     <span class = "icon-bar"></span>\n                     <span class = "icon-bar"></span>\n                  </button>\n               </div>\n               \n               <div class = "collapse navbar-collapse" id = "navbar-collapse">\n              \n                  <ul class = "nav navbar-nav ext-menu">\n                     <li class = "active"><a href = "#">Trang chủ</a></li>\n                     <li class="dropdown">\n                        <a href = "#">Đồng phục<b class="caret"></b></a>\n                        <ul class="dropdown-menu">\n                          <li><a href="#">Sub1</a></li>\n                          <li><a href="#">Sub1</a></li>\n                          <li><a href="#">Sub1</a></li>\n                          <li><a href="#">Sub1</a></li>\n                        </ul>\n                      </li>\n                     <li><a href = "#">Khách Hàng</a></li>\n                     <li><a href = "#">Đối tác</a></li>\n                     <li><a href = "#">Giới Thiệu</a></li>\n                     <li><a href = "#">Liên Hệ</a></li>\n\n                  </ul>\n               </div>                \n            </nav>\n          </div>\n      </div>\n      </div>\n    </header>\n    </div>', '', 1469812646, 1, 'n', 0, '11', 'n', 'n', 'o', 0, 'n'),
(16, 1, 6, 'slide', 'webpage', '    <div class="slide mt10">\n      <div class="container">\n          <div class="customNavigation">\n            <a title="Previous" class="btn-bs prev-bs fa fa-angle-left"></a>\n            <a title="Next" class="btn-bs next-bs fa fa-angle-right"></a>\n          </div>\n\n          <div class="owl-carousel-slide">\n\n            <div class="one-slide">\n              <img class="img-responsive" src="{site_url}images/uploads/slide1.jpg">\n            </div>\n\n            <div class="one-slide">\n              <img class="img-responsive" src="{site_url}images/uploads/slide1.jpg">\n            </div>\n\n            <div class="one-slide">\n              <img class="img-responsive" src="{site_url}images/uploads/slide1.jpg">\n            </div>\n\n          </div>\n      </div>\n    </div>', '', 1469813450, 1, 'n', 0, '11', 'n', 'n', 'o', 0, 'n'),
(17, 1, 6, 'featured', 'webpage', '    <div class="featured mt10">\n      <div class="container">\n        <div class="f-title"><span>Mẫu đồng phục</span></div>\n        <div class="f-content mt20">\n          <div class="row">\n            <div class="col-xs-12 col-sm-4 col-md-4">\n              <div class="f-one">\n                <img src="{site_url}images/uploads/f1.jpg">\n                <div class="f-one-title">\n                  <span>Đồng phục công ty</span>\n                </div>\n              </div>\n            </div>\n            <div class="col-xs-12 col-sm-4 col-md-4">\n              <div class="f-one">\n                <img src="{site_url}images/uploads/f2.jpg">\n                <div class="f-one-title">\n                  <span>Đồng phục học sinh</span>\n                </div>\n              </div>\n            </div>\n            <div class="col-xs-12 col-sm-4 col-md-4">\n              <div class="f-one">\n                <img src="{site_url}images/uploads/f3.jpg">\n                <div class="f-one-title">\n                  <span>Áo thun nhóm</span>\n                </div>\n              </div>\n            </div>\n          </div>\n        </div>\n      </div>\n    </div>', '', 1469813609, 1, 'n', 0, '11', 'n', 'n', 'o', 0, 'n'),
(18, 1, 6, 'services', 'webpage', '    <div class="services mt20">\n      <div class="container">\n        <div class="s-title"><span>Dịch vụ chuyên nghiệp</span></div>\n        <div class="s-content mt20">\n          <div class="row">\n            <div class="col-xs-12 col-sm-6 col-md-3">\n              <div class="s-one">\n                <img src="{site_url}images/uploads/s1.png">\n                <div class="s-one-title"><span>Giải pháp toàn diện</span></div>\n                <div class="s-one-des"><p>Kiểm soát từ khâu dệt vải, may áo, thêu mẫu đến in ấn. Cung cấp giải pháp toàn diện cho cá nhân, doanh nghiệp</p></div>\n              </div>\n            </div>\n            <div class="col-xs-12 col-sm-6 col-md-3">\n              <div class="s-one">\n                <img src="{site_url}images/uploads/s2.png">\n                <div class="s-one-title"><span>Giải pháp toàn diện</span></div>\n                <div class="s-one-des"><p>Quy mô 2000m2, xưởng có khả năng sản xuất hơn 1.500 áo thun/ ngày tương đương 50.000 áo thun/ tháng </p></div>\n              </div>\n            </div>\n            <div class="col-xs-12 col-sm-6 col-md-3">\n              <div class="s-one">\n                <img src="{site_url}images/uploads/s3.png">\n                <div class="s-one-title"><span>Giải pháp toàn diện</span></div>\n                <div class="s-one-des"><p>Bộ phận tư vấn của chúng tôi luôn có mặt từ 8am - 5pm các ngày trong tuần, thứ 7 từ 8am - 12am</p></div>\n              </div>\n            </div>\n            <div class="col-xs-12 col-sm-6 col-md-3">\n              <div class="s-one">\n                <img src="{site_url}images/uploads/s4.png">\n                <div class="s-one-title"><span>Giải pháp toàn diện</span></div>\n                <div class="s-one-des"><p>Có hàng ngàn mẫu áo thun đồng phục cho mọi loại hình tổ chức, doanh nghiệp</p></div>\n              </div>\n            </div>\n          </div>\n        </div>\n      </div>\n    </div>', '', 1469813739, 1, 'n', 0, '11', 'n', 'n', 'o', 0, 'n'),
(19, 1, 6, 'testimonial', 'webpage', '    <div class="testimonial mt20">\n      <div class="container">\n        <div class="t-title"><span>Phản hồi khách hàng</span></div>\n        <div class="t-content mt20">\n          <div class="owl-carousel-testimonial">\n\n            <div class="one-testimonial">\n              <div class="t-feedback">\n              <p>Đội ngũ nhân viên rất tân tình, về chất lượng áo thì khá tốt.và bảng màu vải cũng rất đẹp nữa. Hi vọng các bạn sẽ duy trì được chất lượng dịch vụ.</p>\n              <div class="t-name">\n                <span>Nguyễn thị hồng nhung</span>\n              </div>\n              </div>\n\n              <div class="t-avt mt20">\n                <img src="{site_url}images/uploads/t1.png">\n              </div>\n            </div>\n\n            <div class="one-testimonial">\n              <div class="t-feedback">\n              <p>Chúng tôi hài lòng về chất lượng dịch vụ .đã làm nhiều đơn hàng ở công ty rồi.</p>\n              <div class="t-name">\n                <span>Vũ Phan Anh</span>\n              </div>\n              </div>\n\n              <div class="t-avt mt20">\n                <img src="{site_url}images/uploads/t2.png">\n              </div>\n            </div>\n            <div class="one-testimonial">\n              <div class="t-feedback">\n              <p>Mẫu thêu logo đẹp, đáp ứng được đầy đủ yêu cầu của công ty chúng tôi.</p>\n              <div class="t-name">\n                <span>Phan Ngọc Lan</span>\n              </div>\n              </div>\n\n              <div class="t-avt mt20">\n                <img src="{site_url}images/uploads/t3.png">\n              </div>\n            </div>\n\n          </div>\n        </div>\n      </div>\n    </div>', '', 1469813880, 1, 'n', 0, '11', 'n', 'n', 'o', 0, 'n'),
(20, 1, 6, 'blog', 'webpage', '    <div class="blog mt20">\n      <div class="container">\n        <div class="b-title"><span>Tin tức</span></div>\n        <div class="b-content mt20">\n          <div class="row">\n            <div class="col-xs12 col-sm-6 col-md-6">\n              <div class="media">\n                <a class="media-left" href="#">\n                  <img class="media-object" src="{site_url}images/uploads/b1.jpg" alt="Generic placeholder image">\n                </a>\n                <div class="media-body">\n                  <a href="#">\n                    <h5 class="media-heading">Ngắm đồng phục học sinh Việt từ xưa đến nay</h5>\n                    <p>Từ xưa tới nay, những bộ đồng phục luôn gắn liền với mỗi học sinh, thể hiện phong cách, dấu ấn riêng của từng ngôi trường. Bộ đồng phục không chỉ có ý nghĩa tạo nên sự bình đẳng giữa tất cả các học sinh trong trường mà còn giúp tôn lên nét đẹp tuổi học trò,</p>\n                  </a>\n                </div>\n              </div>\n            </div>\n            <div class="col-xs12 col-sm-6 col-md-6">\n              <div class="media">\n                <a class="media-left" href="#">\n                  <img class="media-object" src="{site_url}images/uploads//b2.jpg" alt="Generic placeholder image">\n                </a>\n                <div class="media-body">\n                  <a href="#">\n                    <h5 class="media-heading">3 xu hướng áo in "đốn tim" cả sao & hot girl Việt</h5>\n                    <p>Nghe tưởng quen thuộc, nhưng kỳ thực, những chiếc áo in chữ hay slogan đang là xu hướng áo "hot" nhất của mùa. Cụ thể, hình in biểu tượng trên áo thun đã nhường ngôi cho những dòng chữ cá tính không chỉ ngự trị trên áo thun mà còn tấn công sang cả sweater, sweatshirt, áo khoác...</p>\n                  </a>\n                </div>\n              </div>\n            </div>\n          </div>\n          <div class="row">\n            <div class="col-xs12 col-sm-6 col-md-6">\n              <div class="media">\n                <a class="media-left" href="#">\n                  <img class="media-object" src="{site_url}images/uploads/b3.jpg" alt="Generic placeholder image">\n                </a>\n                <div class="media-body">\n                  <a href="#">\n                    <h5 class="media-heading">5 kiểu áo phông trắng mặc thế nào cũng đẹp</h5>\n                    <p>Áo phông trắng được xem như một chủ đề thú vị bởi chúng có thể mặc theo vô vàn style và tông màu trắng lúc nào cũng khiến người diện bừng sáng hơn.</p>\n                  </a>\n                </div>\n              </div>\n            </div>\n            <div class="col-xs12 col-sm-6 col-md-6">\n              <div class="media">\n                <a class="media-left" href="#">\n                  <img class="media-object" src="{site_url}images/uploads/b4.jpg" alt="Generic placeholder image">\n                </a>\n                <div class="media-body">\n                  <a href="#">\n                    <h5 class="media-heading">Sao Hàn vẫn "tỏa sáng" khi diện đồng phục học sinh</h5>\n                    <p>Được sự yêu mến của hàng ngàn khách hàng, Veneto luôn dẫn đầu thị trường thời trang nam với phong cách lịch lãm, thời thượng. \n                    Các sản phẩm thời trang của Veneto luôn hướng tới sự trẻ trung và đẳng cấp; đặc biệt là sản phẩm suit, thời trang công sở.</p>\n                  </a>\n                </div>\n              </div>\n            </div>\n          </div>\n        </div>\n      </div>\n    </div>', '', 1469813932, 1, 'n', 0, '11', 'n', 'n', 'o', 0, 'n'),
(21, 1, 6, 'footer', 'webpage', '    <footer class="footer">\n    <div class="container">\n      <div class="row mt20">\n        <div class="col-xs-12 col-sm-6 col-md-3 about-menu">\n          <div class="footer-block">\n            <div class="ftb-title"><span>Về chúng tôi</span></div>\n            <ul>\n              <li><a href="">Giới thiệu</a></li>\n              <li><a href="">Lịch sử hình thành</a></li>\n              <li><a href="">Tin tức</a></li>\n              <li><a href="">Tuyển dụng</a></li>\n              <li><a href="">Liên hệ</a></li>\n            </ul>\n          </div>\n        </div>\n        <div class="col-xs-12 col-sm-6 col-md-3 cus-menu">\n          <div class="footer-block">\n            <div class="ftb-title"><span>Đồng phục</span></div>\n            <ul>\n              <li><a href="">Đồng phục công ty</a></li>\n              <li><a href="">Đồng phục PG</a></li>\n              <li><a href="">Đồng phục học sinh</a></li>\n              <li><a href="">Đồng phục lớp</a></li>\n              <li><a href="">Đồng phục bảo vệ</a></li>\n            </ul>\n          </div>\n        </div>\n        <div class="col-xs-12 col-sm-6 col-md-3 social-menu">\n          <div class="footer-block">\n            <div class="ftb-title"><span>Social</span></div>\n            <ul class="social">\n              <li><a href=""><img src="{site_url}images/uploads/fb.png"></a></li>\n              <li><a href=""><img src="{site_url}images/uploads/pin.png"></a></li>\n              <li><a href=""><img src="{site_url}images/uploads/youtube.png"></a></li>\n              <li><a href=""><img src="{site_url}images/uploads/insta.png"></a></li>\n            </ul>\n          </div>\n        </div>\n        <div class="col-xs-12 col-sm-6 col-md-3 fanpage">\n          <div class="footer-block">\n\n          </div>\n        </div>\n      </div>\n    </div>      \n    </footer>\n\n    <!-- jQuery (necessary for Bootstrap''s JavaScript plugins) -->\n    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>\n\n    <!-- Include all compiled plugins (below), or include individual files as needed -->\n    <script src="{path="bootstrap/bootstrap.m"}" type="text/javascript"></script>\n    <script type="text/javascript">\n      $(document).ready(function(){\n\n        $(".owl-carousel-slide").owlCarousel({\n          //dotsContainer: ''#customDots'',\n          loop:true,\n          margin:10,\n          responsiveClass:true,\n          responsive:{\n              0:{\n                  items:1,\n                  dots :false,\n                  nav:false\n              },\n              600:{\n                  items:1,\n                  dots :false,\n                  nav:false\n              },\n              1000:{\n                  items:1,\n                  dots :false,\n                  nav:false,\n                  autoplay:5000\n              }\n          }\n        });\n\n        owl = $(''.owl-carousel-slide'').owlCarousel();\n          $(".prev-bs").click(function () {\n              owl.trigger(''prev.owl.carousel'');\n          });\n\n          $(".next-bs").click(function () {\n              owl.trigger(''next.owl.carousel'');\n        });\n\n\n\n        $(".owl-carousel-testimonial").owlCarousel({\n          //dotsContainer: ''#customDots'',\n          loop:false,\n          margin:10,\n          responsiveClass:true,\n          responsive:{\n              0:{\n                  items:1,\n                  dots :false,\n                  nav:false\n              },\n              600:{\n                  items:1,\n                  dots :false,\n                  nav:false\n              },\n              1000:{\n                  items:3,\n                  dots :false,\n                  nav:false,\n                  loop:false,\n                  autoplay:false\n              }\n          }\n        });\n\n\n      });\n    </script>\n\n    <script src="{path="owlcarousel/owl.carousel"}" type="text/javascript"></script>\n    <script src="{path="clothes/global"}" type="text/javascript"></script>\n  </body>\n</html>', '', 1469813994, 1, 'n', 0, '11', 'n', 'n', 'o', 0, 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_groups`
--

CREATE TABLE `exp_template_groups` (
  `group_id` int(6) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `group_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `group_order` int(3) UNSIGNED NOT NULL,
  `is_site_default` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exp_template_groups`
--

INSERT INTO `exp_template_groups` (`group_id`, `site_id`, `group_name`, `group_order`, `is_site_default`) VALUES
(1, 1, 'clothes', 1, 'y'),
(2, 1, 'styles', 2, 'n'),
(3, 1, 'bootstrap', 3, 'n'),
(4, 1, 'font-awesome', 4, 'n'),
(5, 1, 'owlcarousel', 5, 'n'),
(6, 1, 'embeds', 6, 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_member_groups`
--

CREATE TABLE `exp_template_member_groups` (
  `group_id` smallint(4) UNSIGNED NOT NULL,
  `template_group_id` mediumint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_no_access`
--

CREATE TABLE `exp_template_no_access` (
  `template_id` int(6) UNSIGNED NOT NULL,
  `member_group` smallint(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_routes`
--

CREATE TABLE `exp_template_routes` (
  `route_id` int(10) UNSIGNED NOT NULL,
  `template_id` int(10) UNSIGNED NOT NULL,
  `order` int(10) UNSIGNED DEFAULT NULL,
  `route` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route_parsed` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route_required` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_throttle`
--

CREATE TABLE `exp_throttle` (
  `throttle_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `hits` int(10) UNSIGNED NOT NULL,
  `locked_out` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_update_log`
--

CREATE TABLE `exp_update_log` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `timestamp` int(10) UNSIGNED DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `method` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `line` int(10) UNSIGNED DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exp_update_log`
--

INSERT INTO `exp_update_log` (`log_id`, `timestamp`, `message`, `method`, `line`, `file`) VALUES
(1, 1469783779, 'Smartforge::add_key failed. Table ''exp_comments'' does not exist.', 'Smartforge::add_key', 120, 'C:\\xampp2\\htdocs\\ict\\ee\\start\\sr\\system\\ee\\EllisLab\\Addons\\comment\\upd.comment.php');

-- --------------------------------------------------------

--
-- Table structure for table `exp_upload_no_access`
--

CREATE TABLE `exp_upload_no_access` (
  `upload_id` int(6) UNSIGNED NOT NULL,
  `member_group` smallint(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exp_upload_no_access`
--

INSERT INTO `exp_upload_no_access` (`upload_id`, `member_group`) VALUES
(6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `exp_upload_prefs`
--

CREATE TABLE `exp_upload_prefs` (
  `id` int(4) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `server_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `allowed_types` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'img',
  `default_modal_view` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'list',
  `max_size` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_height` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_width` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `properties` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pre_format` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_format` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_properties` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_pre_format` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_post_format` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cat_group` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `batch_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `module_id` int(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exp_upload_prefs`
--

INSERT INTO `exp_upload_prefs` (`id`, `site_id`, `name`, `server_path`, `url`, `allowed_types`, `default_modal_view`, `max_size`, `max_height`, `max_width`, `properties`, `pre_format`, `post_format`, `file_properties`, `file_pre_format`, `file_post_format`, `cat_group`, `batch_location`, `module_id`) VALUES
(1, 1, 'Avatars', 'C:\\xampp2\\htdocs\\ict\\ee\\start\\sr\\images\\avatars\\', 'http://localhost/ict/ee/start/sr/images/avatars/', 'img', 'list', '50', '100', '100', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(2, 1, 'Default Avatars', 'C:\\xampp2\\htdocs\\ict\\ee\\start\\sr\\images\\avatars\\/default/', 'http://localhost/ict/ee/start/sr/images/avatars/default/', 'img', 'list', '50', '100', '100', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(3, 1, 'Member Photos', 'C:\\xampp2\\htdocs\\ict\\ee\\start\\sr\\images\\member_photos\\', 'http://localhost/ict/ee/start/sr/images/member_photos/', 'img', 'list', '50', '100', '100', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(4, 1, 'Signature Attachments', 'C:\\xampp2\\htdocs\\ict\\ee\\start\\sr\\images\\signature_attachments\\', 'http://localhost/ict/ee/start/sr/images/signature_attachments/', 'img', 'list', '30', '80', '480', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(5, 1, 'PM Attachments', 'C:\\xampp2\\htdocs\\ict\\ee\\start\\sr\\images\\pm_attachments\\', 'http://localhost/ict/ee/start/sr/images/pm_attachments/', 'img', 'list', '250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(6, 1, 'images', 'C:\\xampp2\\htdocs\\ict\\ee\\start\\sr\\images\\uploads/', 'http://localhost/ict/ee/start/sr/images/uploads/', 'img', 'list', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `exp_actions`
--
ALTER TABLE `exp_actions`
  ADD PRIMARY KEY (`action_id`);

--
-- Indexes for table `exp_captcha`
--
ALTER TABLE `exp_captcha`
  ADD PRIMARY KEY (`captcha_id`),
  ADD KEY `word` (`word`);

--
-- Indexes for table `exp_categories`
--
ALTER TABLE `exp_categories`
  ADD PRIMARY KEY (`cat_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `cat_name` (`cat_name`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_category_fields`
--
ALTER TABLE `exp_category_fields`
  ADD PRIMARY KEY (`field_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `exp_category_field_data`
--
ALTER TABLE `exp_category_field_data`
  ADD PRIMARY KEY (`cat_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `exp_category_groups`
--
ALTER TABLE `exp_category_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_category_posts`
--
ALTER TABLE `exp_category_posts`
  ADD PRIMARY KEY (`entry_id`,`cat_id`);

--
-- Indexes for table `exp_channels`
--
ALTER TABLE `exp_channels`
  ADD PRIMARY KEY (`channel_id`),
  ADD KEY `cat_group` (`cat_group`),
  ADD KEY `status_group` (`status_group`),
  ADD KEY `field_group` (`field_group`),
  ADD KEY `channel_name` (`channel_name`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_channel_data`
--
ALTER TABLE `exp_channel_data`
  ADD PRIMARY KEY (`entry_id`),
  ADD KEY `channel_id` (`channel_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_channel_entries_autosave`
--
ALTER TABLE `exp_channel_entries_autosave`
  ADD PRIMARY KEY (`entry_id`),
  ADD KEY `channel_id` (`channel_id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `url_title` (`url_title`),
  ADD KEY `status` (`status`),
  ADD KEY `entry_date` (`entry_date`),
  ADD KEY `expiration_date` (`expiration_date`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_channel_fields`
--
ALTER TABLE `exp_channel_fields`
  ADD PRIMARY KEY (`field_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `field_type` (`field_type`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_channel_form_settings`
--
ALTER TABLE `exp_channel_form_settings`
  ADD PRIMARY KEY (`channel_form_settings_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Indexes for table `exp_channel_member_groups`
--
ALTER TABLE `exp_channel_member_groups`
  ADD PRIMARY KEY (`group_id`,`channel_id`);

--
-- Indexes for table `exp_channel_titles`
--
ALTER TABLE `exp_channel_titles`
  ADD PRIMARY KEY (`entry_id`),
  ADD KEY `channel_id` (`channel_id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `url_title` (`url_title`),
  ADD KEY `status` (`status`),
  ADD KEY `entry_date` (`entry_date`),
  ADD KEY `expiration_date` (`expiration_date`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_comments`
--
ALTER TABLE `exp_comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `entry_id` (`entry_id`),
  ADD KEY `channel_id` (`channel_id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `status` (`status`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_comment_subscriptions`
--
ALTER TABLE `exp_comment_subscriptions`
  ADD PRIMARY KEY (`subscription_id`),
  ADD KEY `entry_id` (`entry_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `exp_content_types`
--
ALTER TABLE `exp_content_types`
  ADD PRIMARY KEY (`content_type_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `exp_cp_log`
--
ALTER TABLE `exp_cp_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_developer_log`
--
ALTER TABLE `exp_developer_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `exp_email_cache`
--
ALTER TABLE `exp_email_cache`
  ADD PRIMARY KEY (`cache_id`);

--
-- Indexes for table `exp_email_cache_mg`
--
ALTER TABLE `exp_email_cache_mg`
  ADD PRIMARY KEY (`cache_id`,`group_id`);

--
-- Indexes for table `exp_email_cache_ml`
--
ALTER TABLE `exp_email_cache_ml`
  ADD PRIMARY KEY (`cache_id`,`list_id`);

--
-- Indexes for table `exp_email_console_cache`
--
ALTER TABLE `exp_email_console_cache`
  ADD PRIMARY KEY (`cache_id`);

--
-- Indexes for table `exp_entry_versioning`
--
ALTER TABLE `exp_entry_versioning`
  ADD PRIMARY KEY (`version_id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_extensions`
--
ALTER TABLE `exp_extensions`
  ADD PRIMARY KEY (`extension_id`);

--
-- Indexes for table `exp_fieldtypes`
--
ALTER TABLE `exp_fieldtypes`
  ADD PRIMARY KEY (`fieldtype_id`);

--
-- Indexes for table `exp_field_groups`
--
ALTER TABLE `exp_field_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_files`
--
ALTER TABLE `exp_files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `upload_location_id` (`upload_location_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_file_categories`
--
ALTER TABLE `exp_file_categories`
  ADD KEY `file_id` (`file_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `exp_file_dimensions`
--
ALTER TABLE `exp_file_dimensions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `upload_location_id` (`upload_location_id`);

--
-- Indexes for table `exp_file_watermarks`
--
ALTER TABLE `exp_file_watermarks`
  ADD PRIMARY KEY (`wm_id`);

--
-- Indexes for table `exp_global_variables`
--
ALTER TABLE `exp_global_variables`
  ADD PRIMARY KEY (`variable_id`),
  ADD KEY `variable_name` (`variable_name`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_grid_columns`
--
ALTER TABLE `exp_grid_columns`
  ADD PRIMARY KEY (`col_id`),
  ADD KEY `field_id` (`field_id`);

--
-- Indexes for table `exp_html_buttons`
--
ALTER TABLE `exp_html_buttons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_layout_publish`
--
ALTER TABLE `exp_layout_publish`
  ADD PRIMARY KEY (`layout_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Indexes for table `exp_layout_publish_member_groups`
--
ALTER TABLE `exp_layout_publish_member_groups`
  ADD PRIMARY KEY (`layout_id`,`group_id`);

--
-- Indexes for table `exp_members`
--
ALTER TABLE `exp_members`
  ADD PRIMARY KEY (`member_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `unique_id` (`unique_id`),
  ADD KEY `password` (`password`);

--
-- Indexes for table `exp_member_bulletin_board`
--
ALTER TABLE `exp_member_bulletin_board`
  ADD PRIMARY KEY (`bulletin_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `hash` (`hash`);

--
-- Indexes for table `exp_member_data`
--
ALTER TABLE `exp_member_data`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `exp_member_fields`
--
ALTER TABLE `exp_member_fields`
  ADD PRIMARY KEY (`m_field_id`);

--
-- Indexes for table `exp_member_groups`
--
ALTER TABLE `exp_member_groups`
  ADD PRIMARY KEY (`group_id`,`site_id`);

--
-- Indexes for table `exp_member_homepage`
--
ALTER TABLE `exp_member_homepage`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `exp_member_search`
--
ALTER TABLE `exp_member_search`
  ADD PRIMARY KEY (`search_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_message_attachments`
--
ALTER TABLE `exp_message_attachments`
  ADD PRIMARY KEY (`attachment_id`);

--
-- Indexes for table `exp_message_copies`
--
ALTER TABLE `exp_message_copies`
  ADD PRIMARY KEY (`copy_id`),
  ADD KEY `message_id` (`message_id`),
  ADD KEY `recipient_id` (`recipient_id`),
  ADD KEY `sender_id` (`sender_id`);

--
-- Indexes for table `exp_message_data`
--
ALTER TABLE `exp_message_data`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `sender_id` (`sender_id`);

--
-- Indexes for table `exp_message_folders`
--
ALTER TABLE `exp_message_folders`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `exp_message_listed`
--
ALTER TABLE `exp_message_listed`
  ADD PRIMARY KEY (`listed_id`);

--
-- Indexes for table `exp_modules`
--
ALTER TABLE `exp_modules`
  ADD PRIMARY KEY (`module_id`);

--
-- Indexes for table `exp_module_member_groups`
--
ALTER TABLE `exp_module_member_groups`
  ADD PRIMARY KEY (`group_id`,`module_id`);

--
-- Indexes for table `exp_online_users`
--
ALTER TABLE `exp_online_users`
  ADD PRIMARY KEY (`online_id`),
  ADD KEY `date` (`date`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_password_lockout`
--
ALTER TABLE `exp_password_lockout`
  ADD PRIMARY KEY (`lockout_id`),
  ADD KEY `login_date` (`login_date`),
  ADD KEY `ip_address` (`ip_address`),
  ADD KEY `user_agent` (`user_agent`);

--
-- Indexes for table `exp_plugins`
--
ALTER TABLE `exp_plugins`
  ADD PRIMARY KEY (`plugin_id`);

--
-- Indexes for table `exp_relationships`
--
ALTER TABLE `exp_relationships`
  ADD PRIMARY KEY (`relationship_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `child_id` (`child_id`),
  ADD KEY `field_id` (`field_id`),
  ADD KEY `grid_row_id` (`grid_row_id`);

--
-- Indexes for table `exp_remember_me`
--
ALTER TABLE `exp_remember_me`
  ADD PRIMARY KEY (`remember_me_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `exp_reset_password`
--
ALTER TABLE `exp_reset_password`
  ADD PRIMARY KEY (`reset_id`);

--
-- Indexes for table `exp_revision_tracker`
--
ALTER TABLE `exp_revision_tracker`
  ADD PRIMARY KEY (`tracker_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `exp_rte_tools`
--
ALTER TABLE `exp_rte_tools`
  ADD PRIMARY KEY (`tool_id`),
  ADD KEY `enabled` (`enabled`);

--
-- Indexes for table `exp_rte_toolsets`
--
ALTER TABLE `exp_rte_toolsets`
  ADD PRIMARY KEY (`toolset_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `enabled` (`enabled`);

--
-- Indexes for table `exp_search`
--
ALTER TABLE `exp_search`
  ADD PRIMARY KEY (`search_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_search_log`
--
ALTER TABLE `exp_search_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_security_hashes`
--
ALTER TABLE `exp_security_hashes`
  ADD PRIMARY KEY (`hash_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `exp_sessions`
--
ALTER TABLE `exp_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `exp_sites`
--
ALTER TABLE `exp_sites`
  ADD PRIMARY KEY (`site_id`),
  ADD KEY `site_name` (`site_name`);

--
-- Indexes for table `exp_snippets`
--
ALTER TABLE `exp_snippets`
  ADD PRIMARY KEY (`snippet_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_specialty_templates`
--
ALTER TABLE `exp_specialty_templates`
  ADD PRIMARY KEY (`template_id`),
  ADD KEY `template_name` (`template_name`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_stats`
--
ALTER TABLE `exp_stats`
  ADD PRIMARY KEY (`stat_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_statuses`
--
ALTER TABLE `exp_statuses`
  ADD PRIMARY KEY (`status_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_status_groups`
--
ALTER TABLE `exp_status_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_status_no_access`
--
ALTER TABLE `exp_status_no_access`
  ADD PRIMARY KEY (`status_id`,`member_group`);

--
-- Indexes for table `exp_templates`
--
ALTER TABLE `exp_templates`
  ADD PRIMARY KEY (`template_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `template_name` (`template_name`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_template_groups`
--
ALTER TABLE `exp_template_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `group_name_idx` (`group_name`),
  ADD KEY `group_order_idx` (`group_order`);

--
-- Indexes for table `exp_template_member_groups`
--
ALTER TABLE `exp_template_member_groups`
  ADD PRIMARY KEY (`group_id`,`template_group_id`);

--
-- Indexes for table `exp_template_no_access`
--
ALTER TABLE `exp_template_no_access`
  ADD PRIMARY KEY (`template_id`,`member_group`);

--
-- Indexes for table `exp_template_routes`
--
ALTER TABLE `exp_template_routes`
  ADD PRIMARY KEY (`route_id`),
  ADD KEY `template_id` (`template_id`);

--
-- Indexes for table `exp_throttle`
--
ALTER TABLE `exp_throttle`
  ADD PRIMARY KEY (`throttle_id`),
  ADD KEY `ip_address` (`ip_address`),
  ADD KEY `last_activity` (`last_activity`);

--
-- Indexes for table `exp_update_log`
--
ALTER TABLE `exp_update_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `exp_upload_no_access`
--
ALTER TABLE `exp_upload_no_access`
  ADD PRIMARY KEY (`upload_id`,`member_group`);

--
-- Indexes for table `exp_upload_prefs`
--
ALTER TABLE `exp_upload_prefs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `exp_actions`
--
ALTER TABLE `exp_actions`
  MODIFY `action_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `exp_captcha`
--
ALTER TABLE `exp_captcha`
  MODIFY `captcha_id` bigint(13) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_categories`
--
ALTER TABLE `exp_categories`
  MODIFY `cat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_category_fields`
--
ALTER TABLE `exp_category_fields`
  MODIFY `field_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_category_groups`
--
ALTER TABLE `exp_category_groups`
  MODIFY `group_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_channels`
--
ALTER TABLE `exp_channels`
  MODIFY `channel_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_channel_entries_autosave`
--
ALTER TABLE `exp_channel_entries_autosave`
  MODIFY `entry_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_channel_fields`
--
ALTER TABLE `exp_channel_fields`
  MODIFY `field_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_channel_form_settings`
--
ALTER TABLE `exp_channel_form_settings`
  MODIFY `channel_form_settings_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_channel_titles`
--
ALTER TABLE `exp_channel_titles`
  MODIFY `entry_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_comments`
--
ALTER TABLE `exp_comments`
  MODIFY `comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_comment_subscriptions`
--
ALTER TABLE `exp_comment_subscriptions`
  MODIFY `subscription_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_content_types`
--
ALTER TABLE `exp_content_types`
  MODIFY `content_type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `exp_cp_log`
--
ALTER TABLE `exp_cp_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `exp_developer_log`
--
ALTER TABLE `exp_developer_log`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_email_cache`
--
ALTER TABLE `exp_email_cache`
  MODIFY `cache_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_email_console_cache`
--
ALTER TABLE `exp_email_console_cache`
  MODIFY `cache_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_entry_versioning`
--
ALTER TABLE `exp_entry_versioning`
  MODIFY `version_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_extensions`
--
ALTER TABLE `exp_extensions`
  MODIFY `extension_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `exp_fieldtypes`
--
ALTER TABLE `exp_fieldtypes`
  MODIFY `fieldtype_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `exp_field_groups`
--
ALTER TABLE `exp_field_groups`
  MODIFY `group_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_files`
--
ALTER TABLE `exp_files`
  MODIFY `file_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `exp_file_dimensions`
--
ALTER TABLE `exp_file_dimensions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_file_watermarks`
--
ALTER TABLE `exp_file_watermarks`
  MODIFY `wm_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_global_variables`
--
ALTER TABLE `exp_global_variables`
  MODIFY `variable_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_grid_columns`
--
ALTER TABLE `exp_grid_columns`
  MODIFY `col_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_html_buttons`
--
ALTER TABLE `exp_html_buttons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `exp_layout_publish`
--
ALTER TABLE `exp_layout_publish`
  MODIFY `layout_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_members`
--
ALTER TABLE `exp_members`
  MODIFY `member_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `exp_member_bulletin_board`
--
ALTER TABLE `exp_member_bulletin_board`
  MODIFY `bulletin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_member_fields`
--
ALTER TABLE `exp_member_fields`
  MODIFY `m_field_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_message_attachments`
--
ALTER TABLE `exp_message_attachments`
  MODIFY `attachment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_message_copies`
--
ALTER TABLE `exp_message_copies`
  MODIFY `copy_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_message_data`
--
ALTER TABLE `exp_message_data`
  MODIFY `message_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_message_listed`
--
ALTER TABLE `exp_message_listed`
  MODIFY `listed_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_modules`
--
ALTER TABLE `exp_modules`
  MODIFY `module_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `exp_online_users`
--
ALTER TABLE `exp_online_users`
  MODIFY `online_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `exp_password_lockout`
--
ALTER TABLE `exp_password_lockout`
  MODIFY `lockout_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `exp_plugins`
--
ALTER TABLE `exp_plugins`
  MODIFY `plugin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_relationships`
--
ALTER TABLE `exp_relationships`
  MODIFY `relationship_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_reset_password`
--
ALTER TABLE `exp_reset_password`
  MODIFY `reset_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_revision_tracker`
--
ALTER TABLE `exp_revision_tracker`
  MODIFY `tracker_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_rte_tools`
--
ALTER TABLE `exp_rte_tools`
  MODIFY `tool_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `exp_rte_toolsets`
--
ALTER TABLE `exp_rte_toolsets`
  MODIFY `toolset_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `exp_search_log`
--
ALTER TABLE `exp_search_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_security_hashes`
--
ALTER TABLE `exp_security_hashes`
  MODIFY `hash_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `exp_sites`
--
ALTER TABLE `exp_sites`
  MODIFY `site_id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `exp_snippets`
--
ALTER TABLE `exp_snippets`
  MODIFY `snippet_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_specialty_templates`
--
ALTER TABLE `exp_specialty_templates`
  MODIFY `template_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `exp_stats`
--
ALTER TABLE `exp_stats`
  MODIFY `stat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `exp_statuses`
--
ALTER TABLE `exp_statuses`
  MODIFY `status_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `exp_status_groups`
--
ALTER TABLE `exp_status_groups`
  MODIFY `group_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `exp_templates`
--
ALTER TABLE `exp_templates`
  MODIFY `template_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `exp_template_groups`
--
ALTER TABLE `exp_template_groups`
  MODIFY `group_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `exp_template_routes`
--
ALTER TABLE `exp_template_routes`
  MODIFY `route_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_throttle`
--
ALTER TABLE `exp_throttle`
  MODIFY `throttle_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exp_update_log`
--
ALTER TABLE `exp_update_log`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `exp_upload_prefs`
--
ALTER TABLE `exp_upload_prefs`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
