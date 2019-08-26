import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:swagger/api.dart';
import '../models/models.dart';
import '../selectors/selectors.dart';
import '../views/tournament_search_view.dart';
import '../actions/actions.dart';

class TournamentSearch extends StatelessWidget {
  TournamentSearch({Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) {
      return new _ViewModel.from(store);
    }, builder: (context, vm) {
      return new TournamentSearchView(tournaments: vm.tournaments, onSearchPreferenceChanged: vm.onSearchPreferenceChanged, searchPreference: vm.searchPreference);
    });
  }
}

class _ViewModel {
  final bool loading;
  final List<Tournament> tournaments;
  final Function(SearchPreference) onSearchPreferenceChanged;
  final SearchPreference searchPreference;
  final bool activeSortOrder;
  _ViewModel(
      {@required this.loading,
      @required this.tournaments,
      @required this.onSearchPreferenceChanged,
      @required this.searchPreference,
      this.activeSortOrder
      });

  factory _ViewModel.from(Store<AppState> store) {
    return new _ViewModel(
        tournaments: searchTournamentsSelector(store.state),
        loading: store.state.isLoading,
        searchPreference: activeSearchPreferenceSelector(store.state).first,
        onSearchPreferenceChanged: (searchPreference){
          print(searchPreference.toString());
          store.dispatch(new SearchTournamentWithPreferenceAction(searchPreference));
        });
  }
}
