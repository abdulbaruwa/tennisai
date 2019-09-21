part of swagger.api;

class EnteredTournaments {
  
  String id = null;
  

  String playerId = null;
  

  List<TournamentInfo> tournaments = [];
  

  String cosmosEntityName = null;
  
  EnteredTournaments();

  @override
  String toString() {
    return 'EnteredTournaments[id=$id, playerId=$playerId, tournaments=$tournaments, cosmosEntityName=$cosmosEntityName, ]';
  }

  EnteredTournaments.fromJson(Map<String, dynamic> json) {
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

  static List<EnteredTournaments> listFromJson(List<dynamic> json) {
    return json == null ? new List<EnteredTournaments>() : json.map((value) => new EnteredTournaments.fromJson(value)).toList();
  }

  static Map<String, EnteredTournaments> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, EnteredTournaments>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new EnteredTournaments.fromJson(value));
    }
    return map;
  }
}

