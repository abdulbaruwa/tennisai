import 'package:redux/redux.dart';
import '../actions/actions.dart';

final entrantsSortReducer = combineTypedReducers<bool>([
  new ReducerBinding<bool, UpdateEntrantSortOrderAction>(
      _entrantSortActionReducer),
]);

bool _entrantSortActionReducer(
    bool activeFilter, UpdateEntrantSortOrderAction action) {
  return action.order;
}
