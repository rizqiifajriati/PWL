<!DOCTYPE html>
<html><head>
	<title></title>
</head><body>
<center><b> DATA PENDAFTAR<br/><br/><br/><br/> </b></center>


	<table border="1" cellpadding="10"> 
		
		<tr>
			<th>NO &nbsp;&nbsp;&nbsp;</th>

			 <th>ID CARD &nbsp;&nbsp;&nbsp; </th>

			<th>NAMA &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>

			<th>PEKERJAAN &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
			
			<th>NO.TELP/HP &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
			
			<th>REKOMENDASI &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
			
			<th>KEPERLUAN &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
		</tr>



		<?php 
		$no= 1;
		foreach ($tamu as $gst):?>

			<tr>
			<td><?php echo $no++ ?></td>
			<td><?php echo $gst->id_card ?></td>
			<td><?php echo $gst->nama ?>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td><?php echo $gst->instansi ?></td>
			<td><?php echo $gst->telp ?></td>
			<td><?php echo $gst->person ?>&nbsp;&nbsp;&nbsp;</td>
			<td><?php echo $gst->keperluan ?></td>

			</tr>
		 <?php endforeach; ?>
	</table>

</body></html>