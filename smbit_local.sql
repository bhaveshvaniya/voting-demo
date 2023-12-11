-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2022 at 12:43 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smbit_local`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(27, '2014_10_12_000000_create_users_table', 1),
(28, '2014_10_12_100000_create_password_resets_table', 1),
(29, '2019_08_19_000000_create_failed_jobs_table', 1),
(31, '2020_12_07_123445_create_permission_tables', 1),
(32, '2020_12_24_063748_create_sessions_table', 2),
(51, '2016_06_01_000001_create_oauth_auth_codes_table', 18),
(52, '2016_06_01_000002_create_oauth_access_tokens_table', 18),
(53, '2016_06_01_000003_create_oauth_refresh_tokens_table', 18),
(54, '2016_06_01_000004_create_oauth_clients_table', 18),
(55, '2016_06_01_000005_create_oauth_personal_access_clients_table', 18),
(56, '2022_04_26_094436_update_uuid_device_name_device_token_column', 19),
(57, '2022_05_02_181007_update_columnphoto_to_user_avatar', 19);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(2, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 102),
(1, 'App\\Models\\User', 104);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Larademo Personal Access Client', 'OIKSDKQryYEyiGj6Nwbiw6rvjPs7kJh4Qn8109tp', NULL, 'http://localhost', 1, 0, 0, '2021-05-16 07:10:43', '2021-05-16 07:10:43'),
(2, NULL, 'Larademo Password Grant Client', '6VRAzGMzT2Wlhl8uYNYa0Oe4WJP4ApjtfWhKz0ZH', 'users', 'http://localhost', 0, 1, 0, '2021-05-16 07:10:44', '2021-05-16 07:10:44'),
(3, NULL, 'Prospa Personal Access Client', 'irEvj2injINiJ6QGJw0DP4FZr7Ewqz69Uo0C4Nx3', NULL, 'http://localhost', 1, 0, 0, '2022-09-09 03:58:46', '2022-09-09 03:58:46'),
(4, NULL, 'Prospa Password Grant Client', 'bh0Scph0wNthYI9CZbiWFDSGQI5DJgskPCg3qmV9', 'users', 'http://localhost', 0, 1, 0, '2022-09-09 03:58:46', '2022-09-09 03:58:46'),
(5, NULL, 'Laravel Personal Access Client', 'cCb2ShgtgkPcNpoWUrYlB8xwTlvW8jrL2WReOj6o', NULL, 'http://localhost', 1, 0, 0, '2022-09-09 05:01:10', '2022-09-09 05:01:10'),
(6, NULL, 'Laravel Password Grant Client', 'xk6DCoB4aq1NrKDXJnNzam4FFUxU82vz58lgdfDr', 'users', 'http://localhost', 0, 1, 0, '2022-09-09 05:01:10', '2022-09-09 05:01:10'),
(7, NULL, 'Laravel Personal Access Client', 'PXW2ueWorbojWgsSz2bqeXAf9znbusuuyXpX7B7p', NULL, 'http://localhost', 1, 0, 0, '2022-09-12 05:07:59', '2022-09-12 05:07:59'),
(8, NULL, 'Laravel Password Grant Client', 'wpyB1LtN6XEdTNqcIX1Paqytf4a62rYOjp8SJzRb', 'users', 'http://localhost', 0, 1, 0, '2022-09-12 05:07:59', '2022-09-12 05:07:59');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-05-16 07:10:44', '2021-05-16 07:10:44'),
(2, 3, '2022-09-09 03:58:46', '2022-09-09 03:58:46'),
(3, 5, '2022-09-09 05:01:10', '2022-09-09 05:01:10'),
(4, 7, '2022-09-12 05:07:59', '2022-09-12 05:07:59');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'role-list', 'web', '2020-12-07 08:20:08', '2020-12-07 08:20:08'),
(2, 'role-create', 'web', '2020-12-07 08:20:08', '2020-12-07 08:20:08'),
(3, 'role-edit', 'web', '2020-12-07 08:20:08', '2020-12-07 08:20:08'),
(4, 'role-delete', 'web', '2020-12-07 08:20:08', '2020-12-07 08:20:08'),
(11, 'role-view', 'web', '2021-01-18 07:31:55', '2021-01-18 07:31:55'),
(13, 'user-list', 'web', '2021-01-18 07:32:33', '2021-01-18 07:32:33'),
(14, 'user-create', 'web', '2021-01-18 07:32:42', '2021-01-18 07:32:42'),
(15, 'user-edit', 'web', '2021-01-18 07:32:49', '2021-01-18 07:32:49'),
(16, 'user-delete', 'web', '2021-01-18 07:32:57', '2021-01-18 07:32:57'),
(17, 'user-view', 'web', '2021-01-18 07:33:53', '2021-01-18 07:33:53'),
(18, 'permission-list', 'web', '2021-01-18 07:34:25', '2021-01-18 07:34:25'),
(22, 'permission-delete', 'web', '2021-01-18 07:35:12', '2021-01-18 07:35:12'),
(43, 'permission-create', 'web', '2021-01-30 07:19:49', '2021-01-30 07:19:49'),
(44, 'permission-edit', 'web', '2021-01-30 07:19:55', '2021-01-30 07:19:55'),
(45, 'permission-view', 'web', '2021-01-30 07:20:02', '2021-01-30 07:20:02'),
(46, 'settings', 'web', '2021-02-09 08:31:05', '2021-02-09 08:31:05');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2020-12-07 08:19:51', '2020-12-07 08:19:51');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(11, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(22, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('C9bLLdpQv2fCJmuS4KcJp9Az0yBsa0HRUz1HO5pD', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWlGVHoza1RlSHVRd0Jqd21lbURqMU9qVUFvUXprOW9uMm9VaWR2eSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wb3J0Zm9saW8iO319', 1621170592),
('QQsNFfqZlBWbr3gGJ0psb29SZ0UABiflK9nJ75TI', 1, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiS0J4SEhhM1dXeHJoMUQ1UmVWaEk2dHNQT2hEYktkR0lxTmtwbmVjYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9iYWNrZW5kL3VzZXJzL2NyZWF0ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1621080979),
('qSliSqu0r8fAqsPE1f4xRG7gJpdkd0mYDBZ2XVwQ', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRWZ6dHphOGNJbE5YQTVLcnIwMnpWOXVDbVNQNFpVeVFzYlRzZFJDaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9iYWNrZW5kL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fX0=', 1620454912),
('VBYZHAUM7LCLcjFW4ouBsWmAnwcsAekNembI2iOs', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVzJ6R2tWRWo1aXFsazBvcXVWN3B2bm0xRG9VTmpFSlRkSGt2bVVGUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9iYWNrZW5kL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1620916800);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '1 => Active\r\n2 => Inactive\r\n3 => Deleted\r\n4 => Blocked',
  `device_uuid` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `device_name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `device_token` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `user_avatar`, `email_verified_at`, `password`, `remember_token`, `status`, `device_uuid`, `device_name`, `device_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Admin', 'admin@admin.com', '9876543210', '1663670478.png', '2020-12-07 08:19:51', '$2y$10$w1Tr/p7bXWoYVLRPsRCIIeyIo1Gt.exe.sZiQPCazsRLGq7VyhUHK', 'eF402tEOXQTeBru5ZtiKSKIwyuRNHdPr5W68CZVahtyGNws5u0QxHsexKnUX', 1, '', '', '', '2020-12-07 08:19:51', '2022-09-20 05:11:18'),
(2, 'Nannie', 'Renner', 'hstark@example.net', NULL, NULL, '2020-12-07 08:20:39', '$2y$10$ykfmoegT0G5NhrY6bzxRheJL3l4MNpgVhuCqm/KQ.6ZfpMhSbUoSe', 'L5pxbUf9ml', NULL, '', '', '', '2020-12-07 08:20:39', '2020-12-07 08:20:39'),
(3, 'Elissa', 'Hills', 'emily.mann@example.org', NULL, NULL, '2020-12-07 08:20:39', '$2y$10$0IYlO5mxtPTgz1XvJP7IXOEaWLySP2M/4E7378q5M1xyb8PtjfDa2', 'P3GPTCYM4j', NULL, '', '', '', '2020-12-07 08:20:39', '2020-12-07 08:20:39'),
(4, 'Maeve', 'Wilderman', 'hlittle@example.net', NULL, NULL, '2020-12-07 08:20:39', '$2y$10$Or36jw4b1cJX2NdZQk2d2OLf7z66Jg1SHR5vtkZmgRAF/T6Q/dtC.', 'HcKb8C2zdp', NULL, '', '', '', '2020-12-07 08:20:40', '2020-12-07 08:20:40'),
(5, 'Gilbert', 'Stehr', 'pfeffer.unique@example.org', NULL, NULL, '2020-12-07 08:20:39', '$2y$10$/gX2wAjYj/haQT57yqNllOuWwHlEtQnUefVdfPdC460eEGvfi/qqS', 'iiLM9GqQl0', NULL, '', '', '', '2020-12-07 08:20:40', '2020-12-07 08:20:40'),
(6, 'Kassandra', 'Kulas', 'luciano.schiller@example.com', NULL, NULL, '2020-12-07 08:20:39', '$2y$10$fXgvGtaksk5s.hcNuDSNeuiZQiFAufaBbG9j4bMABBrKbN0aIk/vO', '1R4wDxiCY5', NULL, '', '', '', '2020-12-07 08:20:40', '2020-12-07 08:20:40'),
(7, 'Abby', 'Volkman', 'arnaldo.heaney@example.org', NULL, NULL, '2020-12-07 08:20:39', '$2y$10$K6W1grgofvzPFP5VsKBWGekMdrSELNxpT1efMYAyNCHgXelFhW9ca', 'vXykH5MOrX', NULL, '', '', '', '2020-12-07 08:20:40', '2020-12-07 08:20:40'),
(8, 'Tyson', 'VonRueden', 'wcole@example.com', NULL, NULL, '2020-12-07 08:20:39', '$2y$10$tgLlnT8NVlzQF.ANEJli1OkeV.Csby5szGk9LzMZ82MbWGSPkz8AS', 'd7a8GuYVPU', NULL, '', '', '', '2020-12-07 08:20:40', '2020-12-07 08:20:40'),
(9, 'Jayson', 'Schneider', 'vhowe@example.com', NULL, NULL, '2020-12-07 08:20:39', '$2y$10$UZJl6MrI5iNQQB6x/9P2geyI1UzAlCMQzCIzFLNiVzR7gkfehKQli', 'ONiU1Ye76d', NULL, '', '', '', '2020-12-07 08:20:40', '2020-12-07 08:20:40'),
(10, 'Juliana', 'Feil', 'lweimann@example.net', NULL, NULL, '2020-12-07 08:20:39', '$2y$10$kiX/Y4txctWXSzX4GQPO7OalD7rNw9w3TUJtXWogrc/aIXLNf4xFq', 'kYg0HNqPF5', NULL, '', '', '', '2020-12-07 08:20:40', '2020-12-07 08:20:40'),
(11, 'Frederick', 'Graham', 'otho34@example.org', NULL, NULL, '2020-12-07 08:20:39', '$2y$10$l4uoE.mmS9kpdxL6GFTlLuYYWEEvWJlqMSdzCfg070O5FYSycFZt.', 'qvDE3Kc5Wp', NULL, '', '', '', '2020-12-07 08:20:40', '2020-12-07 08:20:40'),
(12, 'Uriah', 'Blanda', 'jaskolski.jazlyn@example.net', NULL, NULL, '2020-12-07 08:20:58', '$2y$10$3qhLDUXqh40DKFtTSd51keRX2pRjR68tufenaiqpXQB.Ej.7HOkrq', 'UdckLSSoVO', NULL, '', '', '', '2020-12-07 08:20:58', '2020-12-07 08:20:58'),
(13, 'Henriette', 'Donnelly', 'heidi25@example.org', NULL, NULL, '2020-12-07 08:20:58', '$2y$10$h1iI9DAsMZugyEutflC9SeUVx8flpoJnh934EGjWGq2vbEmvy517C', '5p8AQm3apk', NULL, '', '', '', '2020-12-07 08:20:58', '2020-12-07 08:20:58'),
(14, 'Larue', 'Osinski', 'demarco81@example.org', NULL, NULL, '2020-12-07 08:20:58', '$2y$10$YZySAnDIYHWtVXwuTewsSeRLFCMDUHF8X7XhCkQ1Nbez8YsHDxqd.', '7MveCtbAiv', NULL, '', '', '', '2020-12-07 08:20:59', '2020-12-07 08:20:59'),
(15, 'Anjali', 'Swaniawski', 'smitham.mikayla@example.com', NULL, NULL, '2020-12-07 08:20:58', '$2y$10$prHIoUQ.viKF.FHaobXVlORqNrPAoLg2axxfOLhGCf59V920qBblO', 'JjqgziIaPU', NULL, '', '', '', '2020-12-07 08:20:59', '2020-12-07 08:20:59'),
(16, 'Shannon', 'Larson', 'wcremin@example.com', NULL, NULL, '2020-12-07 08:20:58', '$2y$10$EYDzwIvZS03zwrEmFS.EvuogEObV5A3vOXMZzNwrfFotGiEWHzay2', '02zEj4T3bC', NULL, '', '', '', '2020-12-07 08:20:59', '2020-12-07 08:20:59'),
(17, 'Sydnee', 'Flatley', 'fstreich@example.net', NULL, NULL, '2020-12-07 08:20:58', '$2y$10$XiN/EP9HONvMNpSd6D9VWusXhpV4UxSvIgwP2zl97u.bHNblGJBYS', '0cflSkrucH', NULL, '', '', '', '2020-12-07 08:20:59', '2020-12-07 08:20:59'),
(18, 'Benjamin', 'Johnston', 'tad.predovic@example.com', NULL, NULL, '2020-12-07 08:20:58', '$2y$10$AYNKF0EK0HV3zi9aPIrqyu5Pg.SDnEVMopnDZikvKe0dOxGJe0fiC', 'OJaWP8A9lA', NULL, '', '', '', '2020-12-07 08:20:59', '2020-12-07 08:20:59'),
(19, 'Ethelyn', 'Reinger', 'bertha.kozey@example.com', NULL, NULL, '2020-12-07 08:20:58', '$2y$10$u8HZiWzc1p2iXmJi2C81T.6cCW.mI7praidNEojEU71a3tDeMV4n6', 'nMlbZtetCY', NULL, '', '', '', '2020-12-07 08:20:59', '2020-12-07 08:20:59'),
(20, 'Adrianna', 'Predovic', 'cooper65@example.net', NULL, NULL, '2020-12-07 08:20:58', '$2y$10$v3gYtxzE0jjY9mCuCIH6GewHkA1cHF27dOhfDgAPiD2rCQS01TLw6', '87i5NBzzJp', NULL, '', '', '', '2020-12-07 08:20:59', '2020-12-07 08:20:59'),
(21, 'Clarissa', 'Hand', 'adouglas@example.com', NULL, NULL, '2020-12-07 08:20:58', '$2y$10$lFr7ZCjd03aa3O.EDzUeXeerGtW.2tB8xXHCRYc5GeKdfj8DVlL8S', 'NstaSZ5S7x', NULL, '', '', '', '2020-12-07 08:20:59', '2020-12-07 08:20:59'),
(22, 'Annette', 'Gerhold', 'ffeil@example.com', NULL, NULL, '2020-12-07 08:21:00', '$2y$10$aUhKoTvNZ4Gz9Fgl.Wvx3.23hJJ/wyblcYnJlqqFQ3.aAQ/DGLigm', 'KM2OHsfb7g', NULL, '', '', '', '2020-12-07 08:21:01', '2020-12-07 08:21:01'),
(23, 'Blanca', 'Ferry', 'evangeline.ortiz@example.org', NULL, NULL, '2020-12-07 08:21:00', '$2y$10$dB76IF8EO05u04IB3xjtOeRQa5uV8VQwqEKxtdDmZ9JJuD8oT0zdC', 'qKZuy2ZqHb', NULL, '', '', '', '2020-12-07 08:21:01', '2020-12-07 08:21:01'),
(24, 'Genevieve', 'Nicolas', 'pbraun@example.net', NULL, NULL, '2020-12-07 08:21:00', '$2y$10$vDDoeQKPLjc8VmELAzDUeu0VRut7JjT33XmOQw7GdqYm2DCFBcUJy', 'JXCzwktMPX', NULL, '', '', '', '2020-12-07 08:21:01', '2020-12-07 08:21:01'),
(25, 'Consuelo', 'Jakubowski', 'boyd.aufderhar@example.com', NULL, NULL, '2020-12-07 08:21:00', '$2y$10$UqCk5MtLRr5ap9bXinsqnOTcNyrothFJryKdjsuM.FK6MCXg00AI2', 'T3PqN4Obiw', NULL, '', '', '', '2020-12-07 08:21:01', '2020-12-07 08:21:01'),
(26, 'Brown', 'Mante', 'tanya84@example.net', NULL, NULL, '2020-12-07 08:21:00', '$2y$10$vUqxeIi3wv49sClMXN7KIu.E6iStdLYTt9edqPZwqYxEHCEyV3eXu', 'J0KOfVIow7', NULL, '', '', '', '2020-12-07 08:21:01', '2020-12-07 08:21:01'),
(27, 'Alex', 'Jacobi', 'moore.orville@example.com', NULL, NULL, '2020-12-07 08:21:01', '$2y$10$YleYXJzukBOK1a6/Ill5te7F2YaAMgkqloY7qWKWxMN3yzdzLG48C', 'L08PSzNwyH', NULL, '', '', '', '2020-12-07 08:21:01', '2020-12-07 08:21:01'),
(28, 'Danyka', 'Beier', 'olaf.bauch@example.net', NULL, NULL, '2020-12-07 08:21:01', '$2y$10$sBRVL/h6V3fTCWNRKsMVvur3xcQanjY6Lmy93e1Yxat5sRygHdVdm', 'tj0JlLp3Gv', NULL, '', '', '', '2020-12-07 08:21:01', '2020-12-07 08:21:01'),
(29, 'Jean', 'Nienow', 'wwyman@example.org', NULL, NULL, '2020-12-07 08:21:01', '$2y$10$VG1og9bzh5RovOZRQOd/bOZRXg3fVBLx7a1BRiZTE6xu89MrZdGNe', 'WWo95vHsA7', NULL, '', '', '', '2020-12-07 08:21:01', '2020-12-07 08:21:01'),
(30, 'Lorna', 'Dickens', 'cleuschke@example.com', NULL, NULL, '2020-12-07 08:21:01', '$2y$10$BtpCf228Ctqw/vqigJhJSu4CUlESgQREn1Dyv/f9sWoLpj/2HCjzC', 'kXcQfTRxj4', NULL, '', '', '', '2020-12-07 08:21:01', '2020-12-07 08:21:01'),
(31, 'Quinten', 'Pagac', 'bradly96@example.net', NULL, NULL, '2020-12-07 08:21:01', '$2y$10$StxpHAs0QzGgW48sncsdAeSazYgme0UoZJ89eD39HGAIYv6FGUura', 'TO35WdGjzr', NULL, '', '', '', '2020-12-07 08:21:01', '2020-12-07 08:21:01'),
(32, 'Jacinthe', 'Stoltenberg', 'dahlia02@example.com', NULL, NULL, '2020-12-07 08:21:02', '$2y$10$5ApAI8nuoM9ahMSpfeBHxuuayMiU7pg7AKG8CysMimzme4zEYc5t6', 'rQjRe3DAb9', NULL, '', '', '', '2020-12-07 08:21:03', '2020-12-07 08:21:03'),
(33, 'Elnora', 'Douglas', 'rhiannon.erdman@example.com', NULL, NULL, '2020-12-07 08:21:02', '$2y$10$qJJwXRdf3WU1N3yDPvfTuO.Q95yv.sVMAjcOStD4amDE9p259zS7W', 'SqJF2ewwVb', NULL, '', '', '', '2020-12-07 08:21:03', '2020-12-07 08:21:03'),
(34, 'Korbin', 'Cassin', 'wiza.jillian@example.net', NULL, NULL, '2020-12-07 08:21:02', '$2y$10$q50B6r5TXwzdeHxBVOZc.eEO/RN5TBNIx7wTXLPts4brCTvZcN2hG', '0p8KGImNh7', NULL, '', '', '', '2020-12-07 08:21:03', '2020-12-07 08:21:03'),
(35, 'Darwin', 'Robel', 'evonrueden@example.com', NULL, NULL, '2020-12-07 08:21:02', '$2y$10$WrOyDJya6CsCey2DQCI0t.0kuiXHD1bD58TOPH.OfwZ9hUNucJYRm', '2IW1VtFmO1', NULL, '', '', '', '2020-12-07 08:21:03', '2020-12-07 08:21:03'),
(36, 'Justus', 'Casper', 'hayes.christop@example.com', NULL, NULL, '2020-12-07 08:21:02', '$2y$10$fgg/Wd.BCZ6nlyRQSGxm1OWhd.cKr4z0qSkP1nHsIV6eFpiXwDlf2', 'kpd0sQZvVu', NULL, '', '', '', '2020-12-07 08:21:03', '2020-12-07 08:21:03'),
(37, 'Yesenia', 'Corkery', 'royal31@example.com', NULL, NULL, '2020-12-07 08:21:03', '$2y$10$NTRDIlGJO7FTUy6my6xiyeU97RbGJqPWCpfZDcurcUzk4n1v.q.Hm', 'LGmIzBMU79', NULL, '', '', '', '2020-12-07 08:21:03', '2020-12-07 08:21:03'),
(38, 'Retha', 'Romaguera', 'hkuhic@example.org', NULL, NULL, '2020-12-07 08:21:03', '$2y$10$iOM1pfi.rD.aRMTIbqtZBuqwZbNjt8VvnFPK9TKqXdoMUkXvSJ49a', 'Rg2mNR8ESs', NULL, '', '', '', '2020-12-07 08:21:03', '2020-12-07 08:21:03'),
(39, 'Amani', 'Mayert', 'fschulist@example.net', NULL, NULL, '2020-12-07 08:21:03', '$2y$10$9LZK/gDibQs9vKdxroWL..zOnk3dTYjfHA2oUIFWN6pqLg1oiscE2', 'WmjmIAdl1d', NULL, '', '', '', '2020-12-07 08:21:03', '2020-12-07 08:21:03'),
(40, 'Katarina', 'Bahringer', 'katarina17@example.net', NULL, NULL, '2020-12-07 08:21:03', '$2y$10$N7xaR63kwH2hMbEda7y97OLNkNwVAqcdvNOWrLPboEImLbci1O7jq', 'tPDNNIHZdp', NULL, '', '', '', '2020-12-07 08:21:03', '2020-12-07 08:21:03'),
(41, 'Dante', 'Reynolds', 'ztowne@example.net', NULL, NULL, '2020-12-07 08:21:03', '$2y$10$U6ZDHJl9SRAgDC7CPo9i.O2A9MjOTrLErTfgOVdpSDNVj47xHqRw6', 'OqVtV7CqbX', NULL, '', '', '', '2020-12-07 08:21:03', '2020-12-07 08:21:03'),
(42, 'Henry', 'Labadie', 'ashton.ruecker@example.com', NULL, NULL, '2020-12-07 08:21:04', '$2y$10$XaHHSigWj83PyjC3Cb0ZR.Tv.SEJUJMawX/a/0.wKvU8uNIz7l8ta', 'qIxrZRdvj8', NULL, '', '', '', '2020-12-07 08:21:05', '2020-12-07 08:21:05'),
(43, 'Montana', 'Hauck', 'verda95@example.org', NULL, NULL, '2020-12-07 08:21:04', '$2y$10$Ihi1GJ31jwXKTz1uWt.ESuSNMBCJuBJ4MJHVNhsGM3YBXeg9QoFLO', 'mi7t1Jb8cT', NULL, '', '', '', '2020-12-07 08:21:05', '2020-12-07 08:21:05'),
(44, 'Jerry', 'Pouros', 'candace.quitzon@example.org', NULL, NULL, '2020-12-07 08:21:04', '$2y$10$TbSbWnmZT4ckkgz/G7KChuKzvhPed0laMncnBQiEAlbXKOqqv9kQy', 'gUklfMOOFR', NULL, '', '', '', '2020-12-07 08:21:05', '2020-12-07 08:21:05'),
(45, 'Floyd', 'Mann', 'adela.abshire@example.com', NULL, NULL, '2020-12-07 08:21:04', '$2y$10$QhBQan6RlfGrYrFI5R5KHu1WQMXki0DRyH/wr.ww71so8CdvUMkSu', 'gvhu9edm2k', NULL, '', '', '', '2020-12-07 08:21:05', '2020-12-07 08:21:05'),
(46, 'Earl', 'Hauck', 'vhegmann@example.org', NULL, NULL, '2020-12-07 08:21:04', '$2y$10$1Z4MCspPfKaumbNnBDW5meqDzq30Wqo6kOjFo9VDmaFDTESvqCaDe', 'VBo22IeUPM', NULL, '', '', '', '2020-12-07 08:21:05', '2020-12-07 08:21:05'),
(47, 'Chase', 'Turner', 'toy.ian@example.org', NULL, NULL, '2020-12-07 08:21:04', '$2y$10$OGFfY6BK26FklcKLTlFdK.a0hBTFcSdUcL2kow1J80sVkD01Fx89W', '96HjOAndil', NULL, '', '', '', '2020-12-07 08:21:05', '2020-12-07 08:21:05'),
(48, 'Annabelle', 'Carter', 'nona.conroy@example.net', NULL, NULL, '2020-12-07 08:21:05', '$2y$10$RKu4BtohZ0zcIu.oIEvI3uQ6Ix7hgSajr.jBs.j1YDX5G07lP7dsK', 'q9SHhZVWzP', NULL, '', '', '', '2020-12-07 08:21:05', '2020-12-07 08:21:05'),
(49, 'Jada', 'Halvorson', 'brandt72@example.com', NULL, NULL, '2020-12-07 08:21:05', '$2y$10$ZJt2oU6GKMglY5pHqMobnup.serlf1Qd/bhi7wlq9Vysl1btqaRlK', '3kjC6oJdU1', NULL, '', '', '', '2020-12-07 08:21:05', '2020-12-07 08:21:05'),
(50, 'Adan', 'Bashirian', 'bert45@example.net', NULL, NULL, '2020-12-07 08:21:05', '$2y$10$sdukTEepMv7ZhsbqifyZVOjY0yeIypOD7ZmLLCk.VlXHK/mjsGFrO', 'FbFOtY6dwL', NULL, '', '', '', '2020-12-07 08:21:05', '2020-12-07 08:21:05'),
(51, 'Kenyatta', 'Kemmer', 'connelly.brent@example.org', NULL, NULL, '2020-12-07 08:21:05', '$2y$10$6kvxboOgvpFD.5xdqb4MBerVbMm45IK0B7CCeRyu0gdtWgH2QiL1q', 'B0dB3P27hj', NULL, '', '', '', '2020-12-07 08:21:05', '2020-12-07 08:21:05'),
(52, 'Laura', 'Hansen', 'lemke.magnolia@example.org', NULL, NULL, '2020-12-07 08:21:06', '$2y$10$z5vboIE7oa3ZGewtwLshU.AlRhfJ80IIFDqnwiETZuRIWGLRgdELa', '049HV5qSG2', NULL, '', '', '', '2020-12-07 08:21:07', '2020-12-07 08:21:07'),
(53, 'Bert', 'Dickinson', 'etreutel@example.org', NULL, NULL, '2020-12-07 08:21:06', '$2y$10$WiZpGYGTM6Idkv3TMCJKWOP8qeyHXWNOffvM9CB.QyCClo0Qy5KJy', '1k8dKLhFUW', NULL, '', '', '', '2020-12-07 08:21:07', '2020-12-07 08:21:07'),
(54, 'Sage', 'Kub', 'nora48@example.com', NULL, NULL, '2020-12-07 08:21:06', '$2y$10$goxaxsDGe9s9nSmujhy9Ke7KPcrd.VOtr/hiFGs1Kh182s0udUOr6', 'OG5zb4OGQy', NULL, '', '', '', '2020-12-07 08:21:07', '2020-12-07 08:21:07'),
(55, 'Toney', 'Beer', 'uschroeder@example.com', NULL, NULL, '2020-12-07 08:21:06', '$2y$10$9X1B7RJ3m9MNjX1ddKlKvetfAXTq2pG3lsHeNdBP6nF4SgCW4R7h6', 'WblvggBL0t', NULL, '', '', '', '2020-12-07 08:21:07', '2020-12-07 08:21:07'),
(56, 'Hermann', 'Lueilwitz', 'isai.rodriguez@example.net', NULL, NULL, '2020-12-07 08:21:07', '$2y$10$O7UN55.7ecTYAFnJqVG3XeVqdxbAzzuFGZRlVQWM2Sj/86RqL7jly', 'F6BAIvNK2c', NULL, '', '', '', '2020-12-07 08:21:07', '2020-12-07 08:21:07'),
(57, 'Greta', 'Mitchell', 'frederique.hoppe@example.org', NULL, NULL, '2020-12-07 08:21:07', '$2y$10$R9Q/ngFLbdqcTqSgHJ7PwO4qr5bO.JmqXZe6pXSvGrC2mGr2om3SW', 'ycSCbXP11A', NULL, '', '', '', '2020-12-07 08:21:07', '2020-12-07 08:21:07'),
(58, 'Tiana', 'Jaskolski', 'imani.schuster@example.com', NULL, NULL, '2020-12-07 08:21:07', '$2y$10$vaKNf/32Rr3EkyKMYbMJ4.l33tvhLehtZFOWPTJBF.0h2Uc/58Z52', 'NmvtfmPUgv', NULL, '', '', '', '2020-12-07 08:21:07', '2020-12-07 08:21:07'),
(59, 'Hosea', 'Toy', 'iharvey@example.com', NULL, NULL, '2020-12-07 08:21:07', '$2y$10$./0GhJ3CyZGRsCJQKkYVZuU5CeRbz/amiN./pJ5W/.tWd0AkRrst6', 'XALLhAomQf', NULL, '', '', '', '2020-12-07 08:21:07', '2020-12-07 08:21:07'),
(60, 'Bonnie', 'Orn', 'sterling.ferry@example.org', NULL, NULL, '2020-12-07 08:21:07', '$2y$10$3bPBewQgIYGysUQ5nBI3QuJR.9rRI3vZc35Awn/rHNuJAy4JDI.nq', '6wWYzKtaPF', NULL, '', '', '', '2020-12-07 08:21:07', '2020-12-07 08:21:07'),
(61, 'Mike', 'Bechtelar', 'rippin.roberta@example.com', NULL, NULL, '2020-12-07 08:21:07', '$2y$10$X7rltWjTgwHelHHgQBVWpegG5vUfshIHdpR/n9n5vuvE47VRoqjGu', 'nGH0uR1LAF', NULL, '', '', '', '2020-12-07 08:21:07', '2020-12-07 08:21:07'),
(62, 'Jazmyn', 'Donnelly', 'nicola.fay@example.org', NULL, NULL, '2020-12-07 08:21:08', '$2y$10$6v3Vl5vyaesXm/Z65FcUGObLFfpYk9aEL7LXGLq/zxBPxXiKYjH2y', '9gfsL1xGGI', NULL, '', '', '', '2020-12-07 08:21:09', '2020-12-07 08:21:09'),
(63, 'Kayla', 'Jerde', 'emayer@example.net', NULL, NULL, '2020-12-07 08:21:08', '$2y$10$c1EXK0kobzB0XwsQkHAo0etKl4kW9EJOS1wdFSf4msyRcQip1QNGG', 'Bfk9VIAmpO', NULL, '', '', '', '2020-12-07 08:21:09', '2020-12-07 08:21:09'),
(64, 'Imogene', 'Reinger', 'sadie58@example.org', NULL, NULL, '2020-12-07 08:21:08', '$2y$10$/8gDUBGnAsCl/CK9A43PgO0jYUq4SunsWbRCYl//R9zT8qHu5gs36', 'mVqL5ifc7z', NULL, '', '', '', '2020-12-07 08:21:09', '2020-12-07 08:21:09'),
(65, 'Rylan', 'Gerlach', 'kaylin.lubowitz@example.org', NULL, NULL, '2020-12-07 08:21:08', '$2y$10$xAJZ/4Gqpikov9wKuF0dW.kQtJ8CtYxNSjujURRoJ0.sWjuQ6ppUS', 'UkeISC9Q8i', NULL, '', '', '', '2020-12-07 08:21:09', '2020-12-07 08:21:09'),
(66, 'Janice', 'Satterfield', 'iweimann@example.net', NULL, NULL, '2020-12-07 08:21:08', '$2y$10$t5CcFr12I2K3DO/uqAGt7u1OaM.bBV/DOKZmrvqK1Gvbh2lPnuPeG', 'dsbSUFPLVT', NULL, '', '', '', '2020-12-07 08:21:09', '2020-12-07 08:21:09'),
(67, 'Beth', 'Wisozk', 'gayle05@example.com', NULL, NULL, '2020-12-07 08:21:08', '$2y$10$ODvYRgx8iEmMG9gZIvu5Pebckv.Dl1QlAdpfsIacSUbCRDEXeuY0W', '0FYPQDaXGW', NULL, '', '', '', '2020-12-07 08:21:09', '2020-12-07 08:21:09'),
(68, 'Makenna', 'Hintz', 'xlowe@example.com', NULL, NULL, '2020-12-07 08:21:08', '$2y$10$/DO9jtPVAdhJSWsftfLrNexYA43dgIFsfy/nlDQBdRBkuHuJhBkiK', 'BTRdVJ8mIr', NULL, '', '', '', '2020-12-07 08:21:09', '2020-12-07 08:21:09'),
(69, 'Gail', 'Kling', 'ivah84@example.com', NULL, NULL, '2020-12-07 08:21:09', '$2y$10$4aWjqbZLIyHb7PdvRHh3bOiOlSS/GY1ujHF/HISt82/.IriTnNiXe', 'Yx2p4kA3HT', NULL, '', '', '', '2020-12-07 08:21:09', '2020-12-07 08:21:09'),
(70, 'Manley', 'Bauch', 'ova.blanda@example.org', NULL, NULL, '2020-12-07 08:21:09', '$2y$10$MTDATb9HJifp.SRXwE3bru7rpfSTVN.iBwOHmjfC2ZZ.mmaz1iBK2', 'bWNxekZsUO', NULL, '', '', '', '2020-12-07 08:21:09', '2020-12-07 08:21:09'),
(71, 'Mafalda', 'Stark', 'crona.joana@example.net', NULL, NULL, '2020-12-07 08:21:09', '$2y$10$uAG8t95BTP/yDm/jC935k.MO74R/NWP25xA5nvUJOEWK1Q362V1d6', 'yba9fjnoh7', NULL, '', '', '', '2020-12-07 08:21:09', '2020-12-07 08:21:09'),
(72, 'Gia', 'Weissnat', 'ziemann.euna@example.com', NULL, NULL, '2020-12-07 08:21:11', '$2y$10$/jB./E79slolI4N1nmZYI.rhu3iykh01ASFOfNtjmI6oFrsBfc57G', 'cCHU5YWUVG', NULL, '', '', '', '2020-12-07 08:21:11', '2020-12-07 08:21:11'),
(73, 'Claude', 'Weissnat', 'heaven51@example.net', NULL, NULL, '2020-12-07 08:21:11', '$2y$10$.ONdjs/0kl/6Zg3BUwstqOp.MDdKY6Kn70MVlrAhovyp6gFo9u9Bu', '1SsV11N0vR', NULL, '', '', '', '2020-12-07 08:21:11', '2020-12-07 08:21:11'),
(74, 'Katelin', 'Doyle', 'zdaniel@example.net', NULL, NULL, '2020-12-07 08:21:11', '$2y$10$4/oasGcsBDPdVsykV9abL.jHLGiiNXMWOlrNSSXWdoXAQsYkENEYS', 'WrlZBLvhIr', NULL, '', '', '', '2020-12-07 08:21:11', '2020-12-07 08:21:11'),
(75, 'Camila', 'Weissnat', 'lkoch@example.net', NULL, NULL, '2020-12-07 08:21:11', '$2y$10$K3A3Mu55Bgv0n6nRMyFW9u6eETA0mGuUKr/VE3GJ3gLBdcblk9lRK', '3EOdDn66p3', NULL, '', '', '', '2020-12-07 08:21:11', '2020-12-07 08:21:11'),
(76, 'Jerad', 'Lind', 'isaac25@example.net', NULL, NULL, '2020-12-07 08:21:11', '$2y$10$T2m8GW.Ou2V9ixkRzLsR9erHo2e7nxWzYOPIFP9Hg5k3mutolqJFK', 'GveU2PjnjI', NULL, '', '', '', '2020-12-07 08:21:12', '2020-12-07 08:21:12'),
(77, 'Virginie', 'Lang', 'tratke@example.net', NULL, NULL, '2020-12-07 08:21:11', '$2y$10$H1aZ/NyLCZ/VIlaq67DYJ.fp90tjnFVcPx1do9nRKzdeQKByVL54K', 'Ep2VvKXhWx', NULL, '', '', '', '2020-12-07 08:21:12', '2020-12-07 08:21:12'),
(78, 'Charity', 'Kohler', 'zemlak.gladys@example.net', NULL, NULL, '2020-12-07 08:21:11', '$2y$10$2iftjuoWFy6wG27aDiavAuX9hYmOLCcbdDDuu8p.b7lJVL3gT.u9m', 'o8maIx47Lj', NULL, '', '', '', '2020-12-07 08:21:12', '2020-12-07 08:21:12'),
(79, 'Stan', 'Kutch', 'rosalinda14@example.com', NULL, NULL, '2020-12-07 08:21:11', '$2y$10$xF1366BdXeOVoiPVkj7VqO/2r50lYuaJPRblXoR1jkAPPRfTTM.le', 'IhpHvg0OFt', NULL, '', '', '', '2020-12-07 08:21:12', '2020-12-07 08:21:12'),
(80, 'Lessie', 'Nitzsche', 'denesik.roberta@example.com', NULL, NULL, '2020-12-07 08:21:11', '$2y$10$UgX0GTDR5Ame/bSUiSn.H.GT7Ux8zBIjdy0bgHCTLtcTL3R41CLNC', 'bhCfcPtm0q', NULL, '', '', '', '2020-12-07 08:21:12', '2020-12-07 08:21:12'),
(81, 'Randall', 'Schneider', 'wilmer41@example.com', NULL, NULL, '2020-12-07 08:21:11', '$2y$10$kHVyhTQdp7mEk2DtI6/PzuBtOF/Fi5CIpy3dBzfFw4T4SLasICM8.', 'ttY3kCtRok', 2, '', '', '', '2020-12-07 08:21:12', '2021-03-10 07:18:38'),
(82, 'Kareem', 'Turner', 'spencer.bonnie@example.org', NULL, NULL, '2020-12-07 08:21:13', '$2y$10$JkMJ6oxXrIVmQrGaFUa6CeuWS.Z3eYQKB9DQsUDg0EYGulP1VpDRu', 'RegU6D0Bb0', 2, '', '', '', '2020-12-07 08:21:13', '2021-03-10 07:18:38'),
(83, 'Damian', 'Graham', 'myrl.paucek@example.com', NULL, NULL, '2020-12-07 08:21:13', '$2y$10$UxA/NKjosxiklSWSiGcUcOg3hcCXhkXZo7OkJJapMuaxr/L8svmg2', 'oFe6Dw0UHp', NULL, '', '', '', '2020-12-07 08:21:13', '2020-12-07 08:21:13'),
(84, 'Kaia', 'Borer', 'erich.gorczany@example.net', NULL, NULL, '2020-12-07 08:21:13', '$2y$10$1gfLF5R4qKUWCgKjeSi.EuNQNQVeQb0LB5ceyDIJoV91XeucXlbBW', '0PndnE7qYV', NULL, '', '', '', '2020-12-07 08:21:13', '2020-12-07 08:21:13'),
(85, 'Ebba', 'Carroll', 'adella95@example.org', NULL, NULL, '2020-12-07 08:21:13', '$2y$10$gd4bH0Pdfev7Lnl9sv.9Leshd9xl7QRe1ujJxtzY1rYUmNAXAYPHG', '6bN4bc5ZW0', 4, '', '', '', '2020-12-07 08:21:13', '2021-03-10 07:19:39'),
(86, 'Muriel', 'Marquardt', 'lonzo.bahringer@example.net', NULL, NULL, '2020-12-07 08:21:13', '$2y$10$.93jD.Q.cPTA9wYj/pXASOt5/hoknovB6d2PqJTl7E0tHE1W70iKe', 'ON44Oq8G3O', 4, '', '', '', '2020-12-07 08:21:13', '2021-03-10 07:19:39'),
(87, 'Arno', 'Doyle', 'kasey.jakubowski@example.com', NULL, NULL, '2020-12-07 08:21:13', '$2y$10$5Ss1yudM7KMLC27Gt6nwQurOKMX6GgnDClllbgIGujJHMnP5BmFCa', 'Yuify47z0Y', NULL, '', '', '', '2020-12-07 08:21:13', '2020-12-07 08:21:13'),
(88, 'Sophie', 'Williamson', 'aniyah.stehr@example.com', NULL, NULL, '2020-12-07 08:21:13', '$2y$10$juq6ml/F9QIOqf9yy6zK5OD6.xykvJ0Z2iK5SfAdY6oNSxNEqdbwu', 'tr453PmO9J', NULL, '', '', '', '2020-12-07 08:21:13', '2020-12-07 08:21:13'),
(89, 'Marcos', 'Keebler', 'sboyer@example.com', NULL, NULL, '2020-12-07 08:21:13', '$2y$10$OVq7irBi0sR.5j3imAnwFuLpCxKPnRrI4GpAKLoUnNKBGtXrkE2yK', 'I4mNoSizvY', NULL, '', '', '', '2020-12-07 08:21:13', '2020-12-07 08:21:13'),
(90, 'Lavada', 'Mosciski', 'zpfannerstill@example.org', NULL, NULL, '2020-12-07 08:21:13', '$2y$10$RqpM4MVKcEiuDwOrkKePkuTQ13k5TO8eX2y2ioaoKwh9VqHK/mnJq', 'fhPlztx3Pu', 1, '', '', '', '2020-12-07 08:21:13', '2021-03-10 07:59:46'),
(91, 'Kari', 'Johnston', 'glenna05@example.net', NULL, NULL, '2020-12-07 08:21:13', '$2y$10$apdJHe6sqNWqRbzqYtLzhu8HdBmddmAAXNEbnNERRZmLpVE7MhkQ2', '0tTo8AuIWr', 1, '', '', '', '2020-12-07 08:21:14', '2021-03-10 07:59:46'),
(94, 'Jaylen', 'Kirlin', 'esteuber@example.com', NULL, NULL, '2020-12-07 08:21:15', '$2y$10$63.t.V3xI2C.PZcYnjFbS.ZhccuLwtUjYKJBA7Z4cGfubDv5oEZ0u', 'MXag2Wb1Jm', 1, '', '', '', '2020-12-07 08:21:15', '2021-03-10 07:59:46'),
(98, 'Juwan', 'Russel', 'cloyd.little@example.com', NULL, NULL, '2020-12-07 08:21:15', '$2y$10$gYrmT3g.o6TZhSFN7514i.mF1GQXnkOuyuprfU8vb2NbGFzwY56eC', 'W7e9TfjC11', 1, '', '', '', '2020-12-07 08:21:15', '2021-03-10 07:59:46'),
(100, 'Hailie', 'Dare', 'owatsica@example.com', NULL, NULL, '2020-12-07 08:21:15', '$2y$10$HidQPxVRkyMBsb6DGpsGm.0zAGPAUxthonaoZ3JGA.dEFKoLuyA4S', 'U2VTnlgxXEP6fJI03WZ5Mwbl7aE9SPLtgvPBUV3enwE78fuQbkYqMEoMqIgJ', 1, '', '', '', '2020-12-07 08:21:16', '2021-03-10 07:59:46'),
(101, 'Estel', 'Quigley', 'sharon13@example.org', NULL, NULL, '2020-12-07 08:21:15', '$2y$10$Z9rTe.2ZIOUDGMtoIGvXk.mp88LlWzUFN2e36Uu4TLfYweeB3qrlm', 'wdcsMAhLo4', 1, '', '', '', '2020-12-07 08:21:16', '2021-03-10 07:59:46'),
(102, 'test', 'admin', 'test@admin.com', NULL, NULL, NULL, '$2y$10$BJo/kEiHUlsysBr/QpJRCeKyzxBGZulQvSCKAy1GvoschYSiGd98K', NULL, 1, '', '', '', '2020-12-20 07:22:45', '2021-03-10 07:59:46'),
(103, 'test 1', 'admin 1', 'test1@admin1.com', NULL, NULL, NULL, '$2y$10$OBZHbNA2td0DTxgq4frlfuPzwdyYDMyTE5Ajz6KmYy74U0R8C1wyy', NULL, 1, '', '', '', '2020-12-20 07:30:47', '2021-03-10 07:59:46'),
(104, 'Peter', 'Parker', 'peter@parker.com', NULL, NULL, NULL, '$2y$10$vDUWoKjhEBQYQZsEOpHgg.hKxT5umiXt/A9MjSpaJ6caT./av1wwa', NULL, 1, '', '', '', '2021-01-30 08:58:12', '2021-03-10 07:59:46'),
(107, 'test', 'test', 'admin123@admin.com', '9876543210', NULL, NULL, '$2y$10$n3bFOaPR8os1Zx8iTUm.NO6nSj/oRzUALpjEiuTzeFFAHmprOsqDy', NULL, 1, '', '', '', '2021-02-03 07:08:01', '2021-03-10 07:59:46'),
(108, 'use', 'api', 'user@api.com', NULL, NULL, NULL, '$2y$10$I0nIi9HVOS7XQZ7ez8VYQOB7ojk8cLAizjqLGuef69T7x4TXjTVs.', NULL, NULL, '', '', '', '2021-05-16 07:28:57', '2021-05-16 07:28:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
