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
        appBar: AppBar(
        leading: IconButton(
           icon:Icon(Icons.arrow_back_ios_new_outlined),
           onPressed: (){},
        ),
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
        body: Scaffold(
    
        
      ),
      
    );
  }
}
