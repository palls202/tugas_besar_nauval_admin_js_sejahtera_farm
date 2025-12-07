<?php
include "koneksi.php";

$start = isset($_GET['start']) ? $_GET['start'] : "";
$end   = isset($_GET['end']) ? $_GET['end'] : "";

if ($start != "" && $end != "") {
    $query = mysqli_query($koneksi, 
        "SELECT * FROM kebutuhan 
         WHERE DATE(tanggal) BETWEEN '$start' AND '$end'
         ORDER BY tanggal DESC");
} else {
    $query = mysqli_query($koneksi, 
        "SELECT * FROM kebutuhan ORDER BY tanggal DESC");
}

$data = [];
while($row = mysqli_fetch_assoc($query)){
    $data[] = $row;
}

echo json_encode($data);
