part of swagger.api;

class MatchResultInfo {
  
  String id = null;
  

  DateTime tournamentDate = null;
  

  String ageGroup = null;
  //enum ageGroupEnum {  Under12,  Under16,  Under18,  Adult,  };

  int grade = null;
  

  String tournamentName = null;
  

  String tournamentCode = null;
  

  String tournamentId = null;
  

  String result = null;
  

  int points = null;
  

  bool appliedToRanking = null;
  

  String playerId = null;
  

  String cosmosEntityName = null;
  
  MatchResultInfo();

  @override
  String toString() {
    return 'MatchResultInfo[id=$id, tournamentDate=$tournamentDate, ageGroup=$ageGroup, grade=$grade, tournamentName=$tournamentName, tournamentCode=$tournamentCode, tournamentId=$tournamentId, result=$result, points=$points, appliedToRanking=$appliedToRanking, playerId=$playerId, cosmosEntityName=$cosmosEntityName, ]';
  }

  MatchResultInfo.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    tournamentDate = json['tournamentDate'] == null ? null : DateTime.parse(json['tournamentDate']);
    ageGroup =
        json['ageGroup']
    ;
    grade =
        json['grade']
    ;
    tournamentName =
        json['tournamentName']
    ;
    tournamentCode =
        json['tournamentCode']
    ;
    tournamentId =
        json['tournamentId']
    ;
    result =
        json['result']
    ;
    points =
        json['points']
    ;
    appliedToRanking =
        json['appliedToRanking']
    ;
    playerId =
        json['playerId']
    ;
    cosmosEntityName =
        json['cosmosEntityName']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tournamentDate': tournamentDate == null ? '' : tournamentDate.toUtc().toIso8601String(),
      'ageGroup': ageGroup,
      'grade': grade,
      'tournamentName': tournamentName,
      'tournamentCode': tournamentCode,
      'tournamentId': tournamentId,
      'result': result,
      'points': points,
      'appliedToRanking': appliedToRanking,
      'playerId': playerId,
      'cosmosEntityName': cosmosEntityName
     };
  }

  static List<MatchResultInfo> listFromJson(List<dynamic> json) {
    return json == null ? new List<MatchResultInfo>() : json.map((value) => new MatchResultInfo.fromJson(value)).toList();
  }

  static Map<String, MatchResultInfo> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, MatchResultInfo>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new MatchResultInfo.fromJson(value));
    }
    return map;
  }
}

