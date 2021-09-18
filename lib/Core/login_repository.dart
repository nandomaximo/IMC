import 'dart:convert';
import 'package:http/http.dart' as http;

import 'constants.dart';

class LoginRepository{

  Future<int> login(String email, String senha) async{
    var header = {"Content-Type" : "application/json"};


    Map params = {
      "email" : email,
      "password" : senha,
      "returnSecureToken":true
    };

    var _body = json.encode(params);


    var url = Uri.parse(ApiUrls.BASEURLLOGIN+"signInWithPassword?key=${ApiUrls.ApiKey}");

    var response = await http.post(url,
        headers:header,
        body: _body);

    print(response.body);

    return response.statusCode;
  }

}