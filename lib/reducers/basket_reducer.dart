import 'package:redux/redux.dart';
import '../models/models.dart';
import '../actions/actions.dart';

final basketReducer = combineTypedReducers<List<Basket>>([
  new ReducerBinding<List<Basket>, BasketLoadedAction>(_setLoadedBasket),
  new ReducerBinding<List<Basket>, BasketNotLoadedAction>(_setNoBasket),
  new ReducerBinding<List<Basket>, AddTournamentToBasketAction>(_addTournamentToBasket),
  new ReducerBinding<List<Basket>, RemoveTournamentFromBasketAction>(_removeTournamentFromBasket),
  new ReducerBinding<List<Basket>, BasketSentToLtaAction>(_clearBasket),
]);

List<Basket> _setLoadedBasket(List<Basket> player, BasketLoadedAction action) {
  return action.basket;
}

List<Basket> _setNoBasket(List<Basket> player, BasketNotLoadedAction action) {
  return null;
}

List<Basket> _addTournamentToBasket(
    List<Basket> baskets, AddTournamentToBasketAction action) {
  var basketItem = BasketItem.fromTournament(action.tournament, action.playerId);
  var basket = baskets.first;
  if (basket.basketItems.contains(basketItem) == false) {
    var newBasketItems = new List<BasketItem>.from(basket.basketItems)
      ..add(basketItem);
    var totalCost = aggregateCost(newBasketItems);
    var newBasket =
        basket.copyWith(basketItems: newBasketItems, totalCost: totalCost);
    print(
        'basket_reducer._addTournamentToBasket: New basketItem - ${basketItem.toString()} added to Basket.');
    return new List<Basket>.from([])..add(newBasket);
  }
  print(
      'basket_reducer._addTournamentToBasket: Basket contains basketItem - ${basketItem.toString()}. Request ignored. ');
  return baskets;
}

List<Basket> _clearBasket(List<Basket> basket, BasketSentToLtaAction action) {
  var newBasket = basket.first.copyWith(totalCost: 0.0, basketItems: []);
  return new List<Basket>.from([])..add(newBasket);
}

List<Basket> _removeTournamentFromBasket(List<Basket> basket, RemoveTournamentFromBasketAction action) {
  var items = basket.first.basketItems
      .where((basketItem) => basketItem.code != action.code)
      .toList();
  var totalCost = aggregateCost(items);

  var newBasket =
      basket.first.copyWith(basketItems: items, totalCost: totalCost);
  print(
      'basket_reducer._removeTournamentFromBasket: BasketItem for tournament with Code- ${action.code} removed from Basket.');
  return new List<Basket>.from([])..add(newBasket);
}

double aggregateCost(List<BasketItem> basketItems) {
  var totalCost = 0.0;
  basketItems.forEach((f) => totalCost += f.cost);
  return totalCost;
}
