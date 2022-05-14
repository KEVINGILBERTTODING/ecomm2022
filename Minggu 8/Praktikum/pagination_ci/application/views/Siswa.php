<html>

<head>
	<title>PAGINATION | CODEIGNITER 3</title>
	<!-- LOAD FILE CSS BOOTSTRAP -->
	<link rel="stylesheet" href="<?php echo base_url("css/bootstrap.min.css"); ?>">
</head>

<body>
	<div class="container">
		<h1>Data Siswa</h1>
		<hr>
		<div class="table-responsive">
			<table class="table table-bordered">
				<tr>
					<th>NIS</th>
					<th>Nama</th>
					<th>Jenis Kelamin</th>
					<th>Telepon</th>
					<th>Alamat</th>
				</tr> <?php if (!empty($model['siswa'])) { // Jika data pada database tidak sama dengan empty (alias ada datanya) 
							foreach ($model['siswa'] as $data) { // Lakukan looping pada variabel siswa dari controller 
								echo "<tr>";
								echo "<td>" . $data->nis . "</td>";
								echo "<td>" . $data->nama . "</td>";
								echo "<td>" . $data->jenis_kelamin . "</td>";
								echo "<td>" . $data->telp . "</td>";
								echo "<td>" . $data->alamat . "</td>";
								echo "</tr>";
							}
						} else { // Jika data tidak ada 
							echo "<tr><td colspan='5'>Data tidak ada</td></tr>";
						} ?>
			</table>
		</div> <?php // Tampilkan link-link paginationnya echo $model['pagination']; 
				?>
	</div>
</body>

</html>
