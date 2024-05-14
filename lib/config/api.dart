class Api {
  static const _host = "http://localhost/api_if22a";

  static String _mahasiswa = "$_host/mahasiswa";

  // Mahasiswa
  static String getMahasiswa = "$_mahasiswa/view.php";
  static String addMahasiswa = "$_mahasiswa/add.php";
  static String deleteMahasiswa = "$_mahasiswa/delete.php";
  static String updateMahasiswa = "$_mahasiswa/update.php";
}