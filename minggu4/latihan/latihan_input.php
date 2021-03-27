<html>
<head>
<title> Inputan Data Mahasiswa </title>
</head>
<body>
<h3 align="center"><blink>Hasil Akhir Nilai</blink></h3>
<table align="center" border="5">

<?php
error_reporting(0) ;
$nim = $_POST['tnim'];
$ps= $_POST['program_studi'];
$tugas= $_POST['ttugas'];
$uts= $_POST['tuts'];
$uas= $_POST['tuas'];
$khdr= $_POST['khdr'];
$inter= $_POST['inter'];
$tdtugas= $_POST['tdtugas'];
?>

<?php
$na=(0.40*$tugas)+(0.30*$uts)+(0.30*$uas);
if ($na <= 1)
{
$na = '';
}
?>

<?php

if ($na <= 0)
{
$nh = '' ;
}
else if ($na <= 40 )
{
$nh = 'E' ;
}
else if ($na <= 50 )
{
$nh = 'D' ;
}

else if ($na <= 70 )
{
$nh = 'C' ;
}
else if ($na <= 80 )
{
$nh = 'B' ;
}
else
{
$nh = 'A' ;
}
?>

<?php

if ($na <= 0)
{
$stat = '' ;
}
else if ($na < 60 )
{
$stat = 'TIDAK LULUS' ;
}
else if ($na < 101 )
{
$stat = 'LULUS' ;
}
else
{
$stat = 'INVALID' ;
}
?>

<?php
if (isset($_POST['proses'])) {
$nim = $_POST['tnim'];
$a = substr ($nim, 1, 2);
switch ($a) {
case '11' : $ps = "Teknik Informatika S1";
break;
case '12' : $ps = "Sistem Informasi S1";
break;
case '22' : $ps = "Teknik Informatika D3";
break;
default : $ps = "Salah jurusan";
    }
}
?>


<tr>
<th>Program Studi</th>
<th>NIM</th>
<th>Nilai Angka</th>
<th>Nilai Huruf</th>
<th>STATUS</th>
<th>Catatan Khusus</th>
</tr>
<tr>
<td align="center"><?php echo$ps; ?></td>
<td align="center"><?php echo$nim;?></td>
<td align="center"><?php echo$na;?></td>
<td align="center"><?php echo$nh;?></td>
<td align="center"><?php echo$stat;?></td>
<td align="center">
<?php echo$khdr;?><br>
<?php echo$inter;?><br>
<?php echo$tdtugas;?>
</td>
</tr>
</table>
</body>
</html>