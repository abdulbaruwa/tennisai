import 'package:meta/meta.dart';

@immutable
class Settings {
  final String refreshToken;
  final String accessToken;
  final String deviceToken;
  final bool registrationComplete;
  final int playerId;
  final int azureUserId;
  final String azureAuthToken;

  Settings({this.accessToken, this.refreshToken, this.deviceToken, this.registrationComplete, this.playerId, this.azureUserId, this.azureAuthToken});

 
  @override
  int get hashCode =>
      accessToken.hashCode ^ refreshToken.hashCode ^ deviceToken.hashCode ^ registrationComplete.hashCode ^ playerId.hashCode ^ azureUserId.hashCode ^ azureAuthToken.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Settings &&
          runtimeType == other.runtimeType &&
          accessToken == other.accessToken &&
          refreshToken == other.refreshToken &&
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
      'registrationComplete': registrationComplete,
      'playerId': playerId,
      'azureUserId' : azureUserId,
      'azureAuthToken' : azureAuthToken
    };
  }   
}