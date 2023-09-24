import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url =
      "https://api.openrouteservice.org/v2/directions/driving-car?";
  final String apiKey =
      "5b3ce3597851110001cf624883db333f3b1d47b181a1cfeb5c5e5d3c";
  final double startLat;
  final double startlng;
  final double endlat;
  final double endlng;

  NetworkHelper(
      {required this.startLat,
      required this.startlng,
      required this.endlat,
      required this.endlng});

  getData() async {
    Uri ur = Uri.parse(
        '${url}api_key=$apiKey&start=$startlng,$startLat&end=$endlng,$endlat');
    http.Response response = await http.get(ur);

    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
