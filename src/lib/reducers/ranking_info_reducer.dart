import 'package:redux/redux.dart';
import 'package:swagger/api.dart';
import '../actions/actions.dart';

final rankingInfoReducer = combineReducers<List<RankingInfo>>([
  new TypedReducer<List<RankingInfo>, RankingInfoLoadedAction>(_setLoadedRankingInfos),
  new TypedReducer<List<RankingInfo>, RankingInfoNotLoadedAction>(_setNoRankingInfos)
]);

List<RankingInfo> _setLoadedRankingInfos(
    List<RankingInfo> rankingInfos,
    RankingInfoLoadedAction action) {
    return action.rankingInfos;
  //return [];
}

List<RankingInfo> _setNoRankingInfos(List<RankingInfo> watchedTournaments,
    RankingInfoNotLoadedAction action) {
  return [];
}

