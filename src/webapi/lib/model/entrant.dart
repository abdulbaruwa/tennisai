part of swagger.api;

class Entrant {
  
  String name = null;
  

  int ranking = null;
  

  String rating = null;
  

  int ltaNumber = null;
  

  String status = null;
  
  Entrant();

  @override
  String toString() {
    return 'Entrant[name=$name, ranking=$ranking, rating=$rating, ltaNumber=$ltaNumber, status=$status, ]';
  }

  Entrant.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    name =
        json['name']
    ;
    ranking =
        json['ranking']
    ;
    rating =
        json['rating']
    ;
    ltaNumber =
        json['ltaNumber']
    ;
    status =
        json['status']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'ranking': ranking,
      'rating': rating,
      'ltaNumber': ltaNumber,
      'status': status
     };
  }

  static List<Entrant> listFromJson(List<dynamic> json) {
    return json == null ? new List<Entrant>() : json.map((value) => new Entrant.fromJson(value)).toList();
  }

  static Map<String, Entrant> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Entrant>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new Entrant.fromJson(value));
    }
    return map;
  }
}

