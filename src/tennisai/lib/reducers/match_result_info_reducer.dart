import 'package:redux/redux.dart';
import '../models/models.dart';
import '../actions/actions.dart';

final matchResultInfoReducer = combineReducers<List<MatchResultInfo>>([
  new TypedReducer<List<MatchResultInfo>, MatchResultInfoLoadedAction>(_setLoadedMatchResultInfos),
  new TypedReducer<List<MatchResultInfo>, MatchResultInfoNotLoadedAction>(_setNoMatchInfos)
]);

List<MatchResultInfo> _setLoadedMatchResultInfos(
    List<MatchResultInfo> rankingInfos,
    MatchResultInfoLoadedAction action) {
    return action.matchResultInfos;
}

List<MatchResultInfo> _setNoMatchInfos(List<MatchResultInfo> matchResults,
    MatchResultInfoNotLoadedAction action) {
  return [];
}

