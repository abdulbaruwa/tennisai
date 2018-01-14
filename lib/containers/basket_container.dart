import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../models/models.dart';
import '../selectors/selectors.dart';
import '../views/basket_view.dart';

class BasketContainer extends StatelessWidget {
  BasketContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(converter: _ViewModel.fromStore, builder: (context, vm){

      return new BasketView(basket: vm.basket, player: vm.player);
    });
  }
}

class _ViewModel {
  final bool loading;
  final Basket basket;
  final Player player;

  _ViewModel(
      {@required this.loading, @required this.basket, @required this.player});

  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(
        basket: basketSelector(store.state).value,
        player: playerSelector(store.state).value,
        loading: store.state.isLoading);
  }
}
