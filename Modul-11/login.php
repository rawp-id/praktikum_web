<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulir Login</title>
</head>
<body>
    <h1>Formulir Login</h1>

    <form action="aksi_login.php?op=in" method="post">
        <table>
            <tr>
                <td><label for="username">Username:</label></td>
                <td><input type="text" id="username" name="username" required></td>
            </tr>
            <tr>
                <td><label for="password">Kata Sandi:</label></td>
                <td><input type="password" id="password" name="password" required></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Login"></td>
            </tr>
            <tr>
                <td></td>
                <td><a href="register.php">Belum punya akun? Daftar di sini.</a></td>
            </tr>
        </table>
    </form>
</body>
</html>
