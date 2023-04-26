-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2023 at 04:01 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kode` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `harga` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kode`, `nama`, `harga`) VALUES
(1, 'Chitato BBQ 100 Normal', 10000),
(2, 'Oreo Normal', 15000),
(3, 'Potabee Kentang Goreng', 12000),
(4, 'Cheetoz BBQ', 16000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `total_dibayar` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `total_harga`, `total_dibayar`, `kembalian`, `waktu`) VALUES
(1, 50000, 60000, 10000, '2023-04-26 08:50:31'),
(2, 15000, 20000, 5000, '2023-04-26 08:52:15'),
(3, 15000, 20000, 5000, '2023-04-26 08:52:38'),
(4, 37000, 40000, 3000, '2023-04-26 08:53:02'),
(5, 40000, 3000000, 2960000, '2023-04-26 09:03:15'),
(6, 787000, 100000000, 99213000, '2023-04-26 09:32:38'),
(7, 85000, 100000, 15000, '2023-04-26 09:41:47'),
(8, 65000, 100000, 35000, '2023-04-26 09:51:55'),
(9, 10000, 20000, 10000, '2023-04-26 10:01:11'),
(10, 52000, 60000, 8000, '2023-04-26 10:07:26'),
(11, 10000, 50000, 40000, '2023-04-26 10:13:08');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_barang`
--

CREATE TABLE `transaksi_barang` (
  `id` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `kode` int(11) NOT NULL,
  `jumlah_barang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi_barang`
--

INSERT INTO `transaksi_barang` (`id`, `id_transaksi`, `kode`, `jumlah_barang`) VALUES
(4, 1, 1, 50000),
(5, 2, 2, 1),
(6, 3, 2, 1),
(7, 4, 2, 1),
(8, 4, 1, 1),
(9, 4, 3, 1),
(10, 5, 1, 1),
(11, 5, 2, 2),
(12, 6, 1, 1),
(13, 6, 2, 51),
(14, 6, 3, 1),
(15, 7, 1, 1),
(16, 7, 2, 5),
(17, 8, 1, 5),
(18, 8, 2, 1),
(19, 9, 1, 1),
(20, 10, 1, 1),
(21, 10, 2, 2),
(22, 10, 3, 1),
(23, 11, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `userdata`
--

CREATE TABLE `userdata` (
  `id` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userdata`
--

INSERT INTO `userdata` (`id`, `username`, `password`) VALUES
(1, 'admin', '827ccb0eea8a706c4c34a16891f84e7b');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `transaksi_barang`
--
ALTER TABLE `transaksi_barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `kode` (`kode`);

--
-- Indexes for table `userdata`
--
ALTER TABLE `userdata`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `kode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `transaksi_barang`
--
ALTER TABLE `transaksi_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `userdata`
--
ALTER TABLE `userdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi_barang`
--
ALTER TABLE `transaksi_barang`
  ADD CONSTRAINT `transaksi_barang_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`),
  ADD CONSTRAINT `transaksi_barang_ibfk_2` FOREIGN KEY (`kode`) REFERENCES `barang` (`kode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
