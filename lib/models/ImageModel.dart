import 'dart:convert';

UploadImage uploadImageFromJson(String str) =>
    UploadImage.fromJson(json.decode(str));

// String uploadImageToJson(UploadImage data) => json.encode(data.toJson());

class UploadImage {
  String? kondisi;
  String? path;

  UploadImage({
    this.kondisi,
    this.path,
  });

  factory UploadImage.fromJson(Map<String, dynamic> json) => UploadImage(
        kondisi: json["kondisi"],
        path: json["path"],
      );
}
