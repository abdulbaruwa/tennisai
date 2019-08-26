import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:swagger/api.dart';
import '../models/models.dart';
import '../selectors/selectors.dart';
import '../views/basket_view.dart';
import '../actions/actions.dart';

class BasketContainer extends StatelessWidget {
  BasketContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(converter: _ViewModel.fromStore, builder: (context, vm){

      return new BasketView(basket: vm.basket, player: vm.player, onRemoveFromBasket: vm.onRemoveFromBasket, onSendToLta: vm.onSendToLta, changedAvatar: vm.changedAvatar);
    });
  }
}

class _ViewModel {
  final bool loading;
  final Basket basket;
  final Player player;
  final File changedAvatar;
  final Function(String) onRemoveFromBasket;
  final Function(Basket) onSendToLta;

  _ViewModel(
      {@required this.loading, @required this.basket, @required this.player, this.onRemoveFromBasket, this.onSendToLta, this.changedAvatar});

  static _ViewModel fromStore(Store<AppState> store) {
    var avatarOption = avatarSelector(store.state);
    return new _ViewModel(
        basket: basketSelector(store.state).value,
        player: playerSelector(store.state).value,
        loading: store.state.isLoading,
        changedAvatar: avatarOption.isPresent ? avatarOption.value : null,
        onSendToLta: (basket){
          print('basket_container.viewModel: Sending basket content to lta basket');
          store.dispatch(new SendBasketToLtaBasketAction(basket));
        },
        onRemoveFromBasket: (code) {
          print('basket_container.viewModel: Removing tournament with code $code from basket ');
               store.dispatch(new RemoveTournamentFromBasketAction(code));
        });
  }
}
