import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../models/models.dart';
import '../selectors/selectors.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Text('Dayo Baruwa');
  }
}

class _ViewModel {
  final bool loading;
  final List<Tournament> enteredTournaments;
  final List<Tournament> watchedTournaments;

  _ViewModel(
      {@required this.loading, @required this.enteredTournaments, @required this.watchedTournaments});

  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(
        enteredTournaments: enteredTournamentSelector(store.state),
        watchedTournaments: watchedTournamentSelector(store.state),
        loading: store.state.isLoading);
  }
}
