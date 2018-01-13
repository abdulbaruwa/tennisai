import 'package:meta/meta.dart';

class BasketItemEntity {
  String tournamentName;
  double cost;
  String tournamentId;
  BasketItemEntity(
      {this.tournamentName, this.cost, this.tournamentId});

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
          cost == other.cost &&
          tournamentId == other.tournamentId ;

  Map<String, Object> toJson() {
    return {
      'tournamentName': tournamentName,
      'cost': cost,
      'tournamentId': tournamentId,
    };
  }

  BasketItem fromEntity() {
    return new BasketItem(
        tournamentName: tournamentName,
        cost: cost,
        tournamentId: tournamentId);
  }

  static BasketItemEntity fromJson(Map<String, Object> json) {
    return new BasketItemEntity(
      tournamentName: json['name'] as String,
      cost: json['cost'] as double,
      tournamentId: json['rating'] as String,
    );
  }
}

@immutable
class BasketItem {
  const BasketItem(
      {this.tournamentName, this.cost, this.tournamentId});

  final String tournamentName;
  final double cost;
  final String tournamentId;

  BasketItemEntity toEntity() {
    return new BasketItemEntity(
        tournamentName: tournamentName,
        cost: cost,
        tournamentId: tournamentId);
  }

  BasketItem fromEntity() {
    return new BasketItem(
        tournamentName: tournamentName,
        cost: cost,
        tournamentId: tournamentId);
  }
}
