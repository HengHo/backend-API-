-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2023 at 11:52 AM
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
(9, 2, '9f5eaf2683d01f8da236a9153a20bc93ca4503fae462fb1a3f02862d0c68f5dc0e6ebb2b4a141fde5fb287c1efc9739381e9a4eb4d177b1d26e4eb0296e52462', 1, 29, 0, '2023-03-24 02:42:07', '2024-03-24 02:03:07', '2023-03-24 02:42:07'),
(10, 3, '13f62c4e458670720ac3a9086f9bfabb3a3a3e026b3615787accd8fea78e360d03dd75cbd131d324cd430d2c61e98bb9bc9af7b0e01277077f181862b7872543', 1, 29, 0, '2023-04-10 09:26:44', '2024-04-10 09:04:44', '2023-04-10 09:26:44'),
(11, 2, '05587c406ee9b1049eb6be25e0a567370a74d7070857c4cda14e93978d564dfcd94530906d623a21510cbbc9fd64483f71f45795f4b254a19e4e9d6538b95f3a', 1, 55, 0, '2023-04-12 04:37:08', '2024-04-12 04:04:08', '2023-04-12 04:37:08'),
(12, 4, 'e3b0f0a05a9973d2630c402e2817cbe5dc6b3881a47698d6d6bc250fd73b277df40f9f559c2169eb0de738a327b4127ba317e79de6fa812fee314286e721e4d3', 1, 32, 0, '2023-04-17 04:02:15', '2024-04-17 04:04:15', '2023-04-17 04:02:15'),
(13, 4, 'ad21371e1bb5c369115684e8002609c7d5e6e233ecb8594b17307b753d7bb66c643a5b2ff040b8690d3efd9456abd0738b01b4c1de02d1417d6e592b89545cb9', 1, 32, 0, '2023-04-17 12:07:37', '2024-04-17 12:04:37', '2023-04-17 12:07:37'),
(14, 4, 'bd5213e3746ea249e7081fa082ca1bca468f58dd8bf7e96fec6806ab4773f7b55d07cb270106fbf0876cb1e09282f93e812870e16ce347ed24a16bdc4ffcc6e4', 1, 62, 1, '2023-04-18 07:50:27', '2024-04-18 07:04:27', '2023-04-19 05:36:54'),
(15, 4, '4f87c784387d67a0d33a9106fc16828d265e2d49af9cb0e802664605703f2c3b10fa59be0ff35becad28b66599113db2397c6a21944ffdf2966dcbcbee205bdd', 1, 62, 1, '2023-04-18 08:04:21', '2024-04-18 08:04:21', '2023-04-19 05:36:54'),
(16, 4, '06d28838a89e7a1255e201965732587a6302e6c71dc80c629355ad5a5878f5705e4954e3ed7f155a233052f261b6c3861a307312973de95fdf51ff5d9b63e7ee', 1, 62, 1, '2023-04-18 12:20:55', '2024-04-18 12:04:55', '2023-04-19 05:36:54'),
(17, 4, '77af41a09fa6f314e522257ec1c5f4a0db7bf81e0367cf73cc0236440dace83344fd4a330bcde8b654b833d6eb2808dca7ec7e143d6af23f48b5a0c4eaf476bc', 1, 62, 1, '2023-04-19 05:33:09', '2024-04-19 05:04:09', '2023-04-19 05:36:54'),
(18, 4, '14a3500abf1ce59107e8aeebdbcb2b74bd987ee7eaf1cbe1745cda67a3c857c42c1345743af456a50aeed181cbe0dd9619148ef9b1a4bf51cfec4611d222bc3c', 1, 62, 1, '2023-04-19 05:36:41', '2024-04-19 05:04:41', '2023-04-19 05:36:54'),
(19, 4, '79736f7f14f0b6ed4056e674f45f0cfd01bfc7eaa41be331994a43ff461914c6dc976cedf75842fa7150b72494978b8beda4606d820cf6dddf3ea822040e3362', 1, 62, 1, '2023-04-19 05:48:41', '2024-04-19 05:04:41', '2023-04-19 05:49:03'),
(20, 4, '231af3552b834bb8badc12f8f6544af0e1ac12d2b83e302f5ae6d5527b6cf0228920690632026fd22b86e92b56e2d0167c48631c89994e66b49fc7e4afeee78b', 1, 62, 1, '2023-04-19 05:49:21', '2024-04-19 05:04:21', '2023-04-19 05:55:26'),
(21, 4, 'b072963918a7ae5f76cd6c992cab806565851163aa5e11fa273484fe981b6ba3002b054195409f55b9c35ba17b055d33a7c62636eaa0469e9b79922bb79a0338', 1, 62, 1, '2023-04-19 05:55:41', '2024-04-19 05:04:41', '2023-04-19 06:08:43'),
(22, 4, '848fdacde5427ea860fb13dacbb2dc2c6ad7f5fa2b7faee54d8631819dfcb2c30598b43c8d7012cc1410effbfadb3fdbdf1b9b1b8b194a61b8d0a9cee41e7d44', 1, 62, 1, '2023-04-19 06:10:42', '2024-04-19 06:04:42', '2023-04-19 06:11:12'),
(23, 4, '7403ac8b1a3c31b886cb2caff99923486cdf3fca0cd3f59ab21d23a4f37a878458fc9f95b08277f150c9e56ace632628676dd7301a65994969b2c8a63887ad4f', 1, 62, 0, '2023-04-19 06:11:21', '2024-04-19 06:04:21', '2023-04-19 06:11:21'),
(24, 5, '47dac3d9eb7ee1b1ca0eedd07dc6cda98d2507b728d47ca073b4d62b33cde692a0ba44d543eacff3485c9c767bc0297d9136bd2c3902f61355629048ca511284', 1, 1, 0, '2023-04-26 04:07:42', '2024-04-26 04:04:42', '2023-04-26 04:07:42'),
(25, 5, '3e0af159d02c3f9b31cf9c063b0f42b9b735855b130b0e2f338fd5d83166fdf2c89660cba131a758e9f679de8032e56560a45a97b23e060a19311bdc116d1a35', 1, 1, 0, '2023-04-26 04:09:30', '2024-04-26 04:04:30', '2023-04-26 04:09:30'),
(26, 5, '6ff7da83df877f774834410f3af3535648df479835bf1023defbf05bd293d8d5ace1c59bd304d6c7ed4cd44e270495fcab298534ca55ebd531464d0ff73d2875', 1, 1, 0, '2023-04-26 04:34:57', '2024-04-26 04:04:57', '2023-04-26 04:34:57'),
(27, 5, 'bb756fcb1ef11eb95525fb4e59320bd06ae50f9c52db77d9037d1e116ce79e868cb08b46f609fe295f5454b58191909f848de381701187b2077c8f386c4db7d2', 1, 1, 0, '2023-04-26 04:40:09', '2024-04-26 04:04:09', '2023-04-26 04:40:09'),
(28, 4, '9de15331ad595632dff3450ae04d22ee01240d7357a1fcd0fae3da8ac1878e84dac6aacc82193c07eb3679a7ee886c032f5f2031167a0256ca79c6dbbcce33ab', 1, 56, 0, '2023-04-26 05:18:29', '2024-04-26 05:04:29', '2023-04-26 05:18:29'),
(29, 4, '5f4fa3ff1bba2094cc51a2b0c62fbb2f91b3cb9f888cc04c178e7f97f4c56f663ce057d0d2b8c577db063edaba9da26bf39401d6a5a4ce4141be12821c20b80b', 1, 63, 0, '2023-04-26 05:22:32', '2024-04-26 05:04:32', '2023-04-26 05:22:32'),
(30, 5, 'fa5a166dbe340ed6177a53d30f9cf7a933bedaf12b1bfb0c5cc887cf33634427f70ca149e43fdf61de6780ead780ad4d2bba70b479f186894c7a5d35ea589994', 1, 1, 0, '2023-04-26 06:03:05', '2024-04-26 06:04:05', '2023-04-26 06:03:05'),
(31, 5, 'b06e226796d9cd04f278ec44304a48c97d0fda21faa9d35022e2236cd6fea37440f67e3439dfee3b55d27dca3895d7544b2ab78ab336dd020276bd39c2030834', 1, 1, 0, '2023-04-26 06:26:57', '2024-04-26 06:04:57', '2023-04-26 06:26:57'),
(32, 6, '0d3dc8040867f78269f9903c3399a43c2b0c78c0df6ae440b1bf6c0d2799f94f234e2191d9c4587a27cba0a1dc7b0b7f1f187c8f7504b9c02ba3430f5522c589', 1, 1, 0, '2023-04-26 11:25:41', '2024-04-26 11:04:41', '2023-04-26 11:25:41'),
(33, 6, 'bb69ab342897aee4946943d8974e401d3528a1aff64d051d8389eb9f0c9d64c254d687507781be10faa39f9fea2a25a3a3db8a928e91999ddea26b60ea52a3f1', 1, 1, 0, '2023-04-26 11:35:07', '2024-04-26 11:04:07', '2023-04-26 11:35:07'),
(34, 6, 'a9684478b10a4b498aa88dd6650851ea0f9d9d1f84ec3ca0bb223b9eba58a361e2ba95a41a646af1a5e8799a2cb7f66d954d20f7de7e528ad7f726ab34a72239', 1, 1, 0, '2023-04-26 11:51:36', '2024-04-26 11:04:36', '2023-04-26 11:51:36'),
(35, 6, '5ba981b5f49290603079cbb3ce38989a149500389a1ff70fa57985b89090c16773c5bf19b70caf363c943805ea3af65a7f2b0f3e70ae6ef5644c6237cf99d87a', 1, 14, 0, '2023-04-27 04:04:35', '2024-04-27 04:04:35', '2023-04-27 04:04:35');

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
  `created_user` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_user` int(11) DEFAULT NULL,
  `updated_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `directory_id`, `comment_directory`, `created_user`, `created_date`, `updated_user`, `updated_date`) VALUES
(1, 1, 'โหดไปป่าวไอน้อง', 14, '2023-03-24 06:26:55', 1, '2023-03-16 00:37:43'),
(2, 2, 'test', NULL, '2023-04-27 09:26:25', 29, NULL),
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
(18, 2, '123450987654321678', 14, '2023-03-24 06:26:55', 1, '2023-03-14 09:12:28'),
(19, 2, '123450987654321678', NULL, '2023-04-27 03:00:33', NULL, NULL),
(20, 2, '123450987654321678', NULL, '2023-04-27 03:26:02', NULL, NULL),
(21, 2, '123450987654321678', NULL, '2023-04-27 06:41:42', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `directory`
--

CREATE TABLE `directory` (
  `id` int(11) NOT NULL,
  `yearbook_id` int(11) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `nickname` varchar(10) DEFAULT NULL,
  `motto` varchar(255) DEFAULT NULL,
  `img` text DEFAULT NULL,
  `admission` date DEFAULT NULL,
  `graduation` date DEFAULT NULL,
  `phone` int(10) DEFAULT NULL,
  `facebook` varchar(50) DEFAULT NULL,
  `instagram` varchar(50) DEFAULT NULL,
  `created_user` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_user` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('confirm','onhold') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `directory`
--

INSERT INTO `directory` (`id`, `yearbook_id`, `birth`, `fullname`, `nickname`, `motto`, `img`, `admission`, `graduation`, `phone`, `facebook`, `instagram`, `created_user`, `created_at`, `updated_user`, `updated_at`, `status`) VALUES
(1, 1, '2002-03-13', NULL, 'มีนา', 'อยากเก่งจริงอะ รามะ', 'http://njbhvgcdxszaqwertyuioplkj/', '2016-01-21', '2019-05-25', 807112211, 'มีนา รีเซล@facebook.com', 'resel_rena@instagram', 29, '2016-06-16 23:15:52', 2, '2023-04-17 10:10:40', 'onhold'),
(2, 1, '2003-11-10', NULL, 'ninja', 'อยากซ่าแต่ไม่กล้าอะดิ', 'http://juikopnhytgfredxsazvbn/', '2016-01-21', '2019-05-25', 80792456, 'ninjapongsatorn@facebook.com', 'ninja_fahzai@instagram.com', 1, '2016-03-15 23:25:03', 1, '2023-03-24 02:05:58', 'confirm'),
(3, 1, '2003-05-03', NULL, 'เมษา', 'เมษายนนี้ เป็นเดือนดี เหมือนตัวตน', 'https://jikmnhbgfvcdxszaqwertyyujjmmkiioolppmjhg/', '2016-07-20', '2016-07-16', 986157142, 'เมไหนเมษา@facebook.com', 'เมษา_Meymei@instagram.com', 14, '2016-07-22 23:41:36', 4, '2023-03-24 06:41:19', 'onhold'),
(4, 2, '2004-08-17', 'ริน', 'ริน', 'รินจัง สะระนังคัสฉามิ', '62_1681868328_ILesi.jpg', '2016-05-13', '2019-05-31', 693518473, 'rinchan_puri@facebook.com', 'rinney_Onley@instagram.com', NULL, NULL, 29, '2023-04-27 09:45:38', 'confirm'),
(5, 2, '2004-08-17', 'ริน', 'ริน', 'รินจัง สะระนังคัสฉามิ', '62_1681868328_ILesi.jpg', '2016-05-13', '2019-05-31', 693518473, 'rinchan_puri@facebook.com', 'rinney_Onley@instagram.com', 16, '2016-08-31 23:55:25', 29, '2023-04-27 09:48:55', 'confirm'),
(6, 3, '2004-11-13', NULL, 'มายา', 'มายาก็เหมือน มายากล แต่ถ้ามาทีละคน ไม่ต้องซนพี่เลี้ยงเอง', 'http://nhujbvgtfcdrexzswqaoplijnhubygvctf/', '2015-03-05', '2018-03-08', 855866815, 'มายาอร่อย@facebook.com', 'Maya_uWu@instagram.com', 17, '2018-03-31 00:06:04', 7, '2023-03-24 06:41:25', 'onhold'),
(7, 3, '2003-09-30', NULL, 'สิง', 'สิงสาราสัตว์ แรมารามะ', 'http://ioljuhyntbgvrfcdewsxzaqplm/', '2013-12-06', '2016-12-10', 614870104, 'zingha@facebook.com', 'ZingHa_gg@instagram.com', 18, '2016-12-14 00:14:24', 8, '2023-03-24 06:41:27', 'onhold'),
(8, 3, '2003-10-20', NULL, 'ตัน', 'บนโลกมีคนเป็นตัน เหมือนเปี๊ยบเลย', 'http://bvgtyikmhgcfxdzsawertyuuihbmmjg/', '2013-01-01', '2016-01-04', 841473026, 'tonton_pochite@facebook.com', 'Ton_ran@instagram.com', 19, '2016-01-31 00:20:57', 9, '2023-03-24 06:41:30', 'onhold'),
(9, 5, '2004-04-10', NULL, 'แอนนา', 'โลกใบใหม่ สดใสกว่าเดิม', 'http://nijiroturanopomegohoobole/', '2013-02-28', '2016-03-03', 915814877, 'Anna@facebook.com', 'Anna_Tenna@instagram.com', 14, '2016-03-04 00:31:02', 10, '2023-03-24 06:41:34', 'onhold'),
(12, 1, '2003-11-10', NULL, 'ninja', 'อยากซ่าแต่ไม่กล้าอะดิ', 'http://juikopnhytgfredxsazvbn/', '2016-01-21', '2019-05-25', 80792456, 'ninjapongsatorn@facebook.com', 'ninja_fahzai@instagram.com', 1, '2016-03-15 23:25:03', 1, '2023-03-13 23:40:43', '');

-- --------------------------------------------------------

--
-- Table structure for table `major`
--

CREATE TABLE `major` (
  `id` int(11) NOT NULL,
  `major_code` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `major`
--

INSERT INTO `major` (`id`, `major_code`, `name`) VALUES
(1, '30901', 'IT'),
(2, '11111', 'DBT'),
(3, '22222', 'com');

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
  `updated_user` bigint(20) DEFAULT NULL,
  `ask` varchar(30) NOT NULL,
  `answer` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `stucode`, `username`, `email`, `image`, `password`, `salt`, `status`, `created_at`, `updated_at`, `created_user`, `updated_user`, `ask`, `answer`) VALUES
(1, NULL, 'admin', 'admin@bekaku.com', NULL, '9354272ca64cccc93cbd2b226266c107b39aaed43e885da90a088527f8a562460fe1941e11c3b30fb69126c487b0f4acd8fbd458889d90c27188753e6d4faa05', '717c428dcdd5aad37fb8be8d830bb4b3abdf54f3186cf026de72c5cf7b069909d1bdcac9fadfc8042b5c6b47267fa9e0e917c315b81cd0d21e78601b9d0d8d2b', 1, '2020-04-27 11:23:19', '2020-06-01 09:18:46', NULL, 1, '', ''),
(14, NULL, 'admin12345', '1@1.com', '987654321', '35aef07d7069e4c6d4e83e8fe7ec7a493627365bb811ba401fb02562b263ce7bad24c3a8a35e8ce46940139f8697ec6bcf526bdee463efaa67ac5a9c879e6673', 'e8a7ddea06244a21f20e141e08c784721c449246c504aa36e65ed73e96efc158c8e1f9f290479b5115abf8ad2ca80bfdcc7cfe2c1b33a745c0d7f2afe13f42ea', 1, '2023-03-22 07:26:23', '2023-04-17 09:06:26', 0, 29, '', ''),
(15, NULL, 'Fahzai3', 'admin4@admin.com', '62_1682477901_iRZNS.jpg', 'b59c66a0256b25528cfa9ea25bbeaba4916760a1fa8f8731a6cc9d53b5f6ca81faa47bedb93535c2d62327c4582582cdd24d3cd8105ef2085b04bb7abc88c103', '83de7dff6d045be72a7a279897497f8345ce8e9e1f2e75176babc77744cf377163e1db6362824d4dd6c4f9afa0144bcf4838327d4dd49cb169edd3a453117df4', 0, '2023-03-22 08:06:01', '2023-04-26 05:01:06', 0, 62, '', ''),
(16, NULL, 'admin05', 'admin5@admin.com', NULL, '0c10f6bf66bd86d69ba1f04db59479e812b0396fbdbe6a431be7a326d5eddeb8075b4a8fb6a7c20af82c425d5217e4227838b7fdc1703f4971b553009de599b4', '2fddd85a00a9b6de7dace8a141b53a5afef7c6418cff7eab2ce943b626c1c8273c7d4144feb42e961dd71de12e251a6691b05b498f3f23287fb3a1a796d5db47', 0, '2023-03-22 08:12:56', '2023-03-22 08:12:56', 0, 0, '', ''),
(17, '', 'admin06', 'admin6@admin.com', NULL, 'f1e7d692b0aae98533ecbaf30970cbf14b5b5a1403db6f74cce853e1f3ca1719b8799377bc475d41f82a196df493a5055e97622b6a7da1e36d104c6eb1a87c42', 'bd2e59313b129c470e355ae2e2e26b5f7cab287a826a39f1918481da693b5ce21fdface5775ac58df17bbce3b56090d42cfbfbc0fddbcdcb5580452bd4324eb7', 0, '2023-03-22 08:23:27', '2023-03-22 08:23:27', 0, 0, '', ''),
(18, '2147483647', 'admin07', 'admin7@admin.com', NULL, 'd23d025a8bc83136a1b71f40d84ce0ff4d23f675d44e5ecf2afa69d54626d6feeb50f27b4445e285287a7b8cdb3c803233c2029986c9c1ddc0ccecf398839fe7', '8c3852be0b2aa396f65e82beb39c91525df3ee3969673cd9f09e83d99ce757c3044bb5b12719adf9970c745ab07230fd207bb6eb49e0d07cf91b64041cc13697', 0, '2023-03-22 09:09:31', '2023-03-22 09:09:31', 0, 0, '', ''),
(24, '10008', 'admin08', 'admin8@admin.com', NULL, '75a01f138722ad36a5f5720aec44605f9f7b865835d6e6d02fd26249183b081f68f56f9c60728194ec285fb078c18d68f2ace60e2f71bb920240b0c15c709778', 'b68019ed7665e5ac26d6ec36187ae765b3085584890cb0faf2d349927d03127eb60aee3ce01ffbb4faaee84809348b639543b613abc83ff7c8e6874b8402d577', 0, '2023-03-22 09:17:17', '2023-03-22 09:17:17', 0, 0, '', ''),
(25, '65309', 'admin01', 'admin11@admin.com', NULL, 'f2ff89202137fcae67200b6b47fb821b6f2ac66e899f576f16f27476e1a30a0d06373bdd282e21111056bbe1431f7bd89cb89c78e06fcf9e05439ff5f3f55142', 'b4b11edd7924e2e2cd43b0797ddb7ec8fbd0ac6b13090ffc2dfa3afe7cb06a5664c7bcd1367ee96060947dc1ea387678ab119259f1cf3618af556da43e551848', 0, '2023-03-22 09:18:13', '2023-03-22 09:18:13', 0, 0, '', ''),
(26, '65309010', 'admin111', 'admin111@admin.com', NULL, 'd371839e3834dbd624a99c1f1fc9b6a5ee6d7f9c451714dc042a17693ac8861fbd7e269fc4fbfe344a3675ba73a505f126aec6bfea4f3caeef523d73d30ec61b', 'ee89069b14de5830483d10b49fb876b564f63aaeb8820059835cf27e74c85de55de807e1e785f8416b9cc9dc5a32d8bd44e65e01cc7effff03b3d2a0c149ce86', 0, '2023-03-22 09:18:44', '2023-03-22 09:18:44', 0, 0, '', ''),
(29, '65309010004', 'Ratchanon Ho', 'rat@admin.com', '29_1681698007_SHsiF.jpg', '844b51c3dc277ae06a7e24a685488c1d9848db3c83d2a0a4554b17271bb056f1a1476dd4f0b4f89a62d5adc09285fbefc864b6c1d20ae700c26c6507a4f70112', '74cf8a0afc5f7a2142aac11da2541530648c63d9105d86a54d930a0600237c0f671ba350706187437031c2b76cba5ff3eb530bbc9210b45fba9222ed17703c23', 1, '2023-03-22 09:30:09', '2023-03-22 09:30:09', 0, 0, 'หล่อไหม', 'หล่อมาก'),
(30, '6530901004', 'Ratchanon oH', 'ra@admin.com', NULL, '72ddc2eed5e2a7bbb4f69fbb43d74b274449fe054940af208138de8e7c9041a0761a6de1b5b2e43c60e6fb75ebc0bfa3a7fa20c4cd53f2dd82a4b8d04894fef3', 'c2479c7440e7ad4d1a9d332c5a82cdbb799018c0786687440339ce55f9859167ade9a134d5335b49990275d12ffa11fa015fb502bec6d087d42a009c73f13965', 0, '2023-03-22 09:39:33', '2023-03-22 09:39:33', 0, 0, '', ''),
(31, '653090004', 'Ratchanon', 'r@admin.com', NULL, '2b5b0caf03b423190a42516654b4b0b66e283557ae3f982dbbdbabec1fcac8abd083ca910290b777fca1db059fe1b22852ecebda9ac75abdd4bdf6a13857505f', '8841080b5cc59daf14c4614d4444902a641cb6a5f6b5e7b55bfebdbdb1c45e70e8a55bda7b0ea103435f816005b045635ba7b71b525ec81d6a313bbdf20d4726', 0, '2023-03-22 09:40:44', '2023-03-22 09:40:44', 0, 0, '', ''),
(32, '6530904', 'Rathanon', 'rr@admin.com', NULL, '83fe5c40e000a0b71e337a20200f5e3abeb3afc9836adf2fe946d810a55ec012d4ce093acc46d2691140fe463dbf6bb93c672205d51957eee657b04592fe42bc', '51ae3ec9654950c3769c0da6019f0282db88e43b1187a375ce6744a82217f86bbab1f31d48ff10327e52e6748fcdb42426ff277c922563457d1cc4ec4c3b8332', 1, '2023-03-22 09:42:19', '2023-03-22 09:42:19', 0, 0, '', ''),
(33, '65309024', 'Rathanonn', 'rrr@admin.com', NULL, '7c3c672c979374286333b50978e8a7c82dacb79e335bee1550c53dba070c4e8b694aabc46e4cd391f28401698a5f1ccc683b9e11498ca0f1f1628bfc3cefcbc6', 'f4c6ce91d5fedf3903e0c68994c4c32e99823d8decb1cec17dbd429fe2b7e180c8dc74eadd4d342a2c8c22c9a4f1421c50581fe8190ae615f60936c953ea2d20', 1, '2023-03-22 09:44:18', '2023-03-22 09:44:18', 0, 0, '', ''),
(35, '0', 'add', 'ad@admin.com', NULL, 'aa9f3754b1a552626f2758a729fc46db9c9eac36ad016a560cea9a58fdcb3d2a980785e43ca05a008088ebe22dfa80e15c31970fc9594491d968890a9a29813f', '14c877f3ff4930d4ff4ea887160f1d5865a2176cbb4a78f753e104f0275ab9c2dd307a51d8d433975e7f9fb7b7ed1ef25fcc390c8a7403f6c1b67eb7e7c58a41', 1, '2023-03-23 05:01:49', '2023-03-23 05:01:49', 0, 0, '', ''),
(42, '1', 'add1', 'ad1@admin.com', NULL, '4de678302ced8a9f04ea0cacad8b740ad68df2c860fdd9c7df3bbff5add90960290b4eacb0b2089b623c9b8481145ff4e8e38c69478466eef0831449a7a4bc1c', 'e634ed8d05045afcdbf59bbea3b4398211cd2007efba23d3017186b0b2691c5334a9d4870cd299aa9155e14be4ad6bd7dbf93e433d9c3a406b7121c701cb6eff', 1, '2023-03-23 05:12:10', '2023-03-23 05:12:10', 0, 0, '', ''),
(48, 'admin1', 'add11', 'ad11@admin.com', NULL, 'bef52c485e1389003b4007f6c9a674795d61bc3bafaa6a40953377a15163ff072d7df150616f0541a7e7924bc4d2de6467290e56b522582322bf46f99f997574', '5dc91c976598de5a0a9283abe9a12e5bd3e156100f2c1970e48b6f0e2b9beaedfebbd58a8d2db738f092857471e315752d070bd33064e5d51100e6374d7f2cae', 1, '2023-03-23 05:22:59', '2023-03-23 05:22:59', 0, 0, '', ''),
(50, '', 'add111', 'ad111@admin.com', NULL, '45f0924d4c70cf1809de66097babfc128b129a353f1a8573707fa512ee76ee31d42394c05ea748a05eae9d8617e8ac7f8cc5ae7c7c248c1dee23f6d2c478d3a2', '95659d642ace372a2856e721f191b7064bf19bcf873b9df48856f79f66c117db1f90f62d3654c426011c56b30b6186074a0084ba61194b14cbb26b4c8564ab6c', 0, '2023-03-23 05:42:43', '2023-03-23 05:42:43', 0, 0, '', ''),
(51, '', 'add1111', 'ad1111@admin.com', NULL, 'c8f6879e36a74bdd2363715ccf61d61a3dcefc504dde3e8d2f91b602981f54f354dfc1ef22d8c3c8e02fb7ae323c54eb9a64fd389114437cbe25d3bba2faa05e', 'c4d0fb76745e040c046c389562519d442169062ee3fe94e4ee10dd922fb17e3a0827ed950dbfc19a3e0b490bed7d3eb17a3bcd08dcf7800ad164ca2e8e3a799b', 0, '2023-03-23 05:43:20', '2023-03-23 05:43:20', 0, 0, '', ''),
(52, '12345432', 'add11111', 'ad11111@admin.com', NULL, '808f1cdec64ad99d10f08ed1729a7998c34cc0263a93c07b601ca2b61f50b2c3f6af5c3837a09b8b959f3198146393e6d143bf7c4ce3c9cae261d340e56c8e55', '7027efd13b95aaaceede30d12d888e487b4b1f7aac03127decad3199fe4abcc2d3000e9311d009f2595e3b39364b120f5c8feec4b084bbed951b75e5b60d80ea', 1, '2023-03-23 05:54:01', '2023-03-23 05:54:01', 0, 0, '', ''),
(53, '', 'add111111', 'ad111111@admin.com', NULL, '0392d62b156d5ddb5cce706f04e8ff407885d4a804ec2c11cea0ad4c2e6ed70350d53fb09850a61331a39abdfcbb175df3bbc7ffc2833a9f971d47cea9598d21', 'ef57d85afbd252baf2458fbb68bd034742817d7cec570304a73f038eb5ff82aaff32aaf48f6fb9156d37225b1ba0b91c0d984aa9fe60eff109bbf44e496f0cbe', 0, '2023-03-23 05:54:37', '2023-03-23 05:54:37', 0, 0, '', ''),
(54, '', 'add1111111', 'ad1111111@admin.com', NULL, '15a02270bcbdc1f3951bfb52663b505f010d837730622999ab5e315b56d5690c304e8c9124051e8f792e1e08d0a7292c2822c6b1a38da8986540853241f56256', 'fc85abf9bf2fb70225a8434f3476c0636b7763e75fa41752d0f59c8177ece3eb99f4b4b2d2877408a0949aeb2ed6d3f5c66a15fba841879a46dc29520f9a565d', 0, '2023-03-23 05:57:55', '2023-03-23 05:57:55', 0, 0, '', ''),
(55, '12345543', 'user1', 'u@user.com', NULL, 'f0b82b259bb90c37e653315c7d2b871cc5c4ca19acf0ec2cf30be6d64d38c57b3bab53392ee64e1767c50c16c7bc32de6e8bd20700f6399d4e8b4b6cd9c3262b', '542febed1be8f248a823a6d1280466a10e0049d57e9ef935879d1dc00e6d05c694c0063c845dd28b0a687c26cdeb58b648c5ca5c15eace283b76f5d00d71aebd', 1, '2023-03-23 05:59:06', '2023-03-23 05:59:06', 0, 0, '', ''),
(56, '', 'Fahzai3pls', 'admin2@admin.com', '62_1682477901_iRZNS.jpg', '794bc35358a7564ed7532664979b26268e5706cd51ec0f9cb5d15e7923140517ad16fc666e9a9a067e6f14e521c9b60a2fc67e2062ef9e5caabef2d960589775', 'aeb9ceea1eef373748048c560ae119819e21ac0465eb6e0990d572b4c391eee8541d277a7c5c514d7a70e01a6e92c5c4e67b88298294c6eb827fd5c35f26d05d', 1, '2023-03-23 05:59:39', '2023-04-27 05:30:55', 0, 56, '', ''),
(57, '', 'Fahzai57pls', 'admin22@admin.com', '62_1682477901_iRZNS.jpg', '4fcb97df55290962d176da1535ab09b3cecc4072697e0535aa646dcf9fd638db1e565f66be69e9eb5f4934ee2712bae277bacd7488b9410f7d19237daf6127ac', '596bf0f5b9343fd27934a88a9b002f094e00c68023a36b0d0e55f39e5d4990676f4c36416679a7662d769a14e9cf6831e376c4a9e6914a467b5e66de2a0a77a6', 0, '2023-03-23 06:00:24', '2023-04-27 09:24:41', 0, 56, '', ''),
(58, '', 'admin222', 'admin222@admin.com', NULL, '83690c591a4408f39d7ad5db91ce3d7302e890964100ca79c8dee8fcde90a07b795b4ff0c0fbc3ed3d7e33c8cf8639d179410c34b84f6b9ea0b5e3073f8caef3', '573c6dec7a23e2f6bb9971afa6cedf9a35c7255b0e04f17949b674b322f32b20dd5ce0b155f7f7376b2f2189c0f9cafdeb43ab202fe0ffbf98a419ad1101f206', 0, '2023-03-23 06:25:33', '2023-03-23 06:25:33', 0, 0, '', ''),
(59, 'user', 'user222', 'user222@admin.com', NULL, 'a926d3a24433e2aff16eaddfe7647fa10eb53bb4a7b17fd2ab5a14b8f05513b3aff2d8d3fec0c988a8067b1b560fbf4933ca37ea75c265b1c33e84b8c1f9267c', '0e45f5f49097bb9eb9b8e20719e8bf7edcbb32814ad1d15fb1332a87d23a4f52070528aa10d239cb62a9e39b9205d68d070a94c0216f183f211cacd10200ccd2', 1, '2023-03-23 06:28:23', '2023-03-23 06:28:23', 0, 0, '', ''),
(60, 'user3', 'user33333', 'user333333@admin.com', '62_1681800147_9SuDo.jpg', '194f806d885650a5c3c56a211d3ce980e2e3e2069078f3cc00868048bdd357f3eee98379dbc5d94a3a62b116f77dd74f9215e123819c65658a28ad4998e34c8b', 'e4d242c14fb03acf906b511ece10456abce71717dbdc442086a9e08fb8203f10e30657bbddd584d3311adb6f2ec53dd6a79adb8963524e5e8ec4f82735fe421e', 1, '2023-04-04 09:33:24', '2023-04-04 09:33:24', 0, 0, '', ''),
(61, '', 'admin123321', 'admin333333@admin.com', '62_1681798664_vkQ6A.jpg', '477b4f857547162eac9bdb2c59ea83c30cba1ad97975bf6d08e7790c75adbd17031e6d4dc39980277561b16abcf9931cd400c8017fcbf55febe958680af30fc2', 'c510e4f16ae620b07e5539d468ab58ddcb7dc205c74cb6819971f170c8bd26813de577ca207a51c087abd909ca3466b0b97cef39a906e0f956ff35814e8e6996', 0, '2023-04-04 09:42:27', '2023-04-04 09:42:27', 0, 0, '', ''),
(62, '', 'adminnin', 'nin@admin.com', '62_1681800461_TQB6U.jpg', 'b17cdcbfc3dbc2d41cc74993357f87a344fb6c6b091e2d5cfed5004bb5d58078e6c3101ca44febe48c465be86fa0d4b5466329f988abe72c04244046a5857723', 'f325cf8d07e39e7b0c3bb7853f9f9083e4af0a873c1b85fc1d1026e493d1d04ed2891f69592793789460b171f78a30150bd48cfd373614ac1cc7b864f471669e', 1, '2023-04-18 07:45:34', '2023-04-18 08:33:12', 0, 29, 'หล่อไหม', 'หล่อมาก'),
(63, '12345678901', 'usernan', 'nan@user.com', NULL, '72625780bc2499c1a5e4a73ec2828bf294fb46aea88b6170e4a5c33b82420af725023a52f1030b3a4116d05c13a73d23eb0f8bfc3c8396e9ed249d5cf5187cab', 'e3781cc1748cf326ed3ed477a5b43d33925702e7c456dea003f8e4c46d33437b3f862f4e152f475e5b4d5dd8e29e47184bd5b0959db56cfcda5fb9d9bac8c537', 1, '2023-04-26 05:22:13', '2023-04-26 05:22:13', 0, 0, '', '');

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
(2, 'PostmanRuntime/7.31.3'),
(3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36'),
(4, 'PostmanRuntime/7.32.2'),
(5, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Mobile Safari/537.36'),
(6, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36');

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
(5, 1, '1678261466', '::1', '2023-03-08 14:44:26'),
(6, 14, '1681874967', '::1', '2023-04-19 05:29:27'),
(12, 14, '1681875160', '::1', '2023-04-19 05:32:40'),
(13, 14, '1681875177', '::1', '2023-04-19 05:32:57'),
(14, 14, '1681875218', '::1', '2023-04-19 05:33:38'),
(21, 62, '1681876154', '::1', '2023-04-19 05:49:14'),
(22, 1, '1682474935', '::1', '2023-04-26 04:08:55'),
(23, 1, '1682474946', '::1', '2023-04-26 04:09:06'),
(24, 1, '1682476483', '::1', '2023-04-26 04:34:43'),
(25, 1, '1682483204', '::1', '2023-04-26 06:26:44'),
(26, 1, '1682501684', '::1', '2023-04-26 11:34:44');

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
(8, '2023-03-24 02:42:07', '::1', 29),
(9, '2023-04-10 09:26:44', '::1', 29),
(10, '2023-04-12 04:37:08', '::1', 55),
(11, '2023-04-17 04:02:15', '::1', 32),
(12, '2023-04-17 12:07:37', '::1', 32),
(13, '2023-04-18 07:50:27', '::1', 62),
(14, '2023-04-18 08:04:21', '::1', 62),
(15, '2023-04-18 12:20:55', '::1', 62),
(16, '2023-04-19 05:33:09', '::1', 62),
(17, '2023-04-19 05:36:41', '::1', 62),
(18, '2023-04-19 05:48:41', '::1', 62),
(19, '2023-04-19 05:49:21', '::1', 62),
(20, '2023-04-19 05:55:41', '::1', 62),
(21, '2023-04-19 06:10:42', '::1', 62),
(22, '2023-04-19 06:11:21', '::1', 62),
(23, '2023-04-26 04:07:42', '::1', 1),
(24, '2023-04-26 04:09:30', '::1', 1),
(25, '2023-04-26 04:34:57', '::1', 1),
(26, '2023-04-26 04:40:09', '::1', 1),
(27, '2023-04-26 05:18:29', '::1', 56),
(28, '2023-04-26 05:22:32', '::1', 63),
(29, '2023-04-26 06:03:05', '::1', 1),
(30, '2023-04-26 06:26:57', '::1', 1),
(31, '2023-04-26 11:25:41', '::1', 1),
(32, '2023-04-26 11:35:07', '::1', 1),
(33, '2023-04-26 11:51:36', '::1', 1),
(34, '2023-04-27 04:04:35', '::1', 14);

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
(1, 61),
(1, 62),
(3, 59),
(3, 60),
(3, 63);

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
(1, '29_1681266431_QKoW1.jpg', 'ปวช.3/3456', '1', 3, '2023-04-12 02:30:53', 2013),
(2, '55_1681290073_BMuDQ.jpg', 'ปวช.3/12', '1', NULL, '2023-04-17 07:02:02', 2013),
(3, 'https://kojnbhg1548/', 'ปวช.3/1', '1', 3, '2023-04-04 06:48:34', 2013),
(4, 'http://kojnnb1591357kij/', 'ปวช.3/2', '1', 3, '2023-04-04 06:48:34', 2013),
(5, 'http://mknbvcxzaswqerrdrfryhyh/', 'ปวส.2/1', '1', 3, '2023-04-04 06:48:34', 2013),
(6, 'https://,mkomnbvcxzsedgyhhju/', 'ปวส.2/2', '1', 3, '2023-04-04 07:19:04', 2014),
(7, 'https://kokjinmnjnbhgcfxdxszszaqwertyui/', 'ปวส.2/3', '2', 3, '2023-04-04 07:19:17', 2016),
(8, 'http://ffsxssaawweemvko/', 'ปวส.2/1', '2', 3, '2023-04-04 07:19:11', 2015),
(9, 'http://kojmkjoxzcoczasdwefg/', 'ปวส.2/2', '2', 3, '2023-04-04 07:19:22', 2017),
(10, 'http://hijnnhbgvfcdxszAseryuk,/', 'ปวส.2/3', '3', 3, '2023-04-04 06:25:02', 2013),
(12, 'http://bihbbhojojjugtfrdx/', 'ปวช.3/1', '3', 3, '2023-04-04 06:25:08', 2013),
(14, 'http://bihbbhojojjugtfrdx/', 'ปวช.3/34', 'information technology', 3, '2023-03-13 20:22:43', 2013),
(15, 'http://bihbbhojojjugtfrdx/', 'ปวช.3/345', 'information technology', 3, '2023-03-13 20:22:43', 2013),
(16, 'http://bihbbhojojjugtfrdx/', 'ปวช.3/4', '3', 3, '2023-03-13 20:22:43', 2013),
(17, '29_1681266431_QKoW1.jpg', 'ปวช.3/14', '3', 3, '2023-03-13 20:22:43', 2013),
(18, '29_1681266431_QKoW1.jpg', 'ปวช.3/145', '3', 3, '2023-03-13 20:22:43', 2013),
(19, '29_1681266431_QKoW1.jpg', 'ปวช.3/1456', '3', 3, '2023-03-13 20:22:43', 2013),
(20, '62_1682331166_4qyRv.jpg', 'ปวช.3/1456', '1', 3, '2023-03-13 20:22:43', 2013);

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
  ADD UNIQUE KEY `phone` (`phone`,`created_user`,`updated_at`);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `directory`
--
ALTER TABLE `directory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `major`
--
ALTER TABLE `major`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `user_agent`
--
ALTER TABLE `user_agent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_login_attempts`
--
ALTER TABLE `user_login_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `user_login_log`
--
ALTER TABLE `user_login_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `yearbook`
--
ALTER TABLE `yearbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
