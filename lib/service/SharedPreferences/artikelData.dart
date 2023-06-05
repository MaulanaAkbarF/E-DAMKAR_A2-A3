import 'package:shared_preferences/shared_preferences.dart';

class artikelData {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> addArtikel(
      String jenisArtikel,
      int? id,
      String adminDamkar,
      String foto,
      String judul,
      String deskripsi,
      String tanggal) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('jenis_artikel', jenisArtikel);
    await prefs.setInt('id', int.parse(id.toString()));
    await prefs.setString('admin_damkar', adminDamkar);
    await prefs.setString('foto', foto);
    await prefs.setString('judul', judul);
    await prefs.setString('deskripsi', deskripsi);
    await prefs.setString('tanggal', tanggal);
  }

  Future<String> getIdBerita() async {
    return _prefs.then((SharedPreferences pref) {
      return pref.getString('id_berita') ?? '';
    });
  }

  Future<String> getJenisArtikel() async {
    return _prefs.then((SharedPreferences pref) {
      return pref.getString('jenis_artikel') ?? '';
    });
  }

  
}
