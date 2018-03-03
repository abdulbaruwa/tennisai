import 'package:meta/meta.dart';

@immutable
class MatchResultInfo{
  final DateTime tournamentDate;
  final String ageGroup;
  final int grade;
  final String tournamentName;
  final String tournamentEvent;
  final String result;
  final int points;
  final bool appliedToRanking;
  final int playerId;


  const MatchResultInfo({this.tournamentDate, this.ageGroup, this.grade, this.tournamentEvent, this.tournamentName, this.result, this.points, this.appliedToRanking, this.playerId});
    MatchResultInfoEntity toEntity() {
    return new MatchResultInfoEntity(
        ageGroup: ageGroup,
        tournamentDate: tournamentDate.millisecondsSinceEpoch,
        grade: grade,
        tournamentName: tournamentName,
        tournamentEvent: tournamentEvent,
        result: result,
        points: points,
        appliedToRanking: appliedToRanking,
        playerId: playerId);
  }

  MatchResultInfo fromEntity() {
    return new MatchResultInfo(
        ageGroup: ageGroup,
        tournamentDate: tournamentDate,
        grade: grade,
        tournamentName: tournamentName,
        tournamentEvent: tournamentEvent,
        result: result,
        points: points,
        appliedToRanking: appliedToRanking,
        playerId: playerId);
  }
}


class MatchResultInfoEntity{
  final int tournamentDate;
  final String ageGroup;
  final int grade;
  final String tournamentName;
  final String tournamentEvent;
  final String result;
  final int points;
  final bool appliedToRanking;
  final int playerId;

  MatchResultInfoEntity({this.tournamentDate, this.ageGroup, this.grade, this.tournamentEvent, this.tournamentName, this.result, this.points, this.appliedToRanking, this.playerId});

  @override
  int get hashCode =>
      ageGroup.hashCode ^ tournamentDate.hashCode ^ grade.hashCode ^ tournamentEvent.hashCode ^ tournamentName.hashCode
      ^ result.hashCode ^ points.hashCode ^ appliedToRanking.hashCode ^ playerId.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MatchResultInfoEntity &&
          runtimeType == other.runtimeType &&
          ageGroup == other.ageGroup &&
          tournamentDate == other.tournamentDate &&
          grade == other.grade &&
          tournamentEvent == other.tournamentEvent &&
          tournamentName == other.tournamentName &&
          result == other.result &&
          points == other.points &&
          appliedToRanking == other.appliedToRanking &&
          playerId == other.playerId;

  Map<String, Object> toJson() {
    return {
      'ageGroup': ageGroup,
      'tournamentDate': tournamentDate,
      'grade': grade,
      'tournamentName': tournamentName,
      'tournamentEvent': tournamentEvent,
      'result': result,
      'points': points,
      'aplliedToRanking': appliedToRanking,
      'playerId': playerId,
    };
  }

  MatchResultInfo fromEntity() {
    return new MatchResultInfo(
        ageGroup: ageGroup,
        tournamentDate: new DateTime.fromMillisecondsSinceEpoch(tournamentDate),
        grade: grade,
        tournamentName: tournamentName,
        tournamentEvent: tournamentEvent,
        result: result,
        points: points,
        appliedToRanking: appliedToRanking,
        playerId: playerId);
  }

  static MatchResultInfoEntity fromJson(Map<String, Object> json) {
    return new MatchResultInfoEntity(
      ageGroup: json['ageGroup'] as String,
      tournamentDate: json['tournamentDate'] as int,
      grade: json['grade'] as int,
      tournamentEvent: json['tournamentEvent'] as String,
      tournamentName: json['tournamentName'] as String,
      result: json['result'] as String,
      points: json['points'] as int,
      appliedToRanking: json['appliedToRanking'] as bool,
      playerId: json['playerId'] as int,
    );
  }
}

List<MatchResultInfo> matchResultInfos = <MatchResultInfo>[
new MatchResultInfo(tournamentDate: new DateTime(2018, 2, 17), tournamentName: 'Sutton Tennis Academy Men\'s INDOOR FAST4 Event', tournamentEvent: 'Open Mens Singles', ageGroup: '', appliedToRanking: true, grade: 3, playerId: 1,result: 'MD 58POCF W', points: 1320),
new MatchResultInfo(tournamentDate: new DateTime(2018, 1, 28), tournamentName: 'Sutton Tennis Academy Men\'s INDOOR FAST4 Event', tournamentEvent: 'Open Mens Singles', ageGroup: '', appliedToRanking: true, grade: 4, playerId: 1,result: 'MD 58POCF W', points: 320),
new MatchResultInfo(tournamentDate: new DateTime(2018, 1, 21), tournamentName: 'Sutton Tennis Academy Men\'s INDOOR FAST4 Event', tournamentEvent: 'Open Mens Singles', ageGroup: '', appliedToRanking: true, grade: 4, playerId: 1,result: 'MD F W', points: 500),
new MatchResultInfo(tournamentDate: new DateTime(2018, 12, 18), tournamentName: 'Sutton Tennis Academy Men\'s INDOOR FAST4 Event', tournamentEvent: 'Open Mens Singles', ageGroup: '', appliedToRanking: false, grade: 3, playerId: 1,result: 'MD Q', points: 1),
new MatchResultInfo(tournamentDate: new DateTime(2018, 1, 6), tournamentName: 'Sutton Tennis Academy Men\'s INDOOR FAST4 Event', tournamentEvent: 'Open Mens Singles', ageGroup: '', appliedToRanking: false, grade: 3, playerId: 1,result: 'PQ QF', points: 1),
new MatchResultInfo(tournamentDate: new DateTime(2018, 1, 20), tournamentName: 'Sutton Tennis Academy Men\'s INDOOR FAST4 Event', tournamentEvent: 'Open Mens Singles', ageGroup: '', appliedToRanking: true, grade: 3, playerId: 1,result: 'MD 58POCF W', points: 132),
];