library swagger.api;

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';

part 'api/players_api.dart';
part 'api/seeding_api.dart';
part 'api/tournaments_api.dart';

part 'model/address.dart';
part 'model/basket.dart';
part 'model/basket_item.dart';
part 'model/entered_tournaments.dart';
part 'model/entrant.dart';
part 'model/match_result_info.dart';
part 'model/player.dart';
part 'model/problem_details.dart';
part 'model/ranking_info.dart';
part 'model/search_preference.dart';
part 'model/tournament.dart';
part 'model/tournament_info.dart';
part 'model/watched_tournaments.dart';


ApiClient defaultApiClient = new ApiClient();
