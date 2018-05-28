import 'tournament.dart';
import 'package:meta/meta.dart';

@immutable
class Player {
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final int ltaRanking;
  final String ltaRating;
  final int ltaNumber;
  final String postCode;
  final String address;
  final String county;
  final String id;
  final String profileImageUrl;
  final bool usePublicProfileImage;

  Player(
      {this.firstName,
      this.lastName,
      this.email,
      this.gender,
      this.ltaNumber,
      this.ltaRanking,
      this.ltaRating,
      this.postCode,
      this.address,
      this.county,
      this.id,
      this.usePublicProfileImage,
      this.profileImageUrl});
  final List<Tournament> watchedTournaments = [];
  final List<Tournament> enteredTournaments = [];

  Player copyWith(
      {String firstName,
      String lastName,
      String email,
      String gender,
      int ltaNumber,
      int ltaRanking,
      String ltaRating,
      String postCode,
      String address,
      String county,
      String playerId,
      bool usePublicProfileImage,
      String profileImageUrl}) {
    return new Player(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        address: address ?? this.address,
        county: county ?? this.county,
        ltaNumber: ltaNumber ?? this.ltaNumber,
        ltaRanking: ltaRanking ?? this.ltaRanking,
        ltaRating: ltaRating ?? this.ltaRating,
        usePublicProfileImage: usePublicProfileImage ?? this.usePublicProfileImage,
        profileImageUrl: profileImageUrl ?? this.profileImageUrl);
  }

  @override
  int get hashCode =>
      id.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      email.hashCode ^
      gender.hashCode ^
      address.hashCode ^
      county.hashCode ^
      ltaNumber.hashCode ^
      ltaRanking.hashCode ^
      ltaRating.hashCode ^
      postCode.hashCode ^
      usePublicProfileImage.hashCode ^
      profileImageUrl.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Player &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          email == other.email &&
          gender == other.gender &&
          address == other.address &&
          county == other.county &&
          ltaRanking == other.ltaRanking &&
          ltaRating == other.ltaRating &&
          ltaNumber == other.ltaNumber &&
          postCode == other.postCode &&
          usePublicProfileImage == other.usePublicProfileImage &&
          profileImageUrl == other.profileImageUrl;

  static Player fromEntity(PlayerEntity playerEntity) {
    return new Player(
      id: playerEntity.id,
      firstName: playerEntity.firstName,
      lastName: playerEntity.lastName,
      ltaNumber: playerEntity.ltaNumber,
      ltaRanking: playerEntity.ltaRanking,
      ltaRating: playerEntity.ltaRating,
      email: playerEntity.email,
      gender: playerEntity.gender,
      address: playerEntity.address,
      postCode: playerEntity.postCode,
      county: playerEntity.county,
      profileImageUrl: playerEntity.profileImageUrl,
      usePublicProfileImage: playerEntity.usePublicProfileImage
    );
  }

  PlayerEntity toEntity() {
    return new PlayerEntity(
        id: id,
        firstName: firstName,
        lastName: lastName,
        email: email,
        gender: gender,
        address: address,
        ltaNumber: ltaNumber,
        ltaRanking: ltaRanking,
        ltaRating: ltaRating,
        postCode: postCode,
        county: county,
        usePublicProfileImage: usePublicProfileImage,
        profileImageUrl: profileImageUrl);
  }

  @override
  String toString() {
    return 'Player{id: $id, firstName: $firstName, lastName: $lastName, email: $email, gender: $gender, profileImageUrl: $profileImageUrl, usePublicProfileImage: $usePublicProfileImage, address: $address, county: $county, ltaRanking: $ltaRanking, ltaRating: $ltaRating, ltaNumber: $ltaNumber, postCode: $postCode}';
  }
}

class PlayerEntity {
  PlayerEntity(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.gender,
      this.ltaNumber,
      this.ltaRanking,
      this.ltaRating,
      this.address,
      this.postCode,
      this.county,
      this.profileImageUrl,
      this.enteredTournaments,
      this.usePublicProfileImage,
      this.watchedTournaments});
  String id;
  String firstName;
  String lastName;
  String email;
  String gender;
  int ltaRanking;
  String ltaRating;
  int ltaNumber;
  String postCode;
  String address;
  String county;
  String profileImageUrl;
  bool usePublicProfileImage;

  Map<String, Object> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'gender': gender,
      'ltaNumber': ltaNumber,
      'ltaRanking': ltaRanking,
      'ltaRating': ltaRating,
      'postCode': postCode,
      'address': address,
      'county': county,
      'profileImageUrl': profileImageUrl,
      'usePublicProfileImage': usePublicProfileImage
    };
  }

  List<TournamentEntity> watchedTournaments = [];
  List<TournamentEntity> enteredTournaments = [];
  static PlayerEntity fromJson(Map<String, Object> json) {
    return new PlayerEntity(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String,
      ltaNumber: json['ltaNumber'] as int,
      ltaRanking: json['ltaRanking'] as int,
      ltaRating: json['ltaRating'] as String,
      postCode: json['postCode'] as String,
      address: json['address'] as String,
      county: json['county'] as String,
      profileImageUrl: json['profileImageUrl'] as String,
      usePublicProfileImage: json['usePublicProfileImage'] as bool
    );
  }
}
