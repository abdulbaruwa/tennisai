import 'package:redux/redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tennisai/main.dart';
import 'package:tennisai/models/app_state.dart';
import 'package:tennisai/models/models.dart';
import 'package:tennisai/reducers/app_state_reducer.dart';
import 'package:tennisai/actions/actions.dart';
import 'package:tennisai/models/app_tab.dart';


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
   
  });
}
