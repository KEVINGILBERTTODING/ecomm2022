<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Page extends MY_Controller
{
	public function home()
	{
		// function render_backend tersebut dari file core/MY_Controller.php
		$this->render_backend('home'); // load view home.php
	}
	public function berita()
	{
		// function render_backend tersebut dari file core/MY_Controller.php
		$this->render_backend('berita'); // load view berita.php
	}
	public function pengguna()
	{
		// Panggil fungsi authenticated yg ada pada core/MY_Controller.php
		$this->authenticated();
		if ($this->session->userdata('role') != 'admin') // Jika user yg login bukan admin
			show_404(); // Redirect ke halaman 404 Not found
		// function render_backend tersebut dari file core/MY_Controller.php
		$this->render_backend('pengguna'); // load view pengguna.php
	}
	public function kontak()
	{
		// function render_backend tersebut dari file core/MY_Controller.php
		$this->render_backend('kontak'); // load view kontak.php
	}
}
