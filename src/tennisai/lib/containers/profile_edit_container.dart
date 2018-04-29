import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'dart:io';

import '../models/models.dart';
import '../views/profile_edit_view.dart';
import '../actions/actions.dart';
import '../selectors/selectors.dart';

class ProfileEditContainer extends StatelessWidget {
  ProfileEditContainer({Key key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return new StoreConnector<AppState, OnPlayerProfileSaveCallback>(
  //       converter: (Store<AppState> store) {
  //     return (player, searchPre) {
  //       store.dispatch(new UpdatePlayerProfileAndSearchPreferenceAction(player: player, searchPreference: searchPre));
  //     };
  //   }, builder: (BuildContext context, OnPlayerProfileSaveCallback onSave) {
  //     return new ProfileEditView(player: player, searchPreference: searchPreference, onSave: onSave);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (context, vm) {
          return new ProfileEditView(
              player: vm.player,
              searchPreference: vm.searchPreference,
              onChangeImage: vm.onImageChanged,
              changedAvatar: vm.changedAvatar,
              onSave: vm.onSave);
        });
  }
}

class _ViewModel {
  final bool loading;
  final SearchPreference searchPreference;
  final Player player;
  final File changedAvatar;
  final Function(File) onImageChanged;
  final Function(Player player, SearchPreference searchPreference, File avatar) onSave;

  _ViewModel(
      {@required this.loading,
      @required this.searchPreference,
      @required this.player,
      this.changedAvatar,
      this.onImageChanged,
      this.onSave});

  static _ViewModel fromStore(Store<AppState> store) {
    var avatarOption = avatarSelector(store.state);
    return new _ViewModel(
        searchPreference: searchPreferenceSelector(store.state).value,
        player: playerSelector(store.state).value,
        loading: store.state.isLoading,
        changedAvatar: avatarOption.isPresent ? avatarOption.value : null,
        onImageChanged: (file) {
          print('profile_edit_container.viewModel: changed image to file at pat ${file.path} ');
          store.dispatch(new ChangedAvatarAction(file));
          //store.dispatch(new RemoveTournamentFromBasketAction(file));
        },
        onSave: (player, searchPreference, avatar){
          print('profile_edit_container.viewModel: onSave');
          store.dispatch(new UpdatePlayerProfileAndSearchPreferenceAction(player: player, searchPreference: searchPreference));
        });
  }
}
