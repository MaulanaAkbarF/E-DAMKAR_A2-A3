import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

MapsLine mapsLineFromJson(String str) => MapsLine.fromJson(json.decode(str));

// String mapsLineToJson(MapsLine data) => json.encode(data.toJson());

class MapsLine {
  String type;
  Message message;

  MapsLine({
    required this.type,
    required this.message,
  });

  factory MapsLine.fromJson(Map<String, dynamic> json) => MapsLine(
        type: json["type"],
        message: Message.fromJson(json["message"]),
      );

  // Map<String, dynamic> toJson() => {
  //     "type": type,
  //     "message": message.toJson(),
  // };
}

class Message {
  String user;
  List<LatLng> route;

  Message({
    required this.user,
    required this.route,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        user: json["user"],
        route: List<LatLng>.from(json["route"]
            .map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
      );

  // List<List<double>>.from(json["route"].map((x) => List<double>.from(x.map((x) => x?.toDouble()))))

//     Map<String, dynamic> toJson() => {
//         "user": user,
//         "route": List<dynamic>.from(route.map((x) => List<dynamic>.from(x.map((x) => x)))),
//     };
}
