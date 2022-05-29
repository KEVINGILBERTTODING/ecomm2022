function search(){ $("#loading").show(); // Tampilkan loadingnya 
$.ajax({ type: "POST", // Method pengiriman data bisa dengan GET atau POST 
url: baseurl + "form/search", // Isi dengan url/path file php yang dituju 
data: {nis : $("#nis").val()}, // data yang akan dikirim ke file proses d
ataType: "json", beforeSend: function(e) { if(e && e.overrideMimeType) { e.overrideMimeType("application/json;charset=UTF-8"); } }, success: function(response){ // Ketika proses pengiriman berhasil 
	$("#loading").hide(); // Sembunyikan loadingnya 
	if(response.status == "success"){ // Jika isi dari array status adalah success 
		$("#nama").val(response.nama); // set textbox dengan id nama 
		$("#jenis_kelamin").val(response.jenis_kelamin); // set textbox dengan id jenis kelamin 
		$("#telepon").val(response.telepon); // set textbox dengan id telepon 
		$("#alamat").val(response.alamat); // set textbox dengan id alamat 
	}else{ // Jika isi dari array status adalah failed 
		alert("Data Tidak Ditemukan"); } }, error: function (xhr, ajaxOptions, thrownError) { // Ketika ada error 
			alert(xhr.responseText); } }); }

			$(document).ready(function(){ $("#loading").hide(); // Sembunyikan loadingnya 
			$("#btn-search").click(function(){ // Ketika user mengklik tombol Cari 
				search(); // Panggil function search 
			}); $("#nis").keyup(function(){ // Ketika user menekan tombol di keyboard 
				if(event.keyCode == 13){ // Jika user menekan tombol ENTER 
					search(); // Panggil function search 
				} }); });
