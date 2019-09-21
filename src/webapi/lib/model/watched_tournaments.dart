part of swagger.api;

class WatchedTournaments {
  
  String id = null;
  

  String playerId = null;
  

  List<TournamentInfo> tournaments = [];
  

  String cosmosEntityName = null;
  
  WatchedTournaments();

  @override
  String toString() {
    return 'WatchedTournaments[id=$id, playerId=$playerId, tournaments=$tournaments, cosmosEntityName=$cosmosEntityName, ]';
  }

  WatchedTournaments.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    playerId =
        json['playerId']
    ;
    tournaments =
      TournamentInfo.listFromJson(json['tournaments'])
;
    cosmosEntityName =
        json['cosmosEntityName']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'playerId': playerId,
      'tournaments': tournaments,
      'cosmosEntityName': cosmosEntityName
     };
  }

  static List<WatchedTournaments> listFromJson(List<dynamic> json) {
    return json == null ? new List<WatchedTournaments>() : json.map((value) => new WatchedTournaments.fromJson(value)).toList();
  }

  static Map<String, WatchedTournaments> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, WatchedTournaments>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new WatchedTournaments.fromJson(value));
    }
    return map;
  }
}

