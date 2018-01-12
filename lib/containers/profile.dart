import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../models/models.dart';
import '../selectors/selectors.dart';
import '../views/profile_view.dart';

class Profile extends StatelessWidget {
  Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (context, vm) {
          return new ProfileView(player: vm.player);
        });
  }
}

class _ViewModel {
  final bool loading;
  final Player player;

  _ViewModel({@required this.loading, @required this.player});

  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(
        player: playerSelector(store.state).value, loading: store.state.isLoading);
  }
}
