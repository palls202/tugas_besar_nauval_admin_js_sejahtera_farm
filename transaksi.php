<?php
session_start();
if(!isset($_SESSION['user'])) {
    header("Location: login.php");
    exit;
}

require 'koneksi.php'; // koneksi database
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Transaksi Digital</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<style>
    body { font-family: Arial, sans-serif; margin: 20px; }
    .box { padding: 20px; background-color: #591869; color: white; border-radius: 10px; }
    table { width: 100%; border-collapse: collapse; margin-top: 20px; }
    table, th, td { border: 1px solid white; }
    th, td { padding: 10px; text-align: center; }
    input, select, button { padding: 8px; margin: 5px; }
</style>
</head>
<body>

<div class="box">
    <h2 style="text-align:center;">Transaksi Digital</h2>

    <!-- Form Transaksi -->
    <form action="proses_transaksi.php" method="POST">
        <label>Nama Barang:</label>
        <input type="text" name="nama_barang" required>

        <label>Jumlah:</label>
        <input type="number" name="jumlah" min="1" required>

        <label>Harga Satuan:</label>
        <input type="number" name="harga" min="0" required>

        <button type="submit">Simpan Transaksi</button>
    </form>

    <!-- Tabel Transaksi -->
    <table>
        <tr>
            <th>No</th>
            <th>Nama Barang</th>
            <th>Jumlah</th>
            <th>Harga Satuan</th>
            <th>Total</th>
        </tr>

        <?php
        $query = mysqli_query($conn, "SELECT * FROM tbl_transaksi ORDER BY id DESC");
        $no = 1;
        while($row = mysqli_fetch_assoc($query)){
            echo "<tr>
                    <td>{$no}</td>
                    <td>{$row['nama_barang']}</td>
                    <td>{$row['jumlah']}</td>
                    <td>{$row['harga']}</td>
                    <td>".($row['jumlah'] * $row['harga'])."</td>
                  </tr>";
            $no++;
        }
        ?>
    </table>
</div>

</body>
</html>
