-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2020 at 02:43 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laraveltask`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
(7, '2014_10_12_000000_create_users_table', 1),
(8, '2014_10_12_100000_create_password_resets_table', 1),
(9, '2019_08_19_000000_create_failed_jobs_table', 1),
(10, '2020_08_30_073659_create_oex_portals_table', 1),
(11, '2020_09_02_140345_create_oex_exam_question_masters_table', 1),
(12, '2020_09_02_171438_create_oex_results_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oex_exam_question_masters`
--

CREATE TABLE `oex_exam_question_masters` (
  `id` int(10) UNSIGNED NOT NULL,
  `exam_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ans` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oex_exam_question_masters`
--

INSERT INTO `oex_exam_question_masters` (`id`, `exam_id`, `question`, `ans`, `options`, `status`, `created_at`, `updated_at`) VALUES
(1, '1', 'Which river of Bangladesh originates in Tibet?', 'Brahmaputra', '{\"option1\":\"Brahmaputra\",\"option2\":\"Padma\",\"option3\":\"Surma\"}', '1', NULL, NULL),
(2, '1', 'What is the main religion practiced in Bangladesh?', 'Islam', '{\"option1\":\"Buddism\",\"option2\":\"Islam\",\"option3\":\"Hinduism\"}\r\n', '1', NULL, NULL),
(3, '2', 'On which continent is Bangladesh located?', 'Asia', '{\"option1\":\"Asia\",\"option2\":\"Africa\",\"option3\":\"Europe\"}', '1', NULL, NULL),
(4, '2', 'The world\'s largest river delta found in Bangladesh is the delta of which river ?', 'Ganga', '{\"option1\":\"Brahmaputra\",\"option2\":\"Ganga\",\"option3\":\"Padma\"}', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oex_portals`
--

CREATE TABLE `oex_portals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oex_portals`
--

INSERT INTO `oex_portals` (`id`, `name`, `email`, `mobile_no`, `password`, `status`, `created_at`, `updated_at`) VALUES
(1, 'suborna020', 'suborna020@gmail.com', '123', 'suborna020', '1', '2020-09-02 15:12:34', '2020-09-02 15:12:34'),
(2, 'suborna0200', 'suborna0200@gmail.com', '123', 'suborna0200suborna0200', '1', '2020-09-18 06:18:50', '2020-09-18 06:18:50'),
(3, 'subosa', 'as20@gmail.com', '123', 'subosasubosa', '1', '2020-09-18 06:28:12', '2020-09-18 06:28:12');

-- --------------------------------------------------------

--
-- Table structure for table `oex_results`
--

CREATE TABLE `oex_results` (
  `id` int(10) UNSIGNED NOT NULL,
  `exam_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `yes_ans` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_ans` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `result_json` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oex_results`
--

INSERT INTO `oex_results` (`id`, `exam_id`, `user_id`, `yes_ans`, `no_ans`, `result_json`, `created_at`, `updated_at`) VALUES
(1, '1', '1', '0', '4', '{\"1\":\"NO\",\"2\":\"NO\",\"3\":\"NO\",\"4\":\"NO\"}', '2020-09-02 15:28:21', '2020-09-02 15:28:21'),
(2, NULL, '1', '0', '4', '{\"1\":\"NO\",\"2\":\"NO\",\"3\":\"NO\",\"4\":\"NO\"}', '2020-09-02 15:37:47', '2020-09-02 15:37:47'),
(3, '1', '2', '0', '4', '{\"1\":\"NO\",\"2\":\"NO\",\"3\":\"NO\",\"4\":\"NO\"}', '2020-09-02 15:38:11', '2020-09-02 15:38:11'),
(4, NULL, '1', '0', '4', '{\"1\":\"NO\",\"2\":\"NO\",\"3\":\"NO\",\"4\":\"NO\"}', '2020-09-02 15:49:01', '2020-09-02 15:49:01'),
(5, NULL, '1', '3', '1', '{\"1\":\"NO\",\"2\":\"YES\",\"3\":\"YES\",\"4\":\"YES\"}', '2020-09-02 15:53:52', '2020-09-02 15:53:52'),
(6, NULL, '1', '0', '4', '{\"1\":\"NO\",\"2\":\"NO\",\"3\":\"NO\",\"4\":\"NO\"}', '2020-09-02 16:24:49', '2020-09-02 16:24:49'),
(7, NULL, '1', '0', '4', '{\"1\":\"NO\",\"2\":\"NO\",\"3\":\"NO\",\"4\":\"NO\"}', '2020-09-02 16:27:46', '2020-09-02 16:27:46'),
(8, NULL, '1', '0', '4', '{\"1\":\"NO\",\"2\":\"NO\",\"3\":\"NO\",\"4\":\"NO\"}', '2020-09-02 16:31:11', '2020-09-02 16:31:11'),
(9, NULL, '1', '0', '4', '{\"1\":\"NO\",\"2\":\"NO\",\"3\":\"NO\",\"4\":\"NO\"}', '2020-09-02 16:31:52', '2020-09-02 16:31:52'),
(10, NULL, '1', '0', '4', '{\"1\":\"NO\",\"2\":\"NO\",\"3\":\"NO\",\"4\":\"NO\"}', '2020-09-02 16:32:25', '2020-09-02 16:32:25'),
(11, NULL, '1', '1', '3', '{\"1\":\"NO\",\"2\":\"NO\",\"3\":\"NO\",\"4\":\"YES\"}', '2020-09-02 16:35:01', '2020-09-02 16:35:01'),
(12, NULL, '1', '2', '2', '{\"1\":\"NO\",\"2\":\"NO\",\"3\":\"YES\",\"4\":\"YES\"}', '2020-09-02 16:54:12', '2020-09-02 16:54:12'),
(13, NULL, '1', '0', '4', '{\"1\":\"NO\",\"2\":\"NO\",\"3\":\"NO\",\"4\":\"NO\"}', '2020-09-17 01:21:45', '2020-09-17 01:21:45'),
(14, NULL, '1', '1', '3', '{\"1\":\"YES\",\"2\":\"NO\",\"3\":\"NO\",\"4\":\"NO\"}', '2020-09-17 13:05:22', '2020-09-17 13:05:22');

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
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'suborna020', 'suborna020@gmail.com', NULL, '$2y$10$hm.G88vnyDz1m8ixbYUMUu4Bp0RIDz3C1e2aVk.f92XGG2hZbSVdG', NULL, '2020-09-02 16:39:26', '2020-09-02 16:39:26'),
(4, 'ahammed', 'ahammed@gmail.com', NULL, '$2y$10$xDrOe6.rQK2iuOEZMMC33.4R2ivAqv9CYj5TwJuA20S.fBmLZz726', NULL, '2020-09-17 08:22:22', '2020-09-17 08:22:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oex_exam_question_masters`
--
ALTER TABLE `oex_exam_question_masters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oex_portals`
--
ALTER TABLE `oex_portals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oex_results`
--
ALTER TABLE `oex_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `oex_exam_question_masters`
--
ALTER TABLE `oex_exam_question_masters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `oex_portals`
--
ALTER TABLE `oex_portals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oex_results`
--
ALTER TABLE `oex_results`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
