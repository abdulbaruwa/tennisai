import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:swagger/api.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as httpdart;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../paths/paths.dart';

class WebCallResponse {
  final int statusCode;
  final dynamic jsonData;
  WebCallResponse({this.statusCode, this.jsonData});
}

/// A class that is meant to represent a Client that would be used to call a Web
/// Service. It is responsible for fetching and persisting WatchedTournaments to and from the
/// cloud.
class WebClient {
  final String hostAddress;
  final Future<String> Function() getToken;
  const WebClient(this.hostAddress, this.getToken);

  Future<List<Tournament>> fetchWatchedTournaments(String playerId) async {
    return getTournamentsFromControllerWithUserId("watched", playerId);
  }

  Future<String> getAuthToken() {
    var flutterSecureStorage = new FlutterSecureStorage();
    return flutterSecureStorage.read(key: "authtoken");
  }

  Future<List<Tournament>> getTournamentsFromControllerWithUserId(
      String controller, String userId) async {
    var httpClient = new HttpClient();
    List<Tournament> tournaments = [];
    print('GetTournaments called');
    var uri = new Uri.http(hostAddress, '/api/$controller', {
      'id': userId,
    });
    var request = await httpClient.getUrl(uri);
    request.headers.add('zumo-api-version', '2.0.0');
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    var jsonData = json.decode(responseBody);

    for (int i = 0; i < jsonData.length; i++) {
      tournaments.add(Tournament.fromJson(jsonData[i]));
    }
    return tournaments;
  }

  Future<List<MatchResultInfo>> getMatchResult(String userId) async {
    var httpClient = new HttpClient();
    List<MatchResultInfo> matchResults = [];
    var uri = new Uri.http(hostAddress, '/api/tournamentresult', {
      'id': userId,
    });
    var request = await httpClient.getUrl(uri);
    request.headers.add('zumo-api-version', '2.0.0');
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    var jsonData = json.decode(responseBody);

    for (int i = 0; i < jsonData.length; i++) {
      matchResults.add(MatchResultInfo.fromJson(jsonData[i]));
    }
    return matchResults;
  }

  Future<List<RankingInfo>> getRankings(String userId) async {
    var httpClient = new HttpClient();
    List<RankingInfo> matchResults = [];
    var uri = new Uri.http(hostAddress, '/api/rankinginfo', {
      'id': userId,
    });
    var request = await httpClient.getUrl(uri);
    request.headers.add('zumo-api-version', '2.0.0');
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    var jsonData = json.decode(responseBody);

    for (int i = 0; i < jsonData.length; i++) {
      matchResults.add(RankingInfo.fromJson(jsonData[i]));
    }
    return matchResults;
  }

  Future<List<Tournament>> getTournamentsByDefaultSearchPreferences(
      String playerId) async {
    List<Tournament> tournaments = [];
    var uri = new Uri.http(
        hostAddress, '/api/tournaments/$playerId/searchpreference');

    var response = await makeHttpCall(uri);

    for (var json in response.jsonData) {
      tournaments.add(Tournament.fromJson(json));
    }
    return tournaments;
  }

  Future<Basket> getBasket(String playerId) async {
    var uri =
        new Uri.http(hostAddress, '/api/basket/$playerId/getplayerbasket');

    var response = await makeHttpCall(uri);

    var basket = Basket.fromJson(response.jsonData);
    return basket;
  }

  Future<List<Player>> getPlayerProfile(String playerId) async {
    var uri =
        new Uri.http(hostAddress, '/api/players/$playerId/getplayerprofile');
    List<Player> players = [];
    var response = await makeHttpCall(uri);
    if (response.statusCode == 200) {
        players.add(Player.fromJson(response.jsonData));
    }
    return players;
  }

  Future<WebCallResponse> makeHttpCall(Uri uri) async {
    //var authToken = await getAuthToken();
    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(uri);
    request.headers.add('zumo-api-version', '2.0.0');
    //request.headers.add('x-zumo-auth', authToken);
    var response = await request.close();

    if (response.statusCode == 200) {
      var responseBody = await response.transform(utf8.decoder).join();
      var jsonDataResponse = json.decode(responseBody);
      return new WebCallResponse(statusCode: response.statusCode, jsonData: jsonDataResponse);
    }
    return new WebCallResponse (statusCode: response.statusCode);
  }

  Future<dynamic> makeHttpPostCall(Uri uri, String jsonRequestBody) async {
    var token = await getToken();
    var httpClient = new HttpClient();
    var request = await httpClient.postUrl(uri);
    request.headers.contentType =
        new ContentType("application", "json", charset: "utf-8");
    request.headers.add('zumo-api-version', '2.0.0');
    request.headers.add('x-zumo-auth', token);
    request.write(jsonRequestBody);
    var response = await request.close();
    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  /// Mock that returns true or false for success or failure. In this case,
  /// it will "Always Succeed"
  Future<bool> postWatchedTournaments(
      List<Tournament> watchedTournaments) async {
    return new Future.value(true);
  }

  Future<List<Tournament>> fetchEnteredTournaments(String playerId) async {
    print('web_client.fetchEnteredTournaments(): About to make service call');
    return getTournamentsFromControllerWithUserId("entered", playerId);
  }

  /// Mock that returns true or false for success or failure. In this case,
  /// it will "Always Succeed"
  Future<bool> postEnteredTournaments(
      List<Tournament> enteredTournaments) async {
    return new Future.value(true);
  }

  // Player Profile
  Future<List<Player>> fetchPlayerProfile(String playerId) async {
    List<Player> tEntities = [];
    tEntities.addAll(await getPlayerProfile(playerId));

    return tEntities;
  }

  Future<bool> postPlayerProfile(Player playerProfile) async {
    var jsonRequest = json.encode(playerProfile.toJson());
    var uri = new Uri.http(hostAddress, '/api/players');
    var response = await makeHttpPostCall(uri, jsonRequest);
    return response;
  }

  Future<bool> postSearchPreference(SearchPreference searchPref) async {
    var jsonRequest = json.encode(searchPref.toJson());
    var uri = new Uri.http(hostAddress, '/api/searchpreference');
    var response = await makeHttpPostCall(uri, jsonRequest);
    return response;
  }

  /// Mock that returns true or false for success or failure. In this case,
  /// it will "Always Succeed"
  Future<bool> postSearchTournaments(
      List<Tournament> searchTounaments) async {
    return new Future.value(true);
  }

  Future<bool> postAvatarImage(String playerId, File avatar) async {
    var uri = new Uri.http(
        TennisAiPaths.server, TennisAiPaths.imageUploadPath(playerId));
    var request = httpdart.MultipartRequest('POST', uri);
    var fileBytes = avatar.readAsBytesSync();
    var multipartFile = new httpdart.MultipartFile.fromBytes('file', fileBytes,
        filename: basename(avatar.path));
    request.files.add(multipartFile);

    request.headers.putIfAbsent('zumo-api-version', () => '2.0.0');

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    }
    return new Future.value(true);
  }

  Future<List<Tournament>> fetchSearchTournaments(String playerId) async {
    return getTournamentsByDefaultSearchPreferences(playerId);
  }

  Future<List<Tournament>> loadTournamentsWithSearchPreference(
      SearchPreference searchPreference) async {
    List<Tournament> tournaments = [];
    var uri = new Uri.http(hostAddress,
        '/api/tournaments/${searchPreference.ageGroup}/${searchPreference.grade}/${searchPreference.gender}/${searchPreference.distance}/${searchPreference.tournamentStatus}/searchall');
    var response = await makeHttpCall(uri);
    if (response.statusCode == 200) {
      for (var json in response.jsonData) {
        tournaments.add(Tournament.fromJson(json));
      }
    }
    return tournaments;
  }

  // RankingInfos
  Future<List<RankingInfo>> fetchRankingInfos(String playerId) async {
    return getRankings(playerId);
  }

  // MatchResulInfos
  Future<List<MatchResultInfo>> fetchMatchResultInfos(String playerId) async {
    return getMatchResult(playerId);
  }

  // Basket
  Future<List<Basket>> fetchBasket(String playerId) async {
    List<Basket> tEntities = [];
    tEntities.add(await getBasket(playerId));
    print('before delayed ${tEntities.length}');
    return tEntities;
  }

  Future<bool> postBasket(Basket basketEntity) async {
    var jsonRequest = json.encode(basketEntity.toJson());
    var uri = new Uri.http(hostAddress, '/api/basket');
    var response = await makeHttpPostCall(uri, jsonRequest);
    return response;
  }

  Future<bool> postToLtaBasket(Basket basketEntity) async {
    var jsonRequest = json.encode(basketEntity.toJson());
    var uri = new Uri.http(hostAddress, '/api/baskettolta');
    var response = await makeHttpPostCall(uri, jsonRequest);
    return response;
  }
}