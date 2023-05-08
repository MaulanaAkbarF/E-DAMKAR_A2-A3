import 'package:carousel_slider/carousel_slider.dart';
import 'package:edamkar_1/Menu/Menu.dart';
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

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

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
  List<DataArtikelElement>? artikelElement = [];

  @override
  void initState() {
    super.initState();
    // PostDataArtikel();
  }

  // PostDataArtikel() async {
  //   var result = await APIClient().getData('showArtikel').catchError((err) {});
  //   if (result != null) {
  //     var data_artikel = dataArtikelFromJson(result);
  //     if (data_artikel.kondisi) {
  //       setState(() {
  //         artikelElement = data_artikel.dataArtikel;
  //       });
  //     }
  //   } else {
  //     debugPrint("kosong");
  //     print("Data Kosong !");
  //   }
  // }

  List<String> Kat = ["Edukasi", "Berita", "Agenda", "Edukasi"];
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

  List<Color> clr = [Colors.green, Colors.blueAccent, Colors.amber, Colors.red];

  final List<Widget> imageSliders = imgList
      .map(
        (item) => Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
          child: Column(
            children: [
              Container(
                width: 400,
                height: 170,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(item), fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Damkar",
                            style: TextStyle(
                                fontFamily: "font/inter_medium.tff",
                                color: Color.fromARGB(255, 107, 114, 128),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Berita",
                            style: TextStyle(
                                fontFamily: "font/inter_medium.tff",
                                color: Color.fromARGB(255, 107, 114, 128),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Judul : Kebakaran Pabrik dan Gudang di Kawasan Perumahan Locaret",
                        style: TextStyle(
                            fontFamily: "font/inter_semibold.tff",
                            color: Color.fromARGB(255, 55, 65, 81),
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Deskripsi : Berdasarkan informasi dan laporan dari Taman Nasional Bromo Tengger Semeru bahwa telah terjadi kebakaran lahan di",
                        maxLines: 3,
                        style: TextStyle(
                            fontFamily: "font/inter_medium.tff",
                            color: Color.fromARGB(255, 107, 114, 128),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(children: [
        CarouselSlider(
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
              height: 350,
              autoPlay: true,
              // enlargeCenterPage: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        // SizedBox(
        //   height: 20,
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: hardArtikelList.length,
            itemBuilder: (context, index) {
              return Container(
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailArtikel(
                            hardArtikelList![index].idArtikel.toString())));
                  },
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hardArtikelList[index].namaArtikel.toString(),
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
                        hardArtikelList![index].judulArtikel.toString(),
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
                        hardArtikelList![index].namaLengkapDamkar.toString(),
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
                        hardArtikelList![index].artikelTgl.toString(),
                      )
                    ],
                  ),
                  trailing: Container(
                    alignment: Alignment.topCenter,
                    height: paddingVertical4,
                    width: paddingHorozontal4,
                    // color: clr[index],
                    decoration: BoxDecoration(color: clr[index]
                        // borderRadius: BorderRadius.circular(10),
                        // image: DecorationImage(
                        //   image: AssetImage(img[index]))
                        ),
                  ),
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
      bottomNavigationBar: AppMenu(),
    );
  }
}
