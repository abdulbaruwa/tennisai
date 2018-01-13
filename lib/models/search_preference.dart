import 'package:meta/meta.dart';

@immutable
class SearchPreference {
  final int ltaNumber;
  final int grade;
  final String gender;
  final int distance;
  final int ageGroup;

  SearchPreference({
    this.ltaNumber,
    this.grade,
    this.gender,
    this.distance,
    this.ageGroup
  });
  @override
  int get hashCode =>
      ltaNumber.hashCode ^ grade.hashCode ^ gender.hashCode ^ distance.hashCode ^ ageGroup.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchPreference &&
          runtimeType == other.runtimeType &&
          ltaNumber == other.ltaNumber &&
          grade == other.grade &&
          gender == other.gender &&
          ageGroup == other.ageGroup &&
          distance == other.distance;

  static SearchPreference fromEntity(SearchPreferenceEntity playerEntity) {
    return new SearchPreference(
      ltaNumber: playerEntity.ltaNumber,
      grade: playerEntity.grade,
      gender: playerEntity.gender,
      ageGroup: playerEntity.ageGroup,
      distance: playerEntity.distance,
    );
  }

  SearchPreferenceEntity toEntity() {
    return new SearchPreferenceEntity(
      ltaNumber: ltaNumber,
      grade: grade,
      gender: gender,
      ageGroup: ageGroup,
      distance: distance,
    );
  }

  @override
  String toString() {
    return 'Player{grade: $grade, gender: $gender, distance: $distance, ltaNumber: $ltaNumber, ageGroup: $ageGroup}';
  }
}

class SearchPreferenceEntity {
  SearchPreferenceEntity(
      {this.ltaNumber, this.grade, this.gender, this.distance, this.ageGroup});
  int grade;
  String gender;
  String ltaRating;
  int ltaNumber;
  int distance;
  int ageGroup;

  Map<String, Object> toJson() {
    return {
      'grade': grade,
      'gender': gender,
      'ltaNumber': ltaNumber,
      'distance': distance,
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
    );
  }
}
