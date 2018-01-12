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

  Player(
      {this.name,
      this.email,
      this.ltaNumber,
      this.ltaRanking,
      this.ltaRating,
      this.postCode});
  final List<Tournament> watchedTournaments = [];
  final List<Tournament> enteredTournaments = [];

  @override
  int get hashCode =>
      name.hashCode ^
      email.hashCode ^
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
      postCode: playerEntity.postCode,
    );
  }

  PlayerEntity toEntity() {
    return new PlayerEntity(
        name: name,
        email: email,
        ltaNumber: ltaNumber,
        ltaRanking: ltaRanking,
        postCode: postCode);
  }

  @override
  String toString() {
    return 'Player{name: $name, email: $email, ltaRanking: $ltaRanking, ltaRating: $ltaRating, ltaNumber: $ltaNumber, postCode: $postCode}';
  }
}

class PlayerEntity {
  PlayerEntity(
      {this.name,
      this.email,
      this.ltaNumber,
      this.ltaRanking,
      this.ltaRating,
      this.postCode,
      this.enteredTournaments,
      this.watchedTournaments});
  String name;
  String email;
  int ltaRanking;
  String ltaRating;
  int ltaNumber;
  String postCode;

  Map<String, Object> toJson() {
    return {
      'name': name,
      'email': email,
      'ltaNumber': ltaNumber,
      'ltaRanking': ltaRanking,
      'ltaRating': ltaRating,
      'postCode': postCode,
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
    );
  }
}

class SearchQueryPreference {
  int grade;
  String gender;
  int distance;
}
