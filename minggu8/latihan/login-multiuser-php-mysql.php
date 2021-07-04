<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
	<title>Halaman Login</title>
	<style type="text/css" media="screen">
		table {font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 11px;}
		input {font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 11px;height: 20px;}
		a:link{color: #000}
	</style>
</head>
<body>
<center><div id="content-inner-login">
	<form action="act-login.php?op=in" method="POST"> 
		<table cellpadding="0" cellspacing="5" bgcolor="#B0C4DE" width="50%">
			<tr height="36" bgcolor="#F8F8FF">
				<th colspan="5">Login Your Authorization:</th>
			</tr>
			<tr>
				<td>
					<table width="100%">
						<tr><br />
							<td><img src="../../images/login.jpg" width="100" height="100" /></td>
							<td style="vertical-align: top">
							Username : <input type="text" name="username" size="40"/><br />
							Password &nbsp;: <input type="password" name="password" size="40"/><br /><br />
							<input style="float:left" type="submit" value="LOGIN" /><br /></td>
						</tr>
						<tr height="10">
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form><br />
	<table style="border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; width: 50%;">
		<tbody>
		<tr bgcolor="#dd4814" height="40">
			<td style="width: 25%;"><center><b>Username</b></center></td>
			<td style="width: 25%;"><center><b>Nama</b></center></td>
			<td style="width: 25%;"><center><b>Password</b></center></td>
			<td style="width: 25%;"><center><b>Hak Akses</b></center></td>
		</tr>
		<tr bgcolor="#CCD6E0" height="32">
			<td style="width: 25%;"><center>admin</center></td>
			<td style="width: 25%;"><center>Abu Salam</center></td>
			<td style="width: 25%;"><center>admin</center></td>
			<td style="width: 25%;"><center>(1)admin</center></td>
		</tr>
		<tr bgcolor="#F0F0F0" height="32">
			<td style="width: 25%;"><center>operator</center></td>
			<td style="width: 25%;"><center>Alif Fadhil Wibowo</center></td>
			<td style="width: 25%;"><center>operator</center></td>
			<td style="width: 25%;"><center>(2)operator</center></td>
		</tr>
	</table>
</div></center>
</body>
</html>