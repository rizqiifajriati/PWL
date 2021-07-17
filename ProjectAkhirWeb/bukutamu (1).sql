-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2021 at 04:54 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bukutamu`
--

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE `guest` (
  `id` int(11) NOT NULL,
  `status` enum('1','2','3') NOT NULL DEFAULT '1',
  `id_card` varchar(5) NOT NULL DEFAULT '0',
  `tgl` datetime NOT NULL,
  `nama` varchar(30) NOT NULL,
  `instansi` varchar(50) NOT NULL,
  `telp` varchar(15) NOT NULL,
  `person` varchar(30) NOT NULL,
  `keperluan` text NOT NULL,
  `foto` varchar(100) NOT NULL DEFAULT 'default.jpg',
  `dura` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guest`
--

INSERT INTO `guest` (`id`, `status`, `id_card`, `tgl`, `nama`, `instansi`, `telp`, `person`, `keperluan`, `foto`, `dura`) VALUES
(122, '1', 'G0002', '2021-07-14 17:23:10', 'Agil Dwi Putra', 'PNS', '081370512376', 'Google', 'Melamar', 'default.jpg', 0),
(123, '1', 'G0001', '2021-07-14 17:40:50', 'rizqi fajri', 'Pengusaha', '081269480639', 'Jendral. Agil Syaputra', 'Wajib Militer', 'default.jpg', 0),
(124, '1', 'G0003', '2021-07-14 17:58:01', 'Arif Budiman', 'Petani', '081370512376', 'Jendral. Agil Syaputra', 'Wajib Militer', 'default.jpg', 0);

--
-- Triggers `guest`
--
DELIMITER $$
CREATE TRIGGER `status_qr` AFTER INSERT ON `guest` FOR EACH ROW begin
update qrcode,pegawai,guest set qrcode.status='2', pegawai.durasi=pegawai.durasi + guest.dura where qrcode.id=new.id_card AND pegawai.id_peg=new.person;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `upd_del` BEFORE DELETE ON `guest` FOR EACH ROW begin
update qrcode,pegawai,guest set qrcode.status = '1', pegawai.durasi=pegawai.durasi-guest.dura
where qrcode.id=old.id_card AND pegawai.id_peg=old.person AND pegawai.durasi>'0' AND old.status='1' and qrcode.status='1';
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `upd_edit` AFTER UPDATE ON `guest` FOR EACH ROW begin
UPDATE guest,qrcode SET qrcode.status='2'
WHERE qrcode.id=new.id_card AND new.status='1';
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `upd_edit2` BEFORE UPDATE ON `guest` FOR EACH ROW begin
update qrcode,pegawai,guest set qrcode.status = '1', pegawai.durasi=pegawai.durasi-old.dura
where qrcode.id=old.id_card AND pegawai.id_peg=old.person AND new.status='2';
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_peg` int(5) NOT NULL,
  `nip` varchar(30) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jabatan` varchar(100) NOT NULL,
  `gol` varchar(10) NOT NULL,
  `nmpkt` varchar(50) NOT NULL,
  `sortir` int(3) NOT NULL DEFAULT '1',
  `status` int(5) NOT NULL DEFAULT '1',
  `st_antri` int(11) NOT NULL DEFAULT '1',
  `durasi` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_peg`, `nip`, `nama`, `jabatan`, `gol`, `nmpkt`, `sortir`, `status`, `st_antri`, `durasi`) VALUES
(0, '', 'other', '', '', '', 0, 0, 0, 324),
(1, '17721078020001', 'Agil Dwi Putra.M.kom', 'Manager', 'IV/a', '', 1, 1, 1, 0),
(2, '112768101214', 'Rizqi Fajriati A.Md.Kom S.Kom', 'Direktur', 'V/d', '', 1, 1, 1, 0),
(3, '0686112012456', 'Abu Salam M.Kom', 'Ketua Devisi', 'IV/b', '', 1, 1, 1, 0),
(4, '19630403 199311 1 002', 'Ir. ARIEF BOEDIJANTO, M.Si', '4', 'IV/a', 'Pembina', 1, 1, 1, 0),
(5, '19650425 198803 1 008', 'AKHMAD SYAIFILLAH, ATD, MT\r\n', '5', 'IV/b', 'Pembina Tk 1', 1, 1, 1, 0),
(6, '19710501 199101 1 001', 'Drs. MUHAMMAD AGUNG HIKMATI, M.Si', '6', 'IV/a', 'Pembina', 1, 1, 1, 0),
(7, '19640708 199403 2 006', 'Dra. EVI SULISTYORINI, MM', '7', 'IV/b', 'Pembina Tk 1', 1, 0, 1, 0),
(8, '19720420 199803 1 007', 'HARTADI PRASETYO, S.Pt, M.Si', '8', 'IV/a', 'Pembina', 2, 1, 1, 0),
(9, '19660807 198511 2 001', 'GENUK ENDANG SUMIWI, S.IP, MSi', '9', 'IV/a', 'Pembina', 2, 1, 1, 0),
(10, '19640528 199402 1 001', 'Ir. DJOKO SARWONO, M.Si', '10', 'IV/a', 'Pembina', 2, 1, 1, 0),
(11, '19730120 199803 2 004', 'EKA SUPRAPTI, ST, MM', '11', 'IV/a', 'Pembina', 2, 1, 1, -324),
(12, '19660915 199403 1 007', 'GATOT WIDODO, S.Kom, M.Kom', '12', 'IV/a', 'Pembina', 2, 1, 1, 0),
(13, '19720331 199903 1 005', 'DJOKO PAMUNGKAS, S.Kom, M.S.E', '13', 'IV/a', 'Pembina', 2, 1, 1, 0),
(14, '19620405 198303 1 012', 'TOTO SUMARMO, S.Sos, M.Kom', '14', 'IV/a', 'Pembina', 2, 1, 1, 0),
(15, '19631122 199503 1 001', 'WIRYAWAN BUDI SASONGKO, SH', '15', 'III/d', 'Penata Tk 1', 2, 1, 1, 120),
(16, '19650130 199103 2 003', 'Dra. DYAH WIDIASTUTI', '16', 'III/d', 'Penata Tk 1', 2, 1, 1, 0),
(17, '19650317 198603 1 009', 'EKO SRI DARMINTO, SH', '17', 'III/d', 'Penata Tk 1', 2, 1, 1, 0),
(18, '19610612 199003 1 010', 'SUDJAD, SH', '18', 'III/d', 'Penata Tk 1', 2, 0, 1, 0),
(19, '19680708 199312 1 001', 'HITA YOGA PRATYAKSA, SE, M.Kom', '19', 'III/d', 'Penata Tk 1', 2, 1, 1, 0),
(20, '19700515 199001 2 001', 'ENY SOELASTRI, SH', '20', 'III/d', 'Penata Tk 1', 2, 1, 1, 0),
(21, '19780423 200501 1 008', 'MARTIUS APUN HESES, S.Kom, M.Kom', '21', 'III/d', 'Penata Tk 1', 2, 1, 1, 0),
(22, '19800506 200903 1 006', 'DICKY ADINURWANTO, S.Sos, MM', '22', 'III/c', 'Penata', 2, 1, 1, 0),
(23, '19870508 201001 1 011', 'ENRICO ADRIAN RAMANDHA, SE', '23', 'III/c', 'Penata', 2, 1, 1, 120),
(24, '19860921 200903 1 002', 'ISWAHYUDI, S.Kom, M.Kom', '24', 'III/c', 'Penata', 2, 1, 1, 0),
(25, '19820801 200903 2 005', 'AGUSTINA TUTY N, S.Sos', '32', 'III/c', 'Penata', 3, 1, 1, 0),
(26, '19830325 200903 1 006', 'ARDYANTA YOGA UTAMA, S.Sos', '32', 'III/c', 'Penata', 3, 1, 1, 0),
(27, '19830509 200903 2 006', 'DIAN MEYLINA ADETYASTUTI, S.Sos', '32', 'III/c', 'Penata', 3, 1, 1, 0),
(28, '19800101 200903 2 007', 'WARIH HANDAYANI, S.IP', '32', 'III/c', 'Penata', 3, 1, 1, 0),
(29, '19850515 201001 2 037', 'RIEKA HAPSARI KOESMASTUTI, S.I.Kom, M.I.Kom', '33', 'III/c', 'Penata', 3, 1, 1, 0),
(30, '19821114 201001 2 019', 'DEVIANI NOVITA SETIAWATI, S.Kom', '34', 'III/a', 'Penata Muda', 3, 1, 1, 0),
(31, '19851202 201101 1 005', 'DIAS SATRIO NUGROHO, A.Md', '35', 'II/d', 'Pengatur Tingkat 1', 3, 1, 1, 0),
(32, '19640322 198903 2 004', 'SRI WIDOWATI, S.S', '25', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(33, '19760430 199803 2 004', 'ANDRIA WIDYASTUTI, SE, M.I.Kom', '25', 'III/d', 'Penata Tk 1', 3, 0, 1, 0),
(34, '19851114 200912 1 002', 'IFRAN LINDU MAHARGYA, S.Kom', '25', 'III/c', 'Penata', 3, 0, 1, 0),
(35, '19650622 199003 1 007', 'RUBIYO', '25', 'III/b', 'Penata Muda Tk 1', 3, 1, 1, 0),
(36, '19821018 201101 1 001', 'FAJAR ISMAIL, SE', '25', 'III/c', 'Penata', 3, 1, 1, 0),
(37, '19860614 201101 2 014', 'WINDA SARI RAHMAWATI, S.Kom., M.Acc', '25', 'III/c', 'Penata', 3, 1, 1, 0),
(38, '19630208 198303 2 005', 'SRI SUPARYANTI, S.Sos', '25', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(39, '19650430 198609 2 001', 'LIES MARDIANI, SH', '25', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(40, '19790206 200012 2 001', 'DINI FIRMALA, S.Tr, MM', '25', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(41, '19610222 198202 2 003', 'TRI SULISTYORINI, SE', '25', 'III/d', 'Penata Tk 1', 0, 0, 1, 0),
(42, '19670930 199003 2 006', 'SEPTI WATININGTYAS, SE', '25', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(43, '19710918 199103 2 004', 'SITI RAHAYU, SE', '25', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(44, '19700403 199003 2 002', 'ISMINARSIH, SE', '25', 'III/c', 'Penata', 3, 1, 1, 0),
(45, '19621229 198703 2 003', 'BUDIARTI', '25', 'III/b', 'Penata Muda Tk 1', 3, 1, 1, 0),
(46, '19651110 198503 1 007', 'SLAMET RIYADI', '25', 'III/b', 'Penata Muda Tk 1', 3, 1, 1, 0),
(47, '19700621 200701 1 011', 'DJOKO PRANOTO, SE', '25', 'III/a', 'Penata Muda', 3, 1, 1, 0),
(48, '19670308 200701 1 014', 'SUMARJADI', '25', 'II/d', 'Pengatur Tk 1', 3, 1, 1, 0),
(49, '19631216 198503 2 006', 'SRI RAHAYUNINGSIH, SH', '25', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(50, '19690407 199501 2 003', 'RIANI ADI, SH, MM', '25', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(51, '19690226 199803 2 003', 'ARUM SETYOWATI, S.Psi', '25', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(52, '19690326 199003 2 006', 'YUSTINA SANTI ANJARWANI, S.Sos', '25', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(53, '19720801 199501 1 001', 'TOIFUR, S.Sos', '25', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(54, '19630715 198609 2 003', 'SUPARYANTI, SE', '25', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(55, '19610702 198303 2 012', 'SRI YULITA RAHAYU, SE', '25', 'III/d', 'Penata Tk 1', 3, 0, 1, 0),
(56, '19660626 198903 1 009', 'ADIYONO, SE', '25', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(57, '19660427 199103 2 005', 'ISTIANI UNGGULWATI, SE', '25', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(58, '19710117 199103 1 003', 'BAMBANG WINARNO, S.Sos', '25', 'III/c', 'Penata', 3, 1, 1, 0),
(59, '19620110 198303 2 011', 'TUTI', '25', 'III/b', 'Penata Muda Tk 1', 3, 1, 1, 0),
(60, '19650206 198603 2 015', 'RR. ANNY SOEHARJANI', '25', 'III/b', 'Penata Muda Tk 1', 3, 1, 1, 0),
(61, '19660806 198903 1 004', 'SUMANTO', '25', 'III/b', 'Penata Muda Tk 1', 3, 1, 1, 0),
(62, '19630727 199001 2 001', 'JULIARTI CAHYANI', '25', 'III/b', 'Penata Muda Tk 1', 3, 1, 1, 0),
(63, '19690827 199403 1 008', 'SUKARDI', '25', 'III/b', 'Penata Muda Tk 1', 3, 1, 1, 0),
(64, '19800714 201101 2 005', 'ENDAH TRI NUGRAHENI, S.Si', '25', 'III/c', 'Penata', 3, 1, 1, 0),
(65, '19660630 199803 1 009', 'SHOLIKHUN', '25', 'III/b', 'Penata Muda Tk 1', 3, 1, 1, 0),
(66, '19901023 201406 1 002', 'R.FERY ANGGIT PURWANDANU, S.STP', '25', 'III/b', 'Penata Muda Tk 1', 3, 1, 1, 0),
(67, '19641121 198903 1 006', 'BUDI SAPTOWO', '25', 'III/a', 'Penata Muda', 3, 1, 1, 0),
(68, '19620626 198503 1 012', 'SUDARNO', '25', 'III/a', 'Penata Muda', 3, 1, 1, 0),
(69, '19670327 199803 1 005', 'ARIEF ZAKARIA, SH', '26', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(70, '19621114 199203 2 001', 'SULISTYO BUDI RAHAYU, S.Sos', '26', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(71, '19650106 198603 2 003', 'PUAS SETYANINGSIH, S.Sos', '26', 'III/c', 'Penata', 3, 1, 1, 0),
(72, '19670427 199501 1 001', 'SIGIT SUWARNO, S.Sos', '26', 'III/c', 'Penata', 3, 1, 1, 0),
(73, '19610709 198103 2 002', 'NUR FAIZAH', '26', 'III/b', 'Penata Muda Tk 1', 3, 0, 1, 0),
(74, '19770909 201001 2 010', 'ULLY FITRIARTI MANIK, S.KM', '26', 'III/b', 'Penata Muda Tk 1', 3, 1, 1, 0),
(75, '19841010 201001 1 029', 'FATKHI BARRI, S.Sos', '26', 'III/c', 'Penata', 3, 1, 1, 0),
(76, '19801020 200604 1 011', 'Dr. GALIH WIBOWO, S.Sos, MA', '26', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(77, '19610424 198203 1 014', 'SUPARYADI', '26', 'III/b', 'Penata Muda Tk 1', 3, 0, 1, 0),
(78, '19611111 198303 2 012', 'SRI HARTUTI', '26', 'III/b', 'Penata Muda Tk 1', 3, 1, 1, 0),
(79, '19640830 199803 1 002', 'SOEJOEDI', '26', 'III/b', 'Penata Muda Tk 1', 3, 1, 1, 0),
(80, '19650429 199502 1 001', 'Drs. KARTIKA HADI', '27', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(81, '19650818 199610 2 001', 'Dra. EKO ANTINI AGUSTININGRUM', '27', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(82, '19860602 201402 2 001', 'EMMA RACHMAWATI, S.Si', '27', 'III/b', 'Penata Muda Tk 1', 3, 1, 1, 0),
(83, '19611126 199006 2 001', 'RAJ.MARIA HARNENY CHRISTIANTI, SH, MM', '27', 'IV/a', 'Pembina', 3, 1, 1, 0),
(84, '19611008 198503 2 005', 'ERNA HARIANTI, S.Sos', '27', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(85, '19720706 199302 1 002', 'MOCH NUGROHO HARTANTO, SE', '27', 'III/c', 'Penata', 3, 1, 1, 0),
(86, '19650207 200701 1 006', 'DJALMO PRAKOSA', '27', 'III/a', 'Penata Muda', 3, 1, 1, 0),
(87, '19630402 198712 2 002', 'GEMA PANCAWATI, SH. M.HUM.', '27', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(88, '19630914 199003 1 006', 'ENDRARTO PONCO SUPRAPTO, S.S', '27', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(89, '19641005 198403 2 003', 'RUGAYAWATI, S.Sos', '27', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(90, '19811101 201001 2 029', 'ENI LESTARI, A.Md', '27', 'III/a', 'Penata Muda', 3, 1, 1, 0),
(91, '19780806 200901 1 008', 'AGUS AMINUDIN, S.Kom', '28', 'III/c', 'Penata', 3, 1, 1, 0),
(92, '19851008 201502 1 002', 'HARI TRI MURDIATMOKO, S.Kom', '28', 'III/b', 'Penata Muda Tk 1', 3, 1, 1, 0),
(93, '19870320 201502 1 001', 'OCKY PRIMA HERMAWAN, S.Kom', '28', 'III/b', 'Penata Muda Tk 1', 3, 1, 1, 0),
(94, '19790423 201001 2 009', 'SOFANI ARUM PRAMUSINTA, SE', '28', 'III/a', 'Penata Muda', 3, 1, 1, 0),
(95, '19630912 199112 1 002', 'DHARWONO, S.IP', '28', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(96, '19770402 200003 1 001', 'MASHURI, ST, MM', '18', 'III/d', 'Penata Tk 1', 2, 1, 1, 0),
(97, '19670825 199503 2 001', 'LILIK MAHYUNI, SE', '28', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(98, '19631115 198712 2 001', 'RETNO ASTUTI, SE', '28', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(99, '19680406 199903 1 006', 'TEGUH TRIANGGONO, S.Pd', '29', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(100, '19800416 199810 2 001', 'INDAH ETA LESTARI, S.STP', '29', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(101, '19621101 198103 2 002', 'RENI SETYOWATI, SH', '29', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(102, '19690408 199103 2 012', 'SRI WIBAYUNI, SE', '29', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(103, '19720415 199403 1 007', 'AMIN INDRAMANTO, S.Sos', '26', 'III/b', 'Penata Muda Tk 1', 3, 1, 1, 0),
(104, '19611113 198203 2 007', 'RISTYAWATI, S.IP', '29', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(105, '19740717 200604 2 002', 'YULI AMBAR KUSUMAWATI, ST', '29', 'III/b', 'Penata Muda Tk 1', 3, 1, 1, 0),
(106, '19610503 198611 2 001', 'SUPARTI, SE', '31', 'III/d', 'Penata Tk 1', 3, 0, 1, 0),
(107, '19680222 198903 2 008', 'ISTIFAIYAH, S.Sos', '31', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(108, '19721106 199603 1 004', 'SURANA, S.Sos', '31', 'III/c', 'Penata', 3, 1, 1, 0),
(109, '19651210 198903 2 009', 'TITIK NOORYANTI', '31', 'III/b', 'Penata Muda Tk 1', 3, 1, 1, 0),
(110, '19681022 198903 1 003', 'ANTONIUS THOMAS DARYONO', '31', 'III/b', 'Penata Muda Tk 1', 3, 1, 1, 0),
(111, '19670314 198803 1 007', 'CARSO AGUS HERYANTO, S.Pd', '31', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(112, '19630427 198511 2 002', 'SRI ERWATI, SE', '31', 'III/d', 'Penata Tk 1', 3, 1, 1, 0),
(113, '19850803 201001 1 006', 'BHAGUS PRADOYO, SH, M.Si', '31', 'III/c', 'Penata', 3, 1, 1, 0),
(114, '19630205 198503 2 008', 'SRI PURWANINGSIH', '31', 'III/b', 'Penata Muda Tk 1', 3, 1, 1, 0),
(115, '19610615 198611 2 001', 'YUNIZAR', '31', 'III/b', 'Penata Muda Tk 1', 3, 0, 1, 0),
(116, '19630309 198903 1 009', 'TEGUH SUMARSONO', '31', 'III/b', 'Penata Muda Tk 1', 3, 1, 1, 0),
(117, '19670611 198903 2 003', 'ETY SOELISTIJOWATI', '31', 'III/b', 'Penata Muda Tk 1', 3, 1, 1, 0),
(118, '19730402 201001 1 006', 'SUTRISNO, A.Md', '31', 'III/a', 'Penata Muda', 3, 1, 1, 0),
(119, '-', 'AYU RATNANINGTYAS, A.Md', '36', '-', '-', 4, 1, 1, 0),
(120, '-', 'ALDI WIBOWO', '36', '-', '-', 5, 1, 1, 0),
(121, '-', 'ABDULLAH', '36', '-', '-', 5, 1, 1, 0),
(122, '-', 'DIANA RAKHMAWATI', '36', '-', '-', 4, 1, 1, 0),
(123, '-', 'AAN SYAH ABDUL RAZED', '36', '-', '-', 5, 1, 1, 0),
(124, '-', 'DWI PRATIWI SETIYAWATI, S.Psi', '36', '-', '-', 4, 1, 1, 0),
(125, '-', 'GRANDIS CANDRA M.W, S.Kom', '36', '-', '-', 4, 1, 1, 0),
(126, '-', 'LULUT PRIHANGGO KUSUMA, A.Md', '36', '-', '-', 4, 1, 1, 0),
(127, '-', 'ADITYA WISNU KURNIAWAN, S.Kom', '36', '-', '-', 4, 1, 1, 0),
(128, '-', 'WULANDARI NURSETYORINI, SE', '36', '-', '-', 4, 0, 1, 0),
(129, '-', 'DERANDRA ADHA KUMBARA, SH', '36', '-', '-', 4, 1, 1, 0),
(130, '-', 'SHELMA JANU MAHARTIWI, S.A.P', '36', '-', '-', 4, 1, 1, 0),
(131, '-', 'RIFKA ROSYA FITRIANA, A.Md', '36', '-', '-', 4, 1, 1, 0),
(132, '-', 'ARI PRIYO UTOMO, SE', '36', '-', '-', 4, 1, 1, 0),
(133, '-', 'AHMAD RIFA\'I EDI PRAKOSO, SE', '36', '-', '-', 4, 1, 1, 0),
(134, '-', 'DONNA SETYARINI, SH', '36', '-', '-', 4, 1, 1, 0),
(135, '-', 'SETIAWAN MEGANANTA YUNIANTO, S.Kom', '36', '-', '-', 4, 1, 1, 0),
(136, '-', 'HANNY INDRI HAPSARI, S.Kom', '37', '-', '-', 4, 1, 1, 0),
(137, '-', 'HANDRI PRASODJO, S.Kom', '37', '-', '-', 4, 1, 1, 0),
(138, '-', 'WIDYO PRIHANTORO, A.Md', '37', '-', '-', 4, 1, 1, 0),
(139, '-', 'FUAD WIDYA TAMA, S.Hum', '37', '-', '-', 4, 1, 1, 0),
(140, '-', 'DEVTIANI AULIA, S.Pd', '37', '-', '-', 4, 1, 1, 0),
(141, '-', 'M. FAHMI SETIADIN, SH', '37', '-', '-', 4, 1, 1, 0),
(142, '-', 'MUHAMMAD ARDIAN, S.I.Kom', '37', '-', '-', 4, 1, 1, 0),
(143, '-', 'TEGUH PRAMONO, S.I.Kom', '37', '-', '-', 4, 1, 1, 0),
(144, '-', 'GIFFEN BIAN SAPUTRA, S.I.Kom', '37', '-', '-', 4, 1, 1, 0),
(145, '-', 'NURUL HIKMAH, S.I.Kom', '37', '-', '-', 4, 1, 1, 0),
(146, '-', 'HASTUTIK, S.I.Kom', '37', '-', '-', 4, 1, 1, 0),
(147, '-', 'YASYKUR HISYAM MU\'AAFII, S.Pd', '37', '-', '-', 4, 1, 1, 0),
(148, '-', 'KAISYA UKIMA TIARA ANUGRAHANI, S.I.Kom', '37', '-', '-', 4, 1, 1, 0),
(149, '-', 'MIFTAKHUL HUDA, S.Kom', '38', '-', '-', 4, 1, 1, 0),
(150, '-', 'BERTY KURNIAWAN, S.Kom', '38', '-', '-', 4, 1, 1, 0),
(151, '-', 'ADI KURNIAWAN, S.Kom', '38', '-', '-', 4, 1, 1, 0),
(152, '-', 'AHMAD ARIF PAMUJI, S.Kom', '38', '-', '-', 4, 1, 1, 0),
(153, '-', 'LUSI ANGGRAINI UTAMI, S.Kom', '38', '-', '-', 4, 1, 1, 0),
(154, '-', 'EKA RINA KURNIATI, S.Kom', '38', '-', '-', 4, 1, 1, 0),
(155, '-', 'KESTININGSIH, S.Ikom', '38', '-', '-', 4, 1, 1, 0),
(156, '-', 'FIDELIS YOGISWARA WASTU A, S.M', '38', '-', '-', 4, 1, 1, 0),
(157, '-', 'MACHRIFAL FIDHA HUSEIN, S.Kom', '38', '-', '-', 4, 1, 1, 0),
(158, '-', 'DICKY CITO PAMUJI, S.Kom', '38', '-', '-', 4, 1, 1, 0),
(159, '-', 'CAHYA NURANI INDAH, M.Kom', '39', '-', '-', 4, 1, 1, 0),
(160, '-', 'MUHAMMAD ALI MUSTOFA, S.Kom', '39', '-', '-', 4, 1, 1, 0),
(161, '-', 'ANAZ SATRIA AJI, S.Kom', '39', '-', '-', 4, 1, 1, 0),
(162, '-', 'MAHATMA RIFKA LUKISWARA, S.ST', '39', '-', '-', 4, 1, 1, 0),
(163, '-', 'GALLA ZULHY HIDAYAT, S.Kom', '39', '-', '-', 4, 1, 1, 0),
(164, '-', 'FAIT ALI YASKUR', '40', '-', '-', 4, 1, 1, 0),
(165, '-', 'PRIYO HARIADI', '40', '-', '-', 4, 1, 1, 0),
(166, '-', 'SAFII', '40', '-', '-', 4, 1, 1, 0),
(167, '-', 'CHOERUL IMAM WIBOWO', '40', '-', '-', 4, 1, 1, 0),
(168, '-', 'ANGGA DANI PRADANA', '40', '-', '-', 4, 1, 1, 0),
(169, '-', 'DIYAN SANTOSO, A.Md', '41', '-', '-', 4, 1, 1, 0),
(170, '-', 'TEGUH SUPRIYANTO', '41', '-', '-', 4, 1, 1, 0),
(171, '-', 'PURWANTO', '42', '-', '-', 4, 1, 1, 0),
(172, '-', 'TRI DARYANTO', '41', '-', '-', 4, 1, 1, 0),
(173, '-', 'ARIO RINENGGO, SE', '41', '-', '-', 4, 1, 1, 0),
(174, '-', 'FANDI ACHMAD ARIFIN, SH', '41', '-', '-', 4, 1, 1, 0),
(175, '-', 'SUGENG AGUS DARYANTO', '42', '-', '-', 4, 1, 1, 0),
(176, '-', 'DWI MEIDA KURNIA UTAMI, S.Kom', '43', '-', '-', 4, 1, 1, 0),
(177, '-', 'WAHYU ADI SUSANTO, SH', '41', '-', '-', 4, 1, 1, 0),
(178, '-', 'HIDAYANTININGSIH, SH', '43', '-', '-', 4, 1, 1, 0),
(179, '-', 'NURAINI DEWI MAHARANI, SH', '43', '-', '-', 4, 1, 1, 0),
(180, '-', 'GANDHI KURNIAWAN, S.Kom', '41', '-', '-', 4, 1, 1, 0),
(181, '-', 'SATRIO KUSUMO AJI', '41', '-', '-', 4, 1, 1, 0),
(182, '-', 'ARIF YULIANTO', '41', '-', '-', 4, 1, 1, 0),
(183, '-', 'RIZA FAISAL, SE', '41', '-', '-', 4, 1, 1, 0),
(184, '-', 'AGUS EDY CAHYONO, S.Kom', '41', '-', '-', 4, 1, 1, 0),
(185, '-', 'WAHYU DWI DESTIYAN, S.Pd', '41', '-', '-', 4, 1, 1, 0),
(186, '-', 'VEKTOR ARYANTO', '41', '-', '-', 4, 1, 1, 0),
(187, '-', 'AISYAH MONICA, S.Ikom', '41', '-', '-', 4, 1, 1, 0),
(188, '-', 'FARIS JUNAIDI', '41', '-', '-', 4, 1, 1, 0),
(189, '-', 'CLAUDIA KISSA DEVI, SH', '43', '-', '-', 4, 1, 1, 0),
(190, '-', 'VANNY KHAQUNNISA', '41', '-', '-', 4, 1, 1, 0),
(191, '-', 'ALFIAN ULIL ABSHOR, S. Si', '41', '-', '-', 4, 1, 1, 0),
(192, '-', 'CANDRA LOKA PUSPITASARI', '41', '-', '-', 4, 1, 1, 0),
(193, '-', 'ACHMAD MAMBA\'UN NI\'AM, S. Kom', '46', '-', '-', 4, 1, 1, 0),
(194, '-', 'TRI PURNOMO, S.Kom', '46', '-', '-', 4, 1, 1, 0),
(195, '-', 'NUR ISMAIL ZAKARIA, S.Kom', '46', '-', '-', 4, 1, 1, 0),
(196, '-', 'HUDA PRIMA HARTYANTO, S.Kom', '44', '-', '-', 4, 1, 1, 0),
(197, '-', 'ANGGA REZA PALEVI, S.Kom', '46', '-', '-', 4, 1, 1, 0),
(198, '-', 'HARJUNA COMSKY SK, S.Kom', '0', '-', '-', 4, 1, 1, 0),
(199, '-', 'UMAR ASHIDIQI, S.Kom', '46', '-', '-', 4, 1, 1, 0),
(200, '-', 'YULIANA CAHYATI, S.Kom', '44', '-', '-', 4, 1, 1, 0),
(201, '-', 'HONO LUNGGUH ARGO, ST', '46', '-', '-', 4, 1, 1, 0),
(202, '-', 'SUKMA WAHYU WARDONO, ST', '46', '-', '-', 4, 1, 1, 0),
(203, '-', 'WANDE TRICADA, S.Kom', '46', '-', '-', 4, 1, 1, 0),
(204, '-', 'Rr. FARASITA ANGGIT PURNANDINI, S.IP', '46', '-', '-', 4, 1, 1, 0),
(205, '-', 'FAJAR BAYU AJI, S.Kom', '45', '-', '-', 4, 1, 1, 0),
(206, '-', 'ISMUNAWAR, S. Kom', '45', '-', '-', 4, 1, 1, 0),
(207, '-', 'MUH ANGGORO SETIO PURNAWAN, S.Kom', '45', '-', '-', 4, 1, 1, 0),
(208, '-', 'ARISWANTO, S.Kom', '38', '-', '-', 4, 1, 1, 0),
(209, '-', 'MUHAMMAD SUBHAN', '46', '-', '-', 4, 1, 1, 0),
(210, '-', 'RIZKY AMELIA FATHIA', '46', '-', '-', 4, 1, 1, 0),
(211, '-', 'ANGGIT KUNTO BIWAHYU, S.Sn', '46', '-', '-', 4, 1, 1, 0),
(212, '-', 'GHANI NAFIANSYAH, S.Kom', '46', '-', '-', 4, 1, 1, 0),
(213, '-', 'HESTI WAHYU NUGROHO, S.Pd', '46', '-', '-', 4, 1, 1, 0),
(214, '-', 'SYAHRIL ILHAMI, M.Si', '44', '-', '-', 4, 1, 1, 0),
(215, '-', 'REZA MAFTAZANI, S.Kom', '46', '-', '-', 4, 1, 1, 0),
(216, '-', 'SOLEKHAH NUR HAYATI WIDODO, S.T.P.', '46', '-', '-', 4, 1, 1, 0),
(217, '-', 'ANINDYA LIANI, S.IP', '46', '-', '-', 4, 1, 1, 0),
(218, '-', 'ESKA SARTI KUNDARI, S.Kom', '46', '-', '-', 4, 1, 1, 0),
(219, '-', 'AMINNUDIN', '47', '-', '-', 4, 1, 1, 0),
(220, '-', 'MUALIFUL MIZAN', '47', '-', '-', 4, 1, 1, 0),
(222, '19961227 201808 2 001', 'AT DIPTA URUG MRESTI, S.IP', '48', '-', '-', 3, 1, 1, 0),
(223, '19940702 201808 1 002', 'REZKI PRIMA BAHRIAN, S.STP', '27', '-', '-', 3, 1, 1, 0),
(224, '19960801 201808 2 002', 'ARLINDA WULANDARI, S.STP', '30', '-', '-', 3, 0, 1, 0),
(225, '19960303 201808 1 001', 'KAHFI FAUZI, S.STP', '31', '-', '-', 3, 1, 1, 0),
(226, '19640510 199703 1 005', 'SARDI', '57', 'II/d', 'Pengatur Tk 1', 3, 1, 1, 0),
(227, '-', 'Drs. SOSIAWAN', '49', '-', '-', 1, 1, 1, 0),
(228, '-', 'ZAENAL ABIDIN, S.Pd,SH,MH', '50', '-', '-', 2, 1, 1, 0),
(229, '-', 'SLAMET HARYANTO, SH', '51', '-', '-', 3, 1, 1, 0),
(230, '-', 'HANDOKO AGUNG SAPUTRO, S.Sos', '51', '-', '-', 3, 1, 1, 0),
(231, '-', 'Dr. Wijaya, SH, MH', '51', '-', '-', 3, 1, 1, 0),
(232, '-', 'FANNY KHAQUNNISA, SH', '43', '-', '-', 4, 1, 1, 0),
(233, '-', 'ARIEF YULIANTO', '52', '-', '-', 4, 1, 1, 0),
(234, '-', 'FARID JUNAEDI', '42', '-', '-', 5, 1, 1, 0),
(235, '19810730 200903 2 007', 'DHANIK RAMADIANA, S.Sos', '26', 'III/c', 'Penata', 3, 1, 1, 0),
(236, '19770331 201101 2 004', 'SERVINA DAMAYANTI, S.Kom', '29', 'III/c', 'Penata', 3, 1, 1, 0),
(237, '19890130 201101 2 006', 'RETNO WIDIYANTI, S.Si', '27', 'III/b', 'Penata Muda Tk 1', 3, 1, 1, 0),
(238, '19880822 201902 1 005', 'DIMAS ARMY SULISTIO NEGORO, A.Md', '25', 'II/c', 'Pengatur', 3, 1, 1, 0),
(239, '19940919 201902 1 007', 'RIAN SEPTIADI, A.Md.T', '31', 'II/c', 'Pengatur', 3, 1, 1, 0),
(240, '-', 'RYAN ADHITYA NUGRAHA', '53', '-', '-', 5, 1, 1, 0),
(241, '-', 'HENDRA SANDHI FIRMANSYAH', '53', '-', '-', 5, 1, 1, 0),
(242, '-', 'MASRURI', '55', '-', '-', 5, 1, 1, 0),
(243, '-', 'LEWI ARUMINTONO', '55', '-', '-', 5, 1, 1, 0),
(244, '-', 'HABIBI KURNIAWAN, SIP, M.IP', '54', '-', '-', 3, 1, 1, 0),
(245, '-', ' AJIE GINANJAR NUGRAHA', '56', '-', '-', 5, 0, 1, 0),
(246, '-', 'MUHAMMAD DHABIT PRAMONO', '37', '-', '-', 4, 1, 1, 0),
(247, '-', 'Dr. Ir DWI EKO WALUYO, MM', '58', '-', '-', 3, 0, 1, 0),
(248, '-', 'Dr. TEGUH YUWONO, M.Pol', '59', '-', '-', 3, 0, 1, 0),
(249, '-', 'HARJUNA COMSKY SK, S.Kom', '46', '-', '-', 4, 1, 1, 0),
(250, '-', 'ELLISA APRILIA, S.Pd', '37', '-', '-', 4, 1, 1, 0),
(251, '-', 'ARIEF SATRIANA ULFA, S.Kom', '62', '-', '-', 4, 1, 1, 0),
(252, '-', 'APRILIA FATHUN NI\'MAH, S.K.M', '62', '-', '-', 4, 1, 1, 0),
(253, '-', 'BIMA HUSADANI', '67', '-', '-', 4, 0, 1, 0),
(254, '-', 'IR. SUNARYO MURP,Ph.d', '64', '-', '-', 3, 1, 1, 0),
(255, '19790729 200604 2 011', 'MARLUPI JULIANINGRUM, ST', '66', 'IV/a', 'Pembina', 3, 1, 1, 0),
(256, '-', 'PURWITO', '67', '-', '-', 4, 1, 1, 0),
(257, '-', 'FERY ABIDIN', '36', '-', '-', 5, 1, 1, 0),
(258, '-', 'WARIDI', '36', '-', '-', 5, 1, 1, 0),
(259, '198205212010011018', 'SUBROTO BUDHI UTOMO, S.Kom., M.T', '68', 'III/c', 'Penata', 2, 1, 1, 0),
(260, '19660529 199503 1 002', 'HARYO JOKO PURNOMO, S.Si, M.T', '66', 'IV/a', 'Pembina', 3, 1, 1, 0),
(261, '-', 'MUSTHAFA KHAIRI, S.H', '36', '-', '-', 4, 1, 1, 0),
(262, '-', 'BIMA HUSADANI', '60', '-', '-', 4, 1, 1, 0),
(263, '19800306 201101 1 006', 'AGUNG, S.Kom', '25', 'III/b', 'Penata Muda Tk 1', 3, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qrcode`
--

CREATE TABLE `qrcode` (
  `id` varchar(5) NOT NULL,
  `kartu` varchar(20) NOT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qrcode`
--

INSERT INTO `qrcode` (`id`, `kartu`, `status`) VALUES
('G0001', 'Kartu_Tamu1', '2'),
('G0002', 'Kartu_Tamu2', '2'),
('G0003', 'Kartu_Tamu3', '2'),
('G0004', 'Kartu_Tamu4', '1'),
('G0005', 'Kartu_tamu5', '1'),
('G0006', 'Kartu_tamu6', '2'),
('G0007', 'Karu_tamu7', '1'),
('G0008', 'Katu_tamu8', '1'),
('G0009', 'Kartu_tamu9', '1'),
('G0010', 'Kartu_tamu10', '1');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `level` enum('1','2','3') NOT NULL,
  `email` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `level`, `email`, `username`, `password`, `status`) VALUES
(1, '1', 'admin@admin.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_peg`);

--
-- Indexes for table `qrcode`
--
ALTER TABLE `qrcode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `guest`
--
ALTER TABLE `guest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_peg` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=264;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
