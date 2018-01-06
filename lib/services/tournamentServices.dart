import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:io';

class TennisAiServices {

  String appName = "TennisAi";
  String appVersion = "0.1";
  String BASE_URL = 'http://localhost/TennisAiServiceService/api/tournaments';

  Object GetTournaments() async {
    var httpClient = new HttpClient();
    
    print('GetTournaments called');
    var uri = new Uri.http('192.168.1.156:45455','/api/tournaments');
    var request = await httpClient.getUrl(uri);
    request.headers.add('zumo-api-version', '2.0.0');
    print('Header set');

    var response = await request.close();
    print('request closed');

    var responseBody = await response.transform(UTF8.decoder).join();
    print('response body transformed');

    // Map<String, String> headers = new Map<String, String>();
    // headers["zumo-api-version"] = "2.0.0";

    // var response =
    //     await http.read('${BASE_URL}', headers: headers);
    // var jsonData = JSON.decode();
    print(responseBody);
    print('done');
    return responseBody;
  }
}
