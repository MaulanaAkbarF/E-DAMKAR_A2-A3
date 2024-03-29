import 'package:edamkar_1/src/artikels/bindings/detail_artikel_binding.dart';
import 'package:edamkar_1/src/artikels/views/detail_artikel_view.dart';
import 'package:edamkar_1/src/dashboard/bindings/dashboard_binding.dart';
import 'package:edamkar_1/src/dashboard/views/dashboard_view.dart';
import 'package:edamkar_1/src/emergency/bindings/emergency_page_binding.dart';
import 'package:edamkar_1/src/emergency/bindings/laporan_eme_page_binding.dart';
import 'package:edamkar_1/src/emergency/bindings/maps_page_binding.dart';
import 'package:edamkar_1/src/emergency/controller/laporan_anonym_controller.dart';
import 'package:edamkar_1/src/emergency/view/emergency_call_view.dart';
import 'package:edamkar_1/src/emergency/view/laporan_anonym_first_view.dart';
import 'package:edamkar_1/src/emergency/view/laporan_anonym_view.dart';
import 'package:edamkar_1/src/emergency/view/maps_anonym_view.dart';
import 'package:edamkar_1/src/home/bindings/home_binding.dart';
import 'package:edamkar_1/src/home/view/card_artikell_view.dart';
import 'package:edamkar_1/src/home/view/home_view.dart';
import 'package:edamkar_1/src/informations/views/tentang_kami_view.dart';
import 'package:edamkar_1/src/laporans/bindings/maps_lokasi_kejadiaan_binding.dart';
import 'package:edamkar_1/src/laporans/bindings/pelaporan_binding.dart';
import 'package:edamkar_1/src/laporans/views/LaporanBencanaAlam.dart';
import 'package:edamkar_1/src/laporans/views/LaporanCustom.dart';
import 'package:edamkar_1/src/laporans/views/LaporanHewanBuas.dart';
import 'package:edamkar_1/src/laporans/views/LaporanKebakaran.dart';
import 'package:edamkar_1/src/laporans/views/LaporanPenyelamatan.dart';
import 'package:edamkar_1/src/laporans/views/MapsLokasiKejadian.dart';
import 'package:edamkar_1/src/login/bindings/login_binding.dart';
import 'package:edamkar_1/src/login/view/Login_View.dart';
import 'package:edamkar_1/src/profiles/bindings/profile_binding.dart';
import 'package:edamkar_1/src/profiles/bindings/ubah_profile_binding.dart';
import 'package:edamkar_1/src/profiles/bindings/ubah_sandi_binding.dart';
import 'package:edamkar_1/src/profiles/view/profile_view.dart';
import 'package:edamkar_1/src/profiles/view/ubah_profile_view.dart';
import 'package:edamkar_1/src/profiles/view/ubah_sandi_view.dart';
import 'package:edamkar_1/src/register/bindings/otp_verifikasi_binding.dart';
import 'package:edamkar_1/src/register/bindings/register_binding.dart';
import 'package:edamkar_1/src/register/view/otp_verification_view.dart';
import 'package:edamkar_1/src/register/view/register_view.dart';
import 'package:edamkar_1/src/resetpass/bindings/otp_reset_pw_binding.dart';
import 'package:edamkar_1/src/resetpass/bindings/remake_pw_binding.dart';
import 'package:edamkar_1/src/resetpass/view/UpdatePasswordSuccess.dart';
import 'package:edamkar_1/src/resetpass/view/otp_resetpass_view.dart';
import 'package:edamkar_1/src/resetpass/view/remake_pass_view.dart';
import 'package:edamkar_1/src/resetpass/view/reset_pass_view.dart';
import 'package:edamkar_1/src/riwayatLaporans/bindings/detail_riwayat_laporan_binding.dart';
import 'package:edamkar_1/src/riwayatLaporans/bindings/track_binding.dart';
import 'package:edamkar_1/src/riwayatLaporans/views/detail_riwayat_laporan_view.dart';
import 'package:edamkar_1/src/resetpass/bindings/reset_pass_binding.dart';
import 'package:edamkar_1/src/riwayatLaporans/views/track_damkar_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  //initial merupakan route halaman yang akan pertaman kali ditampilkan
  static const initial = Routes.emergency;
  static const initialWLogin = Routes.dashboard;

  /*halaman navigasi routing
    Name -> berfungsi sebagai nama dari route
    page -> halaman tampilan 
    binding -> class inisiasi penghubung antara view dengan controller
  */

  static final routes = [
    GetPage(
      name: Routes.emergency,
      page: () => const EmergencyCall(),
      binding: EmergencyBinding(),
    ),
    GetPage(
      name: Routes.emeMaps,
      page: () => const MapsAnonym(),
      binding: MapsAnonymBinding(),
    ),
    GetPage(
      name: Routes.emepelapData,
      page: () => const LaporanAnonymDataView(),
      binding: LaporanAnonymBinding(),
    ),
    GetPage(
        name: Routes.emePelaporan,
        page: () => const LaporanAnonym(),
        binding: BindingsBuilder(() {
          Get.put(LaporanAnonymController());
        })),

    GetPage(
      name: Routes.login,
      page: () => const SignInPage(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),

    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),

    GetPage(
        name: Routes.home,
        page: () => const HomePageView(),
        binding: HomeBinding(),
        children: [
          GetPage(
            name: Routes.hmArtikel,
            page: () => const CardArtikelView(),
          )
        ]),
    GetPage(
      name: Routes.register,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: Routes.otpVerif,
      page: () => const OtpVerificationView(),
      binding: VerificationSignUpBinding(),
    ),

    //lupa pw
    GetPage(
        name: Routes.resetPass,
        page: () => const ResetPassView(),
        binding: ResetPassBinding()),

    GetPage(
        name: Routes.otpResetpw,
        page: () => const OtpResetPasswordView(),
        binding: OtpResetPassBinding()),

    GetPage(
        name: Routes.remakePw,
        page: () => const RemakePassView(),
        binding: RemakePassBinding()),

    GetPage(
      name: Routes.succesResetPw,
      page: () => const UpdatePasswordSuccess(),
    ),

    //Laporan
    GetPage(
        name: Routes.mpLap,
        page: () => const MapsLokasiKejadian(),
        binding: MapsLokasiKejadianBinding()),

    GetPage(
        name: Routes.lpBencanaAlam,
        page: () => const LaporanBencanaAlam(),
        binding: PelaporanBinding()),

    GetPage(
        name: Routes.lpHewanBuas,
        page: () => const LaporanHewanBuas(),
        binding: PelaporanBinding()),

    GetPage(
        name: Routes.lpKebakaran,
        page: () => const LaporanKebakaran(),
        binding: PelaporanBinding()),

    GetPage(
        name: Routes.lpPenyelamatan,
        page: () => const LaporanPenyelamatan(),
        binding: PelaporanBinding()),

    GetPage(
        name: Routes.lpCustom,
        page: () => const LaporanCustom(),
        binding: PelaporanBinding()),

    //riwayat pelaporan
    GetPage(
        name: Routes.dtRiwayat,
        page: () => const DetailRiwayatLengkapView(),
        binding: DetailRiwayatLaporanBinding()),

    //profile
    GetPage(
      name: Routes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),

    GetPage(
        name: Routes.ubProf,
        page: () => const EditProfilePage(),
        binding: UbahProfileBinding()),

    GetPage(
        name: Routes.ubPsProf,
        page: () => const UbahSandiView(),
        binding: UbahSandiBinding()),

    GetPage(
      name: Routes.aboutUs,
      page: () => const TentangKami(),
    ),

    GetPage(
        name: Routes.artikleDt,
        page: () => const DetailArtikelView(),
        binding: DetailArtikelBinding()),
    GetPage(
        name: Routes.mapsTrack,
        page: () => const TrackDamkarView(),
        binding: TrackDamkarBinding()),
  ];
}
