import 'dart:convert';

import 'package:first_project/core/constant/statusrequest.dart';
import 'package:first_project/core/function/checkinternet.dart';
import 'package:http/http.dart' as http;
import "package:dartz/dartz.dart";

String _basicAuth =
    'Basic ' + base64Encode(utf8.encode('firstproject:firstproject12345'));

Map<String, String> myheaders = {'authorization': _basicAuth};

class Crud {
  Future<Either<dynamic, StatusRequest>> postData(String url, Map data) async {
    try {
      if (await checkinternet()) {
        var response =
            await http.post(Uri.parse(url), body: data, headers: myheaders);
        print(
            "=======================Response Crud===========================${response.body}");
        if (response.statusCode == 200 || response.statusCode == 201) {
          var responsedata = jsonDecode(response.body);
          return Left(responsedata);
        } else {
          return right(StatusRequest.serverfailure);
        }
      } else {
        return right(StatusRequest.offline);
      }
    } catch (e) {
      return right(StatusRequest.serverexception);
    }
  }
}
