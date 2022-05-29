<html>

<head>
	<title>GET DATA with AJAX</title>
	<script>
		var baseurl = "<?php echo base_url("index.php/"); ?>"; // Buat variabel baseurl untuk nanti di akses pada file config.js 
	</script>
	<script src="<?php echo base_url("js/jquery.min.js"); ?>"></script> <!-- Load library jquery -->
	<script src="<?php echo base_url("js/config.js"); ?>"></script> <!-- Load file process.js -->
</head>

<body>
	<h1>FORM SISWA</h1>
	<hr>
	<form>
		<table>
			<tr>
				<td>NIS</td>
				<td>:</td>
				<td><input type="text" name="nis" id="nis"> <button type="button" id="btn-search">Cari</button> <span id="loading">LOADING...</span></td>
			</tr>
			<tr>
				<td>Nama</td>
				<td>:</td>
				<td><input type="text" name="nama" id="nama"></td>
			</tr>
			<tr>
				<td>Jenis Kelamin</td>
				<td>:</td>
				<td><input type="text" name="jenis_kelamin" id="jenis_kelamin"></td>
			</tr>
			<tr>
				<td>Telepon</td>
				<td>:</td>
				<td><input type="text" name="telepon" id="telepon"></td>
			</tr>
			<tr>
				<td>Alamat</td>
				<td>:</td>
				<td><input type="text" name="alamat" id="alamat"></td>
			</tr>
		</table>
	</form>
</body>

</html>
