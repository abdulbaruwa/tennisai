part of swagger.api;

class Tournament {
  
  String id = null;
  

  String name = null;
  

  int grade = null;
  

  String ageGroup = null;
  //enum ageGroupEnum {  Under12,  Under16,  Under18,  Adult,  };

  String gender = null;
  //enum genderEnum {  Female,  Male,  };

  DateTime startDateTime = null;
  

  DateTime endDateTime = null;
  

  int startDate = null;
  

  int endDate = null;
  

  String location = null;
  

  String motivationalAvatar = null;
  

  int numberOfEntrants = null;
  

  List<Entrant> entrants = [];
  

  String highestPlayerRating = null;
  

  String site = null;
  

  String organiserName = null;
  

  String organiserPhone = null;
  

  String organiserEmail = null;
  

  DateTime entryCloseDateTime = null;
  

  int entryCloseDate = null;
  

  String code = null;
  

  int statusIndex = null;
  

  String tournamentStatus = null;
  //enum tournamentStatusEnum {  Upcoming,  AcceptingEntries,  ClosedForEntries,  WithdrawalDatePassed,  InProgress,  PendingResults,  ResultsAvailable,  };

  String address = null;
  

  String town = null;
  

  String postCode = null;
  

  double cost = null;
  

  String cosmosEntityName = null;
  
  Tournament();

  @override
  String toString() {
    return 'Tournament[id=$id, name=$name, grade=$grade, ageGroup=$ageGroup, gender=$gender, startDateTime=$startDateTime, endDateTime=$endDateTime, startDate=$startDate, endDate=$endDate, location=$location, motivationalAvatar=$motivationalAvatar, numberOfEntrants=$numberOfEntrants, entrants=$entrants, highestPlayerRating=$highestPlayerRating, site=$site, organiserName=$organiserName, organiserPhone=$organiserPhone, organiserEmail=$organiserEmail, entryCloseDateTime=$entryCloseDateTime, entryCloseDate=$entryCloseDate, code=$code, statusIndex=$statusIndex, tournamentStatus=$tournamentStatus, address=$address, town=$town, postCode=$postCode, cost=$cost, cosmosEntityName=$cosmosEntityName, ]';
  }

  Tournament.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
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
    startDate =
        json['startDate']
    ;
    endDate =
        json['endDate']
    ;
    location =
        json['location']
    ;
    motivationalAvatar =
        json['motivationalAvatar']
    ;
    numberOfEntrants =
        json['numberOfEntrants']
    ;
    entrants =
      Entrant.listFromJson(json['entrants'])
;
    highestPlayerRating =
        json['highestPlayerRating']
    ;
    site =
        json['site']
    ;
    organiserName =
        json['organiserName']
    ;
    organiserPhone =
        json['organiserPhone']
    ;
    organiserEmail =
        json['organiserEmail']
    ;
    entryCloseDateTime = json['entryCloseDateTime'] == null ? null : DateTime.parse(json['entryCloseDateTime']);
    entryCloseDate =
        json['entryCloseDate']
    ;
    code =
        json['code']
    ;
    statusIndex =
        json['statusIndex']
    ;
    tournamentStatus =
        json['tournamentStatus']
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
    cosmosEntityName =
        json['cosmosEntityName']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'grade': grade,
      'ageGroup': ageGroup,
      'gender': gender,
      'startDateTime': startDateTime == null ? '' : startDateTime.toUtc().toIso8601String(),
      'endDateTime': endDateTime == null ? '' : endDateTime.toUtc().toIso8601String(),
      'startDate': startDate,
      'endDate': endDate,
      'location': location,
      'motivationalAvatar': motivationalAvatar,
      'numberOfEntrants': numberOfEntrants,
      'entrants': entrants,
      'highestPlayerRating': highestPlayerRating,
      'site': site,
      'organiserName': organiserName,
      'organiserPhone': organiserPhone,
      'organiserEmail': organiserEmail,
      'entryCloseDateTime': entryCloseDateTime == null ? '' : entryCloseDateTime.toUtc().toIso8601String(),
      'entryCloseDate': entryCloseDate,
      'code': code,
      'statusIndex': statusIndex,
      'tournamentStatus': tournamentStatus,
      'address': address,
      'town': town,
      'postCode': postCode,
      'cost': cost,
      'cosmosEntityName': cosmosEntityName
     };
  }

  static List<Tournament> listFromJson(List<dynamic> json) {
    return json == null ? new List<Tournament>() : json.map((value) => new Tournament.fromJson(value)).toList();
  }

  static Map<String, Tournament> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Tournament>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new Tournament.fromJson(value));
    }
    return map;
  }
}

