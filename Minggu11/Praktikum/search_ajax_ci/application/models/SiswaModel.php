<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
class SiswaModel extends CI_Model
{
	public function view()
	{
		return $this->db->get('siswa')->result(); // Tampilkan semua data yang ada di tabel siswa 
	}
	public function search($keyword)
	{
		$this->db->like('nis', $keyword);
		$this->db->or_like('nama', $keyword);
		$this->db->or_like('jenis_kelamin', $keyword);
		$this->db->or_like('telp', $keyword);
		$this->db->or_like('alamat', $keyword);
		$result = $this->db->get('siswa')->result(); // Tampilkan data siswa berdasarkan keyword 
		return $result;
	}
}
