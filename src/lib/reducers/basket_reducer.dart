import 'package:redux/redux.dart';
import '../actions/actions.dart';
import 'package:swagger/api.dart';

final basketReducer = combineReducers<List<Basket>>([
  new TypedReducer<List<Basket>, BasketLoadedAction>(_setLoadedBasket),
  new TypedReducer<List<Basket>, BasketNotLoadedAction>(_setNoBasket),
  new TypedReducer<List<Basket>, AddTournamentToBasketAction>(
      _addTournamentToBasket),
  new TypedReducer<List<Basket>, RemoveTournamentFromBasketAction>(
      _removeTournamentFromBasket),
  new TypedReducer<List<Basket>, BasketSentToLtaAction>(_clearBasket),
]);

List<Basket> _setLoadedBasket(List<Basket> player, BasketLoadedAction action) {
  return action.basket;
}

List<Basket> _setNoBasket(List<Basket> player, BasketNotLoadedAction action) {
  return null;
}

List<Basket> _addTournamentToBasket(
    List<Basket> baskets, AddTournamentToBasketAction action) {
  var basketItem = _fromTournament(action.tournament, action.playerId);
  var basket = baskets.first;
  if (basket.basketItems.contains(basketItem) == false) {
    var newBasketItems = new List<BasketItem>.from(basket.basketItems)
      ..add(basketItem);
    var totalCost = aggregateCost(newBasketItems);
    var newBasket = _copyWith(
        item: basket, basketItems: newBasketItems, totalCost: totalCost);
    print(
        'basket_reducer._addTournamentToBasket: New basketItem - ${basketItem.toString()} added to Basket.');
    return new List<Basket>.from([])..add(newBasket);
  }
  print(
      'basket_reducer._addTournamentToBasket: Basket contains basketItem - ${basketItem.toString()}. Request ignored. ');
  return baskets;
}

List<Basket> _clearBasket(List<Basket> basket, BasketSentToLtaAction action) {
  var newBasket =
      _copyWith(item: basket.first, totalCost: 0.0, basketItems: []);
  return new List<Basket>.from([])..add(newBasket);
}

List<Basket> _removeTournamentFromBasket(
    List<Basket> basket, RemoveTournamentFromBasketAction action) {
  var items = basket.first.basketItems
      .where((basketItem) => basketItem.code != action.code)
      .toList();
  var totalCost = aggregateCost(items);

  var newBasket =
      _copyWith(item: basket.first, basketItems: items, totalCost: totalCost);
  print(
      'basket_reducer._removeTournamentFromBasket: BasketItem for tournament with Code- ${action.code} removed from Basket.');
  return new List<Basket>.from([])..add(newBasket);
}

double aggregateCost(List<BasketItem> basketItems) {
  var totalCost = 0.0;
  basketItems.forEach((f) => totalCost += f.cost);
  return totalCost;
}

BasketItem _fromTournament(Tournament tournament, String playerId) {
  var basket = new BasketItem();
  {
    basket.tournamentName = tournament.name;
    basket.cost = tournament.cost;
    // basket.grade= tournament.grade;
    basket.playerId = playerId;
    basket.basketStatus = 'Pending';
    basket.code = tournament.code;
  }
  return basket;
}

Basket _copyWith(
    {Basket item,
    int ltaNumber,
    double totalCost,
    String playerId,
    List<BasketItem> basketItems}) {
  var basket = new Basket();

  basket.ltaNumber = ltaNumber ?? item.ltaNumber;
  basket.playerId = playerId ?? item.playerId;
  //basket.totalCost =  totalCost ?? item.totalCost;
  basket.basketItems = basketItems ?? item.basketItems;
  return basket;
}
