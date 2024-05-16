<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulir Registrasi</title>
</head>

<body>
    <h1>Formulir Registrasi</h1>

    <form action="aksi_register.php" method="post">
        <table>
            <tr>
                <td><label for="nama_pengguna">Username:</label></td>
                <td><input type="text" id="nama_pengguna" name="username" required></td>
            </tr>
            <tr>
                <td><label for="kata_sandi">Kata Sandi:</label></td>
                <td><input type="password" id="kata_sandi" name="password" required></td>
            </tr>
            <tr>
                <td><label for="level">Level:</label></td>
                <td>
                    <select id="level" name="level" required>
                        <option value="Admin">Admin</option>
                        <option value="Kasir">Kasir</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label for="email">Email:</label></td>
                <td><input type="email" id="email" name="email" required></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" name="reister" value="Register"></td>
            </tr>
        </table>
    </form>
    <p>Sudah punya akun?<a href="login.php">Masuk di sini.</a></p>
</body>

</html>