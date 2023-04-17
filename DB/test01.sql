-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2023 at 03:46 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test01`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_token`
--

CREATE TABLE `access_token` (
  `id` bigint(20) NOT NULL,
  `user_agent` int(11) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `api_client` bigint(20) DEFAULT NULL,
  `user` bigint(20) DEFAULT NULL,
  `revoked` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `access_token`
--

INSERT INTO `access_token` (`id`, `user_agent`, `token`, `api_client`, `user`, `revoked`, `created_at`, `expires_at`, `updated_at`) VALUES
(3, 1, '9aac4e6d32eb6310bcaa82b62299e8666cba33e6534cf60a12465851e1078c89f6d2d0fd8dffd7151155f4fb636378625ead1c6bd8ad38c44f316fc3ab5f72af', 1, 1, 0, '2023-03-08 14:45:42', '2024-03-08 14:03:42', '2023-03-08 14:45:42'),
(4, 2, '3decc7ee1e27c435c9b051a4ccfda0f5c28e2084a7674204f84ef9f3d3bbc651ae91a71b67d8f4a803d250b1465074fb7abf07f5cf956f788ed7394c3789037d', 1, 1, 0, '2023-03-22 07:36:29', '2024-03-22 07:03:29', '2023-03-22 07:36:29'),
(5, 2, '2fe529ec52788f4646534f75fecc5bc66e9fa135343d1f6fdab2fc6f292aae0cadaf7f3315f5fa8b6b3b2a253399729be4350a5fb286f661b6cafbff002a4540', 1, 29, 0, '2023-03-22 09:36:13', '2024-03-22 09:03:13', '2023-03-22 09:36:13'),
(6, 2, 'ebea778ab2192429b84cdaf51a06a09a97b6741f591c68af61d575a5a1cc42b90e4629e5d6758262f38b68aefaf67f342bced543bd8ebba82376debf579aa5c2', 1, 29, 1, '2023-03-23 04:36:05', '2024-03-23 04:03:05', '2023-03-23 07:10:40'),
(7, 2, '7b9346c2b071d97791b6de5248379ec1458447fa2c32e80e0de5e40e41db8f68a86dd2330a4dc348ac550c7cf1c89f3a8fcf69fe5e94fcaa3cbb5e2590fd3eaf', 1, 29, 1, '2023-03-23 07:11:51', '2024-03-23 07:03:51', '2023-03-23 07:12:26'),
(8, 2, '486d2145df9b65fd4e0e3e0a2916295362731a33662201bbfaf686e6ad920d58c7a735e124244526445a73367cc060b2358657f43c8617e813fbc8f57d075c62', 1, 29, 0, '2023-03-23 07:46:59', '2024-03-23 07:03:59', '2023-03-23 07:46:59'),
(9, 2, '9f5eaf2683d01f8da236a9153a20bc93ca4503fae462fb1a3f02862d0c68f5dc0e6ebb2b4a141fde5fb287c1efc9739381e9a4eb4d177b1d26e4eb0296e52462', 1, 29, 0, '2023-03-24 02:42:07', '2024-03-24 02:03:07', '2023-03-24 02:42:07');

-- --------------------------------------------------------

--
-- Table structure for table `api_client`
--

CREATE TABLE `api_client` (
  `id` bigint(20) NOT NULL,
  `api_name` varchar(100) NOT NULL,
  `api_token` varchar(100) NOT NULL,
  `by_pass` tinyint(1) DEFAULT 0,
  `status` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_user` bigint(20) DEFAULT NULL,
  `created_user` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `api_client`
--

INSERT INTO `api_client` (`id`, `api_name`, `api_token`, `by_pass`, `status`, `created_at`, `updated_at`, `updated_user`, `created_user`) VALUES
(1, 'default', '4480b668766262a3eb1a51945ef5cb0e7faba9032eaecebce1d8227e3403ed564b7bea6ba620b34a47492c81cb5cf252bb32', 1, 1, '2020-04-28 22:07:45', '2020-04-28 22:07:45', 1, 1),
(2, 'edr', 'aa39d37846ae6e7222081ef415cd6fce30f4f378c46d7eb1bb9c2dd359b1a639c639f2eb1492d02a4965531f62b57d350f77', 1, 1, '2020-05-27 15:38:14', '2020-05-28 10:29:29', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `api_client_ip`
--

CREATE TABLE `api_client_ip` (
  `id` bigint(20) NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `ip_address` char(45) DEFAULT '1',
  `api_client` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `directory_id` int(11) DEFAULT NULL,
  `comment_directory` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `directory_id`, `comment_directory`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
(1, 1, 'โหดไปป่าวไอน้อง', 14, '2023-03-24 06:26:55', 1, '2023-03-16 00:37:43'),
(2, NULL, '123450987654321678', 14, '2023-03-24 06:26:55', 1, '2023-03-14 09:12:28'),
(3, 3, 'ปวดหัวเลย', 14, '2023-03-24 06:26:55', 3, '2023-03-16 00:56:59'),
(4, 4, 'เกินไปปุย', 14, '2023-03-24 06:26:55', 4, '2023-03-09 00:58:18'),
(5, 5, 'เศร้า้เลย', 14, '2023-03-24 06:26:55', 5, '2023-03-15 00:59:46'),
(6, 6, 'สวยเกินไปเอาะ', 14, '2023-03-24 06:26:55', 6, '2023-03-17 01:12:22'),
(7, 7, 'เกินปุยย', 14, '2023-03-24 06:26:55', 7, '2023-03-18 01:14:24'),
(8, 8, 'งั้นๆอะ', 14, '2023-03-24 06:26:55', 8, '2023-03-28 01:15:39'),
(9, 9, 'หน้ามันส์หมดแล้ว', 14, '2023-03-24 06:26:55', 9, '2023-03-26 01:16:36'),
(12, 2, '123450987654321678', 14, '2023-03-24 06:26:55', 1, '2023-03-14 09:12:28'),
(13, 2, '123450987654321678', 14, '2023-03-24 06:26:55', 1, '2023-03-14 09:12:28'),
(14, 2, '123450987654321678', 14, '2023-03-24 06:26:55', 1, '2023-03-14 09:12:28'),
(15, 2, '123450987654321678', 14, '2023-03-24 06:26:55', 1, '2023-03-14 09:12:28'),
(16, 2, '123450987654321678', 14, '2023-03-24 06:26:55', 1, '2023-03-14 09:12:28'),
(17, 2, '123450987654321678', 14, '2023-03-24 06:26:55', 1, '2023-03-14 09:12:28'),
(18, 2, '123450987654321678', 14, '2023-03-24 06:26:55', 1, '2023-03-14 09:12:28');

-- --------------------------------------------------------

--
-- Table structure for table `directory`
--

CREATE TABLE `directory` (
  `id` int(11) NOT NULL,
  `yearbook_id` int(11) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `nickname` varchar(10) DEFAULT NULL,
  `motto` varchar(255) DEFAULT NULL,
  `img` text DEFAULT NULL,
  `admission` date DEFAULT NULL,
  `graduation` date DEFAULT NULL,
  `phone` int(10) DEFAULT NULL,
  `facebook` varchar(50) DEFAULT NULL,
  `instagram` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('confirm','onhold') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directory`
--

INSERT INTO `directory` (`id`, `yearbook_id`, `birth`, `nickname`, `motto`, `img`, `admission`, `graduation`, `phone`, `facebook`, `instagram`, `created_by`, `created_date`, `updated_by`, `updated_date`, `status`) VALUES
(1, 1, '2002-03-13', 'มีนา', 'อยากเก่งจริงอะ รามะ', 'http://njbhvgcdxszaqwertyuioplkj/', '2016-01-21', '2019-05-25', 807112211, 'มีนา รีเซล@facebook.com', 'resel_rena@instagram', 12, '2016-06-16 23:15:52', 2, '2023-03-24 06:41:16', 'onhold'),
(2, 1, '2003-11-10', 'ninja', 'อยากซ่าแต่ไม่กล้าอะดิ', 'http://juikopnhytgfredxsazvbn/', '2016-01-21', '2019-05-25', 80792456, 'ninjapongsatorn@facebook.com', 'ninja_fahzai@instagram.com', 1, '2016-03-15 23:25:03', 1, '2023-03-24 02:05:58', 'confirm'),
(3, 1, '2003-05-03', 'เมษา', 'เมษายนนี้ เป็นเดือนดี เหมือนตัวตน', 'https://jikmnhbgfvcdxszaqwertyyujjmmkiioolppmjhg/', '2016-07-20', '2016-07-16', 986157142, 'เมไหนเมษา@facebook.com', 'เมษา_Meymei@instagram.com', 14, '2016-07-22 23:41:36', 4, '2023-03-24 06:41:19', 'onhold'),
(4, 2, '2004-08-17', 'ริน', 'รินจัง สะระนังคัสฉามิ', 'http://grogkvmkfdlsockxmkfjmepeofkewsa/', '2016-05-13', '2019-05-31', 693518473, 'rinchan_puri@facebook.com', 'rinney_Onley@instagram.com', 15, '2019-06-03 23:47:18', 5, '2023-03-24 06:41:13', 'confirm'),
(5, 2, '2004-01-04', 'มาร์ค', 'มาร์คกี้ มอลตี้มีตอล', 'http://njikolpuhybvgcftredxszawqertygg/', '2013-08-24', '2016-08-23', 871423456, 'มาร์คสักเบิกจริงๆนะ@facebook.com', 'มาร์คกี้_alsosunkabrak@instagram.com', 16, '2016-08-31 23:55:25', 6, '2023-03-24 06:41:22', 'onhold'),
(6, 3, '2004-11-13', 'มายา', 'มายาก็เหมือน มายากล แต่ถ้ามาทีละคน ไม่ต้องซนพี่เลี้ยงเอง', 'http://nhujbvgtfcdrexzswqaoplijnhubygvctf/', '2015-03-05', '2018-03-08', 855866815, 'มายาอร่อย@facebook.com', 'Maya_uWu@instagram.com', 17, '2018-03-31 00:06:04', 7, '2023-03-24 06:41:25', 'onhold'),
(7, 3, '2003-09-30', 'สิง', 'สิงสาราสัตว์ แรมารามะ', 'http://ioljuhyntbgvrfcdewsxzaqplm/', '2013-12-06', '2016-12-10', 614870104, 'zingha@facebook.com', 'ZingHa_gg@instagram.com', 18, '2016-12-14 00:14:24', 8, '2023-03-24 06:41:27', 'onhold'),
(8, 3, '2003-10-20', 'ตัน', 'บนโลกมีคนเป็นตัน เหมือนเปี๊ยบเลย', 'http://bvgtyikmhgcfxdzsawertyuuihbmmjg/', '2013-01-01', '2016-01-04', 841473026, 'tonton_pochite@facebook.com', 'Ton_ran@instagram.com', 19, '2016-01-31 00:20:57', 9, '2023-03-24 06:41:30', 'onhold'),
(9, 5, '2004-04-10', 'แอนนา', 'โลกใบใหม่ สดใสกว่าเดิม', 'http://nijiroturanopomegohoobole/', '2013-02-28', '2016-03-03', 915814877, 'Anna@facebook.com', 'Anna_Tenna@instagram.com', 14, '2016-03-04 00:31:02', 10, '2023-03-24 06:41:34', 'onhold');

-- --------------------------------------------------------

--
-- Table structure for table `major`
--

CREATE TABLE `major` (
  `id` int(11) NOT NULL,
  `major_code` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `crud_table` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `name`, `description`, `crud_table`, `status`) VALUES
(1, 'role_list', 'กลุ่มผู้ใช้งาน(รายการ)', 'role', 1),
(2, 'role_add', 'กลุ่มผู้ใช้งาน(เพิ่ม)', 'role', 1),
(3, 'role_view', 'กลุ่มผู้ใช้งาน(ดู)', 'role', 1),
(4, 'role_edit', 'กลุ่มผู้ใช้งาน(แก้ไข)', 'role', 1),
(5, 'role_delete', 'กลุ่มผู้ใช้งาน(ลบ)', 'role', 1),
(6, 'permission_list', 'สิทธิ์การใช้งาน(รายการ)', 'permission', 1),
(7, 'permission_add', 'สิทธิ์การใช้งาน(เพิ่ม)', 'permission', 1),
(8, 'permission_view', 'สิทธิ์การใช้งาน(ดู)', 'permission', 1),
(9, 'permission_edit', 'สิทธิ์การใช้งาน(แก้ไข)', 'permission', 1),
(10, 'permission_delete', 'สิทธิ์การใช้งาน(ลบ)', 'permission', 1),
(11, 'api_client_list', 'Api client(รายการ)', 'api_client', 1),
(12, 'api_client_add', 'Api client(เพิ่ม)', 'api_client', 1),
(13, 'api_client_view', 'Api client(ดู)', 'api_client', 1),
(14, 'api_client_edit', 'Api client(แก้ไข)', 'api_client', 1),
(15, 'api_client_delete', 'Api client(ลบ)', 'api_client', 1),
(16, 'api_client_ip_list', 'Api client ip(รายการ)', 'api_client_ip', 1),
(17, 'api_client_ip_add', 'Api client ip(เพิ่ม)', 'api_client_ip', 1),
(18, 'api_client_ip_view', 'Api client ip(ดู)', 'api_client_ip', 1),
(19, 'api_client_ip_edit', 'Api client ip(แก้ไข)', 'api_client_ip', 1),
(20, 'api_client_ip_delete', 'Api client ip(ลบ)', 'api_client_ip', 1),
(21, 'access_token_list', 'Token(รายการ)', 'access_token', 1),
(22, 'access_token_add', 'Token(เพิ่ม)', 'access_token', 1),
(23, 'access_token_view', 'Token(ดู)', 'access_token', 1),
(24, 'access_token_edit', 'Token(แก้ไข)', 'access_token', 1),
(25, 'access_token_delete', 'Token(ลบ)', 'access_token', 1),
(26, 'user_list', 'ผู้ใช้ระบบ(รายการ)', 'user', 1),
(27, 'user_add', 'ผู้ใช้ระบบ(เพิ่ม)', 'user', 1),
(28, 'user_view', 'ผู้ใช้ระบบ(ดู)', 'user', 1),
(29, 'user_edit', 'ผู้ใช้ระบบ(แก้ไข)', 'user', 1),
(30, 'user_delete', 'ผู้ใช้ระบบ(ลบ)', 'user', 1);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `description`, `status`) VALUES
(1, 'Dev', 'Dev role', 1),
(2, 'Administrator', 'Admin role', 1),
(3, 'User', 'User role', 1),
(4, 'Implement', 'Implementer role', 1),
(5, 'Support', 'Support role', 1),
(7, 'Service', 'Service role', 1),
(10, 'Trainee', 'นักศึกษาฝึกงาน', 1);

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `permission` bigint(20) NOT NULL,
  `role` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` (`permission`, `role`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `stucode` varchar(11) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_user` bigint(20) DEFAULT NULL,
  `updated_user` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `stucode`, `username`, `email`, `image`, `password`, `salt`, `status`, `created_at`, `updated_at`, `created_user`, `updated_user`) VALUES
(1, NULL, 'admin', 'admin@bekaku.com', NULL, '9354272ca64cccc93cbd2b226266c107b39aaed43e885da90a088527f8a562460fe1941e11c3b30fb69126c487b0f4acd8fbd458889d90c27188753e6d4faa05', '717c428dcdd5aad37fb8be8d830bb4b3abdf54f3186cf026de72c5cf7b069909d1bdcac9fadfc8042b5c6b47267fa9e0e917c315b81cd0d21e78601b9d0d8d2b', 1, '2020-04-27 11:23:19', '2020-06-01 09:18:46', NULL, 1),
(14, NULL, 'admin12345', '1@1.com', NULL, '8402f24830833a9f169778b332bddedee9d7111491a0a296a978812774e921c30fb794907eb1c61c4e3b3e584f2d105fc8eee239853852bac32922eaa8282f20', '79c0e6c8c33e794fbc358f00382662a5a5136cf47d4930de27b26e34e6daf441c32fe351de86fc81e143e95d97d50680f3a4adba9330ee212e2cb22eba368df2', NULL, '2023-03-22 07:26:23', '2023-03-23 04:43:22', 0, 29),
(15, NULL, 'admin04', 'admin4@admin.com', NULL, 'b59c66a0256b25528cfa9ea25bbeaba4916760a1fa8f8731a6cc9d53b5f6ca81faa47bedb93535c2d62327c4582582cdd24d3cd8105ef2085b04bb7abc88c103', '83de7dff6d045be72a7a279897497f8345ce8e9e1f2e75176babc77744cf377163e1db6362824d4dd6c4f9afa0144bcf4838327d4dd49cb169edd3a453117df4', 0, '2023-03-22 08:06:01', '2023-03-22 08:06:01', 0, 0),
(16, NULL, 'admin05', 'admin5@admin.com', NULL, '0c10f6bf66bd86d69ba1f04db59479e812b0396fbdbe6a431be7a326d5eddeb8075b4a8fb6a7c20af82c425d5217e4227838b7fdc1703f4971b553009de599b4', '2fddd85a00a9b6de7dace8a141b53a5afef7c6418cff7eab2ce943b626c1c8273c7d4144feb42e961dd71de12e251a6691b05b498f3f23287fb3a1a796d5db47', 0, '2023-03-22 08:12:56', '2023-03-22 08:12:56', 0, 0),
(17, '', 'admin06', 'admin6@admin.com', NULL, 'f1e7d692b0aae98533ecbaf30970cbf14b5b5a1403db6f74cce853e1f3ca1719b8799377bc475d41f82a196df493a5055e97622b6a7da1e36d104c6eb1a87c42', 'bd2e59313b129c470e355ae2e2e26b5f7cab287a826a39f1918481da693b5ce21fdface5775ac58df17bbce3b56090d42cfbfbc0fddbcdcb5580452bd4324eb7', 0, '2023-03-22 08:23:27', '2023-03-22 08:23:27', 0, 0),
(18, '2147483647', 'admin07', 'admin7@admin.com', NULL, 'd23d025a8bc83136a1b71f40d84ce0ff4d23f675d44e5ecf2afa69d54626d6feeb50f27b4445e285287a7b8cdb3c803233c2029986c9c1ddc0ccecf398839fe7', '8c3852be0b2aa396f65e82beb39c91525df3ee3969673cd9f09e83d99ce757c3044bb5b12719adf9970c745ab07230fd207bb6eb49e0d07cf91b64041cc13697', 0, '2023-03-22 09:09:31', '2023-03-22 09:09:31', 0, 0),
(24, '10008', 'admin08', 'admin8@admin.com', NULL, '75a01f138722ad36a5f5720aec44605f9f7b865835d6e6d02fd26249183b081f68f56f9c60728194ec285fb078c18d68f2ace60e2f71bb920240b0c15c709778', 'b68019ed7665e5ac26d6ec36187ae765b3085584890cb0faf2d349927d03127eb60aee3ce01ffbb4faaee84809348b639543b613abc83ff7c8e6874b8402d577', 0, '2023-03-22 09:17:17', '2023-03-22 09:17:17', 0, 0),
(25, '65309', 'admin01', 'admin11@admin.com', NULL, 'f2ff89202137fcae67200b6b47fb821b6f2ac66e899f576f16f27476e1a30a0d06373bdd282e21111056bbe1431f7bd89cb89c78e06fcf9e05439ff5f3f55142', 'b4b11edd7924e2e2cd43b0797ddb7ec8fbd0ac6b13090ffc2dfa3afe7cb06a5664c7bcd1367ee96060947dc1ea387678ab119259f1cf3618af556da43e551848', 0, '2023-03-22 09:18:13', '2023-03-22 09:18:13', 0, 0),
(26, '65309010', 'admin111', 'admin111@admin.com', NULL, 'd371839e3834dbd624a99c1f1fc9b6a5ee6d7f9c451714dc042a17693ac8861fbd7e269fc4fbfe344a3675ba73a505f126aec6bfea4f3caeef523d73d30ec61b', 'ee89069b14de5830483d10b49fb876b564f63aaeb8820059835cf27e74c85de55de807e1e785f8416b9cc9dc5a32d8bd44e65e01cc7effff03b3d2a0c149ce86', 0, '2023-03-22 09:18:44', '2023-03-22 09:18:44', 0, 0),
(29, '65309010004', 'Ratchanon Ho', 'rat@admin.com', NULL, '844b51c3dc277ae06a7e24a685488c1d9848db3c83d2a0a4554b17271bb056f1a1476dd4f0b4f89a62d5adc09285fbefc864b6c1d20ae700c26c6507a4f70112', '74cf8a0afc5f7a2142aac11da2541530648c63d9105d86a54d930a0600237c0f671ba350706187437031c2b76cba5ff3eb530bbc9210b45fba9222ed17703c23', 1, '2023-03-22 09:30:09', '2023-03-22 09:30:09', 0, 0),
(30, '6530901004', 'Ratchanon oH', 'ra@admin.com', NULL, '72ddc2eed5e2a7bbb4f69fbb43d74b274449fe054940af208138de8e7c9041a0761a6de1b5b2e43c60e6fb75ebc0bfa3a7fa20c4cd53f2dd82a4b8d04894fef3', 'c2479c7440e7ad4d1a9d332c5a82cdbb799018c0786687440339ce55f9859167ade9a134d5335b49990275d12ffa11fa015fb502bec6d087d42a009c73f13965', 0, '2023-03-22 09:39:33', '2023-03-22 09:39:33', 0, 0),
(31, '653090004', 'Ratchanon', 'r@admin.com', NULL, '2b5b0caf03b423190a42516654b4b0b66e283557ae3f982dbbdbabec1fcac8abd083ca910290b777fca1db059fe1b22852ecebda9ac75abdd4bdf6a13857505f', '8841080b5cc59daf14c4614d4444902a641cb6a5f6b5e7b55bfebdbdb1c45e70e8a55bda7b0ea103435f816005b045635ba7b71b525ec81d6a313bbdf20d4726', 0, '2023-03-22 09:40:44', '2023-03-22 09:40:44', 0, 0),
(32, '6530904', 'Rathanon', 'rr@admin.com', NULL, '83fe5c40e000a0b71e337a20200f5e3abeb3afc9836adf2fe946d810a55ec012d4ce093acc46d2691140fe463dbf6bb93c672205d51957eee657b04592fe42bc', '51ae3ec9654950c3769c0da6019f0282db88e43b1187a375ce6744a82217f86bbab1f31d48ff10327e52e6748fcdb42426ff277c922563457d1cc4ec4c3b8332', 1, '2023-03-22 09:42:19', '2023-03-22 09:42:19', 0, 0),
(33, '65309024', 'Rathanonn', 'rrr@admin.com', NULL, '7c3c672c979374286333b50978e8a7c82dacb79e335bee1550c53dba070c4e8b694aabc46e4cd391f28401698a5f1ccc683b9e11498ca0f1f1628bfc3cefcbc6', 'f4c6ce91d5fedf3903e0c68994c4c32e99823d8decb1cec17dbd429fe2b7e180c8dc74eadd4d342a2c8c22c9a4f1421c50581fe8190ae615f60936c953ea2d20', 1, '2023-03-22 09:44:18', '2023-03-22 09:44:18', 0, 0),
(35, '0', 'add', 'ad@admin.com', NULL, 'aa9f3754b1a552626f2758a729fc46db9c9eac36ad016a560cea9a58fdcb3d2a980785e43ca05a008088ebe22dfa80e15c31970fc9594491d968890a9a29813f', '14c877f3ff4930d4ff4ea887160f1d5865a2176cbb4a78f753e104f0275ab9c2dd307a51d8d433975e7f9fb7b7ed1ef25fcc390c8a7403f6c1b67eb7e7c58a41', 1, '2023-03-23 05:01:49', '2023-03-23 05:01:49', 0, 0),
(42, '1', 'add1', 'ad1@admin.com', NULL, '4de678302ced8a9f04ea0cacad8b740ad68df2c860fdd9c7df3bbff5add90960290b4eacb0b2089b623c9b8481145ff4e8e38c69478466eef0831449a7a4bc1c', 'e634ed8d05045afcdbf59bbea3b4398211cd2007efba23d3017186b0b2691c5334a9d4870cd299aa9155e14be4ad6bd7dbf93e433d9c3a406b7121c701cb6eff', 1, '2023-03-23 05:12:10', '2023-03-23 05:12:10', 0, 0),
(48, 'admin1', 'add11', 'ad11@admin.com', NULL, 'bef52c485e1389003b4007f6c9a674795d61bc3bafaa6a40953377a15163ff072d7df150616f0541a7e7924bc4d2de6467290e56b522582322bf46f99f997574', '5dc91c976598de5a0a9283abe9a12e5bd3e156100f2c1970e48b6f0e2b9beaedfebbd58a8d2db738f092857471e315752d070bd33064e5d51100e6374d7f2cae', 1, '2023-03-23 05:22:59', '2023-03-23 05:22:59', 0, 0),
(50, '', 'add111', 'ad111@admin.com', NULL, '45f0924d4c70cf1809de66097babfc128b129a353f1a8573707fa512ee76ee31d42394c05ea748a05eae9d8617e8ac7f8cc5ae7c7c248c1dee23f6d2c478d3a2', '95659d642ace372a2856e721f191b7064bf19bcf873b9df48856f79f66c117db1f90f62d3654c426011c56b30b6186074a0084ba61194b14cbb26b4c8564ab6c', 0, '2023-03-23 05:42:43', '2023-03-23 05:42:43', 0, 0),
(51, '', 'add1111', 'ad1111@admin.com', NULL, 'c8f6879e36a74bdd2363715ccf61d61a3dcefc504dde3e8d2f91b602981f54f354dfc1ef22d8c3c8e02fb7ae323c54eb9a64fd389114437cbe25d3bba2faa05e', 'c4d0fb76745e040c046c389562519d442169062ee3fe94e4ee10dd922fb17e3a0827ed950dbfc19a3e0b490bed7d3eb17a3bcd08dcf7800ad164ca2e8e3a799b', 0, '2023-03-23 05:43:20', '2023-03-23 05:43:20', 0, 0),
(52, '12345432', 'add11111', 'ad11111@admin.com', NULL, '808f1cdec64ad99d10f08ed1729a7998c34cc0263a93c07b601ca2b61f50b2c3f6af5c3837a09b8b959f3198146393e6d143bf7c4ce3c9cae261d340e56c8e55', '7027efd13b95aaaceede30d12d888e487b4b1f7aac03127decad3199fe4abcc2d3000e9311d009f2595e3b39364b120f5c8feec4b084bbed951b75e5b60d80ea', 1, '2023-03-23 05:54:01', '2023-03-23 05:54:01', 0, 0),
(53, '', 'add111111', 'ad111111@admin.com', NULL, '0392d62b156d5ddb5cce706f04e8ff407885d4a804ec2c11cea0ad4c2e6ed70350d53fb09850a61331a39abdfcbb175df3bbc7ffc2833a9f971d47cea9598d21', 'ef57d85afbd252baf2458fbb68bd034742817d7cec570304a73f038eb5ff82aaff32aaf48f6fb9156d37225b1ba0b91c0d984aa9fe60eff109bbf44e496f0cbe', 0, '2023-03-23 05:54:37', '2023-03-23 05:54:37', 0, 0),
(54, '', 'add1111111', 'ad1111111@admin.com', NULL, '15a02270bcbdc1f3951bfb52663b505f010d837730622999ab5e315b56d5690c304e8c9124051e8f792e1e08d0a7292c2822c6b1a38da8986540853241f56256', 'fc85abf9bf2fb70225a8434f3476c0636b7763e75fa41752d0f59c8177ece3eb99f4b4b2d2877408a0949aeb2ed6d3f5c66a15fba841879a46dc29520f9a565d', 0, '2023-03-23 05:57:55', '2023-03-23 05:57:55', 0, 0),
(55, '12345543', 'user1', 'u@user.com', NULL, 'f0b82b259bb90c37e653315c7d2b871cc5c4ca19acf0ec2cf30be6d64d38c57b3bab53392ee64e1767c50c16c7bc32de6e8bd20700f6399d4e8b4b6cd9c3262b', '542febed1be8f248a823a6d1280466a10e0049d57e9ef935879d1dc00e6d05c694c0063c845dd28b0a687c26cdeb58b648c5ca5c15eace283b76f5d00d71aebd', 1, '2023-03-23 05:59:06', '2023-03-23 05:59:06', 0, 0),
(56, '', 'admin2', 'admin2@admin.com', NULL, '794bc35358a7564ed7532664979b26268e5706cd51ec0f9cb5d15e7923140517ad16fc666e9a9a067e6f14e521c9b60a2fc67e2062ef9e5caabef2d960589775', 'aeb9ceea1eef373748048c560ae119819e21ac0465eb6e0990d572b4c391eee8541d277a7c5c514d7a70e01a6e92c5c4e67b88298294c6eb827fd5c35f26d05d', 0, '2023-03-23 05:59:39', '2023-03-23 05:59:39', 0, 0),
(57, '', 'admin22', 'admin22@admin.com', NULL, '4fcb97df55290962d176da1535ab09b3cecc4072697e0535aa646dcf9fd638db1e565f66be69e9eb5f4934ee2712bae277bacd7488b9410f7d19237daf6127ac', '596bf0f5b9343fd27934a88a9b002f094e00c68023a36b0d0e55f39e5d4990676f4c36416679a7662d769a14e9cf6831e376c4a9e6914a467b5e66de2a0a77a6', 0, '2023-03-23 06:00:24', '2023-03-23 06:00:24', 0, 0),
(58, '', 'admin222', 'admin222@admin.com', NULL, '83690c591a4408f39d7ad5db91ce3d7302e890964100ca79c8dee8fcde90a07b795b4ff0c0fbc3ed3d7e33c8cf8639d179410c34b84f6b9ea0b5e3073f8caef3', '573c6dec7a23e2f6bb9971afa6cedf9a35c7255b0e04f17949b674b322f32b20dd5ce0b155f7f7376b2f2189c0f9cafdeb43ab202fe0ffbf98a419ad1101f206', 0, '2023-03-23 06:25:33', '2023-03-23 06:25:33', 0, 0),
(59, 'user', 'user222', 'user222@admin.com', NULL, 'a926d3a24433e2aff16eaddfe7647fa10eb53bb4a7b17fd2ab5a14b8f05513b3aff2d8d3fec0c988a8067b1b560fbf4933ca37ea75c265b1c33e84b8c1f9267c', '0e45f5f49097bb9eb9b8e20719e8bf7edcbb32814ad1d15fb1332a87d23a4f52070528aa10d239cb62a9e39b9205d68d070a94c0216f183f211cacd10200ccd2', 1, '2023-03-23 06:28:23', '2023-03-23 06:28:23', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_agent`
--

CREATE TABLE `user_agent` (
  `id` int(11) NOT NULL,
  `agent` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `user_agent`
--

INSERT INTO `user_agent` (`id`, `agent`) VALUES
(1, 'PostmanRuntime/7.31.1'),
(2, 'PostmanRuntime/7.31.3');

-- --------------------------------------------------------

--
-- Table structure for table `user_login_attempts`
--

CREATE TABLE `user_login_attempts` (
  `id` int(11) NOT NULL,
  `user` bigint(20) NOT NULL,
  `time` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ip_address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `user_login_attempts`
--

INSERT INTO `user_login_attempts` (`id`, `user`, `time`, `ip_address`, `created_date`) VALUES
(5, 1, '1678261466', '::1', '2023-03-08 14:44:26');

-- --------------------------------------------------------

--
-- Table structure for table `user_login_log`
--

CREATE TABLE `user_login_log` (
  `id` bigint(20) NOT NULL,
  `loged_in_date` datetime DEFAULT NULL,
  `loged_ip` varchar(255) DEFAULT NULL,
  `user` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `user_login_log`
--

INSERT INTO `user_login_log` (`id`, `loged_in_date`, `loged_ip`, `user`) VALUES
(1, '2023-03-08 14:43:20', '::1', 1),
(2, '2023-03-08 14:45:42', '::1', 1),
(3, '2023-03-22 07:36:29', '::1', 1),
(4, '2023-03-22 09:36:13', '::1', 29),
(5, '2023-03-23 04:36:05', '::1', 29),
(6, '2023-03-23 07:11:51', '::1', 29),
(7, '2023-03-23 07:46:59', '::1', 29),
(8, '2023-03-24 02:42:07', '::1', 29);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `role` bigint(20) NOT NULL,
  `user` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`role`, `user`) VALUES
(1, 1),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 24),
(1, 25),
(1, 26),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 58),
(3, 59);

-- --------------------------------------------------------

--
-- Table structure for table `yearbook`
--

CREATE TABLE `yearbook` (
  `id` int(11) NOT NULL,
  `path_img` text DEFAULT NULL,
  `class` varchar(100) DEFAULT NULL,
  `major` varchar(100) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `year_yearbook` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `yearbook`
--

INSERT INTO `yearbook` (`id`, `path_img`, `class`, `major`, `created_by`, `created_date`, `year_yearbook`) VALUES
(1, 'http://bihbbhojojjugtfrdx/', 'ปวช.3/1', 'information technology', 3, '2023-03-13 20:22:43', 2013),
(2, 'https://jikoloopomnobohouogovpco/', 'ปวช.3/2', 'information technology', 3, '2023-03-13 20:38:55', 2013),
(3, 'https://kojnbhg1548/', 'ปวช.3/1', 'Logistics Management', 3, '2023-03-24 07:31:13', 2013),
(4, 'http://kojnnb1591357kij/', 'ปวช.3/2', 'Logistics Management', 3, '2023-03-24 07:31:13', 2013),
(5, 'http://mknbvcxzaswqerrdrfryhyh/', 'ปวส.2/1', 'Accounting', 3, '2023-03-24 07:31:13', 2013),
(6, 'https://,mkomnbvcxzsedgyhhju/', 'ปวส.2/2', 'Accounting', 3, '2023-03-24 07:31:13', 2013),
(7, 'https://kokjinmnjnbhgcfxdxszszaqwertyui/', 'ปวส.2/3', 'Accounting', 3, '2023-03-24 07:31:13', 2013),
(8, 'http://ffsxssaawweemvko/', 'ปวส.2/1', 'Tourism and Hospitality', 3, '2023-03-24 07:31:13', 2013),
(9, 'http://kojmkjoxzcoczasdwefg/', 'ปวส.2/2', 'Tourism and Hospitality', 3, '2023-03-24 07:31:13', 2013),
(10, 'http://hijnnhbgvfcdxszAseryuk,/', 'ปวส.2/3', 'Tourism and Hospitality', 3, '2023-03-24 07:31:13', 2013),
(12, 'http://bihbbhojojjugtfrdx/', 'ปวช.3/1', 'information technology', 3, '2023-03-13 20:22:43', 2013),
(14, 'http://bihbbhojojjugtfrdx/', 'ปวช.3/34', 'information technology', 3, '2023-03-13 20:22:43', 2013);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_token`
--
ALTER TABLE `access_token`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `FK5kmvrg6uuo55il7lx84mimu4f` (`api_client`) USING BTREE,
  ADD KEY `FKjll8aufysmo6yvf124vsqpd81` (`user`) USING BTREE;

--
-- Indexes for table `api_client`
--
ALTER TABLE `api_client`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `api_client_ip`
--
ALTER TABLE `api_client_ip`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `FK5pu9gbj8rvr9gdx27uwua7ug9` (`api_client`) USING BTREE;

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `directory`
--
ALTER TABLE `directory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`,`created_by`,`updated_date`);

--
-- Indexes for table `major`
--
ALTER TABLE `major`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`permission`,`role`) USING BTREE,
  ADD KEY `FKgi97nqcoshtqa28hiy11fc8ho` (`role`) USING BTREE;

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD KEY `k_created_user` (`created_user`) USING BTREE,
  ADD KEY `k_updated_user` (`updated_user`) USING BTREE;

--
-- Indexes for table `user_agent`
--
ALTER TABLE `user_agent`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `user_login_attempts`
--
ALTER TABLE `user_login_attempts`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD KEY `k_app_user` (`user`) USING BTREE;

--
-- Indexes for table `user_login_log`
--
ALTER TABLE `user_login_log`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD KEY `k_app_user` (`user`) USING BTREE;

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`role`,`user`) USING BTREE,
  ADD KEY `FKmnacayuqabmejp7e23rvitaol` (`user`) USING BTREE;

--
-- Indexes for table `yearbook`
--
ALTER TABLE `yearbook`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_token`
--
ALTER TABLE `access_token`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `api_client`
--
ALTER TABLE `api_client`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `api_client_ip`
--
ALTER TABLE `api_client_ip`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `directory`
--
ALTER TABLE `directory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `major`
--
ALTER TABLE `major`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `user_agent`
--
ALTER TABLE `user_agent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_login_attempts`
--
ALTER TABLE `user_login_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_login_log`
--
ALTER TABLE `user_login_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `yearbook`
--
ALTER TABLE `yearbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `access_token`
--
ALTER TABLE `access_token`
  ADD CONSTRAINT `access_token_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `access_token_ibfk_2` FOREIGN KEY (`api_client`) REFERENCES `api_client` (`id`);

--
-- Constraints for table `api_client_ip`
--
ALTER TABLE `api_client_ip`
  ADD CONSTRAINT `api_client_ip_ibfk_1` FOREIGN KEY (`api_client`) REFERENCES `api_client` (`id`);

--
-- Constraints for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`permission`) REFERENCES `permission` (`id`);

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
