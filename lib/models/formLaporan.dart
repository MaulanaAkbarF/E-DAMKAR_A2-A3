import 'package:flutter/material.dart';

class AppForm extends StatefulWidget {
// Required for form validations
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
// Handles text onchange
  TextEditingController nomorTelpController;
  TextEditingController deskripsiController;

  AppForm(
      {required this.formKey,
      required this.nomorTelpController,
      required this.deskripsiController});
  @override
  _AppFormState createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  // String? _validateName(String value) {
  //   return value.isEmpty ? "Email can't be empty" : null;
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: widget.formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: widget.nomorTelpController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Name'),
            // validator: _validateName,
          ),
          TextFormField(
            controller: widget.deskripsiController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Email'),
            // validator: _validateName,
          ),
        ],
      ),
    );
  }
}
