import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:path/path.dart';
import 'package:http/http.dart' as httpdart;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/models.dart';
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

  Future<List<TournamentEntity>> fetchWatchedTournaments(String playerId) async {
    return getTournamentsFromControllerWithUserId("watched", playerId);
  }

  Future<String> getAuthToken() {
    var flutterSecureStorage = new FlutterSecureStorage();
    return flutterSecureStorage.read(key: "authtoken");
  }

  Future<List<TournamentEntity>> getTournamentsFromControllerWithUserId(
      String controller, String userId) async {
    var httpClient = new HttpClient();
    List<TournamentEntity> tournaments = [];
    print('GetTournaments called');
    var uri = new Uri.http(hostAddress, '/api/$controller', {
      'id': userId,
    });
    var request = await httpClient.getUrl(uri);
    request.headers.add('zumo-api-version', '2.0.0');
    var response = await request.close();
    var responseBody = await response.transform(UTF8.decoder).join();
    var jsonData = json.decode(responseBody);

    for (int i = 0; i < jsonData.length; i++) {
      tournaments.add(TournamentEntity.fromJson(jsonData[i]));
    }
    return tournaments;
  }

  Future<List<MatchResultInfoEntity>> getMatchResult(String userId) async {
    var httpClient = new HttpClient();
    List<MatchResultInfoEntity> matchResults = [];
    var uri = new Uri.http(hostAddress, '/api/tournamentresult', {
      'id': userId,
    });
    var request = await httpClient.getUrl(uri);
    request.headers.add('zumo-api-version', '2.0.0');
    var response = await request.close();
    var responseBody = await response.transform(UTF8.decoder).join();
    var jsonData = json.decode(responseBody);

    for (int i = 0; i < jsonData.length; i++) {
      matchResults.add(MatchResultInfoEntity.fromJson(jsonData[i]));
    }
    return matchResults;
  }

  Future<List<RankingInfoEntity>> getRankings(String userId) async {
    var httpClient = new HttpClient();
    List<RankingInfoEntity> matchResults = [];
    var uri = new Uri.http(hostAddress, '/api/rankinginfo', {
      'id': userId,
    });
    var request = await httpClient.getUrl(uri);
    request.headers.add('zumo-api-version', '2.0.0');
    var response = await request.close();
    var responseBody = await response.transform(UTF8.decoder).join();
    var jsonData = json.decode(responseBody);

    for (int i = 0; i < jsonData.length; i++) {
      matchResults.add(RankingInfoEntity.fromJson(jsonData[i]));
    }
    return matchResults;
  }

  Future<List<SearchPreferenceEntity>> getSearchPreference(
      String userId) async {
    List<SearchPreferenceEntity> searchPreferences = [];
    var uri = new Uri.http(hostAddress, '/api/searchpreference', {
      'id': userId,
    });

    var response = await makeHttpCall(uri);

    for (int i = 0; i < response.jsonData.length; i++) {
      searchPreferences
          .add(SearchPreferenceEntity.fromJson(response.jsonData[i]));
    }
    return searchPreferences;
  }

  Future<List<TournamentEntity>> getTournamentsByDefaultSearchPreferences(
      String playerId) async {
    List<TournamentEntity> tournaments = [];
    var uri = new Uri.http(
        hostAddress, '/api/tournaments/$playerId/searchpreference');

    var response = await makeHttpCall(uri);

    for (var json in response.jsonData) {
      tournaments.add(TournamentEntity.fromJson(json));
    }
    return tournaments;
  }

  Future<BasketEntity> getBasket(String playerId) async {
    var uri =
        new Uri.http(hostAddress, '/api/basket/$playerId/getplayerbasket');

    var response = await makeHttpCall(uri);

    var basket = BasketEntity.fromJson(response.jsonData);
    return basket;
  }

  Future<List<PlayerEntity>> getPlayers(String playerId) async {
    var uri =
        new Uri.http(hostAddress, '/api/players/$playerId/getplayerprofile');
    List<PlayerEntity> players = [];
    var response = await makeHttpCall(uri);
    if (response.statusCode == 200) {
      for (var json in response.jsonData) {
        players.add(PlayerEntity.fromJson(json));
      }
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
      var responseBody = await response.transform(UTF8.decoder).join();
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
      List<TournamentEntity> watchedTournaments) async {
    return new Future.value(true);
  }

  Future<List<TournamentEntity>> fetchEnteredTournaments(String playerId) async {
    print('web_client.fetchEnteredTournaments(): About to make service call');
    return getTournamentsFromControllerWithUserId("entered", playerId);
  }

  /// Mock that returns true or false for success or failure. In this case,
  /// it will "Always Succeed"
  Future<bool> postEnteredTournaments(
      List<TournamentEntity> enteredTournaments) async {
    return new Future.value(true);
  }

  // Player Profile
  Future<List<PlayerEntity>> fetchPlayerProfile(String playerId) async {
    List<PlayerEntity> tEntities = [];
    tEntities.addAll(await getPlayers(playerId));

    return tEntities;
  }

  Future<bool> postPlayerProfile(PlayerEntity playerProfile) async {
    var jsonRequest = json.encode(playerProfile.toJson());
    var uri = new Uri.http(hostAddress, '/api/players');
    var response = await makeHttpPostCall(uri, jsonRequest);
    return response;
  }

  Future<bool> postSearchPreference(SearchPreferenceEntity searchPref) async {
    var jsonRequest = json.encode(searchPref.toJson());
    var uri = new Uri.http(hostAddress, '/api/searchpreference');
    var response = await makeHttpPostCall(uri, jsonRequest);
    return response;
  }

  /// Mock that returns true or false for success or failure. In this case,
  /// it will "Always Succeed"
  Future<bool> postSearchTournaments(
      List<TournamentEntity> searchTounaments) async {
    return new Future.value(true);
  }

  Future<bool> postAvatarImage(String playerId, File avatar) async {
    // TODO:
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

  Future<List<TournamentEntity>> fetchSearchTournaments(String playerId) async {
    return getTournamentsByDefaultSearchPreferences(playerId);
  }

  Future<List<TournamentEntity>> loadTournamentsWithSearchPreference(
      SearchPreference searchPreference) async {
    List<TournamentEntity> tournaments = [];
    var uri = new Uri.http(hostAddress,
        '/api/tournaments/${searchPreference.ageGroup}/${searchPreference.grade}/${searchPreference.gender}/${searchPreference.distance}/${searchPreference.statusIndex}/searchall');
    var response = await makeHttpCall(uri);
    if (response.statusCode == 200) {
      for (var json in response.jsonData) {
        tournaments.add(TournamentEntity.fromJson(json));
      }
    }
    return tournaments;
  }

  // Search Preference
  Future<List<SearchPreferenceEntity>> fetchSearchPreference(String playerId) async {
    return getSearchPreference(playerId);
  }

  // RankingInfos
  Future<List<RankingInfoEntity>> fetchRankingInfos(String playerId) async {
    return getRankings(playerId);
  }

  // MatchResulInfos
  Future<List<MatchResultInfoEntity>> fetchMatchResultInfos(String playerId) async {
    return getMatchResult(playerId);
  }

  // Basket
  Future<List<BasketEntity>> fetchBasket(String playerId) async {
    List<BasketEntity> tEntities = [];
    tEntities.add(await getBasket(playerId));
    print('before delayed ${tEntities.length}');
    return tEntities;
  }

  Future<bool> postBasket(BasketEntity basketEntity) async {
    var jsonRequest = json.encode(basketEntity.toJson());
    var uri = new Uri.http(hostAddress, '/api/basket');
    var response = await makeHttpPostCall(uri, jsonRequest);
    return response;
  }

  Future<bool> postToLtaBasket(BasketEntity basketEntity) async {
    var jsonRequest = json.encode(basketEntity.toJson());
    var uri = new Uri.http(hostAddress, '/api/baskettolta');
    var response = await makeHttpPostCall(uri, jsonRequest);
    return response;
  }
}

SearchPreference searchPreference = new SearchPreference(
    ltaNumber: 723492222, ageGroup: 19, distance: 50, gender: 1, grade: 3);
