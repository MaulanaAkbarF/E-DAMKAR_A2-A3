import 'package:edamkar_1/pages/Profil.dart';
import 'package:flutter/material.dart';
import 'package:edamkar_1/style/size_config.dart';

class TentangKami extends StatefulWidget {
  const TentangKami({super.key});

  @override
  State<TentangKami> createState() => _TentangKamiPageState();
}

final _minimumPadding = 5.0;

class _TentangKamiPageState extends State<TentangKami> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Profile()));
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          "Tentang Kami ",
          style: TextStyle(color: Colors.black87, fontSize: 20),
        ),
      ),
    );
  }
}
