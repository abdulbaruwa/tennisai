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

  /// Mock that "fetches" some watchedTournament from a "web service" after a short delay
  Future<List<TournamentEntity>> fetchWatchedTournaments() async {
    List<TournamentEntity> tEntities = [];
    watchedTournaments.forEach((f) => tEntities.add(f.toEntity()));
    print('web_client.fetchWatchedTournaments(): About to make service call');
    getTournaments().then((values) {
      print('web_client.fetchWatchedTournaments(): Call to service for tournaments returned ${values.length}');
    });

    print('before delayed ${tEntities.length}');
    return new Future.delayed(delay, () => tEntities);
  }

  Future<List<TournamentEntity>> getTournaments() async {
    var httpClient = new HttpClient();
    List<TournamentEntity> tournaments = [];
    print('GetTournaments called');
    var uri = new Uri.http('192.168.1.156:45455', '/TennisAiServiceService/api/tournaments');
    var request = await httpClient.getUrl(uri);
    request.headers.add('zumo-api-version', '2.0.0');
    print('Header set');

    var response = await request.close();
    print('request closed');

    var responseBody = await response.transform(UTF8.decoder).join();
    print('response body transformed');
    var jsonData = JSON.decode(responseBody);
  
    for (int i = 0; i < jsonData.length; i++){
        tournaments.add(TournamentEntity.fromJson(jsonData[i]));
    }

    print('done');
    return tournaments;
  }

  /// Mock that returns true or false for success or failure. In this case,
  /// it will "Always Succeed"
  Future<bool> postWatchedTournaments(
      List<TournamentEntity> watchedTournaments) async {
    return new Future.value(true);
  }

  Future<List<TournamentEntity>> fetchEnteredTournaments() async {
    List<TournamentEntity> tEntities = [];
    tournaments.forEach((f) => tEntities.add(f.toEntity()));
    print('before delayed ${tEntities.length}');
    return new Future.delayed(delay, () => tEntities);
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
    print('before delayed ${tEntities.length}');
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
    List<TournamentEntity> tEntities = [];

    tournaments.forEach((f) => tEntities.add(f.toEntity()));
    return new Future.delayed(delay, () => tEntities);
  }

  // Search Preference
  Future<List<SearchPreferenceEntity>> fetchSearchPreference() async {
    List<SearchPreferenceEntity> tEntities = [];

    tEntities.add(searchPreference.toEntity());
    print('before delayed ${tEntities.length}');
    return new Future.delayed(delay, () => tEntities);
  }

  // Basket
  Future<List<BasketEntity>> fetchBasket() async {
    List<BasketEntity> tEntities = [];
    tEntities.add(basket);
    print('before delayed ${tEntities.length}');
    return new Future.delayed(delay, () => tEntities);
  }

  // RankingInfos
  Future<List<RankingInfoEntity>> fetchRankingInfos() async {
    List<RankingInfoEntity> tEntities = [];
    rankingInfos.forEach((f) => tEntities.add(f.toEntity()));
    return new Future.delayed(delay, () => tEntities);
  }

  // MatchResulInfos
  Future<List<MatchResultInfoEntity>> fetchMatchResultInfos() async {
    List<MatchResultInfoEntity> tEntities = [];
    matchResultInfos.forEach((f) => tEntities.add(f.toEntity()));
    return new Future.delayed(delay, () => tEntities);
  }

  /// Mock that returns true or false for success or failure. In this case,
  /// it will "Always Succeed"
  Future<bool> postBasket(BasketEntity basketEntity) async {
    return new Future.value(true);
  }
}

BasketEntity basket = new BasketEntity(
    ltaNumber: 723492222,
    totalCost: 45.0,
    basketItems: <BasketItemEntity>[
      new BasketItemEntity(
          cost: 20.0,
          code: '1',
          tournamentName: 'Sutton Grade 4',
          grade: '4',
          status: 'Accepting'),
      new BasketItemEntity(
          cost: 25.0,
          code: '21',
          tournamentName: 'Wilshire Open Championship',
          grade: '3',
          status: 'Accepting')
    ]);

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
