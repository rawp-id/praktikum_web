<?php
session_start();
include
    "../connection.php";
$id = $_GET['id'];
$sql = "DELETE from jenis_minuman where id_jenis='" . $id . "'";
$query = $koneksi->query($sql);
if ($query) {
    header('location: dt_minuman.php');
}