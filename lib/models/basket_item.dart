import 'package:meta/meta.dart';
import '../models/tournament.dart';

class BasketItemEntity {
  String tournamentName;
  double cost;
  String grade;
  String status;
  String code;
  BasketItemEntity(
      {this.tournamentName, this.cost, this.code, this.grade, this.status});

  // EntrantEntity(
  //     this.name, this.ranking, this.rating, this.ltaNumber, this.status);

  @override
  int get hashCode =>
      tournamentName.hashCode ^ code.hashCode ^ grade.hashCode ^ status.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BasketItemEntity &&
          runtimeType == other.runtimeType &&
          tournamentName == other.tournamentName &&
          grade == other.grade &&
          status == other.status &&
          cost == other.cost &&
          code == other.code ;

  Map<String, Object> toJson() {
    return {
      'tournamentName': tournamentName,
      'cost': cost,
      'grade': grade,
      'status': status,
      'code': code,
    };
  }

  BasketItem fromEntity() {
    return new BasketItem(
        tournamentName: tournamentName,
        cost: cost,
        grade: grade,
        status: status,
        code: code);
  }

  static BasketItemEntity fromJson(Map<String, Object> json) {
    return new BasketItemEntity(
      tournamentName: json['tournamentName'] as String,
      cost: json['cost'] as double,
      grade: json['grade'] as String,
      status: json['status'] as String,
      code: json['code'] as String,
    );
  }
}

@immutable
class BasketItem {
   BasketItem({this.tournamentName, this.cost, this.code, this.grade, this.status});

  final String tournamentName;
  final String grade;
  final String status;
  final double cost;
  final String code;


 @override
  int get hashCode =>
      tournamentName.hashCode ^
      grade.hashCode ^
      status.hashCode ^
      cost.hashCode ^
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
          status == other.status;

  @override
  String toString() {
    return 'BasketItem{tournamentName: $tournamentName, grade: $grade, cost: $cost, code: $code, status: $status}';
  }
  

  BasketItemEntity toEntity() {
    return new BasketItemEntity(
        tournamentName: tournamentName,
        cost: cost,
        grade: grade,
        status: status,
        code: code);
  }

  BasketItem fromEntity() {
    return new BasketItem(
        tournamentName: tournamentName,
        cost: cost,
        grade: grade,
        status: status,
        code: code);
  }

  static BasketItem fromTournament(Tournament tournament){
     return new BasketItem(
        tournamentName: tournament.name,
        cost: tournament.cost,
        grade: tournament.grade,
        status: tournament.status,
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
