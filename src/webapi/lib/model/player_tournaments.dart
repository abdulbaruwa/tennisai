part of swagger.api;

class PlayerTournaments {
  
  String id = null;
  

  String playerId = null;
  

  List<TournamentInfo> watchedTournaments = [];
  

  List<TournamentInfo> enteredTournaments = [];
  
  PlayerTournaments();

  @override
  String toString() {
    return 'PlayerTournaments[id=$id, playerId=$playerId, watchedTournaments=$watchedTournaments, enteredTournaments=$enteredTournaments, ]';
  }

  PlayerTournaments.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    playerId =
        json['playerId']
    ;
    watchedTournaments =
      TournamentInfo.listFromJson(json['watchedTournaments'])
;
    enteredTournaments =
      TournamentInfo.listFromJson(json['enteredTournaments'])
;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'playerId': playerId,
      'watchedTournaments': watchedTournaments,
      'enteredTournaments': enteredTournaments
     };
  }

  static List<PlayerTournaments> listFromJson(List<dynamic> json) {
    return json == null ? new List<PlayerTournaments>() : json.map((value) => new PlayerTournaments.fromJson(value)).toList();
  }

  static Map<String, PlayerTournaments> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, PlayerTournaments>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new PlayerTournaments.fromJson(value));
    }
    return map;
  }
}

