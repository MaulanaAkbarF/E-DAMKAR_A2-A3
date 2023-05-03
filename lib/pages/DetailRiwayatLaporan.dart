import 'package:flutter/material.dart';

class DetailRiwayatLengkap extends StatefulWidget {
  const DetailRiwayatLengkap(String string, {super.key});

  @override
  State<DetailRiwayatLengkap> createState() => _DetailRiwayatLengkapState();
}

class _DetailRiwayatLengkapState extends State<DetailRiwayatLengkap> {
  var judul;
  var alamat;
  var tanggal;
  var deksripsi;
  var kondisi;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Riwayat Laporan",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        // brightness: Brightness.light,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: <Widget>[
                Text(
                  judul,
                  textAlign: TextAlign.justify,
                  maxLines: 3,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 51, 51, 51),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    width: 500,
                    height: 200,
                    // color: Colors.amberAccent,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage('assets/Rectangle 18045.jpg'),
                      ),
                    )),
               const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: const Color.fromARGB(255, 156, 163, 175), width: 1)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_city_outlined),
                          Padding(padding: EdgeInsets.only(right: 10)),
                          Text(alamat)
                        ],
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Row(
                        children: [
                          Icon(Icons.date_range_outlined),
                          Padding(padding: EdgeInsets.only(right: 10)),
                          Text(tanggal),
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
                       deksripsi,
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
                      kondisi,
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
