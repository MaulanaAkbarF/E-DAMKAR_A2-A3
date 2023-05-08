import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class DataUser {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> addUser(String? userid, String email, String nama, String noHp,
      String token) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setInt('userId', int.parse(userid.toString()));
    await prefs.setString('email', email);
    await prefs.setString('nama', nama);
    await prefs.setString('noHp', noHp);
    await prefs.setString('token', token);
  }

  Future<int> getUserId() async {
    return _prefs.then((SharedPreferences pref) {
      return pref.getInt('userId') ?? 0;
    });
  }

  Future<String> getEmail() async {
    return _prefs.then((SharedPreferences pref) {
      return pref.getString('email') ?? '';
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
