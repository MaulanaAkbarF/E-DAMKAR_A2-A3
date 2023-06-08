import 'package:edamkar_1/src/emergency/bindings/emergency_page_binding.dart';
import 'package:edamkar_1/src/emergency/bindings/laporan_eme_page_binding.dart';
import 'package:edamkar_1/src/emergency/bindings/maps_page_binding.dart';
import 'package:edamkar_1/src/emergency/view/emergency_call_view.dart';
import 'package:edamkar_1/src/emergency/view/laporan_anonym_view.dart';
import 'package:edamkar_1/src/emergency/view/maps_anonym_view.dart';
import 'package:edamkar_1/src/home/bindings/home_binding.dart';
import 'package:edamkar_1/src/home/view/card_artikell_view.dart';
import 'package:edamkar_1/src/home/view/home_view.dart';
import 'package:edamkar_1/src/login/bindings/login_binding.dart';
import 'package:edamkar_1/src/login/view/login_view.dart';
import 'package:edamkar_1/src/register/bindings/otp_verifikasi_binding.dart';
import 'package:edamkar_1/src/register/bindings/register_binding.dart';
import 'package:edamkar_1/src/register/view/otp_verification_view.dart';
import 'package:edamkar_1/src/register/view/register_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.emergency;

  /*halaman navigasi routing
    Name -> berfungsi sebagai nama dari route
    page -> halaman tampilan 
    binding -> class inisiasi penghubung antara view dengan controller
  */

  static final routes = [
    GetPage(
      name: Routes.emergency,
      page: () => EmergencyCall(),
      binding: EmergencyBinding(),
    ),
    GetPage(
      name: Routes.emeMaps,
      page: () => const MapsAnonym(),
      binding: MapsAnonymBinding(),
    ),
    GetPage(
      name: Routes.emePelaporan,
      page: () => const LaporanAnonym(),
      binding: LaporanAnonymBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const SignInPage(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
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
    )
  ];
}
