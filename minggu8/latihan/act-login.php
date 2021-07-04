<?php
session_start();
include "koneksi-tutor.php";
$username = $_POST['username'];
$password = $_POST['password'];
$op = $_GET['op'];

if($op=="in"){
    $sql = mysql_query("SELECT * FROM tb_user WHERE username='$username' AND password='$password'");
    if(mysql_num_rows($sql)==1){//jika berhasil akan bernilai 1
        $qry = mysql_fetch_array($sql);
        $_SESSION['username'] = $qry['username'];
		$_SESSION['nama'] = $qry['nama'];
        $_SESSION['hak'] = $qry['hak'];
        if($qry['hak']=="1"){
            header("location:page-admin.php");
        }
		else if($qry['hak']=="2"){
            header("location:page-manager.php");
        }
    }else{
		?>
		<script language="JavaScript">
			alert('Username atau Password tidak sesuai. Silahkan diulang kembali!');
			document.location='login-multiuser-php-mysql.php';
		</script>
		<?php
    }
}else if($op=="out"){
    unset($_SESSION['username']);
    unset($_SESSION['hak']);
    header("location:login-multiuser-php-mysql.php");
}
?>
