import 'package:meta/meta.dart';

@immutable
class Settings {
  final String refreshToken;
  final String accessToken;
  final String deviceToken;
  final String email;
  final String photoUrl;
  final bool registrationComplete;
  final String playerId;
  final int azureUserId;
  final String azureAuthToken;

  Settings({this.accessToken, this.refreshToken, this.deviceToken, this.email, this.photoUrl, this.registrationComplete, this.playerId, this.azureUserId, this.azureAuthToken});

 
  @override
  int get hashCode =>
      accessToken.hashCode ^ refreshToken.hashCode ^ deviceToken.hashCode ^ email.hashCode ^ photoUrl.hashCode ^ registrationComplete.hashCode ^ playerId.hashCode ^ azureUserId.hashCode ^ azureAuthToken.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Settings &&
          runtimeType == other.runtimeType &&
          accessToken == other.accessToken &&
          refreshToken == other.refreshToken &&
          email == other.email &&
          photoUrl == other.photoUrl &&
          deviceToken == other.deviceToken &&
          registrationComplete == other.registrationComplete &&
          playerId == other.playerId &&
          azureUserId == other.azureUserId &&
          azureAuthToken == other.azureAuthToken;

  Map<String, Object> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'deviceToken': deviceToken,
      'email': email,
      'photoUrl': photoUrl,
      'registrationComplete': registrationComplete,
      'playerId': playerId,
      'azureUserId' : azureUserId,
      'azureAuthToken' : azureAuthToken
    };
  }   
}