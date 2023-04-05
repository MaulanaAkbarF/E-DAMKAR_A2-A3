import 'package:flutter/material.dart';

class DetailRiwayatLengkap extends StatefulWidget {
  final String riwayatid;
  const DetailRiwayatLengkap(this.riwayatid);

  @override
  State<DetailRiwayatLengkap> createState() => _DetailRiwayatLengkapState();
}

class _DetailRiwayatLengkapState extends State<DetailRiwayatLengkap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
            "Riwayat Laporan",
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
