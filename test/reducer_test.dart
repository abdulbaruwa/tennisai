import 'package:redux/redux.dart';
import 'package:quiver/core.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:tennisai/main.dart';
import 'package:tennisai/models/app_state.dart';
import 'package:tennisai/models/models.dart';
import 'package:tennisai/reducers/app_state_reducer.dart';
import 'package:tennisai/actions/actions.dart';
import 'package:tennisai/models/app_tab.dart';
import 'package:tennisai/selectors/selectors.dart';

main() {
  group('State Reducer', () {
    test('should update the AppTab', () {
      final store = new Store<AppState>(
        appReducer,
        initialState: new AppState(activeTab: AppTab.dashboard),
      );

      store.dispatch(new UpdateTabAction(AppTab.search));

      expect(store.state.activeTab, AppTab.search);
    });

    test('should remove from watched list in response to a RemoveFromWatchListAction',(){
      final tournament = new Tournament(code: '101', name: 'Test Tournament');
      final store = new Store<AppState>(appReducer,initialState: new AppState(watchedTournaments: [tournament]));

      expect(watchedTournamentSelector(store.state), [tournament]);
      store.dispatch(new RemoveFromWatchedTournamentsAction(tournament.code));

      expect(watchedTournamentSelector(store.state), []);
    });
    test('place holder test in', () {
      var answer = 42;
      expect(answer, 42);
    });
  });
}
