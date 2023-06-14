import 'package:edamkar_1/src/artikels/controller/detail_artikel_controller.dart';
import 'package:edamkar_1/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:edamkar_1/utils/app_style.dart';
import 'package:get/get.dart';

class DetailArtikelView extends GetView<DetailArtikelController> {
  DetailArtikelView({super.key});

  final List<String> img = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'
  ];


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        foregroundColor: Colors.black87,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Detail Artikel",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "font/inter_bold.ttf",
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingHorozontal1),
        child: isDetailNull(),
      ),
    );
  }

  Widget isDetailNull() {
    return controller.data == null
        ? Align(
            alignment: Alignment.center,
            child: Text("Data Artikel Kosong"),
          )
        : ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: paddingVertical1),
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
                          controller.data[index].jenisArtikel.toString(),
                          style: TextStyle(
                            fontFamily: "$thin1",
                            color: black2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      controller.data[index].judul.toString(),
                      // artikelElement![index].judulBerita.toString(),
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
                          controller.data[index].adminDamkar.toString(),
                          // artikelElement![index].adminDamkar.toString(),
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
                          controller.data[index].tanggal.toString(),
                          // artikelElement![index].tanggalBerita.toString(),
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
                      width: SizeConfig.screenWidth,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.white,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        controller.data[index].deskripsi.toString(),
                        // artikelElement![index].deskripsiBerita.toString(),
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
