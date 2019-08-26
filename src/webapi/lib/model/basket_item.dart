part of swagger.api;

class BasketItem {
  
  String id = null;
  

  String tournamentId = null;
  

  String tournamentName = null;
  

  String code = null;
  

  int grade = null;
  

  String playerId = null;
  

  double cost = null;
  

  String basketStatus = null;
  //enum basketStatusEnum {  Pending,  Sent,  };
  BasketItem();

  @override
  String toString() {
    return 'BasketItem[id=$id, tournamentId=$tournamentId, tournamentName=$tournamentName, code=$code, grade=$grade, playerId=$playerId, cost=$cost, basketStatus=$basketStatus, ]';
  }

  BasketItem.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    tournamentId =
        json['tournamentId']
    ;
    tournamentName =
        json['tournamentName']
    ;
    code =
        json['code']
    ;
    grade =
        json['grade']
    ;
    playerId =
        json['playerId']
    ;
    cost =
        json['cost']
    ;
    basketStatus =
        json['basketStatus']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tournamentId': tournamentId,
      'tournamentName': tournamentName,
      'code': code,
      'grade': grade,
      'playerId': playerId,
      'cost': cost,
      'basketStatus': basketStatus
     };
  }

  static List<BasketItem> listFromJson(List<dynamic> json) {
    return json == null ? new List<BasketItem>() : json.map((value) => new BasketItem.fromJson(value)).toList();
  }

  static Map<String, BasketItem> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, BasketItem>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new BasketItem.fromJson(value));
    }
    return map;
  }
}

