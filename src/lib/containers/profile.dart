import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../actions/actions.dart';
import '../models/models.dart';
import '../selectors/selectors.dart';
import '../views/profile_view.dart';
import '../containers/auth.dart' as authenticate;

class Profile extends StatelessWidget {
  Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (context, vm) {
          return new ProfileView(player: vm.player, searchPreference: vm.searchPreference, changedAvatar: vm.changedAvatar, logOut: vm.onLogOut,);
        });
  }
}

class _ViewModel {
  final bool loading;
  final Player player;
  final File changedAvatar;
  final SearchPreference searchPreference;
  final Function onLogOut;

  _ViewModel(
      {@required this.loading, @required this.player, this.searchPreference, this.changedAvatar, this.onLogOut});

  static _ViewModel fromStore(Store<AppState> store) {
    var avatarOption = avatarSelector(store.state);
    return new _ViewModel(
        player: playerSelector(store.state).value,
        loading: store.state.isLoading,
        changedAvatar: avatarOption.isPresent ? avatarOption.value : null,
        searchPreference: searchPreferenceSelector(store.state).value,
        onLogOut: ()async {
          print('Logging out');
          if(authenticate.googleSignIn != null)
          {
            print('De-authenticating with Google');
            await authenticate.googleSignIn.disconnect();
            store.dispatch(new SignedOutAction());
            print('De-authentication complete');
          }

        });
        
  }
}
