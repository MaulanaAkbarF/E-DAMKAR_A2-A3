// import 'package:camera/camera.dart';
import 'package:edamkar_1/routes/app_pages.dart';
import 'package:edamkar_1/service/SharedPreferences/dataUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:get/get.dart';

// late List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var userId = await DataUser().getUserId();
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelKey: 'channelKey',
        channelName: 'channelName',
        channelDescription: 'channelDescription')
  ]);

  // cameras = await availableCameras();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(GetMaterialApp(
            title: 'E-Damkar',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.light,
            ),
            initialRoute:
                userId == 0 ? AppPages.initial : AppPages.initialWLogin,
            getPages: AppPages.routes,
          )));
}
