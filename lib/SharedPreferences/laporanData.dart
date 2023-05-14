import 'package:shared_preferences/shared_preferences.dart';

class laporanData {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
 
 Future<void> addLapor(int idLaporan, String statusRiwayat,
  String kategoriLaporan,String tanggal, String deskripsi, String imgUrl, String alamat) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setInt('idLaporan', int.parse(idLaporan.toString()));
    await prefs.setString('status_riwayat', statusRiwayat);
    await prefs.setString('kategori_laporan', kategoriLaporan);
    await prefs.setString('tanggal', tanggal);
    await prefs.setString('deskripsi', deskripsi);
    await prefs.setString('image_url',imgUrl );
    await prefs.setString('alamat', alamat);
  }
  
  Future<String> getIdLap() async {
    return _prefs.then((SharedPreferences pref) {
      return pref.getString('idLaporan') ?? '';
    });
  }
  Future<String> getStatus() async {
    return _prefs.then((SharedPreferences pref) {
      return pref.getString('status_riwayat') ?? '';
    });
  }
  Future<String> getKat() async {
    return _prefs.then((SharedPreferences pref) {
      return pref.getString('kategori_laporan') ?? '';
    });
  }
  Future<String> getTanggal() async {
    return _prefs.then((SharedPreferences pref) {
      return pref.getString('tanggal') ?? '';
    });
  }
  Future<String> getDeskripsi() async {
    return _prefs.then((SharedPreferences pref) {
      return pref.getString('deskripsi') ?? '';
    });
  }
  Future<String> getImage() async {
    return _prefs.then((SharedPreferences pref) {
      return pref.getString('image_url') ?? '';
    });
  }
  Future<String> getAlamat() async {
    return _prefs.then((SharedPreferences pref) {
      return pref.getString('alamat') ?? '';
    });
  }
}
