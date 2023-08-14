import 'dart:io';

import 'package:edamkar_1/utils/style_n_color.dart';
import 'package:flutter/material.dart';

class CamPreview extends StatelessWidget {
  const CamPreview({super.key, required this.image});

  final File image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview Foto Laporan'),
        titleTextStyle: StyleTxt.m(size: 18),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Center(
        heightFactor: 1,
        child: Column(
          children: [
            Image.file(image),
            // Image.file(File(image.path),
            //     fit: BoxFit.cover, width: double.infinity),
            // ElevatedButton(onPressed: () {}, child: Text(image.path))
          ],
        ),
      ),
    );
  }
}
