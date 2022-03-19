<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<!DOCTYPE html>

<head>
	<meta charset="UTF-8">
	<title>Dashboard | Tutorial Simple Login Register CodeIgniter </title>
</head>

<body>
	<h3>Dashboard</h3>
	<p> Selamat datang di halaman dashboard, <?php echo ucfirst($this->session->userdata('username')); ?>! Untuk logout dari sistem, silakan klik <?php echo anchor('login/logout', 'di sini...'); ?> </p>
</body>

</html>
