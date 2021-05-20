-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2021 m. Geg 20 d. 11:54
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mrjg_admin`
--

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `classes`
--

CREATE TABLE `classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group` smallint(6) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `schoolmaster_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sukurta duomenų kopija lentelei `classes`
--

INSERT INTO `classes` (`id`, `group`, `name`, `schoolmaster_id`) VALUES
(3, 2, 'B', 3),
(4, 1, 'C', 1),
(5, 2, 'A', 2),
(32, 1, 'A', NULL),
(33, 1, 'B', NULL);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `classrooms`
--

CREATE TABLE `classrooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sukurta duomenų kopija lentelei `classrooms`
--

INSERT INTO `classrooms` (`id`, `name`, `subject_id`) VALUES
(1, '101', 2),
(2, '102', 2),
(3, '201', 3),
(5, '202', 3);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `grades`
--

CREATE TABLE `grades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `grade` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sukurta duomenų kopija lentelei `grades`
--

INSERT INTO `grades` (`id`, `student_id`, `subject_id`, `grade`) VALUES
(1, 3, 2, 3),
(2, 4, 1, 5);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sukurta duomenų kopija lentelei `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_04_14_041550_people', 1),
(2, '2021_04_14_043251_teachers', 1),
(3, '2021_04_14_043303_students', 1),
(4, '2021_04_14_043419_parents', 1),
(5, '2021_04_16_043050_classes', 1),
(6, '2021_05_08_071911_classrooms', 1),
(7, '2021_05_08_072332_grades', 1),
(8, '2021_05_08_073050_timetable', 1),
(9, '2021_05_08_073544_streams', 1),
(10, '2021_05_08_074559_relations1', 1),
(11, '2021_05_08_094544_subjects', 1),
(12, '2021_05_08_094825_student_choices', 1),
(13, '2021_05_08_095124_teacher_classroom_relations', 1),
(14, '2021_05_08_122137_student_class_appointments', 1),
(15, '2021_05_10_054342_student_parent_relations', 1),
(16, '2021_05_10_054643_relations2', 1);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `parents`
--

CREATE TABLE `parents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `person_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `people`
--

CREATE TABLE `people` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sukurta duomenų kopija lentelei `people`
--

INSERT INTO `people` (`id`, `name`, `lastname`, `email`, `phone`) VALUES
(1, 'Vytenis', 'Testas1', NULL, NULL),
(2, 'Vytenis', 'Testas2', NULL, NULL),
(3, 'Vytenis', 'Testas3', NULL, NULL),
(7, 'Vytenis', 'Giedraitis3', NULL, NULL),
(8, 'Vytenis', 'Giedraitis4', NULL, NULL),
(12, 'Vytenis', 'Giedraitis8', NULL, NULL);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `streams`
--

CREATE TABLE `streams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sukurta duomenų kopija lentelei `streams`
--

INSERT INTO `streams` (`id`, `student_id`) VALUES
(1, NULL),
(2, NULL);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `person_id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED DEFAULT NULL,
  `prev_school` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sukurta duomenų kopija lentelei `students`
--

INSERT INTO `students` (`id`, `person_id`, `class_id`, `prev_school`) VALUES
(3, 7, 3, NULL),
(4, 8, 3, NULL),
(8, 12, 3, NULL);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `student_choices`
--

CREATE TABLE `student_choices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `student_class_appointments`
--

CREATE TABLE `student_class_appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `student_parent_relations`
--

CREATE TABLE `student_parent_relations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sukurta duomenų kopija lentelei `subjects`
--

INSERT INTO `subjects` (`id`, `name`) VALUES
(1, 'Anglų kalba'),
(2, 'Lietuvių kalba'),
(3, 'Matematika');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `person_id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sukurta duomenų kopija lentelei `teachers`
--

INSERT INTO `teachers` (`id`, `person_id`, `subject_id`) VALUES
(1, 1, 2),
(2, 2, 3),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `teacher_classroom_relations`
--

CREATE TABLE `teacher_classroom_relations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `classroom_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Sukurta duomenų kopija lentelei `teacher_classroom_relations`
--

INSERT INTO `teacher_classroom_relations` (`id`, `teacher_id`, `classroom_id`) VALUES
(1, 1, 2),
(2, 2, 3),
(5, 3, 5),
(6, 3, 5);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `timetable`
--

CREATE TABLE `timetable` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `weekday` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `classroom_id` bigint(20) UNSIGNED NOT NULL,
  `lesson` smallint(6) NOT NULL,
  `class_id` bigint(20) UNSIGNED DEFAULT NULL,
  `stream_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classes_schoolmaster_id_foreign` (`schoolmaster_id`);

--
-- Indexes for table `classrooms`
--
ALTER TABLE `classrooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classrooms_subject_id_foreign` (`subject_id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grades_student_id_foreign` (`student_id`),
  ADD KEY `grades_subject_id_foreign` (`subject_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parents_person_id_foreign` (`person_id`);

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `streams`
--
ALTER TABLE `streams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `streams_student_id_foreign` (`student_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_person_id_foreign` (`person_id`),
  ADD KEY `students_class_id_foreign` (`class_id`);

--
-- Indexes for table `student_choices`
--
ALTER TABLE `student_choices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_choices_student_id_foreign` (`student_id`),
  ADD KEY `student_choices_subject_id_foreign` (`subject_id`);

--
-- Indexes for table `student_class_appointments`
--
ALTER TABLE `student_class_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_class_appointments_student_id_foreign` (`student_id`);

--
-- Indexes for table `student_parent_relations`
--
ALTER TABLE `student_parent_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_parent_relations_student_id_foreign` (`student_id`),
  ADD KEY `student_parent_relations_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teachers_person_id_foreign` (`person_id`),
  ADD KEY `teachers_subject_id_foreign` (`subject_id`);

--
-- Indexes for table `teacher_classroom_relations`
--
ALTER TABLE `teacher_classroom_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_classroom_relations_teacher_id_foreign` (`teacher_id`),
  ADD KEY `teacher_classroom_relations_classroom_id_foreign` (`classroom_id`);

--
-- Indexes for table `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timetable_teacher_id_foreign` (`teacher_id`),
  ADD KEY `timetable_classroom_id_foreign` (`classroom_id`),
  ADD KEY `timetable_class_id_foreign` (`class_id`),
  ADD KEY `timetable_stream_id_foreign` (`stream_id`),
  ADD KEY `timetable_subject_id_foreign` (`subject_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `classrooms`
--
ALTER TABLE `classrooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `parents`
--
ALTER TABLE `parents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `streams`
--
ALTER TABLE `streams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `student_choices`
--
ALTER TABLE `student_choices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_class_appointments`
--
ALTER TABLE `student_class_appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_parent_relations`
--
ALTER TABLE `student_parent_relations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `teacher_classroom_relations`
--
ALTER TABLE `teacher_classroom_relations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `timetable`
--
ALTER TABLE `timetable`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Apribojimai eksportuotom lentelėm
--

--
-- Apribojimai lentelei `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_schoolmaster_id_foreign` FOREIGN KEY (`schoolmaster_id`) REFERENCES `teachers` (`id`);

--
-- Apribojimai lentelei `classrooms`
--
ALTER TABLE `classrooms`
  ADD CONSTRAINT `classrooms_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);

--
-- Apribojimai lentelei `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `grades_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);

--
-- Apribojimai lentelei `parents`
--
ALTER TABLE `parents`
  ADD CONSTRAINT `parents_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`);

--
-- Apribojimai lentelei `streams`
--
ALTER TABLE `streams`
  ADD CONSTRAINT `streams_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Apribojimai lentelei `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `students_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`);

--
-- Apribojimai lentelei `student_choices`
--
ALTER TABLE `student_choices`
  ADD CONSTRAINT `student_choices_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `student_choices_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);

--
-- Apribojimai lentelei `student_class_appointments`
--
ALTER TABLE `student_class_appointments`
  ADD CONSTRAINT `student_class_appointments_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Apribojimai lentelei `student_parent_relations`
--
ALTER TABLE `student_parent_relations`
  ADD CONSTRAINT `student_parent_relations_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `parents` (`id`),
  ADD CONSTRAINT `student_parent_relations_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Apribojimai lentelei `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`),
  ADD CONSTRAINT `teachers_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);

--
-- Apribojimai lentelei `teacher_classroom_relations`
--
ALTER TABLE `teacher_classroom_relations`
  ADD CONSTRAINT `teacher_classroom_relations_classroom_id_foreign` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`id`),
  ADD CONSTRAINT `teacher_classroom_relations_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

--
-- Apribojimai lentelei `timetable`
--
ALTER TABLE `timetable`
  ADD CONSTRAINT `timetable_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `timetable_classroom_id_foreign` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`id`),
  ADD CONSTRAINT `timetable_stream_id_foreign` FOREIGN KEY (`stream_id`) REFERENCES `streams` (`id`),
  ADD CONSTRAINT `timetable_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `timetable_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
