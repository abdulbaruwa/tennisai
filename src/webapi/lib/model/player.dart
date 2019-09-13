part of swagger.api;

class Player {
  
  String id = null;
  

  String firstName = null;
  

  String lastName = null;
  

  String gender = null;
  //enum genderEnum {  Female,  Male,  };

  int ltaNumber = null;
  

  int ltaRanking = null;
  

  String ltaRating = null;
  

  Address address = null;
  

  String authenticationId = null;
  

  String email = null;
  

  bool isAdmin = null;
  

  String deviceToken = null;
  

  String devicePlatform = null;
  

  String notificationRegistrationId = null;
  

  String profileImageUrl = null;
  

  String userId = null;
  

  bool usePublicProfileImage = null;
  

  List<RankingInfo> rankingInfos = [];
  

  SearchPreference defaultSearchPreference = null;
  

  String cosmosEntityName = null;
  
  Player();

  @override
  String toString() {
    return 'Player[id=$id, firstName=$firstName, lastName=$lastName, gender=$gender, ltaNumber=$ltaNumber, ltaRanking=$ltaRanking, ltaRating=$ltaRating, address=$address, authenticationId=$authenticationId, email=$email, isAdmin=$isAdmin, deviceToken=$deviceToken, devicePlatform=$devicePlatform, notificationRegistrationId=$notificationRegistrationId, profileImageUrl=$profileImageUrl, userId=$userId, usePublicProfileImage=$usePublicProfileImage, rankingInfos=$rankingInfos, defaultSearchPreference=$defaultSearchPreference, cosmosEntityName=$cosmosEntityName, ]';
  }

  Player.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id =
        json['id']
    ;
    firstName =
        json['firstName']
    ;
    lastName =
        json['lastName']
    ;
    gender =
        json['gender']
    ;
    ltaNumber =
        json['ltaNumber']
    ;
    ltaRanking =
        json['ltaRanking']
    ;
    ltaRating =
        json['ltaRating']
    ;
    address =
      
      
      new Address.fromJson(json['address'])
;
    authenticationId =
        json['authenticationId']
    ;
    email =
        json['email']
    ;
    isAdmin =
        json['isAdmin']
    ;
    deviceToken =
        json['deviceToken']
    ;
    devicePlatform =
        json['devicePlatform']
    ;
    notificationRegistrationId =
        json['notificationRegistrationId']
    ;
    profileImageUrl =
        json['profileImageUrl']
    ;
    userId =
        json['userId']
    ;
    usePublicProfileImage =
        json['usePublicProfileImage']
    ;
    rankingInfos =
      RankingInfo.listFromJson(json['rankingInfos'])
;
    defaultSearchPreference =
      
      
      new SearchPreference.fromJson(json['defaultSearchPreference'])
;
    cosmosEntityName =
        json['cosmosEntityName']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'ltaNumber': ltaNumber,
      'ltaRanking': ltaRanking,
      'ltaRating': ltaRating,
      'address': address,
      'authenticationId': authenticationId,
      'email': email,
      'isAdmin': isAdmin,
      'deviceToken': deviceToken,
      'devicePlatform': devicePlatform,
      'notificationRegistrationId': notificationRegistrationId,
      'profileImageUrl': profileImageUrl,
      'userId': userId,
      'usePublicProfileImage': usePublicProfileImage,
      'rankingInfos': rankingInfos,
      'defaultSearchPreference': defaultSearchPreference,
      'cosmosEntityName': cosmosEntityName
     };
  }

  static List<Player> listFromJson(List<dynamic> json) {
    return json == null ? new List<Player>() : json.map((value) => new Player.fromJson(value)).toList();
  }

  static Map<String, Player> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Player>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new Player.fromJson(value));
    }
    return map;
  }
}

