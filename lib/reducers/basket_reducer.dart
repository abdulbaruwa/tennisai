import 'package:redux/redux.dart';
import '../models/models.dart';
import '../actions/actions.dart';

final basketReducer = combineTypedReducers<List<Basket>>([
  new ReducerBinding<List<Basket>, BasketLoadedAction>(_setLoadedBasket),
  new ReducerBinding<List<Basket>, BasketNotLoadedAction>(_setNoBasket),
]);

List<Basket> _setLoadedBasket(List<Basket> player, BasketLoadedAction action) {
  return action.basket;
}

List<Basket> _setNoBasket(List<Basket> player, BasketNotLoadedAction action) {
  return null;
}
