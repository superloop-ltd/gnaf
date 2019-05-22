-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 02, 2017 at 10:02 AM
-- Server version: 5.5.52-MariaDB
-- PHP Version: 5.6.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `GNAF_201608`
--

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `ADDRESS_ALIAS`;
DROP TABLE IF EXISTS `ADDRESS_ALIAS_TYPE_AUT`;
DROP TABLE IF EXISTS `ADDRESS_CHANGE_TYPE_AUT`;
DROP TABLE IF EXISTS `ADDRESS_DEFAULT_GEOCODE`;
DROP TABLE IF EXISTS `ADDRESS_DETAIL`;
DROP TABLE IF EXISTS `ADDRESS_FEATURE`;
DROP TABLE IF EXISTS `ADDRESS_MESH_BLOCK_2011`;
DROP TABLE IF EXISTS `ADDRESS_MESH_BLOCK_2016`;
DROP TABLE IF EXISTS `ADDRESS_SEARCH`;
DROP TABLE IF EXISTS `ADDRESS_SITE`;
DROP TABLE IF EXISTS `ADDRESS_SITE_GEOCODE`;
DROP TABLE IF EXISTS `ADDRESS_TYPE_AUT`;
DROP TABLE IF EXISTS `FLAT_TYPE_AUT`;
DROP TABLE IF EXISTS `GEOCODED_LEVEL_TYPE_AUT`;
DROP TABLE IF EXISTS `GEOCODE_RELIABILITY_AUT`;
DROP TABLE IF EXISTS `GEOCODE_TYPE_AUT`;
DROP TABLE IF EXISTS `LEVEL_TYPE_AUT`;
DROP TABLE IF EXISTS `LOCALITY`;
DROP TABLE IF EXISTS `LOCALITY_ALIAS`;
DROP TABLE IF EXISTS `LOCALITY_ALIAS_TYPE_AUT`;
DROP TABLE IF EXISTS `LOCALITY_CLASS_AUT`;
DROP TABLE IF EXISTS `LOCALITY_NEIGHBOUR`;
DROP TABLE IF EXISTS `LOCALITY_POINT`;
DROP TABLE IF EXISTS `MB_2011`;
DROP TABLE IF EXISTS `MB_2016`;
DROP TABLE IF EXISTS `MB_MATCH_CODE_AUT`;
DROP TABLE IF EXISTS `PRIMARY_SECONDARY`;
DROP TABLE IF EXISTS `PS_JOIN_TYPE_AUT`;
DROP TABLE IF EXISTS `STATE`;
DROP TABLE IF EXISTS `STREET_CLASS_AUT`;
DROP TABLE IF EXISTS `STREET_LOCALITY`;
DROP TABLE IF EXISTS `STREET_LOCALITY_ALIAS`;
DROP TABLE IF EXISTS `STREET_LOCALITY_ALIAS_TYPE_AUT`;
DROP TABLE IF EXISTS `STREET_LOCALITY_POINT`;
DROP TABLE IF EXISTS `STREET_SUFFIX_AUT`;
DROP TABLE IF EXISTS `STREET_TYPE_AUT`;
SET FOREIGN_KEY_CHECKS = 1;

-- --------------------------------------------------------

--
-- Table structure for table `ADDRESS_ALIAS`
--

CREATE TABLE `ADDRESS_ALIAS` (
  `address_alias_pid` varchar(15) NOT NULL,
  `date_created` date NOT NULL,
  `date_retired` date DEFAULT NULL,
  `principal_pid` varchar(15) NOT NULL,
  `alias_pid` varchar(15) NOT NULL,
  `alias_type_code` varchar(10) NOT NULL,
  `alias_comment` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ADDRESS_ALIAS_TYPE_AUT`
--

CREATE TABLE `ADDRESS_ALIAS_TYPE_AUT` (
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ADDRESS_CHANGE_TYPE_AUT`
--
CREATE TABLE `ADDRESS_CHANGE_TYPE_AUT` (
  `code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ADDRESS_DEFAULT_GEOCODE`
--

CREATE TABLE `ADDRESS_DEFAULT_GEOCODE` (
  `address_default_geocode_pid` varchar(15) NOT NULL,
  `date_created` date NOT NULL,
  `date_retired` date DEFAULT NULL,
  `address_detail_pid` varchar(15) NOT NULL,
  `geocode_type_code` varchar(4) NOT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ADDRESS_DETAIL`
--

CREATE TABLE `ADDRESS_DETAIL` (
  `address_detail_pid` varchar(15) NOT NULL,
  `date_created` date NOT NULL,
  `date_last_modified` date DEFAULT NULL,
  `date_retired` date DEFAULT NULL,
  `building_name` varchar(45) DEFAULT NULL,
  `lot_number_prefix` varchar(2) DEFAULT NULL,
  `lot_number` varchar(5) DEFAULT NULL,
  `lot_number_suffix` varchar(2) DEFAULT NULL,
  `flat_type_code` varchar(7) DEFAULT NULL,
  `flat_number_prefix` varchar(2) DEFAULT NULL,
  `flat_number` decimal(5,0) DEFAULT NULL,
  `flat_number_suffix` varchar(2) DEFAULT NULL,
  `level_type_code` varchar(4) DEFAULT NULL,
  `level_number_prefix` varchar(2) DEFAULT NULL,
  `level_number` decimal(3,0) DEFAULT NULL,
  `level_number_suffix` varchar(2) DEFAULT NULL,
  `number_first_prefix` varchar(3) DEFAULT NULL,
  `number_first` decimal(6,0) DEFAULT NULL,
  `number_first_suffix` varchar(2) DEFAULT NULL,
  `number_last_prefix` varchar(3) DEFAULT NULL,
  `number_last` decimal(6,0) DEFAULT NULL,
  `number_last_suffix` varchar(2) DEFAULT NULL,
  `street_locality_pid` varchar(15) DEFAULT NULL,
  `location_description` varchar(45) DEFAULT NULL,
  `locality_pid` varchar(15) NOT NULL,
  `alias_principal` char(1) DEFAULT NULL,
  `postcode` varchar(4) DEFAULT NULL,
  `private_street` varchar(75) DEFAULT NULL,
  `legal_parcel_id` varchar(20) DEFAULT NULL,
  `confidence` decimal(1,0) DEFAULT NULL,
  `address_site_pid` varchar(15) NOT NULL,
  `level_geocoded_code` decimal(2,0) NOT NULL,
  `property_pid` varchar(15) DEFAULT NULL,
  `gnaf_property_pid` varchar(15) DEFAULT NULL,
  `primary_secondary` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ADDRESS_FEATURE`
--

CREATE TABLE `ADDRESS_FEATURE` (
  `address_feature_id` varchar(16) NOT NULL,
  `address_feature_pid` varchar(16) NOT NULL,
  `address_detail_pid` varchar(15) NOT NULL,
  `date_address_detail_created` date NOT NULL,
  `date_address_detail_retired` date,
  `address_change_type_code` varchar(50)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ADDRESS_MESH_BLOCK_2011`
--

CREATE TABLE `ADDRESS_MESH_BLOCK_2011` (
  `address_mesh_block_2011_pid` varchar(15) NOT NULL,
  `date_created` date NOT NULL,
  `date_retired` date DEFAULT NULL,
  `address_detail_pid` varchar(15) NOT NULL,
  `mb_match_code` varchar(15) NOT NULL,
  `mb_2011_pid` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ADDRESS_MESH_BLOCK_2016`
--

CREATE TABLE `ADDRESS_MESH_BLOCK_2016` (
  `address_mesh_block_2016_pid` varchar(15) NOT NULL,
  `date_created` date NOT NULL,
  `date_retired` date DEFAULT NULL,
  `address_detail_pid` varchar(15) NOT NULL,
  `mb_match_code` varchar(15) NOT NULL,
  `mb_2016_pid` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ADDRESS_SEARCH`
--
CREATE TABLE IF NOT EXISTS `ADDRESS_SEARCH` (
  `address_detail_pid` varchar(15) NOT NULL,
  `address_search` varchar(200) NOT NULL,
  `street_locality_pid` varchar(15) DEFAULT NULL,
  `locality_pid` varchar(15) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ADDRESS_SITE`
--

CREATE TABLE `ADDRESS_SITE` (
  `address_site_pid` varchar(15) NOT NULL,
  `date_created` date NOT NULL,
  `date_retired` date DEFAULT NULL,
  `address_type` varchar(8) DEFAULT NULL,
  `address_site_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ADDRESS_SITE_GEOCODE`
--

CREATE TABLE `ADDRESS_SITE_GEOCODE` (
  `address_site_geocode_pid` varchar(15) NOT NULL,
  `date_created` date NOT NULL,
  `date_retired` date DEFAULT NULL,
  `address_site_pid` varchar(15) DEFAULT NULL,
  `geocode_site_name` varchar(46) DEFAULT NULL,
  `geocode_site_description` varchar(45) DEFAULT NULL,
  `geocode_type_code` varchar(4) DEFAULT NULL,
  `reliability_code` decimal(1,0) NOT NULL,
  `boundary_extent` decimal(7,0) DEFAULT NULL,
  `planimetric_accuracy` decimal(12,0) DEFAULT NULL,
  `elevation` decimal(7,0) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ADDRESS_TYPE_AUT`
--

CREATE TABLE `ADDRESS_TYPE_AUT` (
  `code` varchar(8) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `FLAT_TYPE_AUT`
--

CREATE TABLE `FLAT_TYPE_AUT` (
  `code` varchar(7) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `GEOCODED_LEVEL_TYPE_AUT`
--

CREATE TABLE `GEOCODED_LEVEL_TYPE_AUT` (
  `code` decimal(2,0) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `GEOCODE_RELIABILITY_AUT`
--

CREATE TABLE `GEOCODE_RELIABILITY_AUT` (
  `code` decimal(1,0) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `GEOCODE_TYPE_AUT`
--

CREATE TABLE `GEOCODE_TYPE_AUT` (
  `code` varchar(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `LEVEL_TYPE_AUT`
--

CREATE TABLE `LEVEL_TYPE_AUT` (
  `code` varchar(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `LOCALITY`
--

CREATE TABLE `LOCALITY` (
  `locality_pid` varchar(15) NOT NULL,
  `date_created` date NOT NULL,
  `date_retired` date DEFAULT NULL,
  `locality_name` varchar(100) NOT NULL,
  `primary_postcode` varchar(4) DEFAULT NULL,
  `locality_class_code` char(1) NOT NULL,
  `state_pid` tinyint(4) UNSIGNED NOT NULL,
  `gnaf_locality_pid` varchar(15) DEFAULT NULL,
  `gnaf_reliability_code` decimal(1,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `LOCALITY_ALIAS`
--

CREATE TABLE `LOCALITY_ALIAS` (
  `locality_alias_pid` varchar(15) NOT NULL,
  `date_created` date NOT NULL,
  `date_retired` date DEFAULT NULL,
  `locality_pid` varchar(15) NOT NULL,
  `name` varchar(100) NOT NULL,
  `postcode` varchar(4) DEFAULT NULL,
  `alias_type_code` varchar(10) NOT NULL,
  `state_pid` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `LOCALITY_ALIAS_TYPE_AUT`
--

CREATE TABLE `LOCALITY_ALIAS_TYPE_AUT` (
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `LOCALITY_CLASS_AUT`
--

CREATE TABLE `LOCALITY_CLASS_AUT` (
  `code` char(1) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `LOCALITY_NEIGHBOUR`
--

CREATE TABLE `LOCALITY_NEIGHBOUR` (
  `locality_neighbour_pid` varchar(15) NOT NULL,
  `date_created` date NOT NULL,
  `date_retired` date DEFAULT NULL,
  `locality_pid` varchar(15) NOT NULL,
  `neighbour_locality_pid` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `LOCALITY_POINT`
--

CREATE TABLE `LOCALITY_POINT` (
  `locality_point_pid` varchar(15) NOT NULL,
  `date_created` date NOT NULL,
  `date_retired` date DEFAULT NULL,
  `locality_pid` varchar(15) NOT NULL,
  `planimetric_accuracy` decimal(12,0) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `MB_2011`
--

CREATE TABLE `MB_2011` (
  `mb_2011_pid` varchar(15) NOT NULL,
  `date_created` date NOT NULL,
  `date_retired` date DEFAULT NULL,
  `mb_2011_code` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `MB_2016`
--

CREATE TABLE `MB_2016` (
  `mb_2016_pid` varchar(15) NOT NULL,
  `date_created` date NOT NULL,
  `date_retired` date DEFAULT NULL,
  `mb_2016_code` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `MB_MATCH_CODE_AUT`
--

CREATE TABLE `MB_MATCH_CODE_AUT` (
  `code` varchar(15) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PRIMARY_SECONDARY`
--

CREATE TABLE `PRIMARY_SECONDARY` (
  `primary_secondary_pid` varchar(15) NOT NULL,
  `primary_pid` varchar(15) NOT NULL,
  `secondary_pid` varchar(15) NOT NULL,
  `date_created` date NOT NULL,
  `date_retired` date DEFAULT NULL,
  `ps_join_type_code` decimal(2,0) NOT NULL,
  `ps_join_comment` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PS_JOIN_TYPE_AUT`
--

CREATE TABLE `PS_JOIN_TYPE_AUT` (
  `code` decimal(2,0) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `STATE`
--

CREATE TABLE `STATE` (
  `state_pid` tinyint(4) UNSIGNED NOT NULL,
  `date_created` date NOT NULL,
  `date_retired` date DEFAULT NULL,
  `state_name` varchar(50) NOT NULL,
  `state_abbreviation` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `STREET_CLASS_AUT`
--

CREATE TABLE `STREET_CLASS_AUT` (
  `code` char(1) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `STREET_LOCALITY`
--

CREATE TABLE `STREET_LOCALITY` (
  `street_locality_pid` varchar(15) NOT NULL,
  `date_created` date NOT NULL,
  `date_retired` date DEFAULT NULL,
  `street_class_code` char(1) NOT NULL,
  `street_name` varchar(55) NOT NULL,
  `street_type_code` varchar(15) DEFAULT NULL,
  `street_suffix_code` varchar(15) DEFAULT NULL,
  `locality_pid` varchar(15) NOT NULL,
  `gnaf_street_pid` varchar(15) DEFAULT NULL,
  `gnaf_street_confidence` decimal(1,0) DEFAULT NULL,
  `gnaf_reliability_code` decimal(1,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `STREET_LOCALITY_ALIAS`
--

CREATE TABLE `STREET_LOCALITY_ALIAS` (
  `street_locality_alias_pid` varchar(15) NOT NULL,
  `date_created` date NOT NULL,
  `date_retired` date DEFAULT NULL,
  `street_locality_pid` varchar(15) NOT NULL,
  `street_name` varchar(100) NOT NULL,
  `street_type_code` varchar(15) DEFAULT NULL,
  `street_suffix_code` varchar(15) DEFAULT NULL,
  `alias_type_code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `STREET_LOCALITY_ALIAS_TYPE_AUT`
--

CREATE TABLE `STREET_LOCALITY_ALIAS_TYPE_AUT` (
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `STREET_LOCALITY_POINT`
--

CREATE TABLE `STREET_LOCALITY_POINT` (
  `street_locality_point_pid` varchar(15) NOT NULL,
  `date_created` date NOT NULL,
  `date_retired` date DEFAULT NULL,
  `street_locality_pid` varchar(15) NOT NULL,
  `boundary_extent` decimal(7,0) DEFAULT NULL,
  `planimetric_accuracy` decimal(12,0) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `STREET_SUFFIX_AUT`
--

CREATE TABLE `STREET_SUFFIX_AUT` (
  `code` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `STREET_TYPE_AUT`
--

CREATE TABLE `STREET_TYPE_AUT` (
  `code` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
