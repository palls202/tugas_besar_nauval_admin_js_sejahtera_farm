<?php
header("Content-Type: application/json");

// Koneksi database
$conn = new mysqli("localhost", "root", "", "db_users");

if ($conn->connect_error) {
    echo json_encode(["status" => "error", "message" => "Koneksi gagal"]);
    exit;
}

$sql = "SELECT id, tanggal, hari, jam, jenis_layanan, pemasukan, pengeluaran 
        FROM laporan_transaksi 
        ORDER BY tanggal DESC";

$result = $conn->query($sql);

$data = [];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
}

echo json_encode(["status" => "success", "data" => $data]);
$conn->close();
?>
