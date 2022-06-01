<?php defined('BASEPATH') or exit('No direct script access allowed');
class Siswa extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('SiswaModel');
	}
	public function index()
	{
		$data['siswa'] = $this->SiswaModel->view();
		$this->load->view('index', $data);
	}
	public function search()
	{ // Ambil data NIS yang dikirim via ajax post 
		$keyword = $this->input->post('keyword');
		$siswa = $this->SiswaModel->search($keyword); // Kita load file view.php sambil mengirim data siswa hasil query function search di SiswaModel 
		$hasil = $this->load->view('view', array('siswa' => $siswa), true); // Buat sebuah array 
		$callback = array(
			'hasil' => $hasil, // Set array hasil dengan isi dari view.php yang diload tadi 
		);
		echo json_encode($callback); // konversi varibael $callback menjadi JSON 
	}
}
