<table border="1" cellpadding="8">
	<tr>
		<th>NIS</th>
		<th>Nama</th>
		<th>Jenis Kelamin</th>
		<th>Telepon</th>
		<th>Alamat</th>
	</tr><?php
			if (!empty($siswa)) { // Jika data pada database tidak sama dengan empty (alias ada datanya)
				foreach ($siswa as $data) { // Lakukan looping pada variabel siswa dari controller
					echo "<tr>";
					echo "<td>" . $data->nis . "</td>";
					echo "<td>" . $data->nama . "</td>";
					echo "<td>" . $data->jenis_kelamin . "</td>";
					echo "<td>" . $data->telp . "</td>";
					echo "<td>" . $data->alamat . "</td>";
					echo "</tr>";
				}
			} else { // Jika data tidak ada
				echo "<tr><td colspan='4'>Data tidak ada</td></tr>";
			} ?>
</table>
