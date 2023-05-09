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
            Navigator.pop(context);
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
      body: Container(
        color: Colors.white,
        child: Column(children: [
          SizedBox(
            height: 70,
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "semuaAset/gambar/logodamkarsatu.png",
              width: 100,
              height: 100,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color.fromARGB(255, 232, 232, 234)),
                  color: Colors.transparent),
              child: ListTile(
                title: Text(
                  'E-DAMKAR merupakan sebuah platform aplikasi berbasis mobile yang terintegrasi dengan website. Dilihat dari namanya sendiri “E-Damkar” yang artinya Pemadam kebakaran , dengan adanya aplikasi ini dapat membantu petugas pemadam kebakaran dalam menjalankan tugasnya. Dengan menggunakan E-Damkar diharap petugas pemadam lebih efisien dalam mengelola laporan yang masuk, memberikan informasi lengkap tentang keadaan terkini pada TKP dan informasi lengkap mengenai lokasi dari permasalahan agar dapat lebih cepat ditangani.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
