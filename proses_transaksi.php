<?php
require 'koneksi.php';

$nama_barang = $_POST['nama_barang'];
$jumlah = $_POST['jumlah'];
$harga = $_POST['harga'];

mysqli_query($conn, "INSERT INTO tbl_transaksi (nama_barang, jumlah, harga) VALUES ('$nama_barang', '$jumlah', '$harga')");

header("Location: transaksi.php");
exit;
?>
