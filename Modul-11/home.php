<?php
session_start();
include "connection.php";
error_reporting(E_ALL ^ (E_NOTICE | E_WARNING));
if (!isset($_SESSION['username'])) {
    die("Anda belum login");
}
$user = $_SESSION['username'];
$sql = "SELECT * from register where username='$user'";
$query = $koneksi->query($sql);
$data = $query->fetch_array();
?>
Selamat Datang <?php echo $user; ?></br>
<?php
if ($data['level'] == 'Admin') {
    ?>
    <a href='admin/dt_minuman.php'>Data Minuman</a> | <a href='admin/dt_jenis.php'>Data Jenis
        Minuman</a> | <a href='logout.php'>Logout</a>
    <?php
} elseif ($data['level'] == 'Kasir') {
    ?>
    <a href='kasir/form_jualbeli.php?jenis=Jual'>Jual Barang</a> | <a href='kasir/form_jualbeli.php?jenis=Beli'>Beli
        Barang</a> | <a href='kasir/form_cari.php'>Cari
        Barang</a> |<a href='logout.php'>Logout</a>
    <?php
}
?>
<table border="1">
    <tr>
        <td>Username</td>
        <td><?php echo $data['username']; ?></td>
    </tr>
    <tr>
        <td>Password</td>
        <td><?php echo $data['password']; ?></td>
    </tr>
    <tr>
        <td>Level</td>
        <td><?php echo $data['level']; ?></td>
    </tr>
    <tr>
        <td>Email</td>
        <td><?php echo $data['email']; ?></td>
    </tr>
</table>