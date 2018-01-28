import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../models/models.dart';
import '../selectors/selectors.dart';
import '../views/basket_view.dart';
import '../actions/actions.dart';

class BasketContainer extends StatelessWidget {
  BasketContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(converter: _ViewModel.fromStore, builder: (context, vm){

      return new BasketView(basket: vm.basket, player: vm.player, onRemoveFromBasket: vm.onRemoveFromBasket);
    });
  }
}

class _ViewModel {
  final bool loading;
  final Basket basket;
  final Player player;
  final Function(String) onRemoveFromBasket;

  _ViewModel(
      {@required this.loading, @required this.basket, @required this.player, this.onRemoveFromBasket});

  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(
        basket: basketSelector(store.state).value,
        player: playerSelector(store.state).value,
        loading: store.state.isLoading,
        onRemoveFromBasket: (code) {
          print(
              'basket_container.viewModel: Removing tournament with code $code from basket ');
               store.dispatch(new RemoveTournamentFromBasketAction(code));
        });
  }
}
