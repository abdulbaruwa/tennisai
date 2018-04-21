import 'package:meta/meta.dart';

final tournamentStatus = {0: 'Upcoming       ', 
                          1: 'Accepting Entry', 
                          2: 'Entry Closed', 
                          3: 'Past Withdrawal', 
                          4: 'In Progress',
                          5: 'Pending Result', 
                          6: 'Results Ready'};
                          
final tournamentStatusIndexs = [0, 1, 2, 3, 4, 5, 6];

@immutable
class SearchPreference {
  final int ltaNumber;
  final int grade;
  final String gender;
  final int distance;
  final int ageGroup;
  final int statusIndex;

  SearchPreference(
      {this.ltaNumber, this.grade, this.gender, this.distance, this.ageGroup, this.statusIndex});
  @override
  int get hashCode =>
      ltaNumber.hashCode ^
      grade.hashCode ^
      gender.hashCode ^
      distance.hashCode ^
      statusIndex.hashCode ^
      ageGroup.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchPreference &&
          runtimeType == other.runtimeType &&
          ltaNumber == other.ltaNumber &&
          grade == other.grade &&
          gender == other.gender &&
          ageGroup == other.ageGroup &&
          statusIndex == other.statusIndex &&
          distance == other.distance;

  static SearchPreference fromEntity(SearchPreferenceEntity searchPrefEntity) {
    return new SearchPreference(
      ltaNumber: searchPrefEntity.ltaNumber,
      grade: searchPrefEntity.grade,
      gender: searchPrefEntity.gender,
      ageGroup: searchPrefEntity.ageGroup,
      statusIndex: searchPrefEntity.statusIndex,
      distance: searchPrefEntity.distance,
    );
  }

  SearchPreference copyWth(
      {int ltaNumber, int grade, int distance, int ageGroup, String gender}) {
    return new SearchPreference(ltaNumber: ltaNumber ?? this.ltaNumber, 
    statusIndex: this.statusIndex, 
    ageGroup: ageGroup ?? this.ageGroup, 
    distance: distance ?? this.distance, 
    grade: distance ?? this.grade, 
    gender: gender ?? this.gender) ;
  }

  SearchPreferenceEntity toEntity() {
    return new SearchPreferenceEntity(
      ltaNumber: ltaNumber,
      grade: grade,
      gender: gender,
      ageGroup: ageGroup,
      statusIndex: statusIndex,
      distance: distance,
    );
  }

  @override
  String toString() {
    return 'SearchPreference{grade: $grade, gender: $gender, distance: $distance, statusIndex: $statusIndex, ltaNumber: $ltaNumber, ageGroup: $ageGroup}';
  }
}

class SearchPreferenceEntity {
  SearchPreferenceEntity(
      {this.ltaNumber, this.grade, this.gender, this.distance, this.statusIndex, this.ageGroup});
  int grade;
  String gender;
  String ltaRating;
  int ltaNumber;
  int distance;
  int ageGroup;
  int statusIndex;

  Map<String, Object> toJson() {
    return {
      'grade': grade,
      'gender': gender,
      'ltaNumber': ltaNumber,
      'distance': distance,
      'statusIndex': statusIndex,
      'ageGroup': ageGroup,
    };
  }

  static SearchPreferenceEntity fromJson(Map<String, Object> json) {
    return new SearchPreferenceEntity(
      grade: json['grade'] as int,
      gender: json['gender'] as String,
      ltaNumber: json['ltaNumber'] as int,
      distance: json['distance'] as int,
      ageGroup: json['ageGroup'] as int,
      statusIndex: json['statusIndex'] as int,
    );
  }
}
