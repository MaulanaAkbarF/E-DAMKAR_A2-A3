class ReqPosition {
  String type;
  List<Position> position;

  ReqPosition({
    required this.type,
    required this.position,
  });

  factory ReqPosition.fromJson(Map<String, dynamic> json) => ReqPosition(
        type: json["type"],
        position: List<Position>.from(
            json["position"].map((x) => Position.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "position": List<dynamic>.from(position.map((x) => x.toJson())),
      };
}

class Position {
  double latitude;
  double longitude;

  Position({
    required this.latitude,
    required this.longitude,
  });

  factory Position.fromJson(Map<String, dynamic> json) => Position(
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}
