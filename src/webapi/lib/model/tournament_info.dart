part of swagger.api;

class TournamentInfo {
  
  String tournamentId = null;
  

  String name = null;
  

  int grade = null;
  

  String ageGroup = null;
  //enum ageGroupEnum {  Under12,  Under16,  Under18,  Adult,  };

  String gender = null;
  //enum genderEnum {  Female,  Male,  };

  DateTime startDateTime = null;
  

  DateTime endDateTime = null;
  

  String code = null;
  

  String address = null;
  

  String town = null;
  

  String postCode = null;
  

  double cost = null;
  

  String tournamentStatus = null;
  //enum tournamentStatusEnum {  Upcoming,  AcceptingEntries,  ClosedForEntries,  WithdrawalDatePassed,  InProgress,  PendingResults,  ResultsAvailable,  };

  int numberOfEntrants = null;
  

  String organiserEmail = null;
  

  String organiserPhone = null;
  

  DateTime entryCloseDateTime = null;
  
  TournamentInfo();

  @override
  String toString() {
    return 'TournamentInfo[tournamentId=$tournamentId, name=$name, grade=$grade, ageGroup=$ageGroup, gender=$gender, startDateTime=$startDateTime, endDateTime=$endDateTime, code=$code, address=$address, town=$town, postCode=$postCode, cost=$cost, tournamentStatus=$tournamentStatus, numberOfEntrants=$numberOfEntrants, organiserEmail=$organiserEmail, organiserPhone=$organiserPhone, entryCloseDateTime=$entryCloseDateTime, ]';
  }

  TournamentInfo.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    tournamentId =
        json['tournamentId']
    ;
    name =
        json['name']
    ;
    grade =
        json['grade']
    ;
    ageGroup =
        json['ageGroup']
    ;
    gender =
        json['gender']
    ;
    startDateTime = json['startDateTime'] == null ? null : DateTime.parse(json['startDateTime']);
    endDateTime = json['endDateTime'] == null ? null : DateTime.parse(json['endDateTime']);
    code =
        json['code']
    ;
    address =
        json['address']
    ;
    town =
        json['town']
    ;
    postCode =
        json['postCode']
    ;
    cost =
        json['cost']
    ;
    tournamentStatus =
        json['tournamentStatus']
    ;
    numberOfEntrants =
        json['numberOfEntrants']
    ;
    organiserEmail =
        json['organiserEmail']
    ;
    organiserPhone =
        json['organiserPhone']
    ;
    entryCloseDateTime = json['entryCloseDateTime'] == null ? null : DateTime.parse(json['entryCloseDateTime']);
  }

  Map<String, dynamic> toJson() {
    return {
      'tournamentId': tournamentId,
      'name': name,
      'grade': grade,
      'ageGroup': ageGroup,
      'gender': gender,
      'startDateTime': startDateTime == null ? '' : startDateTime.toUtc().toIso8601String(),
      'endDateTime': endDateTime == null ? '' : endDateTime.toUtc().toIso8601String(),
      'code': code,
      'address': address,
      'town': town,
      'postCode': postCode,
      'cost': cost,
      'tournamentStatus': tournamentStatus,
      'numberOfEntrants': numberOfEntrants,
      'organiserEmail': organiserEmail,
      'organiserPhone': organiserPhone,
      'entryCloseDateTime': entryCloseDateTime == null ? '' : entryCloseDateTime.toUtc().toIso8601String()
     };
  }

  static List<TournamentInfo> listFromJson(List<dynamic> json) {
    return json == null ? new List<TournamentInfo>() : json.map((value) => new TournamentInfo.fromJson(value)).toList();
  }

  static Map<String, TournamentInfo> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, TournamentInfo>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new TournamentInfo.fromJson(value));
    }
    return map;
  }
}

