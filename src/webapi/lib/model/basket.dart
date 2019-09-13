part of swagger.api;

class Basket {
  
  List<BasketItem> basketItems = [];
  

  double totalCost = null;
  

  int ltaNumber = null;
  

  String playerId = null;
  

  String id = null;
  

  String cosmosEntityName = null;
  
  Basket();

  @override
  String toString() {
    return 'Basket[basketItems=$basketItems, totalCost=$totalCost, ltaNumber=$ltaNumber, playerId=$playerId, id=$id, cosmosEntityName=$cosmosEntityName, ]';
  }

  Basket.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    basketItems =
      BasketItem.listFromJson(json['basketItems'])
;
    totalCost =
        json['totalCost']
    ;
    ltaNumber =
        json['ltaNumber']
    ;
    playerId =
        json['playerId']
    ;
    id =
        json['id']
    ;
    cosmosEntityName =
        json['cosmosEntityName']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'basketItems': basketItems,
      'totalCost': totalCost,
      'ltaNumber': ltaNumber,
      'playerId': playerId,
      'id': id,
      'cosmosEntityName': cosmosEntityName
     };
  }

  static List<Basket> listFromJson(List<dynamic> json) {
    return json == null ? new List<Basket>() : json.map((value) => new Basket.fromJson(value)).toList();
  }

  static Map<String, Basket> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Basket>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new Basket.fromJson(value));
    }
    return map;
  }
}

