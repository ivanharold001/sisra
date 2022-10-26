-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-08-2022 a las 08:15:41
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `alumno`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academic_syllabus`
--

CREATE TABLE `academic_syllabus` (
  `academic_syllabus_id` int(11) NOT NULL,
  `academic_syllabus_code` longtext COLLATE utf8_unicode_ci NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  `uploader_type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `uploader_id` int(11) NOT NULL,
  `year` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `file_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `subject_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8_unicode_ci NOT NULL,
  `level` longtext COLLATE utf8_unicode_ci NOT NULL,
  `authentication_key` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`admin_id`, `name`, `email`, `password`, `level`, `authentication_key`) VALUES
(1, 'Admin', 'admin@admin.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', '1', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `year` longtext COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_routine_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0(undefined) 1(present) 2(absent)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `timestamp`, `year`, `class_id`, `section_id`, `student_id`, `class_routine_id`, `status`) VALUES
(1, '1659909600', '2022-2023', 1, 2, 1, 0, 0),
(2, '1659909600', '2022-2023', 1, 2, 2, 0, 0),
(3, '1659996000', '2022-2023', 1, 2, 1, 0, 1),
(4, '1659996000', '2022-2023', 1, 2, 2, 0, 0),
(5, '1659996000', '2022-2023', 2, 11, 4, 0, 0),
(6, '1659996000', '2022-2023', 3, 12, 3, 0, 0),
(7, '1660082400', '2022-2023', 2, 11, 4, 0, 1),
(8, '1660082400', '2022-2023', 3, 12, 3, 0, 1),
(9, '1659304800', '2022-2023', 2, 11, 4, 0, 0),
(10, '1660168800', '2022-2023', 3, 12, 3, 0, 0),
(11, '1660168800', '2022-2023', 2, 11, 4, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `attendance_backup`
--

CREATE TABLE `attendance_backup` (
  `attendance_id` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0 undefined , 1 present , 2  absent',
  `student_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `year` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `session` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book`
--

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `author` longtext COLLATE utf8_unicode_ci NOT NULL,
  `class_id` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` longtext COLLATE utf8_unicode_ci NOT NULL,
  `price` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('04pq9l3qh2a0dq76qcmigu47e8fqeo7f', '::1', 1660185611, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303138353631313b746561636865725f6c6f67696e7c733a313a2231223b746561636865725f69647c733a313a2233223b6c6f67696e5f757365725f69647c733a313a2233223b6e616d657c733a33303a224741425249454c20414c454a414e44524f204d414d414e4920544954544f223b6c6f67696e5f747970657c733a373a2274656163686572223b),
('0sfrhbegged2vte17jbvjnq8oib62uf6', '::1', 1660135255, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303133353235353b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('2lmp2sprlq5t8f0h8qaj2f5k8mlma3al', '::1', 1660198100, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303139383130303b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('2rh7p755t2f1qfboap8un7gpfe6muor4', '::1', 1660085255, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303038353235353b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('2stq3jqqu07221jju6987ak28fg4loja', '::1', 1660107856, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303130373835363b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('35c3k8u1b3jaelsjit2jv5i16h939gvj', '::1', 1660141140, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303134313134303b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('3sdepk4mll8l3bhncvha1q8tn6qqnq6a', '::1', 1660088113, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303038383131333b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('4grhnltpldq4eruvsdbaf4aksgevhg17', '::1', 1660093451, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303039333435313b706172656e745f6c6f67696e7c733a313a2231223b706172656e745f69647c733a313a2232223b6c6f67696e5f757365725f69647c733a313a2232223b6e616d657c733a31353a224d41524b205a55434b455242455247223b6c6f67696e5f747970657c733a363a22706172656e74223b),
('4rp84756pfhqd4492nur61cumiamrfuu', '::1', 1660077326, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303037373332363b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('4vkpe9q6gekj50r2c40m5ehatg7btg4p', '::1', 1660140274, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303134303237343b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('5h2d3qmoimqahuge6l1bpjhll7vgnmhc', '::1', 1660198439, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303139383433333b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('5v7jp0u724agvvfa5evras5tf9feau3k', '::1', 1660134213, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303133343231333b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('639mro3gbvhqhisi68mg91ftgp3k312p', '::1', 1660088821, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303038383832313b73747564656e745f6c6f67696e7c733a313a2231223b73747564656e745f69647c733a313a2233223b6c6f67696e5f757365725f69647c733a313a2233223b6e616d657c733a32353a224956414d204841524f4c44204150415a4120434f4e444f5249223b6c6f67696e5f747970657c733a373a2273747564656e74223b),
('684t8ah6uucdu7238hs5br73fmnck5f1', '::1', 1660112109, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303131313835383b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('6906j2vm7e51m6qr2t8nr8r2sve7fiut', '::1', 1660077024, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303037373032343b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('7mptob55ah071ddha2b9lhulu9fqj8lv', '::1', 1660196776, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303139363737363b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('85s2saspr9tfl5m1lrambp7vlau878vg', '::1', 1660091997, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303039313939373b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('8lgdnrb9qagmatm48g411ejbhj5n4haq', '::1', 1660107529, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303130373532393b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('8o1ak2molaavck9qic3i9geaito9e07r', '::1', 1660090900, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303039303930303b706172656e745f6c6f67696e7c733a313a2231223b706172656e745f69647c733a313a2232223b6c6f67696e5f757365725f69647c733a313a2232223b6e616d657c733a31353a224d41524b205a55434b455242455247223b6c6f67696e5f747970657c733a363a22706172656e74223b),
('8p0cstom8hrran77293v98kqaecmhii2', '::1', 1660111858, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303131313835383b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('9cjtjoijli32q17g71so4iftp7bev8nm', '::1', 1660138398, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303133383339383b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('bnqv81q2ctqomqs4qfgn85vkj8t4520e', '::1', 1660094410, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303039343431303b746561636865725f6c6f67696e7c733a313a2231223b746561636865725f69647c733a313a2233223b6c6f67696e5f757365725f69647c733a313a2233223b6e616d657c733a33303a224741425249454c20414c454a414e44524f204d414d414e4920544954544f223b6c6f67696e5f747970657c733a373a2274656163686572223b),
('bv3rr784f3e2rqpneq9ob243g1kmtr06', '::1', 1660100627, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303130303632373b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('c0b3nv2vdjmvfs89tfa9h9s80vrnum01', '::1', 1660081886, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303038313838363b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('du24hoo195fbevujl1jf7aijovedi58j', '::1', 1660185287, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303138353238373b73747564656e745f6c6f67696e7c733a313a2231223b73747564656e745f69647c733a313a2233223b6c6f67696e5f757365725f69647c733a313a2233223b6e616d657c733a32353a224956414d204841524f4c44204150415a4120434f4e444f5249223b6c6f67696e5f747970657c733a373a2273747564656e74223b),
('e0q8bgp3i5trd4jcts29u9001ntna6ae', '::1', 1660084718, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303038343731383b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('echaf04iiv346uj9t2ks5hi4n6pb5r51', '::1', 1660196219, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303139363231393b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('f5up6kog6oome4rufgq3a2uk0cob1c51', '::1', 1660141484, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303134313436363b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('g29mlbt8q2rultbcl15ijimkd5fqo3hi', '::1', 1660108425, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303130383432353b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('gk1hrr9olb5kh0fts9vfbgeffk4l32mf', '::1', 1660078965, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303037383936353b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('gp5282rao1hfidi8tvsekckip68k0fmt', '::1', 1660080374, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303038303337343b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('h205dg9f7h4qo7vm6o9botg81mean7fb', '::1', 1660186563, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303138363536333b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('hgvuu2d4h6g64b5t36pae6p7ts5ub3fp', '::1', 1660088513, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303038383531333b73747564656e745f6c6f67696e7c733a313a2231223b73747564656e745f69647c733a313a2233223b6c6f67696e5f757365725f69647c733a313a2233223b6e616d657c733a32353a224956414d204841524f4c44204150415a4120434f4e444f5249223b6c6f67696e5f747970657c733a373a2273747564656e74223b),
('hkprdtquo11l5ou26il3cehhagtr8bcj', '::1', 1660189217, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303138393231373b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('i14eipqu04q65lh73tn2rjdqv4qpg32q', '::1', 1660081417, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303038313431373b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('i50u1vejnaekd1ma65qo0bn81k5698et', '::1', 1660101590, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303130313539303b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('i8mau55srhl97dra3vmvqtndc45hrav2', '::1', 1660078053, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303037383035333b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('jhtv4gg3rk1s01uhklhmff2ffmshnue6', '::1', 1660190452, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303139303435323b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('klfd4b76gn6748rb2te78usfjn1di2ue', '::1', 1660134547, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303133343534373b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('kmgv7odoetq1p68jcdftmbcvqijci8n4', '::1', 1660091237, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303039313233373b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('l0n8d1a7fcb89civ44mhc00ao94l29oq', '::1', 1660080073, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303038303037333b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('lg1crdfk7oigh0121hdloc5kvmmtuqq0', '::1', 1660081053, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303038313035333b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('lhi0q677u27jrfcfvm62kp0g0nl9q54f', '::1', 1660082948, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303038323934383b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('lliei1bm4aduejvqjtoaklapv7lq34bc', '::1', 1660188759, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303138383735393b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b666c6173685f6d6573736167657c733a32353a224c61206173697374656e6369612041637475616c697a61646f223b5f5f63695f766172737c613a313a7b733a31333a22666c6173685f6d657373616765223b733a333a226f6c64223b7d),
('moblg830hj78nnjshpk4ehnektb8vpgh', '::1', 1660198433, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303139383433333b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('mvn895s030u3fn11chsulqhfol7p17vt', '::1', 1660136042, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303133363034323b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('n6r64tfghfe5adb7fh01u4grj930871u', '::1', 1660091684, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303039313638343b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('p17b4mc31kei3qap0egvctvlc4t7dne4', '::1', 1660139348, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303133393334383b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('p6elf3p0994ssti2jdvftts3lv44ka8b', '::1', 1660094723, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303039343732333b746561636865725f6c6f67696e7c733a313a2231223b746561636865725f69647c733a313a2233223b6c6f67696e5f757365725f69647c733a313a2233223b6e616d657c733a33303a224741425249454c20414c454a414e44524f204d414d414e4920544954544f223b6c6f67696e5f747970657c733a373a2274656163686572223b),
('pdar48q85b70mnf5trj7n3ditqiuftnn', '::1', 1660079702, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303037393730323b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('pv9p7jc2kjik88lvtn2rn8sea98soft3', '::1', 1660197355, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303139373335353b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('q82f22dkuucat3mp13mk0419johgvm9u', '::1', 1660134902, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303133343930323b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('q8n3s9hv3ujtv5l8lifa6lf8k9nc53tv', '::1', 1660078578, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303037383537383b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('qn80bg309u4g423kgrormcmq0n67masu', '::1', 1660103932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303130333933323b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('qvu7fep3v29o3gp8imu2jnp448c845ap', '::1', 1660094027, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303039343032373b746561636865725f6c6f67696e7c733a313a2231223b746561636865725f69647c733a313a2233223b6c6f67696e5f757365725f69647c733a313a2233223b6e616d657c733a33303a224741425249454c20414c454a414e44524f204d414d414e4920544954544f223b6c6f67696e5f747970657c733a373a2274656163686572223b),
('rkmqgs4okh7gfkasov2jf4qju18voo3c', '::1', 1660185984, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303138353938343b706172656e745f6c6f67696e7c733a313a2231223b706172656e745f69647c733a313a2232223b6c6f67696e5f757365725f69647c733a313a2232223b6e616d657c733a31353a224d41524b205a55434b455242455247223b6c6f67696e5f747970657c733a363a22706172656e74223b),
('rpmld4g1se03kcmrkl5l6s34tcq8msj6', '::1', 1660195750, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303139353735303b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('s3q2575mrr2kdihbcta3vfrfab681u9k', '::1', 1660189600, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303138393630303b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('s6ejgr3gebd4an9u6sopj21mruufvdgo', '::1', 1660102639, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303130323633393b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('t6vpgn7d32j3qm300fijg93ivlq4f87s', '::1', 1660092943, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303039323934333b706172656e745f6c6f67696e7c733a313a2231223b706172656e745f69647c733a313a2232223b6c6f67696e5f757365725f69647c733a313a2232223b6e616d657c733a31353a224d41524b205a55434b455242455247223b6c6f67696e5f747970657c733a363a22706172656e74223b),
('tdk6gq85prsrjuvmd8fdfqk5jn7oqeoj', '::1', 1660089341, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303038393334313b73747564656e745f6c6f67696e7c733a313a2231223b73747564656e745f69647c733a313a2233223b6c6f67696e5f757365725f69647c733a313a2233223b6e616d657c733a32353a224956414d204841524f4c44204150415a4120434f4e444f5249223b6c6f67696e5f747970657c733a373a2273747564656e74223b),
('v9o0r4k7m0gki2jvmc3immdo0i542aj0', '::1', 1660141466, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303134313436363b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b),
('vg8ovontqk74huo27hcj6dl5ofsaipm3', '::1', 1660100237, 0x5f5f63695f6c6173745f726567656e65726174657c693a313636303130303233373b61646d696e5f6c6f67696e7c733a313a2231223b61646d696e5f69647c733a313a2231223b6c6f67696e5f757365725f69647c733a313a2231223b6e616d657c733a353a2241646d696e223b6c6f67696e5f747970657c733a353a2261646d696e223b);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `class`
--

CREATE TABLE `class` (
  `class_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `name_numeric` longtext COLLATE utf8_unicode_ci NOT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `class`
--

INSERT INTO `class` (`class_id`, `name`, `name_numeric`, `teacher_id`) VALUES
(2, 'EMPRENDIMIENTO PRODUCTIVO', 'EMP - 301', 2),
(3, 'PROGRAMACIÓN III', 'PRG - 302', 3),
(4, 'GESTIÓN DE SOFTWARE', 'GDS - 303', 4),
(5, 'REDES DE COMPUTADORAS II', 'RDC - 304', 5),
(6, 'TALLER DE MODALIDAD DE GRADUACIÓN', 'TMG - 305', 6),
(7, 'ANÁLISIS Y DISEÑO DE SISTEMAS II', 'ADS - 306', 7),
(8, 'DISEÑO Y PROGRAMACIÓN WEB II', 'DPW - 307', 8),
(9, 'BASE DE DATOS II', 'BDD - 308', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `class_routine`
--

CREATE TABLE `class_routine` (
  `class_routine_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `time_start` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `time_end` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `day` longtext COLLATE utf8_unicode_ci NOT NULL,
  `year` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `document`
--

CREATE TABLE `document` (
  `document_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `file_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `file_type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `class_id` longtext COLLATE utf8_unicode_ci NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `subject_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dormitory`
--

CREATE TABLE `dormitory` (
  `dormitory_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `number_of_room` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enroll`
--

CREATE TABLE `enroll` (
  `enroll_id` int(11) NOT NULL,
  `enroll_code` longtext COLLATE utf8_unicode_ci NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `roll` int(11) NOT NULL,
  `date_added` longtext COLLATE utf8_unicode_ci NOT NULL,
  `year` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `enroll`
--

INSERT INTO `enroll` (`enroll_id`, `enroll_code`, `student_id`, `class_id`, `section_id`, `roll`, `date_added`, `year`) VALUES
(3, 'b0b1ef9', 3, 3, 12, 1, '1660025483', '2022-2023'),
(4, '0243ff1', 4, 2, 11, 1, '1660025556', '2022-2023');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exam`
--

CREATE TABLE `exam` (
  `exam_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date` longtext COLLATE utf8_unicode_ci NOT NULL,
  `year` longtext COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expense_category`
--

CREATE TABLE `expense_category` (
  `expense_category_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `expense_category`
--

INSERT INTO `expense_category` (`expense_category_id`, `name`) VALUES
(1, 'Teacher Salary'),
(2, 'Classroom Equipments'),
(3, 'Classroom Decorations'),
(4, 'Inventory Purchase'),
(5, 'Exam Accessories');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grade`
--

CREATE TABLE `grade` (
  `grade_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `grade_point` longtext COLLATE utf8_unicode_ci NOT NULL,
  `mark_from` int(11) NOT NULL,
  `mark_upto` int(11) NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `amount_paid` longtext COLLATE utf8_unicode_ci NOT NULL,
  `due` longtext COLLATE utf8_unicode_ci NOT NULL,
  `creation_timestamp` int(11) NOT NULL,
  `payment_timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `payment_method` longtext COLLATE utf8_unicode_ci NOT NULL,
  `payment_details` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'paid or unpaid',
  `year` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `language`
--

CREATE TABLE `language` (
  `phrase_id` int(11) NOT NULL,
  `phrase` longtext COLLATE utf8_unicode_ci NOT NULL,
  `english` longtext COLLATE utf8_unicode_ci NOT NULL,
  `spanish` longtext COLLATE utf8_unicode_ci NOT NULL,
  `portuguese` longtext COLLATE utf8_unicode_ci NOT NULL,
  `french` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `language`
--

INSERT INTO `language` (`phrase_id`, `phrase`, `english`, `spanish`, `portuguese`, `french`) VALUES
(1, 'class_routine', 'Class Routine', 'Horarios', 'classe de rotina', 'classe routine'),
(2, 'dashboard', 'Dashboard', 'Dashboard', 'painel de instrumentos', 'Tableau de bord'),
(3, 'student', 'Student', 'Estudiante', 'Aluna', 'Élève'),
(4, 'admit_student', 'Admit Student', 'Admitir Estudiante', 'Admita Student', 'Admettez étudiant'),
(5, 'admit_bulk_student', 'Admit Bulk Student', 'Admitir  Estudiantes masivamente', 'Admita Student massa', 'Admettez étudiant en vrac'),
(6, 'student_information', 'Student Information', 'Información del estudiante', 'Informações do estudante', 'information sur les étudiants'),
(7, 'class', 'Class', 'Clase', 'Classe', 'Classe'),
(8, 'student_promotion', 'Student Promotion', 'Promoción del estudiante', 'Promoção Student', 'promotion des étudiants'),
(9, 'teacher', 'Teacher', 'Profesor', 'Professor', 'Professeur'),
(10, 'parents', 'Parents', 'padres', 'Pais', 'Des parents'),
(11, 'manage_classes', 'Manage Classes', 'Manejo de Clases', 'Gerenciar Classes', 'Gérer les classes'),
(12, 'manage_sections', 'Manage Sections', 'Sectores de manejo', 'Gerenciar seções', 'Gérer les sections'),
(13, 'subject', 'Subject', 'Tema', 'Sujeito', 'Assujettir'),
(14, 'daily_attendance', 'Daily Attendance', 'Asistencia diaria', 'Presença diária', 'présences quotidiennes'),
(15, 'exam', 'Exam', 'Examen', 'Exame', 'Examen'),
(16, 'exam_list', 'Exam List', 'Lista de examen', 'Lista de exame', 'Liste d\'examen'),
(17, 'exam_grades', 'Exam Grades', 'Niveles de examen', 'Notas da Prova', 'Notes d\'examen'),
(18, 'manage_marks', 'Manage Marks', 'Manejo de marcas', 'Gerenciar Marcas', 'Gérer les marques'),
(19, 'send_marks_by_sms', 'Send Marks By Sms', 'Enviar calificaciones por sms', 'Enviar Marcas por SMS', 'Envoyer Marks Par Sms'),
(20, 'tabulation_sheet', 'Tabulation Sheet', 'Hoja de Tabulación', 'Folha de tabulação', 'Tabulation Sheet'),
(21, 'accounting', 'Accounting', 'Contabilidad', 'Contabilidade', 'Comptabilité'),
(22, 'create_student_payment', 'Create Student Payment', 'Crear Pago Estudiante', 'Criar Student pagamento', 'Créer Paiement étudiant'),
(23, 'student_payments', 'Student Payments', 'Los pagos de los estudiantes', 'Pagamentos de estudante', 'Les paiements d\'étudiants'),
(24, 'expense', 'Expense', 'Gastos', 'Despesa', 'Frais'),
(25, 'expense_category', 'Expense Category', 'Categoría del gasto', 'Categoria de despesa', 'Catégorie de dépenses'),
(26, 'library', 'Library', 'Biblioteca', 'Biblioteca', 'Bibliothèque'),
(27, 'transport', 'School Bus', 'Transporte', 'Transporte', 'Transport'),
(28, 'dormitory', 'Hostel', 'Dormitorio', 'Dormitório', 'Dortoir'),
(29, 'noticeboard', 'Noticeboard', 'Anuncios', 'Quadro de notícias', 'Tableau d\'affichage'),
(30, 'message', 'Message', 'Mensaje', 'Mensagem', 'Message'),
(31, 'settings', 'Settings', 'Ajustes', 'Configurações', 'Paramètres'),
(32, 'general_settings', 'General Settings', 'Configuración general', 'Configurações Gerais', 'réglages généraux'),
(33, 'sms_settings', 'Sms Settings', 'Configuración de sMS', 'definições de SMS', 'Paramètres Sms'),
(34, 'language_settings', 'Language Settings', 'Ajustes de idioma', 'Configurações de linguagem', 'Paramètres de langue'),
(35, 'account', 'Account', 'Cuenta', 'Conta', 'Compte'),
(36, 'running_session', 'Running Session', 'Gestión de Sesión', 'correndo Session', 'Courir session'),
(37, 'edit_profile', 'Edit Profile', 'Editar perfil', 'Editar Perfil', 'Modifier le profil'),
(38, 'change_password', 'Change Password', 'Cambia la contraseña', 'Mudar senha', 'Changer le mot de passe'),
(39, 'add_class_routine', 'Add Class Routine', 'Añadir rutina de la clase', 'Adicione a classe de rotina', 'Ajouter une classe Routine'),
(40, 'section', 'Section', 'Sección', 'Seção', 'Section'),
(41, 'edit', 'Edit', 'Editar', 'Editar', 'modifier'),
(42, 'delete', 'Delete', 'Borrar', 'Excluir', 'Effacer'),
(43, 'cancel', 'Cancel', 'Cancelar', 'Cancelar', 'Annuler'),
(44, 'admin_dashboard', 'Admin Dashboard', 'Dashboard admin', 'Painel de administração', 'Administrateur Dashboard'),
(45, 'event_schedule', 'Event Schedule', 'Programa de eventos', 'Calendário de eventos', 'Horaire de l\'événement'),
(46, 'parent', 'Parent', 'Padre', 'parente', 'Parent'),
(47, 'attendance', 'Attendance', 'Asistencia', 'Comparecimento', 'Présence'),
(48, 'add_student', 'Add Student', 'Añadir Estudiante', 'Adicionar Student', 'Ajouter étudiant'),
(49, 'addmission_form', 'Addmission Form', 'Formulario de admisión', 'forma Admisn', 'forme Admisn'),
(50, 'name', 'Name', 'Nombre', 'Nome', 'prénom'),
(51, 'value_required', 'Value Required', 'valor Obligatorio', 'valor Obrigatório', 'Valeur Obligatoire'),
(52, 'select', 'Select', 'Seleccionar', 'selecionar', 'Sélectionner'),
(53, 'select_class_first', 'Select Class First', 'Seleccione Primera Clase', 'Escolha de Primeira Classe', 'Sélectionnez First Class'),
(54, 'roll', 'Roll', 'Rodar', 'Rolo', 'Roulent'),
(55, 'birthday', 'Birthday', 'Cumpleaños', 'Aniversário', 'Anniversaire'),
(56, 'gender', 'Gender', 'Género', 'Gênero', 'Le genre'),
(57, 'male', 'Male', 'Masculino', 'Masculino', 'Mâle'),
(58, 'female', 'Female', 'Hembra', 'Fêmea', 'Femelle'),
(59, 'address', 'Address', 'Dirección', 'Endereço', 'Adresse'),
(60, 'phone', 'Phone', 'Teléfono', 'Telefone', 'Téléphone'),
(61, 'email', 'Email', 'Email', 'O email', 'Email'),
(62, 'password', 'Password', 'Contraseña', 'Senha', 'Mot de passe'),
(63, 'transport_route', 'Transport Route', 'Ruta de Transporte', 'Itinerários', 'Transport Route'),
(64, 'photo', 'Photo', 'Foto', 'foto', 'photo'),
(65, 'add_bulk_student', 'Add Bulk Student', 'Añadir Estudiante granel', 'Adicionar Student massa', 'Ajouter étudiant en vrac'),
(66, 'select_class', 'Select Class', 'Seleccionar clase', 'Selecionar classe', 'Sélectionnez la classe'),
(67, 'add_more_students', 'Add More Students', 'Añadir más estudiantes', 'Adicionar Mais Estudantes', 'Ajouter d\'autres étudiants'),
(68, 'save_students', 'Save Students', 'guardar estudiantes', 'salve Estudantes', 'Enregistrer les étudiants'),
(69, 'select_section', 'Select Section', 'Seleccionar sección', 'Select Section', 'Sélectionnez Section'),
(70, 'add_new_student', 'Add New Student', 'Agregar nuevo Estudiante', 'Adicionar novo Student', 'Ajouter un nouvel étudiant'),
(71, 'all_students', 'All Students', 'Todos los estudiantes', 'Todos os alunos', 'Tous les étudiants'),
(72, 'options', 'Options', 'opciones', 'opções', 'options de'),
(73, 'mark_sheet', 'Mark Sheet', 'Hoja de marca', 'Mark Sheet', 'Mark Sheet'),
(74, 'profile', 'Profile', 'Perfil', 'Perfil', 'Profil'),
(75, 'edit_student', 'Edit Student', 'Editar alumno', 'Editar aluno', 'Modifier étudiant'),
(76, 'current_session', 'Current Session', 'Sesión actual', 'Sessão atual', 'Session actuelle'),
(77, 'promote_to_session', 'Promote To Session', 'Para promover la Sesión', 'Promover para a Sessão', 'Promouvoir Pour Session'),
(78, 'promotion_from_class', 'Promotion From Class', 'Promoción de la Clase', 'Promoção da classe', 'Promotion de la classe'),
(79, 'promotion_to_class', 'Promotion To Class', 'Promoción para la Clase', 'Promoção para a Classe', 'Promotion Pour classe'),
(80, 'select_all', 'Select All', 'Seleccionar todo', 'Selecionar tudo', 'Sélectionner tout'),
(81, 'select_none', 'Select None', 'Seleccione Ninguno', 'Selecione nenhum', 'Ne rien sélectionner'),
(82, 'average', 'Average', 'Promedio', 'Média', 'Moyenne'),
(83, 'promote_slelected_students', 'Promote Slelected Students', 'Promover estudiantes Slelected', 'Promover Estudantes Slelected', 'Promouvoir les étudiants Slelected'),
(84, 'manage_teacher', 'Manage Teacher', 'administrar Maestro', 'Gerenciar professor', 'Gérer l\'enseignant'),
(85, 'add_new_teacher', 'Add New Teacher', 'Agregar nuevo Maestro', 'Adicionar novo professor', 'Ajouter un nouvel enseignant'),
(86, 'add_teacher', 'Add Teacher', 'Añadir Maestro', 'Adicionar professor', 'Ajouter Teacher'),
(87, 'edit_teacher', 'Edit Teacher', 'Editar Maestro', 'Editar professor', 'Modifier enseignant'),
(88, 'sex', 'Sex', 'Sexo', 'Sexo', 'Sexe'),
(89, 'marksheet_for', 'Marksheet For', 'las hojas de calificación para', 'Marcar folhas para', 'Marquer les feuilles pour'),
(90, 'total_marks', 'Total Marks', 'Notas totales', 'total de Marcas', 'total de points'),
(91, 'average_grade_point', 'Average Grade Point', 'Promedio de calificaciones', 'Ponto de classe média', 'Point de grade moyen'),
(92, 'print_marksheet', 'Print Marksheet', 'Imprimir las hojas de calificación', 'folhas marca de impressão', 'Imprimer les feuilles de marque'),
(93, 'student_marksheet', 'Student Marksheet', 'Los alumnos que marquen las hojas', 'Os alunos marcar folhas', 'Les élèves marquent feuilles'),
(94, 'parent_phone', 'Parent Phone', 'Teléfono de los padres', 'pais Telefone', 'Parent téléphone'),
(95, 'all_parents', 'All Parents', 'todos los padres', 'Todos os Pais', 'Tous les parents'),
(96, 'add_new_parent', 'Add New Parent', 'Añadir nuevo elemento primario', 'Adicionar Novo Parent', 'Ajouter un nouveau Parent'),
(97, 'profession', 'Profession', 'Profesión', 'Profissão', 'Métier'),
(98, 'add_parent', 'Add Parent', 'Añadir Padres', 'Adicionar Parent', 'Ajouter Parent'),
(99, 'update', 'Update', 'Actualizar', 'Atualizar', 'Mettre à jour'),
(100, 'manage_class', 'Manage Class', 'Manejo de Clase', 'Gerenciar Classe', 'Gérer la classe'),
(101, 'class_list', 'Class List', 'Lista de clase', 'Lista de Classes', 'Liste des classes'),
(102, 'add_class', 'Add Class', 'Agregar clase', 'Adicione a classe', 'Ajouter une classe'),
(103, 'class_name', 'Class Name', 'Nombre de la clase', 'Nome da classe', 'Nom du cours'),
(104, 'numeric_name', 'Numeric Name', 'Nombre numérico', 'Nome numérico', 'Nom numérique'),
(105, 'name_numeric', 'Name Numeric', 'nombre numérico', 'nome numérico', 'Nom numérique'),
(106, 'select_teacher', 'Select Teacher', 'Seleccione Maestro', 'Escolha um professor', 'Sélectionnez ce professeur'),
(107, 'edit_class', 'Edit Class', 'Editar clase', 'Editar Classe', 'Modifier la classe'),
(108, 'add_new_section', 'Add New Section', 'Añadir Nueva Sección', 'Adicionar Nova Seção', 'Ajouter un nouvel article'),
(109, 'section_name', 'Section Name', 'Nombre de la sección', 'Nome da seção', 'Nom de la section'),
(110, 'nick_name', 'Nick Name', 'Nombre Nick', 'Nome Nick', 'Surnom'),
(111, 'add_section', 'Add Section', 'Añadir Sección', 'Adicionar Seção', 'Ajouter Section'),
(112, 'manage_subject', 'Manage Subject', 'Administrar Asunto', 'Gerenciar Assunto', 'Gérer Sujet'),
(113, 'subject_list', 'Subject List', 'Lista de asuntos', 'Assunto Lista', 'Liste Sujet'),
(114, 'add_subject', 'Add Subject', 'Añadir asunto', 'Adicionar assunto', 'Ajouter un sujet'),
(115, 'subject_name', 'Subject Name', 'Nombre de la asignatura', 'Nome Assunto', 'Nom Sujet'),
(116, 'edit_subject', 'Edit Subject', 'Editar asunto', 'Editar assunto', 'Modifier Objet'),
(117, 'day', 'Day', 'Día', 'Dia', 'journée'),
(118, 'starting_time', 'Starting Time', 'Tiempo de empezar', 'Tempo de partida', 'Heure de départ'),
(119, 'hour', 'Hour', 'Hora', 'Hora', 'Heure'),
(120, 'minutes', 'Minutes', 'Minutos', 'Minutos', 'Minutes'),
(121, 'ending_time', 'Ending Time', 'terminando Tiempo', 'Tempo Final', 'Fin Temps'),
(122, 'edit_class_routine', 'Edit Class Routine', 'Rutina de edición Clase', 'Editar Classe de rotina', 'Modifier la classe de routine'),
(123, 'select_subject', 'Select Subject', 'Seleccione Tema', 'Selecione Assunto', 'Sélectionnez Objet'),
(124, 'manage_daily_attendance', 'Manage Daily Attendance', 'Manejo de Asistencia Diaria', 'Gerenciar atendimento diário', 'Gérer présences quotidiennes'),
(125, 'select_date', 'Select Date', 'Seleccione fecha', 'Selecione Data', 'Sélectionnez date'),
(126, 'select_month', 'Select Month', 'Seleccione mes', 'Selecione o mês', 'Sélectionnez un mois'),
(127, 'select_year', 'Select Year', 'Seleccionar año', 'Selecione o ano', 'Sélectionnez Année'),
(128, 'manage_attendance', 'Manage Attendance', 'Manejo de Asistencia', 'Gerenciar Presença', 'Gérer Participation'),
(129, 'manage_exam', 'Manage Exam', 'Manejo de examen', 'Gerenciar Exam', 'Gérer examen'),
(130, 'add_exam', 'Add Exam', 'Añadir Examen', 'Adicionar Exam', 'Ajouter examen'),
(131, 'exam_name', 'Exam Name', 'Nombre del examen', 'exame Nome', 'Nom d\'examen'),
(132, 'date', 'Date', 'Fecha', 'Encontro', 'date'),
(133, 'comment', 'Comment', 'Comentario', 'Comente', 'Commentaire'),
(134, 'edit_exam', 'Edit Exam', 'Editar examen', 'Editar Exame', 'Modifier examen'),
(135, 'manage_grade', 'Manage Grade', 'Manejo de Grado', 'Gerenciar Grade', 'Gérer année'),
(136, 'grade_list', 'Grade List', 'Lista de calificaciones', 'Lista Grade', 'Liste de grade'),
(137, 'add_grade', 'Add Grade', 'Añadir Grado', 'Adicionar Grade', 'Ajouter grade'),
(138, 'grade_name', 'Grade Name', 'Nombre grado', 'Nome grau', 'Nom de grade'),
(139, 'grade_point', 'Grade Point', 'Punto de grado', 'Ponto de classificação', 'grade point'),
(140, 'mark_from', 'Mark From', 'mark De', 'Mark De', 'Mark De'),
(141, 'mark_upto', 'Mark Upto', 'hasta mark', 'Mark Upto', 'Mark Upto'),
(142, 'manage_exam_marks', 'Manage Exam Marks', 'Manejo de Marcas del examen', 'Gerenciar marcas de exame', 'Gérer les marques d\'examen'),
(143, 'select_exam', 'Select Exam', 'Elija un examen', 'Select Exam', 'Sélectionnez Exam'),
(144, 'send_marks', 'Send Marks', 'Enviar marcas', 'Enviar Marcas', 'Envoyer Marks'),
(145, 'select_receiver', 'Select Receiver', 'Seleccione receptor', 'Selecione Receiver', 'Sélectionnez récepteur'),
(146, 'students', 'Students', 'Los estudiantes', 'estudantes', 'Élèves'),
(147, 'select_a_class', 'Select A Class', 'Seleccione una clase', 'Selecione uma classe', 'Sélectionnez une classe'),
(148, 'select_an_exam', 'Select An Exam', 'Seleccione un examen', 'Escolha um exame', 'Sélectionnez Un examen'),
(149, 'view_tabulation_sheet', 'View Tabulation Sheet', 'Ver hoja de tabulación', 'Ver Folha de Tabulação', 'Voir Tabulation Sheet'),
(150, 'subjects', 'Subjects', 'Asignaturas', 'assuntos', 'Sujets'),
(151, 'total', 'Total', 'Total', 'Total', 'Total'),
(152, 'create_single_invoice', 'Create Single Invoice', 'Crear sola factura', 'Criar factura única', 'Créer facture unique'),
(153, 'create_mass_invoice', 'Create Multi Invoice', 'Crear una masa de facturas', 'Criar Mass Invoice', 'Créer Mass Invoice'),
(154, 'invoice_informations', 'Invoice Informations', 'Informaciones de factura', 'Informações factura', 'Informations de facturation'),
(155, 'title', 'Title', 'Título', 'Título', 'Titre'),
(156, 'description', 'Description', 'Descripción', 'Descrição', 'La description'),
(157, 'payment_informations', 'Payment Informations', 'Información sobre el pago', 'Informações de pagamento', 'Informations de paiement'),
(158, 'enter_total_amount', 'Enter Total Amount', 'Ingrese monto total', 'Digite Valor Total', 'Entrez Montant total'),
(159, 'payment', 'Payment', 'Pago', 'Pagamento', 'Paiement'),
(160, 'enter_payment_amount', 'Enter Payment Amount', 'Ingrese monto de pago', 'Digite Valor do Pagamento', 'Entrez le montant du paiement'),
(161, 'status', 'Status', 'Estado', 'estado', 'statut'),
(162, 'paid', 'Paid', 'Pagado', 'Pago', 'Payé'),
(163, 'unpaid', 'Unpaid', 'No pagado', 'não remunerado', 'Non payé'),
(164, 'method', 'Method', 'Método', 'Método', 'la méthode'),
(165, 'cash', 'Cash', 'Efectivo', 'Dinheiro', 'Argent liquide'),
(166, 'check', 'Check', 'Comprobar', 'Verifica', 'Vérifier'),
(167, 'card', 'Card', 'Tarjeta', 'Cartão', 'Carte'),
(168, 'add_invoice', 'Add Invoice', 'Añadir factura', 'Adicionar Invoice', 'Ajouter facture'),
(169, 'unpaid_invoices', 'Unpaid Invoices', 'facturas impagadas', 'As facturas não pagas', 'factures impayées'),
(170, 'payment_history', 'Payment History', 'historial de pagos', 'Histórico de pagamento', 'historique de paiement'),
(171, 'amount', 'Amount', 'Cantidad', 'Quantidade', 'Montant'),
(172, 'expenses', 'Expenses', 'Gastos', 'despesas', 'Dépenses'),
(173, 'add_new_expense', 'Add New Expense', 'Añadir nuevo gasto', 'Adicionar nova despesa', 'Ajouter New Expense'),
(174, 'category', 'Category', 'Categoría', 'Categoria', 'Catégorie'),
(175, 'add_expense', 'Add Expense', 'Añadir Gasto', 'Adicionar Despesa', 'Ajouter Expense'),
(176, 'select_expense_category', 'Select Expense Category', 'Seleccione una categoría de gastos', 'Selecione a categoria de despesa', 'Sélectionnez Catégorie de dépenses'),
(177, 'add_new_expense_category', 'Add New Expense Category', 'Añadir Nueva Categoría del gasto', 'Adicionar Nova Categoria de Despesa', 'Ajouter une nouvelle catégorie de dépenses'),
(178, 'add_expense_category', 'Add Expense Category', 'Añadir Categoría del gasto', 'Adicionar Categoria de Despesa', 'Ajouter catégorie de dépenses'),
(179, 'edit_expense', 'Edit Expense', 'Edición de gastos', 'Editar Despesa', 'Modifier Expense'),
(180, 'manage_library_books', 'Manage Library Books', 'Manejo de libros de la biblioteca', 'Gerenciar Biblioteca Livros', 'Gérer des livres de bibliothèque'),
(181, 'book_list', 'Book List', 'Lista de libros', 'Lista de livros', 'Liste de livres'),
(182, 'add_book', 'Add Book', 'Añadir libro', 'Adicionar livro', 'Description du livre'),
(183, 'book_name', 'Book Name', 'Nombre del libro', 'Nome do livro', 'Nom du livre'),
(184, 'author', 'Author', 'Autor', 'Autor', 'Auteur'),
(185, 'price', 'Price', 'Precio', 'Preço', 'Prix'),
(186, 'available', 'Available', 'Disponible', 'Disponível', 'Disponible'),
(187, 'unavailable', 'Unavailable', 'Indisponible', 'Indisponível', 'Indisponible'),
(188, 'manage_transport', 'Manage Transport', 'Manejo de Transporte', 'Gerenciar Transportes', 'Gérer Transport'),
(189, 'transport_list', 'Transport List', 'Lista de transporte', 'Lista de transportes', 'Liste des transports'),
(190, 'add_transport', 'Add Transport', 'Añadir Transporte', 'Adicionar Transportes', 'Ajouter Transport'),
(191, 'route_name', 'Route Name', 'Nombre ruta', 'Nome Route', 'Nom de la route'),
(192, 'number_of_vehicle', 'Number Of Vehicle', 'Número de vehículos', 'Número de Veículo', 'Nombre de véhicules'),
(193, 'route_fare', 'Route Fare', 'Fare ruta', 'Tarifa Route', 'Route Fare'),
(194, 'edit_transport', 'Edit Transport', 'Editar Transporte', 'Editar Transportes', 'Modifier Transport'),
(195, 'manage_dormitory', 'Manage Dormitory', 'administrar compartida', 'Gerenciar Dormitório', 'Gérer Dortoir'),
(196, 'dormitory_list', 'Hostel List', 'Lista dormitorio', 'Lista dormitório', 'Liste Dortoir'),
(197, 'add_dormitory', 'Add Hostel', 'Añadir compartida', 'Adicionar Dormitório', 'Ajouter Dortoir'),
(198, 'dormitory_name', 'Hostel Name', 'Nombre del dormitorio', 'Nome dormitório', 'Nom Dortoir'),
(199, 'number_of_room', 'Hostel Of Room', 'Número de habitación', 'Número de salas', 'Nombre de chambres'),
(200, 'edit_dormitory', 'Edit Dormitory', 'Editar compartida', 'Editar Dormitório', 'Modifier Dortoir'),
(201, 'manage_noticeboard', 'Manage Noticeboard', 'administrar tablón de anuncios', 'Gerenciar Noticeboard', 'Gérer Noticeboard'),
(202, 'noticeboard_list', 'Noticeboard List', 'Lista tablón de anuncios', 'Lista de avisos', 'Liste de Noticeboard'),
(203, 'add_noticeboard', 'Add Noticeboard', 'Añadir tablón de anuncios', 'Adicionar Noticeboard', 'Ajouter Noticeboard'),
(204, 'notice', 'Notice', 'darse cuenta', 'Aviso prévio', 'Avis'),
(205, 'add_notice', 'Add Notice', 'Añadir Aviso', 'Adicionar Notice', 'Ajouter l\'avis'),
(206, 'send_sms_to_all', 'Send Sms To All', 'Enviar SMS a todos', 'Enviar SMS a todos os', 'Envoyer Sms Pour Tous'),
(207, 'yes', 'Yes', 'Sí', 'sim', 'Oui'),
(208, 'no', 'No', 'No', 'Não', 'Non'),
(209, 'sms_service_not_activated', 'Sms Service Not Activated', 'El servicio de SMS no activado', 'Serviço de SMS Não Activado', 'Service Sms non activé'),
(210, 'private_messaging', 'Private Messaging', 'Mensajería privada', 'Mensagens privadas', 'Messagerie privée'),
(211, 'messages', 'Messages', 'mensajes', 'mensagens', 'messages'),
(212, 'new_message', 'New Message', 'Nuevo mensaje', 'Nova mensagem', 'Nouveau message'),
(213, 'write_new_message', 'Write New Message', 'Escribir un nuevo mensaje', 'Escrever Nova Mensagem', 'Ecrire un nouveau message'),
(214, 'recipient', 'Recipient', 'Recipiente', 'beneficiário', 'Bénéficiaire'),
(215, 'select_a_user', 'Select A User', 'Seleccione un usuario', 'Selecione um usuário', 'Sélectionnez un utilisateur'),
(216, 'write_your_message', 'Write Your Message', 'Escribe tu mensaje', 'Escreva sua mensagem', 'Rédigez votre message'),
(217, 'send', 'Send', 'Enviar', 'Enviar', 'Envoyer'),
(218, 'system_settings', 'System Settings', 'Ajustes del sistema', 'Configurações de sistema', 'Les paramètres du système'),
(219, 'system_name', 'System Name', 'Nombre del sistema', 'Name System', 'Name System'),
(220, 'system_title', 'System Title', 'sistema de Título', 'Título sistema', 'système Titre'),
(221, 'paypal_email', 'Paypal Email', 'paypal Email', 'Paypal e-mail', 'Paypal Email'),
(222, 'currency', 'Currency', 'Moneda', 'Moeda', 'Devise'),
(223, 'system_email', 'System Email', 'sistema de correo electrónico', 'sistema de E-mail', 'système Email'),
(224, 'select_running_session', 'Select Running Session', 'Seleccione Ejecución de Sesión', 'Selecione Executar Session', 'Sélectionnez Exécution Session'),
(225, 'language', 'Language', 'Idioma', 'Língua', 'La langue'),
(226, 'text_align', 'Text Align', 'Alinear texto', 'Alinhar texto', 'Text Align'),
(227, 'save', 'Save', 'Guardar', 'Salvar', 'sauvegarder'),
(228, 'update_product', 'Update Product', 'actualización del producto', 'atualização do produto', 'Mise à jour du produit'),
(229, 'file', 'File', 'Archivo', 'Arquivo', 'Fichier'),
(230, 'install_update', 'Install Update', 'Instalar actualización', 'Instalar atualização', 'Installer la mise à jour'),
(231, 'theme_settings', 'Theme Settings', 'Ajustes de tema', 'Configurações de tema', 'Réglage des thèmes'),
(232, 'default', 'Default', 'Defecto', 'Padrão', 'Défaut'),
(233, 'select_theme', 'Select Theme', 'Seleccionar tema', 'Escolha um tema', 'Sélectionne un thème'),
(234, 'select_a_theme_to_make_changes', 'Select A Theme To Make Changes', 'Seleccione un tema para hacer cambios', 'Selecione um tema para fazer mudanças', 'Sélectionnez un thème pour effectuer des modifications'),
(235, 'upload_logo', 'Upload Logo', 'Subir Logo', 'Carregar Logo', 'Télécharger Logo'),
(236, 'upload', 'Upload', 'Subir', 'Envio', 'Télécharger'),
(237, 'select_a_service', 'Select A Service', 'Seleccione un servicio', 'Seleccione um serviço', 'Sélectionnez un service'),
(238, 'not_selected', 'Not Selected', 'No seleccionado', 'Não selecionado', 'Non séléctionné'),
(239, 'disabled', 'Disabled', 'Discapacitado', 'Desativado', 'désactivé'),
(240, 'clickatell_username', 'Clickatell Username', 'Nombre de usuario Clickatell', 'Clickatell usuário', 'Clickatell Nom d\'utilisateur'),
(241, 'clickatell_password', 'Clickatell Password', 'clickatell contraseña', 'Senha Clickatell', 'Clickatell Mot de passe'),
(242, 'clickatell_api_id', 'Clickatell Api Id', 'Clickatell Api Id', 'Clickatell Api Id', 'Clickatell Api Id'),
(243, 'twilio_account', 'Twilio Account', 'cuenta Twilio', 'Conta Twilio', 'compte Twilio'),
(244, 'authentication_token', 'Authentication Token', 'Token de autenticación', 'Autenticação de token', 'authentification Token'),
(245, 'registered_phone_number', 'Registered Phone Number', 'Número de teléfono registrado', 'Número de telefone registado', 'Numéro de téléphone enregistré'),
(246, 'manage_language', 'Manage Language', 'Manejo de Lenguaje', 'Gerenciar Idioma', 'Gérer Langue'),
(247, 'language_list', 'Language List', 'Lista de idiomas', 'Lista idioma', 'Liste des langues'),
(248, 'add_phrase', 'Add Phrase', 'Añadir Palabra', 'Adicionar Frase', 'Ajouter Phrase'),
(249, 'add_language', 'Add Language', 'Agregar idioma', 'Adicionar idioma', 'Ajouter une langue'),
(250, 'option', 'Option', 'Opción', 'Opção', 'Option'),
(251, 'edit_phrase', 'Edit Phrase', 'Editar Palabra', 'Editar Frase', 'Modifier Phrase'),
(252, 'delete_language', 'Delete Language', 'Eliminar idioma', 'excluir Idioma', 'Supprimer Langue'),
(253, 'phrase', 'Phrase', 'Palabra', 'Frase', 'Phrase'),
(254, 'manage_profile', 'Manage Profile', 'administrar perfil', 'Gerenciar perfil', 'Gérer le profil'),
(255, 'update_profile', 'Update Profile', 'Actualización del perfil', 'Atualizar perfil', 'Mettre à jour le profil'),
(256, 'current_password', 'Current Password', 'Contraseña actual', 'senha atual', 'Mot de passe actuel'),
(257, 'new_password', 'New Password', 'Nueva contraseña', 'Nova senha', 'nouveau mot de passe'),
(258, 'confirm_new_password', 'Confirm New Password', 'Confirmar nueva contraseña', 'Confirme a nova senha', 'Confirmer le nouveau mot de passe'),
(259, 'login', 'Login', 'Iniciar sesión', 'Entrar', 'S\'identifier'),
(260, 'forgot_your_password', 'Forgot Your Password', 'Olvidaste tu contraseña', 'Esqueceu sua senha', 'Mot de passe oublié'),
(261, 'reset_password', 'Reset Password', 'Restablecer la contraseña', 'Trocar a senha', 'réinitialiser le mot de passe'),
(262, 'return_to_login_page', 'Return To Login Page', 'Volver a inicio página', 'Retornar à página de login', 'Retour à la page de connexion'),
(263, 'service_is_disabled', 'Service Is Disabled', 'Servicio está deshabilitado', 'Serviço for desativado', 'Service est désactivé'),
(264, 'promote_to_selected_class', 'Promote To Selected Class', 'Para promover la clase seleccionada', 'Promover para a classe selecionada', 'Promouvoir Pour la classe sélectionnée'),
(265, 'stay_in_present_class', 'Stay In Present Class', 'Estancia en clase real', 'Stay In Classe atual', 'Stay In Class Present'),
(266, 'data_updated', 'Data Updated', 'datos actualizados', 'dados atualizados', 'Mise à jour des données'),
(267, 'data_added_successfully', 'Data Added Successfully', 'Datos añadido correctamente', 'Dados adicionado com sucesso', 'Données Ajouté avec succès'),
(268, 'edit_grade', 'Edit Grade', 'Editar Grado', 'Editar Grade', 'Modifier année'),
(269, 'manage_attendance_of_class', 'Manage Attendance Of Class', 'Gestionar asistencia de Clase', 'Gerenciar presença de Classe', 'Gérer Participation de classe'),
(270, 'present', 'Present', 'Presente', 'Presente', 'Présent'),
(271, 'absent', 'Absent', 'Ausente', 'Ausente', 'Absent'),
(272, 'update_attendance', 'Update Attendance', 'actualización de Asistencia', 'Presença atualização', 'Mise à jour de présence'),
(273, 'undefined', 'Undefined', 'Indefinido', 'Indefinido', 'Indéfini'),
(274, 'back', 'Back', 'Espalda', 'Costas', 'Arrière'),
(275, 'save_changes', 'Save Changes', 'Guardar cambios', 'Salvar alterações', 'Sauvegarder les modifications'),
(276, 'data_deleted', 'Data Deleted', 'datos eliminados', 'dados apagados', 'données supprimées'),
(277, 'academic_syllabus', 'Teacher Suggestion', 'Plan de estudios académicos', 'Programa acadêmico', 'Syllabus Academic'),
(278, 'add_teacher_suggestion', 'Add Teacher Suggestion', 'Añadir programa académico', 'Adicionar Programa Acadêmico', 'Ajouter Syllabus Academic'),
(279, 'uploader', 'Uploader', 'Uploader', 'Uploader', 'Uploader'),
(280, 'upload_teacher_suggestion', 'Upload Teacher Suggestion', 'Cargar programa académico', 'Carregar Programa Acadêmico', 'Télécharger Academic Syllabus'),
(281, 'upload_syllabus', 'Upload Syllabus', 'Subir Syllabus', 'Carregar Syllabus', 'Télécharger Syllabus'),
(282, 'syllabus_uploaded', 'Syllabus Uploaded', 'Plan de estudios Subida', 'Syllabus Uploaded', 'Syllabus Téléchargée'),
(283, 'download', 'Download', 'Descargar', 'baixar', 'Télécharger'),
(284, 'remove', 'Remove', 'retirar', 'Remover', 'Retirer'),
(285, 'print', 'Print', 'Impresión', 'Impressão', 'Impression'),
(286, 'teacher_dashboard', 'Teacher Dashboard', 'Dashboard del profesor', 'professor do dashboard', 'Tableau de bord des enseignants'),
(287, 'study_material', 'Study Material', 'Material de estudio', 'Material de estudo', 'Matériel d\'étude'),
(288, 'teacher_list', 'Teacher List', 'Lista maestro', 'Lista do professor', 'Liste des enseignants'),
(289, 'manage_class_routine', 'Manage Class Routine', 'Manejo de rutina de la clase', 'Gerenciar Classe Rotina', 'Gérer la classe Routine'),
(290, 'class_routine_list', 'Class Routine List', 'Lista de rutina de la clase', 'Classe Lista de rotina', 'Classe Liste de routine'),
(291, 'add_study_material', 'Add Study Material', 'Añadir Material de Estudio', 'Adicionar Material de Estudo', 'Ajouter Matériel d\'étude'),
(292, 'file_type', 'File Type', 'Tipo de archivo', 'Tipo de arquivo', 'Type de fichier'),
(293, 'select_file_type', 'Select File Type', 'Seleccione el tipo de archivo', 'Selecionar Tipo de Arquivo', 'Sélectionner le type de fichier'),
(294, 'image', 'Image', 'Imagen', 'Imagem', 'image'),
(295, 'doc', 'Doc', 'Doctor', 'doutor', 'Doc'),
(296, 'pdf', 'Pdf', 'pdf', 'Pdf', 'Pdf'),
(297, 'excel', 'Excel', 'Sobresalir', 'sobressair', 'Exceller'),
(298, 'other', 'Other', 'Otro', 'De outros', 'Autre'),
(299, 'manage_promotion', 'Manage Promotion', 'Manejo de Promoción', 'Gerenciar Promoção', 'Gérer promotion'),
(300, 'select_class_for_promotion_to_and_from', 'Select Class For Promotion To And From', 'Seleccione Clase para la promoción hacia y desde', 'Selecione Classe de promoção a partir E', 'Sélectionnez la classe pour la promotion à Et De'),
(301, 'students_of_class', 'Students Of Class', 'Los estudiantes de la clase', 'Os alunos da classe', 'Les élèves de la classe'),
(302, 'enroll_to_class', 'Enroll To Class', 'Para inscribirse Clase', 'Se inscrever para a Classe', 'Inscrivez-vous à la classe'),
(303, 'add_a_row', 'Add A Row', 'Añadir Fila', 'Adicionar Fila', 'Ajouter rang'),
(304, 'marks_obtained', 'Marks Obtained', 'marcas obtenidas', 'notas obtidas', 'Notes obtenues'),
(305, 'marks_updated', 'Marks Updated', 'Actualizado marcas', 'marcas Atualizado', 'Marks Mise à jour'),
(306, 'marks_for', 'Marks For', 'Para las marcas', 'marcas para', 'Marks Pour'),
(307, 'attendance_for_class', 'Attendance For Class', 'Para la asistencia a clase', 'Presença Para a Classe', 'Participation Pour la classe'),
(308, 'print_tabulation_sheet', 'Print Tabulation Sheet', 'Imprimir hoja de tabulación', 'Folha de Tabulação de impressão', 'Imprimer Tabulation Sheet'),
(309, 'receiver', 'Receiver', 'Receptor', 'recebedor', 'Récepteur'),
(310, 'please_select_receiver', 'Please Select Receiver', 'Por favor seleccione Receptor', 'Selecione Receiver', 'S\'il vous plaît Sélectionnez Receiver'),
(311, 'session_changed', 'Session Changed', 'sesión Changed', 'sessão Changed', 'session Changed'),
(312, 'attendance_updated', 'Attendance Updated', 'La asistencia Actualizado', 'Presença Atualizado', 'Participation Mise à jour'),
(313, 'study_material_info_saved_successfuly', 'Study Material Info Saved Successfuly', 'Material de Estudio información guardada exitosamente', 'Material de Estudo Informações com sucesso Salvo', 'Matériel d\'étude Infos enregistrées successfuly'),
(314, 'edit_study_material', 'Edit Study Material', 'Editar Material de Estudio', 'Editar Material de Estudo', 'Modifier Matériel d\'étude'),
(315, 'parent_dashboard', 'Parent Dashboard', 'Dashboard de Padres', 'Painel pai', 'Tableau de bord Parent'),
(316, 'exam_marks', 'Exam Marks', 'marcas de examen', 'Marcas de exame', 'Marques d\'examen'),
(317, 'total_mark', 'Total Mark', 'Puntuación total', 'total de Mark', 'total Mark'),
(318, 'mark_obtained', 'Mark Obtained', 'Nota obtenida', 'Mark Obtido', 'Mark Obtenu'),
(319, 'manage_invoice/payment', 'Manage Invoice/payment', 'Manejo de la factura / pago', 'Gerenciar fatura / pagamento', 'Gérer facture / paiement'),
(320, 'invoice/payment_list', 'Invoice/payment List', 'Lista de factura / pago', 'Invoice / Lista de pagamento', 'Facture / Liste de paiement'),
(321, 'student_dashboard', 'Student Dashboard', 'Dashboard del estudiante', 'Painel Student', 'Tableau de bord de l\'élève'),
(322, 'obtained_marks', 'Obtained Marks', 'calificaciones obtenidas', 'notas obtidas', 'Les notes obtenues'),
(323, 'highest_mark', 'Highest Mark', 'Marcos más alto', 'maior Mark', 'le plus élevé Mark'),
(324, 'grade', 'Grade', 'Grado', 'Grau', 'Qualité'),
(325, 'take_payment', 'Take Payment', 'tome Pago', 'tome pagamento', 'Prenez paiement'),
(326, 'view_invoice', 'View Invoice', 'Ver factura', 'Ver Invoice', 'Voir la facture'),
(327, 'creation_date', 'Creation Date', 'Fecha de creación', 'Data de criação', 'Date de création'),
(328, 'payment_to', 'Payment To', 'Pago Para', 'Pagamento para', 'Paiement à'),
(329, 'bill_to', 'Bill To', 'Cobrar a', 'Projeto de lei para', 'Facturer'),
(330, 'total_amount', 'Total Amount', 'Cantidad total', 'Valor total', 'Montant total'),
(331, 'paid_amount', 'Paid Amount', 'Monto de pago', 'Quantidade paga', 'Montant payé'),
(332, 'due', 'Due', 'Debido', 'Devido', 'Dû'),
(333, 'amount_paid', 'Amount Paid', 'Cantidad pagada', 'Quantia paga', 'Le montant payé'),
(334, 'payment_successfull', 'Payment Successfull', 'Pago exitoso', 'Successfull pagamento', 'Paiement Successfull'),
(335, 'add_invoice/payment', 'Add Invoice/payment', 'Añadir factura / pago', 'Adicionar fatura / pagamento', 'Ajouter Facture / paiement'),
(336, 'invoices', 'Invoices', 'Facturas', 'facturas', 'factures'),
(337, 'action', 'Action', 'Acción', 'Açao', 'action'),
(338, 'required', 'Required', 'Necesario', 'Requeridos', 'Obligatoire'),
(339, 'info', 'Info', 'Información', 'informações', 'Info'),
(340, 'view_academic_performance', 'View Academic Performance', 'Ver Rendimiento Académico', 'Ver Desempenho Acadêmico', 'Voir le rendement scolaire'),
(341, 'phrase_list', 'Phrase List', 'Lista palabra', 'Lista frase', 'Liste Phrase'),
(342, 'update_phrase', 'Update Phrase', 'Actualizar palabras', 'Frase atualização', 'Mise à jour Phrase'),
(343, 'edit_invoice', '', 'Editar factura', '', ''),
(344, 'students_added', '', 'Estudiantes agregados', '', ''),
(345, 'student_already_enrolled', '', 'estudiante ya matriculado', '', ''),
(346, 'new_enrollment_successfull', '', 'Nueva inscripción exitosa', '', ''),
(347, 'reply_message', '', 'Mensaje de respuesta', '', ''),
(348, 'daily_atendance', '', 'Asistencia', '', ''),
(349, 'attendance_report', '', 'Reporte de asistencia', '', ''),
(350, 'study_material_info_updated_successfuly', '', 'Actualización de información de material de estudio', '', ''),
(351, 'running', '', 'corriendo', '', ''),
(352, 'archived', '', 'Archivado', '', ''),
(353, 'show_report', '', 'Mostrar reporte', '', ''),
(354, 'attendance_report_of_class', '', 'Asistencia informe de clase', '', ''),
(355, 'attendance_sheet', '', 'Hoja de asistencia', '', ''),
(356, 'print_attendance_sheet', '', 'Imprimir hoja de asistencia', '', ''),
(357, 'mark_archive', '', 'Marcar archivo', '', ''),
(358, 'remove_from_archive', '', 'Eliminar del archivo', '', ''),
(359, 'print/view_notice', '', 'imprimir / ver aviso', '', ''),
(360, 'view_notice', '', 'Vista noticia', '', ''),
(361, 'month', 'Month', 'Mes', 'mês', 'mois'),
(362, 'product_updated_successfully', '', 'Producto actualizado éxito', '', ''),
(363, 'reset_password', 'Reset Password', 'restablecer la contraseña', '', ''),
(367, 'password_update', 'Password Update', 'Actualizar contraseña', '', ''),
(369, 'my_profile', 'My Profile', 'Mi Perfil', 'meu perfil', 'mon profil'),
(370, 'password_mismatch', '', 'la contraseña no coincide', '', ''),
(371, 'password_updated', '', 'contraseña actualizada', '', ''),
(372, 'email_account_use', 'This Email account already used', 'Esta cuenta de correo electrónico ya se utiliza', 'Esta conta e-mail já utilizado', 'Ce compte Email déjà utilisé'),
(373, 'theme_selected', '', 'Tema seleccionado', '', ''),
(374, 'admin', '', 'administración', '', ''),
(375, 'edit_notice', '', 'Editar noticia', '', ''),
(376, 'account_updated', '', 'Cuenta actualizada', '', ''),
(377, 'on', '', 'en', '', ''),
(378, 'message_sent!', '', '¡mensaje enviado!', '', ''),
(379, 'teacher_suggestion', '', 'Sugerencia del profesor', '', ''),
(380, 'upload_suggestion', '', 'subir sugerencia', '', ''),
(381, 'add_teacher_suggestion', '', 'Agregar sugerencia del maestro', '', ''),
(382, 'add_teacher_suggestion\r\n', 'Add Teacher Suggestion', 'Añadir sugerencia de profesor', 'Adicionar sugestão do professor', 'Ajouter une suggestion d\'enseignant'),
(383, 'add_academic_syllabus', '', 'Agregar programa académico', '', ''),
(384, 'upload_academic_syllabus', '', 'subir programa académico', '', ''),
(385, 'student_informationx', '', 'Información del estudiante', '', ''),
(386, 'message_sent', '', 'Mensaje enviado', '', ''),
(387, 'settings_updated', '', 'Ajustes actualizan', '', ''),
(388, 'religion', 'Religion', 'Religión', 'Religião', 'Religion'),
(389, 'blood_group', 'Blood group', 'grupo sanguíneo', 'grupo sanguíneo', 'groupe sanguin'),
(391, 'earning_graph', 'Earning Graph', 'Ganancia Gráfico', 'Gráfico de ganhos', 'Graphique de gains'),
(392, 'setting', 'setting', 'Ajuste', '', ''),
(393, 'Manejo de Materias', '', '', '', ''),
(394, 'Cursos', '', '', '', ''),
(395, 'Femenino', '', '', '', ''),
(396, 'Curso', '', '', '', ''),
(397, 'Nro. Lista', '', '', '', ''),
(398, 'Masculino', '', '', '', ''),
(399, 'Codigo Clase', '', '', '', ''),
(400, 'Añadir Apoderado', '', '', '', ''),
(401, 'Asignar RFID', '', '', '', ''),
(402, 'Asignar Tarjeta RFID', '', '', '', ''),
(403, 'Serial RFID', '', '', '', ''),
(404, 'Accion', '', '', '', ''),
(405, 'Panel Principal', '', '', '', ''),
(406, 'Panel principal', '', '', '', ''),
(407, 'Panel principal', '', '', '', ''),
(408, 'Panel principal', '', '', '', ''),
(409, 'Panel principal', '', '', '', ''),
(410, 'Panel principal', '', '', '', ''),
(411, 'Panel principal', '', '', '', ''),
(412, 'Panel principal', '', '', '', ''),
(413, 'Panel principal', '', '', '', ''),
(414, 'Panel principal', '', '', '', ''),
(415, 'Panel principal', '', '', '', ''),
(416, 'Panel principal', '', '', '', ''),
(417, 'Panel principal', '', '', '', ''),
(418, 'Panel principal', '', '', '', ''),
(419, 'Panel principal', '', '', '', ''),
(420, 'Panel principal', '', '', '', ''),
(421, 'Panel principal', '', '', '', ''),
(422, 'Panel principal', '', '', '', ''),
(423, 'Panel principal', '', '', '', ''),
(424, 'Panel principal', '', '', '', ''),
(425, 'Panel principal', '', '', '', ''),
(426, 'Panel principal', '', '', '', ''),
(427, 'Panel principal', '', '', '', ''),
(428, 'Panel principal', '', '', '', ''),
(429, 'Panel principal', '', '', '', ''),
(430, 'Panel principal', '', '', '', ''),
(431, 'Panel principal', '', '', '', ''),
(432, 'Panel principal', '', '', '', ''),
(433, 'Panel principal', '', '', '', ''),
(434, 'Panel principal', '', '', '', ''),
(435, 'Panel principal', '', '', '', ''),
(436, 'Panel principal', '', '', '', ''),
(437, 'Panel principal', '', '', '', ''),
(438, 'Panel principal', '', '', '', ''),
(439, 'Panel principal', '', '', '', ''),
(440, 'Panel principal', '', '', '', ''),
(441, 'Panel principal', '', '', '', ''),
(442, 'Panel principal', '', '', '', ''),
(443, 'Panel principal', '', '', '', ''),
(444, 'Panel principal', '', '', '', ''),
(445, 'Panel principal', '', '', '', ''),
(446, 'Panel principal', '', '', '', ''),
(447, 'Panel principal', '', '', '', ''),
(448, 'Panel principal', '', '', '', ''),
(449, 'Panel principal', '', '', '', ''),
(450, 'Panel principal', '', '', '', ''),
(451, 'Panel principal', '', '', '', ''),
(452, 'Panel principal', '', '', '', ''),
(453, 'Panel principal', '', '', '', ''),
(454, 'Panel principal', '', '', '', ''),
(455, 'Panel principal', '', '', '', ''),
(456, 'Panel principal', '', '', '', ''),
(457, 'Panel principal', '', '', '', ''),
(458, 'Panel principal', '', '', '', ''),
(459, 'Panel principal', '', '', '', ''),
(460, 'Panel principal', '', '', '', ''),
(461, 'Panel principal', '', '', '', ''),
(462, 'Panel principal', '', '', '', ''),
(463, 'Panel principal', '', '', '', ''),
(464, 'Panel principal', '', '', '', ''),
(465, 'Panel principal', '', '', '', ''),
(466, 'Panel principal', '', '', '', ''),
(467, 'Panel principal', '', '', '', ''),
(468, 'Panel principal', '', '', '', ''),
(469, 'Panel principal', '', '', '', ''),
(470, 'Panel principal', '', '', '', ''),
(471, 'Panel principal', '', '', '', ''),
(472, 'Panel principal', '', '', '', ''),
(473, 'Panel principal', '', '', '', ''),
(474, 'Panel principal', '', '', '', ''),
(475, 'Panel principal', '', '', '', ''),
(476, 'Panel principal', '', '', '', ''),
(477, 'Panel principal', '', '', '', ''),
(478, 'Panel principal', '', '', '', ''),
(479, 'Panel principal', '', '', '', ''),
(480, 'Panel principal', '', '', '', ''),
(481, 'Panel principal', '', '', '', ''),
(482, 'Panel principal', '', '', '', ''),
(483, 'Panel principal', '', '', '', ''),
(484, 'Panel principal', '', '', '', ''),
(485, 'Panel principal', '', '', '', ''),
(486, 'Panel principal', '', '', '', ''),
(487, 'Panel principal', '', '', '', ''),
(488, 'Panel principal', '', '', '', ''),
(489, 'Panel principal', '', '', '', ''),
(490, 'Panel principal', '', '', '', ''),
(491, 'Panel principal', '', '', '', ''),
(492, 'Panel principal', '', '', '', ''),
(493, 'Panel principal', '', '', '', ''),
(494, 'Panel principal', '', '', '', ''),
(495, 'Panel principal', '', '', '', ''),
(496, 'Panel principal', '', '', '', ''),
(497, 'Panel principal', '', '', '', ''),
(498, 'Panel principal', '', '', '', ''),
(499, 'Panel principal', '', '', '', ''),
(500, 'Panel principal', '', '', '', ''),
(501, 'Panel principal', '', '', '', ''),
(502, 'Panel principal', '', '', '', ''),
(503, 'Panel principal', '', '', '', ''),
(504, 'Panel principal', '', '', '', ''),
(505, 'Panel principal', '', '', '', ''),
(506, 'Panel principal', '', '', '', ''),
(507, 'Panel principal', '', '', '', ''),
(508, 'Panel principal', '', '', '', ''),
(509, 'Panel principal', '', '', '', ''),
(510, 'Panel principal', '', '', '', ''),
(511, 'Panel principal', '', '', '', ''),
(512, 'Panel principal', '', '', '', ''),
(513, 'Panel principal', '', '', '', ''),
(514, 'Panel principal', '', '', '', ''),
(515, 'Panel principal', '', '', '', ''),
(516, 'Panel principal', '', '', '', ''),
(517, 'Panel principal', '', '', '', ''),
(518, 'Panel principal', '', '', '', ''),
(519, 'Panel principal', '', '', '', ''),
(520, 'Panel principal', '', '', '', ''),
(521, 'Panel principal', '', '', '', ''),
(522, 'Panel principal', '', '', '', ''),
(523, 'Panel principal', '', '', '', ''),
(524, 'Panel principal', '', '', '', ''),
(525, 'Panel principal', '', '', '', ''),
(526, 'Panel principal', '', '', '', ''),
(527, 'Panel principal', '', '', '', ''),
(528, 'Panel principal', '', '', '', ''),
(529, 'Panel principal', '', '', '', ''),
(530, 'Panel principal', '', '', '', ''),
(531, 'Panel principal', '', '', '', ''),
(532, 'Panel principal', '', '', '', ''),
(533, 'Panel principal', '', '', '', ''),
(534, 'Panel principal', '', '', '', ''),
(535, 'Panel principal', '', '', '', ''),
(536, 'Panel principal', '', '', '', ''),
(537, 'Panel principal', '', '', '', ''),
(538, 'Panel principal', '', '', '', ''),
(539, 'Panel principal', '', '', '', ''),
(540, 'Panel principal', '', '', '', ''),
(541, 'Panel principal', '', '', '', ''),
(542, 'Panel principal', '', '', '', ''),
(543, 'Panel principal', '', '', '', ''),
(544, 'Panel principal', '', '', '', ''),
(545, 'Panel principal', '', '', '', ''),
(546, 'Panel principal', '', '', '', ''),
(547, 'Panel principal', '', '', '', ''),
(548, 'Panel principal', '', '', '', ''),
(549, 'Panel principal', '', '', '', ''),
(550, 'Panel principal', '', '', '', ''),
(551, 'Panel principal', '', '', '', ''),
(552, 'Panel principal', '', '', '', ''),
(553, 'Panel principal', '', '', '', ''),
(554, 'Panel principal', '', '', '', ''),
(555, 'Panel principal', '', '', '', ''),
(556, 'Panel principal', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mark`
--

CREATE TABLE `mark` (
  `mark_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `mark_obtained` int(11) NOT NULL DEFAULT 0,
  `mark_total` int(11) NOT NULL DEFAULT 100,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `year` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `message`
--

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL,
  `message_thread_code` longtext NOT NULL,
  `message` longtext NOT NULL,
  `sender` longtext NOT NULL,
  `timestamp` longtext NOT NULL,
  `read_status` int(11) NOT NULL DEFAULT 0 COMMENT '0 unread 1 read'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `message_thread`
--

CREATE TABLE `message_thread` (
  `message_thread_id` int(11) NOT NULL,
  `message_thread_code` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sender` longtext COLLATE utf8_unicode_ci NOT NULL,
  `reciever` longtext COLLATE utf8_unicode_ci NOT NULL,
  `last_message_timestamp` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticeboard`
--

CREATE TABLE `noticeboard` (
  `notice_id` int(11) NOT NULL,
  `notice_title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `notice` longtext COLLATE utf8_unicode_ci NOT NULL,
  `create_timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parent`
--

CREATE TABLE `parent` (
  `parent_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `profession` longtext COLLATE utf8_unicode_ci NOT NULL,
  `authentication_key` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `parent`
--

INSERT INTO `parent` (`parent_id`, `name`, `email`, `password`, `phone`, `address`, `profession`, `authentication_key`) VALUES
(2, 'MARK ZUCKERBERG', 'mark@gmail.com', '41a0041d57b6bceca1bb2c2485344ce5bf78ee70', '77777777', 'Senkata', 'Arquitecto', ''),
(3, 'STEVE JOBS', 'steve@gmail.com', '70a3a8848b092a658537b9b0ea4e9d5fbc8c5b24', '9977555', 'Ventilla', 'Abogado', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `payment_type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `method` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `amount` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `year` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rfid_estudiante`
--

CREATE TABLE `rfid_estudiante` (
  `student_id` int(11) NOT NULL,
  `rfid_serial` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `section`
--

CREATE TABLE `section` (
  `section_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `nick_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `section`
--

INSERT INTO `section` (`section_id`, `name`, `nick_name`, `class_id`, `teacher_id`) VALUES
(2, '3 ro A', 'A', 1, 1),
(11, '3 ro A', 'A', 2, 2),
(12, '3 ro A', 'A', 3, 3),
(13, '3 ro A', 'A', 4, 4),
(14, '3 ro A', 'A', 5, 5),
(15, '3 ro A', 'A', 6, 6),
(16, '3 ro A', 'A', 7, 7),
(17, '3 ro A', 'A', 8, 8),
(18, '3 ro A', 'A', 9, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `settings_id` int(11) NOT NULL,
  `type` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`settings_id`, `type`, `description`) VALUES
(1, 'system_name', 'S.I.S.R.A.'),
(2, 'system_title', 'SISRA'),
(3, 'address', 'New York, United States'),
(4, 'phone', '+732357647647'),
(5, 'paypal_email', 'baxter@school.com'),
(6, 'currency', 'USD'),
(7, 'system_email', 'admi@admin.com'),
(20, 'active_sms_service', 'disabled'),
(11, 'language', 'spanish'),
(12, 'borders_style', 'true'),
(13, 'clickatell_user', ''),
(14, 'clickatell_password', ''),
(15, 'clickatell_api_id', ''),
(16, 'skin_colour', 'dark'),
(17, 'twilio_account_sid', ''),
(18, 'twilio_auth_token', ''),
(19, 'twilio_sender_phone_number', ''),
(21, 'running_year', '2022-2023'),
(22, 'footer_text', '© 2022 SISTEMA DE REGISTRO DE ASISTENCIA - <strong>ITBM</strong>'),
(23, 'purchase_code', ''),
(24, 'header_colour', 'header-dark'),
(25, 'sidebar_colour', 'sidebar-dark'),
(26, 'sidebar_size', 'sidebar-left-sm');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `student_code` longtext COLLATE utf8_unicode_ci NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sex` longtext COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `authentication_key` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `student`
--

INSERT INTO `student` (`student_id`, `student_code`, `name`, `sex`, `address`, `phone`, `email`, `password`, `parent_id`, `authentication_key`) VALUES
(3, '', 'IVAM HAROLD APAZA CONDORI', 'male', 'Senkata', '78787878', 'ivan@gmail.com', '4d136c8df8bbc9b4a962b36cca38da5c7c22f6ff', 2, ''),
(4, '', 'FELIPE TUCO TRIGERO', 'male', 'Ventilla', '75836666', 'felipe@gmail.com', '0234e2fb0e1bde2fb56bd4687a2ec97ffc1fd25a', 3, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subject`
--

CREATE TABLE `subject` (
  `subject_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `year` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teacher`
--

CREATE TABLE `teacher` (
  `teacher_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sex` longtext COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8_unicode_ci NOT NULL,
  `authentication_key` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `teacher`
--

INSERT INTO `teacher` (`teacher_id`, `name`, `sex`, `address`, `phone`, `email`, `password`, `authentication_key`) VALUES
(2, 'EDGAR TUCO VILLALOBOS', 'male', 'Senkata', '78787878', 'edgar@gmail.com', 'f91649e605140fcb1df80329df899961b49d8218', ''),
(3, 'GABRIEL ALEJANDRO MAMANI TITTO', 'male', 'Ventilla', '79797979', 'gabriel@gmail.com', '543bfa15b1f861037cab7f368101c5ab98aa9b77', ''),
(4, 'RICHARD JHOSEPES TACACHIRA PEREZ', 'male', 'Los Pinos', '64646464', 'richard@gmail.com', '5880194514ce16c17526bfcae48e784088997e32', ''),
(5, 'MARCO ANTONIO PULLY MENDEZ', 'male', 'San Agustin', '9977555', 'marco@gmail.com', 'c3c1348c8ea0d13702dc08d92ebdf26271b226fb', ''),
(6, 'WENDY YOMAR SARMIENTO MARTINEZ', 'female', 'Senkata', '75836666', 'wendy@gmail.com', '7f193d474872d1d0287f723bc0403b70fffc2c44', ''),
(7, 'RODRIGO SANTOS QUELALI VILLCA', 'male', 'La Gruta', '65686868', 'rodrigo@gmail.com', '1ac3cf657b0c16fc280e910c6bcbaaa39e243656', ''),
(8, 'HILDA CALLISAYA APAZA', 'female', 'La Prado', '89987766', 'hilda@gmail.com', 'db5fbafff95e2d0b6a305732cf8c663d0402bc19', ''),
(9, 'JIMMY OVIDIO SIRPA CHOQUE', 'male', 'Kenko', '65223789', 'jimmy@gmail.com', 'f04cd125c745c0463a781b21047810097f421127', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transport`
--

CREATE TABLE `transport` (
  `transport_id` int(11) NOT NULL,
  `route_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `number_of_vehicle` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `route_fare` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `academic_syllabus`
--
ALTER TABLE `academic_syllabus`
  ADD PRIMARY KEY (`academic_syllabus_id`);

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indices de la tabla `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`);

--
-- Indices de la tabla `attendance_backup`
--
ALTER TABLE `attendance_backup`
  ADD PRIMARY KEY (`attendance_id`);

--
-- Indices de la tabla `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`);

--
-- Indices de la tabla `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indices de la tabla `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`class_id`);

--
-- Indices de la tabla `class_routine`
--
ALTER TABLE `class_routine`
  ADD PRIMARY KEY (`class_routine_id`);

--
-- Indices de la tabla `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`document_id`);

--
-- Indices de la tabla `dormitory`
--
ALTER TABLE `dormitory`
  ADD PRIMARY KEY (`dormitory_id`);

--
-- Indices de la tabla `enroll`
--
ALTER TABLE `enroll`
  ADD PRIMARY KEY (`enroll_id`);

--
-- Indices de la tabla `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`exam_id`);

--
-- Indices de la tabla `expense_category`
--
ALTER TABLE `expense_category`
  ADD PRIMARY KEY (`expense_category_id`);

--
-- Indices de la tabla `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`grade_id`);

--
-- Indices de la tabla `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indices de la tabla `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`phrase_id`);

--
-- Indices de la tabla `mark`
--
ALTER TABLE `mark`
  ADD PRIMARY KEY (`mark_id`);

--
-- Indices de la tabla `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`);

--
-- Indices de la tabla `message_thread`
--
ALTER TABLE `message_thread`
  ADD PRIMARY KEY (`message_thread_id`);

--
-- Indices de la tabla `noticeboard`
--
ALTER TABLE `noticeboard`
  ADD PRIMARY KEY (`notice_id`);

--
-- Indices de la tabla `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`parent_id`);

--
-- Indices de la tabla `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indices de la tabla `rfid_estudiante`
--
ALTER TABLE `rfid_estudiante`
  ADD KEY `student_id` (`student_id`);

--
-- Indices de la tabla `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`section_id`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`settings_id`);

--
-- Indices de la tabla `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`);

--
-- Indices de la tabla `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indices de la tabla `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacher_id`);

--
-- Indices de la tabla `transport`
--
ALTER TABLE `transport`
  ADD PRIMARY KEY (`transport_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `academic_syllabus`
--
ALTER TABLE `academic_syllabus`
  MODIFY `academic_syllabus_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `attendance_backup`
--
ALTER TABLE `attendance_backup`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `book`
--
ALTER TABLE `book`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `class`
--
ALTER TABLE `class`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `class_routine`
--
ALTER TABLE `class_routine`
  MODIFY `class_routine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `document`
--
ALTER TABLE `document`
  MODIFY `document_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dormitory`
--
ALTER TABLE `dormitory`
  MODIFY `dormitory_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `enroll`
--
ALTER TABLE `enroll`
  MODIFY `enroll_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `exam`
--
ALTER TABLE `exam`
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `expense_category`
--
ALTER TABLE `expense_category`
  MODIFY `expense_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `grade`
--
ALTER TABLE `grade`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `language`
--
ALTER TABLE `language`
  MODIFY `phrase_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=557;

--
-- AUTO_INCREMENT de la tabla `mark`
--
ALTER TABLE `mark`
  MODIFY `mark_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `message_thread`
--
ALTER TABLE `message_thread`
  MODIFY `message_thread_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `noticeboard`
--
ALTER TABLE `noticeboard`
  MODIFY `notice_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `parent`
--
ALTER TABLE `parent`
  MODIFY `parent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `section`
--
ALTER TABLE `section`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `settings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `subject`
--
ALTER TABLE `subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `teacher`
--
ALTER TABLE `teacher`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `transport`
--
ALTER TABLE `transport`
  MODIFY `transport_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `rfid_estudiante`
--
ALTER TABLE `rfid_estudiante`
  ADD CONSTRAINT `rfid_estudiante_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
