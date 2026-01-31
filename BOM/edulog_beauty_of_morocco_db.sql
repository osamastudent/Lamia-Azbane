-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 31, 2026 at 07:21 AM
-- Server version: 10.6.24-MariaDB
-- PHP Version: 8.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edulog_beauty_of_morocco_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_09_30_074522_create_missing_products_table', 2),
(5, '2025_09_30_092038_create_personal_access_tokens_table', 3),
(6, '2025_10_04_101036_add_user_type_to_users_table', 4),
(7, '2025_10_04_103328_add_user_type_to_users_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `missing_products`
--

CREATE TABLE `missing_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `product_brand` varchar(255) DEFAULT NULL,
  `product_type` varchar(255) DEFAULT NULL,
  `barcode_photo_path` varchar(255) NOT NULL,
  `ingredient_photo_path` varchar(255) NOT NULL,
  `product_images_paths` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`product_images_paths`)),
  `status` varchar(20) DEFAULT 'new',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `missing_products`
--

INSERT INTO `missing_products` (`id`, `product_name`, `barcode`, `product_brand`, `product_type`, `barcode_photo_path`, `ingredient_photo_path`, `product_images_paths`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Organic Coconut Oil', 'kuch bhi', 'Beauty of Morocco', 'Hair Oil', '/uploads/barcodes/1759224717_68dba38d393e2.jpeg', '/uploads/ingredients/1759224717_68dba38d3bd66.jpeg', '\"[\\\"\\\\\\/uploads\\\\\\/images\\\\\\/1759224717_68dba38d3d0cf.jpeg\\\"]\"', 'old', NULL, '2025-09-30 16:31:57', '2025-10-06 17:36:25'),
(2, 'Organic Coconut Oil', 'kuch bhi new', 'Beauty of Morocco', 'Hair Oil', '/uploads/barcodes/1759226576_68dbaad088bab.jpeg', '/uploads/ingredients/1759226576_68dbaad08d112.jpeg', '\"[\\\"\\\\\\/uploads\\\\\\/images\\\\\\/1759226576_68dbaad090641.jpeg\\\"]\"', 'old', NULL, '2025-09-30 17:02:56', '2025-10-06 17:36:25'),
(3, 'Organic Coconut Oil', 'kuch bhi new2', 'Beauty of Morocco', 'Hair Oil', '/uploads/barcodes/1759227384_68dbadf8605a8.jpeg', '/uploads/ingredients/1759227384_68dbadf865933.jpeg', '[\"\\/uploads\\/images\\/1759227384_68dbadf869d44.jpeg\"]', 'old', NULL, '2025-09-30 17:16:24', '2025-10-06 17:35:01'),
(4, 'Organic Coconut Oil', 'kuch bhi new2', 'Beauty of Morocco', 'Hair Oil', '/uploads/barcodes/1759227484_68dbae5cc3cd1.jpeg', '/uploads/ingredients/1759227484_68dbae5cc7b4b.jpeg', '[\"\\/uploads\\/images\\/1759227484_68dbae5ccb417.jpeg\",\"\\/uploads\\/images\\/1759227484_68dbae5cceaeb.jpeg\"]', 'old', NULL, '2025-09-30 17:18:05', '2025-10-06 17:35:01'),
(5, 'Organic Coconut Oildddd', 'kuch bhi new3', 'Beauty of Morocco', 'Hair Oil', '/uploads/barcodes/1759228090_68dbb0ba990ea.jpeg', '/uploads/ingredients/1759228090_68dbb0ba9d1f2.jpeg', '[\"\\/uploads\\/images\\/1759228090_68dbb0baa01d3.jpeg\",\"\\/uploads\\/images\\/1759228090_68dbb0baa3c8c.jpeg\"]', 'old', NULL, '2025-09-30 17:28:10', '2025-10-06 17:35:01'),
(6, 'checking', '12345', 'Beauty', 'Hair', '/uploads/barcodes/1759749692_68e3a63c41092.PNG', '/uploads/ingredients/1759749692_68e3a63c42f15.PNG', '[\"\\/uploads\\/images\\/1759749692_68e3a63c44a99.PNG\",\"\\/uploads\\/images\\/1759749692_68e3a63c45dc4.PNG\"]', 'old', NULL, '2025-10-06 18:21:32', '2025-10-06 18:23:19'),
(7, 'checking2', '123455', 'Beauty', 'Hair', '/uploads/barcodes/1759749732_68e3a6648273f.PNG', '/uploads/ingredients/1759749732_68e3a66483994.PNG', '[\"\\/uploads\\/images\\/1759749732_68e3a66484b6a.PNG\",\"\\/uploads\\/images\\/1759749732_68e3a66485f00.PNG\"]', 'old', NULL, '2025-10-06 18:22:12', '2025-10-06 18:23:19'),
(10, 'rr', 'rrr', 'rr', 'rr', '/uploads/barcodes/1759845040_code2.PNG', '/uploads/ingredients/1759845040_code3.PNG', '[\"\\/uploads\\/images\\/1759845040_code1.PNG\",\"\\/uploads\\/images\\/1759845040_code4.PNG\"]', 'old', 1, '2025-10-07 20:50:40', '2025-10-07 20:51:16'),
(12, 'bb', 'bb', 'bb', 'bb', '/uploads/barcodes/1759845743_Screenshot (4).png', '/uploads/ingredients/1759845743_Screenshot (2).png', '[\"\\/uploads\\/images\\/1759845743_Screenshot (3).png\",\"\\/uploads\\/images\\/1759845743_Screenshot (4).png\"]', 'old', 1, '2025-10-07 21:02:23', '2025-11-18 02:17:46'),
(13, 'Mobile', '1585', 'Android', 'Touch', '/uploads/barcodes/1769086166_aaaaaaaabb.JPG', '/uploads/ingredients/1769086166_q2.JPG', '[\"\\/uploads\\/images\\/1769086166_email_not_Sent.JPG\",\"\\/uploads\\/images\\/1769086166_q1.JPG\",\"\\/uploads\\/images\\/1769086166_q2.JPG\"]', 'old', 1, '2026-01-22 12:49:26', '2026-01-22 12:49:32'),
(14, 'testting2026', '158566', 'Brand2026', 'TypeBrand', '/uploads/barcodes/1769087978_aaaaaaaabb.JPG', '/uploads/ingredients/1769087978_q2.JPG', '[\"\\/uploads\\/images\\/1769087978_testssimage.JPG\",\"\\/uploads\\/images\\/1769087978_xyz.png\"]', 'old', 1, '2026-01-22 13:19:38', '2026-01-22 13:21:39');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0em1NlNVm3ufiHzVTZz37yMBwY62VOTzW0eWi49J', NULL, '91.231.89.126', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUVIcFhCT0dxb0RuS0JjTDFOSExFYUl6SWpCVXpoVFZLSlM4N3RXayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly93d3cuYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769794612),
('0eWkYU2HxYhm2Ki5B18CSnaS8RZtH7rOW8GBCiIg', NULL, '91.196.152.48', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2g1T3NXa3NEamk5dEtDaHlic1VxaTg3eG9VZ1lCWkpqNHJ1b3ZFYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly93d3cuYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769795071),
('1RnstoTFw4PYx0gZM9GDunMJ6hx2kxAEZgqEv7LL', NULL, '205.169.39.53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.5938.132 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUkxidmc5NnhNUEF5YThKaTBmZVphSXd5Q3N3eWhVcXJGS0Y3NTFpMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly9iZWF1dHktb2YtbW9yb2Njby5lZHUtbG9nLmNvbS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1769832889),
('1TlUHXuIufETvjmzrRtVoANs4GTCgjnh9IOViydq', NULL, '107.172.195.165', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidlR2NXJNdExZUTdOVW43aktWUUF5UnJ3SFZmQTg1bndsekRvQ1hMSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769793331),
('2PK6iOtJJkyOFX4LdC2RXW6fHg8NYLfEcgkdPc3P', NULL, '40.117.125.130', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1o4SkdHR1lkYTR1cmVsTUtZOWpmbmt2MnYyU09DTUlMNjFyUmgzeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20vaW5kZXgucGhwP3JvdXRlPWNoZWNrb3V0JTJGY2FydCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1769516668),
('2W5LKEk8PyKWyyczhpLL7qzAhJdwYZm0qwTQRtrA', NULL, '3.151.194.164', 'air.ai/scanning Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZFRSYkI4Z3F3RmxjaXNjYzE0Rk1pSUt4QlVweGd3UDE3TGR0Ym1YeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9iZWF1dHktb2YtbW9yb2Njby5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1769764233),
('4X6lXTbZVriPdvFF128TQx9YfAkSH48ED1xozh3y', NULL, '91.231.89.127', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVJXUGFGTHBOUE5RSzF0OHBMazRMS1dXM2NTYVF1Tk1tbTFmUnBmWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9iZWF1dHktb2YtbW9yb2Njby5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1769794854),
('7tVNscO8OO1KAvbbYwYbTGQo4Ulv7o9FLksN25nA', NULL, '119.73.96.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTGd5MzNybHc2dmhRMWNicWpTenJUNjdGa3ozVHQ3VGFPU29CbVJEdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHBzOi8vYmVhdXR5LW9mLW1vcm9jY28uYnNzc3RhZ2VzZXJ2ZXJmb3JwYW5lbHMueHl6Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769778956),
('8k7P6BrTaUaoGto4w8Ph2hYrybMjz09AnqSSaKLT', NULL, '204.76.203.25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibUxYV0k3TG1tdjNjYW12Y3Rhd3F5R0VKdFN5cmpkaGtneHN3aG9wZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769773628),
('8TvDHxNmYtf3Ht95Xu4gDpvE3aaypp4i1YDYBtrh', NULL, '119.73.96.156', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTRrOUo3TVk4c1BBMUFLbXl5Q0E4OFRsRFVyVmc4QVpMeUd1Sk9xayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769844006),
('9i1va9UmxVtiGCXH1DfmholOVTo4oDuGpUjMBb3G', NULL, '119.73.96.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWs4WmswbkRuWlJQaURGSHRkTWk2MU5UYW5Pb1hOWk44ZUZLNnA3VSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769779873),
('AxkHc7qPImAgYPQ8WTkXPz1mgZajDeG6dr00ctna', NULL, '104.197.69.115', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQVBNU2tsQUxmN3Z5MlZGZUhJVmNtT1lxeDhkM09udG9pcWM1cDhNaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly9iZWF1dHktb2YtbW9yb2Njby5lZHUtbG9nLmNvbS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1769793100),
('bjM3doC6dP1tiiRk7zcnHG6dNcva3nHBiq16sgiS', NULL, '103.4.250.131', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmRnRFIxMFZEWHdiS3o2NFB3UEx2Q0tldmhpZlV4Y3ZoM3ZGZ0lBQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769796230),
('BVNOPWjoKE7knq7jSHMvGEKKNRPDUsK7kVOHutJF', NULL, '178.128.207.138', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibFowR2NSRlcwVlRtNjQ3Q3FmcUdSVUZtVU1vWGpndnd1NUwyc1JjYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9iZWF1dHktb2YtbW9yb2Njby5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1769793059),
('CDucRL8JEUM9OLTU5lh8H44HPNJqQdXOLooLg89I', NULL, '128.140.1.194', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidEIwMkMxcVZ0V0ZaVjdwaXFDd2NzdVNaa2o1VHVYanN5eTlpYXdmRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDc6Imh0dHBzOi8vd3d3LmJlYXV0eS1vZi1tb3JvY2NvLmVkdS1sb2cuY29tL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769564450),
('d1s0l9cIZ12o5FCNDAeRAUGQygGNO81ysB1ZzeyE', NULL, '3.151.194.164', 'air.ai/scanning Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmRuMGYyYUFkdlk4ajFRdHQxQTdEUEFEb1ZPY0FJQnp1OG8xVlVGRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly9iZWF1dHktb2YtbW9yb2Njby5lZHUtbG9nLmNvbS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1769764233),
('eduCmRjUs5t6uFZAz64vJvEMNu3aETRl5S0COKkw', NULL, '143.198.63.143', 'Mozilla/5.0 (X11; Linux x86_64; rv:142.0) Gecko/20100101 Firefox/142.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWZVSzAwNnpZOFh2NHp0UkljN28yb1kxakRYRE51RWVSMFpkVTVoWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDc6Imh0dHBzOi8vd3d3LmJlYXV0eS1vZi1tb3JvY2NvLmVkdS1sb2cuY29tL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769573775),
('eEe6J9Ppm6GC5jDnXcpsS1A8Grw7LEZfBiDwL3cQ', NULL, '204.76.203.25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOW1TYVNDYXNUU3diOW9URFB2RG1ZSnA4YTI0MnBxempYSDBQY05vVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769773628),
('EoMDMnjSd5Z1nhhc7wkv3ogM5FqgmdeEGBHxMJw1', NULL, '103.4.251.224', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFBueGtCZEpnTTRPMlJwNXd2WW9nTWtxNjhad2xsbmtGbEZKZkV2QiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769797498),
('FimnnpBoxu1z9trebGbzrHmnZshnJW2cbhRuPue1', NULL, '91.231.89.99', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3VNR0o1SkF6TFk1NVhSUTY3WXozcWVxaWNBM0FYejcwRTVHUWFCaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly93d3cuYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769795890),
('G3R8ar4g6ngMCRBcKjh01am80FMkBtTsp79HHXlR', NULL, '103.4.250.131', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRG1jcG95Nm83Wk1JcERsVHpQQ3l2SmN4clBjMmpnaFNLMVI3MGpsSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769796208),
('i1H8qsV6LFq1JIyJfMxZhJa1aNBEypdetZKF5C7p', NULL, '91.196.152.87', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNktVYWdzNGI1b2dEM0ZIRVVWaHJycks3eVJESnZVSzNKcUJxZktFSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly9iZWF1dHktb2YtbW9yb2Njby5lZHUtbG9nLmNvbS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1769795469),
('IkXy4l0hxpogX5DK2QUf7mYPDoNtfyuwPLbb1iGk', NULL, '91.231.89.39', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUzdWOWpUNFJpUW1zQmtQZFlpT1Y4Z1Z6OENtN2p3SG5wcDVvY3pMbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly93d3cuYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769794489),
('j48z4MTmZagiYiDeCqEQvbnUqrFk8p4VbUyBnq4H', NULL, '103.4.250.182', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVDVuUFhoVXE2MGt6TW9mUkFGSjdQQWpiYnlVdWR4alM5TFptU3pYUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769797498),
('JtnleeHCOsRwoV9X7jJDYid5eREcdQ6TN5muW14e', NULL, '91.231.89.37', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOXVzaFNsSExjYzdGcFYzNlRXdFZsaE9ZUEJIQVd1U21uRG96b1IySCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly93d3cuYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769795668),
('jzAB60LWsHYdVU1tvJdDUZBRidNtsRoap7NlPvPQ', 1, '119.73.96.156', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiOHJJb3JSRWczNXROdFBWUTI4cUtuMVZ1clE5UnAzcUFucTJxc0VpWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHBzOi8vYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20vcHJpdmFjeS1wb2xpY3kiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1769678158),
('K2ryI0hfJQNSFcxOPLZOUNIiE4HURQuRgfgsYTfO', NULL, '93.158.127.79', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNXpGMjAySWtYZlZuc054WWc0aVZPNlNNdm1IbW5ONkVrWFFrSFFZZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly9iZWF1dHktb2YtbW9yb2Njby5lZHUtbG9nLmNvbS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1769523137),
('k3qduM04Wr7VnphOpkqphbRZjOIXEbaQlA1XZSRU', NULL, '45.185.226.168', 'Go-http-client/1.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3JWZWZSdTN2WnA1NUE3dkxpU3RQaFdDZWdsRms1Q1hWamNwcFdudCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vd3d3LmJlYXV0eS1vZi1tb3JvY2NvLmVkdS1sb2cuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769793224),
('KrzRbfu0wcXDAyLnmqcEMkpqbbfI3cKuIS7QCyDZ', NULL, '188.166.108.93', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS084YzBGRFB2MmFUWlFQZDBvd25TbFB0U3M1ZmRxbHB3eWVZSzloYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769793059),
('lEFcPbXPqhaAOpbkGZGOIGgDmt5BOhW5VU0hsmSb', NULL, '103.4.250.182', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmFmd1RQZWZuV0hqWUNOSnViSHQ4TldBZjUyaDFrSmhWd292UlhHbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769797529),
('Lp7sUAlMSd7qwFjnvJ72yObhlkANrbjQvKWHoGoe', NULL, '143.198.63.143', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibE9NUk1YSnhWZ1JqU1QwUmM5Wms1YlE2ajBDMTJ4SG1QOEVBbTRIcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly93d3cuYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769573771),
('lw6NznMs0noscrTGootwMyAssJC1cVmO3t48qPGe', NULL, '178.128.207.138', 'Mozilla/5.0 (l9scan/2.0.9313e2932323e2035323e2239313; +https://leakix.net)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0pmN3l1R1EzWVZOeVk1Tk9MMklNU0tGMUZ4RVlmMmFUR1E1dm9DZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9iZWF1dHktb2YtbW9yb2Njby5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1769793059),
('lyfaE0q7sjRCvnHbr44wsTz9rvtkxFH3fvfb3S9c', NULL, '91.231.89.122', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib2FNcFowV1gySE1GYUlIc1NHZ3RRQWFUUnI0M1BWZlJlSFNmNXN6UyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9iZWF1dHktb2YtbW9yb2Njby5lZHUtbG9nLmNvbS9mb3Jnb3QtcGFzc3dvcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769796156),
('nhic7AgGzz0bWofAmBsq2rzuJxUSLlTJm0zvdjWL', NULL, '40.117.125.130', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNk9wVDhzb0hNTEJQcVpTWjhlZG9FQWxGVDZCU2drMDhsbkdKNUxWYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769516668),
('nhNqU0zPLB2ARG5AbWJGzzf8dJnnTD1yTu9653yL', NULL, '188.166.108.93', 'Mozilla/5.0 (l9scan/2.0.9313e2932323e2035323e2239313; +https://leakix.net)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic1R3UjlKYmMyZThWN1hDWmM5c0RIYlZHNTZYcTY5NG5URTdib2RpWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHBzOi8vYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20vP3Jlc3Rfcm91dGU9JTJGd3AlMkZ2MiUyRnVzZXJzJTJGIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769793090),
('oEkjohNRxeKdEzqLFnoNgSMQUvkd3gtaXxvEqlTq', NULL, '104.164.126.158', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkRZWmlLUm5nY2xKMjZVZ0NzNnZoaWVDYUhURFgzcnJLN3FoaUVCUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769793366),
('PbfBrBhuhNs8oyqtKv4Wq83tCV36sVoxeTn9Iaxd', NULL, '146.70.185.32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiOFU1b1BqU004dXRUTXNuTEhhMFhvWDhEY0IzeUdwS0liT2VIZzdWUyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769778953),
('PEmw8j9IHCJgjoozblerChv53YaVmsAEFjIHUwrk', NULL, '159.89.127.165', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYkZpT1Y1OUEzMms0akFMdVY5SXNsRVRsNEVOcVJOVTlJRXZHckRRZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly93d3cuYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769793059),
('pLng2mLe9hiwnAtQ4mYWCyMFaaINGyyn2VYdhfrX', NULL, '119.73.96.156', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiazBGYVJOVTlzczRkTXNJbHZ4N21PUjhTdURib0hJV3ZPMWpkaTQxZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHBzOi8vYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20vcHJpdmFjeS1wb2xpY3kiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769678189),
('PmuNaf9FVQfQxdiybb3sf2TDBsKn4Pw5YzdGF2CY', NULL, '40.117.125.130', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVEN4SlpXck4wTjVGdmxISmdqeUtxcXJOSE1QQTRNM09iVkVvTTNjbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHBzOi8vYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20vaW5kZXgucGhwL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769516668),
('qImDJ5gmn5FbtH0z3lqUThNMnPP1fd30Wbg1Y4NL', NULL, '74.7.227.12', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiODRBNDVENzBiWnkxeDZLWXVsb3NyMXBnZDM4MzlEZElLZTlIeGlKTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDc6Imh0dHBzOi8vd3d3LmJlYXV0eS1vZi1tb3JvY2NvLmVkdS1sb2cuY29tL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769766405),
('R3q9vz3xrUFUljIc3GShvTudVV8UfFqVKZte2Qxf', NULL, '104.164.126.158', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUkhsWGZwM3dNNG1aRHhkTVRjdlEyT3JXWUlEZW1Ha3JPM081N2ZLbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769793345),
('r4GPqPmVm96lBf3WfZf26gPsyvVsAGizovfETMBZ', NULL, '205.169.39.168', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicHZJeWptU25qYlZNVTRtVVNPdTFIOE1DZmVMdXE1VWh3Q0h2TzNBQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly9iZWF1dHktb2YtbW9yb2Njby5lZHUtbG9nLmNvbS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1769793149),
('ROWseQFVBvvUIhkh5KQvpp7f9snVrinOsa93qzUu', NULL, '34.34.21.42', 'Scrapy/2.13.4 (+https://scrapy.org)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMEh3MDloMXJ4OENXQ3F2YmdQM2FVcVludTBtOGVSV0pkQjgxaUZIcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769645488),
('S6fT0zcoqFUCwgNjPMF4gJwmVeETxtOaZeJo0Mn6', NULL, '91.231.89.122', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUjVYS042a3V6c0UxaFp4RUtXUFJzY0V6TWdpaHQxTFZ4NEpnekNnSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly9iZWF1dHktb2YtbW9yb2Njby5lZHUtbG9nLmNvbS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1769795750),
('touZA2Kb2jK3uOtzQpI9RixxJ37BwXMLMCl7a4zZ', NULL, '146.70.185.32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYjFPb2NmeVdSR2VMTlMxaVJtdkhhTjJtSVQwYlZjQ3ZTcHMyNlFpbSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769778952),
('U94xuJ6hGXk6aTtRQkt2meoZmGqauEig8HrJdvHw', NULL, '91.231.89.39', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkRkNkZBMFl1SFB3MmllbWNYWkF1bjJwWjF2U1FOMDJ0TFZOMFlKViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly9iZWF1dHktb2YtbW9yb2Njby5lZHUtbG9nLmNvbS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1769796217),
('V4IqDc8kicf2TbbJm0e23T0uJvMu65PoC8u9RzNB', NULL, '178.128.207.138', 'Mozilla/5.0 (l9scan/2.0.9313e2932323e2035323e2239313; +https://leakix.net)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmVva3M4WHp3S1dhb2R5SE5ZTHgzSlA3Z3Y1RTNSdlp0QU85a00yUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzA6Imh0dHA6Ly9iZWF1dHktb2YtbW9yb2Njby5lZHUtbG9nLmNvbS8/cmVzdF9yb3V0ZT0lMkZ3cCUyRnYyJTJGdXNlcnMlMkYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769793090),
('W4m5RH5O9ihd1KeLRBzhq3b7vUGFUTjqMo2Vhunl', NULL, '188.166.108.93', 'Mozilla/5.0 (l9scan/2.0.9313e2932323e2035323e2239313; +https://leakix.net)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWE02d2lGZkNJNEhOTHN2MnE1a3M4eGFZTzNsOUNkVVZ3VEprN0ZPQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769793059),
('Wk8W4gGbvfBc37ARkbInvZbRQQmZc1qiyXwRwhif', NULL, '91.231.89.127', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNng3dnVQN3pSenJUbVd6NVBPNWRoN1lxZVhVenM4UmI3b0llakZzcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9iZWF1dHktb2YtbW9yb2Njby5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1769795089),
('wut85jTJVa2ZPQN7CNBXHeH9EdbJ5qKU0I12kS7x', 1, '119.73.96.156', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoianJFQ2tCeDlzcXRwRkFQaWtFcXVuM1hkbXhpTDBodmQ0M1pQZEt3OCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHBzOi8vYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20vYWRtaW4vaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1769675586),
('xaCixNNGGBSTjCR8a286ReOYGGlc4upD2QH0dZRd', NULL, '40.117.125.130', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ05CZ0dvSFVIZElWRnUxRHNVOWlFejllREFXRThXR2FUUmpoVnJoUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769516668),
('XDDkbpS4V1KpfdlTbxHEEuUxCEI4Qgg7AdpoYQHN', NULL, '159.89.127.165', 'Mozilla/5.0 (l9scan/2.0.9313e2932323e2035323e2239313; +https://leakix.net)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRTdUdzBTUHRrZHlPQWxKQnhFbTR0WUh5b0F6MDlGSTU3dHVpWktuRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly93d3cuYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769793059),
('xotoCPDJSpviEQgmzPdOjAzTcOOYAo70XX2gpVx2', NULL, '45.133.173.85', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUnlCbUVOVnpuRzRHOE5SS0hYUmxFV0czMXhjSHkwS3kwcDdyVnJwSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vd3d3LmJlYXV0eS1vZi1tb3JvY2NvLmVkdS1sb2cuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769793315),
('xsJTgOximNddWrfoQPw1QRdlmLeW5BzV0JNw4Lps', NULL, '141.138.208.43', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicjNBbmlaUDN0SmtDRlZ6YnZUY2luVzBoVzNkd216VVVuUzY3V1FWVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9iZWF1dHktb2YtbW9yb2Njby5lZHUtbG9nLmNvbS9mb3Jnb3QtcGFzc3dvcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769523137),
('xWF5KlLmOsMjNYRM5SIfnoVNu5Ibc9f07c0RjFi4', NULL, '133.242.174.119', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMW14MUpWcXVFZ0VwemY2cGdPREdacVY2N01EZFViVEZiSTAweUJ1UCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDc6Imh0dHBzOi8vd3d3LmJlYXV0eS1vZi1tb3JvY2NvLmVkdS1sb2cuY29tL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769815854),
('y5bBNkGo422kJxlPwFvVSNBKTG0JADTgAirWcDsa', NULL, '45.185.226.168', 'Go-http-client/1.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic3dEbElMaDZxdWRHNTZvYnJPeVVWVGxVRDBIRHNGVkN2OVJSempwSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769793224),
('y9FSj0fxPUThTtIKNu4bkPBVfeOqcB3FNjPKCq7F', NULL, '103.4.251.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN01VNjVGdklQZEhWRmxVbk9CZVNXOHJIOTRIcnV5dDFPSkdwWUpQRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769796202),
('ysrdRMDDnoK625jDsMFAy58uZqmzFpXpoAiS5w7B', NULL, '93.158.127.79', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:123.0) Gecko/20100101 Firefox/123', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicG1Da1BsVTlFeTgwaFRyYUVuNlgzU1RQRDdoZmliTTN1aU03ZDRFOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9iZWF1dHktb2YtbW9yb2Njby5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1769523137),
('YZfOnqDsXVkxtnH9VKvvBWRaY2P8SaqR4PFnrIwN', NULL, '128.140.1.194', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVk1CbXd0VGd2TlZ4dmtiT0w2SG40OTZFZnY3amJHc2FGZVlEdGhyVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzM6Imh0dHBzOi8vd3d3LmJlYXV0eS1vZi1tb3JvY2NvLmVkdS1sb2cuY29tL2luZGV4LnBocD9yb3V0ZT1jaGVja291dCUyRmNhcnQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1769564451),
('Z2JZD2IzKDChIXnYOzEloDJHII6AiNzuVciVGFqC', NULL, '205.169.39.168', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUjhLTEt4dTVWQ0pZNzBDdk1NWHdYQjJYT0RYM0dQWFZ4eTQ4WUttbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly9iZWF1dHktb2YtbW9yb2Njby5lZHUtbG9nLmNvbS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1769793137),
('ZbPmaCuVdEpS6QzA7iz0GtpHjU2P72UrD7kOj9Mb', NULL, '128.140.1.194', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicXJiSVdaSUNNTXlKWlFsU3c5VmVpa2RGSUFzamF6UWo5SmxiT2d5UCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vd3d3LmJlYXV0eS1vZi1tb3JvY2NvLmVkdS1sb2cuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769564450),
('ZRtEGCILd5kCpq6506Z6lHKCRMvvEcyJMThZ2nP2', NULL, '91.231.89.35', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVnZ0Rk5kVWlWZXEyMWxCT200SFdidGNrajdobXFhRUNTVTZHZ2pDNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHA6Ly93d3cuYmVhdXR5LW9mLW1vcm9jY28uZWR1LWxvZy5jb20vZm9yZ290LXBhc3N3b3JkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769795972),
('ZXhWbRnIxuJpe7BU707Dq1HibDrnkt7uZd4fSp2c', NULL, '128.140.1.194', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUlXbHhsZG5DTmp3MldJb0RzOGhmU0xqcnNUVXlLOEg1a0lXZTU3bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHBzOi8vd3d3LmJlYXV0eS1vZi1tb3JvY2NvLmVkdS1sb2cuY29tL2luZGV4LnBocC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1769564451);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` tinyint(4) DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `user_type`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$12$c89aG.iBpTJWTOrIlzezCucgWR/91w8mJek9wfA65dOunH6/68laa', 2, NULL, '2025-10-04 17:06:11', '2025-10-04 17:06:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `missing_products`
--
ALTER TABLE `missing_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `missing_products_created_by_foreign` (`created_by`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

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
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `missing_products`
--
ALTER TABLE `missing_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `missing_products`
--
ALTER TABLE `missing_products`
  ADD CONSTRAINT `missing_products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
