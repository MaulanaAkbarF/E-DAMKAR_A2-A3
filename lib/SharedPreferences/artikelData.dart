import 'package:shared_preferences/shared_preferences.dart';

class artikelData {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

   Future<void> addBerita(int? idBerita, String adminDamkar, String fotoBerita,
      String judulBerita, String deskripsiBerita, String tanggalBerita) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setInt('id_berita', int.parse(idBerita.toString()));
    await prefs.setString('admin_damkar', adminDamkar);
    await prefs.setString('foto_berita', fotoBerita);
    await prefs.setString('judul_berita', judulBerita);
    await prefs.setString('deskripsi_berita', deskripsiBerita);
    await prefs.setString('tanggal_berita', tanggalBerita);
  }
  Future<String> getIdBerita() async {
    return _prefs.then((SharedPreferences pref) {
      return pref.getString('id_berita') ?? '';
    });
  }
}
