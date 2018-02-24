import 'package:meta/meta.dart';

@immutable
class RankingInfo{
  final String ageGroup;
  final int regional;
  final int county;
  final int national;
  final int playerId;

  const RankingInfo({this.ageGroup, this.regional, this.county, this.national, this.playerId});
    RankingInfoEntity toEntity() {
    return new RankingInfoEntity(
        ageGroup: ageGroup,
        regional: regional,
        county: county,
        national: national,
        playerId: playerId);
  }

  RankingInfo fromEntity() {
    return new RankingInfo(
        ageGroup: ageGroup,
        regional: regional,
        county: county,
        national: national,
        playerId: playerId);
  }
}

class RankingInfoEntity{
  String ageGroup;
  int regional;
  int county;
  int national;
  int playerId;

  RankingInfoEntity({this.ageGroup, this.regional, this.county, this.national, this.playerId});

  @override
  int get hashCode =>
      ageGroup.hashCode ^ regional.hashCode ^ county.hashCode ^ national.hashCode ^ playerId.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RankingInfoEntity &&
          runtimeType == other.runtimeType &&
          ageGroup == other.ageGroup &&
          regional == other.regional &&
          national == other.national &&
          county == other.county &&
          playerId == other.playerId;

  Map<String, Object> toJson() {
    return {
      'ageGroup': ageGroup,
      'regional': regional,
      'national': national,
      'county': county,
      'playerId': playerId
    };
  }

  RankingInfo fromEntity() {
    return new RankingInfo(
        ageGroup: ageGroup,
        regional: regional,
        national: national,
        county: county,
        playerId: playerId);
  }

  static RankingInfoEntity fromJson(Map<String, Object> json) {
    return new RankingInfoEntity(
      ageGroup: json['ageGroup'] as String,
      regional: json['regional'] as int,
      county: json['county'] as int,
      national: json['national'] as int,
      playerId: json['playerId'] as int,
    );
  }
}