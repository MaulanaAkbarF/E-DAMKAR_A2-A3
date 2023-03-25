import 'dart:convert';

import 'package:edamkar_1/models/LoginModel.dart';
import 'package:http/http.dart' as http;

const String _baseUrl = 'http://188.10.10.253/MobileAPI/E_DamkarRestAPI/';

class APIClient {
  var client = http.Client();

  Future<dynamic> getData(String api) async{
    var url = Uri.parse(_baseUrl + api + ".php");
    var response = await client.get(url);
    
    if(response.statusCode == 200){
      return response.body;
    }else{
      throw Exception();
    }
  }

   Future<dynamic> postData(String api, dynamic object) async{
    var url = Uri.parse(_baseUrl + api + ".php");
   
    var payload = json.decode(object);   
    var response = await client.post(url, body: payload);
    
    if(response.statusCode == 200){
      return response.body;
    }else{
      throw Exception();
    }
  }
   Future<dynamic> putData(String api) async{
    var url = Uri.parse(_baseUrl + api + ".php");
    var response = await client.put(url);
    
    if(response.statusCode == 200){
      return response.body;
    }else{
      throw Exception();
    }
  }

 
}
