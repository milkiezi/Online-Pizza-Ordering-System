-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2021 at 10:32 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pizza`
--

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `name`, `price`, `deleted`) VALUES
(1, 'Pepperoni', 129, 1),
(2, 'Cheese', 129, 1),
(3, 'Super Seafood', 149, 0),
(4, 'Hawaiian', 140, 0),
(5, 'Veggie', 129, 0),
(6, 'Double Peperoni', 250, 0),
(8, 'extra cheese', 150, 0),
(9, 'Hawaiianv2', 200, 0);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(300) NOT NULL,
  `description` varchar(300) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `payment_type` varchar(16) NOT NULL DEFAULT 'Wallet',
  `total` int(11) NOT NULL,
  `status` varchar(25) NOT NULL DEFAULT 'Yet to be delivered',
  `deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `address`, `description`, `date`, `payment_type`, `total`, `status`, `deleted`) VALUES
(1, 2, 'Address 2', 'Sample Description 1', '2021-03-11 18:00:09', 'Wallet', 150, 'Delivered', 0),
(2, 2, 'New address 2', '', '2021-03-16 17:43:05', 'Wallet', 130, 'Cancelled by Customer', 1),
(3, 3, 'Address 3', 'Sample Description 2', '2017-03-16 19:49:33', 'Cash On Delivery', 130, 'Yet to be delivered', 0),
(4, 3, 'Address 3', '', '2021-03-25 18:01:25', 'Cash On Delivery', 130, 'Cancelled by Customer', 1),
(5, 3, 'New Address 3', '', '2021-03-26 18:01:40', 'Wallet', 285, 'Paused', 0),
(6, 3, 'New Address 3', '', '2021-03-27 18:01:54', 'Wallet', 325, 'Cancelled by Customer', 1),
(8, 7, 'Address', '', '2021-04-27 19:57:14', 'Wallet', 258, 'Yet to be delivered', 0),
(9, 9, 'sssssssssssssssssssssssssssss', '', '2021-04-28 20:31:30', 'Wallet', 906, 'Delivered', 0),
(10, 2, 'Address 2', '', '2021-04-29 09:01:11', 'Wallet', 150, 'Yet to be delivered', 0),
(12, 8, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '', '2021-04-29 09:32:54', 'Wallet', 250, 'Yet to be delivered', 0),
(13, 7, 'Address', '', '2021-04-29 15:22:18', 'Wallet', 818, 'Delivered', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `ordetail_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`ordetail_id`, `order_id`, `item_id`, `quantity`, `price`) VALUES
(1, 1, 2, 2, 90),
(2, 1, 3, 3, 60),
(3, 2, 2, 2, 90),
(4, 2, 3, 2, 40),
(5, 3, 2, 2, 90),
(6, 3, 3, 2, 40),
(7, 4, 2, 2, 90),
(8, 4, 3, 2, 40),
(9, 5, 2, 5, 225),
(10, 5, 3, 2, 40),
(11, 5, 5, 1, 20),
(12, 6, 2, 5, 225),
(13, 6, 3, 3, 60),
(14, 6, 5, 2, 40),
(16, 8, 2, 2, 258),
(17, 9, 2, 2, 258),
(18, 9, 6, 1, 250),
(20, 9, 1, 1, 129),
(21, 9, 5, 1, 129),
(23, 10, 8, 1, 150),
(32, 12, 6, 1, 250),
(37, 13, 6, 1, 250),
(38, 13, 8, 1, 150),
(39, 13, 4, 1, 140),
(40, 13, 3, 1, 149),
(41, 13, 5, 1, 129);

-- --------------------------------------------------------

--
-- Table structure for table `supports`
--

CREATE TABLE `supports` (
  `support_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `description` varchar(3000) NOT NULL,
  `status` varchar(8) NOT NULL DEFAULT 'Open',
  `type` varchar(30) NOT NULL DEFAULT 'Others',
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supports`
--

INSERT INTO `supports` (`support_id`, `user_id`, `subject`, `description`, `status`, `type`, `date`, `deleted`) VALUES
(1, 2, 'Subject 1', 'New Description for Subject 1', 'Closed', 'Support', '2021-03-09 18:08:51', 0),
(2, 2, 'test error', 'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest', 'Open', 'Support', '2021-04-26 20:50:43', 0),
(3, 2, 'test2', 'teeeeeeeeeeeeeeeteeeeeeeeeeeeeeeteeeeeeeeeeeeeeeteeeeeeeeeeeeeeeteeeeeeeeeeeeeeeteeeeeeeeeeeeeeeteeeeeeeeeeeeeeeteeeeeeeeeeeeeeeteeeeeeeeeeeeeeeteeeeeeeeeeeeeeeteeeeeeeeeeeeeeeteeeeeeeeeeeeeeeteeeeeeeeeeeeeeeteeeeeeeeeeeeeee', 'Open', 'Payment', '2021-04-26 20:59:17', 0),
(4, 7, 'test error2', 'this is testthis is testthis is testthis is testthis is testthis is testthis is testthis is testthis is test', 'Closed', 'Support', '2021-04-27 18:53:17', 0),
(5, 9, 'how to use', 'taaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'Closed', 'Support', '2021-04-28 20:32:03', 0),
(6, 7, 'late delivery', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'Closed', 'Complaint', '2021-04-29 15:23:13', 0);

-- --------------------------------------------------------

--
-- Table structure for table `support_details`
--

CREATE TABLE `support_details` (
  `supdetail_id` int(11) NOT NULL,
  `support_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `support_details`
--

INSERT INTO `support_details` (`supdetail_id`, `support_id`, `user_id`, `description`, `date`) VALUES
(1, 1, 2, 'Description Subject 1', '2021-04-02 18:08:51'),
(2, 1, 2, 'Reply-1 Subject 1', '2021-04-02 16:25:14'),
(3, 1, 1, 'Reply-2 Subject 1-Administrator.', '2021-04-03 19:59:09'),
(4, 1, 1, 'Reply-3 Subject 1-Administrator.', '2021-04-03 20:00:15'),
(5, 2, 2, 'test', '2021-04-26 20:50:43'),
(6, 2, 1, 'test2', '2021-04-26 20:51:34'),
(7, 3, 2, 'test3', '2021-04-26 20:59:17'),
(8, 4, 7, 'this is testthis is testthis is testthis is testthis is testthis is testthis is testthis is testthis is test', '2021-04-27 18:53:17'),
(9, 5, 9, 'taaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2021-04-28 20:32:03'),
(10, 5, 1, 'bbbbbbbbbbbbbbbbbbb', '2021-04-28 20:34:29'),
(11, 4, 7, 'mmmmmmmmmmmmmmmm', '2021-04-29 09:15:28'),
(12, 6, 7, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2021-04-29 15:23:13'),
(13, 6, 1, 'aaaaaaaaaaaaaaaa', '2021-04-29 15:25:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `role` varchar(15) NOT NULL DEFAULT 'Customer',
  `name` varchar(15) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(16) NOT NULL,
  `email` varchar(35) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `contact` bigint(11) NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `role`, `name`, `username`, `password`, `email`, `address`, `contact`, `verified`, `deleted`) VALUES
(1, 'Administrator', 'Admin 1', 'admin', 'admin', '', 'Address 1', 9898000000, 1, 0),
(2, 'Customer', 'Customer 1', 'user1', 'pass1', 'user@gmail.com', 'Address 2', 9898000001, 1, 0),
(3, 'Customer', 'Customer 2', 'user2', 'pass2', 'user2@gmail.com', 'Address 3', 9898000002, 1, 0),
(4, 'Customer', 'Customer 3', 'user3', 'pass3', '', '', 9898000003, 0, 0),
(5, 'Customer', 'Customer 4', 'user4', 'pass4', '', '', 9898000004, 0, 1),
(7, 'Customer', 'test2', 'test10', 'test10', 'test10@gmail.com', 'AddressAddressAddressAddressAddressAddressAddressAddressAddress', 865471530, 0, 0),
(8, 'Customer', 'test15', 'test15', 'test15', NULL, NULL, 0, 0, 0),
(9, 'Customer', 'user10', 'user10', 'user10', 'user10@gmail.com', 'aaaaaaaaaaaaaaaaaa', 11111111111, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `wallet_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`wallet_id`, `user_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 7),
(7, 8),
(8, 9);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_details`
--

CREATE TABLE `wallet_details` (
  `walldetail_id` int(11) NOT NULL,
  `wallet_id` int(11) NOT NULL,
  `number` varchar(16) NOT NULL,
  `cvv` int(3) NOT NULL,
  `balance` int(11) NOT NULL DEFAULT 2000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wallet_details`
--

INSERT INTO `wallet_details` (`walldetail_id`, `wallet_id`, `number`, `cvv`, `balance`) VALUES
(1, 1, '6155247490533921', 983, 3430),
(2, 2, '1887587142382050', 772, 1700),
(3, 3, '4595809639046830', 532, 1585),
(4, 4, '5475856443351234', 521, 2000),
(5, 5, '9076633115663264', 229, 2000),
(6, 6, '7644966801142340', 659, 1182),
(7, 7, '7828960956328114', 621, 1750),
(8, 8, '3329695305337712', 666, 965);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `item_id` (`item_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `order_id` (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`ordetail_id`),
  ADD UNIQUE KEY `ordetail_id` (`ordetail_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `supports`
--
ALTER TABLE `supports`
  ADD PRIMARY KEY (`support_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `support_details`
--
ALTER TABLE `support_details`
  ADD PRIMARY KEY (`supdetail_id`),
  ADD KEY `support_id` (`support_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`wallet_id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `wallet_id` (`wallet_id`);

--
-- Indexes for table `wallet_details`
--
ALTER TABLE `wallet_details`
  ADD PRIMARY KEY (`walldetail_id`),
  ADD UNIQUE KEY `wallet_id` (`wallet_id`),
  ADD UNIQUE KEY `walldetail_id` (`walldetail_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `ordetail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `supports`
--
ALTER TABLE `supports`
  MODIFY `support_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `support_details`
--
ALTER TABLE `support_details`
  MODIFY `supdetail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `wallet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `wallet_details`
--
ALTER TABLE `wallet_details`
  MODIFY `walldetail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `supports`
--
ALTER TABLE `supports`
  ADD CONSTRAINT `support_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `support_details`
--
ALTER TABLE `support_details`
  ADD CONSTRAINT `ticket_details_ibfk_1` FOREIGN KEY (`support_id`) REFERENCES `supports` (`support_id`),
  ADD CONSTRAINT `ticket_details_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallet_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `wallet_details`
--
ALTER TABLE `wallet_details`
  ADD CONSTRAINT `walldetails_ibfk_1` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`wallet_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
