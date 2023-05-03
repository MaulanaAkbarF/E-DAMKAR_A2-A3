import 'package:edamkar_1/style/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:edamkar_1/style/app_style.dart';

class DetailArtikel extends StatefulWidget {

  const DetailArtikel(String string,{super.key});

  @override
  State<DetailArtikel> createState() => _DetailArtikelState();
}

class _DetailArtikelState extends State<DetailArtikel> {
  final List<String> img = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Detail Artikel",
            style: TextStyle(fontFamily: "$black3", color: black3),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: paddingVertical1, horizontal: paddingHorozontal1),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Divider(
                    height: 5,
                    color: Colors.black26,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Artikel",
                        style: TextStyle(
                          fontFamily: "$thin1",
                          color: black2,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: black2,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Berita",
                        style: TextStyle(
                          fontFamily: "$thin1",
                          color: black2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Kebakaran Gedung BTS di Nganjut Selatan, 2 Orang Meninggal",
                    // maxLines: 3,
                    style: TextStyle(
                      fontFamily: "inter-semibold",
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: black3,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 5,
                        weight: 3,
                        color: black2,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Selasa 23 Februari 2023",
                        style: TextStyle(
                          fontFamily: "$thin1",
                          color: black2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 250,
                // width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                          "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
                        ),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black54,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Juru bicara KPK Ali Fikri lantas membeberkan tiga kasus yang melibatkan Muhammad Adil. Kasus pertama, terkait korupsi pemotongan anggaran. Kasus kedua terkait penerimaan gratifikasi dari biro perjalanan ibadah ke Tanah Suci."
                  "Kemudian terkait penerimaan fee dari jasa travel umrah, kata Ali."
                  "Kemudian terkait penerimaan fee dari jasa travel umrah, kata Ali."
                  "Kemudian terkait penerimaan fee dari jasa travel umrah, kata Ali."
                  "Kemudian terkait penerimaan fee dari jasa travel umrah, kata Ali."
                  "Kemudian terkait penerimaan fee dari jasa travel umrah, kata Ali."
                  "Kemudian terkait penerimaan fee dari jasa travel umrah, kata Ali."
                  "Kemudian terkait penerimaan fee dari jasa travel umrah, kata Ali."
                  "Kemudian terkait penerimaan fee dari jasa travel umrah, kata Ali."
                  "Kemudian terkait penerimaan fee dari jasa travel umrah, kata Ali."
                  "Kemudian terkait penerimaan fee dari jasa travel umrah, kata Ali."
                  "Kasus ketiga terkait suap untuk pemeriksaan keuangan Kabupaten Kepulauan Meranti. Pemeriksaan keuangan itu dilakukan pada 2022.",
                  style: TextStyle(
                    fontFamily: "$bold",
                    color: Colors.black,
                    height: 1.8,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
