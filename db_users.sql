-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2025 at 08:34 AM
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
-- Database: `db_users`
--

-- --------------------------------------------------------

--
-- Table structure for table `dana`
--

CREATE TABLE `dana` (
  `id` int(11) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `total` decimal(15,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dana`
--

INSERT INTO `dana` (`id`, `kategori`, `total`) VALUES
(5, 'uangcash', 311134678.00),
(6, 'hutang', 6186786.00),
(7, 'bank', 0.00),
(8, 'hargamodal', 36007990.00);

-- --------------------------------------------------------

--
-- Table structure for table `kebutuhan`
--

CREATE TABLE `kebutuhan` (
  `id` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `nama_kebutuhan` varchar(100) NOT NULL,
  `biaya` int(11) NOT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kebutuhan`
--

INSERT INTO `kebutuhan` (`id`, `tanggal`, `nama_kebutuhan`, `biaya`, `keterangan`) VALUES
(1, '2025-12-08 12:39:00', 'PEMBELIAN AMPAS TAHU', 30000, ''),
(2, '2025-12-08 12:45:00', 'PEMBELIAN AMPAS TAHU', 30000, '');

-- --------------------------------------------------------

--
-- Table structure for table `laporan_transaksi`
--

CREATE TABLE `laporan_transaksi` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `hari` varchar(15) NOT NULL,
  `jam` time NOT NULL,
  `jenis_layanan` varchar(100) NOT NULL,
  `pemasukan` int(11) DEFAULT 0,
  `pengeluaran` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laporan_transaksi`
--

INSERT INTO `laporan_transaksi` (`id`, `tanggal`, `hari`, `jam`, `jenis_layanan`, `pemasukan`, `pengeluaran`) VALUES
(1, '2025-12-07', 'Minggu', '10:00:00', 'OFLINE', 5000000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `institution` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `fullname`, `username`, `institution`, `email`, `password`) VALUES
(19, '333', '333', '333', '333@333', '333'),
(20, '111', '111', '111', '111@111', '111'),
(21, 'qqqqq', 'qqqqq', 'qqqqq', 'qqqqq@qqqqq', 'qqqqq');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `layanan` varchar(50) DEFAULT NULL,
  `harga_modal` decimal(15,2) DEFAULT NULL,
  `harga_jual` decimal(15,2) DEFAULT NULL,
  `pembayaran` varchar(50) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `tanggal`, `layanan`, `harga_modal`, `harga_jual`, `pembayaran`, `keterangan`) VALUES
(10, '2025-12-09 13:36:00', 'app1', 11111.00, 1111.00, 'hutang', '11'),
(11, '2025-12-01 13:40:00', 'app1', 123.00, 555.00, 'uangcash', '555'),
(12, '2025-12-03 13:44:00', '1', 1333.00, 13333.00, 'uangcash', ''),
(13, '2025-12-04 13:45:00', '1', 1.00, 1.00, 'uangcash', '1'),
(14, '2025-12-08 13:48:00', 'OFLINE', 100000.00, 12.00, 'uangcash', '21'),
(15, '2025-12-02 13:49:00', 'app1', 131.00, 13.00, 'hutang', '13'),
(16, '2025-12-09 13:52:00', 'OFLINE KE KANDANG', 100000.00, 50000.00, 'uangcash', ''),
(17, '2025-11-03 13:53:00', 'OFLINE KE KANDANG', 1331111.00, 1222.00, 'uangcash', 'DATANGKE KANDANG\r\n'),
(18, '2025-12-08 05:58:00', 'OFLINE', 1200000.00, 3000000.00, 'uangcash', ''),
(19, '2025-11-10 15:21:00', 'OFLINE', 120000.00, 300000.00, 'uangcash', '12'),
(20, '2025-12-11 15:25:00', 'OFLINE', 310000.00, 5000000.00, 'bank', 'aw'),
(21, '2025-12-07 09:22:00', 'OFLINE', 800000.00, 10000000.00, 'hutang', 'BAUAR APA'),
(22, '2025-12-27 09:27:00', 'OFLINE', 131321312.00, 132131.00, 'uangcash', '1321'),
(23, '2025-12-06 09:28:00', 'OFLINE', 1313131.00, 12.00, 'uangcash', '21'),
(24, '2025-12-05 09:31:00', 'ads', 13.00, 243242.00, 'uangcash', '2432'),
(25, '2025-12-06 09:32:00', 'OFLINE', 1234242.00, 243242.00, 'hutang', '2432'),
(26, '2025-12-05 09:34:00', 'ADSAQ', 234324.00, 242343242.00, 'hutang', '243242'),
(27, '2025-12-04 09:37:00', 'OFLINE', 2432423.00, 2424.00, 'uangcash', '23432'),
(28, '2025-12-03 09:38:00', 'OFLINE', 2432424.00, 2423432.00, 'uangcash', '24324'),
(29, '2025-12-12 09:42:00', '234242342', 243324234.00, 242424.00, 'uangcash', ''),
(30, '2025-12-16 09:39:00', '2432424', 2432432423423.00, 234232432324.00, 'bank', '23424'),
(31, '2025-12-06 09:41:00', 'OFLINE', 23421345.00, 4324565453245.00, 'hutang', '45'),
(32, '2025-12-10 09:46:00', 'OFLINE', 243242424.00, 4234324.00, 'hutang', '2432'),
(33, '2025-12-11 09:49:00', 'OFLINE', 12313.00, 131231.00, 'uangcash', '1321'),
(34, '2025-12-12 21:50:00', 'OFLINE', 1242342.00, 234324.00, 'uangcash', '3242'),
(35, '2025-12-15 09:51:00', 'OFLINE', 243242.00, 243242.00, 'uangcash', '3242'),
(36, '2025-12-20 09:52:00', 'OFLINE', 13123.00, 131231.00, 'uangcash', '12313'),
(37, '2025-12-06 09:59:00', 'OFLINE', 1345667.00, 2423242.00, 'hutang', '2424'),
(38, '2025-12-04 10:09:00', 'OFLINE', 1312.00, 1312.00, 'uangcash', '31'),
(39, '2025-12-19 10:09:00', 'OFLINE', 22.00, 33.00, 'uangcash', '33'),
(40, '2025-12-18 10:10:00', 'OFLINE', 242234.00, 42342.00, 'hutang', '234'),
(41, '2025-12-09 10:33:00', 'OFLINE KE KANDANG', 1500000.00, 2000000.00, 'hutang', '21'),
(42, '2025-12-12 10:46:00', 'OFLINE KE KANDANG', 3131111.00, 4144444.00, 'hutang', ''),
(43, '2025-12-07 12:27:00', 'OFLINE KE KANDANG', 31133311.00, 311133333.00, 'uangcash', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dana`
--
ALTER TABLE `dana`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kategori` (`kategori`);

--
-- Indexes for table `kebutuhan`
--
ALTER TABLE `kebutuhan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `laporan_transaksi`
--
ALTER TABLE `laporan_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dana`
--
ALTER TABLE `dana`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `kebutuhan`
--
ALTER TABLE `kebutuhan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `laporan_transaksi`
--
ALTER TABLE `laporan_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
