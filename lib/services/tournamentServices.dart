import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:async';
import '../models/tournament.dart';
import '../models/player.dart';
import '../models/models.dart';

class TennisAiServices {
  String appName = "TennisAi";
  String appVersion = "0.1";
  String BASE_URL = 'http://localhost/TennisAiServiceService/api/tournaments';

  List<Entrant> _decodeEntrants(dynamic jsonData) {
    List<Entrant> entrants = [];
    for (int i = 0; i < jsonData.length; i++) {
      var entrant = new Entrant(
          ltaNumber: int.parse(jsonData[i]['btmNumber']),
          ranking: int.parse(jsonData[i]['ranking']),
          rating: jsonData[i]['rating'],
          name: jsonData[i]['name'],
          status: jsonData[i]['status']);
      entrants.add(entrant);
    }
    return entrants;
  }

  Future<List<Tournament>> GetTournaments() async {
    var httpClient = new HttpClient();
    List<Tournament> tournaments = [];
    print('GetTournaments called');
    var uri = new Uri.http('192.168.1.156:45455', '/api/tournaments');
    var request = await httpClient.getUrl(uri);
    request.headers.add('zumo-api-version', '2.0.0');
    print('Header set');

    var response = await request.close();
    print('request closed');

    var responseBody = await response.transform(UTF8.decoder).join();
    print('response body transformed');
    var jsonData = JSON.decode(responseBody);

    for (int i = 0; i < jsonData.length; i++) {
      var tournament = new Tournament(
          code: jsonData[i]['code'],
          name: jsonData[i]['name'],
          grade: jsonData[i]['grade'],
          location: jsonData[i]['location'],
          status: jsonData[i]['status'],
          numberOfEntrants: int.parse(jsonData[i]['numberOfEntrants']),
          startDate: DateTime.parse(jsonData[i]['startDate']),
          endDate: DateTime.parse(jsonData[i]['endDate']),
          entrants: _decodeEntrants(jsonData[i]['entrantDtos']));
      tournaments.add(tournament);
    }

    print(tournaments[0].entrants[0].name);
    print('done');
    return tournaments;
  }

  Future<Player> GetPlayer(String id) async {
    var httpClient = new HttpClient();

    var uri = new Uri.http('192.168.1.156:45455', '/api/players/${id}');
    var request = await httpClient.getUrl(uri);
    request.headers.add('zumo-api-version', '2.0.0');

    var response = await request.close();
    print('request closed');

    var responseBody = await response.transform(UTF8.decoder).join();
    print('response body transformed for PlayerDto');
    var jsonData = JSON.decode(responseBody);

    print(jsonData[0]['name']);

    for (int i = 0; i < jsonData.length; i++) {
      var player = new Player(email:   jsonData[i]['email'], firstName:  jsonData[i]['name']);
    }
  }
}
