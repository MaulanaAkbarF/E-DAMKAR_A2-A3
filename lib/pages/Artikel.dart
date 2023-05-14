import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:edamkar_1/Menu/Menu.dart';
import 'package:edamkar_1/SharedPreferences/artikelData.dart';
import 'package:edamkar_1/models/AllArtikelModel.dart';
import 'package:edamkar_1/models/ArtikelEdukasiModel.dart';
import 'package:edamkar_1/models/DataPelaporan.dart';
import 'package:edamkar_1/pages/DetailArtikel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:edamkar_1/style/app_style.dart';
import 'package:edamkar_1/style/size_config.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:edamkar_1/models/ArtikelModel.dart';
import 'package:edamkar_1/models/HardArtikel.dart';

import '../APIRequest/APIClient.dart';
import '../models/ArtikelHighlightModel.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
];
final List<String> kat = ["Edukasi", "Berita", "Agenda", "Edukasi"];

List<ArtikelDetailDatum>? artikelHigh = [];

class Artikel extends StatefulWidget {
  const Artikel({super.key});

  @override
  State<Artikel> createState() => _ArtikelState();
}

class _ArtikelState extends State<Artikel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  // final List<Widget> ArtikelScroll = [BeritaCard()];
  // final List<ArtikelModel>? ArtikelData = [];
  List<ArtikelDatum>? artikelElement = [];
  List<EdukasiDatum>? artikelEdukasi = [];
  List<ArtikelDetailDatum>? artikelDetail = [];


  @override
  void initState() {
    super.initState();
    PostDataArtikel();
    PostDataArtikelHigh();
  }

  PostDataArtikel() async {
    var result = await APIClient().getData('getBerita');
    var result2 = await APIClient().getData('getEdukasi');

    if (result && result2 != null) {
      var dataRiwayat_berita = dataArtikelFromJson(result);
      var dataRiwayat_edukasi = artikelEdukasiModelFromJson(result2);
      if (dataRiwayat_berita.data.isNotEmpty &&
          dataRiwayat_edukasi.data.isNotEmpty) {
        setState(() {
          artikelElement = dataRiwayat_berita.data;
          artikelEdukasi = dataRiwayat_edukasi.data;
        });
      }
    } else {
      print("data kosong");
    }
  }

  // postDataArtikelAll() async {
  //   var result = await APIClient().getData('getBerita');
  //   var result2 = await APIClient().getData('getEdukasi');

  //   if (result && result2 != null) {
  //     var dataRiwayat_berita = dataArtikelFromJson(result);
  //     var dataRiwayat_edukasi = artikelEdukasiModelFromJson(result2);

  //     if (dataRiwayat_berita.data.isNotEmpty &&
  //         dataRiwayat_edukasi.data.isNotEmpty) {
  //       setState(() {
  //         // artikelAll = dataRiwayat_berita.data;
  //         // artikelAll = dataRiwayat_edukasi.data;
  //       });
  //     }
  //   } else {
  //     print("data kosong");
  //   }
  // }

  PostDataArtikelHigh() async {
    var result = await APIClient().getData('getBeritaHigh');

    if (result != null) {
      var dataRiwayat = artikelHighlightModelFromJson(result);
      if (dataRiwayat.data.isNotEmpty) {
        setState(() {
          artikelHigh = dataRiwayat.data;
          print(dataRiwayat);
        });
      }
    } else {
      print("data kosong");
    }
  }

  final ButtonStyle _buttonStyle = TextButton.styleFrom(
    primary: Colors.amber,
    padding: EdgeInsets.symmetric(
        horizontal: paddingHorozontal1, vertical: paddingVertical1),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2))),
  );

  List<String> judul = [
    "Kebakaran Gedung BTS di Nganjut Selatan, 2 Orang Meninggal",
    "Kebakaran Gedung BTS di Nganjut Selatan, 2 Orang Meninggal",
    "Kebakaran Gedung BTS di Nganjut Selatan, 2 Orang Meninggal",
    "Kebakaran Gedung BTS di Nganjut Selatan, 2 Orang Meninggal"
  ];

  List<String> pub = ["disDamkar", "disDamkar", "disDamkar", "disDamkar"];
  List<String> tgl = [
    "23 Februari 2023",
    "23 Februari 2023",
    "23 Februari 2023",
    "23 Februari 2023"
  ];
  List<String> img = [
    "gambar/logokabupatennganjuk.png",
    "gambar/logokabupatennganjuk.png",
    "gambar/logokabupatennganjuk.png",
    "gambar/logokabupatennganjuk.png",
  ];

  final List<Color> clr = [
    Colors.green,
    Colors.blueAccent,
    Colors.amber,
    Colors.red
  ];

  // List<Widget> imageSliders = kat
  //     .map(
  //       (item) => Builder(builder: (context) {
  //         return Container(
  //           margin: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
  //           child: GestureDetector(
  //             onTap: () {
  //               Navigator.of(context).push(MaterialPageRoute(
  //                   builder: (context) => DetailArtikel(
  //                         idArtikel:
  //                             artikelHigh![int.parse(item, radix: 16)].idBerita,
  //                       )));
  //             },
  //             child: Column(
  //               children: [
  //                 Container(
  //                   width: 400,
  //                   height: 170,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(10),
  //                       image: DecorationImage(
  //                           image: NetworkImage(
  //                               'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),
  //                           fit: BoxFit.cover)),
  //                 ),
  //                 SizedBox(
  //                   height: 10,
  //                 ),
  //                 Expanded(
  //                   child: ListView.builder(
  //                     itemCount: artikelHigh!.length,
  //                     itemBuilder: (context, index) {
  //                       return Container(
  //                         margin:
  //                             EdgeInsets.symmetric(vertical: 5, horizontal: 20),
  //                         child: Column(
  //                           children: [
  //                             Row(
  //                               mainAxisSize: MainAxisSize.max,
  //                               mainAxisAlignment:
  //                                   MainAxisAlignment.spaceBetween,
  //                               children: [
  //                                 Text(
  //                                   artikelHigh![index].adminDamkar.toString(),
  //                                   style: TextStyle(
  //                                       fontFamily: "font/inter_medium.tff",
  //                                       color:
  //                                           Color.fromARGB(255, 107, 114, 128),
  //                                       fontSize: 14,
  //                                       fontWeight: FontWeight.w500),
  //                                 ),
  //                                 Text(
  //                                   artikelHigh![index].idBerita.toString(),
  //                                   style: TextStyle(
  //                                       fontFamily: "font/inter_medium.tff",
  //                                       color:
  //                                           Color.fromARGB(255, 107, 114, 128),
  //                                       fontSize: 14,
  //                                       fontWeight: FontWeight.w500),
  //                                 )
  //                               ],
  //                             ),
  //                             SizedBox(
  //                               height: 10,
  //                             ),
  //                             Text(
  //                               artikelHigh![index].judulBerita.toString(),
  //                               style: TextStyle(
  //                                   fontFamily: "font/inter_semibold.tff",
  //                                   color: Color.fromARGB(255, 55, 65, 81),
  //                                   fontSize: 18,
  //                                   fontWeight: FontWeight.w600),
  //                             ),
  //                             SizedBox(
  //                               height: 10,
  //                             ),
  //                             Text(
  //                               artikelHigh![index].deskripsiBerita.toString(),
  //                               maxLines: 3,
  //                               style: TextStyle(
  //                                   fontFamily: "font/inter_medium.tff",
  //                                   color: Color.fromARGB(255, 107, 114, 128),
  //                                   fontSize: 16,
  //                                   fontWeight: FontWeight.w400),
  //                             ),
  //                           ],
  //                         ),
  //                       );
  //                     },
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       }),
  //     )
  //     .toList();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Align(
            alignment: FractionalOffset.topCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 20),
              child: Text(
                "Artikel",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    color: Color.fromARGB(255, 55, 65, 81),
                    fontFamily: "font/inter_bold.ttf",
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                      style: _buttonStyle,
                      onPressed: null,
                      child: Text("Semua")),
                  SizedBox(
                    width: 50,
                  ),
                  TextButton(
                      style: _buttonStyle,
                      onPressed: null,
                      child: Text("Berita")),
                  SizedBox(
                    width: 50,
                  ),
                  TextButton(
                      style: _buttonStyle,
                      onPressed: null,
                      child: Text("Edukasi")),
                  SizedBox(
                    width: 50,
                  ),
                  TextButton(
                      style: _buttonStyle,
                      onPressed: null,
                      child: Text("Agenda")),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            color: Colors.black26,
            width: SizeConfig.screenWidth,
            height: 2,
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: artikelHigh!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailArtikel(
                                    idArtikel: artikelHigh![index].idBerita)));
                      },
                      title: Container(
                        width: 400,
                        height: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),
                                fit: BoxFit.cover)),
                      ),
                      subtitle: Container(
                        
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: artikelElement!.length,
              itemBuilder: (context, index) {
                return Container(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailArtikel(
                                  idArtikel: artikelElement![index].idBerita)));
                    },
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          artikelElement![index].idBerita.toString(),
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: "$thin1",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: black2,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          artikelElement![index].judulBerita.toString(),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: black3,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: "$semibold",
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          artikelElement![index].adminDamkar.toString(),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                          Icons.circle,
                          size: 5,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          artikelElement![index].tanggalBerita.toString(),
                        )
                      ],
                    ),
                    trailing: Container(
                        alignment: Alignment.center,
                        height: paddingVertical6,
                        width: paddingHorozontal5,
                        // color: clr[index],
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),
                                fit: BoxFit.cover))),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.black38,
                );
              },
            ),
          )
        ]),
      ),
      bottomNavigationBar: AppMenu(),
    );
  }
}
