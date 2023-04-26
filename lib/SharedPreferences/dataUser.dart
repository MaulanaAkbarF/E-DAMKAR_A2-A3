import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class DataUser {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> addUser(
      bool kondisi, String? userid, String email, String nama) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setBool('kondisi', kondisi);
    await prefs.setInt('userId', int.parse(userid.toString()));
    await prefs.setString('email', email);
    await prefs.setString('nama', nama);
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

  // Future<String> getIdLap() async {
  //   return _prefs.then((SharedPreferences pref) {});
  // }
}
