class cobadata {
  String idLap;
  String title;
  String alamat;
  String deskripsi;
  String tanggal;
  String status;

  cobadata(
      {required this.idLap,
      required this.title,
      required this.alamat,
      required this.deskripsi,
      required this.tanggal,
      required this.status
      });
}

List<cobadata> cobaList = [
  cobadata(
      idLap: "1",
      title: "Evakuasi Kebakaran",
      alamat: "Desa Aru, Kecamatan Sumeru, Kabupaten Sumeru, Teyvat ",
      deskripsi: "kebakaran terjadi karena tabung gas pemanas pada salah "
          "satu bilik pabrik mengalami kebocoran gas yang akhirnya menjalar ke bilik lainnya",
      tanggal: "2023-04-12",
      status: 'Menunggu'),
  cobadata(
      idLap: "2",
      title: "Evakuasi Kebakaran",
      alamat: "Desa Aru, Kecamatan Sumeru, Kabupaten Sumeru, Teyvat ",
      deskripsi: "kebakaran terjadi karena tabung gas pemanas pada salah "
          "satu bilik pabrik mengalami kebocoran gas yang akhirnya menjalar ke bilik lainnya",
      tanggal: "2023-01-20",
      status: 'Menunggu'),
  cobadata(
      idLap: "3",
      title: "Evakuasi Kebakaran",
      alamat: "Desa Aru, Kecamatan Sumeru, Kabupaten Sumeru, Teyvat ",
      deskripsi: "kebakaran terjadi karena tabung gas pemanas pada salah "
          "satu bilik pabrik mengalami kebocoran gas yang akhirnya menjalar ke bilik lainnya",
      tanggal: "2023-04-23",
      status: 'Menunggu'),
  cobadata(
      idLap: "4",
      title: "Evakuasi Kebakaran",
      alamat: "Desa Aru, Kecamatan Sumeru, Kabupaten Sumeru, Teyvat ",
      deskripsi: "kebakaran terjadi karena tabung gas pemanas pada salah "
          "satu bilik pabrik mengalami kebocoran gas yang akhirnya menjalar ke bilik lainnya",
      tanggal: "2023-12-3",
      status: 'Menunggu'),
];
