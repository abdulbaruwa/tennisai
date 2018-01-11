import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../actions/actions.dart';
import '../models/models.dart';
import '../selectors/selectors.dart';
import '../views/tournament_details_view.dart';



class TournamentEntrants extends StatelessWidget {
  TournamentEntrants({Key key, @required this.id, @required this.source}) : super(key: key);
  final String id;
  final TournamentDetailsActionSource source;
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(converter: (Store<AppState> store) {return new _ViewModel.from(store, id, source);},
     builder: (context, vm){

      return new TournamentEntrantsView(tournament: vm.tournament);
    });
  }
}

class _ViewModel {
  final bool loading;
  final Tournament tournament;

  _ViewModel(
      {@required this.loading, @required this.tournament});

  factory _ViewModel.from(Store<AppState> store, String id, TournamentDetailsActionSource source) {
    final tournament = tournamentSelector(tournamentsSelector(store.state, source), id).value;
    return new _ViewModel(
        tournament: tournament,
        loading: store.state.isLoading);
  }
}
