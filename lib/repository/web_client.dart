import 'dart:io';
import 'dart:async';
import 'dart:convert';
import '../models/models.dart';

/// A class that is meant to represent a Client that would be used to call a Web
/// Service. It is responsible for fetching and persisting WatchedTournaments to and from the
/// cloud.
///
/// Since we're trying to keep this example simple, it doesn't communicate with
/// a real server but simply emulates the functionality.
class WebClient {
  final Duration delay;

  const WebClient([this.delay = const Duration(milliseconds: 3000)]);

  Future<List<TournamentEntity>> fetchWatchedTournaments() async {
    print('web_client.fetchWatchedTournaments(): About to make service call');
    return getTournamentsFromControllerWithUserId("watched", "12");
  }

  Future<List<TournamentEntity>> getTournamentsFromControllerWithUserId(
      String controller, String userId) async {
    var httpClient = new HttpClient();
    List<TournamentEntity> tournaments = [];
    print('GetTournaments called');
    var uri = new Uri.http(
        '192.168.1.156:55511', '/TennisAiServiceService/api/$controller', {
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
    var uri = new Uri.http(
        '192.168.1.156:55511', '/TennisAiServiceService/api/tournamentresult', {
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
        '192.168.1.156:55511', '/TennisAiServiceService/api/rankinginfo', {
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
        '192.168.1.156:55511', '/TennisAiServiceService/api/searchpreference', {
      'id': userId,
    });

    var jsonData = await makeHttpCall(uri);

    for (int i = 0; i < jsonData.length; i++) {
      searchPreferences.add(SearchPreferenceEntity.fromJson(jsonData[i]));
    }
    return searchPreferences;
  }

  Future<List<TournamentEntity>> getTournamentsByDefaultSearchPreferences(
      String playerId) async {
    List<TournamentEntity> tournaments = [];
    var uri = new Uri.http('192.168.1.156:55511',
        '/TennisAiServiceService/api/tournaments/$playerId/searchpreference');

    var jsonData = await makeHttpCall(uri);

    for (var json in jsonData) {
      tournaments.add(TournamentEntity.fromJson(json));
    }
    return tournaments;
  }

  Future<BasketEntity> getBasket(String playerId) async {
    var uri = new Uri.http('192.168.1.156:55511', '/TennisAiServiceService/api/basket/$playerId/getplayerbasket');

    var jsonData = await makeHttpCall(uri);

    var basket  = BasketEntity.fromJson(jsonData);
    return basket;
  }

  Future<dynamic> makeHttpCall(Uri uri) async {
    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(uri);
    request.headers.add('zumo-api-version', '2.0.0');
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
  Future<List<PlayerEntity>> fetchPlayerProfile() async {
    List<PlayerEntity> tEntities = [];

    tEntities.add(player.toEntity());
    return new Future.delayed(delay, () => tEntities);
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

  Future<List<TournamentEntity>> fetchSearchTournaments() async {
    return getTournamentsByDefaultSearchPreferences("12");
  }

  Future<List<TournamentEntity>> loadTournamentsWithSearchPreference(SearchPreference searchPreference) async {
    List<TournamentEntity> tournaments = [];
    var uri = new Uri.http('192.168.1.156:55511', '/TennisAiServiceService/api/tournaments/${searchPreference.ageGroup}/${searchPreference.grade}/${searchPreference.gender}/${searchPreference.distance}/${searchPreference.statusIndex}/searchall');
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

  // Basket
  Future<List<BasketEntity>> fetchBasket() async {
    var playerId = '12';
    List<BasketEntity> tEntities = [];
    tEntities.add(await getBasket(playerId));
    print('before delayed ${tEntities.length}');
    return new Future.delayed(delay, () => tEntities);
  }

  // RankingInfos
  Future<List<RankingInfoEntity>> fetchRankingInfos() async {
    return getRankings("12");
  }

  // MatchResulInfos
  Future<List<MatchResultInfoEntity>> fetchMatchResultInfos() async {
    return getMatchResult("12");
  }

  Future<bool> postBasket(BasketEntity basketEntity) async {
    var jsonRequest =  JSON.encode(basketEntity.toJson());
    var uri = new Uri.http('192.168.1.156:55511','/TennisAiServiceService/api/basket');
    var response = await makeHttpPostCall(uri, jsonRequest);
    return response;
  }

  Future<bool> postToLtaBasket(BasketEntity basketEntity) async {
    var jsonRequest =  JSON.encode(basketEntity.toJson());
    var uri = new Uri.http('192.168.1.156:55511','/TennisAiServiceService/api/baskettolta');
    var response = await makeHttpPostCall(uri, jsonRequest);
    return response;
  }
}


SearchPreference searchPreference = new SearchPreference(
    ltaNumber: 723492222, ageGroup: 19, distance: 50, gender: 'male', grade: 3);

Player player = new Player(
    firstName: 'wilson',
    lastName: 'babolat',
    email: 'Wilson@babalot.com',
    ltaNumber: 723492222,
    ltaRanking: 33,
    ltaRating: '2.1',
    address: '69 West Field Sheds',
    postCode: 'KT31 4KU',
    county: 'Surrey');
