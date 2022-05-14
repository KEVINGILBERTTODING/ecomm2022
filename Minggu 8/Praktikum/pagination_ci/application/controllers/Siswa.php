<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
class Siswa extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('SiswaModel'); // Load SiswaModel yang ada di folder models 
	}
	public function index()
	{
		redirect("siswa/lists"); // Untuk redirect ke function lists 
	}
	public function lists()
	{
		$data['model'] = $this->SiswaModel->view(); // Panggil fungsi view() yang ada di model siswa 
		$this->load->view('siswa', $data);
	}
}
