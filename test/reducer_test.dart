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
        initialState: new AppState(activeTab: AppTab.upcoming),
      );

      store.dispatch(new UpdateTabAction(AppTab.search));

      expect(store.state.activeTab, AppTab.search);
    });

    test(
        'should remove from watched list in response to a RemoveFromWatchListAction',
        () {
      final tournament = new Tournament(code: '101', name: 'Test Tournament');
      final store = new Store<AppState>(appReducer,
          initialState: new AppState(watchedTournaments: [tournament]));

      expect(watchedTournamentSelector(store.state), [tournament]);
      store.dispatch(new RemoveFromWatchedTournamentsAction(tournament.code));

      expect(watchedTournamentSelector(store.state), []);
    });

    test(
        'should add tournament to watched list in response to a AddToWatchListAction',
        () {
      final tournament = new Tournament(code: '101', name: 'Test Tournament');
      final store = new Store<AppState>(appReducer,
          initialState: new AppState(watchedTournaments: [tournament]));

      expect(watchedTournamentSelector(store.state), [tournament]);
      final newTournament =
          new Tournament(code: '10204', name: 'Second Test Tournament');

      store.dispatch(new AddWatchedTournamentsAction(newTournament));

      expect(
          watchedTournamentSelector(store.state), [tournament, newTournament]);
    });

    test(
        'should not add tournament to watched list if AddToWatchListAction is called for existing Wathched tournament',
        () {
      final tournament = new Tournament(code: '101', name: 'Test Tournament');
      final store = new Store<AppState>(appReducer,
          initialState: new AppState(watchedTournaments: [tournament]));

      store.dispatch(new AddWatchedTournamentsAction(tournament));

      expect(watchedTournamentSelector(store.state), [tournament]);
    });

    // Basket Actions
    test(
        'should add tournament to basket in response to a AddTournamentToBasketAction',
        () {
      final tournament =
          new Tournament(code: '101', cost: 22.9, name: 'Test Tournament');
      final basket =
          new Basket(basketItems: [], ltaNumber: 11111111, totalCost: 0.0);

      // Create initial basket state with empty items
      final store = new Store<AppState>(appReducer,
          initialState: new AppState(basket: [basket]));

      store.dispatch(new AddTournamentToBasketAction(tournament));
      var storeBasket = basketSelector(store.state).value;

      expect(storeBasket.basketItems.length, 1);
      expect(storeBasket.totalCost, 22.9);
    });

    test(
        'should remove tournament from basket in response to a RemoveTournamentFromBasketAction',
        () {
      final tournament =
          new Tournament(code: '101', cost: 22.9, name: 'Test Tournament');
      final basket =
          new Basket(basketItems: [], ltaNumber: 11111111, totalCost: 0.0);

      // Create initial basket state with empty items
      final store = new Store<AppState>(appReducer,
          initialState: new AppState(basket: [basket]));
      store.dispatch(new AddTournamentToBasketAction(tournament));

      expect(basketSelector(store.state).value.totalCost, 22.9);

      store.dispatch(new RemoveTournamentFromBasketAction(tournament.code));

      expect(basketSelector(store.state).value.basketItems, []);
      expect(basketSelector(store.state).value.totalCost, 0.0);
    });
  });
}
