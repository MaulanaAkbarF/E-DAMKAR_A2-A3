import 'package:flutter/material.dart';

class DetailRiwayatLengkap extends StatefulWidget {
  const DetailRiwayatLengkap(String string, {super.key});

  @override
  State<DetailRiwayatLengkap> createState() => _DetailRiwayatLengkapState();
}

class _DetailRiwayatLengkapState extends State<DetailRiwayatLengkap> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(
          "Riwayat Laporan",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: <Widget>[
                Text(
                  "Bantuan Evakuasi Kebakaranasdhkashdjkahsdkjahsdjkashdkajsdhkjasdh",
                  textAlign: TextAlign.justify,
                  maxLines: 3,
                  style: TextStyle(
                    color: Color.fromARGB(255, 51, 51, 51),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: 500,
                    height: 200,
                    // color: Colors.amberAccent,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage('assets/Rectangle 18045.jpg'),
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  width: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: Color.fromARGB(255, 156, 163, 175), width: 1)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_city_outlined),
                          Padding(padding: EdgeInsets.only(right: 10)),
                          Text("Desa Aru Rt5, Rw.1 Kecamatan Sumeru")
                        ],
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Row(
                        children: [
                          Icon(Icons.date_range_outlined),
                          Padding(padding: EdgeInsets.only(right: 10)),
                          Text("2 Maret 2023"),
                        ],
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Row(
                        children: [
                          Text("Deskripsi : "),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Deskripsi yang adaajshdkajshdkajsdhkasjdhkajdhquwjbqbakjbdjhwpqdbasdijkbapdfbqiwbekajbdsfifoquwbdjabsdiquwbdkbqdiubakjsbdouqhwbdkjbasidbaiusbdia",
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Text(
                    "Status :",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 157,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color.fromARGB(255, 250, 202, 21),
                        width: 2,
                      ),
                    ),
                    child: Text(
                      "Menunggu",
                      style: TextStyle(
                          color: Color.fromARGB(255, 55, 65, 81),
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ))
        ],
      ),
    ));
  }
}
