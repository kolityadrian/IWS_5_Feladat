-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2026 at 10:37 PM
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
-- Database: `jokes_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `jokes`
--

CREATE TABLE `jokes` (
  `id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `joke` text DEFAULT NULL,
  `setup` text DEFAULT NULL,
  `delivery` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jokes`
--

INSERT INTO `jokes` (`id`, `type`, `joke`, `setup`, `delivery`, `created_at`) VALUES
(1, 'twopart', NULL, 'What is the best prefix for global variables?', '//', '2026-11-24 20:05:09'),
(2, 'twopart', NULL, 'How do you know God is a shitty programmer?', 'He wrote the OS for an entire universe, but didn\'t leave a single useful comment.', '2026-11-24 20:05:09'),
(3, 'single', 'Knock knock.\nWho\'s there?\nRecursion.\nRecursion who?\nKnock knock.', NULL, NULL, '2026-11-24 20:05:09'),
(4, 'single', 'I\'ve got a really good UDP joke to tell you but I don’t know if you\'ll get it.', NULL, NULL, '2026-11-24 20:05:09'),
(5, 'single', 'The glass is neither half-full nor half-empty, the glass is twice as big as it needs to be.', NULL, NULL, '2026-11-24 20:05:09'),
(6, 'twopart', NULL, 'Why did the programmer jump on the table?', 'Because debug was on his screen.', '2026-11-24 20:05:09'),
(7, 'single', 'How do you tell HTML from HTML5?\n- Try it out in Internet Explorer\n- Did it work?\n- No?\n- It\'s HTML5.', NULL, NULL, '2026-11-24 20:05:09'),
(8, 'twopart', NULL, 'What is a dying programmer\'s last program?', 'Goodbye, world!', '2026-11-24 20:05:09'),
(9, 'twopart', NULL, 'How can you tell an extroverted programmer?', 'He looks at YOUR shoes when he\'s talking.', '2026-11-24 20:05:09'),
(10, 'twopart', NULL, 'Why is Linux safe?', 'Hackers peak through Windows only.', '2026-11-24 20:05:09'),
(11, 'twopart', NULL, 'What is the best prefix for global variables?', '//', '2026-11-24 20:07:52'),
(12, 'single', 'Knock knock.\nWho\'s there?\nRecursion.\nRecursion who?\nKnock knock.', NULL, NULL, '2026-11-24 20:07:52'),
(13, 'twopart', NULL, 'How do you generate a random string?', 'Put a Windows user in front of Vim and tell them to exit.', '2026-11-24 20:07:52'),
(14, 'twopart', NULL, 'What do you call a group of 8 Hobbits?', 'A Hobbyte.', '2026-11-24 20:07:52'),
(15, 'twopart', NULL, 'Why did the functional programmer get thrown out of school?', 'Because he refused to take classes.', '2026-11-24 20:07:52'),
(16, 'single', '\"We messed up the keming again guys.\"', NULL, NULL, '2026-11-24 20:07:52'),
(17, 'twopart', NULL, 'What do you get if you lock a monkey in a room with a typewriter for 8 hours?', 'A regular expression.', '2026-11-24 20:07:52'),
(18, 'single', 'Documentation is like sex:\nWhen it\'s good, it\'s very good.\nWhen it\'s bad, it\'s better than nothing...', NULL, NULL, '2026-11-24 20:07:52'),
(19, 'single', 'I\'ve got a really good UDP joke to tell you but I don’t know if you\'ll get it.', NULL, NULL, '2026-11-24 20:07:52'),
(20, 'single', 'Judge: \"I sentence you to the maximum punishment...\"\nMe (thinking): \"Please be death, please be death...\"\nJudge: \"Learn Java!\"\nMe: \"Damn.\"', NULL, NULL, '2026-11-24 20:07:52'),
(21, 'single', 'Hey Girl,\nRoses are #ff0000,\nViolets are #0000ff,\nI use hex codes,\nBut I\'d use RGB for you.', NULL, NULL, '2026-11-24 20:09:36'),
(22, 'single', '// This line doesn\'t actually do anything, but the code stops working when I delete it.', NULL, NULL, '2026-11-24 20:09:36'),
(23, 'single', 'Java is like Alzheimer\'s, it starts off slow, but eventually, your memory is gone.', NULL, NULL, '2026-11-24 20:09:36'),
(24, 'twopart', NULL, 'What are bits?', 'Tiny things left when you drop your computer down the stairs.', '2026-11-24 20:09:36'),
(25, 'single', 'I have a joke about Stack Overflow, but you would say it\'s a duplicate.', NULL, NULL, '2026-11-24 20:09:36'),
(26, 'twopart', NULL, 'Why did the programmer quit his job?', 'Because he didn\'t get arrays.', '2026-11-24 20:09:36'),
(27, 'single', 'I\'ve got a really good UDP joke to tell you but I don’t know if you\'ll get it.', NULL, NULL, '2026-11-24 20:09:36'),
(28, 'single', 'The six stages of debugging:\n1. That can\'t happen.\n2. That doesn\'t happen on my machine.\n3. That shouldn\'t happen.\n4. Why does that happen?\n5. Oh, I see.\n6. How did that ever work?', NULL, NULL, '2026-11-24 20:09:36'),
(29, 'single', 'Debugging: Removing the needles from the haystack.', NULL, NULL, '2026-11-24 20:09:36'),
(30, 'single', 'Documentation is like sex:\nWhen it\'s good, it\'s very good.\nWhen it\'s bad, it\'s better than nothing...', NULL, NULL, '2026-11-24 20:09:36'),
(31, 'twopart', NULL, 'Why are Assembly programmers always soaking wet?', 'They work below C-level.', '2026-11-24 20:11:32'),
(32, 'twopart', NULL, 'What\'s the object-oriented way to become wealthy?', 'Inheritance.', '2026-11-24 20:11:32'),
(33, 'single', 'Today I learned that changing random stuff until your program works is \"hacky\" and a \"bad coding practice\" but if you do it fast enough it\'s \"Machine Learning\" and pays 4x your current salary.', NULL, NULL, '2026-11-24 20:11:32'),
(34, 'twopart', NULL, 'Why is 6 afraid of 7 in hexadecimal Canada?', 'Because 7 8 9 A?', '2026-11-24 20:11:32'),
(35, 'single', 'Java is like Alzheimer\'s, it starts off slow, but eventually, your memory is gone.', NULL, NULL, '2026-11-24 20:11:32'),
(36, 'single', '\"Knock, knock.\"\n\"Who\'s there?\"\n\n[very long pause]\n\n\"Java.\"', NULL, NULL, '2026-11-24 20:11:32'),
(37, 'twopart', NULL, 'What do you get if you lock a monkey in a room with a typewriter for 8 hours?', 'A regular expression.', '2026-11-24 20:11:32'),
(38, 'twopart', NULL, '.NET developers are picky when it comes to food.', 'They only like chicken NuGet.', '2026-11-24 20:11:32'),
(39, 'single', 'A SQL statement walks into a bar and sees two tables.\nIt approaches, and asks \"may I join you?\"', NULL, NULL, '2026-11-24 20:11:32'),
(40, 'single', 'ASCII silly question, get a silly ANSI.', NULL, NULL, '2026-11-24 20:11:32'),
(43, 'twopart', NULL, 'What do you call a developer who doesn\'t comment code?', 'A developer.', '2026-11-24 21:31:26'),
(44, 'twopart', NULL, 'What do you get if you lock a monkey in a room with a typewriter for 8 hours?', 'A regular expression.', '2026-11-24 21:31:26'),
(45, 'twopart', NULL, 'Why did the JavaScript heap close shop?', 'It ran out of memory.', '2026-11-24 21:31:26'),
(46, 'twopart', NULL, 'Why did the database administrator leave his wife?', 'She had one-to-many relationships.', '2026-11-24 21:31:26'),
(47, 'single', 'Judge: \"I sentence you to the maximum punishment...\"\nMe (thinking): \"Please be death, please be death...\"\nJudge: \"Learn Java!\"\nMe: \"Damn.\"', NULL, NULL, '2026-11-24 21:31:26'),
(48, 'single', 'Documentation is like sex:\nWhen it\'s good, it\'s very good.\nWhen it\'s bad, it\'s better than nothing...', NULL, NULL, '2026-11-24 21:31:26'),
(49, 'single', 'Have a great weekend!\nI hope your code behaves the same on Monday as it did on Friday.', NULL, NULL, '2026-11-24 21:31:26'),
(50, 'single', 'Two SQL tables sit at the bar. A query approaches and asks \"Can I join you?\"', NULL, NULL, '2026-11-24 21:31:26'),
(51, 'single', 'The six stages of debugging:\n1. That can\'t happen.\n2. That doesn\'t happen on my machine.\n3. That shouldn\'t happen.\n4. Why does that happen?\n5. Oh, I see.\n6. How did that ever work?', NULL, NULL, '2026-11-24 21:31:26'),
(52, 'single', 'Hey Girl,\nRoses are #ff0000,\nViolets are #0000ff,\nI use hex codes,\nBut I\'d use RGB for you.', NULL, NULL, '2026-11-24 21:31:26');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `url` varchar(500) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `url`, `date_time`) VALUES
(1, 'https://v2.jokeapi.dev/joke/Programming?amount=10', '2026-11-24 19:10:33'),
(2, 'https://v2.jokeapi.dev/joke/Programming?amount=10', '2026-11-24 19:14:54'),
(3, 'https://v2.jokeapi.dev/joke/Programming?amount=10', '2026-11-24 19:57:22'),
(4, 'https://v2.jokeapi.dev/joke/Programming?amount=10', '2026-11-24 19:59:49'),
(5, 'https://v2.jokeapi.dev/joke/Programming?amount=10', '2026-11-24 20:01:08'),
(6, 'https://v2.jokeapi.dev/joke/Programming?amount=10', '2026-11-24 20:05:08'),
(7, 'https://v2.jokeapi.dev/joke/Programming?amount=10', '2026-11-24 20:07:52'),
(8, 'https://v2.jokeapi.dev/joke/Programming?amount=10', '2026-11-24 20:09:36'),
(9, 'https://v2.jokeapi.dev/joke/Programming?amount=10', '2026-11-24 20:11:32'),
(10, 'https://v2.jokeapi.dev/joke/Programming?amount=10', '2026-11-24 21:31:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jokes`
--
ALTER TABLE `jokes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jokes`
--
ALTER TABLE `jokes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
