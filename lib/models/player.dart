import 'tournament.dart';

class Player{
  String name;
  String email;
  int ltaRanking;
  String ltaRating;
  int ltaNumber;
  String postCode;

  List<Tournament> watchedTournaments = [];
  List<Tournament> enteredTournaments = [];
}

class SearchQueryPreference{
  int grade;
  String gender;
  int distance;
 }