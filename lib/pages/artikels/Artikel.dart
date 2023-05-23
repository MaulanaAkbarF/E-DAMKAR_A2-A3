import 'package:carousel_slider/carousel_slider.dart';
import 'package:edamkar_1/APIRequest/APIClient.dart';

import 'package:edamkar_1/models/ArtikelEdukasiModel.dart';
import 'package:edamkar_1/notification/toastNotif.dart';
import 'package:edamkar_1/models/SemuaArtikelBerita.dart';
import 'package:edamkar_1/pages/artikels/DetailArtikel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:edamkar_1/style/app_style.dart';
import 'package:edamkar_1/style/size_config.dart';

import 'package:edamkar_1/models/ArtikelModel.dart';

class Artikel extends StatefulWidget {
  const Artikel({super.key});

  @override
  State<Artikel> createState() => _ArtikelState();
}

class _ArtikelState extends State<Artikel> {
  List<ArtikelDatum>? artikelElement = [];
  List<EdukasiDatum>? artikelEdukasi = [];
  List<dynamic> beritaE = [];

  void pemabatasanLoad() {
    artikelElement!.clear();

    for (var i = 0; i <= 10; i++) {
      getData();
    }
  }

  @override
  void initState() {
    super.initState();

    if (mounted) {
      getData();
      getDataHigh();
    }
    // PostDataArtikel();
    // PostDataArtikelHigh();
    // pemabatasanLoad();

    //scrol controller

    //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //     double minScrollExtent1 = _scrollController.position.minScrollExtent;
    //     double maxScrollExtent1 = _scrollController.position.maxScrollExtent;
    //     //
    //     animateToMaxMin(maxScrollExtent1, minScrollExtent1, maxScrollExtent1, 50,
    //         _scrollController);
    //   });
    // }

    // animateToMaxMin(double max, double min, double direction, int second,
    //     ScrollController scrollController) {
    //   scrollController
    //       .animateTo(direction,
    //           duration: Duration(seconds: second), curve: Curves.linear)
    //       .then((value) {
    //     direction = direction == max ? min : max;
    //     animateToMaxMin(max, min, direction, second, scrollController);
    //   });
  }

  void postDataBerita() async {
    var result = await APIClient().getData('getBerita');

    if (result != null) {
      setState(() {
        data = semuaArtikelModelFromJson(result);
      });
      // debugPrint(data.length.toString());
    } else {
      debugPrint('terdapat kesalah');
    }
  }

  void postDataEdukasi() async {
    var result = await APIClient().getData('getEdukasi');

    if (result != null) {
      setState(() {
        data = semuaArtikelModelFromJson(result);
      });
    } else {
      print("data kosong");
    }
  }

  void postDataAgenda() async {
    var result = await APIClient().getData('getAgenda');

    if (result != null) {
      setState(() {
        data = semuaArtikelModelFromJson(result);
      });
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

  // PostDataArtikelHigh() async {
  //   var result = await APIClient().getData('getBeritaHigh');

  //   if (result != null) {
  //     var dataRiwayat = artikelHighlightModelFromJson(result);
  //     if (dataRiwayat.data.isNotEmpty) {
  //       setState(() {
  //         artikelHigh = dataRiwayat.data;
  //         print(dataRiwayat);
  //       });
  //     }
  //   } else {
  //     print("data kosong");
  //   }
  // }

  final ButtonStyle _buttonStyle = TextButton.styleFrom(
    primary: Colors.white,
    backgroundColor: Color.fromARGB(255, 224, 36, 36),
    padding: EdgeInsets.symmetric(
        horizontal: paddingHorozontal1, vertical: paddingVertical1),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
      Radius.circular(20),
    )),
  );

  var data;
  var dataHigh;
  void getData() async {
    var result = await APIClient().getData('getAllArtikel');
    if (result != null) {
      setState(() {
        data = semuaArtikelModelFromJson(result);
        debugPrint(data.length.toString());
      });
    } else {
      debugPrint('terdapat kesalahan');
    }
  }

  void getDataHigh() async {
    var result = await APIClient().getData('getAllArtikelHigh');
    if (result != null) {
      setState(() {
        dataHigh = semuaArtikelModelFromJson(result);

        debugPrint(dataHigh.length.toString());
      });
    } else {
      debugPrint('terdapat kesalah');
    }
  }

  final List<Map> teksLaporan = [
    {
      'Header': 'Artikel',
    }
  ].cast<Map<String, String>>();

  final List<Map> teksStyleLaporan = [
    {
      'Bold1': const TextStyle(
          fontFamily: "font/inter_black.ttf",
          color: Color(0x374151),
          fontSize: (20),
          fontWeight: FontWeight.w700),
      'TittleBold': const TextStyle(
          fontFamily: "font/inter_bold.ttf",
          color: Color(0x374151),
          fontSize: (20),
          fontWeight: FontWeight.w700),
      'SemiBold1': const TextStyle(
          fontFamily: "font/inter_bold.ttf",
          color: Colors.black45,
          fontSize: (16)),
      'SemiBold2': const TextStyle(
          fontFamily: "font/inter_extrabold.ttf",
          color: Colors.blueAccent,
          fontSize: (18),
          fontWeight: FontWeight.w500),
      'SemiBold3': const TextStyle(
          fontFamily: "font/inter_extrabold.ttf",
          color: Colors.black54,
          fontSize: (18),
          fontWeight: FontWeight.w700),
      'Thin1': const TextStyle(
          fontFamily: "font/inter_regular.ttf",
          color: Colors.black,
          fontSize: (18),
          fontWeight: FontWeight.w500),
      'Thin2': const TextStyle(
          fontFamily: "font/inter_regular.ttf",
          color: Colors.black54,
          fontSize: (18),
          fontWeight: FontWeight.w600),
      'Thin3': const TextStyle(
          fontFamily: "font/inter_regular.ttf",
          color: Colors.grey,
          fontSize: (18),
          fontWeight: FontWeight.w600)
    }
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
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Konfirmasi keluar !"),
                content: Text("Apakah anda yakin untuk Keluar ?"),
                actions: <Widget>[
                  FloatingActionButton(
                      child: Text("Tidak"),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      }),
                  FloatingActionButton(
                      child: Text("Ya"),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      })
                ],
              );
            });
      },
      child: Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            for (final teks in teksLaporan)
              for (final teksStyle in teksStyleLaporan)
                Align(
                  alignment: FractionalOffset.topCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: paddingVertical1,
                        horizontal: paddingHorozontal1),
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: paddingHorozontal1),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 40,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextButton(
                              style: _buttonStyle,
                              onPressed: getData,
                              child: Text("Semua")),
                          SizedBox(
                            width: 50,
                          ),
                          TextButton(
                              style: _buttonStyle,
                              onPressed: postDataBerita,
                              child: Text("Berita")),
                          SizedBox(
                            width: 50,
                          ),
                          TextButton(
                              style: _buttonStyle,
                              onPressed: postDataEdukasi,
                              child: Text("Edukasi")),
                          SizedBox(
                            width: 50,
                          ),
                          TextButton(
                              style: _buttonStyle,
                              onPressed: postDataAgenda,
                              child: Text("Agenda")),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 1,
              width: SizeConfig.screenWidth,
              color: Colors.black26,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: SizeConfig.screenHeightHalf,
              width: SizeConfig.screenWidth,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: paddingHorozontal1),
                scrollDirection: Axis.horizontal,
                itemCount: 9,
                // shrinkWrap: true,
                // controller: _scrollController,
                separatorBuilder: (context, index) => SizedBox(
                  width: 10,
                ),
                itemBuilder: (context, index) {
                  return AnimatedContainer(
                      duration: Duration(seconds: 50),
                      padding: EdgeInsets.symmetric(vertical: paddingVertical1),
                      height: 400,
                      width: 400,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(10)),
                      child: dataHigh == null || dataHigh.length <= 9
                          ? Text(
                              "Data kosong",
                              textAlign: TextAlign.center,
                            )
                          : ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailArtikel(
                                            idArtikel: dataHigh[index].id,
                                            jenisArtikel: dataHigh[index]
                                                .jenisArtikel
                                                .toString())));
                              },
                              title: Container(
                                // width: 400,
                                height: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "semuaAset/gambar/damkar.png"),
                                        fit: BoxFit.cover)),
                              ),
                              subtitle: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: paddingVertical1),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          dataHigh[index]
                                              .adminDamkar
                                              .toString(),
                                          style: TextStyle(
                                              fontFamily:
                                                  "font/inter_medium.tff",
                                              color: Color.fromARGB(
                                                  255, 107, 114, 128),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          dataHigh[index]
                                              .jenisArtikel
                                              .toString(),
                                          style: TextStyle(
                                              fontFamily:
                                                  "font/inter_medium.tff",
                                              color: Color.fromARGB(
                                                  255, 107, 114, 128),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        dataHigh[index].judul.toString(),
                                        maxLines: 1,
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontFamily:
                                                "font/inter_semibold.tff",
                                            color:
                                                Color.fromARGB(255, 55, 65, 81),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        dataHigh[index].deskripsi.toString(),
                                        maxLines: 2,
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontFamily: "font/inter_medium.tff",
                                            color: Color.fromARGB(
                                                255, 107, 114, 128),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                              )));
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(child: listArtikel())
          ],
        )),
      ),
    );
  }

  Widget listArtikel() {
    return data == null 
        ? const Text(
            "Artikel Kosong",
            textAlign: TextAlign.center,
          )
        : ListView.separated(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Container(
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailArtikel(
                            idArtikel: data[index].id,
                            jenisArtikel:
                                data[index].jenisArtikel.toString())));
                  },
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data[index].jenisArtikel.toString(),
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
                        data![index].judul.toString(),
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
                        data![index].adminDamkar.toString(),
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
                        data![index].tanggal.toString(),
                      )
                    ],
                  ),
                  trailing: Container(
                    alignment: Alignment.topCenter,
                    height: paddingVertical4,
                    width: paddingHorozontal4,
                    // color: clr[index],
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage("semuaAset/gambar/damkar.png"))),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.black38,
              );
            },
          );
  }

  Widget listArtikelHigh() {
    return ListView.builder(
        itemCount: dataHigh.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailArtikel(
                            idArtikel: dataHigh[index].id,
                            jenisArtikel:
                                dataHigh[index].jenisArtikel.toString())));
              },
              title: Container(
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),
                        fit: BoxFit.cover)),
              ),
              subtitle: Container(),
            ),
          );
        });
  }
}



//
