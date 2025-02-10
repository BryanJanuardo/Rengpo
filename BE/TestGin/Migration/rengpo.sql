
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rengpo`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `quantity`, `category_id`) VALUES
(1, 'Book 0 Updated', 'Author 0', 8, 5),
(2, '1984', 'George Orwell', 5, 2),
(3, 'To Kill a Mockingbird', 'Harper Lee', 7, 3),
(4, 'Pride and Prejudice', 'Jane Austen', 8, 4),
(5, 'The Great Gatsby', 'F. Scott Fitzgerald', 6, 5),
(6, 'Book Title 1', 'Author 1', 10, 1),
(7, 'Book Title 2', 'Author 2', 8, 2),
(8, 'Book Title 3', 'Author 3', 5, 1),
(9, 'Book Title 4', 'Author 4', 12, 2),
(10, 'Book Title 5', 'Author 5', 7, 3),
(11, 'Book Title 6', 'Author 6', 9, 1),
(12, 'Book Title 7', 'Author 7', 6, 2),
(13, 'Book Title 8', 'Author 8', 11, 3),
(14, 'Book Title 9', 'Author 9', 8, 1),
(15, 'Book Title 10', 'Author 10', 10, 2),
(16, 'Book Title 11', 'Author 11', 7, 3),
(17, 'Book Title 12', 'Author 12', 5, 1),
(18, 'Book Title 13', 'Author 13', 12, 2),
(19, 'Book Title 14', 'Author 14', 6, 3),
(20, 'Book Title 15', 'Author 15', 9, 1),
(21, 'Book Title 16', 'Author 16', 8, 2),
(22, 'Book Title 17', 'Author 17', 7, 3),
(23, 'Book Title 18', 'Author 18', 10, 1),
(24, 'Book Title 19', 'Author 19', 11, 2),
(25, 'Book Title 20', 'Author 20', 5, 3),
(26, 'Book Title 21', 'Author 21', 6, 1),
(27, 'Book Title 22', 'Author 22', 12, 2),
(28, 'Book Title 23', 'Author 23', 7, 3),
(29, 'Book Title 24', 'Author 24', 8, 1),
(30, 'Book Title 25', 'Author 25', 10, 2),
(31, 'Book Title 26', 'Author 26', 9, 3),
(32, 'Book Title 27', 'Author 27', 5, 1),
(33, 'Book Title 28', 'Author 28', 11, 2),
(34, 'Book Title 29', 'Author 29', 7, 3),
(35, 'Book Title 30', 'Author 30', 8, 1),
(36, 'Book Title 31', 'Author 31', 10, 2),
(37, 'Book Title 32', 'Author 32', 6, 3),
(38, 'Book Title 33', 'Author 33', 9, 1),
(39, 'Book Title 34', 'Author 34', 7, 2),
(40, 'Book Title 35', 'Author 35', 11, 3),
(41, 'Book Title 36', 'Author 36', 8, 1),
(42, 'Book Title 37', 'Author 37', 10, 2),
(43, 'Book Title 38', 'Author 38', 5, 3),
(44, 'Book Title 39', 'Author 39', 6, 1),
(45, 'Book Title 40', 'Author 40', 12, 2),
(46, 'Book Title 41', 'Author 41', 7, 3),
(47, 'Book Title 42', 'Author 42', 8, 1),
(48, 'Book Title 43', 'Author 43', 9, 2),
(49, 'Book Title 44', 'Author 44', 10, 3),
(50, 'Book Title 45', 'Author 45', 11, 1),
(51, 'Book Title 46', 'Author 46', 5, 2),
(52, 'Book Title 47', 'Author 47', 7, 3),
(53, 'Book Title 48', 'Author 48', 8, 1),
(54, 'Book Title 49', 'Author 49', 10, 2),
(55, 'Book Title 50', 'Author 50', 9, 3),
(56, 'Book Title 1', 'Author 1', 10, 1),
(57, 'Book Title 2', 'Author 2', 8, 2),
(58, 'Book Title 3', 'Author 3', 5, 1),
(59, 'Book Title 4', 'Author 4', 12, 2),
(60, 'Book Title 5', 'Author 5', 7, 3),
(61, 'Book Title 6', 'Author 6', 9, 1),
(62, 'Book Title 7', 'Author 7', 6, 2),
(63, 'Book Title 8', 'Author 8', 11, 3),
(64, 'Book Title 9', 'Author 9', 8, 1),
(65, 'Book Title 10', 'Author 10', 10, 2),
(66, 'Book Title 11', 'Author 11', 7, 3),
(67, 'Book Title 12', 'Author 12', 5, 1),
(68, 'Book Title 13', 'Author 13', 12, 2),
(69, 'Book Title 14', 'Author 14', 6, 3),
(70, 'Book Title 15', 'Author 15', 9, 1),
(71, 'Book Title 16', 'Author 16', 8, 2),
(72, 'Book Title 17', 'Author 17', 7, 3),
(73, 'Book Title 18', 'Author 18', 10, 1),
(74, 'Book Title 19', 'Author 19', 11, 2),
(75, 'Book Title 20', 'Author 20', 5, 3),
(76, 'Book Title 21', 'Author 21', 6, 1),
(77, 'Book Title 22', 'Author 22', 12, 2),
(78, 'Book Title 23', 'Author 23', 7, 3),
(79, 'Book Title 24', 'Author 24', 8, 1),
(80, 'Book Title 25', 'Author 25', 10, 2),
(81, 'Book Title 26', 'Author 26', 9, 3),
(82, 'Book Title 27', 'Author 27', 5, 1),
(83, 'Book Title 28', 'Author 28', 11, 2),
(84, 'Book Title 29', 'Author 29', 7, 3),
(85, 'Book Title 30', 'Author 30', 8, 1),
(86, 'Book Title 31', 'Author 31', 10, 2),
(87, 'Book Title 32', 'Author 32', 6, 3),
(88, 'Book Title 33', 'Author 33', 9, 1),
(89, 'Book Title 34', 'Author 34', 7, 2),
(90, 'Book Title 35', 'Author 35', 11, 3),
(91, 'Book Title 36', 'Author 36', 8, 1),
(92, 'Book Title 37', 'Author 37', 10, 2),
(93, 'Book Title 38', 'Author 38', 5, 3),
(94, 'Book Title 39', 'Author 39', 6, 1),
(95, 'Book Title 40', 'Author 40', 12, 2),
(96, 'Book Title 41', 'Author 41', 7, 3),
(97, 'Book Title 42', 'Author 42', 8, 1),
(98, 'Book Title 43', 'Author 43', 9, 2),
(99, 'Book Title 44', 'Author 44', 10, 3),
(100, 'Book Title 45', 'Author 45', 11, 1),
(101, 'Book Title 46', 'Author 46', 5, 2),
(102, 'Book Title 47', 'Author 47', 7, 3),
(103, 'Book Title 48', 'Author 48', 8, 1),
(104, 'Book Title 49', 'Author 49', 10, 2),
(105, 'Book Title 50', 'Author 50', 9, 3),
(106, 'Book Title 1', 'Author 1', 10, 1),
(107, 'Book Title 2', 'Author 2', 8, 2),
(108, 'Book Title 3', 'Author 3', 5, 1),
(109, 'Book Title 4', 'Author 4', 12, 2),
(110, 'Book Title 5', 'Author 5', 7, 3),
(111, 'Book Title 6', 'Author 6', 9, 1),
(112, 'Book Title 7', 'Author 7', 6, 2),
(113, 'Book Title 8', 'Author 8', 11, 3),
(114, 'Book Title 9', 'Author 9', 8, 1),
(115, 'Book Title 10', 'Author 10', 10, 2),
(116, 'Book Title 11', 'Author 11', 7, 3),
(117, 'Book Title 12', 'Author 12', 5, 1),
(118, 'Book Title 13', 'Author 13', 12, 2),
(119, 'Book Title 14', 'Author 14', 6, 3),
(120, 'Book Title 15', 'Author 15', 9, 1),
(121, 'Book Title 16', 'Author 16', 8, 2),
(122, 'Book Title 17', 'Author 17', 7, 3),
(123, 'Book Title 18', 'Author 18', 10, 1),
(124, 'Book Title 19', 'Author 19', 11, 2),
(125, 'Book Title 20', 'Author 20', 5, 3),
(126, 'Book Title 21', 'Author 21', 6, 1),
(127, 'Book Title 22', 'Author 22', 12, 2),
(128, 'Book Title 23', 'Author 23', 7, 3),
(129, 'Book Title 24', 'Author 24', 8, 1),
(130, 'Book Title 25', 'Author 25', 10, 2),
(131, 'Book Title 26', 'Author 26', 9, 3),
(132, 'Book Title 27', 'Author 27', 5, 1),
(133, 'Book Title 28', 'Author 28', 11, 2),
(134, 'Book Title 29', 'Author 29', 7, 3),
(135, 'Book Title 30', 'Author 30', 8, 1),
(136, 'Book Title 31', 'Author 31', 10, 2),
(137, 'Book Title 32', 'Author 32', 6, 3),
(138, 'Book Title 33', 'Author 33', 9, 1),
(139, 'Book Title 34', 'Author 34', 7, 2),
(140, 'Book Title 35', 'Author 35', 11, 3),
(141, 'Book Title 36', 'Author 36', 8, 1),
(142, 'Book Title 37', 'Author 37', 10, 2),
(143, 'Book Title 38', 'Author 38', 5, 3),
(144, 'Book Title 39', 'Author 39', 6, 1),
(145, 'Book Title 40', 'Author 40', 12, 2),
(146, 'Book Title 41', 'Author 41', 7, 3),
(147, 'Book Title 42', 'Author 42', 8, 1),
(148, 'Book Title 43', 'Author 43', 9, 2),
(149, 'Book Title 44', 'Author 44', 10, 3),
(150, 'Book Title 45', 'Author 45', 11, 1),
(151, 'Book Title 46', 'Author 46', 5, 2),
(152, 'Book Title 47', 'Author 47', 7, 3),
(153, 'Book Title 48', 'Author 48', 8, 1),
(154, 'Book Title 49', 'Author 49', 10, 2),
(155, 'Book Title 50', 'Author 50', 9, 3),
(156, 'Book Title 1', 'Author 1', 10, 1),
(157, 'Book Title 2', 'Author 2', 8, 2),
(158, 'Book Title 3', 'Author 3', 5, 1),
(159, 'Book Title 4', 'Author 4', 12, 2),
(160, 'Book Title 5', 'Author 5', 7, 3),
(161, 'Book Title 6', 'Author 6', 9, 1),
(162, 'Book Title 7', 'Author 7', 6, 2),
(163, 'Book Title 8', 'Author 8', 11, 3),
(164, 'Book Title 9', 'Author 9', 8, 1),
(165, 'Book Title 10', 'Author 10', 10, 2),
(166, 'Book Title 11', 'Author 11', 7, 3),
(167, 'Book Title 12', 'Author 12', 5, 1),
(168, 'Book Title 13', 'Author 13', 12, 2),
(169, 'Book Title 14', 'Author 14', 6, 3),
(170, 'Book Title 15', 'Author 15', 9, 1),
(171, 'Book Title 16', 'Author 16', 8, 2),
(172, 'Book Title 17', 'Author 17', 7, 3),
(173, 'Book Title 18', 'Author 18', 10, 1),
(174, 'Book Title 19', 'Author 19', 11, 2),
(175, 'Book Title 20', 'Author 20', 5, 3),
(176, 'Book Title 21', 'Author 21', 6, 1),
(177, 'Book Title 22', 'Author 22', 12, 2),
(178, 'Book Title 23', 'Author 23', 7, 3),
(179, 'Book Title 24', 'Author 24', 8, 1),
(180, 'Book Title 25', 'Author 25', 10, 2),
(181, 'Book Title 26', 'Author 26', 9, 3),
(182, 'Book Title 27', 'Author 27', 5, 1),
(183, 'Book Title 28', 'Author 28', 11, 2),
(184, 'Book Title 29', 'Author 29', 7, 3),
(185, 'Book Title 30', 'Author 30', 8, 1),
(186, 'Book Title 31', 'Author 31', 10, 2),
(187, 'Book Title 32', 'Author 32', 6, 3),
(188, 'Book Title 33', 'Author 33', 9, 1),
(189, 'Book Title 34', 'Author 34', 7, 2),
(190, 'Book Title 35', 'Author 35', 11, 3),
(191, 'Book Title 36', 'Author 36', 8, 1),
(192, 'Book Title 37', 'Author 37', 10, 2),
(193, 'Book Title 38', 'Author 38', 5, 3),
(194, 'Book Title 39', 'Author 39', 6, 1),
(195, 'Book Title 40', 'Author 40', 12, 2),
(196, 'Book Title 41', 'Author 41', 7, 3),
(197, 'Book Title 42', 'Author 42', 8, 1),
(198, 'Book Title 43', 'Author 43', 9, 2),
(199, 'Book Title 44', 'Author 44', 10, 3),
(200, 'Book Title 45', 'Author 45', 11, 1),
(201, 'Book Title 46', 'Author 46', 5, 2),
(202, 'Book Title 47', 'Author 47', 7, 3),
(203, 'Book Title 48', 'Author 48', 8, 1),
(204, 'Book Title 49', 'Author 49', 10, 2),
(205, 'Book Title 50', 'Author 50', 9, 3),
(206, 'Book Title 1', 'Author 1', 10, 1),
(207, 'Book Title 2', 'Author 2', 8, 2),
(208, 'Book Title 3', 'Author 3', 5, 1),
(209, 'Book Title 4', 'Author 4', 12, 2),
(210, 'Book Title 5', 'Author 5', 7, 3),
(211, 'Book Title 6', 'Author 6', 9, 1),
(212, 'Book Title 7', 'Author 7', 6, 2),
(213, 'Book Title 8', 'Author 8', 11, 3),
(214, 'Book Title 9', 'Author 9', 8, 1),
(215, 'Book Title 10', 'Author 10', 10, 2),
(216, 'Book Title 11', 'Author 11', 7, 3),
(217, 'Book Title 12', 'Author 12', 5, 1),
(218, 'Book Title 13', 'Author 13', 12, 2),
(219, 'Book Title 14', 'Author 14', 6, 3),
(220, 'Book Title 15', 'Author 15', 9, 1),
(221, 'Book Title 16', 'Author 16', 8, 2),
(222, 'Book Title 17', 'Author 17', 7, 3),
(223, 'Book Title 18', 'Author 18', 10, 1),
(224, 'Book Title 19', 'Author 19', 11, 2),
(225, 'Book Title 20', 'Author 20', 5, 3),
(226, 'Book Title 21', 'Author 21', 6, 1),
(227, 'Book Title 22', 'Author 22', 12, 2),
(228, 'Book Title 23', 'Author 23', 7, 3),
(229, 'Book Title 24', 'Author 24', 8, 1),
(230, 'Book Title 25', 'Author 25', 10, 2),
(231, 'Book Title 26', 'Author 26', 9, 3),
(232, 'Book Title 27', 'Author 27', 5, 1),
(233, 'Book Title 28', 'Author 28', 11, 2),
(234, 'Book Title 29', 'Author 29', 7, 3),
(235, 'Book Title 30', 'Author 30', 8, 1),
(236, 'Book Title 31', 'Author 31', 10, 2),
(237, 'Book Title 32', 'Author 32', 6, 3),
(238, 'Book Title 33', 'Author 33', 9, 1),
(239, 'Book Title 34', 'Author 34', 7, 2),
(240, 'Book Title 35', 'Author 35', 11, 3),
(241, 'Book Title 36', 'Author 36', 8, 1),
(242, 'Book Title 37', 'Author 37', 10, 2),
(243, 'Book Title 38', 'Author 38', 5, 3),
(244, 'Book Title 39', 'Author 39', 6, 1),
(245, 'Book Title 40', 'Author 40', 12, 2),
(246, 'Book Title 41', 'Author 41', 7, 3),
(247, 'Book Title 42', 'Author 42', 8, 1),
(248, 'Book Title 43', 'Author 43', 9, 2),
(249, 'Book Title 44', 'Author 44', 10, 3),
(250, 'Book Title 45', 'Author 45', 11, 1),
(251, 'Book Title 46', 'Author 46', 5, 2),
(252, 'Book Title 47', 'Author 47', 7, 3),
(253, 'Book Title 48', 'Author 48', 8, 1),
(254, 'Book Title 49', 'Author 49', 10, 2),
(255, 'Book Title 50', 'Author 50', 9, 3),
(256, 'Book Title 1', 'Author 1', 10, 1),
(257, 'Book Title 2', 'Author 2', 8, 2),
(258, 'Book Title 3', 'Author 3', 5, 1),
(259, 'Book Title 4', 'Author 4', 12, 2),
(260, 'Book Title 5', 'Author 5', 7, 3),
(261, 'Book Title 6', 'Author 6', 9, 1),
(262, 'Book Title 7', 'Author 7', 6, 2),
(263, 'Book Title 8', 'Author 8', 11, 3),
(264, 'Book Title 9', 'Author 9', 8, 1),
(265, 'Book Title 10', 'Author 10', 10, 2),
(266, 'Book Title 11', 'Author 11', 7, 3),
(267, 'Book Title 12', 'Author 12', 5, 1),
(268, 'Book Title 13', 'Author 13', 12, 2),
(269, 'Book Title 14', 'Author 14', 6, 3),
(270, 'Book Title 15', 'Author 15', 9, 1),
(271, 'Book Title 16', 'Author 16', 8, 2),
(272, 'Book Title 17', 'Author 17', 7, 3),
(273, 'Book Title 18', 'Author 18', 10, 1),
(274, 'Book Title 19', 'Author 19', 11, 2),
(275, 'Book Title 20', 'Author 20', 5, 3),
(276, 'Book Title 21', 'Author 21', 6, 1),
(277, 'Book Title 22', 'Author 22', 12, 2),
(278, 'Book Title 23', 'Author 23', 7, 3),
(279, 'Book Title 24', 'Author 24', 8, 1),
(280, 'Book Title 25', 'Author 25', 10, 2),
(281, 'Book Title 26', 'Author 26', 9, 3),
(282, 'Book Title 27', 'Author 27', 5, 1),
(283, 'Book Title 28', 'Author 28', 11, 2),
(284, 'Book Title 29', 'Author 29', 7, 3),
(285, 'Book Title 30', 'Author 30', 8, 1),
(286, 'Book Title 31', 'Author 31', 10, 2),
(287, 'Book Title 32', 'Author 32', 6, 3),
(288, 'Book Title 33', 'Author 33', 9, 1),
(289, 'Book Title 34', 'Author 34', 7, 2),
(290, 'Book Title 35', 'Author 35', 11, 3),
(291, 'Book Title 36', 'Author 36', 8, 1),
(292, 'Book Title 37', 'Author 37', 10, 2),
(293, 'Book Title 38', 'Author 38', 5, 3),
(294, 'Book Title 39', 'Author 39', 6, 1),
(295, 'Book Title 40', 'Author 40', 12, 2),
(296, 'Book Title 41', 'Author 41', 7, 3),
(297, 'Book Title 42', 'Author 42', 8, 1),
(298, 'Book Title 43', 'Author 43', 9, 2),
(299, 'Book Title 44', 'Author 44', 10, 3),
(300, 'Book Title 45', 'Author 45', 11, 1),
(301, 'Book Title 46', 'Author 46', 5, 2),
(302, 'Book Title 47', 'Author 47', 7, 3),
(303, 'Book Title 48', 'Author 48', 8, 1),
(304, 'Book Title 49', 'Author 49', 10, 2),
(305, 'Book Title 50', 'Author 50', 9, 3),
(306, 'Book Title 1', 'Author 1', 10, 1),
(307, 'Book Title 2', 'Author 2', 8, 2),
(308, 'Book Title 3', 'Author 3', 5, 1),
(309, 'Book Title 4', 'Author 4', 12, 2),
(310, 'Book Title 5', 'Author 5', 7, 3),
(311, 'Book Title 6', 'Author 6', 9, 1),
(312, 'Book Title 7', 'Author 7', 6, 2),
(313, 'Book Title 8', 'Author 8', 11, 3),
(314, 'Book Title 9', 'Author 9', 8, 1),
(315, 'Book Title 10', 'Author 10', 10, 2),
(316, 'Book Title 11', 'Author 11', 7, 3),
(317, 'Book Title 12', 'Author 12', 5, 1),
(318, 'Book Title 13', 'Author 13', 12, 2),
(319, 'Book Title 14', 'Author 14', 6, 3),
(320, 'Book Title 15', 'Author 15', 9, 1),
(321, 'Book Title 16', 'Author 16', 8, 2),
(322, 'Book Title 17', 'Author 17', 7, 3),
(323, 'Book Title 18', 'Author 18', 10, 1),
(324, 'Book Title 19', 'Author 19', 11, 2),
(325, 'Book Title 20', 'Author 20', 5, 3),
(326, 'Book Title 21', 'Author 21', 6, 1),
(327, 'Book Title 22', 'Author 22', 12, 2),
(328, 'Book Title 23', 'Author 23', 7, 3),
(329, 'Book Title 24', 'Author 24', 8, 1),
(330, 'Book Title 25', 'Author 25', 10, 2),
(331, 'Book Title 26', 'Author 26', 9, 3),
(332, 'Book Title 27', 'Author 27', 5, 1),
(333, 'Book Title 28', 'Author 28', 11, 2),
(334, 'Book Title 29', 'Author 29', 7, 3),
(335, 'Book Title 30', 'Author 30', 8, 1),
(336, 'Book Title 31', 'Author 31', 10, 2),
(337, 'Book Title 32', 'Author 32', 6, 3),
(338, 'Book Title 33', 'Author 33', 9, 1),
(339, 'Book Title 34', 'Author 34', 7, 2),
(340, 'Book Title 35', 'Author 35', 11, 3),
(341, 'Book Title 36', 'Author 36', 8, 1),
(342, 'Book Title 37', 'Author 37', 10, 2),
(343, 'Book Title 38', 'Author 38', 5, 3),
(344, 'Book Title 39', 'Author 39', 6, 1),
(345, 'Book Title 40', 'Author 40', 12, 2),
(346, 'Book Title 41', 'Author 41', 7, 3),
(347, 'Book Title 42', 'Author 42', 8, 1),
(348, 'Book Title 43', 'Author 43', 9, 2),
(349, 'Book Title 44', 'Author 44', 10, 3),
(350, 'Book Title 45', 'Author 45', 11, 1),
(351, 'Book Title 46', 'Author 46', 5, 2),
(352, 'Book Title 47', 'Author 47', 7, 3),
(353, 'Book Title 48', 'Author 48', 8, 1),
(354, 'Book Title 49', 'Author 49', 10, 2),
(355, 'Book Title 50', 'Author 50', 9, 3),
(356, 'Book Title 1', 'Author 1', 10, 1),
(357, 'Book Title 2', 'Author 2', 8, 2),
(358, 'Book Title 3', 'Author 3', 5, 1),
(359, 'Book Title 4', 'Author 4', 12, 2),
(360, 'Book Title 5', 'Author 5', 7, 3),
(361, 'Book Title 6', 'Author 6', 9, 1),
(362, 'Book Title 7', 'Author 7', 6, 2),
(363, 'Book Title 8', 'Author 8', 11, 3),
(364, 'Book Title 9', 'Author 9', 8, 1),
(365, 'Book Title 10', 'Author 10', 10, 2),
(366, 'Book Title 11', 'Author 11', 7, 3),
(367, 'Book Title 12', 'Author 12', 5, 1),
(368, 'Book Title 13', 'Author 13', 12, 2),
(369, 'Book Title 14', 'Author 14', 6, 3),
(370, 'Book Title 15', 'Author 15', 9, 1),
(371, 'Book Title 16', 'Author 16', 8, 2),
(372, 'Book Title 17', 'Author 17', 7, 3),
(373, 'Book Title 18', 'Author 18', 10, 1),
(374, 'Book Title 19', 'Author 19', 11, 2),
(375, 'Book Title 20', 'Author 20', 5, 3),
(376, 'Book Title 21', 'Author 21', 6, 1),
(377, 'Book Title 22', 'Author 22', 12, 2),
(378, 'Book Title 23', 'Author 23', 7, 3),
(379, 'Book Title 24', 'Author 24', 8, 1),
(380, 'Book Title 25', 'Author 25', 10, 2),
(381, 'Book Title 26', 'Author 26', 9, 3),
(382, 'Book Title 27', 'Author 27', 5, 1),
(383, 'Book Title 28', 'Author 28', 11, 2),
(384, 'Book Title 29', 'Author 29', 7, 3),
(385, 'Book Title 30', 'Author 30', 8, 1),
(386, 'Book Title 31', 'Author 31', 10, 2),
(387, 'Book Title 32', 'Author 32', 6, 3),
(388, 'Book Title 33', 'Author 33', 9, 1),
(389, 'Book Title 34', 'Author 34', 7, 2),
(390, 'Book Title 35', 'Author 35', 11, 3),
(391, 'Book Title 36', 'Author 36', 8, 1),
(392, 'Book Title 37', 'Author 37', 10, 2),
(393, 'Book Title 38', 'Author 38', 5, 3),
(394, 'Book Title 39', 'Author 39', 6, 1),
(395, 'Book Title 40', 'Author 40', 12, 2),
(396, 'Book Title 41', 'Author 41', 7, 3),
(397, 'Book Title 42', 'Author 42', 8, 1),
(398, 'Book Title 43', 'Author 43', 9, 2),
(399, 'Book Title 44', 'Author 44', 10, 3),
(400, 'Book Title 45', 'Author 45', 11, 1),
(401, 'Book Title 46', 'Author 46', 5, 2),
(402, 'Book Title 47', 'Author 47', 7, 3),
(403, 'Book Title 48', 'Author 48', 8, 1),
(404, 'Book Title 49', 'Author 49', 10, 2),
(405, 'Book Title 50', 'Author 50', 9, 3),
(407, 'Book 3213123120', 'Au', 8, 5),
(408, 'Book 3213123120', 'Au', 8, 5),
(409, 'Book 3213123120', 'Au', 8, 5),
(410, 'Book 3213123120', 'Au', 8, 5),
(411, 'Book 3213123120', 'Author 0', 8, 5),
(412, 'Book 3213123120', 'Author 0', 8, 5);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Category 0'),
(2, 'Category 1'),
(3, 'Category 2'),
(4, 'Category 3');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(3, '2025-02-04-000005', 'App\\Database\\Migrations\\Category', 'default', 'App', 1738641650, 1),
(4, '2025-02-04-011333', 'App\\Database\\Migrations\\Product', 'default', 'App', 1738641650, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `description`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Product 0', 986.00, 'Description 0', 4, NULL, NULL),
(2, 'Product 1', 115.00, 'Description 1', 3, NULL, NULL),
(3, 'Product 2', 790.00, 'Description 2', 1, NULL, NULL),
(4, 'Product 3', 296.00, 'Description 3', 3, NULL, NULL),
(5, 'Product 4', 919.00, 'Description 4', 4, NULL, NULL),
(6, 'Product 5', 555.00, 'Description 5', 2, NULL, NULL),
(7, 'Product 6', 181.00, 'Description 6', 2, NULL, NULL),
(8, 'Product 7', 434.00, 'Description 7', 2, NULL, NULL),
(9, 'Product 8', 658.00, 'Description 8', 4, NULL, NULL),
(10, 'Product 9', 308.00, 'Description 9', 2, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=413;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
