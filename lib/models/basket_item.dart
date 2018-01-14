import 'package:meta/meta.dart';

class BasketItemEntity {
  String tournamentName;
  double cost;
  int grade;
  String status;
  String tournamentId;
  BasketItemEntity(
      {this.tournamentName, this.cost, this.tournamentId, this.grade, this.status});

  // EntrantEntity(
  //     this.name, this.ranking, this.rating, this.ltaNumber, this.status);

  @override
  int get hashCode =>
      tournamentName.hashCode ^ tournamentId.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BasketItemEntity &&
          runtimeType == other.runtimeType &&
          tournamentName == other.tournamentName &&
          grade == other.grade &&
          status == other.status &&
          cost == other.cost &&
          tournamentId == other.tournamentId ;

  Map<String, Object> toJson() {
    return {
      'tournamentName': tournamentName,
      'cost': cost,
      'grade': grade,
      'status': status,
      'tournamentId': tournamentId,
    };
  }

  BasketItem fromEntity() {
    return new BasketItem(
        tournamentName: tournamentName,
        cost: cost,
        grade: grade,
        status: status,
        tournamentId: tournamentId);
  }

  static BasketItemEntity fromJson(Map<String, Object> json) {
    return new BasketItemEntity(
      tournamentName: json['name'] as String,
      cost: json['cost'] as double,
      grade: json['grade'] as int,
      status: json['status'] as String,
      tournamentId: json['rating'] as String,
    );
  }
}

@immutable
class BasketItem {
  const BasketItem(
      {this.tournamentName, this.cost, this.tournamentId, this.grade, this.status});

  final String tournamentName;
  final int grade;
  final String status;
  final double cost;
  final String tournamentId;

  BasketItemEntity toEntity() {
    return new BasketItemEntity(
        tournamentName: tournamentName,
        cost: cost,
        grade: grade,
        status: status,
        tournamentId: tournamentId);
  }

  BasketItem fromEntity() {
    return new BasketItem(
        tournamentName: tournamentName,
        cost: cost,
        grade: grade,
        status: status,
        tournamentId: tournamentId);
  }

    static List<BasketItem> fromEntitys(List<BasketItemEntity> basketItemEntitys) {
    List<BasketItem> basketItems = [];
    if (basketItemEntitys != null) {
      basketItemEntitys.forEach((f) => basketItems.add(f.fromEntity()));
    }
    return basketItems;
  }
}
