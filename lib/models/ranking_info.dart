import 'package:meta/meta.dart';

@immutable
class RankingInfo{
  final String ageGroup;
  final int regional;
  final int county;
  final int national;
  final int playerId;
  final int totalPoints;

  const RankingInfo({this.ageGroup, this.regional, this.county, this.national, this.playerId, this.totalPoints});
    RankingInfoEntity toEntity() {
    return new RankingInfoEntity(
        ageGroup: ageGroup,
        regional: regional,
        county: county,
        national: national,
        totalPoints: totalPoints,
        playerId: playerId);
  }

  static RankingInfo fromEntity(RankingInfoEntity entity) {
    return new RankingInfo(
        ageGroup: entity.ageGroup,
        regional: entity.regional,
        county: entity.county,
        national: entity.hashCode,
        totalPoints: entity.totalPoints,
        playerId: entity.playerId);
  }
}

class RankingInfoEntity{
  String ageGroup;
  int regional;
  int county;
  int national;
  int totalPoints;
  int playerId;

  RankingInfoEntity({this.ageGroup, this.regional, this.county, this.national, this.playerId, this.totalPoints});

  @override
  int get hashCode =>
      ageGroup.hashCode ^ regional.hashCode ^ county.hashCode ^ national.hashCode ^ playerId.hashCode ^ totalPoints.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RankingInfoEntity &&
          runtimeType == other.runtimeType &&
          ageGroup == other.ageGroup &&
          regional == other.regional &&
          national == other.national &&
          county == other.county &&
          totalPoints == other.totalPoints &&
          playerId == other.playerId;

  Map<String, Object> toJson() {
    return {
      'ageGroup': ageGroup,
      'regional': regional,
      'national': national,
      'county': county,
      'totalPoints': totalPoints,
      'playerId': playerId
    };
  }

  RankingInfo fromEntity() {
    return new RankingInfo(
        ageGroup: ageGroup,
        regional: regional,
        national: national,
        county: county,
        totalPoints: totalPoints,
        playerId: playerId);
  }

  static RankingInfoEntity fromJson(Map<String, Object> json) {
    return new RankingInfoEntity(
      ageGroup: json['ageGroup'] as String,
      regional: json['regional'] as int,
      county: json['county'] as int,
      national: json['national'] as int,
      totalPoints: json['totalPoints'] as int,
      playerId: json['playerId'] as int,
    );
  }
}

// List<RankingInfo> rankingInfos = <RankingInfo>[
//   new RankingInfo(playerId: 1, ageGroup: '16', national: 256, regional: 54, county: 17, totalPoints: 2221),
//   new RankingInfo(playerId: 1, ageGroup: '18', national: 426, regional: 104, county: 35, totalPoints: 2221),
//   new RankingInfo(playerId: 1, ageGroup: 'Open', national: 805, regional: 197, county: 68,  totalPoints: 2221),
// ];