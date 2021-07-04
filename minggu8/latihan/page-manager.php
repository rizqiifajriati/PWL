<?php
session_start();
//cek apakah user sudah login
if(!isset($_SESSION['username'])){
    die("Anda belum login");//jika belum login jangan lanjut
}
//cek level user
if($_SESSION['hak']!="2"){
    die("Anda bukan Operator");//jika bukan admin jangan lanjut
}
?>
<html dir="ltr" lang="en-US">
<head>
	<title>Selamat Datang Operator</title>
	<style type="text/css" media="screen">
		a:link{color: #000}
	</style>
</head>
<body>
<div align="center">
	<p><b>PAGE OPERATOR</b></p></br />
	<table style="border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; width: 50%;">
		<tbody>
		<tr bgcolor="#dd4814" height="40">
			<td style="width: 40%;"><center><b>Selamat Datang Operator</b></center></td>
			<td style="width: 40%;"><center><b><?php echo $_SESSION['nama'];?></b></center></td>
			<td style="width: 20%;"><center><b><a href="crud/index.php">Lanjut</a></b></center></td>
			<td style="width: 20%;"><center><b><a href="act-logout.php">Logout</a></b></center></td>
		</tr>
	</table>
	<br /><font size="5" color="blue">Anda Berhasil Login!</font><br><br>
</div>
</body>
</html>