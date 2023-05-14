import 'package:edamkar_1/SharedPreferences/artikelData.dart';
import 'package:edamkar_1/models/ArtikelModel.dart';
import 'package:edamkar_1/pages/Artikel.dart';
import 'package:edamkar_1/style/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:edamkar_1/style/app_style.dart';

import '../APIRequest/APIClient.dart';

class DetailArtikel extends StatefulWidget {
  final idArtikel;
  DetailArtikel({required this.idArtikel, super.key});

  @override
  State<DetailArtikel> createState() => _DetailArtikelState();
}

class _DetailArtikelState extends State<DetailArtikel> {
  final List<String> img = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'
  ];

  late int _idArt;
  List<ArtikelDatum>? artikelElement = [];

  // void getId_Berita(String id) async {
  //   postDetailBerita(id);

  //   // var dataId =
  // }

  @override
  void initState() {
    super.initState();
    _idArt = widget.idArtikel;
    postDetailBerita(_idArt);
    // print("id berita: " + _idArt.toString());
  }

  postDetailBerita(int id) async {
    var result = await APIClient().getData('getDetailBerita/' + id.toString());

    print("id berita" + id.toString());
    if (result != null) {
      var detailRiwayat = dataArtikelFromJson(result);
      if (detailRiwayat.data.isNotEmpty) {
        setState(() {
          artikelElement = detailRiwayat.data;
        });
      }
    } else {
      print("Data Kosong");
    }
  }

  @override
  Widget build(BuildContext context) {
    
    SizeConfig().init(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Material(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              splashColor: Colors.grey.shade400,
              highlightColor: Colors.grey.shade600,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Artikel()));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingHorozontal1),
                child: Container(
                  width: 40,
                  height: 40,
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Detail" + _idArt.toString(),
            style: TextStyle(fontFamily: "$black3", color: black3),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: paddingVertical1, horizontal: paddingHorozontal1),
          child: artikelElement == null ? Text("Kosong") : 
          isDetailNull(),
        ),
      ),
    );
  }

  Widget isDetailNull() {
    return artikelElement!.isEmpty
        ? Align(
            alignment: Alignment.center,
            child: Text("Data Artikel Kosong"),
          )
        : ListView.builder(
          itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Column(
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
                          artikelElement![index].idBerita.toString(),
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
                      artikelElement![index].judulBerita.toString(),
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
                        Text(
                          artikelElement![index].adminDamkar.toString(),
                          style: TextStyle(
                            fontFamily: "$thin1",
                            color: black2,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
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
                          artikelElement![index].tanggalBerita.toString(),
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
                        artikelElement![index].deskripsiBerita.toString(),
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
              );
            },
          );
  }
}
