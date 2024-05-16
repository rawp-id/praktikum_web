<a href='../home.php'>Home</a> | <a href='logout.php'>Logout</a></br><a href='form_minuman.php'>tambah</a>
<?php
session_start();
include "../connection.php";
error_reporting(E_ALL ^ (E_NOTICE | E_WARNING));
if (!isset($_SESSION['username'])) {
    die("Anda belum login");
}
$no = 1;
$query = "SELECT * FROM minuman,jenis_minuman where minuman.id_jenis=jenis_minuman.id_jenis";
$dt_query = $koneksi->query($query);
?>
<table border="1">
    <thead>
        <tr>
            <th>#</th>
            <th>Jenis Minuman </th>
            <th>Merek </th>

            <th>Harga </th>
            <th>Ukuran </th>
            <th>Jumlah Stok</th>
        </tr>
    </thead>
    <tbody>
        <?php
        while ($dt_minuman = $dt_query->fetch_array()) {
            ?>
            <tr>
                <td><?php echo $no++; ?></td>
                <td><?php echo $dt_minuman['nm_jenis']; ?></td>
                <td><?php echo $dt_minuman['merek']; ?></td>
                <td><?php echo $dt_minuman['harga']; ?></td>
                <td><?php echo $dt_minuman['ukuran']; ?></td>
                <td><?php echo $dt_minuman['jumlah']; ?></td>
                <td><a href=''>update</a></td>
            </tr>
            <?php
        }
        ?>
    </tbody>
</table>