-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2025 at 01:23 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `author_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `author_id`, `created_at`, `updated_at`) VALUES
(1, 'Blog ni?', 'lorem ipsum dolor', 3, '2025-04-14 10:42:17', '2025-04-14 10:42:17'),
(2, 'Hey', 'lorem ni\r\n', 3, '2025-04-14 10:48:55', '2025-04-14 10:48:55'),
(3, 'Hala noh', 'lorem ipsum dolor', 3, '2025-04-27 10:37:41', '2025-04-27 10:37:41'),
(4, 'SUNOG', 'Naay nasunoggg wowowowoow', 3, '2025-04-27 14:35:58', '2025-04-27 14:35:58'),
(5, 'Hello', 'lorem ni oaha', 4, '2025-05-01 11:21:16', '2025-05-01 11:21:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Rasheed', 'Tapales', 'Snezh', '', '$2y$10$cbYzbB9Ri4sGY9lIn6raFu5qPNrGbFplP8/HfCD0U3IqHDJwwLup.', '2025-04-13 10:01:08', '2025-04-14 04:42:46'),
(2, 'Ambot', 'Ani', 'ambot', '', '$2y$10$TtkStJQUCvkuDFzoJ.PEneLzYIHr/t5veWeJSnQqi2AcVOuUTIvTu', '2025-04-13 10:02:17', '2025-04-14 04:42:46'),
(3, 'Rasheed', 'Oha', 'rasheed', '', '$2y$10$3UfczPkK3Myir0.HTSjJxeW7Q7qbks.X5b19DKVC1.S2d/1ozTdD2', '2025-04-14 10:33:01', '2025-04-14 10:33:01'),
(4, 'Rasheed', 'Tapales', 'snezhy', '', '$2y$10$p8i0xGwzJk2/VPNTaoY6zer/qXI5wH1FTDvy6NEK//X51lUsOkMR2', '2025-05-01 11:21:00', '2025-05-01 11:21:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
