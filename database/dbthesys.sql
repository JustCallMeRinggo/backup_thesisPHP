-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2017 at 05:56 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbthesys`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id_book` int(11) NOT NULL,
  `book_title` varchar(60) NOT NULL,
  `author` varchar(60) NOT NULL,
  `publisher` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id_book`, `book_title`, `author`, `publisher`) VALUES
(9, 'Meraih Mimpi', 'Mau tau aja', 'Eaaaaa'),
(10, 'Hmm', 'Beneran mau tau?', '????'),
(11, 'Langit bukan biru', 'Masa sih?', 'Tanya kenapa');

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblcitation_format`
--

CREATE TABLE `tblcitation_format` (
  `id` int(11) NOT NULL,
  `format` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblcolleges`
--

CREATE TABLE `tblcolleges` (
  `college_id` char(3) NOT NULL,
  `college_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbldepartment`
--

CREATE TABLE `tbldepartment` (
  `DEPARTMENT_ID` int(11) NOT NULL,
  `COLLEGE_ID` char(4) NOT NULL,
  `DEPARTMENT_NAME` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblevaluators`
--

CREATE TABLE `tblevaluators` (
  `evaluator_id` varchar(8) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `middle_initial` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblpasswords`
--

CREATE TABLE `tblpasswords` (
  `id` int(11) NOT NULL,
  `user_id` varchar(8) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpasswords`
--

INSERT INTO `tblpasswords` (`id`, `user_id`, `password`) VALUES
(1, 'K5140047', 'bonifacio'),
(2, 'K5140030', 'ernalyn'),
(3, 'K1120945', 'mark'),
(4, 'V0000000', 'nilda');

-- --------------------------------------------------------

--
-- Table structure for table `tblproponents`
--

CREATE TABLE `tblproponents` (
  `id` int(11) NOT NULL,
  `thesis_id` varchar(8) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `middle_initial` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblrequest`
--

CREATE TABLE `tblrequest` (
  `REQUEST_ID` varchar(8) NOT NULL,
  `USER_ID` varchar(8) NOT NULL,
  `DATE_REQUESTED` date NOT NULL,
  `UPLOAD_CODE` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbltags`
--

CREATE TABLE `tbltags` (
  `id` int(11) NOT NULL,
  `tag_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblthesis`
--

CREATE TABLE `tblthesis` (
  `thesis_id` varchar(8) NOT NULL,
  `thesis_title` varchar(100) NOT NULL,
  `year_accomplished` int(4) NOT NULL,
  `file` varchar(200) NOT NULL,
  `file_type` varchar(8) NOT NULL,
  `status` varchar(10) NOT NULL,
  `request_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblthesis`
--

INSERT INTO `tblthesis` (`thesis_id`, `thesis_title`, `year_accomplished`, `file`, `file_type`, `status`, `request_id`) VALUES
('CCS123', 'This is only a sample', 2003, '', 'ORIGINAL', 'Archived', NULL),
('CCS187', 'UMak Parking Manager', 0, '', '', 'Archived', NULL),
('CCS188', 'UMak Parkcard', 0, '', '', 'Archived', NULL),
('CCS244', 'ROLA', 2010, '', 'ORIGINAL', 'Archived', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblthesis_abstract`
--

CREATE TABLE `tblthesis_abstract` (
  `id` int(11) NOT NULL,
  `thesis_id` varchar(8) NOT NULL,
  `image` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblthesis_category`
--

CREATE TABLE `tblthesis_category` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `thesis_id` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblthesis_citation`
--

CREATE TABLE `tblthesis_citation` (
  `id` int(11) NOT NULL,
  `thesis_id` varchar(8) NOT NULL,
  `date_and_time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblthesis_evaluators`
--

CREATE TABLE `tblthesis_evaluators` (
  `id` int(11) NOT NULL,
  `evaluator_id` varchar(8) NOT NULL,
  `thesis_id` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblthesis_tags`
--

CREATE TABLE `tblthesis_tags` (
  `id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `thesis_id` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblthesis_views`
--

CREATE TABLE `tblthesis_views` (
  `id` int(11) NOT NULL,
  `user_id` varchar(8) NOT NULL,
  `thesis_id` varchar(8) NOT NULL,
  `date_and_time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `user_id` varchar(8) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `middle_initial` char(3) DEFAULT NULL,
  `exp_date` date NOT NULL,
  `user_type` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`user_id`, `last_name`, `first_name`, `middle_initial`, `exp_date`, `user_type`) VALUES
('K1120945', 'CABUSORA', 'MARK JOSEPH', 'L', '0000-00-00', 'STUDENT'),
('K5140030', 'CASTILLO', 'ERNALYN', 'S', '0000-00-00', 'FACULTY'),
('K5140047', 'PILAPIL', 'JORIOUZ', 'C', '0000-00-00', 'ADMIN'),
('V0000000', 'DIZON', 'NILDA', 'UY', '0000-00-00', 'VISITOR');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id_book`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `tblcitation_format`
--
ALTER TABLE `tblcitation_format`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `tblcolleges`
--
ALTER TABLE `tblcolleges`
  ADD PRIMARY KEY (`college_id`),
  ADD KEY `college_id` (`college_id`);

--
-- Indexes for table `tbldepartment`
--
ALTER TABLE `tbldepartment`
  ADD PRIMARY KEY (`DEPARTMENT_ID`),
  ADD KEY `COLLEGE_ID` (`COLLEGE_ID`),
  ADD KEY `DEPARTMENT_ID` (`DEPARTMENT_ID`);

--
-- Indexes for table `tblevaluators`
--
ALTER TABLE `tblevaluators`
  ADD PRIMARY KEY (`evaluator_id`);

--
-- Indexes for table `tblpasswords`
--
ALTER TABLE `tblpasswords`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tblproponents`
--
ALTER TABLE `tblproponents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thesis_id` (`thesis_id`);

--
-- Indexes for table `tblrequest`
--
ALTER TABLE `tblrequest`
  ADD PRIMARY KEY (`REQUEST_ID`),
  ADD KEY `REQUEST_ID` (`REQUEST_ID`),
  ADD KEY `USER_ID` (`USER_ID`);

--
-- Indexes for table `tbltags`
--
ALTER TABLE `tbltags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `tblthesis`
--
ALTER TABLE `tblthesis`
  ADD PRIMARY KEY (`thesis_id`);

--
-- Indexes for table `tblthesis_abstract`
--
ALTER TABLE `tblthesis_abstract`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thesis_id` (`thesis_id`);

--
-- Indexes for table `tblthesis_category`
--
ALTER TABLE `tblthesis_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `thesis_id` (`thesis_id`);

--
-- Indexes for table `tblthesis_citation`
--
ALTER TABLE `tblthesis_citation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `thesis_id` (`thesis_id`);

--
-- Indexes for table `tblthesis_evaluators`
--
ALTER TABLE `tblthesis_evaluators`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `evaluator_id` (`evaluator_id`),
  ADD KEY `thesis_id` (`thesis_id`);

--
-- Indexes for table `tblthesis_tags`
--
ALTER TABLE `tblthesis_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `tag_id` (`tag_id`),
  ADD KEY `thesis_id` (`thesis_id`);

--
-- Indexes for table `tblthesis_views`
--
ALTER TABLE `tblthesis_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `thesis_id` (`thesis_id`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id_book` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblcitation_format`
--
ALTER TABLE `tblcitation_format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbldepartment`
--
ALTER TABLE `tbldepartment`
  MODIFY `DEPARTMENT_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblpasswords`
--
ALTER TABLE `tblpasswords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tblthesis_abstract`
--
ALTER TABLE `tblthesis_abstract`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblthesis_category`
--
ALTER TABLE `tblthesis_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblthesis_evaluators`
--
ALTER TABLE `tblthesis_evaluators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbldepartment`
--
ALTER TABLE `tbldepartment`
  ADD CONSTRAINT `tbldepartment_ibfk_1` FOREIGN KEY (`COLLEGE_ID`) REFERENCES `tblcolleges` (`college_id`);

--
-- Constraints for table `tblpasswords`
--
ALTER TABLE `tblpasswords`
  ADD CONSTRAINT `tblpasswords_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tblusers` (`user_id`);

--
-- Constraints for table `tblproponents`
--
ALTER TABLE `tblproponents`
  ADD CONSTRAINT `tblproponents_ibfk_1` FOREIGN KEY (`thesis_id`) REFERENCES `tblthesis` (`thesis_id`);

--
-- Constraints for table `tblrequest`
--
ALTER TABLE `tblrequest`
  ADD CONSTRAINT `tblrequest_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `tblusers` (`user_id`);

--
-- Constraints for table `tblthesis_abstract`
--
ALTER TABLE `tblthesis_abstract`
  ADD CONSTRAINT `tblthesis_abstract_ibfk_1` FOREIGN KEY (`thesis_id`) REFERENCES `tblthesis` (`thesis_id`);

--
-- Constraints for table `tblthesis_category`
--
ALTER TABLE `tblthesis_category`
  ADD CONSTRAINT `tblthesis_category_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `tblcategory` (`id`),
  ADD CONSTRAINT `tblthesis_category_ibfk_2` FOREIGN KEY (`thesis_id`) REFERENCES `tblthesis` (`thesis_id`);

--
-- Constraints for table `tblthesis_citation`
--
ALTER TABLE `tblthesis_citation`
  ADD CONSTRAINT `tblthesis_citation_ibfk_1` FOREIGN KEY (`thesis_id`) REFERENCES `tblthesis` (`thesis_id`);

--
-- Constraints for table `tblthesis_evaluators`
--
ALTER TABLE `tblthesis_evaluators`
  ADD CONSTRAINT `tblthesis_evaluators_ibfk_1` FOREIGN KEY (`thesis_id`) REFERENCES `tblthesis` (`thesis_id`),
  ADD CONSTRAINT `tblthesis_evaluators_ibfk_2` FOREIGN KEY (`evaluator_id`) REFERENCES `tblevaluators` (`evaluator_id`);

--
-- Constraints for table `tblthesis_tags`
--
ALTER TABLE `tblthesis_tags`
  ADD CONSTRAINT `tblthesis_tags_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tbltags` (`id`),
  ADD CONSTRAINT `tblthesis_tags_ibfk_2` FOREIGN KEY (`thesis_id`) REFERENCES `tblthesis` (`thesis_id`);

--
-- Constraints for table `tblthesis_views`
--
ALTER TABLE `tblthesis_views`
  ADD CONSTRAINT `tblthesis_views_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tblusers` (`user_id`),
  ADD CONSTRAINT `tblthesis_views_ibfk_2` FOREIGN KEY (`thesis_id`) REFERENCES `tblthesis` (`thesis_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
