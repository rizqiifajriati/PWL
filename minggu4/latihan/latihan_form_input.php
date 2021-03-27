<html>
<head>
<title> Inputan Data Mahasiswa </title>
</head>
<body>
<table align="center" border="5">
<form method="post" action="latihan_input.php">
<h3 align="center"><blink>Input Nilai Mahasiswa</blink></h3>
<tr>
<td>NIM</td>
<td><input type="text" name="tnim"></td>
</tr>
<tr>
<td>Nilai TUGAS</td>
<td><input type="text" name="ttugas"></td>
</tr>
<tr>
<td>Nilai UTS</td>
<td><input type="text" name="tuts"></td>
</tr>
<tr>
<td>Nilai UAS</td>
<td><input type="text" name="tuas"></td>
</tr>
<tr>
<td> Catatan Khusus</td>
<td>
<input type="checkbox" name="khdr" value="Kehadiran >=70% "> Kehadiran >= 70%<br>
<input type="checkbox" name="inter" value="Interaktif Dikelas"> Interaktif Dikelas<br>
<input type="checkbox" name="tdtugas" value="Tidak Terlambat Mengumpulkan Tugas"> Tidak Terlambat Mengumpulkan Tugas
</td>
</tr>
<tr>
<td>
<input type="submit" name="proses" value="submit"/>
<input type="reset" name="Reset" value="Reset"/>
</td>
</tr>
</form>
</table>
</body>
</body>
</html>