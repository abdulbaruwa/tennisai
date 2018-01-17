import 'tournament.dart';
import 'package:meta/meta.dart';

@immutable
class Player {
  final String name;
  final String email;
  final int ltaRanking;
  final String ltaRating;
  final int ltaNumber;
  final String postCode;
  final String address;
  

  Player(
      {this.name,
      this.email,
      this.ltaNumber,
      this.ltaRanking,
      this.ltaRating,
      this.postCode,
      this.address
      });
  final List<Tournament> watchedTournaments = [];
  final List<Tournament> enteredTournaments = [];

  Player copyWith(
      {String name,
      String email,
      int ltaNumber,
      int ltaRanking,
      String ltaRating,
      String postCode,
      String address}) {
    return new Player(
        name: name ?? this.name,
        email: email ?? this.email,
        address: address ?? this.address,
        ltaNumber: ltaNumber ?? this.ltaNumber,
        ltaRanking:  ltaRanking ?? this.ltaRanking,
        ltaRating:  ltaRating ?? this.ltaRating);
  }

  @override
  int get hashCode =>
      name.hashCode ^
      email.hashCode ^
      address.hashCode ^
      ltaNumber.hashCode ^
      ltaRanking.hashCode ^
      ltaRating.hashCode ^
      postCode.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Player &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          email == other.email &&
          address == other.address &&
          ltaRanking == other.ltaRanking &&
          ltaRating == other.ltaRating &&
          ltaNumber == other.ltaNumber &&
          postCode == other.postCode;

  static Player fromEntity(PlayerEntity playerEntity) {
    return new Player(
      name: playerEntity.name,
      ltaNumber: playerEntity.ltaNumber,
      ltaRanking: playerEntity.ltaRanking,
      ltaRating: playerEntity.ltaRating,
      email: playerEntity.email,
      address: playerEntity.address,
      postCode: playerEntity.postCode,
    );
  }

  PlayerEntity toEntity() {
    return new PlayerEntity(
        name: name,
        email: email,
        address: address,
        ltaNumber: ltaNumber,
        ltaRanking: ltaRanking,
        postCode: postCode);
  }

  @override
  String toString() {
    return 'Player{name: $name, email: $email, address: $address, ltaRanking: $ltaRanking, ltaRating: $ltaRating, ltaNumber: $ltaNumber, postCode: $postCode}';
  }
}

class PlayerEntity {
  PlayerEntity(
      {this.name,
      this.email,
      this.ltaNumber,
      this.ltaRanking,
      this.ltaRating,
      this.address,
      this.postCode,
      this.enteredTournaments,
      this.watchedTournaments});
  String name;
  String email;
  int ltaRanking;
  String ltaRating;
  int ltaNumber;
  String postCode;
  String address;

  Map<String, Object> toJson() {
    return {
      'name': name,
      'email': email,
      'ltaNumber': ltaNumber,
      'ltaRanking': ltaRanking,
      'ltaRating': ltaRating,
      'postCode': postCode,
      'address': address,
    };
  }

  List<TournamentEntity> watchedTournaments = [];
  List<TournamentEntity> enteredTournaments = [];
  static PlayerEntity fromJson(Map<String, Object> json) {
    return new PlayerEntity(
      name: json['name'] as String,
      email: json['email'] as String,
      ltaNumber: json['ltaNumber'] as int,
      ltaRanking: json['ltaRanking'] as int,
      ltaRating: json['ltaRating'] as String,
      postCode: json['postCode'] as String,
      address: json['address'] as String,
    );
  }
}

class SearchQueryPreference {
  int grade;
  String gender;
  int distance;
}
