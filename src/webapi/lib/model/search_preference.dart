part of swagger.api;

class SearchPreference {
  
  int grade = null;
  

  String gender = null;
  //enum genderEnum {  Female,  Male,  };

  String ageGroup = null;
  //enum ageGroupEnum {  Under12,  Under16,  Under18,  Adult,  };

  int distance = null;
  

  String tournamentStatus = null;
  //enum tournamentStatusEnum {  Upcoming,  AcceptingEntries,  ClosedForEntries,  WithdrawalDatePassed,  InProgress,  PendingResults,  ResultsAvailable,  };
  SearchPreference();

  @override
  String toString() {
    return 'SearchPreference[grade=$grade, gender=$gender, ageGroup=$ageGroup, distance=$distance, tournamentStatus=$tournamentStatus, ]';
  }

  SearchPreference.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    grade =
        json['grade']
    ;
    gender =
        json['gender']
    ;
    ageGroup =
        json['ageGroup']
    ;
    distance =
        json['distance']
    ;
    tournamentStatus =
        json['tournamentStatus']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'grade': grade,
      'gender': gender,
      'ageGroup': ageGroup,
      'distance': distance,
      'tournamentStatus': tournamentStatus
     };
  }

  static List<SearchPreference> listFromJson(List<dynamic> json) {
    return json == null ? new List<SearchPreference>() : json.map((value) => new SearchPreference.fromJson(value)).toList();
  }

  static Map<String, SearchPreference> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, SearchPreference>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new SearchPreference.fromJson(value));
    }
    return map;
  }
}

