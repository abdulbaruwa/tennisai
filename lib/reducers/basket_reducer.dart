import 'package:redux/redux.dart';
import '../models/models.dart';
import '../actions/actions.dart';

final basketReducer = combineTypedReducers<List<Basket>>([
  new ReducerBinding<List<Basket>, BasketLoadedAction>(_setLoadedBasket),
  new ReducerBinding<List<Basket>, BasketNotLoadedAction>(_setNoBasket),
  new ReducerBinding<List<Basket>, AddTournamentToBasketAction>(_addTournamentToBasket),
]);

List<Basket> _setLoadedBasket(List<Basket> player, BasketLoadedAction action) {
  return action.basket;
}

List<Basket> _setNoBasket(List<Basket> player, BasketNotLoadedAction action) {
  return null;
}

List<Basket> _addTournamentToBasket(List<Basket> baskets, AddTournamentToBasketAction action){
  var basketItem = BasketItem.fromTournament(action.tournament);
  var basket = baskets.first;
  if(basket.basketItems.contains(basketItem) == false){
    var newBasketItems = new List<BasketItem>.from(basket.basketItems)..add(basketItem);
    var totalCost = 0.0;
    newBasketItems.forEach((f) => totalCost += f.cost);
    var newBasket = basket.copyWith(basketItems: newBasketItems, totalCost: totalCost);
    print('basket_reducer._addTournamentToBasket: New basketItem - ${basketItem.toString()} added to Basket.');
    return new List<Basket>.from([])..add(newBasket);
  }
  print('basket_reducer._addTournamentToBasket: Basket contains basketItem - ${basketItem.toString()}. Request ignored. ');
  return baskets;
}
