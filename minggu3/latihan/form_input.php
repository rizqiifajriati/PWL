<html>
<head>
<title> Inputan Data Mahasiswa </title>
</head>
<body>
<table align="center" border="1">
<form method="post" action="hasil_input.php">
<h3 align="center"><blink>Input Nilai Mahasiswa</blink></h3>
<tr>
<td>NIM</td>
<td><input type="text" name="tnim"></td>
</tr>
<tr>
<td>Program Studi</td>
<td><select name="program_studi">
<option value>Pilih Jurusan</option>
<option value="Teknik Informatika S1">A11 (TI)</option>
<option value="Sistem Informasi S1">A12 (SI)</option>
<option value="Teknik Informatika D3">A22 (DTI)</option>
</select></td>
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
</form>
</td>
</tr>
</table>
</form>
</body>
</html>