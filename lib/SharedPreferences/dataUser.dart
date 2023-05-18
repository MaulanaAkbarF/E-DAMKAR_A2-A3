import 'package:shared_preferences/shared_preferences.dart';

class DataUser {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> addUser(String? userid, String username, String nama,
      String noHp, String token, String gambar) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setInt('userId', int.parse(userid.toString()));
    await prefs.setString('username', username);
    await prefs.setString('nama', nama);
    await prefs.setString('noHp', noHp);
    await prefs.setString('token', token);
    await prefs.setString('gambar', gambar);
  }

  Future<void> udpateUser(String nama, String noHp, String gambar) async {
    final SharedPreferences pref = await _prefs;
    await pref.remove("nama");
    await pref.remove("noHp");
    await pref.remove("gambar");
    await pref.setString("nama", nama);
    await pref.setString("noHp", noHp);
    await pref.setString("gambar", gambar);
  }

  Future<int> getUserId() async {
    return _prefs.then((SharedPreferences pref) {
      return pref.getInt('userId') ?? 0;
    });
  }

  Future<String> getUsername() async {
    return _prefs.then((SharedPreferences pref) {
      return pref.getString('email') ?? '';
    });
  }

  Future<String> getGambar() async {
    return _prefs.then((SharedPreferences pref) {
      return pref.getString('gambar') ?? '';
    });
  }

  Future<String> getNama() async {
    return _prefs.then((SharedPreferences pref) {
      return pref.getString('nama') ?? '';
    });
  }

  Future<String> getNoHp() async {
    return _prefs.then((SharedPreferences pref) {
      return pref.getString('noHp') ?? '';
    });
  }

  // Future<String> getIdLap() async {
  //   return _prefs.then((SharedPreferences pref) {});
  // }
}
