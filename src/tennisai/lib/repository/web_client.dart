import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:path/path.dart';
import 'package:http/http.dart' as httpdart;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../keys/keys.dart';
import '../models/models.dart';
import '../paths/paths.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// A class that is meant to represent a Client that would be used to call a Web
/// Service. It is responsible for fetching and persisting WatchedTournaments to and from the
/// cloud.
///
/// Since we're trying to keep this example simple, it doesn't communicate with
/// a real server but simply emulates the functionality.
class WebClient {
  final Duration delay;
  final String hostAddress;
  const WebClient([this.delay = const Duration(milliseconds: 3000), this.hostAddress = TennisAiConfigs.azureHostName]);

  Future<List<TournamentEntity>> fetchWatchedTournaments() async {
    print('web_client.fetchWatchedTournaments(): About to make service call');
    return getTournamentsFromControllerWithUserId("watched", "12");
  }

  Future<String> getAuthToken(){
    var flutterSecureStorage = new FlutterSecureStorage();
    return flutterSecureStorage.read(key: "authtoken");
  }

  Future<List<TournamentEntity>> getTournamentsFromControllerWithUserId(
      String controller, String userId) async {
    var httpClient = new HttpClient();
    List<TournamentEntity> tournaments = [];
    print('GetTournaments called');
    var uri = new Uri.http(
        hostAddress, '/api/$controller', {
      'id': userId,
    });
    var request = await httpClient.getUrl(uri);
    request.headers.add('zumo-api-version', '2.0.0');
    var response = await request.close();
    var responseBody = await response.transform(UTF8.decoder).join();
    var jsonData = JSON.decode(responseBody);

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
    var jsonData = JSON.decode(responseBody);

    for (int i = 0; i < jsonData.length; i++) {
      matchResults.add(MatchResultInfoEntity.fromJson(jsonData[i]));
    }
    return matchResults;
  }

  Future<List<RankingInfoEntity>> getRankings(String userId) async {
    var httpClient = new HttpClient();
    List<RankingInfoEntity> matchResults = [];
    var uri = new Uri.http(
        hostAddress, '/api/rankinginfo', {
      'id': userId,
    });
    var request = await httpClient.getUrl(uri);
    request.headers.add('zumo-api-version', '2.0.0');
    var response = await request.close();
    var responseBody = await response.transform(UTF8.decoder).join();
    var jsonData = JSON.decode(responseBody);

    for (int i = 0; i < jsonData.length; i++) {
      matchResults.add(RankingInfoEntity.fromJson(jsonData[i]));
    }
    return matchResults;
  }

  Future<List<SearchPreferenceEntity>> getSearchPreference(
      String userId) async {
    List<SearchPreferenceEntity> searchPreferences = [];
    var uri = new Uri.http(
        hostAddress, '/api/searchpreference', {
      'id': userId,
    });

    var jsonData = await makeHttpCall(uri);

    for (int i = 0; i < jsonData.length; i++) {
      searchPreferences.add(SearchPreferenceEntity.fromJson(jsonData[i]));
    }
    return searchPreferences;
  }

  Future<List<TournamentEntity>> getTournamentsByDefaultSearchPreferences(String playerId) async {
    List<TournamentEntity> tournaments = [];
    var uri = new Uri.http(hostAddress,
        '/api/tournaments/$playerId/searchpreference');

    var jsonData = await makeHttpCall(uri);

    for (var json in jsonData) {
      tournaments.add(TournamentEntity.fromJson(json));
    }
    return tournaments;
  }

  Future<BasketEntity> getBasket(String playerId) async {
    var uri = new Uri.http(hostAddress, '/api/basket/$playerId/getplayerbasket');

    var jsonData = await makeHttpCall(uri);

    var basket  = BasketEntity.fromJson(jsonData);
    return basket;
  }

  Future<List<PlayerEntity>> getPlayers(String playerId) async {
    var uri = new Uri.http(hostAddress, '/api/players/$playerId/getplayerprofile');
    List<PlayerEntity> players = [];
    var jsonData = await makeHttpCall(uri);

    for (var json in jsonData) {
      players.add(PlayerEntity.fromJson(json));
    }
    return players;

  }

  Future<dynamic> makeHttpCall(Uri uri) async {
    //var authToken = await getAuthToken();
    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(uri);
    request.headers.add('zumo-api-version', '2.0.0');
    //request.headers.add('x-zumo-auth', authToken);
    var response = await request.close();
    var responseBody = await response.transform(UTF8.decoder).join();
    var jsonData = JSON.decode(responseBody);
    return jsonData;
  }

  Future<dynamic> makeHttpPostCall(Uri uri, String jsonRequestBody) async {
    var httpClient = new HttpClient();
    var request = await httpClient.postUrl(uri);
    request.headers.contentType = new ContentType("application", "json", charset: "utf-8");
    request.headers.add('zumo-api-version', '2.0.0');
    request.write(jsonRequestBody);
    var response = await request.close();
    if(response.statusCode == 200)
    {
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

  Future<List<TournamentEntity>> fetchEnteredTournaments() async {
    print('web_client.fetchEnteredTournaments(): About to make service call');
    return getTournamentsFromControllerWithUserId("entered", "12");
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

  /// Mock that returns true or false for success or failure. In this case,
  /// it will "Always Succeed"
  Future<bool> postPlayerProfile(PlayerEntity playerProfile) async {
    return new Future.value(true);
  }

  /// Mock that returns true or false for success or failure. In this case,
  /// it will "Always Succeed"
  Future<bool> postSearchPreference(SearchPreferenceEntity searchPref) async {
    return new Future.value(true);
  }

  /// Mock that returns true or false for success or failure. In this case,
  /// it will "Always Succeed"
  Future<bool> postSearchTournaments(
      List<TournamentEntity> searchTounaments) async {
    return new Future.value(true);
  }

  Future<bool> postAvatarImage(String playerId, File avatar) async
  {
    // TODO: 
    var uri = new Uri.http(TennisAiPaths.server, TennisAiPaths.imageUploadPath(playerId));
    var request  = httpdart.MultipartRequest('POST', uri);
    var fileBytes = avatar.readAsBytesSync();
    var multipartFile = new httpdart.MultipartFile.fromBytes('file', fileBytes, filename:  basename(avatar.path));
    request.files.add(multipartFile);
  
    request.headers.putIfAbsent('zumo-api-version', () => '2.0.0');
    
    var response = await request.send();
    if(response.statusCode == 200)
    {
      return true;
    }
     return new Future.value(true);
  }

  Future<List<TournamentEntity>> fetchSearchTournaments() async {
    return getTournamentsByDefaultSearchPreferences("12");
  }

  Future<List<TournamentEntity>> loadTournamentsWithSearchPreference(SearchPreference searchPreference) async {
    List<TournamentEntity> tournaments = [];
    var uri = new Uri.http(hostAddress, '/api/tournaments/${searchPreference.ageGroup}/${searchPreference.grade}/${searchPreference.gender}/${searchPreference.distance}/${searchPreference.statusIndex}/searchall');
    var jsonData = await makeHttpCall(uri);

    for (var json in jsonData) {
      tournaments.add(TournamentEntity.fromJson(json));
    }
    return tournaments;
  }

  // Search Preference
  Future<List<SearchPreferenceEntity>> fetchSearchPreference() async {
    return getSearchPreference("12");
  }

  // RankingInfos
  Future<List<RankingInfoEntity>> fetchRankingInfos() async {
    return getRankings("12");
  }

  // MatchResulInfos
  Future<List<MatchResultInfoEntity>> fetchMatchResultInfos() async {
    return getMatchResult("12");
  }

  // Basket
  Future<List<BasketEntity>> fetchBasket() async {
    var playerId = '12';
    List<BasketEntity> tEntities = [];
    tEntities.add(await getBasket(playerId));
    print('before delayed ${tEntities.length}');
    return new Future.delayed(delay, () => tEntities);
  }

  Future<bool> postBasket(BasketEntity basketEntity) async {
    var jsonRequest =  JSON.encode(basketEntity.toJson());
    var uri = new Uri.http(hostAddress,'/api/basket');
    var response = await makeHttpPostCall(uri, jsonRequest);
    return response;
  }

  Future<bool> postToLtaBasket(BasketEntity basketEntity) async {
    var jsonRequest =  JSON.encode(basketEntity.toJson());
    var uri = new Uri.http(hostAddress,'/api/baskettolta');
    var response = await makeHttpPostCall(uri, jsonRequest);
    return response;
  }
}

SearchPreference searchPreference = new SearchPreference(
    ltaNumber: 723492222, ageGroup: 19, distance: 50, gender: 'male', grade: 3);
