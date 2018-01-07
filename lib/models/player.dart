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

  PlayerEntity toEntity() {
    return new PlayerEntity(
        name: name,
        email: email,
        ltaNumber: ltaNumber,
        ltaRanking: ltaRanking,
        postCode: postCode);
  }
  
  @override
  String toString(){return 'Player{name: $name, email: $email, ltaRanking: $ltaRanking, ltaRating: $ltaRating, ltaNumber: $ltaNumber, postCode: $postCode}';}
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

  List<TournamentEntity> watchedTournaments = [];
  List<TournamentEntity> enteredTournaments = [];
}

class SearchQueryPreference {
  int grade;
  String gender;
  int distance;
}
