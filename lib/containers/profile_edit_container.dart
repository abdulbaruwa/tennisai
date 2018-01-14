import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../models/models.dart';
import '../views/profile_edit_view.dart';
import '../actions/actions.dart';

class ProfileEditContainer extends StatelessWidget {
  final Player player;
  final SearchPreference searchPreference;
  ProfileEditContainer({Key key, this.player, this.searchPreference})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, OnPlayerProfileSaveCallback>(
        converter: (Store<AppState> store) {
      return (player, searchPref) {
        store.dispatch(new UpdatePlayerProfileAndSearchPreferenceAction(
            player: player, searchPreference: searchPref));
      };
    }, builder: (BuildContext context, OnPlayerProfileSaveCallback onSave) {
      return new ProfileEditView(player: player, searchPreference: searchPreference, onSave: onSave);
    });
  }
}
