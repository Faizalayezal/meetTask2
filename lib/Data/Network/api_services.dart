import 'dart:convert';
import 'dart:io';

import 'package:api_quize_fluttar/Model/QZModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../app_exceptions.dart';
import 'base_api_services.dart';

class ApiServices extends BaseApiServices {
  dynamic jsonResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;

      case 400:
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;

      default:
        throw FetchDataException(
            'Error while communication ${response.statusCode}');
    }
  }



  @override
  Future getApi(String url) async {
    var jsonData;
    try {
      Response response = await http.get(Uri.parse(url),headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 50));
      debugPrint('Response Code :: ${response.statusCode}');
      debugPrint('Response Body :: ${response.body}');
    //  jsonData = jsonResponse(response);
      jsonData=response.body;
     // data = quizModelFromJson(response.body);
    } on RequestTimeOut {
      throw RequestTimeOut('Request Timeout');
    }on SocketException{
      throw InternetException('No Internet');
    }

    return jsonData;
  }
}
