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
  final String name;

  Settings({this.accessToken, this.refreshToken, this.deviceToken, this.email, this.photoUrl, this.registrationComplete, this.playerId, this.azureUserId, this.azureAuthToken, this.name});

 
  @override
  int get hashCode =>
      accessToken.hashCode ^ refreshToken.hashCode ^ deviceToken.hashCode ^ email.hashCode ^ photoUrl.hashCode ^ registrationComplete.hashCode ^ playerId.hashCode ^ azureUserId.hashCode ^ azureAuthToken.hashCode ^ name.hashCode;

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
          name == other.name &&
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
      'name' : name,
      'azureAuthToken' : azureAuthToken
    };
  }   

   static Settings fromJson(Map<String, Object> json) {
    return new Settings(
      accessToken: json['accessToke'] as String,
      refreshToken: json['refreshToken'] as String,
      deviceToken: json['deviceToken'] as String,
      email: json['email'] as String,
      photoUrl: json['photoUrl'] as String,
      registrationComplete: json['registrationComplete'] as bool,
      playerId: json['playerId'] as String,
      azureUserId: json['azureUserId'] as int,
      name: json['name'] as String,
      azureAuthToken: json['azureAuthToken'] as String
    );
  }
}