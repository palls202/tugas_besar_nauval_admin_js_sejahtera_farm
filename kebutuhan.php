<?php
include "koneksi.php";

$tanggal     = $_POST['tanggal'];
$nama        = $_POST['nama_kebutuhan'];
$biaya       = $_POST['biaya'];
$keterangan  = $_POST['keterangan'];

$sql = "INSERT INTO kebutuhan (tanggal, nama_kebutuhan, biaya, keterangan)
        VALUES ('$tanggal', '$nama', '$biaya', '$keterangan')";

echo mysqli_query($conn, $sql) ? "OK" : "ERROR";
?>
