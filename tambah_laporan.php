<?php
include "koneksi.php";

$tanggal     = $_POST['tanggal'];
$hari        = $_POST['hari'];
$jam         = $_POST['jam'];
$jenis       = $_POST['jenis_layanan'];
$pemasukan   = $_POST['pemasukan'];
$pengeluaran = $_POST['pengeluaran'];

$sql = "INSERT INTO laporan_transaksi (tanggal, hari, jam, jenis_layanan, pemasukan, pengeluaran)
        VALUES ('$tanggal', '$hari', '$jam', '$jenis', '$pemasukan', '$pengeluaran')";

echo mysqli_query($conn, $sql) ? "OK" : "ERROR";
?>
