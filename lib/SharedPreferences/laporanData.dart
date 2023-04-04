import 'package:shared_preferences/shared_preferences.dart';

class laporanData {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  
  Future<String> getIdLap() async {
    return _prefs.then((SharedPreferences pref) {
      return pref.getString('id_lap') ?? '';
    });
  }
}
