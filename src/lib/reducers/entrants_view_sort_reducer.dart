import 'package:redux/redux.dart';
import '../actions/actions.dart';

final entrantsSortReducer = combineReducers<bool>([
  new TypedReducer<bool, UpdateEntrantSortOrderAction>(
      _entrantSortActionReducer),
]);

bool _entrantSortActionReducer(
    bool activeFilter, UpdateEntrantSortOrderAction action) {
  return action.order;
}
