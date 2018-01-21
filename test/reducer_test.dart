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

    test('should add tournament to watched list in response to a AddToWatchListAction',(){
      final tournament = new Tournament(code: '101', name: 'Test Tournament');
      final store = new Store<AppState>(appReducer,initialState: new AppState(watchedTournaments: [tournament]));

      expect(watchedTournamentSelector(store.state), [tournament]);
      final newTournament = new Tournament(code: '10204', name: 'Second Test Tournament');

      store.dispatch(new AddWatchedTournamentsAction(newTournament));

      expect(watchedTournamentSelector(store.state), [tournament, newTournament]);
    });


    test('should not add tournament to watched list if AddToWatchListAction is called for existing Wathched tournament',(){
      final tournament = new Tournament(code: '101', name: 'Test Tournament');
      final store = new Store<AppState>(appReducer,initialState: new AppState(watchedTournaments: [tournament]));

      store.dispatch(new AddWatchedTournamentsAction(tournament));

      expect(watchedTournamentSelector(store.state), [tournament]);
    });
            
    test('place holder test in', () {
      var answer = 42;
      expect(answer, 42);
    });


  });
}
