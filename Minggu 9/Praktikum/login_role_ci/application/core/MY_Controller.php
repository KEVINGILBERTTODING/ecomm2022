<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
class MY_Controller extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->authenticated(); // Panggil fungsi authenticated 
	}
	public function authenticated()
	{ // Fungsi ini berguna untuk mengecek apakah user sudah login atau belum // Pertama kita cek dulu apakah controller saat ini yang sedang diakses user adalah controller Auth apa bukan 
		// Karena fungsi cek login hanya kita berlakukan untuk controller selain controller Auth 
		if ($this->uri->segment(1) != 'auth' && $this->uri->segment(1) != '') { // Cek apakah terdapat session dengan nama authenticated 
			if (!$this->session->userdata('authenticated')) // Jika tidak ada / artinya belum login 
				redirect('auth'); // Redirect ke halaman login 
		}
	}
	public function render_login($content, $data = NULL)
	{ /* * $data['contentnya'] * variabel diatas ^ nantinya akan dikirim ke file views/template/login/index.php * */
		$data['contentnya'] = $this->load->view($content, $data, TRUE);
		$this->load->view('template/login/index', $data);
	}
	public function render_backend($content, $data = NULL)
	{ /* * $data['headernya'] , $data['contentnya'] * variabel diatas ^ nantinya akan dikirim ke file views/template/backend/index.php * */
		$data['headernya'] = $this->load->view('template/backend/header', $data, TRUE);
		$data['contentnya'] = $this->load->view($content, $data, TRUE);
		$this->load->view('template/backend/index', $data);
	}
}
