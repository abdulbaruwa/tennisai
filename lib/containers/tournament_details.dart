import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../actions/actions.dart';
import '../models/models.dart';
import '../selectors/selectors.dart';
import '../views/tournament_details_view.dart';

class TournamentDetailsWithTickerState extends State<TournamentDetails> with TickerProviderStateMixin{
  AnimationController _controller;
 @override
  void initState() {
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
      //ignoreChange: (state) => tournamentSelector(state.tournaments, id, source).isNotPresent,
      converter: (Store<AppState> store) {
        return new _ViewModel.from(store, widget.id, widget.source);
      },
      builder: (context, vm) {
        return new TournamentDetailsView(
          tournament: vm.tournament, controller:_controller,
        );
      },
    );
  }
}

class TournamentDetails extends StatefulWidget {
   final String id;
   
  final TournamentDetailsActionSource source;
   const TournamentDetails({Key key, @required this.id, @required this.source}): super(key:key);
  final Tournament tournament;
  @override
  TournamentDetailsWithTickerState createState() => new TournamentDetailsWithTickerState();
}

class _ViewModel {
  final Tournament tournament;
  final Function onDelete;
  final Function(bool) toggleCompleted;

  _ViewModel({
    @required this.tournament,
    // @required this.onDelete,
    // @required this.toggleCompleted,
  });

  factory _ViewModel.from(Store<AppState> store, String id, TournamentDetailsActionSource source) {
    final tournament = tournamentSelector(tournamentsSelector(store.state, source), id).value;

    return new _ViewModel(
      tournament: tournament,
      //onWatchUnWatch: () => store.dispatch(new DeleteTodoAction(todo.id)),
      // toggleCompleted: (isComplete) {
      //   store.dispatch(new UpdateTodoAction(
      //     todo.id,
      //     todo.copyWith(complete: isComplete),
      //   ));
      // },
    );
  }
}
