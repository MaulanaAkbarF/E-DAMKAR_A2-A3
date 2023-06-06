import 'package:edamkar_1/routes/app_pages.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class EmergencyController extends GetxController {
  // kode negara
  final String countryCode = "+62";

  //admin contact
  final String templateMessage = "Permasalahan : \npelapor : \nalamat :";
  final String waPhoneNumber = "81252277680";
  final String phoneNumber = "085708574368";

  //pesan gagal
  final String title = "Gagal";
  final String message = "coba kembali dalam beberapa saat";

  void emercall() async {
    final Uri phoneUrl = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUrl)) {
      await launchUrl(phoneUrl);
      Get.offNamed(Routes.emeMaps);
    } else {
      Get.snackbar(title, message, backgroundColor: black3, colorText: white);
    }
  }

  void emerCallWA() async {
    var whatsappUrl =
        "whatsapp://send?phone=${countryCode + waPhoneNumber}&text=${Uri.encodeComponent(templateMessage)}";
    if (await canLaunchUrlString(whatsappUrl)) {
      await launchUrlString(whatsappUrl);
      Get.offNamed(Routes.emeMaps);
    } else {
      Get.snackbar(title, message, backgroundColor: black3, colorText: white);
    }
  }

  void goLogin() {
    Get.toNamed(Routes.login);
  }
}
