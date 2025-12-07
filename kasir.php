<?php
// ===============================
// KONFIGURASI DATABASE
// ===============================
$servername = "localhost";
$username   = "root";
$password   = "";
$database   = "db_users";

$conn = mysqli_connect($servername, $username, $password, $database);
if (!$conn) {
    die(json_encode(["status"=>"error","message"=>"Koneksi gagal: " . mysqli_connect_error()]));
}

// =====================================
// PROSES INPUT TRANSAKSI
// =====================================
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    // Ambil data POST, aman default
    $tanggal     = $_POST['tanggal'] ?? date('Y-m-d H:i:s');
    $layanan     = $_POST['layanan'] ?? '';
    $harga_modal = floatval($_POST['harga_modal'] ?? 0);
    $harga_jual  = floatval($_POST['harga_jual'] ?? 0);
    $pembayaran  = $_POST['pembayaran'] ?? ''; // uangcash/hutang/bank
    $keterangan  = $_POST['keterangan'] ?? '';

    // Cek kategori valid pembayaran
    $validKategori = ["uangcash", "hutang", "bank"];
    if (!in_array($pembayaran, $validKategori)) {
        echo json_encode(["status"=>"error","message"=>"Kategori pembayaran tidak valid"]);
        exit;
    }

    // ===============================
    // Masukkan transaksi
    // ===============================
    $stmt = $conn->prepare("
        INSERT INTO transaksi (tanggal, layanan, harga_modal, harga_jual, pembayaran, keterangan)
        VALUES (?, ?, ?, ?, ?, ?)
    ");
    $stmt->bind_param("ssddss", $tanggal, $layanan, $harga_modal, $harga_jual, $pembayaran, $keterangan);

    if (!$stmt->execute()) {
        echo json_encode(["status"=>"error","message"=>"Gagal menyimpan transaksi: " . $stmt->error]);
        $stmt->close();
        $conn->close();
        exit;
    }

    // ===============================
    // Update dana pembayaran
    // ===============================
    $stmt2 = $conn->prepare("UPDATE dana SET total = total + ? WHERE kategori = ?");
    $stmt2->bind_param("ds", $harga_jual, $pembayaran);

    if (!$stmt2->execute()) {
        echo json_encode(["status"=>"error","message"=>"Gagal update dana: " . $stmt2->error]);
        $stmt2->close();
        $stmt->close();
        $conn->close();
        exit;
    }

    // ===============================
    // Update harga_modal
    // ===============================
    $stmt3 = $conn->prepare("UPDATE dana SET total = total + ? WHERE kategori = 'hargamodal'");
    $stmt3->bind_param("d", $harga_modal);
    $stmt3->execute();
    $stmt3->close();

    $stmt->close();
    $stmt2->close();
    $conn->close();

    echo json_encode(["status"=>"success","message"=>"Transaksi dan dana berhasil diperbarui"]);
    exit;
}

// Jika bukan POST
echo json_encode(["status"=>"error","message"=>"Metode request harus POST"]);
exit;
?>
