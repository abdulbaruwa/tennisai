part of swagger.api;

class RankingInfo {
  
  String id = null;
  

  String ageGroup = null;
  //enum ageGroupEnum {  Under12,  Under16,  Under18,  Adult,  };

  int regional = null;
  

  int county = null;
  

  int national = null;
  

  int totalPoints = null;
  
  RankingInfo();

  @override
  String toString() {
    return 'RankingInfo[id=$id, ageGroup=$ageGroup, regional=$regional, county=$county, national=$national, totalPoints=$totalPoints, ]';
  }

  RankingInfo.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    ageGroup =
        json['ageGroup']
    ;
    regional =
        json['regional']
    ;
    county =
        json['county']
    ;
    national =
        json['national']
    ;
    totalPoints =
        json['totalPoints']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ageGroup': ageGroup,
      'regional': regional,
      'county': county,
      'national': national,
      'totalPoints': totalPoints
     };
  }

  static List<RankingInfo> listFromJson(List<dynamic> json) {
    return json == null ? new List<RankingInfo>() : json.map((value) => new RankingInfo.fromJson(value)).toList();
  }

  static Map<String, RankingInfo> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, RankingInfo>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new RankingInfo.fromJson(value));
    }
    return map;
  }
}

