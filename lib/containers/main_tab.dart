import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../models/models.dart';
import '../models/tournament.dart' as _tournament;
import '../selectors/selectors.dart';
import '../views/main_view.dart';
import '../actions/actions.dart';


class MainTab extends StatelessWidget {
  MainTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (context, vm) {
          return new MainView(player: vm.player, rankingInfos:rankingInfos, matchResultInfos: matchResultInfos
          );
        });
  }
}

class _ViewModel {
  final Player player;
  final List<RankingInfo> rankingInfos;
  final List<MatchResultInfo> matchResultInfos;
  _ViewModel({@required this.player, @required this.rankingInfos, @required this.matchResultInfos});
  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(
        player: playerSelector(store.state).value,
        rankingInfos: rankingInfosSelector(store.state),
        matchResultInfos: matchResultInfosSelector(store.state)
    );
  }
}

