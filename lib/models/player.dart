import 'tournament.dart';
import 'package:meta/meta.dart';

@immutable
class Player {
  final String firstName;
  final String lastName;
  final String email;
  final int ltaRanking;
  final String ltaRating;
  final int ltaNumber;
  final String postCode;
  final String address;
  final String county;

  Player(
      {this.firstName,
      this.lastName,
      this.email,
      this.ltaNumber,
      this.ltaRanking,
      this.ltaRating,
      this.postCode,
      this.address,
      this.county});
  final List<Tournament> watchedTournaments = [];
  final List<Tournament> enteredTournaments = [];

  Player copyWith(
      {String firstName,
      String lastName,
      String email,
      int ltaNumber,
      int ltaRanking,
      String ltaRating,
      String postCode,
      String address,
      String county}) {
    return new Player(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        address: address ?? this.address,
        county: county ?? this.county,
        ltaNumber: ltaNumber ?? this.ltaNumber,
        ltaRanking: ltaRanking ?? this.ltaRanking,
        ltaRating: ltaRating ?? this.ltaRating);
  }

  @override
  int get hashCode =>
      firstName.hashCode ^
      lastName.hashCode ^
      email.hashCode ^
      address.hashCode ^
      county.hashCode ^
      ltaNumber.hashCode ^
      ltaRanking.hashCode ^
      ltaRating.hashCode ^
      postCode.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Player &&
          runtimeType == other.runtimeType &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          email == other.email &&
          address == other.address &&
          county == other.county &&
          ltaRanking == other.ltaRanking &&
          ltaRating == other.ltaRating &&
          ltaNumber == other.ltaNumber &&
          postCode == other.postCode;

  static Player fromEntity(PlayerEntity playerEntity) {
    return new Player(
      firstName: playerEntity.firstName,
      lastName: playerEntity.lastName,
      ltaNumber: playerEntity.ltaNumber,
      ltaRanking: playerEntity.ltaRanking,
      ltaRating: playerEntity.ltaRating,
      email: playerEntity.email,
      address: playerEntity.address,
      postCode: playerEntity.postCode,
      county: playerEntity.county,
    );
  }

  PlayerEntity toEntity() {
    return new PlayerEntity(
        firstName: firstName,
        lastName: lastName,
        email: email,
        address: address,
        ltaNumber: ltaNumber,
        ltaRanking: ltaRanking,
        ltaRating: ltaRating,
        postCode: postCode,
        county: county);
  }

  @override
  String toString() {
    return 'Player{firstName: $firstName, lastName: $lastName, email: $email, address: $address, county: $county, ltaRanking: $ltaRanking, ltaRating: $ltaRating, ltaNumber: $ltaNumber, postCode: $postCode}';
  }
}

class PlayerEntity {
  PlayerEntity(
      {this.firstName,
      this.lastName,
      this.email,
      this.ltaNumber,
      this.ltaRanking,
      this.ltaRating,
      this.address,
      this.postCode,
      this.county,
      this.enteredTournaments,
      this.watchedTournaments});
  String firstName;
  String lastName;
  String email;
  int ltaRanking;
  String ltaRating;
  int ltaNumber;
  String postCode;
  String address;
  String county;

  Map<String, Object> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'ltaNumber': ltaNumber,
      'ltaRanking': ltaRanking,
      'ltaRating': ltaRating,
      'postCode': postCode,
      'address': address,
      'county': county,
    };
  }

  List<TournamentEntity> watchedTournaments = [];
  List<TournamentEntity> enteredTournaments = [];
  static PlayerEntity fromJson(Map<String, Object> json) {
    return new PlayerEntity(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      ltaNumber: json['ltaNumber'] as int,
      ltaRanking: json['ltaRanking'] as int,
      ltaRating: json['ltaRating'] as String,
      postCode: json['postCode'] as String,
      address: json['address'] as String,
      county: json['county'] as String,
    );
  }
}

// class SearchQueryPreference {
//   int grade;
//   String gender;
//   int distance;
// }
