import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../models/models.dart';
import '../selectors/selectors.dart';
import '../views/dashboard_view.dart';
import '../actions/actions.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (context, vm) {
          return new DashboardView(
            enteredTournaments: vm.enteredTournaments,
            watchedTournaments: vm.watchedTournaments,
            onRemoveFromWatchList: vm.onRemoveFromWatchList,
          );
        });
  }
}

class _ViewModel {
  final bool loading;
  final List<Tournament> enteredTournaments;
  final List<Tournament> watchedTournaments;
  final Function(Tournament) onRemoveFromWatchList;
  _ViewModel(
      {@required this.loading,
      @required this.enteredTournaments,
      @required this.watchedTournaments,
      this.onRemoveFromWatchList});

  static _ViewModel fromStore(Store<AppState> store) {
    var entered = enteredTournamentSelector(store.state);
    var watching = watchedTournamentSelector(store.state);
    print('DashboardContainer: entered items ${entered.length}');
    print('DashboardContainer: watching items ${watching.length}');

    return new _ViewModel(
        enteredTournaments: upcomingTournamentSelector(store.state),
        watchedTournaments: watchedTournamentSelector(store.state),
        loading: store.state.isLoading,
        onRemoveFromWatchList: (tournament) {
          print(
              'dasboard.viewModel: Removing tournament with code ${tournament.code} from Watch list ');
               store.dispatch(new RemoveFromWatchedTournamentsAction(tournament.code));
        });
  }
}
