import 'package:swagger/api.dart';

SearchPreference newSearchPreference(
    {int grade,
    String gender,
    String ageGroup,
    int distance,
    String tournamentStatus}) {
  var searchPreference = new SearchPreference();
  searchPreference.grade = grade;
  searchPreference.gender =  gender;
  searchPreference.ageGroup = ageGroup;
  searchPreference.distance = distance;
  searchPreference.tournamentStatus = tournamentStatus;
  return searchPreference;
}

Address addressCopyWith(
    {Address address,
    String line1,
    String line2,
    String line3,
    String line4,
    String town,
    String county,
    String postCode}) {
  var newAddress = new Address();
  newAddress.line1 = line1 ?? address.line1;
  newAddress.line2 = line2 ?? address.line2;
  newAddress.line3 = line3 ?? address.line3;
  newAddress.line4 = line4 ?? address.line4;
  newAddress.town = town ?? address.town;
  newAddress.county = county ?? address.county;
  newAddress.postCode = postCode ?? address.postCode;
  return newAddress;
}

Player playerCopyWith({
  Player player,
  String firstName,
  String lastName,
  String email,
  String gender,
  int ltaNumber,
  int ltaRanking,
  String ltaRating,
  String postCode,
  Address address,
  String county,
  String playerId,
  bool usePublicProfileImage,
  String profileImageUrl,
  String authenticationId,
  bool isAdmin,
  String deviceToken,
  String devicePlatform,
  String notificationRegistrationId,
  String userId,
  List<RankingInfo> rankingInfos,
  SearchPreference defaultSearchPreference,
}) {
  var newPlayer = new Player();
  newPlayer.id = playerId ?? player.id;
  newPlayer.firstName = firstName ?? player.firstName;
  newPlayer.lastName = lastName ?? player.lastName;
  newPlayer.email = email ?? player.email;
  newPlayer.gender = gender ?? player.gender;
  newPlayer.address = address ?? player.address;
  newPlayer.ltaNumber = ltaNumber ?? player.ltaNumber;
  newPlayer.ltaRanking = ltaRanking ?? player.ltaRanking;
  newPlayer.ltaRating = ltaRating ?? player.ltaRating;
  newPlayer.usePublicProfileImage =
      usePublicProfileImage ?? player.usePublicProfileImage;
  newPlayer.profileImageUrl = profileImageUrl ?? player.profileImageUrl;
  newPlayer.authenticationId = authenticationId ?? player.authenticationId;
  newPlayer.isAdmin = isAdmin ?? player.isAdmin;
  newPlayer.deviceToken = deviceToken ?? player.deviceToken;
  newPlayer.devicePlatform = devicePlatform ?? player.devicePlatform;
  newPlayer.notificationRegistrationId =
      notificationRegistrationId ?? player.notificationRegistrationId;
  newPlayer.userId = userId ?? player.userId;
  newPlayer.rankingInfos = rankingInfos ?? player.rankingInfos;
  return newPlayer;
}
