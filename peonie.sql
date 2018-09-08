-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2016 at 08:38 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `peonie`
--

-- --------------------------------------------------------

--
-- Table structure for table `decoration`
--

CREATE TABLE IF NOT EXISTS `decoration` (
  `dec_id` int(11) NOT NULL AUTO_INCREMENT,
  `dec_name` varchar(100) NOT NULL,
  `dec_description` text NOT NULL,
  `dec_image` varchar(100) NOT NULL,
  PRIMARY KEY (`dec_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `decoration`
--

INSERT INTO `decoration` (`dec_id`, `dec_name`, `dec_description`, `dec_image`) VALUES
(1, 'Celebration Balloons', 'These celebratory statement balloons add just the right amount of party and fun to your special event.', '129659-500.jpg'),
(2, 'Pinwheel Decorations', 'These paper pinwheel decorations are sure to make the perfect playful statement at your wedding.', '127224-500.jpg'),
(3, 'Star Lanterns', 'With a variety of color options, its a fun and easy way to add style and lighting to your event.', '129766-500.jpg'),
(5, 'Bride & Groom Glitter Chair Signs', 'Feel all the more special on wedding day with these glistening gold glitter bride and groom chair signs.', '141309-500.jpg'),
(6, 'Blossom String Lights', 'Light up your wedding in the prettiest of ways, with these blossom string lights.', '144506-500.jpg'),
(7, 'Kokeshi Cake Toppers', 'For the cutest in wedding cake fashion, nothing beats this Kokeshi cake topper.', '106405-500.jpg'),
(8, 'Glass Vase Centerpiece', 'Let love blossom with these personalized square glass vases.', '241-500.jpg'),
(9, 'Henna Jewel Lantern', 'These henna jewel lanterns are sure to stun at your wedding.', '128661-500.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `emp_id` varchar(20) NOT NULL,
  `emp_email` varchar(100) NOT NULL,
  `emp_name` varchar(100) NOT NULL,
  `emp_dob` date NOT NULL,
  `emp_gender` varchar(10) NOT NULL,
  `emp_password` varchar(100) NOT NULL,
  `emp_photo` varchar(100) NOT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `emp_email`, `emp_name`, `emp_dob`, `emp_gender`, `emp_password`, `emp_photo`) VALUES
('albertxto', 'albert@binus.org', 'Albert Prawono', '1995-09-17', 'Male', 'admin', 'albert.jpg'),
('hyuuga', 'hinata@konoha.co.jp', 'Hinata Hyuuga', '1995-12-27', 'Female', 'hinata', 'Hinata_Part_II.png');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_groom` varchar(100) NOT NULL,
  `event_bride` varchar(100) NOT NULL,
  `event_hall` varchar(100) NOT NULL,
  `event_date` date NOT NULL,
  `event_dec1` varchar(100) DEFAULT NULL,
  `event_dec2` varchar(100) DEFAULT NULL,
  `event_dec3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_id`, `event_groom`, `event_bride`, `event_hall`, `event_date`, `event_dec1`, `event_dec2`, `event_dec3`) VALUES
(1, 'Chris Evan', 'Scarlett Johansson', 'Thamrin Nine Ballroom', '2016-06-09', 'Blossom String Lights', 'Pinwheel Decorations', 'Star Lanterns'),
(2, 'Robert Downey Jr.', 'Elizabeth Olsen', 'Hotel Mulia', '2016-12-31', 'Bride & Groom Glitter Chair Signs', 'Glass Vase Centerpiece', 'Henna Jewel Lantern');

-- --------------------------------------------------------

--
-- Table structure for table `hall`
--

CREATE TABLE IF NOT EXISTS `hall` (
  `hall_id` int(11) NOT NULL AUTO_INCREMENT,
  `hall_name` varchar(100) NOT NULL,
  `hall_description` text NOT NULL,
  `hall_image` varchar(100) NOT NULL,
  PRIMARY KEY (`hall_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `hall`
--

INSERT INTO `hall` (`hall_id`, `hall_name`, `hall_description`, `hall_image`) VALUES
(1, 'Thamrin Nine Ballroom', 'Lighting is one of the most important part in decoration. It is double edged sword, it can make your decoration more beautiful or the opposite.', 'Lightworks-Lili-Vicky-1.jpg'),
(2, 'Senayan City Mall', 'There are 3 installation in the exhibition, which is starlite lamp, LED lamp, and spot lamp. Starlite lamp represent no matter how small one idea, it can be a masterpiece.', 'Lightworks-Rinaldy-2.jpg'),
(3, 'Raffles Jakarta', 'Big and gorgeous garden for Jason and Vinas wedding reception at Raffles Jakarta with Lotus Design as decorator and Lightworks as lighting designer.', 'Lightworks-Lotus-Raffles-3.jpg'),
(4, 'Puri Begawan', 'Dion and Evelyns wedding decoration for their big day, created by Grasida Decoration with Lightworks as lighting designer at Puri Begawan.', 'Lightworks-Grasida-Puri-Begawan-8.jpg'),
(5, 'Hotel Mulia', 'Lighting and decoration for wedding day always special and unique. It will depend on the couple, what story they want to share to all the guest.', 'Lightworks-Grasida-Hotel-Mulia-4.jpg'),
(6, 'Shangri-La Hotel', 'Something blue for your wedding stands for love and purity. Thats why we love Hansen and Lidyas colour theme for their wedding decoration, which is blue.', 'Lightworks-Grasida-Shangrila-4.jpg'),
(7, 'Santika Premiere', 'The theme for the wedding was closely related to the classic American countryside farmhouse filled with wooden barrels and a wagon.', 'Lightworks-Stephanus-Friends-and-Friends-2.jpg'),
(8, 'Mandarin Oriental', 'Lotus Design as decorator with Lightworks as the lighting designer and we tried to make their dreams come true through a beautiful and warm ambiance.', 'Lightworks-Lotus-Mandarin-1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_name` varchar(100) NOT NULL,
  `member_dob` date NOT NULL,
  `member_gender` varchar(10) NOT NULL,
  `member_status` varchar(10) NOT NULL,
  `member_photo` varchar(100) NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`member_id`, `member_name`, `member_dob`, `member_gender`, `member_status`, `member_photo`) VALUES
(1, 'Chris Evana', '1981-06-13', 'Male', 'Married', 'Chris_Evans_SDCC_2014.jpg'),
(2, 'Scarlett Johansson', '1984-11-22', 'Female', 'Married', 'Goldene_Kamera_2012_-_Scarlett_Johansson_3_(cropped).JPG'),
(3, 'Robert Downey Jr.', '1965-04-04', 'Male', 'Married', 'Robert_Downey_Jr_2014_Comic_Con_(cropped).jpg'),
(4, 'Elizabeth Olsen', '1989-02-16', 'Female', 'Married', 'Elizabeth_Olsen_SDCC_2014_2_(cropped).jpg');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
