-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 10, 2026 at 06:31 PM
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
-- Database: `edulog_thc_telehealth`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `patient_intake_id` bigint(20) UNSIGNED DEFAULT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` varchar(255) NOT NULL,
  `consultation_type` enum('online','clinic') NOT NULL,
  `status` enum('pending','approved','completed','cancelled') NOT NULL DEFAULT 'pending',
  `fee` decimal(8,2) DEFAULT NULL,
  `payment_status` enum('unpaid','paid') NOT NULL DEFAULT 'unpaid',
  `meeting_link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `jupiter_meeting_id` varchar(255) DEFAULT NULL,
  `doctor_join_url` text DEFAULT NULL,
  `patient_join_url` text DEFAULT NULL,
  `meeting_start_time` datetime DEFAULT NULL,
  `meeting_end_time` datetime DEFAULT NULL,
  `meeting_status` varchar(255) NOT NULL DEFAULT 'scheduled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `doctor_id`, `patient_id`, `patient_intake_id`, `appointment_date`, `appointment_time`, `consultation_type`, `status`, `fee`, `payment_status`, `meeting_link`, `created_at`, `updated_at`, `jupiter_meeting_id`, `doctor_join_url`, `patient_join_url`, `meeting_start_time`, `meeting_end_time`, `meeting_status`) VALUES
(2, 15, 13, 84, '2025-11-10', '3:00 PM', 'clinic', 'approved', NULL, 'unpaid', NULL, '2025-11-06 09:58:40', '2025-11-08 09:43:44', NULL, NULL, NULL, NULL, NULL, 'scheduled'),
(3, 15, 13, 84, '2025-11-10', '1:30 PM', 'online', 'completed', NULL, 'unpaid', 'https://meet.jit.si/Dr15_Pat13_1762526096', '2025-11-06 09:59:16', '2025-11-21 12:25:41', NULL, NULL, NULL, NULL, NULL, 'scheduled'),
(4, 15, 13, 84, '2025-11-10', '7:30 PM', 'clinic', 'approved', NULL, 'unpaid', 'https://meet.jit.si/Dr15_Pat13_App4#config.prejoinPageEnabled=false&config.requireModerator=false', '2025-11-06 09:59:28', '2025-11-08 10:02:31', NULL, NULL, NULL, NULL, NULL, 'scheduled'),
(5, 15, 13, 84, '2025-11-10', '7:30 PM', 'clinic', 'pending', NULL, 'unpaid', NULL, '2025-11-06 09:59:32', '2025-11-06 09:59:32', NULL, NULL, NULL, NULL, NULL, 'scheduled'),
(6, 15, 13, 84, '2025-11-10', '7:30 PM', 'clinic', 'pending', NULL, 'unpaid', NULL, '2025-11-06 09:59:34', '2025-11-06 09:59:34', NULL, NULL, NULL, NULL, NULL, 'scheduled'),
(7, 15, 13, 84, '2025-11-10', '3:30 PM', 'clinic', 'pending', NULL, 'unpaid', NULL, '2025-11-06 09:59:46', '2025-11-06 09:59:46', NULL, NULL, NULL, NULL, NULL, 'scheduled'),
(8, 15, 13, 84, '2025-11-10', '3:30 PM', 'clinic', 'pending', NULL, 'unpaid', NULL, '2025-11-06 10:25:28', '2025-11-06 10:25:28', NULL, NULL, NULL, NULL, NULL, 'scheduled'),
(9, 15, 13, 84, '2025-11-12', '8:00 PM', 'online', 'approved', NULL, 'unpaid', 'https://meet.jit.si/Dr15_Pat13_1762527211', '2025-11-06 10:38:28', '2025-11-08 10:01:35', NULL, NULL, NULL, NULL, NULL, 'scheduled'),
(10, 1, 13, 85, '2025-11-20', '8:20 PM', 'online', 'pending', NULL, 'unpaid', NULL, '2025-11-06 15:21:45', '2025-11-06 15:21:45', NULL, NULL, NULL, NULL, NULL, 'scheduled'),
(11, 11, 14, 91, '2025-11-11', '11:22 PM', 'online', 'approved', NULL, 'unpaid', 'https://meet.jit.si/Dr11_Pat14_1762527431', '2025-11-06 16:26:48', '2025-11-07 14:57:11', NULL, NULL, NULL, NULL, NULL, 'scheduled'),
(12, 15, 6, 91, '2025-11-13', '6:05 PM', 'online', 'approved', NULL, 'unpaid', 'https://meet.jit.si/Dr15_Pat6_1762586685', '2025-11-08 07:24:26', '2025-11-08 08:34:16', NULL, NULL, NULL, NULL, NULL, 'scheduled'),
(13, 15, 6, 92, '2025-11-13', '7:35 PM', 'online', 'approved', NULL, 'unpaid', 'https://meet.jit.si/dr15_pat6_1762589002_Oe7CRA#config.prejoinPageEnabled=false', '2025-11-08 07:57:18', '2025-11-08 08:35:50', NULL, NULL, NULL, NULL, NULL, 'scheduled'),
(16, 10, 17, 96, '2025-11-10', '7:08 AM', 'online', 'pending', NULL, 'unpaid', NULL, '2025-11-10 11:37:54', '2025-11-10 11:37:54', NULL, NULL, NULL, NULL, NULL, 'scheduled'),
(17, 10, 15, 95, '2025-11-10', '7:08 AM', 'online', 'pending', NULL, 'unpaid', NULL, '2025-11-10 11:38:07', '2025-11-10 11:38:07', NULL, NULL, NULL, NULL, NULL, 'scheduled'),
(18, 10, 17, 96, '2025-11-11', '6:00 PM', 'clinic', 'pending', NULL, 'unpaid', NULL, '2025-11-10 12:09:15', '2025-11-10 12:09:15', NULL, NULL, NULL, NULL, NULL, 'scheduled'),
(19, 10, 15, 95, '2025-11-10', '7:38 AM', 'clinic', 'pending', NULL, 'unpaid', NULL, '2025-11-10 12:38:50', '2025-11-10 12:38:50', NULL, NULL, NULL, NULL, NULL, 'scheduled'),
(20, 11, 14, 102, '2025-11-04', '11:22 PM', 'online', 'completed', NULL, 'unpaid', 'https://meet.jit.si/Dr11_Pat14_App20#config.prejoinPageEnabled=false&config.requireModerator=false', '2025-11-10 15:02:20', '2025-11-10 15:26:18', NULL, NULL, NULL, NULL, NULL, 'scheduled'),
(21, 11, 14, 103, '2025-11-18', '11:22 PM', 'online', 'pending', NULL, 'unpaid', NULL, '2025-11-10 15:05:19', '2025-11-10 15:05:19', NULL, NULL, NULL, NULL, NULL, 'scheduled'),
(22, 16, 19, 104, '2025-11-11', '1:00 PM', 'online', 'approved', NULL, 'unpaid', 'https://meet.jit.si/Dr16_Pat19_App22#config.prejoinPageEnabled=false&config.requireModerator=false', '2025-11-11 08:30:33', '2025-11-11 10:08:41', NULL, NULL, NULL, NULL, NULL, 'scheduled'),
(23, 15, 19, 105, '2025-11-12', '7:30 PM', 'clinic', 'pending', NULL, 'unpaid', NULL, '2025-11-13 10:43:19', '2025-11-13 10:43:19', NULL, NULL, NULL, NULL, NULL, 'scheduled'),
(24, 15, 19, 108, '2025-11-13', '6:35 PM', 'online', 'completed', NULL, 'unpaid', 'https://meet.jit.si/Dr15_Pat19_App24#config.prejoinPageEnabled=false&config.requireModerator=false', '2025-11-13 12:43:25', '2025-11-24 12:28:36', NULL, NULL, NULL, NULL, NULL, 'scheduled'),
(25, 6, 19, 110, '2025-11-18', '5:50 PM', 'online', 'approved', NULL, 'unpaid', 'https://meet.jit.si/Dr6_Pat19_App25#config.prejoinPageEnabled=false&config.requireModerator=false', '2025-11-13 13:51:42', '2025-11-13 13:52:21', NULL, NULL, NULL, NULL, NULL, 'scheduled'),
(26, 6, 19, 111, '2025-11-14', '6:00 PM', 'online', 'approved', NULL, 'unpaid', 'https://meet.jit.si/Dr6_Pat19_App26#config.prejoinPageEnabled=false&config.requireModerator=false', '2025-11-13 14:58:09', '2025-11-13 14:58:56', NULL, NULL, NULL, NULL, NULL, 'scheduled'),
(50, 15, 19, 123, '2025-11-20', '6:05 PM', 'online', 'approved', NULL, 'unpaid', 'https://meet.jit.si/Dr15_Pat19_App50#config.prejoinPageEnabled=false&config.requireModerator=false', '2025-11-20 13:38:48', '2025-11-24 12:18:02', NULL, NULL, NULL, NULL, NULL, 'scheduled'),
(51, 15, 19, 123, '2025-11-20', '6:05 PM', 'online', 'approved', NULL, 'unpaid', 'https://fake-jupitermeet.test/meetings/Jupiter_App_51', '2025-11-20 13:42:01', '2025-11-24 12:19:51', NULL, NULL, NULL, NULL, NULL, 'scheduled'),
(52, 15, 8, 124, '2025-12-14', '5:21 PM', 'online', 'pending', NULL, 'unpaid', NULL, '2025-12-12 15:43:47', '2025-12-12 15:43:47', NULL, NULL, NULL, NULL, NULL, 'scheduled'),
(53, 24, 19, 125, '2025-12-15', '1:06 PM', 'online', 'approved', NULL, 'unpaid', 'https://meet.jit.si/Dr24_Pat19_App53#config.prejoinPageEnabled=false&config.requireModerator=false', '2025-12-12 16:10:25', '2025-12-12 16:11:32', NULL, NULL, NULL, NULL, NULL, 'scheduled');

-- --------------------------------------------------------

--
-- Table structure for table `appointment_notes`
--

CREATE TABLE `appointment_notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `appointment_id` bigint(20) UNSIGNED NOT NULL,
  `diagnosis` text DEFAULT NULL,
  `treatment_plan` text DEFAULT NULL,
  `follow_up` text DEFAULT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointment_notes`
--

INSERT INTO `appointment_notes` (`id`, `appointment_id`, `diagnosis`, `treatment_plan`, `follow_up`, `doctor_id`, `created_at`, `updated_at`) VALUES
(19, 12, 'pehla dia email dekho ayi', 'pehla treat hiashdamsd', 'd', 15, '2025-11-12 10:18:36', '2025-11-12 11:20:48'),
(20, 13, 'bilal dosra', NULL, NULL, 15, '2025-11-12 10:18:59', '2025-11-12 10:18:59'),
(21, 12, 'pehla dia email dekho ayi', 'pehla treat', 'd', 15, '2025-11-12 11:02:12', '2025-11-12 11:02:12'),
(22, 2, 'dfdfd', 'df', NULL, 15, '2025-11-12 11:21:07', '2025-11-21 12:34:37'),
(23, 24, 'owais join ho gya tha 5:50 pr', 'kuch bhi treatment follow lkrlo', 'sdfdsf', 15, '2025-11-13 12:49:18', '2025-11-13 12:50:06'),
(24, 25, 'patient is having spinal injury, may cause complication in delivery', 'medicine plus physio therapy in connection of relevant gynaecologist', 'next week same day , same time', 6, '2025-11-13 13:55:30', '2025-11-13 13:56:52'),
(25, 26, 'patient is having spinal injury, may cause complication in delivery', 'medicine plus physio therapy in connection of relevant gynaecologist', 'next week same day , same time', 6, '2025-11-13 15:00:24', '2025-11-13 15:01:17'),
(26, 53, 'hegghfhg', 'hgfhkfhfh', 'gkyghvh', 24, '2025-12-12 16:13:01', '2025-12-12 16:13:09');

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
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `specialization_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `specialization_id`, `created_at`, `updated_at`) VALUES
(2, 'Cardiology Department', 3, '2025-11-12 14:53:59', '2025-11-12 14:53:59'),
(3, 'Dermatology Department', 4, '2025-11-12 14:54:40', '2025-11-12 14:54:40'),
(4, 'Radiology Department', 5, '2025-11-12 14:55:08', '2025-11-12 14:55:08'),
(5, 'Anticoagulation Department', 6, '2025-11-12 14:55:34', '2025-11-12 14:55:34'),
(6, 'Department of Breast Surgery', 7, '2025-11-12 14:56:19', '2025-11-12 14:56:19'),
(11, 'Dental Department', 1, '2025-11-13 08:24:30', '2025-11-13 08:24:30'),
(12, 'Clinical Biochemistry', 9, '2025-11-13 08:30:43', '2025-11-13 08:30:43'),
(13, 'Department of Nephrology', 10, '2025-11-13 08:33:25', '2025-11-13 08:33:25'),
(14, 'Neurology Department', 11, '2025-11-13 08:34:10', '2025-11-13 08:34:10'),
(15, 'Oncology Department', 12, '2025-11-13 08:34:45', '2025-11-13 08:34:45'),
(16, 'Department of Orthopedic Surgery', 13, '2025-11-13 08:35:40', '2025-11-13 08:35:40'),
(17, 'Psychiatry Department', 14, '2025-11-13 08:36:29', '2025-11-13 08:36:29'),
(18, 'Family Medicine Department', 15, '2025-11-13 08:37:10', '2025-11-13 08:37:10'),
(19, 'Health & fitness Department', 16, '2025-11-13 08:37:40', '2025-11-13 08:37:40'),
(20, 'Hematology Department', 17, '2025-11-13 08:37:57', '2025-11-13 08:37:57'),
(21, 'Gynaecology Department', 18, '2025-11-13 08:38:14', '2025-11-13 08:38:14'),
(22, 'Opthalmology Department', 19, '2025-11-13 08:38:40', '2025-11-13 08:38:40'),
(23, 'Padiatrician Department', 20, '2025-11-13 08:39:06', '2025-11-13 08:39:59'),
(24, 'Thoracic Surgery Department', 21, '2025-11-13 08:40:30', '2025-11-13 08:40:30'),
(25, 'Pulmonology Department', 22, '2025-11-13 08:40:51', '2025-11-13 08:40:51'),
(26, 'Gastroenterology Department', 23, '2025-11-13 08:42:55', '2025-11-13 08:42:55'),
(27, 'Urology Department', 24, '2025-11-13 08:43:25', '2025-11-13 08:43:25'),
(28, 'Allergy Department', 25, '2025-11-13 08:44:50', '2025-11-13 08:44:50'),
(29, 'Rheumatology Department', 26, '2025-11-13 08:45:11', '2025-11-13 08:45:11'),
(30, 'Neurosurgery Department', 27, '2025-11-13 08:45:43', '2025-11-13 08:45:43'),
(31, 'ENT Department', 28, '2025-11-13 08:45:58', '2025-11-13 08:45:58'),
(32, 'Department of Emergency Medicine', 29, '2025-11-13 08:46:47', '2025-11-13 08:46:47'),
(33, 'Family Medicine Department', 30, '2025-11-13 08:48:42', '2025-11-13 08:48:42'),
(34, 'Department of Orthopedic', 31, '2025-11-13 08:49:59', '2025-11-13 08:49:59'),
(35, 'Hematology Department', 32, '2025-11-13 08:50:22', '2025-11-13 08:50:22'),
(36, 'Infection Control Unit', 33, '2025-11-13 08:51:10', '2025-11-13 08:51:10'),
(37, 'Department of Critical Care', 34, '2025-11-13 08:52:13', '2025-11-13 08:52:13'),
(38, 'Family Medicine Department', 35, '2025-11-13 08:55:23', '2025-11-13 08:55:23'),
(39, 'cardiothoracic Department', 8, '2025-11-13 09:21:22', '2025-11-13 09:21:22');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `specialization` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `hospital_name` varchar(255) DEFAULT NULL,
  `fee` int(11) DEFAULT NULL,
  `experience_years` int(11) DEFAULT NULL,
  `available_days` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `available_time_start` time DEFAULT NULL,
  `available_time_end` time DEFAULT NULL,
  `online_available` tinyint(1) DEFAULT 1,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `user_id`, `profile_image`, `gender`, `phone`, `address`, `qualification`, `specialization`, `department`, `hospital_name`, `fee`, `experience_years`, `available_days`, `available_time_start`, `available_time_end`, `online_available`, `status`, `is_approved`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 9, '1761219248_WhatsApp Image 2025-10-13 at 8.28.00 PM.jpeg', 'Male', '03162881956', 'karachi', 'MBBS', 'General Physician', 'General Medicine / OPD', 'Agha Khan Hospital', NULL, 2, '[\"Monday\",\"Tuesday\",\"Wednesday\"]', '12:00:00', '14:00:00', 1, 'Active', 1, NULL, '2025-10-23 06:34:08', '2025-10-23 06:34:08'),
(2, 10, '1761219686_logo.jpeg', 'Female', '03162881956', 'karachi', 'BDS', 'Cardiologist', 'Cardiology Department', 'Agha Khan Hospital', NULL, 5, '[\"Friday\",\"Saturday\",\"Sunday\"]', '16:41:00', '18:41:00', 1, 'Active', 1, NULL, '2025-10-23 06:41:27', '2025-10-29 09:02:51'),
(3, 11, '1761220057_logo-removebg-preview.png', 'Male', '03162881956', 'karachi', 'PhD', 'Nephrologist', 'Urology Department', 'Agha Khan Hospital', NULL, 5, '[\"Thursday\",\"Friday\"]', '16:47:00', '19:47:00', 1, 'Active', 0, NULL, '2025-10-23 06:47:37', '2025-10-24 05:40:36'),
(4, 17, '1761318444_g.PNG', 'Male', '03169699622', 'Iusto proident perf', 'MS', 'Pulmonologist', 'Orthopedic Specialist', 'Phyllis Summers', NULL, 2, '[\"Monday\",\"Tuesday\",\"Wednesday\"]', '20:07:00', '23:07:00', 1, 'Active', 1, NULL, '2025-10-24 10:07:24', '2025-10-24 10:08:24'),
(5, 19, '1761554941_logo-removebg-preview.png', 'Male', '2555532241', 'Nesciunt magnam cup', 'MBBS', 'Cardiologist', 'Cardiology Department', 'TaShya Cain', NULL, 19, '[\"Wednesday\",\"Thursday\",\"Friday\"]', '03:29:00', '06:56:00', 1, 'Active', 0, NULL, '2025-10-27 03:49:01', '2025-10-27 03:49:01'),
(6, 20, '1761578610_logo-removebg-preview.png', 'Male', '456294088531', 'Eum distinctio Null', 'BDS', 'Orthopedic Specialist', 'Orthopedic Specialist', 'Jael Stafford', NULL, 1974, '[\"Wednesday\"]', '11:13:00', '09:13:00', 1, 'Active', 1, NULL, '2025-10-27 10:23:30', '2025-11-13 13:39:00'),
(7, 21, '1761578802_logo-removebg-preview.png', 'Female', '6859549588', 'Irure minim in dolor', 'MBBS', 'Cardiologist', 'Gynecology Department', 'Micah Thomas', NULL, 2, '[\"Tuesday\",\"Wednesday\"]', '21:26:00', '20:28:00', 1, 'Active', 1, NULL, '2025-10-27 10:26:42', '2025-10-27 10:27:25'),
(8, 24, '1761907294_g.PNG', 'Male', '13414032037', 'Porro esse voluptas', 'FCPS', 'Neurologist', 'Neurologist', 'Lyle Burch', NULL, 1985, '[\"Tuesday\",\"Wednesday\",\"Thursday\",\"Saturday\",\"Sunday\"]', '15:25:00', '08:14:00', 1, 'Active', 1, NULL, '2025-10-31 10:41:34', '2025-11-03 07:58:50'),
(9, 25, '1761911297_code3.PNG', 'Female', '14586472535', 'Ullamco est laudant', 'MD', 'ENT Specialist', 'ENT Department', 'Medge Hardin', NULL, 1976, '[\"Friday\",\"Sunday\"]', '06:17:00', '09:42:00', 1, 'Active', 1, NULL, '2025-10-31 11:48:17', '2025-10-31 11:49:19'),
(10, 28, '1761920614_girl.jpg', 'Female', '03164563257', 'sector 11 A , karachi pakistan', 'PhD', 'Gynecologist', 'Gynecology Department', 'Patel Hospital', NULL, 8, '[\"Monday\",\"Tuesday\",\"Thursday\"]', '08:23:00', '22:26:00', 1, 'Active', 1, NULL, '2025-10-31 14:23:34', '2025-11-10 10:17:59'),
(11, 29, '1761922094_dr.jpg', 'Male', '03162451956', 'sector 595', 'DPM', 'Rheumatologist', 'General Medicine / OPD', 'Patel Hospital', NULL, 10, '[\"Wednesday\",\"Thursday\"]', '21:49:00', '22:50:00', 1, 'Active', 1, NULL, '2025-10-31 14:48:14', '2025-11-06 16:17:55'),
(12, 30, '1761922389_dr.jpg', 'Male', '03169666997', 'asd', 'DPM', 'Emergency Physician', 'Psychiatry', 'Medge Hardin', NULL, 9, '[\"Tuesday\",\"Thursday\",\"Friday\"]', '22:54:00', '12:57:00', 1, 'Active', 1, NULL, '2025-10-31 14:53:09', '2025-10-31 14:53:09'),
(13, 31, '1762261263_dr ammar.jpg', 'Male', '03152745674', 'karachi', 'PhD', 'Allergist', 'Cardiology Department', 'liaquat national', NULL, 6, '[\"Monday\",\"Tuesday\"]', '19:02:00', '22:03:00', 1, 'Active', 0, NULL, '2025-11-04 13:01:03', '2025-11-04 13:01:03'),
(14, 32, '1762261520_drs.jpg', 'Female', '03125674568', 'karachi', 'DPM', 'Anticoagulation', 'Dermatology / Skin Department', 'aka hospital', NULL, 3, '[\"Wednesday\",\"Friday\"]', '17:04:00', '20:07:00', 1, 'Active', 0, NULL, '2025-11-04 13:05:20', '2025-11-04 13:05:20'),
(15, 33, '1762261629_dr ammar.jpg', 'Male', '03172856743', 'karachi', 'PhD', 'Orthopedic Specialist', 'Cardiology Department', 'aga khan hospital', NULL, 6, '[\"Wednesday\",\"Friday\"]', '19:08:00', '22:10:00', 1, 'Active', 1, NULL, '2025-11-04 13:07:09', '2025-11-13 12:23:28'),
(16, 42, '1762846821_Capture222.PNG', 'Male', '12345678987', 'rftgyfgdfg', 'DPM', 'Dentist', 'Dentistry Department', 'liaquat hospital', NULL, 10, '[\"Monday\"]', '23:40:00', '13:40:00', 1, 'Active', 1, NULL, '2025-11-11 07:40:21', '2025-11-11 08:12:17'),
(17, 45, '1762950408_Capture222.PNG', 'Male', '09876543212', 'asd', 'PhD', 'Pulmonologist', 'Pediatrics Department', 'Dow Hospital', NULL, 7, NULL, NULL, NULL, 1, 'Active', 1, NULL, '2025-11-12 12:26:48', '2025-11-12 12:47:52'),
(18, 47, '1762951087_Capture222.PNG', 'Male', '13024676847', 'Ut consequatur dolor', 'FCPS', 'Hematology', 'Neurology Department', 'Shelley Woodard', NULL, 2011, NULL, NULL, NULL, 1, 'Active', 0, NULL, '2025-11-12 12:38:07', '2025-11-12 12:50:47'),
(19, 49, '1763026060_Capture222.PNG', 'Male', '09876543214', 'karachi', 'DGO', '23', NULL, 'Dow', NULL, 6, NULL, NULL, NULL, 1, 'Active', 0, NULL, '2025-11-13 09:27:40', '2025-11-13 09:27:40'),
(20, 50, '1763026284_Capture222.PNG', 'Male', '09876543214', 'dfsd', 'DO', '30', NULL, 'Dow', NULL, 6, NULL, NULL, NULL, 1, 'Active', 0, NULL, '2025-11-13 09:31:24', '2025-11-13 09:31:24'),
(21, 51, '1763027156_Capture222.PNG', 'Male', '09876543214', 'karachi', 'MCPS', '28', '31', 'Dow', NULL, 6, NULL, NULL, NULL, 1, 'Active', 0, NULL, '2025-11-13 09:45:56', '2025-11-13 09:45:56'),
(22, 52, '1763027582_Capture222.PNG', 'Male', '09876543214', 'saf', 'DCH', '29', '32', 'Dow', NULL, 6, NULL, NULL, NULL, 1, 'Active', 0, NULL, '2025-11-13 09:53:02', '2025-11-13 09:53:02'),
(23, 53, '1763028040_Capture222.PNG', 'Male', '09876543214', 'ksrsgfhfgh', 'DCH', 'Allergist', 'Allergy Department', 'Dow', NULL, 6, NULL, NULL, NULL, 1, 'Active', 0, NULL, '2025-11-13 10:00:40', '2025-11-13 10:00:40'),
(24, 55, '1765554732_boy.jpg', 'Male', '45646345456456', 'asd', 'BDS', 'Orthopedic specialist', 'Opthalmology Department', 'agha khan', NULL, 11, NULL, NULL, NULL, 1, 'Active', 1, NULL, '2025-12-12 15:52:12', '2025-12-12 16:06:26');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_schedules`
--

CREATE TABLE `doctor_schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('recurring','oneoff') NOT NULL,
  `day_of_week` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') DEFAULT NULL,
  `date` date DEFAULT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `is_available` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor_schedules`
--

INSERT INTO `doctor_schedules` (`id`, `doctor_id`, `type`, `day_of_week`, `date`, `start_time`, `end_time`, `is_available`, `created_at`, `updated_at`) VALUES
(1, 10, 'recurring', 'Monday', NULL, '07:08:00', '21:11:00', 1, '2025-11-03 13:08:24', '2025-11-03 13:08:24'),
(2, 2, 'recurring', 'Monday', NULL, '19:17:00', '20:17:00', 1, '2025-11-03 13:17:41', '2025-11-03 13:17:41'),
(5, 2, 'recurring', NULL, '2025-11-29', '19:53:00', '21:53:00', 1, '2025-11-03 13:53:17', '2025-11-03 13:53:17'),
(6, 2, 'recurring', NULL, '2025-11-20', '12:04:00', '13:04:00', 1, '2025-11-03 14:05:19', '2025-11-03 14:05:19'),
(7, 2, 'recurring', NULL, '2025-11-19', '20:07:00', '22:07:00', 1, '2025-11-03 14:07:06', '2025-11-03 14:07:06'),
(8, 2, 'recurring', 'Sunday', NULL, '20:07:00', '22:07:00', 1, '2025-11-03 14:10:10', '2025-11-03 14:52:15'),
(9, 2, 'recurring', 'Saturday', NULL, '20:07:00', '22:07:00', 1, '2025-11-03 14:10:27', '2025-11-03 14:52:04'),
(10, 2, 'oneoff', NULL, '2025-11-20', '20:10:00', '23:10:00', 1, '2025-11-03 14:10:49', '2025-11-03 14:10:49'),
(11, 2, 'oneoff', NULL, '2025-11-04', '12:11:00', '13:11:00', 1, '2025-11-03 14:11:49', '2025-11-03 14:11:49'),
(12, 2, 'recurring', 'Tuesday', NULL, '20:12:00', '21:12:00', 1, '2025-11-03 14:12:14', '2025-11-03 14:12:14'),
(13, 2, 'recurring', 'Monday', NULL, '07:14:00', '09:14:00', 1, '2025-11-03 14:14:56', '2025-11-03 14:14:56'),
(14, 2, 'recurring', 'Wednesday', NULL, '08:15:00', '11:15:00', 1, '2025-11-03 14:16:22', '2025-11-03 14:16:22'),
(15, 15, 'recurring', 'Monday', NULL, '12:00:00', '21:00:00', 1, '2025-11-05 09:12:36', '2025-11-05 09:12:36'),
(16, 15, 'recurring', 'Wednesday', NULL, '18:30:00', '20:30:00', 1, '2025-11-05 12:23:40', '2025-11-05 12:23:40'),
(18, 1, 'recurring', 'Thursday', NULL, '20:20:00', '22:20:00', 1, '2025-11-06 15:20:44', '2025-11-06 15:20:44'),
(19, 11, 'recurring', 'Tuesday', NULL, '23:22:00', '23:24:00', 1, '2025-11-06 16:22:22', '2025-11-06 16:22:22'),
(20, 11, 'oneoff', NULL, '2025-11-21', '12:24:00', '14:24:00', 1, '2025-11-06 16:24:10', '2025-11-06 16:24:10'),
(21, 15, 'recurring', 'Thursday', NULL, '18:05:00', '20:05:00', 1, '2025-11-07 13:05:46', '2025-11-07 13:05:46'),
(22, 15, 'oneoff', NULL, '2025-11-30', '16:06:00', '18:06:00', 1, '2025-11-07 13:06:20', '2025-11-07 13:06:20'),
(23, 10, 'recurring', 'Tuesday', NULL, '18:00:00', '20:00:00', 1, '2025-11-10 10:18:53', '2025-11-10 10:18:53'),
(24, 10, 'oneoff', NULL, '2025-11-12', '15:00:00', '18:00:00', 1, '2025-11-10 10:34:29', '2025-11-10 10:34:29'),
(25, 10, 'recurring', 'Wednesday', NULL, '18:30:00', '20:30:00', 1, '2025-11-10 10:35:36', '2025-11-10 10:35:36'),
(26, 10, 'recurring', 'Saturday', NULL, '18:30:00', '20:30:00', 1, '2025-11-10 10:40:02', '2025-11-10 10:40:02'),
(27, 16, 'recurring', 'Monday', NULL, '12:00:00', '16:00:00', 1, '2025-11-11 08:16:17', '2025-11-11 08:16:17'),
(28, 16, 'recurring', 'Wednesday', NULL, '14:00:00', '17:00:00', 1, '2025-11-11 08:17:37', '2025-11-11 08:17:37'),
(29, 16, 'oneoff', NULL, '2025-11-11', '13:00:00', '14:00:00', 1, '2025-11-11 08:23:47', '2025-11-11 08:23:47'),
(30, 15, 'oneoff', NULL, '2025-11-27', '17:50:00', '21:50:00', 1, '2025-11-12 11:47:44', '2025-11-12 11:47:44'),
(31, 6, 'recurring', 'Tuesday', NULL, '17:50:00', '19:50:00', 1, '2025-11-13 13:51:01', '2025-11-13 13:51:01'),
(32, 6, 'recurring', 'Friday', NULL, '18:00:00', '21:00:00', 1, '2025-11-13 14:57:29', '2025-11-13 14:57:29'),
(33, 15, 'recurring', 'Sunday', NULL, '17:21:00', '20:21:00', 1, '2025-11-18 12:21:41', '2025-11-18 12:21:41'),
(34, 15, 'recurring', 'Monday', NULL, '13:16:00', '14:17:00', 1, '2025-11-21 08:15:50', '2025-11-21 08:15:50'),
(35, 15, 'recurring', 'Sunday', NULL, '14:22:00', '16:22:00', 1, '2025-11-21 08:21:01', '2025-11-21 08:21:01'),
(36, 15, 'oneoff', NULL, '2025-11-22', '13:30:00', '15:31:00', 1, '2025-11-21 09:30:38', '2025-11-21 09:30:38'),
(37, 15, 'recurring', 'Monday', NULL, '14:31:00', '15:31:00', 1, '2025-11-21 09:31:16', '2025-11-21 09:31:16'),
(38, 15, 'recurring', 'Monday', NULL, '14:33:00', '16:33:00', 1, '2025-11-21 09:33:39', '2025-11-21 09:33:39'),
(40, 24, 'recurring', 'Thursday', NULL, '20:00:00', '22:58:00', 1, '2025-12-12 15:58:13', '2025-12-12 15:58:13'),
(41, 11, 'recurring', 'Monday', NULL, '21:09:00', '21:10:00', 1, '2025-12-12 16:04:46', '2025-12-12 16:04:46'),
(42, 24, 'recurring', 'Monday', NULL, '13:06:00', '15:06:00', 1, '2025-12-12 16:06:59', '2025-12-12 16:06:59');

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
(4, '2025_10_20_113620_create_patients_table', 2),
(5, '2025_10_21_095732_create_roles_table', 3),
(6, '2025_10_22_072325_create_doctors_table', 4),
(7, '2025_10_23_113310_change_available_days_type_in_doctors_table', 5),
(8, '2025_10_27_130232_create_patient_intakes_table', 6);

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
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `age` varchar(20) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `blood_group` varchar(5) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `user_id`, `profile_image`, `gender`, `age`, `phone`, `address`, `blood_group`, `created_at`, `updated_at`) VALUES
(2, 4, 'Patient/profile_images1761055049_logo.jpeg', 'Male', NULL, '03162881956', NULL, 'A+', '2025-10-21 08:57:29', '2025-10-21 08:57:29'),
(3, 5, 'Patient/profile_images1761055410_logo.jpeg', 'Male', NULL, '03162881956', NULL, 'B+', '2025-10-21 09:03:30', '2025-10-21 09:03:30'),
(4, 12, 'Patient/profile_images1761224306_WhatsApp Image 2025-10-13 at 8.28.00 PM.jpeg', 'Male', NULL, 'ss', NULL, NULL, '2025-10-23 07:58:26', '2025-10-23 07:58:26'),
(5, 15, 'Patient/profile_images1761226357_logo-removebg-preview.png', 'Male', NULL, '03164541956', NULL, 'O+', '2025-10-23 08:32:37', '2025-10-23 08:32:37'),
(6, 3, '1761318229_g.PNG', 'Male', '25', '03169666997', NULL, 'B+', '2025-10-24 10:03:49', '2025-10-24 10:03:49'),
(7, 18, 'Patient/profile_images1761554829_WhatsApp Image 2025-10-13 at 8.28.00 PM.jpeg', 'Male', '40', '684356-9568', NULL, 'A-', '2025-10-27 03:47:09', '2025-10-27 03:47:09'),
(8, 22, '1761813292_logo-removebg-preview.png', 'Female', '20', '03169666997', NULL, 'B-', '2025-10-30 03:34:52', '2025-10-30 03:34:52'),
(9, 23, '1761907166_g.PNG', 'Other', 'Facilis facilis temp', '1795271-8064', NULL, 'O-', '2025-10-31 10:39:26', '2025-10-31 10:39:26'),
(10, 26, '1761911428_code4.PNG', 'Female', 'Minus sit dolorem o', '18649366171', NULL, 'O-', '2025-10-31 11:50:28', '2025-10-31 11:50:28'),
(11, 27, '1761920144_girl.jpg', 'Female', '20', '0316576566', NULL, 'B+', '2025-10-31 14:15:44', '2025-10-31 14:15:44'),
(12, 34, '1762261777_images.jpg', 'Female', '20', '03127865456', NULL, 'O+', '2025-11-04 13:09:37', '2025-11-04 13:09:37'),
(13, 35, '1762328529_Screenshot 2025-10-06 005952.png', 'Female', '25', '04567890432', NULL, 'O+', '2025-11-05 07:42:09', '2025-11-05 07:42:09'),
(14, 36, '1762445277_girl.jpg', 'Female', '21', '03124578654', NULL, 'O+', '2025-11-06 16:07:57', '2025-11-06 16:07:57'),
(15, 37, '1762761562_girlprofile.jpg', 'Female', '28', '03169666967', NULL, 'B+', '2025-11-10 07:59:22', '2025-11-10 07:59:22'),
(16, 38, '1762773753_boy.jpg', 'Male', '22', '04897654568', NULL, 'O-', '2025-11-10 11:22:33', '2025-11-10 11:22:33'),
(17, 39, '1762773877_girlprofile.jpg', 'Female', '22', '04897654568', NULL, 'AB+', '2025-11-10 11:24:37', '2025-11-10 11:24:37'),
(18, 40, '1762785479_Capture222.PNG', 'Male', '67', '43367532467', NULL, 'A-', '2025-11-10 14:37:59', '2025-11-10 14:37:59'),
(19, 41, '1762846206_girl.jpg', 'Female', '23', '04567890432', NULL, 'A-', '2025-11-11 07:30:06', '2025-11-25 12:51:54'),
(20, 46, '1762951041_fao t a.PNG', 'Male', '2016-11-17', '19412683602', NULL, 'B+', '2025-11-12 12:37:21', '2025-11-12 12:37:21'),
(21, 54, '1764252420_Capture222.PNG', 'Male', '56', '04567890432', NULL, 'B+', '2025-11-27 14:07:00', '2025-11-27 14:07:00');

-- --------------------------------------------------------

--
-- Table structure for table `patient_intakes`
--

CREATE TABLE `patient_intakes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `symptoms` varchar(255) DEFAULT NULL,
  `common_symptoms` varchar(255) DEFAULT NULL,
  `condition_description` varchar(255) DEFAULT NULL,
  `blood_pressure` varchar(255) DEFAULT NULL,
  `temperature` double DEFAULT NULL,
  `heart_rate` int(11) DEFAULT NULL,
  `medical_history` varchar(255) DEFAULT NULL,
  `other_history` varchar(255) DEFAULT NULL,
  `pregnancy_status` tinyint(1) DEFAULT NULL,
  `breast_feeding` tinyint(1) DEFAULT NULL,
  `triage_level` tinyint(3) UNSIGNED DEFAULT NULL,
  `urgency` varchar(20) DEFAULT NULL,
  `recommended_specialist` varchar(100) DEFAULT NULL,
  `triage_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patient_intakes`
--

INSERT INTO `patient_intakes` (`id`, `user_id`, `patient_id`, `symptoms`, `common_symptoms`, `condition_description`, `blood_pressure`, `temperature`, `heart_rate`, `medical_history`, `other_history`, `pregnancy_status`, `breast_feeding`, `triage_level`, `urgency`, `recommended_specialist`, `triage_description`, `created_at`, `updated_at`) VALUES
(3, 3, 6, 'Fever,cough', '[\"Fever\",\"Cough\",\"Headache\",\"Body Pain\"]', 'boht sr me dard', '125/90', 100, 98, NULL, NULL, NULL, NULL, 3, 'yellow', 'Neurologist', 'Could progress to a serious problem but not immediately unstable.', '2025-10-29 05:37:02', '2025-10-29 05:37:02'),
(4, 3, 6, 'not breathing , unable to breathe', '[\"Shortness of Breath\"]', 'breath nahi a rhi', '125/90', 103, 90, '[\"Asthma\"]', NULL, NULL, NULL, 1, 'red', 'Emergency Physician', 'Life-threatening condition requiring immediate intervention.', '2025-10-29 06:18:54', '2025-10-29 06:18:54'),
(5, 3, 6, 'Allergy', '[\"Body Pain\"]', 'allergy ho rahi hy', '125/90', 106, 120, '[\"Heart Disease\"]', NULL, NULL, NULL, 1, 'red', 'Emergency Physician', 'Life-threatening condition requiring immediate intervention.', '2025-10-29 06:22:20', '2025-10-29 06:22:20'),
(6, 3, 6, 'dry cough', '[\"Fever\",\"Cough\",\"Cold \\/ Flu\"]', 'fever ho raha h', '120/80', 80, 72, NULL, NULL, NULL, NULL, 3, 'yellow', 'Neurologist', 'Could progress to a serious problem but not immediately unstable.', '2025-10-29 06:33:41', '2025-10-29 06:33:41'),
(7, 3, 6, 'fever,body pain , feel low', '[\"Fever\",\"Cough\",\"Vomiting\"]', 'ultiya ho', '120/80', 90, 67, NULL, NULL, NULL, NULL, 2, 'orange', 'Cardiologist / Pulmonologist / Emergency Physician', 'Potential threat to life, limb, or function.', '2025-10-29 06:38:03', '2025-10-29 06:38:03'),
(8, 3, 6, 'fever', '[\"Fever\",\"Cough\",\"Body Pain\"]', 'body dard', '120/80', 80, 79, NULL, NULL, NULL, NULL, 3, 'yellow', 'Neurologist', 'Could progress to a serious problem but not immediately unstable.', '2025-10-29 06:51:56', '2025-10-29 06:51:56'),
(17, 3, 6, 'not breathing,unconscious', '[\"Shortness of Breath\"]', 'cnt\' breath', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'red', 'Emergency Physician', 'Life-threatening condition requiring immediate intervention.', '2025-10-29 09:36:20', '2025-10-29 09:36:20'),
(18, 3, 6, 'chest pain', '[\"Headache\",\"Shortness of Breath\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'orange', 'Cardiologist', 'Potential threat to life, limb, or function. Immediate attention required.', '2025-10-29 09:36:56', '2025-10-29 09:36:56'),
(19, 22, 8, 'fever,cough,', '[\"Fever\",\"Cough\",\"Vomiting\"]', 'khrab hy', '120/80', 101, 78, NULL, NULL, NULL, NULL, 4, 'green', 'General Practitioner / Telehealth (API Error Fallback)', 'Could not perform AI Triage. Defaulting to Level 4 for safety.', '2025-10-30 03:37:16', '2025-10-30 03:37:16'),
(24, 22, 8, 'breath', '[\"Fever\",\"Cough\",\"Body Pain\",\"Shortness of Breath\"]', 'can;t breath', '120/80', 67, 33, NULL, NULL, 1, 1, 4, 'green', 'General Practitioner / Telehealth (API Error Fallback)', 'Could not perform AI Triage. Defaulting to Level 4 for safety.', '2025-10-30 04:29:18', '2025-10-30 04:29:18'),
(25, 22, 8, 'cough', '[\"Cough\",\"Body Pain\",\"Shortness of Breath\"]', 'cant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 'green', 'General Practitioner / Telehealth (API Error Fallback)', 'Could not perform AI Triage. Defaulting to Level 4 for safety.', '2025-10-30 05:04:38', '2025-10-30 05:04:38'),
(26, 22, 8, 'sore throat', '[\"Fever\",\"Cough\",\"Shortness of Breath\"]', 'asdasd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 'green', 'General Practitioner / Telehealth (API Error Fallback)', 'Could not perform AI Triage. Defaulting to Level 4 for safety.', '2025-10-30 05:05:29', '2025-10-30 05:05:29'),
(27, 22, 8, 'body pain', '[\"Body Pain\",\"Shortness of Breath\"]', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 4, 'green', 'General Practitioner / Telehealth (API Error Fallback)', 'Could not perform AI Triage. Defaulting to Level 4 for safety.', '2025-10-30 05:07:50', '2025-10-30 05:07:50'),
(28, 22, 8, 'body pain', '[\"Fever\",\"Cough\",\"Body Pain\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'yellow', 'General Practitioner', 'The patient presents with body pain, fever, and cough, indicating a potentially viral or bacterial infection. Monitoring of symptoms and further evaluation is necessary.', '2025-10-30 05:59:15', '2025-10-30 05:59:15'),
(29, 22, 8, 'unconcious , not breathing', '[\"Fever\",\"Shortness of Breath\",\"Cold \\/ Flu\"]', 'not breathing', '140/80', 89, 89, NULL, NULL, 1, 1, 1, 'red', 'Emergency Medicine', 'Patient is unconscious and not breathing, requiring immediate emergency intervention.', '2025-10-30 06:01:36', '2025-10-30 06:01:36'),
(30, 22, 8, 'skin allergy', '[\"Fever\",\"Headache\",\"Body Pain\",\"Loss of Taste or Smell\",\"Vomiting\"]', 'allergy on body', '125/90', 56, 77, NULL, NULL, 0, 0, 3, 'yellow', 'Allergist', 'The patient is experiencing a skin allergy along with common symptoms including fever, headache, and body pain, indicating a moderate potential for underlying infection or systemic reaction. Further evaluation is needed.', '2025-10-30 06:03:34', '2025-10-30 06:03:34'),
(31, 22, 8, 'dry cough', '[\"Cough\",\"Body Pain\",\"Cold \\/ Flu\"]', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 4, 'green', 'General Practitioner / Telehealth (API Error)', 'Could not perform AI triage. Defaulting to Level 4.', '2025-10-30 06:36:55', '2025-10-30 06:36:55'),
(32, 22, 8, 'dry cough', '[\"Cough\",\"Body Pain\",\"Cold \\/ Flu\"]', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 4, 'green', 'General Practitioner / Telehealth (API Error)', 'Could not perform AI triage. Defaulting to Level 4.', '2025-10-30 06:38:44', '2025-10-30 06:38:44'),
(33, 22, 8, 'dry cough', '[\"Cough\",\"Body Pain\",\"Cold \\/ Flu\"]', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 4, 'green', 'General Practitioner / Telehealth (API Error)', 'Could not perform AI triage. Defaulting to Level 4.', '2025-10-30 06:39:49', '2025-10-30 06:39:49'),
(34, 22, 8, 'not breathing', '[\"Cough\",\"Body Pain\",\"Shortness of Breath\"]', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 4, 'green', 'General Practitioner / Telehealth (API Error)', 'Could not perform AI triage. Defaulting to Level 4.', '2025-10-30 06:43:53', '2025-10-30 06:43:53'),
(35, 22, 8, 'unconsious', '[\"Fever\",\"Shortness of Breath\",\"Loss of Taste or Smell\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'red', 'Emergency Medicine', 'The patient is unconscious, which is a critical condition requiring immediate medical attention.', '2025-10-30 06:46:34', '2025-10-30 06:46:34'),
(36, 22, 8, 'unconsious,not breathing', '[\"Fever\",\"Cough\",\"Shortness of Breath\",\"Loss of Taste or Smell\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'red', 'Emergency Medicine', 'The patient is unconscious and not breathing, indicating a critical emergency that requires immediate medical intervention.', '2025-10-30 06:48:23', '2025-10-30 06:48:23'),
(37, 22, 8, NULL, '[\"Body Pain\",\"Shortness of Breath\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'yellow', 'Pulmonologist', 'Patient exhibits shortness of breath and body pain which could indicate a moderate respiratory issue. Further evaluation is needed to rule out potential underlying causes.', '2025-10-30 06:52:10', '2025-10-30 06:52:10'),
(38, 22, 8, NULL, '[\"Body Pain\",\"Shortness of Breath\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'yellow', 'Primary Care Physician', 'Patient is experiencing body pain and shortness of breath, which could indicate a variety of underlying conditions. Further evaluation needed to determine the cause and appropriate treatment.', '2025-10-30 06:55:40', '2025-10-30 06:55:40'),
(39, 22, 8, 'not breathing', '[\"Headache\",\"Body Pain\",\"Shortness of Breath\"]', 'unconsiois', '125/90', 89, 88, '[\"High Blood Pressure\"]', NULL, 1, 1, 1, 'red', 'Emergency Medicine', 'Patient is unconscious and not breathing, requiring immediate medical attention.', '2025-10-30 07:07:02', '2025-10-30 07:07:02'),
(40, 22, 8, 'Fever,cough', '[\"Fever\",\"Cough\",\"Headache\",\"Body Pain\"]', 'boht sr me dard', '125/90', 909, 776, NULL, NULL, 1, 1, 3, 'yellow', 'Obstetrician', 'The patient is experiencing fever and cough during pregnancy, which could indicate an infection or other complications. Vital signs show elevated heart rate and temperature, warranting evaluation.', '2025-10-30 08:34:27', '2025-10-30 08:34:27'),
(41, 22, 8, 'dry cough', '[\"Fever\",\"Cough\",\"Headache\",\"Body Pain\"]', 'sr me dard', '140/80', 78, 55, NULL, NULL, 0, 1, 3, 'yellow', 'Primary Care Physician', 'The patient is experiencing a dry cough accompanied by fever, headache, and body pain. Vital signs show a lower than normal heart rate which may require further assessment. While symptoms can indicate a viral infection or other respiratory issue, they are not immediately life-threatening but do require prompt evaluation.', '2025-10-30 09:04:43', '2025-10-30 09:04:43'),
(42, 22, 8, 'maleriya', '[\"Fever\",\"Cough\",\"Body Pain\"]', 'mrrr rha hoon kia kroon', '125/90', 102, 89, NULL, 'non', 0, 0, 3, 'yellow', 'Infectious Disease Specialist', 'Patient presents with symptoms suggestive of malaria along with fever, cough, and body pain. Immediate evaluation and treatment are recommended.', '2025-10-30 09:12:43', '2025-10-30 09:12:43'),
(43, 22, 8, 'sir me dard , kamzori , bukhar', '[\"Fever\",\"Cough\",\"Body Pain\",\"Vomiting\"]', 'boht kamzori ho  rahi hy bukhar bhi ho raha hy', '140/80', 88, 99, NULL, NULL, 1, 0, 3, 'yellow', 'Obstetrician', 'Patient is experiencing fever, weakness, and pain which may indicate an infection or complication related to pregnancy. Monitoring and evaluation required.', '2025-10-30 09:23:00', '2025-10-30 09:23:00'),
(44, 22, 8, 'Fever, Cough, Headache, Shivering', '[\"Body Pain\"]', 'I have sore throat', '125/90', 104, 13, '[\"Food Allergies\",\"Drug Allergies\",\"Asthma\",\"Diabetes\",\"Heart Disease\"]', NULL, 0, 1, 3, 'yellow', 'Primary Care Physician', 'The patient presents with fever (104F), cough, headache, shivering, and sore throat. These symptoms suggest a possible infection or significant illness, especially with the combination of diabetes and asthma in her medical history. Monitoring and further evaluation are necessary.', '2025-10-30 09:29:10', '2025-10-30 09:29:10'),
(45, 22, 8, 'pain in joints', '[\"Fever\",\"Fatigue\"]', NULL, '140/80', 101, 80, NULL, NULL, NULL, NULL, 3, 'yellow', 'Rheumatologist', 'The patient presents with joint pain accompanied by fever and fatigue, indicating a possible inflammatory or autoimmune condition. Vital signs are stable, but the presence of fever and joint pain warrants further evaluation to rule out conditions such as rheumatoid arthritis or other rheumatologic diseases.', '2025-10-30 09:36:34', '2025-10-30 09:36:34'),
(46, 3, 6, 'pain in bones', '[\"Fever\",\"Body Pain\"]', 'i have pain in a leg bones', '140/80', 78, 99, NULL, NULL, NULL, NULL, 4, 'green', 'General Practitioner / Telehealth (API Error)', 'Could not perform AI triage. Defaulting to Level 4.', '2025-10-31 10:51:00', '2025-10-31 10:51:00'),
(47, 3, 6, 'pain in leg bones', '[\"Fever\",\"Body Pain\"]', 'i have lot of pain in bone in my legs', '140/80', 89, 99, NULL, NULL, NULL, NULL, 3, 'yellow', 'Orthopedic ', 'The patient presents with pain in leg bones, fever, and elevated heart rate, which may indicate an underlying infection or musculoskeletal issue. Evaluation by an orthopedic specialist is recommended.', '2025-10-31 10:56:17', '2025-10-31 10:56:17'),
(48, 3, 6, 'body in pain', '[\"Body Pain\"]', 'i have lot of pain in body pain', '140/80', 89, 77, NULL, NULL, NULL, NULL, 3, 'yellow', 'Primary Care Physician', 'Patient presents with generalized body pain. Vitals are stable, but the low temperature (89F) may indicate potential underlying issues. It\'s recommended for further evaluation by a primary care physician.', '2025-10-31 11:05:02', '2025-10-31 11:05:02'),
(49, 3, 6, 'body in pain', '[\"Body Pain\"]', 'i have lot of pain in body pain', '140/80', 89, 77, NULL, NULL, NULL, NULL, 3, 'yellow', 'Primary Care Physician', 'The patient presents with generalized body pain but has stable vital signs. Further evaluation is needed to determine the cause of pain.', '2025-10-31 11:05:50', '2025-10-31 11:05:50'),
(50, 3, 6, 'pain in bone', '[\"Body Pain\"]', 'i have lot of pain in my muscla', '120/80', 77, 88, NULL, NULL, NULL, NULL, 3, 'yellow', 'Orthopedic Specialist', 'The patient is experiencing significant bone pain with associated body pain, though vital signs are stable. A referral to an orthopedic specialist is recommended to evaluate potential underlying musculoskeletal conditions.', '2025-10-31 11:11:56', '2025-10-31 11:11:56'),
(51, 3, 6, 'pain in legs bone', '[\"Body Pain\"]', 'have lot of pain in legs', '120/80', 89, 99, NULL, NULL, NULL, NULL, 3, 'yellow', 'orthopedist', 'The patient experiences significant pain in the legs, which could indicate a musculoskeletal issue or other underlying condition. Vital signs are stable but a thorough evaluation is necessary.', '2025-10-31 11:15:30', '2025-10-31 11:15:30'),
(52, 3, 6, 'pain in legs bons', '[\"Body Pain\"]', 'lots of pain in legs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'yellow', 'Orthopedist', 'The patient is experiencing significant pain in the legs, which may indicate a musculoskeletal issue or injury. While the vitals are not available, the presence of pain warrants further evaluation by an orthopedic specialist.', '2025-10-31 11:20:40', '2025-10-31 11:20:40'),
(53, 3, 6, 'pain in legs bons', '[\"Body Pain\"]', 'lots of pain in legs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'yellow', 'Orthopedist', 'The patient exhibits significant leg pain and body pain. Vitals are not available, but given the pain level and lack of other acute symptoms, this case requires further evaluation to rule out musculoskeletal issues.', '2025-10-31 11:22:11', '2025-10-31 11:22:11'),
(54, 3, 6, 'pain in legs bons', '[\"Body Pain\"]', 'lots of pain in legs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'yellow', 'Orthopedist', 'Patient exhibits significant leg pain, indicating a possible musculoskeletal issue. Further evaluation is necessary to determine the underlying cause.', '2025-10-31 11:23:10', '2025-10-31 11:23:10'),
(55, 3, 6, 'pain in legs bons', '[\"Body Pain\"]', 'lots of pain in legs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'yellow', 'Orthopedist', 'The patient is experiencing significant pain in the legs, which may indicate a musculoskeletal issue. Evaluation by an orthopedic specialist is advised for further assessment and possible imaging.', '2025-10-31 11:23:40', '2025-10-31 11:23:40'),
(56, 3, 6, 'pain in legs bons', '[\"Body Pain\"]', 'lots of pain in legs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'yellow', 'Orthopedic Specialist', 'The patient is experiencing significant pain in the legs, which may indicate a musculoskeletal issue. Immediate evaluation is necessary to determine the underlying cause.', '2025-10-31 11:24:04', '2025-10-31 11:24:04'),
(57, 3, 6, 'pain in legs bons', '[\"Body Pain\"]', 'lots of pain in legs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'yellow', 'Orthopedist', 'The patient is experiencing significant leg pain, which may indicate a musculoskeletal issue. Further evaluation is warranted, but the condition is not immediately life-threatening.', '2025-10-31 11:28:49', '2025-10-31 11:28:49'),
(58, 3, 6, 'pain in legs bone', '[\"Body Pain\"]', 'lot of pain in legs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'yellow', 'Orthopedist', 'The patient is experiencing significant pain in the legs, which may indicate a musculoskeletal issue. Investigation by an orthopedist is warranted to assess the underlying cause.', '2025-10-31 11:29:51', '2025-10-31 11:29:51'),
(59, 3, 6, 'pain in legs bone', '[\"Body Pain\"]', 'lot of pain in legs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'yellow', 'Orthopedic Specialist', 'The patient is experiencing significant pain in the legs with no available vitals. This may indicate a musculoskeletal issue or injury that requires further evaluation by an orthopedic specialist.', '2025-10-31 11:31:46', '2025-10-31 11:31:46'),
(60, 3, 6, 'lot of pain in legs bones', '[\"Cough\",\"Body Pain\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'yellow', 'Orthopedic Specialist', 'Patient is experiencing significant pain in the legs and bones, which may indicate a musculoskeletal issue. While vitals are not available, the presence of body pain and cough suggests a possible systemic condition. Non-urgent but requires medical evaluation.', '2025-10-31 11:32:22', '2025-10-31 11:32:22'),
(61, 3, 6, 'fever , cough', '[\"Fever\",\"Cough\",\"Headache\",\"Body Pain\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'orange', 'Primary Care Physician', 'The patient presents with fever and cough, which may suggest a viral or bacterial infection. The presence of body pain and headache indicates a moderate level of concern that warrants further evaluation.', '2025-10-31 11:35:00', '2025-10-31 11:35:00'),
(62, 3, 6, 'body pain . legs pain', '[\"Fever\",\"Cough\",\"Body Pain\"]', 'lots of pain in legs bones', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'yellow', 'Primary Care Physician', 'The patient exhibits moderate symptoms of body and leg pain, alongside fever and cough. While there are no alarming vital signs reported, the combination of symptoms suggests a possible infection or underlying condition that requires further evaluation.', '2025-10-31 11:37:51', '2025-10-31 11:37:51'),
(63, 3, 6, 'back pain, chest pain,joint pain', '[\"Body Pain\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'yellow', 'Primary Care Physician', 'The patient presents with multiple pain symptoms, including back, chest, and joint pain. While not immediately life-threatening, the combination of chest and joint pain warrants further evaluation to rule out potential serious conditions. The absence of vital signs limits assessment, but a primary care visit is needed for proper diagnosis and management.', '2025-10-31 11:40:20', '2025-10-31 11:40:20'),
(64, 3, 6, 'abdominal pain, back pain, chest pain, cough,', '[\"Fever\",\"Cough\",\"Body Pain\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'yellow', 'Internal Medicine', 'The patient presents with multiple symptoms, including abdominal pain, back pain, and chest pain, which may indicate a concerning underlying condition. The presence of fever and cough further complicates the situation. Immediate evaluation is necessary, but the situation is not life-threatening at this moment.', '2025-10-31 11:41:27', '2025-10-31 11:41:27'),
(65, 3, 6, 'not braething, unconsious', '[\"Shortness of Breath\"]', 'unable to breath', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'red', 'Emergency Medicine', 'The patient is unconscious and unable to breathe, indicating a life-threatening emergency that requires immediate intervention.', '2025-10-31 11:42:24', '2025-10-31 11:42:24'),
(66, 26, 10, 'not breathing , uncounsious', '[\"Shortness of Breath\"]', 'unable to breath', '140/80', 78, 88, NULL, NULL, 1, 1, 1, 'red', 'Emergency Medicine', 'Immediate medical attention required due to not breathing and unconsciousness.', '2025-10-31 11:52:31', '2025-10-31 11:52:31'),
(67, 3, 6, 'ear pain , nose blood , throat bad', '[\"Sore Throat\"]', 'lots of pain in ear and nose bleeding and also throad bad', '120/78', 67, 66, NULL, NULL, NULL, NULL, 3, 'yellow', 'ENT Specialist', 'The patient presents with ear pain, nosebleed, and a sore throat, indicating potential ENT-related issues. Symptoms warrant evaluation by an ENT specialist.', '2025-10-31 14:05:46', '2025-10-31 14:05:46'),
(68, 3, 6, 'skin rashes', '[\"Fever\"]', 'swollen skin', '120/78', 67, 66, NULL, NULL, NULL, NULL, 3, 'yellow', 'Dermatologist', 'The patient presents with skin rashes and swollen skin, accompanied by a fever. This indicates a possible dermatological condition that may require specialized evaluation and treatment.', '2025-10-31 14:07:19', '2025-10-31 14:07:19'),
(69, 3, 6, 'pain in leg bones , pain hand bone', '[\"Body Pain\"]', 'boht peero ki haddiyon me hand ki hadiyon me dard hy', '120/78', 67, 66, NULL, NULL, NULL, NULL, 3, 'yellow', 'Orthopedic Specialist', 'The patient is experiencing pain in the leg and hand bones, which may indicate a musculoskeletal condition. Referral to an orthopedic specialist is recommended for further evaluation and management.', '2025-10-31 14:09:38', '2025-10-31 14:09:38'),
(70, 27, 11, 'missed period,mood swings, food cravings', '[\"Fatigue\",\"Nausea\",\"Vomiting\"]', NULL, '120/78', 85, 77, NULL, NULL, 0, 0, 2, 'yellow', 'Gynecologist', 'The patient is experiencing missed periods, mood swings, food cravings, fatigue, nausea, and vomiting, which could indicate a gynecological issue such as hormonal imbalance or early pregnancy. A gynecologist is recommended for further evaluation.', '2025-10-31 14:17:54', '2025-10-31 14:17:54'),
(71, 27, 11, 'pain in bones', '[\"Body Pain\"]', 'boht haddiyon me dard ho raha hy', NULL, NULL, NULL, NULL, NULL, 0, 0, 3, 'yellow', 'Orthopedic Specialist', 'The patient is experiencing pain in bones and body pain, which may indicate a musculoskeletal issue that requires assessment by an orthopedic specialist.', '2025-10-31 14:26:38', '2025-10-31 14:26:38'),
(72, 27, 11, 'fever , cought', '[\"Fever\",\"Cough\",\"Headache\",\"Sore Throat\",\"Cold \\/ Flu\",\"Vomiting\"]', 'bukhar ho raha hy khansi or sir me dard vomiting  bhi hoarahi hy', '78', 88, 77, NULL, NULL, 0, 0, 3, 'yellow', 'General Physician', 'The patient presents with fever, cough, headache, sore throat, and vomiting, indicating a possible viral infection like the flu. Vitals show low blood pressure and normal heart rate, but monitoring is recommended due to the symptoms.', '2025-10-31 14:33:19', '2025-10-31 14:33:19'),
(73, 27, 11, 'joint pain, stiffness, and swelling', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'yellow', 'Rheumatologist', 'The patient exhibits joint pain, stiffness, and swelling, which may indicate a musculoskeletal or inflammatory condition requiring evaluation by a rheumatologist.', '2025-10-31 14:43:58', '2025-10-31 14:43:58'),
(74, 3, 6, 'pain in bones', '[\"Body Pain\"]', 'haddiyon me dard ho raha hy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'yellow', 'Orthopedic Specialist', 'The patient is experiencing pain in bones, which warrants further evaluation by an orthopedic specialist to rule out any underlying musculoskeletal issues.', '2025-11-01 09:50:16', '2025-11-01 09:50:16'),
(75, 26, 10, 'Id eu sunt ratione', '[\"Fever\",\"Headache\",\"Sore Throat\",\"Loss of Taste or Smell\",\"Vomiting\",\"Dizziness\"]', 'Consectetur veniam', 'Recusandae Suscipit', 52, 29, '[\"Drug Allergies\",\"Diabetes\",\"Surgery History\",\"Other\"]', 'Iure voluptatem Nob', 1, 1, 5, 'red', 'Emergency Physician', 'The patient presents with severe symptoms including a very low temperature (52F), extremely low heart rate (29 BPM), and multiple concerning gastrointestinal and systemic symptoms, indicating a possible medical emergency that requires immediate attention.', '2025-11-03 09:31:48', '2025-11-03 09:31:48'),
(76, 3, 6, NULL, '[\"Headache\"]', 'The headache started suddenly two days ago', '180/20', 52, 97, NULL, NULL, NULL, NULL, 4, 'orange', 'Neurologist', 'The patient presents with a sudden severe headache along with unusually high blood pressure, which may indicate a serious underlying condition. Immediate evaluation by a neurologist is necessary.', '2025-11-04 12:42:41', '2025-11-04 12:42:41'),
(77, 34, 12, 'bluish skin\r\nseverely sore throat\r\nhigh fever\r\nextreme fatigue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, 'orange', 'Emergency Physician', 'The patient presents with severe symptoms including bluish skin, sore throat, high fever, and extreme fatigue, which may indicate a serious condition requiring immediate evaluation.', '2025-11-04 13:20:44', '2025-11-04 13:20:44'),
(78, 34, 12, 'pain in leg bones, back pain', '[\"Body Pain\"]', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 'yellow', 'Orthopedic Specialist', 'Pregnant female presenting with leg bone pain and back pain, requiring evaluation for potential musculoskeletal issues.', '2025-11-04 13:22:23', '2025-11-04 13:22:23'),
(79, 35, 13, 'pain in bones', '[\"Fever\",\"Headache\",\"Body Pain\"]', 'pain in legs bones nad hand bones', '120/80', 78, 78, NULL, NULL, 1, 1, 3, 'yellow', 'Orthopedic Specialist', 'The patient presents with bone pain in hands and legs, along with fever and body pain, which could indicate an underlying condition that may require further evaluation by an orthopedic specialist.', '2025-11-05 07:43:42', '2025-11-05 07:43:42'),
(80, 35, 13, 'pain in bones', '[\"Body Pain\"]', NULL, '120/90', 77, 90, NULL, NULL, 1, 1, 3, 'yellow', 'Orthopedic Specialist', 'The patient is a pregnant female presenting with bone pain and body pain. Given the potential implications of these symptoms during pregnancy, an orthopedic evaluation is necessary to rule out any serious conditions.', '2025-11-05 09:56:10', '2025-11-05 09:56:10'),
(81, 35, 13, 'pain in bone legs', '[\"Body Pain\"]', 'pain in every bone', NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 'yellow', 'General Physician', 'The patient is experiencing widespread bone pain, which could be concerning during pregnancy. A general physician can conduct an initial assessment and refer to other specialists if necessary.', '2025-11-05 12:18:44', '2025-11-05 12:18:44'),
(82, 35, 13, 'pain in bone legs', '[\"Body Pain\"]', 'pain in bone', NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 'yellow', 'General Physician', 'The patient is experiencing bone pain and body pain, which could indicate a range of conditions. Given the pregnancy status, further evaluation is necessary to rule out any complications or underlying issues.', '2025-11-05 12:19:11', '2025-11-05 12:19:11'),
(83, 35, 13, 'pain in legs bone', '[\"Body Pain\"]', 'pain in bone', NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 'yellow', 'Orthopedic Specialist', 'Pregnant female experiencing bone pain in legs, requires evaluation for potential musculoskeletal issues.', '2025-11-05 12:19:30', '2025-11-05 12:19:30'),
(84, 35, 13, 'pain in bone bach pain', '[\"Body Pain\"]', 'boht hadiyon m dard ho raha hy', NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 'yellow', 'Orthopedic Specialist', 'The patient is experiencing bone pain, which could indicate a musculoskeletal issue. Given the symptoms and the fact that the patient is pregnant, it is important for an orthopedic specialist to evaluate the condition.', '2025-11-06 08:23:26', '2025-11-06 08:23:26'),
(85, 35, 13, 'legs me dard ho  raha hy sardi lg rahi hy sr me dard ho rah hy weekness ho rahi hy', '[\"Fever\",\"Headache\",\"Body Pain\"]', 'boht weekness ho rahu hy peeron me dard ho raha hy sr me halka dard hy halka bukhar hy', '120/78', 100, 78, NULL, NULL, 1, 0, 3, 'yellow', 'General Physician', 'The patient is experiencing weakness, leg pain, mild fever, headache, and body pain, which requires evaluation by a General Physician to rule out any underlying conditions, especially considering she is pregnant.', '2025-11-06 15:18:41', '2025-11-06 15:18:41'),
(86, 36, 14, 'pain in joints and limbs', '[\"Fever\",\"Body Pain\",\"Sore Throat\"]', 'Fever spikes at night. Pain is diffuse — mostly lower back, knees, and hands joints', '125/90', 89, 87, NULL, NULL, 1, 1, 3, 'yellow', 'General Physician', 'The patient is experiencing joint pain along with fever and body aches, indicating a potential inflammatory or infectious process. Given her pregnancy status, it is important to assess and manage her symptoms carefully.', '2025-11-06 16:09:37', '2025-11-06 16:09:37'),
(87, 36, 14, 'pain in joints and limbs bones', '[\"Fever\",\"Body Pain\",\"Sore Throat\"]', 'Fever spikes at night. Pain is diffuse  mostly lower back, knees, and hands joints', '125/90', 89, 87, NULL, NULL, 1, 1, 3, 'yellow', 'Rheumatologist', 'The patient presents with joint pain and fever, symptoms that may indicate an inflammatory or autoimmune condition. The pregnancy may complicate the diagnosis, making a rheumatologist the appropriate specialist for further evaluation.', '2025-11-06 16:10:48', '2025-11-06 16:10:48'),
(88, 36, 14, 'pain in joints and limbs bones', '[\"Fever\",\"Body Pain\",\"Sore Throat\"]', 'Fever spikes at night. Pain is diffuse  mostly lower back, knees, and hands joints', '140/80', 89, 99, NULL, NULL, 1, 1, 3, 'yellow', 'General Physician', 'The patient is experiencing joint and limb pain accompanied by fever, which could indicate an underlying infection or inflammatory condition. Given her pregnancy status and the need for careful management, she should be evaluated by a General Physician.', '2025-11-06 16:15:43', '2025-11-06 16:15:43'),
(89, 36, 14, 'pain in joints and limbs bones', '[\"Fever\",\"Body Pain\",\"Sore Throat\"]', 'Fever spikes at night. Pain is diffuse  mostly lower back, knees, and hands joints', '140/80', 89, 99, NULL, NULL, NULL, NULL, 3, 'yellow', 'Rheumatologist', 'The patient presents with joint and limb pain along with fever, which suggests a possible inflammatory or autoimmune condition. Given the diffuse pain and the vital sign abnormalities, a rheumatological evaluation is warranted.', '2025-11-06 16:16:13', '2025-11-06 16:16:13'),
(90, 36, 14, 'pain in joints and limbs bones', '[\"Fever\",\"Body Pain\",\"Sore Throat\"]', 'Fever spikes at night. Pain is diffuse  mostly lower back, knees, and hands joints', '140/80', 89, 99, NULL, NULL, NULL, NULL, 3, 'yellow', 'Rheumatologist', 'The patient presents with joint and limb pain, fever, and diffuse pain, which may indicate an underlying inflammatory or autoimmune condition. Referral to a rheumatologist is advised to evaluate for possible rheumatologic disorders.', '2025-11-06 16:17:02', '2025-11-06 16:17:02'),
(91, 36, 14, 'pain in joints and limbs bones', '[\"Fever\",\"Body Pain\",\"Sore Throat\"]', 'Fever spikes at night. Pain is diffuse  mostly lower back, knees, and hands joints', '140/80', 89, 99, NULL, NULL, NULL, NULL, 3, 'yellow', 'Rheumatologist', 'The patient presents with diffuse joint pain and fever, which may suggest an inflammatory or autoimmune condition. A rheumatologist can evaluate for conditions such as rheumatoid arthritis or other rheumatic diseases.', '2025-11-06 16:25:43', '2025-11-06 16:25:43'),
(92, 3, 6, 'pain in bones', '[\"Fever\",\"Body Pain\"]', 'pain in bones', '128/80', 85, 45, NULL, NULL, NULL, NULL, 3, 'yellow', 'Orthopedic Specialist', 'The patient is experiencing bone pain along with fever and bradycardia (low heart rate). These symptoms may indicate a possible underlying orthopedic or infectious issue. Further evaluation by an orthopedic specialist is recommended to determine the cause.', '2025-11-08 07:24:09', '2025-11-08 07:24:09'),
(93, 35, 13, 'fever', '[\"Headache\",\"Body Pain\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'yellow', 'General Physician', 'The patient presents with fever, headache, and body pain, indicating a potential underlying infection or viral illness. A general physician is recommended for further evaluation and management.', '2025-11-08 19:55:58', '2025-11-08 19:55:58'),
(94, 37, 15, 'Naak band rehti hai, saans lene me dikkat hoti hai, aur kabhi kabhi chhink bhi aati hai. 4 din se ye problem hai.', NULL, NULL, '120/80', 88, 77, NULL, NULL, 0, 1, 3, 'yellow', 'Pulmonologist', 'The patient is experiencing difficulty breathing and nasal congestion, which could indicate a respiratory issue. A pulmonologist should be consulted for further evaluation.', '2025-11-10 09:53:52', '2025-11-10 09:53:52'),
(95, 37, 15, '3 din se lower abdomen me dard hai, khas kar jab walk karti hoon ya bathroom jaati hoon.', NULL, NULL, '120/80', 88, 77, NULL, NULL, 0, 0, 3, 'yellow', 'Gynecologist', 'The patient is experiencing lower abdominal pain, particularly when walking or using the bathroom, which could indicate a gynecological issue. A gynecologist is recommended for further evaluation.', '2025-11-10 09:57:29', '2025-11-10 09:57:29'),
(96, 39, 17, 'Pichle hafte se white discharge ho raha hai aur thoda itching bhi hai. Koi smell bhi aa rahi hai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'yellow', 'Gynecologist', 'The patient is experiencing abnormal vaginal discharge with itching and odor, which may indicate a possible infection or other gynecological issue. A gynecologist is the appropriate specialist for evaluation and treatment.', '2025-11-10 11:25:58', '2025-11-10 11:25:58'),
(97, 39, 17, 'unconcious unable to breath', '[\"Shortness of Breath\"]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'red', 'Emergency Physician', 'The patient is unconscious and unable to breathe, indicating a critical emergency requiring immediate intervention.', '2025-11-10 13:46:17', '2025-11-10 13:46:17'),
(98, 36, 14, 'I suddenly developed severe chest pain that spreads to my left arm and neck. I’m having trouble breathing, sweating a lot, and feeling dizzy.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'red', 'Emergency Physician', 'The patient is presenting with severe chest pain radiating to the left arm and neck, accompanied by trouble breathing, excessive sweating, and dizziness, indicating a potential cardiac event that requires immediate emergency attention.', '2025-11-10 14:44:13', '2025-11-10 14:44:13'),
(99, 36, 14, 'I haven’t been sleeping for several days, and I keep hearing voices telling me to hurt myself.\r\nI feel hopeless and think everyone would be better off without me.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'red', 'Psychiatrist', 'The patient is experiencing severe mental health symptoms including thoughts of self-harm, hopelessness, and possibly hallucinations, indicating a high level of risk. Immediate psychiatric evaluation is necessary.', '2025-11-10 14:47:14', '2025-11-10 14:47:14'),
(100, 36, 14, 'My joints have been swollen and painful for several weeks, but today the pain has become unbearable.\r\nI also have a high fever, can’t move my knees or wrists properly, and my hands are turning bluish.\r\nI feel extremely weak and dizzy.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'red', 'Rheumatologist', 'The patient presents with severe joint pain, swelling, high fever, and discoloration of the hands, indicating a possible serious autoimmune or inflammatory condition that requires immediate attention.', '2025-11-10 14:56:23', '2025-11-10 14:56:23'),
(101, 36, 14, 'For the past two weeks, I’ve had mild stiffness in my fingers and knees, especially in the morning.\r\nThe stiffness improves after I move around for a while.\r\nThere’s no swelling, redness, or fever.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'yellow', 'Rheumatologist', 'The patient is experiencing mild stiffness in joints, which could indicate an underlying rheumatological condition. Early evaluation by a specialist is recommended.', '2025-11-10 14:57:52', '2025-11-10 14:57:52'),
(102, 36, 14, 'My joints have been swollen and painful for several weeks, but today the pain has become unbearable.\r\nI also have a high fever, can’t move my knees or wrists properly, and my hands are turning bluish.\r\nI feel extremely weak and dizzy.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'orange', 'Rheumatologist', 'The patient presents with swollen and painful joints, high fever, inability to move knees and wrists, bluish discoloration of hands, extreme weakness, and dizziness. These symptoms may indicate a serious systemic condition such as reactive arthritis or another rheumatic disorder. Immediate evaluation by a rheumatologist is recommended.', '2025-11-10 15:01:10', '2025-11-10 15:01:10'),
(103, 36, 14, 'Mild stiffness in fingers and knees in the morning. Eases after moving. No swelling, redness, or fever. Lasts 3 weeks.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 'yellow', 'Rheumatologist', 'The patient presents with morning stiffness in fingers and knees that lasts for 3 weeks, which may indicate an early symptom of a rheumatologic condition. Referral to a rheumatologist is recommended for further evaluation.', '2025-11-10 15:04:45', '2025-11-10 15:04:45'),
(104, 41, 19, 'Severe pain in the lower right jaw for 5 days, swelling around the gums, and difficulty opening mouth. Pus discharge with mild fever since yesterday.', NULL, NULL, '120/80', 89, 99, NULL, NULL, 0, 1, 3, 'yellow', 'Dentist', 'The patient presents with severe lower jaw pain, swelling around the gums, pus discharge, and mild fever, indicative of a possible dental infection or abscess that requires evaluation and treatment by a dentist.', '2025-11-11 08:25:36', '2025-11-11 08:25:36'),
(105, 41, 19, 'I fell from a height and have severe pain in my left leg. The leg looks deformed, I cannot move it, and there is heavy swelling with some bruising. I also feel dizzy and weak.', '[\"Dizziness\"]', NULL, '120/80', 102, 110, NULL, NULL, 0, 1, 2, 'orange', 'Orthopedic Specialist', 'The patient presents with severe pain, visible deformity, and swelling in the left leg following a fall from a height, indicating a possible fracture. The dizziness and weakness may be related to pain or shock. Immediate orthopedic evaluation is necessary.', '2025-11-13 10:39:53', '2025-11-13 10:39:53'),
(106, 41, 19, 'I fell from a height and have severe pain in my left leg. The leg looks deformed, I cannot move it, and there is heavy swelling with some bruising. I also feel dizzy and weak.', '[\"Dizziness\"]', NULL, '120/80', 103, 99, NULL, NULL, 1, 1, 2, 'orange', 'Orthopedic Specialist', 'The patient presents with severe leg pain, deformation, and swelling after a fall, indicating a possible fracture. The dizziness and weakness suggest potential blood loss or other complications, necessitating urgent orthopedic evaluation.', '2025-11-13 10:52:26', '2025-11-13 10:52:26'),
(107, 41, 19, 'I fell from a height and have severe pain in my left leg. The leg looks deformed, I cannot move it, and there is heavy swelling with some bruising. I also feel dizzy and weak.', '[\"Dizziness\"]', NULL, '120/80', 103, 99, NULL, NULL, 1, 1, 2, 'orange', 'Orthopedic Specialist', 'The patient has fallen from a height and presents with severe pain, deformity, and swelling in the left leg, indicating a potential fracture or serious injury. Additionally, dizziness and weakness may suggest a more critical condition, necessitating immediate orthopedic evaluation.', '2025-11-13 12:22:26', '2025-11-13 12:22:26'),
(108, 41, 19, 'I fell from a height and have severe pain in my left leg. The leg looks deformed, I cannot move it, and there is heavy swelling with some bruising. I also feel dizzy and weak.', '[\"Dizziness\"]', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 2, 'orange', 'Orthopedic Specialist', 'The patient has sustained a significant injury from a fall, indicated by severe pain, deformity, swelling, and bruising in the left leg. The dizziness and weakness could suggest shock or severe pain response, requiring immediate orthopedic evaluation.', '2025-11-13 12:22:56', '2025-11-13 12:22:56'),
(109, 41, 19, 'I fell from a height and have severe pain in my left leg. The leg looks deformed, I cannot move it, and there is heavy swelling with some bruising. I also feel dizzy and weak.', '[\"Dizziness\"]', NULL, '120/80', 102, 99, NULL, NULL, 1, 1, 2, 'orange', 'Orthopedic Specialist', 'The patient has sustained a potential fracture in the left leg due to a fall, exhibiting severe pain, deformity, swelling, and bruising. The dizziness and weakness may indicate a need for immediate evaluation and treatment.', '2025-11-13 13:40:03', '2025-11-13 13:40:03'),
(110, 41, 19, 'I fell from a height and have severe pain in my left leg. The leg looks deformed, I cannot move it, and there is heavy swelling with some bruising. I also feel dizzy and weak.', '[\"Fatigue\",\"Body Pain\",\"Dizziness\"]', NULL, '120/80', 102, 99, NULL, NULL, 1, 1, 2, 'orange', 'Orthopedic Specialist', 'The patient presents with severe leg pain, deformity, swelling, and bruising after a fall, indicating a likely fracture or serious injury. Associated dizziness and weakness could suggest hypovolemia or another concern that should be evaluated promptly.', '2025-11-13 13:48:59', '2025-11-13 13:48:59'),
(111, 41, 19, 'I fell from a height and have severe pain in my left leg. The leg looks deformed, I cannot move it, and there is heavy swelling with some bruising. I also feel dizzy and weak.', '[\"Dizziness\"]', NULL, '120/80', 100, 78, NULL, NULL, 0, 1, 2, 'orange', 'Orthopedic Specialist', 'The patient has severe pain in the left leg with deformed appearance, inability to move, heavy swelling, and bruising, indicating a potential fracture or serious injury. Additionally, dizziness and weakness may suggest blood loss or shock; therefore, prompt evaluation by an orthopedic specialist is recommended.', '2025-11-13 14:56:27', '2025-11-13 14:56:27'),
(112, 41, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 'blue', 'General Physician', 'The patient presents with no symptoms or conditions. A general check-up is recommended to ensure overall health.', '2025-11-17 11:51:54', '2025-11-17 11:51:54'),
(113, 41, 19, 'pet me dard ho raha hy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'yellow', 'General Physician', 'Patient reports experiencing pain, which may require further evaluation to determine the underlying cause.', '2025-11-17 13:01:12', '2025-11-17 13:01:12'),
(114, 41, 19, 'pet me dard ho raaha hy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'yellow', 'General Physician', 'The patient is experiencing pain; further assessment is required to determine the cause and appropriate treatment.', '2025-11-17 13:04:51', '2025-11-17 13:04:51'),
(115, 41, 19, 'boht pet me dard ho raaha hy or peeron me bhi dard hy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'orange', 'Orthopedic Specialist', 'The patient is experiencing pain in both feet and legs, which suggests a potential musculoskeletal issue that requires evaluation by an orthopedic specialist.', '2025-11-17 13:47:49', '2025-11-17 13:47:49'),
(116, 41, 19, 'kuch nazer nahi arha hy clear bhi nahi hy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'yellow', 'Ophthalmologist', 'The patient is experiencing vision issues, which should be evaluated by an ophthalmologist.', '2025-11-18 12:01:41', '2025-11-18 12:01:41'),
(117, 41, 19, 'kuch nazer nahi arha hy clear bhi nahi hy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'yellow', 'Ophthalmologist', 'The patient reports visual impairment (\'kuch nazer nahi arha hy clear bhi nahi hy\'), which necessitates evaluation by an ophthalmologist for potential underlying eye issues.', '2025-11-18 12:07:14', '2025-11-18 12:07:14'),
(118, 41, 19, 'kuch nazer nahi arha hy clear bhi nahi hy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'yellow', 'Ophthalmologist', 'Patient is experiencing visual impairment symptoms and requires evaluation by an ophthalmologist to assess the underlying causes.', '2025-11-18 12:09:19', '2025-11-18 12:09:19'),
(119, 41, 19, 'eyes me dard ho raaha hy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'yellow', 'Ophthalmologist', 'The patient is experiencing eye pain, which could indicate a range of conditions including infection or strain. An evaluation by an ophthalmologist is recommended for proper diagnosis and treatment.', '2025-11-18 12:33:59', '2025-11-18 12:33:59'),
(120, 41, 19, 'eyes me dard hy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'yellow', 'Ophthalmologist', 'The patient is experiencing eye pain, which requires evaluation by an ophthalmologist to determine the underlying cause and recommend appropriate treatment.', '2025-11-18 12:44:35', '2025-11-18 12:44:35'),
(121, 41, 19, 'bady k pet me dard ho raha hy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'orange', 'General Physician', 'The patient is experiencing body pain. Although there are no vital signs or detailed history given, this symptom warrants further evaluation. A general physician can assess the condition and determine if further investigation or treatment is needed.', '2025-11-18 13:02:39', '2025-11-18 13:02:39'),
(122, 41, 19, 'baby k ear me dard ho raha hy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'yellow', 'ENT Specialist', 'The patient is experiencing ear pain, which could indicate an ear infection or other underlying issues requiring evaluation by an ENT specialist.', '2025-11-18 13:17:28', '2025-11-18 13:17:28'),
(123, 41, 19, 'nazala bukar ho raha hy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'yellow', 'ENT Specialist', 'The patient is experiencing nasal congestion, which may indicate a sinus infection or allergic rhinitis. An ENT specialist can evaluate and provide appropriate treatment.', '2025-11-20 10:37:13', '2025-11-20 10:37:13'),
(124, 22, 8, 'Severe lower back pain and knee pain while walking. Difficulty bending and stiffness in the morning.', '[\"Fever\",\"Fatigue\",\"Body Pain\"]', 'Pain started 1 week ago after lifting something heavy. Pain increases with movement. No fever or infection symptoms.', '120/80', 88, 89, NULL, NULL, 0, 0, 3, 'yellow', 'Orthopedic Specialist', 'The patient is experiencing severe lower back and knee pain after lifting a heavy object, accompanied by stiffness and difficulty bending. This suggests a musculoskeletal issue, potentially a strain or sprain. The symptoms may warrant evaluation by an orthopedic specialist.', '2025-12-12 15:41:54', '2025-12-12 15:41:54'),
(125, 41, 19, 'Severe lower back pain and knee pain while walking. Difficulty bending and stiffness in the morning.', '[\"Fatigue\",\"Body Pain\"]', 'Pain started 1 week ago after lifting something heavy. Pain increases with movement. No fever or infection symptoms.', '120/80', 99, 90, NULL, NULL, 0, 0, 3, 'yellow', 'Orthopedic Specialist', 'Patient has severe lower back and knee pain, possibly due to musculoskeletal injury from lifting. Symptoms suggest a strain or sprain, requiring evaluation by an orthopedic specialist.', '2025-12-12 16:08:43', '2025-12-12 16:08:43'),
(126, 22, 8, 'fever', '[\"Fever\",\"Body Pain\",\"Vomiting\"]', 'i feeling cold', '100/55', 102, 80, '[\"Food Allergies\",\"Surgery History\"]', NULL, 0, 0, 3, 'yellow', 'General Physician', 'The patient presents with fever, body pain, and vomiting, which may indicate an infection or other systemic issue. The vitals are stable but require further evaluation by a general physician to determine the underlying cause and appropriate management.', '2025-12-12 17:15:50', '2025-12-12 17:15:50');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, NULL),
(2, 'patient', NULL, NULL),
(3, 'doctor', NULL, NULL);

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
('1eztnarhcitz8fVMu3llAGdpCwhoShxl3TXJ6LMI', NULL, '216.73.216.144', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVzdDOUMwa3U4aXhIbVRJaG9JYWxZaWkyMHU3Q3ZSbk8xRFdzOHFiNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20vc2VydmljZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766661575),
('1nKz9wF7gQKdgdVgoF4jFXK63C7iP3gJaw2XRsG3', NULL, '143.110.220.7', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR1g2Y0pQdXpka2tPcng4MFRORzJ6V2xaTmN4Z0E4blhsTWpWakc3NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767034357),
('1pHbgcomnL5imAoQztHDJ9htG77of4EjEvKCMLb3', NULL, '35.240.66.209', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQVhWVjZIMXdPbW1rbGlsQVFIeUJFN0ZEUUc2RENzeGFNU0lhRkdvayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly90aGMtdGVsZWhlYWx0aC5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766858076),
('3aF8TAJZavaaIwwLZzPvu4XBeWF8jwKAkdAfd81x', NULL, '139.59.137.18', 'Mozilla/5.0 (X11; Linux x86_64; rv:142.0) Gecko/20100101 Firefox/142.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSW9hMHJLZ2h0ZnpmQ0g5UWljYjFwbUx0TEMybEhPVEV5NmhaSjlKSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vd3d3LnRoYy10ZWxlaGVhbHRoLmVkdS1sb2cuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1766977548),
('3CbkYuCl3GWjvi2zjFMPZQIu01yhuloiI0cN2g2z', NULL, '185.248.85.11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkplaHhWakVEM1dXRFA1UmNmY3lNbkdxMTdURzFKTnM3M0ROMll3biI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768042322),
('5taFMIVlBEJ1yMF9tfK60557BMWmKHUNyNQs4IHR', NULL, '34.76.211.142', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicUpkeHZKMVdkTTh6M3VJVG91c05LcklEaWtjcDlVRk5vbzdrcFBFcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly90aGMtdGVsZWhlYWx0aC5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766993079),
('6bxQBAJWewFw27jx158RbDUVMBEtEgHFqU9rj2Mk', NULL, '139.59.137.18', 'Mozilla/5.0 (X11; Linux x86_64; rv:142.0) Gecko/20100101 Firefox/142.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicFZqTWZjQWFGU0dGMlN6b0ZrY0dBWkVBdHBLb1M1S0lDRGY3UGRvQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly93d3cudGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766977548),
('6E8yA75n7ge8LiWEncrhQXbKm43hDkvckKYa9zxi', NULL, '34.82.172.36', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU00zcDB0YnMxMjRVZE9MNVI2aXlNQk5Od1V5Y2VsTlBjTkxGWElzZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly93d3cudGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766741460),
('7p274PbC608NZ1WWzKhrAbFWdSF1k1AcwYa5OR97', NULL, '13.200.236.69', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36 Assetnote/1.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUNJYmpVamhBMGNTTUpQdlVja3JSV3E5YXBLQ0tRTFNYT3BjU2ZyVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766736224),
('7RmB6yVChqMPsUSNOuTyS1GN0kFU4BnUaUhzMoL7', NULL, '137.184.15.107', 'Mozilla/5.0 (X11; Linux x86_64; rv:142.0) Gecko/20100101 Firefox/142.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUVFaZEludWI3cmpKNDliV2h0QXBJdkJrZlIwVndyTFlCZE9Fb01HMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly90aGMtdGVsZWhlYWx0aC5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766693100),
('7zqiaQeMoBoSADJLWrlSUhjYa1ImsqkWm5LJRT3D', NULL, '216.73.216.144', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUzV3Y0FKS0dRN0w4SEljc2F0ZGNIMG15RVRVQlJPb2dORllVY21ZdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20vZG9jdG9ycyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766661409),
('9HaBPOt8NuDpCOpjStf5ccqPulXcTk6EgCpEhoa4', NULL, '74.7.241.29', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.3; +https://openai.com/gptbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYm1Fcko4NEV3cWdxWFI2RkFLZGVoU3d1Mkt3S1RyMzUxRHVkU0lYRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHBzOi8vd3d3LnRoYy10ZWxlaGVhbHRoLmVkdS1sb2cuY29tL2RvY3Rvci9yZWdpc3RlciI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767277159),
('9OXMc23rSLAOzP4vCmDCeRtK2UuQnq1rswFimZON', NULL, '139.59.91.97', 'Mozilla/5.0 (X11; Linux x86_64; rv:139.0) Gecko/20100101 Firefox/139.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQmliOVdtVklTYWVSQm1FcjlzemFyWVZHZXd2MjkxSHdNN1dVV2p4RCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly93d3cudGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767972310),
('9Qcm3SRaCxfm8X8qFNm5pwaMsRqEQqCVciSaqBfH', NULL, '154.28.229.83', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmJnQk5YYnpEclBNZUZYSHRVTWcyU1NGVkMxeElnNlpSRk1aaE9GciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766739850),
('9zzCUpENwfg2QE9kE2iWwjgdVIRAvmncZx9xKn8w', NULL, '104.252.191.162', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXV0UzQxS29oaHo5UVc0MnVCSm9CVzdXSnpBbkRxV1BHVzVFaWFnciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766714530),
('ao2SHPzMvyMjZLhOEr9mSthm8QpQGR8HqHaC2hPL', NULL, '205.210.31.218', 'Hello from Palo Alto Networks, find out more about our scans in https://docs-cortex.paloaltonetworks.com/r/1/Cortex-Xpanse/Scanning-activity', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVpjb0lvcmd0T1RTeXRvdGd6dm9yU1lSbUgwa243aGZ4N1hVNjcxOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly93d3cudGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768049240),
('b0oS0lgWYaKzyU4n3klcpa9ZHswB3l49svHgho1i', NULL, '137.184.36.105', 'Mozilla/5.0 (X11; Linux x86_64; rv:142.0) Gecko/20100101 Firefox/142.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmFURVh2YVN4cWtyUjNINjVKODJ6VllGSDR4N0lOcFZvdEtxWjF0OSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly90aGMtdGVsZWhlYWx0aC5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766867697),
('C6MIXY37gZy2BYwLW2BPhfrxSpQRoexJgtxDcSTi', NULL, '146.148.115.200', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiclVCNDA5OFhwaGRlS2tLMkFHT0FodGxjbEp0OWdQQk5UeUdHTHhrUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly90aGMtdGVsZWhlYWx0aC5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767653557),
('cjr1nLjq0zCsV0Zye2yojXZ8KYpENs042TK13jJh', NULL, '146.70.185.32', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/143.0.7499.4 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVnltNEJUQWxObGZiUmVrbVlWS3JtRDQyelE2RnNMbHFPTWk0QjZjdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vd3d3LnRoYy10ZWxlaGVhbHRoLmVkdS1sb2cuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767045089),
('CoJE0XQcH9P0PSxWfMgdzr3y9cPxa5DI5Pn8XVrB', NULL, '34.124.240.35', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSVV6WE9JeVZ3M0xIbG0xWVRIclRJZ2lHQzZUbjdwUjdBdmpROUd5ciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly90aGMtdGVsZWhlYWx0aC5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766721755),
('CTd0n6OJwIgJ8DcAQCeMFLMe1e1Ifx0BmP0cfs50', NULL, '216.73.216.144', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT3VZQkNReEkxUWM0NXVVd2VlaVJMdjlDZWQ2Rk5mUmV2Y2JQTWhDciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20vYWJvdXQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766661633),
('DhdzDqQrwkc5DW9pm5n3r4nbbN57B3pbtKIOBuKF', NULL, '57.128.243.0', 'Mozilla/5.0 (compatible; VertexWP/1.0; +https://vertexwp.com/bot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaDlvbTdMMkZ0clNEY1YzWm1DYU5JUGZ3dUx2bzZFelBnTWNudkNvayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767001388),
('DHQoWVFn8EtrEb3lsHIN0o1DYTDjpSfpVKZhkiHa', NULL, '137.184.36.105', 'Mozilla/5.0 (X11; Linux x86_64; rv:142.0) Gecko/20100101 Firefox/142.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUkFhSnlPaXhRcjlPVlh6UjZ4dUhMUkYxTmowRUs0OTZvSFBqRmowdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766867699),
('DLzizkIyFKh4IdOtior1pCj7HTBMD6aAh0a5zmpB', NULL, '147.185.132.70', 'Hello from Palo Alto Networks, find out more about our scans in https://docs-cortex.paloaltonetworks.com/r/1/Cortex-Xpanse/Scanning-activity', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmJpOWg2Nmw4VmJWc1Y4Yk9GVldHSEptRHdCOWx5VXZOQm1SbEdsUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767054509),
('dMzCXwERPuEEgH9uJArQL5kxdhEk2IT3FKvfrel8', NULL, '167.94.138.188', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ2wzdm5NSUtSTTdwUkxjellpNTFRRVpXOWJyNXZmNE0zbkYwaUVFMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767983961),
('dncbj54cwWzkmd52sFjeWnMrTIGxewgUAfvHe83P', NULL, '51.89.23.223', 'Mozilla/5.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSVlsQTB4dlplMmc0bXhPY09JMU9DanhoQk05Zk1ma3ppSmZpNmF1cyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766776425),
('DqBm9AJuHHfJX8vCk9m1oTrG6kFeqcnUbIMme8hR', NULL, '182.190.196.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUFhHMGhKblVNZ3dqTW9HY01OVEZlTWZ3NnllbmtuSGRsbHhWaVBtZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768068818),
('DrBqtEuRkZ4CXM2AFIdr2Oq3dtzrJGeqxUOuE8gv', NULL, '34.55.21.180', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0ppSUpyb2ZudHJlVndYMW5vZXZnMUZodUlDYnRsd280Z0czaUQ1QiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly93d3cudGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766916486),
('dxBtcllRP4KacvTGAu7Qf01jgA5on7UOCGDL3huy', NULL, '216.73.216.144', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1dyMnZ4ekprSW9WWm0weThWYmUzQ053UzhEWjQ3dHV5VTdLZHhWayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20vZG9jdG9yL3JlZ2lzdGVyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1766672667),
('Eax2XmKJdcKD9StlSUBiKRO9aarqbNy09sYugaSD', NULL, '35.205.34.20', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoienY4Y2hESW02VGtPSDhPcTNIaG13SWhJV2tlZTBzS0E1VjdaUExEaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly90aGMtdGVsZWhlYWx0aC5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767357981),
('eCSa50RYQBcRDf9aq1nSw5088jtD9AP8jWCc1Lyp', NULL, '216.73.216.144', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT0VZakp1UWFWQno0bXJYZGcwb3NwQWRYWm1YczFkSGxHbkVDU2lKSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20vY29udGFjdC11cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766661353),
('eDJOqfCINX737j0CuJD6p11GPyYC8gu6PABQuPFY', NULL, '34.86.165.24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY1dibHFMamRMVkQxeVppUk5FUHROTGpNOVk1OUpIT002TVlHeGJxUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly90aGMtdGVsZWhlYWx0aC5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766943066),
('EjDkNVGy2HUctkXsD1m1w6X680pPB0LxHa4i3RYU', NULL, '209.38.33.27', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieUZCUlVwakFqdnVEVVpEYTVpR1RkeUt1dnFyNElVdTBXTHBkNUdqaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly90aGMtdGVsZWhlYWx0aC5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767542787),
('EyIcrtY04POSmfWrlbWB2NgHbPtg2fT8pohd02N6', NULL, '34.21.100.47', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaHM5cUtOMlVlWktWZktLdjV2TmxiY1J1MWdyOXZSaWtqazEzQlVQSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly90aGMtdGVsZWhlYWx0aC5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766764889),
('FgKsNwVjlSPQNJbgKgnxJNeO8EPQUAMZ7Y1Ez1Yw', NULL, '104.252.191.203', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVmFhWVl3S2Y1ZnVwajRKSWJIZWJ3Tzd3WE5GNVg1azBTRmUyVWRlRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766718311),
('fl3I4Btnx39vjPVmP0ZxatXotgZ1cKXAAEpU0yqg', NULL, '143.198.70.149', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0NmY0d0UnZWZE9OOFB3bWpIV0VWYUZqNHN1MmZZYTdCM3dCYmZTTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly93d3cudGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768004586),
('Fz4XeIYO6Zbwm8mFZUIrIThUCK1r12FN6nqZzUBm', NULL, '100.31.62.4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT295V2FJOU40MXo3V2s5VG9XVVhrSmE5Vlo1VktUUUlsQlZSOW80VyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vd3d3LnRoYy10ZWxlaGVhbHRoLmVkdS1sb2cuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1766794489),
('GeWzcNoKpJEqV5othxiy9q6puylHdl3RF0cjrRv3', NULL, '216.73.216.144', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibnVOeHc4T3F2bEI2c0NGSk1qTGlKYTYxeno0OXpObGxUdlBSTVdEUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766661510),
('GOBYfXnkwKC44o3QTAe8BqmoMvoY2LGa4eH8upJf', NULL, '147.185.132.18', 'Hello from Palo Alto Networks, find out more about our scans in https://docs-cortex.paloaltonetworks.com/r/1/Cortex-Xpanse/Scanning-activity', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVU9NQ1hYQ1M3eTVUdGxhNDdiMWNScjVnMVc4a0pBT1VORkZHRHdReCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly90aGMtdGVsZWhlYWx0aC5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767689519),
('gQwL8FPlyusl2qFUxts23GiWkWwjfREoafGoXUdR', NULL, '205.210.31.50', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU01tczVwZXgxMTdGcjFic1dQSExScjR5STNiUVBaUkJ2M2t1QUM2MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly93d3cudGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767384199),
('hVWsnukPALhAGCy6nPD0n6ynaEzBdlDvBted08Oi', NULL, '137.184.15.107', 'Mozilla/5.0 (X11; Linux x86_64; rv:142.0) Gecko/20100101 Firefox/142.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaDM4cnluSEtjQkthU3U3c09DYVN6ck1SSzExWlR1Mk1uaW9McUhyNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766693101),
('I7HOhKh42314YEFOunhj10uwTU9wsxBlRBgV11MA', NULL, '204.76.203.25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieVJmdHE0N2V6WHRpdWtpRXpQeEtCbEdYb3RZYTU2c1cxWUsyWkx4cCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767979887),
('ILqVyLrH2tPH1NEwlKwxtBBlVEX1rzPHyzVdKoaT', NULL, '147.182.156.85', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibUN1YzBkbGE3cEJETXBuUmZuSUJzd2FZa3NQeDR4NEtCaW81NDRRRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vd3d3LnRoYy10ZWxlaGVhbHRoLmVkdS1sb2cuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1766800748),
('iWlBuBZvSKVY3px3GgaWEKTqzk2qePNXllzVyh3A', NULL, '205.210.31.163', 'Hello from Palo Alto Networks, find out more about our scans in https://docs-cortex.paloaltonetworks.com/r/1/Cortex-Xpanse/Scanning-activity', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaElGaW1qUHZDdXdtemRUaG5POGVFOHBkalhIUlVQR3laZHhKZGZLTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767970965),
('jQXzZVG2rvgprK84Jm2X0pUOz8daxVUEY28VGSUH', NULL, '104.154.171.238', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUUlYMlIwQ0RidHpQM1NyQndSZDFJS3ZIeUxVUjQ4aFdiUGQ4WHcyNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly90aGMtdGVsZWhlYWx0aC5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766692198),
('kbdOHpSU28jFPqf8LAuFGAqssTJxJPvBYTeuSo7l', NULL, '104.252.191.162', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYkFxbjdXWXNYcmd2Z1llUTFRY1N2MHl3VGtUelZ1dlRhYWw5OTFxSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766714510),
('kWOhFsykAtT6BJjReDd8zNM3Kac76TNVZOItBvul', NULL, '167.94.146.59', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN3l2cXZOSDlkT3BXZURFUWFVaUFKczFaNlhRRlJlaGNKVjFxOGJOYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly90aGMtdGVsZWhlYWx0aC5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767366858),
('LEFoSvmKoF3ZYib4hEEkTolZ7ijZcGUJLlOZiybz', NULL, '34.83.178.87', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFZSSm96c3NTdVM2bFpmRmd1QWswSnl2VnpMcFlUQWVOT0thVTJIeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly93d3cudGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767386962),
('lWyREscQvx73kWiE1wiD6Ju77RxyUCAjL6yrbO1L', NULL, '34.38.186.188', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWRCbWpxQkpFY29DdjdVd3BTdjFwM0ptS0RGeEg1VjRXeFY3Y1lXWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly90aGMtdGVsZWhlYWx0aC5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767861268),
('M8AjbwJWLOYLT0hf9LsmFuq3G2OZmllcqkYSf5Sk', NULL, '34.78.125.214', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3J0YURhNUJMMjBKT1ZJd2JYbVlMVXpzOUVad1l6UjVYVFo0NEI0RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly90aGMtdGVsZWhlYWx0aC5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767395566),
('mkIHH41ZxuPG1hbZtay5UjPQvONvzZo3iHw9Uhos', NULL, '34.78.125.214', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSDNiY1l1TXp1UGFUVDFISUdIejIzR2xieDZvNmJrYm1JSm9RYzd5aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly90aGMtdGVsZWhlYWx0aC5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766880046),
('MOGFIATGyZfIo3BSOOXuNhsVNGGwrwdHfkIrvjPo', NULL, '198.235.24.102', 'Hello from Palo Alto Networks, find out more about our scans in https://docs-cortex.paloaltonetworks.com/r/1/Cortex-Xpanse/Scanning-activity', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUppQWJ4SWVuVkNjdEhVcERwbWFhOUoyOTFLRVRWcHQ2VDNxOFNRMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly93d3cudGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767709841),
('mrDd1MibO5xyNkUX1v4OhJF0WcBmpPIluGjcB4Fz', NULL, '34.148.23.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVTJpWDNUNVZZdlBaMU80SzVVdVpSa2kwcmZ2NG5mbFdpQW9BVkkwNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly90aGMtdGVsZWhlYWx0aC5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766990162),
('Mx37BS8U8GABM44JXAJHXH3HpRZE1k5SLomTJOPP', NULL, '205.210.31.253', 'Hello from Palo Alto Networks, find out more about our scans in https://docs-cortex.paloaltonetworks.com/r/1/Cortex-Xpanse/Scanning-activity', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUxXaVpTZk5jQXdkYlZyZkRaVWtmTnpVc0M3d0dWVWJnMTNxMXVtVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly90aGMtdGVsZWhlYWx0aC5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1768034839),
('NUNiOjdO3R0JVb9JLtqYxeIYcPGEZBHIKSYpoSSK', NULL, '154.28.229.82', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUElvelpobnB0NktjbjJ5ZHBBazNySE90elhFSVU4ZWpBWHJTTWs3NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766718312),
('Nws7wytdM2hwbpCOExl3Wq4fbXrS0lIaYvPtGgL6', NULL, '143.110.220.7', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVNaQTJUSTdjMURuWVNuaGpnZnBmSFdMc0JKcFltclE0UmVnMlo2ZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly90aGMtdGVsZWhlYWx0aC5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767034356),
('NzkDNV7zX3vze2rg1IYW7L1MeWr7AMDm6mzLbS25', NULL, '34.55.21.180', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkJqU3czd01TV21wVHlqWjUwVE9NdVRvWDlLZlJ4U2x1NHQza1FuSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly90aGMtdGVsZWhlYWx0aC5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766916486),
('O5qbMOtZELmPulN4GGImLOTD92SLplchbEmpjhOK', NULL, '3.7.255.24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36 Assetnote/1.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTERVY0kxQU5tQzZaMFpuSHJ4eGZ0c3BuYnYxckJpOFpBS2JzUlVnbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766951076),
('OXBGTvIEsfXckCpQ53fDbSg6xgAbc42KA4moqx6T', NULL, '154.28.229.82', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYW5XZWs2QnJpM3NTQWYwUnNURnRNaDlQYkdCVDE4MDFvMEtRU2FYeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766718316),
('oxOlPWgN9YjjhGZcTNzRFI1OpT52QtsKdxLeQaBL', NULL, '205.210.31.168', 'Hello from Palo Alto Networks, find out more about our scans in https://docs-cortex.paloaltonetworks.com/r/1/Cortex-Xpanse/Scanning-activity', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNGpaMHBuNHpIc2xkblBoV0pZUzl3VnBJR2d0SU5MT2JaNWpCQ0Q1NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly90aGMtdGVsZWhlYWx0aC5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767350504),
('PCGnOU4oeM4w3GqM95FkHa70xjlXHf7M160ICex8', NULL, '146.190.162.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicHlva2FwMU1nMU5RcUU2VUcxN2hkSVVPWEFWVWJJRU1lREFYNUh3WSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly90aGMtdGVsZWhlYWx0aC5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767220629),
('pX3Z4XwnOH8lvBaOhaudzizFabUtmIUJL7mXzkJ8', NULL, '18.217.216.195', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36 Assetnote/1.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWtkWVlBbm82RXJDdXdtZzlIOElaRTQxeGtrMmhndUw0bklIeGE2MCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766809483),
('S7umLUVX7Y2RqkjWVC3SNjNUzdER5hv716Lazd0W', NULL, '104.164.173.44', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0kwQXMxTDhKaE1Ca0xoQklUUzlWbk5oZUFsZmhwM2xTWmpZd25KWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766739860),
('sahYoXd1wDAMHexyxJhIVs6bO8lzkirUdzVfyvQx', NULL, '34.14.29.28', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkRwdEFVMjUyajB2ejlYS0RyVEMxQ2FyUWtzSzVBME5vU2FvUENwSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly90aGMtdGVsZWhlYWx0aC5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766742746),
('T7KAQtRTMshaeifQhookwdVOxfygs1OcxcQ1X9Mx', NULL, '104.164.173.44', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic29iaEJ6bEllS2dEU2FFSFE5VGRWbUIxVXozQU5pN1BxQVJORjEzUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766739850),
('T9uoh3HKhNnaUiFikJTqqHLVnDXSdyJqyouZJnRM', NULL, '35.233.11.8', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSzY2Mjk0R2Yyem92TXJxdG5KWlJFVERTbGM5em44Tm1KSjVVdms1eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly90aGMtdGVsZWhlYWx0aC5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767385516),
('tfgSO9ktkRnByROUIPSuAoND1Thv4eN18mjNAnnS', NULL, '216.73.216.144', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidEdvRVAzVHNId3h0ak9GN3Q5T2lHYXcwaHB4UVJKT3B0amphcGR5bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20vcmVnaXN0ZXIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766666388),
('tkV2nrfJGvG1jQAJNMBs3Biu4WcAqYnWZb2wOMEw', NULL, '198.235.24.123', 'Hello from Palo Alto Networks, find out more about our scans in https://docs-cortex.paloaltonetworks.com/r/1/Cortex-Xpanse/Scanning-activity', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQlozUG0ybk5ZMkViRlk5UjVqaTc5MnNrV2FBRVptbXJUdjliZ3BZdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767644923),
('tomrWBdlK50f21IyCWWcK577PD6j1vBc7no72IW9', NULL, '146.70.197.226', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTjhOdVpOeFRYWlV1bllxeVJEUTNyUWVsTnFJRDJ2cExTOWdqbnRKaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vd3d3LnRoYy10ZWxlaGVhbHRoLmVkdS1sb2cuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1766700564),
('TXHSA2bl5qMuAYTR1ylFEl3MKvx0yM8EpsEfr7st', NULL, '205.210.31.32', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMDI5aEUwaWtzd25tMXo3bVNTUGQ5d002R3lva09wTHhsUUc0c2o0QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly93d3cudGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768048572),
('UADHJoAkMkya6OgVB3EiMWGPU8pkyN6QaBaG85Ib', NULL, '185.247.137.5', 'Mozilla/5.0 (compatible; InternetMeasurement/1.0; +https://internet-measurement.com/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3hUZUo2UjJCdnpYbmtFcVBjSEFPOXNPRlRrZWZvcDdFMXBuRzRUMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vd3d3LnRoYy10ZWxlaGVhbHRoLmVkdS1sb2cuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767720980),
('UFtRgfHHNrjSp3krKIYLbjgsRJIMR7GKs1mzZ1WH', NULL, '45.148.10.143', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQU93UFdqdHZtTkR5eVN5ekN4SDVUWU93VjdhdkhGMEN0R083QU5DTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767105084),
('uXK3CX8dWeHf9DCxqv6CpfjwPGVna2WHNrYjI0A8', NULL, '209.97.179.116', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTGh0Tjk3NmJaTmVlc0NITTREaGNaaUtvbE9XelBsREZQMkRWb0J4aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly93d3cudGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766715110),
('vArXUvzhmgMesMwizriUmOgZTovILO70GVAPCimv', NULL, '100.31.62.4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidmlNcDRWUk9scGdYWEVxR1RqSVlKcWQ4cENCMEc3dUpFZER6aUh5VyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766777832),
('Vpli5ezaKFUSzdKMc8wyatqYjRfaV8YnjYZvEq1f', NULL, '198.235.24.184', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSzdZa1h1NXFwRTZ0YUNEMFpheURUcWRaZHU2VlAwS0hTT0h2cms4NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly90aGMtdGVsZWhlYWx0aC5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767377074),
('vuNMVykDaezsSHuXrQFHhSbpmHAaogRvM48ElZrO', NULL, '205.210.31.45', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRnU0ZmdsaUNEUElaUjNRVUZMVkY5OHVLSE1EWnNob3VJczRpaW9XNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vd3d3LnRoYy10ZWxlaGVhbHRoLmVkdS1sb2cuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767388091),
('W5MsxTSnPMnbd9O4We0PSq0OiebpLyOTOFyd9Y3F', NULL, '34.78.223.218', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHBybExWRno4Qkw5SWFYVWJHRlBoeFc1VVJsMzM2WThYSFI0MXNjRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly90aGMtdGVsZWhlYWx0aC5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767911453),
('W800OIXd5tWs8Ut2cgMH2Fy4wMzAKPhYeo3ZATL2', NULL, '147.182.156.85', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGNuZldaempDTHVZaDlvd0NTS2Y5SmVwcmZFSTNnZDdqY1dMQkw5YiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly93d3cudGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766800747),
('WwfkGtZV7mwJ5IMCSa2Zdn97BpqTXjjlblEK9UTZ', NULL, '34.76.27.197', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUFJUNzc0SjNTZk13emhGb2N6cHZxcWdCVlNIUGoyekdLbmduMDIyeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly93d3cudGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766775551),
('XaIgsvjWjveQ2v8Z0V5ogB18Drg2q8YQoCRZLS9D', NULL, '35.198.231.204', 'Mozilla/5.0 (Linux; Android 12) Chrome/111.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGxaeWk3SHpJTUl0U2U2RVlBNWpwbnlKVE90VG53aFJiUHpnS3NZMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly90aGMtdGVsZWhlYWx0aC5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1766815016),
('XP492yMiNhx4NJUv2kjav5eSfMTMSGIjCyCrz3F9', NULL, '216.73.216.144', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; ClaudeBot/1.0; +claudebot@anthropic.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTEoxSWJNWHRBYzBOUFVLTE9HMjVNdVZOZUJtR3JOSXAybTRaN3BKZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDk6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20vcGFzc3dvcmQvcmVzZXQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766666688),
('YnszhkjXvfog8tjfzEZBxwLqWlE7p91Bq2QFC35E', NULL, '154.28.229.125', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRFgzc1FheGFnUWk1bzdvUll6bmM2emZIekNGMURlSElpTlpLdXVURSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766714510),
('yPShy3TeSG9hm4WxllD8wKDY5pI0pbM2ZWbks56I', NULL, '205.210.31.44', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHZIM3BPRGZwTU1KMmY2clhOTzlOMHlBazh0YnExcEdjbXcxVGZlTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767584658),
('yTjdeyf820AK6ALNu4MLdqUAAK8HVNZwCTr1JqdC', NULL, '209.97.179.116', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWVtOVlpYVk5MmNRZlQ1ZnZzbkpnelRjT2o5SUt4Q2N1dmpTUVBhTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vd3d3LnRoYy10ZWxlaGVhbHRoLmVkdS1sb2cuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1766715110),
('zb4X0b9KiAyQI5bf4IWQmnB1esJ6VhjLfdF9P9LN', NULL, '139.59.91.97', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidDdTVXMxVE5qaDlxWWxLckVZU0R2c1A1cGxwTVMzMHgyZWlLYUh0cyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vd3d3LnRoYy10ZWxlaGVhbHRoLmVkdS1sb2cuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767972312),
('Zq85RSvGD5qTtv3Tca5CNb2IGjbRoFfrKOiOBEBH', NULL, '34.78.223.218', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEh4MHFHNU5Sb2dWSUs3SWd2NjlnZTk1dXRMcklMVE1pSjZXV3B5biI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly90aGMtdGVsZWhlYWx0aC5lZHUtbG9nLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767137545),
('zSamxlL7DNYS8Ho96Cj1o7e4NuqByyjV0J2emq2Q', NULL, '104.154.171.238', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUpGMW9pMHFDbDRFSURJUEJxVHRvVUNUUFlkM0hRTnB5UDd6ZnowcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly93d3cudGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1766692198),
('zufrWzV4xuuITeZ0yyVc2uJIq53K1gF0zeg4R08H', NULL, '205.210.31.98', 'Hello from Palo Alto Networks, find out more about our scans in https://docs-cortex.paloaltonetworks.com/r/1/Cortex-Xpanse/Scanning-activity', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNnBZUlhrV3ZobGljUmR2cWxwNTFWczFrZmU5cU1SUlp3bnVXVVUxUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767317945),
('zvWHmcOyy2QabT357c4DYMI3DCRj7vMgzZOwbcXL', NULL, '209.38.33.27', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic0RIVDJOREVPaU1ma1piZkQ4cnFWdFVMdTNrSVAzSTNSNXFjMFk4cyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vdGhjLXRlbGVoZWFsdGguZWR1LWxvZy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767542787);

-- --------------------------------------------------------

--
-- Table structure for table `specializations`
--

CREATE TABLE `specializations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `specializations`
--

INSERT INTO `specializations` (`id`, `name`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Dentist', 'dant k', 1, '2025-11-04 08:52:10', '2025-11-07 12:58:52'),
(3, 'Cardiologist', 'Specializes in conditions of the heart and blood vessels.', 1, '2025-11-04 10:47:14', '2025-11-04 12:05:40'),
(4, 'Dermatologist', 'Treats diseases of the skin, hair, and nails.', 1, '2025-11-04 10:49:08', '2025-11-04 12:07:00'),
(5, 'Radiologist', 'tt', 1, '2025-11-04 11:37:05', '2025-11-04 11:37:35'),
(6, 'Anticoagulation', 'prevent the coagulation of blood', 1, '2025-11-04 11:54:36', '2025-11-04 11:54:36'),
(7, 'Breast surgery', 'treating cancer, correcting non-cancerous issues, or altering the size', 1, '2025-11-04 11:56:16', '2025-11-04 11:56:16'),
(8, 'Cardiothoracic surgery', 'surgically treating chest, primarily the heart, lungs, esophagus, and major blood vessels', 1, '2025-11-04 11:59:07', '2025-11-04 11:59:38'),
(9, 'Chemical pathology', 'biochemical investigation of bodily fluids', 1, '2025-11-04 12:00:40', '2025-11-04 12:00:40'),
(10, 'Nephrologist', 'Focuses on kidney diseases.', 1, '2025-11-04 12:08:13', '2025-11-04 12:08:13'),
(11, 'Neurologist', 'Specializes in disorders of the nervous system, including the brain and spinal cord.', 1, '2025-11-04 12:09:03', '2025-11-04 12:09:03'),
(12, 'Oncologist', 'Treats cancer', 1, '2025-11-04 12:09:41', '2025-11-04 12:09:41'),
(13, 'Orthopedic surgeon', 'Performs surgery on bones, joints, and muscles.', 1, '2025-11-04 12:10:05', '2025-11-04 12:10:05'),
(14, 'Psychiatrist', 'Diagnoses and treats mental health conditions.', 1, '2025-11-04 12:10:32', '2025-11-04 12:10:32'),
(15, 'Family medicine', 'Provides continuous and comprehensive care for all ages and genders.', 1, '2025-11-04 12:21:58', '2025-11-04 12:21:58'),
(16, 'Health & fitness', 'diagnoses and treats injuries.', 1, '2025-11-04 12:23:14', '2025-11-04 12:23:14'),
(17, 'Hematology', 'diseases related to blood.', 1, '2025-11-04 12:23:54', '2025-11-04 12:23:54'),
(18, 'Gynecologist', 'Care before, during, and after pregnancy and childbirth.', 1, '2025-11-04 12:24:36', '2025-11-04 12:24:36'),
(19, 'Ophthalmologist', 'treatment, and surgery of the eyes and vision', 1, '2025-11-04 12:25:05', '2025-11-04 12:25:05'),
(20, 'Pediatrician', 'provides medical care for children from birth to age 18', 1, '2025-11-04 12:32:46', '2025-11-04 12:32:46'),
(21, 'Thoracic surgery', 'surgical procedures performed on the chest, excluding the heart and great vessels,', 1, '2025-11-04 12:33:18', '2025-11-04 12:33:18'),
(22, 'Pulmonologist', 'Treats diseases of the lungs and respiratory system.', 1, '2025-11-04 12:35:32', '2025-11-04 12:35:32'),
(23, 'Gastroenterologist', 'Focuses on the digestive system (stomach, intestines, liver, pancreas).', 1, '2025-11-04 12:35:54', '2025-11-04 12:35:54'),
(24, 'Urologist', 'Treats diseases of the urinary tract and male reproductive organs.', 1, '2025-11-04 12:36:20', '2025-11-04 12:36:20'),
(25, 'Allergist', 'Diagnoses and manages allergies, asthma, and immune disorders.', 1, '2025-11-04 12:36:43', '2025-11-12 12:58:29'),
(26, 'Rheumatologist', 'Treats autoimmune and joint diseases such as arthritis and lupus.', 1, '2025-11-04 12:37:20', '2025-11-04 12:37:20'),
(27, 'Neurosurgeon', 'Performs surgery on the brain, spine, and nervous system.', 1, '2025-11-04 12:37:54', '2025-11-04 12:37:54'),
(28, 'Ent specialist', 'Treats conditions of the ear, nose, and throat.', 1, '2025-11-04 12:38:15', '2025-11-04 12:43:44'),
(29, 'Emergency Physician', 'Provides immediate care in emergency and trauma situations.', 1, '2025-11-04 12:38:46', '2025-11-04 12:38:46'),
(30, 'General physician', NULL, 1, '2025-11-04 12:45:11', '2025-11-04 12:45:11'),
(31, 'Orthopedic specialist', 'treats bone, joint, and muscle problems through non-surgical methods,', 1, '2025-11-04 12:48:47', '2025-11-04 12:48:47'),
(32, 'Hematologist', NULL, 1, '2025-11-04 12:52:24', '2025-11-04 12:52:24'),
(33, 'Infectious disease specialist', NULL, 1, '2025-11-04 12:53:07', '2025-11-04 12:53:07'),
(34, 'Critical care specialist', NULL, 1, '2025-11-04 12:53:49', '2025-11-04 12:53:49'),
(35, 'Internal medicine', 'hn', 1, '2025-11-04 12:54:29', '2025-11-12 13:12:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `father_husband_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `dob` date DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `father_husband_name`, `email`, `email_verified_at`, `password`, `dob`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'Bilal1', 'nazim', 'codeinnovatepro2@gmail.com', NULL, '$2y$12$lDrtylGIO60k..T2NbvFH.3pxV./7OBc0Pr/DcJkeVzva1f37AJya', '2025-10-21', 2, NULL, '2025-10-21 08:19:14', '2025-10-21 08:19:14'),
(4, 'usama', 'khan', 'student41291@gmail.com', NULL, '$2y$12$CheapeH4C4XuBlkDi/yFk.JjcqWyGA4ztbCWK1r/iOTueaMvttDkS', '2025-10-21', 2, NULL, '2025-10-21 08:57:29', '2025-10-21 08:57:29'),
(5, 'anas', 'khan', 'anas@gmail.com', NULL, '$2y$12$UwDUgKcEnXLxiw901oOVDe9Zck53/IgxwbQyevETdDnF02YgIJjOm', '2025-11-07', 2, NULL, '2025-10-21 09:03:30', '2025-10-21 09:03:30'),
(9, 'shahryar', NULL, 'shahryar@gmail.com', NULL, '$2y$12$mhOYJy70tm4BtbrPmaFJpOwPwWwUlJif9TeyKpqjgELABqMKrIT9K', '1996-10-13', 3, NULL, '2025-10-23 06:34:08', '2025-10-23 06:34:08'),
(10, 'Maryam Fatima', 'irfan', 'maryam@gmail.com', NULL, '$2y$12$S.CFus42n./pF9m/Gnc.w.U2noZZklyI/N5JF0VBHNiRjt1l5jT1O', '2023-09-10', 3, NULL, '2025-10-23 06:41:26', '2025-10-23 06:41:26'),
(11, 'Haris', 'khan', 'haris@gmail.com', NULL, '$2y$12$ssPL3drdDno4qezQdplG6.KtlyuxrJswzqIfNJ4RjVlTUpO4G/JJ.', '2023-06-06', 3, NULL, '2025-10-23 06:47:37', '2025-10-23 06:47:37'),
(12, 's', 's', 'ss@gmail.com', NULL, '$2y$12$xIQM3SPZ6FSl.4oODHu6f.pMxBDG4QBjqdfpH5Xsf99RBZM/VxJyC', '2025-10-16', 2, NULL, '2025-10-23 07:58:26', '2025-10-23 07:58:26'),
(15, 'admin', 'admin', 'admin@gmail.com', NULL, '$2y$12$6xmTC0tC7qZ9ifNV.Nxv0OsyLcPjRasiKvk9x25nwQIgmr1Qiz2Ne', '2025-10-23', 1, 'vqsDfICHKalD5xfxQrNe4KcFFbcDq5bTYg0ksVYRv8ZFNiIcc7pTcy1BgPlK', '2025-10-23 08:32:37', '2025-10-23 08:32:37'),
(16, 'Brenden Snyder', 'Lev Serrano', 'Brenden@gmail.com', NULL, '$2y$12$yRqATzj3YsZ638ioGbtBCeCp3wO4U18TRqMI.qDlR2UQucvNT.HZm', '1985-02-27', 2, NULL, '2025-10-24 10:03:49', '2025-10-24 10:03:49'),
(17, 'Teagan Merritt', 'Demetria Rosales', 'Teagan@gmail.com', NULL, '$2y$12$p/lb1uDjVudaHp3cDtDkrOKPuaEsKf6V07Gukq7bPe.Yag9W2WDvG', '2011-09-18', 3, NULL, '2025-10-24 10:07:24', '2025-10-24 10:07:24'),
(18, 'Zane Larson', 'Naida Santana', 'Zane@gmail.com', NULL, '$2y$12$nbQCJ569G7vuiHiguPyOhOmOEVrTPgZqt2l7Xy.JU3UumD9eJnfTG', '1971-11-27', 2, NULL, '2025-10-27 03:47:09', '2025-10-27 03:47:09'),
(19, 'Shelby Diaz', 'Aaron Delacruz', 'Shelby@gmail.com', NULL, '$2y$12$JsaDZsw5bzH9GOFphlKNKuTPCjyo7KplSLIUVHMT.bbKeyAMYm0AG', '1979-09-16', 3, NULL, '2025-10-27 03:49:01', '2025-10-27 03:49:01'),
(20, 'AFFAN JANAB\'', 'Cullen Wong', 'affan@gmail.com', NULL, '$2y$12$mhOYJy70tm4BtbrPmaFJpOwPwWwUlJif9TeyKpqjgELABqMKrIT9K', '2008-06-23', 3, NULL, '2025-10-27 10:23:30', '2025-10-27 10:23:30'),
(21, 'Harriet Wood', 'Aiko Holland', 'Harriet@gmail.com', NULL, '$2y$12$MOGLtdNQx2QRXVw8LVII/e9r0kA3llV.XWuMvHpe8PNjBTIHTI3ey', '1988-04-26', 3, NULL, '2025-10-27 10:26:42', '2025-10-27 10:26:42'),
(22, 'eman', 'fatima', 'eman@gmail.com', NULL, '$2y$12$LdDR3grSurfnlJjou58.PeUy8UZsMEiZauxZQAPV.vFiu3dS5RMq.', '2010-10-26', 2, NULL, '2025-10-30 03:34:52', '2025-10-30 03:34:52'),
(23, 'Chester Henderson', 'Mia Merrill', 'pujyhyre@gmail.com', NULL, '$2y$12$8UOD.tsPuqWimUHXXNoRPu.7YXtyVt3AW43KsjU1wYEADOzB.hWSe', '1979-10-01', 2, NULL, '2025-10-31 10:39:26', '2025-10-31 10:39:26'),
(24, 'Pandora William', 'Kasper Green', 'vutyj@gmail.com', NULL, '$2y$12$xAonyMRRUlG1EKbaDUFNYeSrbw5CA1OfFow8KCcqP63i7h/6dObj.', '1995-11-08', 3, NULL, '2025-10-31 10:41:34', '2025-10-31 10:41:34'),
(25, 'Solomon Castro', 'Stone Holman', 'hamza@gmail.com', NULL, '$2y$12$Em7GMC7msHqJ4WzaFKDOaOZsauvciCQmRu7mOUmLhwakyV7OkdpiK', '1990-03-02', 3, NULL, '2025-10-31 11:48:17', '2025-10-31 11:48:17'),
(26, 'Guzman', 'Trevor Compton', 'Guzman@gmail.com', NULL, '$2y$12$3hYBzu.tLAtZX49XZFx4Qu152zn2YtAmgRGQzrxIaHI/9X9XCdPB6', '2006-11-21', 2, NULL, '2025-10-31 11:50:28', '2025-10-31 11:50:28'),
(27, 'kinza', 'fatima', 'kinza@gmail.com', NULL, '$2y$12$xJOzAV6LHvWhIC8899Et5O0oo3zqDto9rXxZkbJIN9n8O0LdoEGLm', '2025-10-24', 2, NULL, '2025-10-31 14:15:44', '2025-10-31 14:15:44'),
(28, 'Dr.Hafsa', 'Danish', 'hafsa@gmail.com', NULL, '$2y$12$8OpF3AiR9sWlmShCG021AuYOWQ/AAnGxWZASSnHg0wbgy/s/mm9FK', '2000-06-21', 3, NULL, '2025-10-31 14:23:34', '2025-10-31 14:23:34'),
(29, 'Dr. adnan', 'khan', 'adnan@gmail.com', NULL, '$2y$12$z0H1fOqjBvFxaNCumHFogOYXBR.RIByCxKCL02lzpe2jRjAQNBTMq', '2025-10-14', 3, 'vJ8bYUYPsmIVDhD8sPHihnA35sq7h1YiIkhwc8C0t7fXGYzlqTuhFQAQPerJ', '2025-10-31 14:48:14', '2025-10-31 14:48:14'),
(30, 'Dr. Amir', 'khan', 'Amir@gmail.com', NULL, '$2y$12$3yzmiMouh9J6y9oUXeW4d.KicCpFcdp9UHV5SeKD7Zyg0ulKL2ma.', '2025-10-21', 3, NULL, '2025-10-31 14:53:09', '2025-10-31 14:53:09'),
(31, 'Dr. Ammar', 'aslam', 'Ammar@gmail.com', NULL, '$2y$12$yC0g82Bz7GVEzYDT1yZR7uDfy5lgRQUHm6vD4bpZqeGWpE2tFQLMG', '2006-06-22', 3, NULL, '2025-11-04 13:01:03', '2025-11-04 13:01:03'),
(32, 'Dr. Areeba', 'shaikh', 'Areeba@gmail.com', NULL, '$2y$12$DTG55tT97VXZ7JH65eMHXOXth9Ks9OSMpUDQGBuQDPap79i2hOZve', '2008-06-17', 3, NULL, '2025-11-04 13:05:20', '2025-11-04 13:05:20'),
(33, 'Dr. Bilal Nazim', 'khan', 'Bilal1@gmail.com', NULL, '$2y$12$Pa/mr7plXdWn4KN0rP9Ed.rQ1PS.qXX5GJDR3mMOVq74O86UOwcUi', '1999-11-07', 3, NULL, '2025-11-04 13:07:09', '2025-11-14 07:58:51'),
(34, 'ayesha', 'hafeez', 'ayesha@gmail.com', NULL, '$2y$12$6qrknugG0lwIlPsBH8sUCuKIQJN9.hCFszaD/oteHiiKvQi0j1XG6', '2011-06-04', 2, NULL, '2025-11-04 13:09:37', '2025-11-04 13:09:37'),
(35, 'usama', 'g', 'codeinnovatepro3@gmail.com', NULL, '$2y$12$X4anGrcm2bJG4jU9Jnv6nuHEwcMJdKT6HZ9iTIclT9kz9mYfECN1O', '2025-11-14', 2, NULL, '2025-11-05 07:42:09', '2025-11-05 07:42:09'),
(36, 'amna', 'khan', 'amna@gmail.com', NULL, '$2y$12$O38ciGthFaBTUwiLE/hG/O5ossZdKE9SEoAoYqXJzfeCdn9vwCihm', '2015-06-06', 2, NULL, '2025-11-06 16:07:57', '2025-11-06 16:07:57'),
(37, 'ayat noor', 'Aslam', 'ayat@gmail.com', NULL, '$2y$12$CrHujCf8EtZFbZBV9g.AOecAFuHgELgoT076vGRrFugUfgAKkg5a6', '1998-05-23', 2, NULL, '2025-11-10 07:59:22', '2025-11-10 07:59:22'),
(38, 'hasin', 'khan', 'hasin@gmail.com', NULL, '$2y$12$iedlfLe0qnXPZ7HcFNllGuzzGakpXRuxT3p5mWYChpSLWuCq2H8j6', '2004-06-12', 2, NULL, '2025-11-10 11:22:33', '2025-11-10 11:22:33'),
(39, 'afreen', 'shan', 'afreen@gmail.com', NULL, '$2y$12$8uMHYjetV.yxrZl2n9eS3u9B2Gtxkl8QJvc8XfE8rGB85ebDayVh.', '2008-07-10', 2, NULL, '2025-11-10 11:24:37', '2025-11-10 11:24:37'),
(40, 'ayan', 'naeem', 'ayan@gmail.com', NULL, '$2y$12$8hU1B8C8.S0NFEpmRDXAMeXjpQeS3aWgy2LYH9B0fFRXiYzmrqI0u', '2025-11-13', 2, NULL, '2025-11-10 14:37:59', '2025-11-10 14:37:59'),
(41, 'kainat', 'hameed', 'codeinnovatepro@gmail.com', NULL, '$2y$12$dzm1.2hR/S57JbLTUHx2su6kQQJKibV4pjlwv6p1iRxPucfA2PIOm', '2006-10-10', 2, NULL, '2025-11-11 07:30:05', '2025-11-25 13:41:59'),
(42, 'Nawaz', 'Sharif', 'Nawaz@gmail.com', NULL, '$2y$12$90/qCUypl6tQAJQtLYoIjeO4qLT1BaLaeaJ75St01LAHcae0/JN3u', '1993-01-12', 3, NULL, '2025-11-11 07:40:21', '2025-11-11 07:40:21'),
(45, 'Uzair', 'haris', 'Uzair@gmail.com', NULL, '$2y$12$dq60yygXp.WhorRhNOUpg.3vqBc610s9QH9vO2GkbiLnjVi9VMlDK', '2006-07-12', 3, NULL, '2025-11-12 12:26:48', '2025-11-12 12:26:48'),
(46, 'Theodore Heath', 'Yen Neal', 'Theodore@gmail.com', NULL, '$2y$12$/YKIJdf700AJC4ieXN4.vudsyBJfDb0b4oX7ERr1ekN835g7abfbG', '2016-11-17', 2, NULL, '2025-11-12 12:37:21', '2025-11-12 12:37:21'),
(47, 'Uta Greene', 'Haley Holland', 'paxury@mailinator.com', NULL, '$2y$12$E74o3NWqclxeQDGYReoAPurPELyZep.dvrttASWDy68a6hU4ZTwKa', '2008-05-23', 3, NULL, '2025-11-12 12:38:07', '2025-11-12 12:38:07'),
(49, 'Dr. Naeem', 'Altaf', 'Naeem@gmail.com', NULL, '$2y$12$lmnmP7WfzIuddYKBTnboLeyabGfaZCQpP/SfM/1EFOn3BX.m6zd0q', '2009-06-13', 3, NULL, '2025-11-13 09:27:40', '2025-11-13 09:27:40'),
(50, 'Dr. Naeem 2', 'Altaf', 'Naeem2@gmail.com', NULL, '$2y$12$AkaO6uN9GFyv55Y5sJjjtOFS/tzLNkOntewsT4a/.H9j9UiMsvAZa', '2025-11-17', 3, NULL, '2025-11-13 09:31:24', '2025-11-13 09:31:24'),
(51, 'Dr. Naeem3', 'Altaf', 'Naeem3@gmail.com', NULL, '$2y$12$mtBjdJwZLzMrFgkQrDW0nO25G9kLd/wbucbdKzVykfPBrb8lv5C0i', '2003-03-18', 3, NULL, '2025-11-13 09:45:56', '2025-11-13 09:45:56'),
(52, 'Dr. Naeem4', 'Altaf', 'Naeem4@gmail.com', NULL, '$2y$12$2/9JsqK3yumrPLqyocCx1OZ4GhBFxmqG5/MzWlMVL1ehBQnbIyptW', '2025-11-23', 3, NULL, '2025-11-13 09:53:02', '2025-11-13 09:53:02'),
(53, 'harisss', 'Altaf', 'harisss@gmail.com', NULL, '$2y$12$UEjkghrXBOI1b6vkO00LjuZJVU4tsSp9Uw7sW0NLixdzsMaF.wf8G', '2015-03-25', 3, NULL, '2025-11-13 10:00:40', '2025-11-13 10:00:40'),
(54, 'ayan', 'najam', 'codeinnovatepro23@gmail.com', NULL, '$2y$12$bWGE10d1X/CuDcEG.LTWl.B9Iq70G.rhvzz02bvu..DA91kAdiqny', '2025-11-06', 2, NULL, '2025-11-27 14:07:00', '2025-11-27 14:07:00'),
(55, 'huzaifa', 'khan', 'huzaifa@gmail.com', NULL, '$2y$12$AiqtFfzUDBmrPeghmCh67.wDwB/i5Fau1OAI.rMImyGkfry6XkPiq', '2025-12-17', 3, NULL, '2025-12-12 15:52:12', '2025-12-12 15:52:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointments_doctor_id_foreign` (`doctor_id`),
  ADD KEY `appointments_patient_id_foreign` (`patient_id`),
  ADD KEY `appointments_patient_intake_id_foreign` (`patient_intake_id`);

--
-- Indexes for table `appointment_notes`
--
ALTER TABLE `appointment_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointment_notes_appointment_id_foreign` (`appointment_id`),
  ADD KEY `appointment_notes_doctor_id_foreign` (`doctor_id`);

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
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `specialization_id` (`specialization_id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `doctors_user_id_unique` (`user_id`);

--
-- Indexes for table `doctor_schedules`
--
ALTER TABLE `doctor_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_doctor_schedule_doctor` (`doctor_id`);

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
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `patient_intakes`
--
ALTER TABLE `patient_intakes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_intakes_user_id_foreign` (`user_id`),
  ADD KEY `patient_intakes_patient_id_foreign` (`patient_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `specializations`
--
ALTER TABLE `specializations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `fk_users_roles` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `appointment_notes`
--
ALTER TABLE `appointment_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `doctor_schedules`
--
ALTER TABLE `doctor_schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `patient_intakes`
--
ALTER TABLE `patient_intakes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `specializations`
--
ALTER TABLE `specializations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointments_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointments_patient_intake_id_foreign` FOREIGN KEY (`patient_intake_id`) REFERENCES `patient_intakes` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `appointment_notes`
--
ALTER TABLE `appointment_notes`
  ADD CONSTRAINT `appointment_notes_appointment_id_foreign` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointment_notes_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`specialization_id`) REFERENCES `specializations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `doctor_schedules`
--
ALTER TABLE `doctor_schedules`
  ADD CONSTRAINT `fk_doctor_schedule_doctor` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `fk_patients_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `patient_intakes`
--
ALTER TABLE `patient_intakes`
  ADD CONSTRAINT `patient_intakes_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `patient_intakes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
