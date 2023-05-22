-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2023 at 01:33 PM
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
-- Database: `mts_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `drug_interactions`
--

CREATE TABLE `drug_interactions` (
  `id` int(11) UNSIGNED NOT NULL,
  `drug1_id` int(11) UNSIGNED NOT NULL,
  `drug2_id` int(11) UNSIGNED NOT NULL,
  `severity` enum('mild','moderate','severe') NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drug_interactions`
--

INSERT INTO `drug_interactions` (`id`, `drug1_id`, `drug2_id`, `severity`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'moderate', 'Taking Lisinopril with Simvastatin may increase the risk of muscle pain or weakness.', '2023-05-17 07:31:57', '2023-05-17 07:31:57'),
(2, 2, 4, 'mild', 'Taking Metformin with Aspirin may increase the risk of lactic acidosis.', '2023-05-17 07:31:57', '2023-05-17 07:31:57'),
(3, 4, 6, 'moderate', 'Taking Aspirin with Atorvastatin may increase the risk of bleeding.', '2023-05-17 07:31:57', '2023-05-17 07:31:57'),
(4, 1, 6, 'severe', 'Taking Lisinopril with Atorvastatin may increase the risk of muscle pain or weakness and rhabdomyolysis.', '2023-05-17 07:31:57', '2023-05-17 07:31:57'),
(5, 3, 5, 'moderate', 'Taking Simvastatin with Losartan may increase the risk of muscle pain or weakness.', '2023-05-17 07:31:57', '2023-05-17 07:31:57'),
(6, 2, 5, 'mild', 'Taking Metformin with Losartan may increase the risk of low blood sugar.', '2023-05-17 07:31:57', '2023-05-17 07:31:57'),
(7, 1, 2, 'moderate', 'Taking Amoxicillin with Ibuprofen may increase the risk of bleeding.', '2023-05-17 07:32:39', '2023-05-17 07:32:39'),
(8, 3, 6, 'severe', 'Taking Prozac with Atorvastatin may increase the risk of muscle pain or weakness and rhabdomyolysis.', '2023-05-17 07:32:39', '2023-05-17 07:32:39'),
(9, 4, 5, 'moderate', 'Taking Levothyroxine with Losartan may decrease the effectiveness of Losartan.', '2023-05-17 07:32:39', '2023-05-17 07:32:39'),
(10, 2, 4, 'mild', 'Taking Ibuprofen with Levothyroxine may decrease the effectiveness of Levothyroxine.', '2023-05-17 07:32:39', '2023-05-17 07:32:39'),
(11, 1, 5, 'moderate', 'Taking Amoxicillin with Losartan may increase the risk of kidney damage.', '2023-05-17 07:32:39', '2023-05-17 07:32:39'),
(12, 3, 4, 'severe', 'Taking Prozac with Levothyroxine may increase the risk of serotonin syndrome.', '2023-05-17 07:32:39', '2023-05-17 07:32:39'),
(13, 1, 2, 'moderate', 'Description 1 and 2 interact moderately', '2023-05-17 11:14:32', '2023-05-17 11:14:32'),
(14, 1, 3, 'severe', 'Description 1 and 3 interact severely', '2023-05-17 11:14:32', '2023-05-17 11:14:32'),
(15, 1, 4, 'mild', 'Description 1 and 4 interact mildly', '2023-05-17 11:14:32', '2023-05-17 11:14:32'),
(16, 2, 3, 'severe', 'Description 2 and 3 interact severely', '2023-05-17 11:14:32', '2023-05-17 11:14:32'),
(17, 2, 5, 'mild', 'Description 2 and 5 interact mildly', '2023-05-17 11:14:32', '2023-05-17 11:14:32'),
(18, 3, 6, 'moderate', 'Description 3 and 6 interact moderately', '2023-05-17 11:14:32', '2023-05-17 11:14:32'),
(19, 4, 7, 'mild', 'Description 4 and 7 interact mildly', '2023-05-17 11:14:32', '2023-05-17 11:14:32'),
(20, 5, 8, 'moderate', 'Description 5 and 8 interact moderately', '2023-05-17 11:14:32', '2023-05-17 11:14:32'),
(21, 6, 9, 'severe', 'Description 6 and 9 interact severely', '2023-05-17 11:14:32', '2023-05-17 11:14:32'),
(22, 7, 10, 'moderate', 'Description 7 and 10 interact moderately', '2023-05-17 11:14:32', '2023-05-17 11:14:32');

-- --------------------------------------------------------

--
-- Table structure for table `medications`
--

CREATE TABLE `medications` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `dosage` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medications`
--

INSERT INTO `medications` (`id`, `name`, `description`, `dosage`, `created_at`, `updated_at`) VALUES
(1, 'Lisinopril', 'Lisinopril is used to treat high blood pressure.', '10mg', '2023-05-17 07:29:40', '2023-05-17 07:29:40'),
(2, 'Metformin', 'Metformin is used to treat type 2 diabetes.', '1000mg', '2023-05-17 07:29:40', '2023-05-17 07:29:40'),
(3, 'Simvastatin', 'Simvastatin is used to lower cholesterol levels.', '20mg', '2023-05-17 07:29:40', '2023-05-17 07:29:40'),
(4, 'Aspirin', 'Aspirin is used to relieve pain, reduce inflammation, and lower fever.', '325mg', '2023-05-17 07:29:40', '2023-05-17 07:29:40'),
(5, 'Amoxicillin', 'Amoxicillin is an antibiotic used to treat bacterial infections.', '500mg', '2023-05-17 07:30:15', '2023-05-17 07:30:15'),
(6, 'Ibuprofen', 'Ibuprofen is used to relieve pain, reduce inflammation, and lower fever.', '200mg', '2023-05-17 07:30:15', '2023-05-17 07:30:15'),
(7, 'Prozac', 'Prozac is used to treat depression, obsessive-compulsive disorder (OCD), and other mental health conditions.', '20mg', '2023-05-17 07:30:15', '2023-05-17 07:30:15'),
(8, 'Levothyroxine', 'Levothyroxine is used to treat hypothyroidism (low thyroid hormone).', '75mcg', '2023-05-17 07:30:15', '2023-05-17 07:30:15'),
(9, 'Losartan', 'Losartan is used to treat high blood pressure.', '50mg', '2023-05-17 07:30:15', '2023-05-17 07:30:15'),
(10, 'Atorvastatin', 'Atorvastatin is used to lower cholesterol levels.', '10mg', '2023-05-17 07:30:15', '2023-05-17 07:30:15'),
(11, 'Medication A', 'Description A', '10mg', '2023-05-17 11:14:25', '2023-05-17 11:14:25'),
(12, 'Medication B', 'Description B', '20mg', '2023-05-17 11:14:25', '2023-05-17 11:14:25'),
(13, 'Medication C', 'Description C', '30mg', '2023-05-17 11:14:25', '2023-05-17 11:14:25'),
(14, 'Medication D', 'Description D', '40mg', '2023-05-17 11:14:25', '2023-05-17 11:14:25'),
(15, 'Medication E', 'Description E', '50mg', '2023-05-17 11:14:25', '2023-05-17 11:14:25'),
(16, 'Medication F', 'Description F', '60mg', '2023-05-17 11:14:25', '2023-05-17 11:14:25'),
(17, 'Medication G', 'Description G', '70mg', '2023-05-17 11:14:25', '2023-05-17 11:14:25'),
(18, 'Medication H', 'Description H', '80mg', '2023-05-17 11:14:25', '2023-05-17 11:14:25'),
(19, 'Medication I', 'Description I', '90mg', '2023-05-17 11:14:25', '2023-05-17 11:14:25'),
(20, 'Medication J', 'Description J', '100mg', '2023-05-17 11:14:25', '2023-05-17 11:14:25');

-- --------------------------------------------------------

--
-- Table structure for table `medicine_list`
--

CREATE TABLE `medicine_list` (
  `id` bigint(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicine_list`
--

INSERT INTO `medicine_list` (`id`, `user_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 2, 'Sample Medicine 101', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ', '2023-03-15 10:37:18', '2023-03-15 10:42:52'),
(2, 2, 'Medicine 102', 'Donec elementum bibendum iaculis. Suspendisse ultricies pellentesque mi eget mattis. Sed velit dolor, pulvinar vitae scelerisque varius, congue id sapien', '2023-03-15 10:43:23', '2023-03-15 10:43:36'),
(3, 2, 'Medicine 103', 'Cras commodo euismod purus, a fermentum quam vulputate in. Duis ut dapibus est, eget efficitur dolor.', '2023-03-15 10:44:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE `reminders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `medication_id` int(11) NOT NULL,
  `dosage` varchar(250) NOT NULL,
  `frequency` varchar(250) NOT NULL,
  `reminder_date` date NOT NULL,
  `reminder_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reminders`
--

INSERT INTO `reminders` (`id`, `user_id`, `medication_id`, `dosage`, `frequency`, `reminder_date`, `reminder_time`) VALUES
(6, 3, 6, '11', '11', '2023-05-27', '03:27:00'),
(7, 3, 8, '112', '12', '2023-06-02', '20:48:00'),
(8, 3, 10, '112', '11', '2023-06-02', '04:14:00');

-- --------------------------------------------------------

--
-- Table structure for table `schedule_list`
--

CREATE TABLE `schedule_list` (
  `id` bigint(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  `medicine_id` bigint(30) NOT NULL,
  `day` text NOT NULL,
  `date_start` date NOT NULL,
  `until` date DEFAULT NULL,
  `time` time NOT NULL,
  `remarks` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedule_list`
--

INSERT INTO `schedule_list` (`id`, `user_id`, `medicine_id`, `day`, `date_start`, `until`, `time`, `remarks`, `created_at`, `updated_at`) VALUES
(2, 2, 2, 'Sunday, Tuesday, Wednesday, Thursday', '2023-03-15', NULL, '12:00:00', 'Aliquam augue purus, venenatis a ullamcorper in, ullamcorper et massa.', '2023-03-15 11:53:03', '2023-03-15 13:35:07'),
(3, 2, 3, 'Monday, Wednesday, Friday', '2023-03-15', NULL, '08:00:00', 'Phasellus nec nisi tellus. Vivamus quis tristique nisl.', '2023-03-15 13:12:43', '2023-03-15 13:12:43');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Medicine Tracking System - PHP'),
(6, 'short_name', 'MTS - PHP'),
(11, 'logo', 'uploads/defaults/logo.png?v=1648173882'),
(14, 'cover', 'uploads/defaults/wallpaper.jpg?v=1648173974');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `last_login`, `date_added`, `date_updated`) VALUES
(2, 'Mark', 'D', 'Cooper', 'mcooper', '$2y$10$vbzwnysblhRRKERu5ZlPUu0hS06sG4r6R4gmy5hp47P.61AiNJk/C', NULL, '2023-03-15 10:15:13', '2023-03-15 10:15:13'),
(3, 'George', '', 'Wilson', 'gwilson', '$2y$10$QjC3qnuEZfajGRttQQVovOA9OByc.BL8X.oS0uereL8hxIlBS/i5m', NULL, '2023-03-15 13:48:38', '2023-03-15 13:48:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `drug_interactions`
--
ALTER TABLE `drug_interactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drug1_id` (`drug1_id`),
  ADD KEY `drug2_id` (`drug2_id`);

--
-- Indexes for table `medications`
--
ALTER TABLE `medications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicine_list`
--
ALTER TABLE `medicine_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `med_user_id_fk` (`user_id`);

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule_list`
--
ALTER TABLE `schedule_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_fk` (`user_id`),
  ADD KEY `medicine_id_fk` (`medicine_id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `drug_interactions`
--
ALTER TABLE `drug_interactions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `medications`
--
ALTER TABLE `medications`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `medicine_list`
--
ALTER TABLE `medicine_list`
  MODIFY `id` bigint(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `schedule_list`
--
ALTER TABLE `schedule_list`
  MODIFY `id` bigint(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `drug_interactions`
--
ALTER TABLE `drug_interactions`
  ADD CONSTRAINT `drug_interactions_ibfk_1` FOREIGN KEY (`drug1_id`) REFERENCES `medications` (`id`),
  ADD CONSTRAINT `drug_interactions_ibfk_2` FOREIGN KEY (`drug2_id`) REFERENCES `medications` (`id`);

--
-- Constraints for table `medicine_list`
--
ALTER TABLE `medicine_list`
  ADD CONSTRAINT `med_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `schedule_list`
--
ALTER TABLE `schedule_list`
  ADD CONSTRAINT `medicine_id_fk` FOREIGN KEY (`medicine_id`) REFERENCES `medicine_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
