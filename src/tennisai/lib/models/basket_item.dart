import 'package:meta/meta.dart';
import '../models/tournament.dart';

class BasketItemEntity {
  String tournamentName;
  double cost;
  int grade;
  String status;
  String code;
  String basketStatus;
  String playerId;
  BasketItemEntity(
      {this.tournamentName, this.cost, this.code, this.grade, this.status, this.basketStatus, this.playerId});
  @override
  int get hashCode =>
      tournamentName.hashCode ^ code.hashCode ^ grade.hashCode ^ status.hashCode ^ basketStatus.hashCode ^ playerId.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BasketItemEntity &&
          runtimeType == other.runtimeType &&
          tournamentName == other.tournamentName &&
          grade == other.grade &&
          status == other.status &&
          cost == other.cost &&
          basketStatus == other.basketStatus && 
          playerId == other.playerId && 
          code == other.code ;

  Map<String, Object> toJson() {
    return {
      'tournamentName': tournamentName,
      'cost': cost,
      'grade': grade,
      'status': status,
      'code': code,
      'playerId': playerId,
      'basketStatus' : basketStatus,
    };
  }

  BasketItem fromEntity() {
    return new BasketItem(
        tournamentName: tournamentName,
        cost: cost,
        grade: grade,
        status: status,
        basketStatus: basketStatus,
        playerId: playerId,
        code: code);
  }

  static BasketItemEntity fromJson(Map<String, Object> json) {
    return new BasketItemEntity(
      tournamentName: json['tournamentName'] as String,
      cost: json['cost'] as double,
      grade: json['grade'] as int,
      status: json['status'] as String,
      code: json['code'] as String,
      playerId: json['playerId'] as String,
      basketStatus: json['basketStatus'] as String,
    );
  }
}

@immutable
class BasketItem {
   BasketItem({this.tournamentName, this.cost, this.code, this.grade, this.status, this.basketStatus, this.playerId});

  final String tournamentName;
  final int grade;
  final String status;
  final double cost;
  final String code;
  final String basketStatus;
  final String playerId;


 @override
  int get hashCode =>
      tournamentName.hashCode ^
      grade.hashCode ^
      status.hashCode ^
      cost.hashCode ^
      basketStatus.hashCode ^
      playerId.hashCode ^
      code.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BasketItem &&
          runtimeType == other.runtimeType &&
          tournamentName == other.tournamentName &&
          grade == other.grade &&
          cost == other.cost &&
          code == other.code &&
          basketStatus == other.basketStatus &&
          playerId == other.playerId &&
          status == other.status;

  @override
  String toString() {
    return 'BasketItem{tournamentName: $tournamentName, grade: $grade, cost: $cost, code: $code, status: $status, basketStatus: $basketStatus, playerId: $playerId}';
  }

  BasketItemEntity toEntity() {
    return new BasketItemEntity(
        tournamentName: tournamentName,
        cost: cost,
        grade: grade,
        status: status,
        basketStatus: basketStatus,
        playerId: playerId,  
        code: code);
  }

  BasketItem fromEntity() {
    return new BasketItem(
        tournamentName: tournamentName,
        cost: cost,
        grade: grade,
        status: status,
        basketStatus: basketStatus,
        playerId: playerId,
        code: code);
  }

  static BasketItem fromTournament(Tournament tournament, String playerId){
     return new BasketItem(
        tournamentName: tournament.name,
        cost: tournament.cost,
        grade: tournament.grade,
        status: tournament.status,
        playerId: playerId,
        basketStatus: 'Pending',
        code: tournament.code);
  }

    static List<BasketItem> fromEntitys(List<BasketItemEntity> basketItemEntitys) {
    List<BasketItem> basketItems = [];
    if (basketItemEntitys != null) {
      basketItemEntitys.forEach((f) => basketItems.add(f.fromEntity()));
    }
    return basketItems;
  }
}
