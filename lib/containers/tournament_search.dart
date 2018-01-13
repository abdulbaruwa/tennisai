import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../models/models.dart';
import '../selectors/selectors.dart';
import '../views/tournament_search_view.dart';

class TournamentSearch extends StatelessWidget {
  TournamentSearch({Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) {
      return new _ViewModel.from(store);
    }, builder: (context, vm) {
      return new TournamentSearchView(
          tournaments: vm.tournaments);
    });
  }
}

class _ViewModel {
  final bool loading;
  final List<Tournament> tournaments;
  final Function() onItemSelected;
  final bool activeSortOrder;
  //final bool reverseSort;
  _ViewModel(
      {@required this.loading,
      @required this.tournaments,
      @required this.onItemSelected
      });

  factory _ViewModel.from(Store<AppState> store) {
    return new _ViewModel(
        // onSortSelected: () {
        //   store.dispatch(new UpdateEntrantSortOrderAction(!store.state.activeEntrantsSortOrder));
        // },
        tournaments: searchTournamentsSelector(
            store.state),
        loading: store.state.isLoading);
  }
}
