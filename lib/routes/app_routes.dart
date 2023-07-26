part of 'app_pages.dart';

abstract class Routes {
  //emergency
  static const emergency = '/emergency';
  static const emeMaps = '/mapsAnonym';
  static const emePelaporan = '/pelaporanAnonym';

  //login
  static const login = '/login';
  static const resetPass = '/resetPass';

  //register
  static const register = '/register';
  static const otpVerif = '/otpVerif';

  //dashboard
  static const dashboard = '/dashboard';
  //home
  static const home = '/home';
  static const hmArtikel = '/hmArtikel';

  //laporan
  static const laporan = '/laporan';
  static const mpLap = '/mapsLaporan';
  static const lpBencanaAlam = '/laporanBencananAlam';
  static const lpHewanBuas = '/laporanHewanBuas';
  static const lpKebakaran = '/laporanKebakaran';
  static const lpPenyelamatan = '/laporanPenyelamatan';
  static const lpCustom = '/laporanCustom';

  //Riwayat
  static const riwayat = '/riwayat';
  static const dtRiwayat = '/detailRiwayat';
  static const mapsTrack = '/mapsTracking';
  //artikel
  static const artikleDt = '/detailArtikle';
  // profile
  static const profile = '/profile';
  static const ubProf = '/ubahProfile';
  static const ubPsProf = '/ubahPasswordProfile';
}
