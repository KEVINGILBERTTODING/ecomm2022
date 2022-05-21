<?php // Cek role user 
if ($this->session->userdata('role') == 'admin') { // Jika role-nya admin 
?>
	<div class="pull-right">
		<a href="" class="btn btn-success">TAMBAH DATA</a>
	</div>
<?php } ?>
<h2 style="margin-top: 0;margin-bottom: 0;">Berita</h2>
<div class="clearfix"></div>
<hr />
<div class="table-responsive">
	<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<th>No</th>
				<th>Judul</th>
				<th>Deskripsi</th>
				<th>Tanggal</th>
				<th style="width: 80px;">Aksi</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td>Lorem ipsum dolor sit consectetur adipiscing elit</td>
				<td>Duis arcu augue, tincidunt id posuere suscipit, aliquam a libero. Cras varius neque quis odio varius commodo. Nullam in tellus gravida, porttitor tortor nec, bibendum nisi...</td>
				<td>12 Januari 2019</td>
				<td> <a href="" class="btn btn-default btn-xs"><i class="glyphicon glyphicon-pencil"></i></a> <a href="" class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-trash"></i></a> </td>
			</tr>
			<tr>
				<td>2</td>
				<td>Lorem ipsum dolor sit consectetur adipiscing elit</td>
				<td>Duis arcu augue, tincidunt id posuere suscipit, aliquam a libero. Cras varius neque quis odio varius commodo. Nullam in tellus gravida, porttitor tortor nec, bibendum nisi...</td>
				<td>12 Januari 2019</td>
				<td> <a href="" class="btn btn-default btn-xs"><i class="glyphicon glyphicon-pencil"></i></a> <a href="" class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-trash"></i></a> </td>
			</tr>
			<tr>
				<td>3</td>
				<td>Lorem ipsum dolor sit consectetur adipiscing elit</td>
				<td>Duis arcu augue, tincidunt id posuere suscipit, aliquam a libero. Cras varius neque quis odio varius commodo. Nullam in tellus gravida, porttitor tortor nec, bibendum nisi...</td>
				<td>12 Januari 2019</td>
				<td> <a href="" class="btn btn-default btn-xs"><i class="glyphicon glyphicon-pencil"></i></a> <a href="" class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-trash"></i></a> </td>
			</tr>
		</tbody>
	</table>
</div>
