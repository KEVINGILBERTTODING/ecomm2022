<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="">
	<meta name="author" content="">
	<title>Komang.My.ID Shop Online</title>
	<link href="<?php echo base_url() ?>assets/bootstrap/css/bootstrap.min.css" rel="stylesheet"> <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<link href="<?php echo base_url() ?>assets/asie/css/ie10-viewport-bug-workaround.css" rel="stylesheet"> <!-- Custom styles for this template -->
	<link href="<?php echo base_url() ?>assets/custom.css" rel="stylesheet">
	<link href="<?php echo base_url() ?>assets/jquery/jquery-ui.css" rel="stylesheet"> <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
	<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
	<script src="<?php echo base_url() ?>assets/asie/js/ie-emulation-modes-warning.js"></script> <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]> <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script> <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script> <![endif]-->
</head>

<body>
	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-custom navbar-fixed-top">
		<div class="container">
			<div class="navbar-header"> <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span>
					< class="icon-bar"></span>
				</button> <a class="navbar-brand" href="#"><img src="<?php echo base_url() ?>assets/logos.png"></a> </div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="<?php echo base_url() ?>">Home</a></li>
					<li><a href="<?php echo base_url() ?>page/tentang"><i class="glyphicon glyphicon-user"></i> Tentang</a></li>
					<li><a href="<?php echo base_url() ?>page/cara_bayar"><i class="glyphicon glyphicon-briefcase"></i> Cara Bayar</a></li>
					<li><a href="<?php echo base_url() ?>shopping/tampil_cart"><i class="glyphicon glyphicon-shopping-cart"></i> Keranjang Belanja</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav> <!-- Begin page content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="list-group">
					<a class="list-group-item">
						<strong>KATEGORI</strong></a>
					<a href="<?php echo base_url() ?>shopping/index/" class="list-group-item">Semua</a>
					<?php foreach ($kategori as $row) { ?>
						<a href="<?php echo base_url() ?>shopping/index/<?php echo $row['id']; ?>" class="list-group-item"><?php echo $row['nama_kategori']; ?></a> <?php } ?>
				</div>
				<br>
				<div class="list-group">
					<a href="<?php echo base_url() ?>shopping/tampil_cart" class="list-group-item"><strong><i class="glyphicon glyphicon-shopping-cart"></i> KERANJANG BELANJA</strong></a>
					<?php $cart = $this->cart->contents(); // If cart is empty, this will show below message. 
					if (empty($cart)) { ?> <a class="list-group-item">Keranjang Belanja Kosong</a>
						<?php } else {
						$grand_total = 0;
						foreach ($cart as $item) {
							$grand_total += $item['subtotal']; ?>
							<a class="list-group-item"><?php echo $item['name']; ?> (<?php echo $item['qty']; ?> x <?php echo number_format($item['price'], 0, ",", "."); ?>)=<?php echo number_format($item['subtotal'], 0, ",", "."); ?></a> <?php } ?>
					<?php } ?>
				</div>
			</div> <!-- /.col-lg-3 -->
			<div class="col-lg-9">
				<div class="row">
