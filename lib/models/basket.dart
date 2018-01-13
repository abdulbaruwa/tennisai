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

  dynamic _jsonFromBasketItem(List<BasketItemEntity> entrants) {
    var x = [];
    entrants.forEach((f) => x.add(f.toJson()));
    return x;
  }

  static List<BasketItem> _basketItems(List<BasketItemEntity> entrantEntitys) {
    List<BasketItem> basketItems = [];
    if (entrantEntitys != null) {
      entrantEntitys.forEach((f) => basketItems.add(f.fromEntity()));
    }
    return basketItems;
  }

TODO: Need Unit tests around these
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
          tournamentId: json[i]['tournamentId'],
          tournamentName: json[i]['tournamentName']);
      entrants.add(basketItemEntitys);
    }
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

  Basket fromEntity() {
    return new Basket(
        totalCost: totalCost, basketItems: basketItems, ltaNumber: ltaNumber);
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
