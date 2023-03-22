import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class DataUser {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<void> addUser(bool kondisi, String email, String nama) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setBool('kondisi', kondisi);
    await prefs.setString('email', email);
    await prefs.setString('nama', nama);
  }

  Future<String> getemail() async{
    return _prefs.then((SharedPreferences pref) {
      return pref.getString('email') ?? '';
    });
  }
  Future<String> getnama() async {
    return _prefs.then((SharedPreferences pref) {
      return pref.getString('nama') ?? '';
    });
  }

}
