import 'package:meta/meta.dart';
import 'basket_item.dart';

class BasketEntity {
  int ltaNumber;
  double totalCost;
  List<BasketItemEntity> basketItems;
  BasketEntity({this.ltaNumber, this.totalCost, this.basketItems});

  @override
  int get hashCode =>
      totalCost.hashCode ^ basketItems.hashCode ^ ltaNumber.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BasketEntity &&
          runtimeType == other.runtimeType &&
          totalCost == other.totalCost &&
          ltaNumber == other.ltaNumber &&
          basketItems == other.basketItems;

  Map<String, Object> toJson() {
    return {
      'totalCost': totalCost,
      'ltaNumber': ltaNumber,
      'basketItems': _jsonFromBasketItem(basketItems)
    };
  }

  Basket fromEntity() {
    return new Basket(
        totalCost: totalCost,
        ltaNumber: ltaNumber,
        basketItems: _basketItems(basketItems));
  }

  List<BasketItem> _basketItems(List<BasketItemEntity> items){ 
    var x = [];
    items.forEach((f) => x.add(f.fromEntity()));
    return x;
  }

  dynamic _jsonFromBasketItem(List<BasketItemEntity> basketItems) {
    var x = [];
    basketItems.forEach((f) => x.add(f.toJson()));
    return x;
  }

  //TODO: Need Unit tests around these
  static BasketEntity fromJson(Map<String, Object> json) {
    return new BasketEntity(
        totalCost: json['totalCost'] as double,
        ltaNumber: json['ltaNumber'] as int,
        basketItems: _basketItemEntitysFromJson(json['basketItems']));
  }

  static List<BasketItemEntity> _basketItemEntitysFromJson(dynamic json) {
    List<BasketItemEntity> entrants = [];
    for (int i = 0; i < json.length; i++) {
      var basketItemEntitys = new BasketItemEntity(
          cost: json[i]['cost'] as double,
          code: json[i]['code'],
          grade: json[i]['grade'],
          status: json[i]['status'],
          tournamentName: json[i]['tournamentName']);
      entrants.add(basketItemEntitys);
    }
    return entrants;
  }
}

@immutable
class Basket {
  const Basket({this.ltaNumber, this.totalCost, this.basketItems});

  final double totalCost;
  final int ltaNumber;
  final List<BasketItem> basketItems;

  BasketEntity toEntity() {
    return new BasketEntity(
        totalCost: totalCost,
        ltaNumber: ltaNumber,
        basketItems: _basketItemEntitys(basketItems));
  }

  @override
  int get hashCode =>
      totalCost.hashCode ^
      ltaNumber.hashCode ^
      basketItems.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Basket &&
          runtimeType == other.runtimeType &&
          totalCost == other.totalCost &&
          ltaNumber == other.ltaNumber &&
          basketItems == other.basketItems;

  @override
  String toString() {
    return 'Basket{totalCost: $totalCost, ltaNumber: $ltaNumber, basketItems: $basketItems}';
  }

 Basket copyWith(
      {int ltaNumber,
      double totalCost,
      List<BasketItem> basketItems}) {
    return new Basket(
        ltaNumber: ltaNumber ?? this.ltaNumber,
        totalCost: totalCost ?? this.totalCost,
        basketItems: basketItems ?? this.basketItems);
  }

  static Basket fromEntity(BasketEntity basketEntity) {
    return new Basket(
        totalCost: basketEntity.totalCost, basketItems: BasketItem.fromEntitys(basketEntity.basketItems), ltaNumber: basketEntity.ltaNumber);
  }

  static List<BasketItemEntity> _basketItemEntitys(
      List<BasketItem> basketItems) {
    List<BasketItemEntity> baskets = [];
    if (basketItems != null) {
      basketItems.forEach((f) => baskets.add(f.toEntity()));
    }
    return baskets;
  }
}
