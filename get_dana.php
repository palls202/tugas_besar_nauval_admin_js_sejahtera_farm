<?php
header('Content-Type: application/json');

// Koneksi database
$conn = new mysqli("localhost","root","","db_users");
if($conn->connect_error){
    echo json_encode(['error'=>'Koneksi database gagal']);
    exit;
}

// Ambil semua saldo dana
$result = $conn->query("SELECT kategori, total FROM dana");

// Tambahkan hargamodal tanpa merubah struktur
$data = [
    'uangcash'=>0,
    'hutang'=>0,
    'bank'=>0,
    'hargamodal'=>0
];

while($row = $result->fetch_assoc()){
    $data[$row['kategori']] = $row['total'];
}

echo json_encode($data);
$conn->close();
?>
