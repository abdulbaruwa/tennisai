import 'package:redux/redux.dart';
import '../models/models.dart';
import '../actions/actions.dart';

final tabsReducer = combineTypedReducers<AppTab>([
  new ReducerBinding<AppTab, UpdateTabAction>(_activeTabReducer),
]);

AppTab _activeTabReducer(AppTab activeTab, UpdateTabAction action) {
  return action.newTab;
}
