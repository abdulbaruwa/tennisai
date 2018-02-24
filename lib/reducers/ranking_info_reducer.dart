import 'package:redux/redux.dart';
import '../models/models.dart';
import '../actions/actions.dart';

final rankingInfoReducer = combineTypedReducers<List<RankingInfo>>([
  new ReducerBinding<List<RankingInfo>, RankingInfoLoadedAction>(_setLoadedRankingInfos),
  new ReducerBinding<List<RankingInfo>, RankingInfoNotLoadedAction>(_setNoRankingInfos)
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

