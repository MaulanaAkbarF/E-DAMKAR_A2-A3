import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:edamkar_1/models/ProfilModel.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:edamkar_1/style/app_style.dart';
import '../APIRequest/APIClient.dart';
import '../SharedPreferences/dataUser.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter/services.dart' show PlatformException;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'Profil.dart';

class EditProfilePage extends StatefulWidget {
  late final int userId;
  EditProfilePage(this.userId);
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var Name = 'user1';
  var UserPic = "";
  var _email = "";
  var nohp = "";

  late final _idUser = "";

  TextEditingController? getNama;
  //TextEditingController? getnoHp;

  void getUserData() async {
    var data = DataUser().getNama();
    var gambar = DataUser().getGambar();
    var nomor = DataUser().getNoHp();
    var email = DataUser().getEmail();
    var noHp = DataUser().getNoHp();

    gambar.then((value) {
      setState(() {
        UserPic = value.toString();
      });
    });
    noHp.then((value) {
      setState(() {
        nohp = value.toString();
      });
    });

    data.then((value) {
      setState(() {
        Name = value.toString();
      });
    });
    email.then((value) {
      setState(() {
        _email = value.toString();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getUserData();
    // widget.userId = _idUser as int;
  }

  File? _image;
  String? _namaFile;
  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
        // Random random = Random();
        // String namaFileBaru = "profile${random.nextInt(1000)}";
        // String pathBaru =
        //     Path.join(Path.dirname(_image.toString()), namaFileBaru);
        _namaFile = Path.basename(_image.toString());
        // Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      print("eror gambar :: ${e}");
      // Navigator.of(context).pop();
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  ImageProvider ChangeProfile({String? urlGambar, File? gambar}) {
    if (gambar == null) {
      if (urlGambar == "" || urlGambar == null) {
        return AssetImage("semuaAset/gambar/user1.png") as ImageProvider;
      } else {
        return NetworkImage(
                //http://172.16.106.227:8000/storage/public/foto_user/Snipaste_2023-05-15_08-47-07.png
                "${APIClient.gambar}storage/public/foto_user/${urlGambar.replaceAll("'", "")}")
            as ImageProvider;
      }
    } else {
      return FileImage(gambar) as ImageProvider;
    }
  }

  void pushUpdate() {
    if (_formKey.currentState!.validate()) {
      print("Nama File Nya adalah == ${_namaFile}");
      if (_image == null || _namaFile == "") {
        UpdateProfil.ubahProfil(widget.userId.toString(), nama.text, noHp.text)
            .then((value) => {
                  if (value.kode.toString() == "200")
                    {
                      toss(context),
                      DataUser()
                          .udpateUser(nama.text, noHp.text, UserPic.toString())
                    }
                  else
                    {gagal(context)}
                });
      } else {
        UpdateProfil.sendRequestWithFile(
                nama: nama.text,
                nomorHp: noHp.text,
                id_akun: widget.userId.toString(),
                delPic: UserPic.toString(),
                file: _image)
            .then((value) => {
                  if (value.kode.toString() == "200")
                    {
                      DataUser().udpateUser(
                          nama.text, noHp.text, _namaFile.toString()),
                      toss(context)
                    }
                  else
                    {gagal(context)}
                });
      }
    } else {
      gagal(context);
    }
  }

  final _formKey = GlobalKey<FormState>();
  final nama = TextEditingController();
  final noHp = TextEditingController();
  TextEditingController? getNoHp;
  String _message = '';

  @override
  void dispose() {
    nama.dispose();
    noHp.dispose();
    super.dispose();
  }

  toss(BuildContext context) {
    final snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      padding: EdgeInsets.all(16),
      behavior: SnackBarBehavior.fixed,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Berhasil',
        message: 'Anda Berhasil Merubah Profil',

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: ContentType.success,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
    Navigator.pop(context);
  }

  gagal(BuildContext context) {
    final snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      padding: EdgeInsets.all(16),
      behavior: SnackBarBehavior.fixed,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Gagal',
        message: 'Anda Gagal Merubah Profil',

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: ContentType.failure,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Text(
          "Ubah Profil",
          style: TextStyle(color: Colors.black87, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: paddingVertical4),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: ChangeProfile(
                          urlGambar: UserPic.toString(), gambar: _image),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: -7,
                            right: -7,
                            child: Transform.scale(
                              scale: 0.65,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.red.shade400,
                                    shape: BoxShape.circle),
                                child: IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () {
                                      print("tesss");
                                      _pickImage(ImageSource.gallery);
                                    }),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: paddingHorozontal2,
                      ),
                      child: Align(
                        alignment: FractionalOffset.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text("Nama"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: paddingHorozontal2,
                      ),
                      child: Align(
                        alignment: FractionalOffset.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: Colors.grey.shade300, width: 1.2)),
                            child: TextFormField(
                              controller: nama,
                              //readOnly: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'nama lengkap tidak boleh kosong';
                                } else if (value.length > 50) {
                                  return 'nama lengkap terlalu panjang';
                                }
                              },

                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  hintText: '$Name',
                                  prefixIcon: Icon(Icons.person),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 13, 10, 7),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: paddingHorozontal2,
                      ),
                      child: Align(
                        alignment: FractionalOffset.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 20),
                          child:
                              Text("Nomor HP (Harus Memasukan Nomor Telepon)"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: paddingHorozontal2,
                      ),
                      child: Align(
                        alignment: FractionalOffset.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: Colors.grey.shade300, width: 1.2)),
                            child: TextFormField(
                              controller: noHp,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'nomor hp tidak boleh kosong';
                                } else if (value.length > 13) {
                                  return 'nomor hp terlalu panjang';
                                } else if (value.length < 10) {
                                  return 'nomor hp terlalu pendek';
                                }
                              },
                              //readOnly: true,

                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  hintText: '$nohp',
                                  prefixIcon: Icon(Icons.person),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 13, 10, 7),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: paddingHorozontal4),
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Material(
                            color: Colors.red.shade400,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            borderRadius: BorderRadius.circular(8),
                            child: InkWell(
                              splashColor: Colors.red.shade700,
                              highlightColor: Colors.red.shade900,
                              onTap: pushUpdate,
                              child: Container(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Simpan",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  showLoadingDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  bottomSheet(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          Text(
            "Memilih Foto Profil",
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              TextButton.icon(
                  icon: Icon(Icons.camera),
                  onPressed: () {},
                  label: Text("Kamera")),
              TextButton.icon(
                  icon: Icon(Icons.image),
                  onPressed: () {},
                  label: Text("Galeri")),
            ],
          )
        ],
      ),
    );
  }
}
