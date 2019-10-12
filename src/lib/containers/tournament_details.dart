import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:swagger/api.dart';
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
          tournament: vm.tournament, source: vm.source, onAddToWatch: vm.onAddToWatch, onAddToBasket: vm.onAddToBasket, controller:_controller,
        );
      },
    );
  }
}

class TournamentDetails extends StatefulWidget {
   final String id;
   
  final TournamentDetailsActionSource source;
   const TournamentDetails({Key key, @required this.id, @required this.source}): super(key:key);
  //final Tournament tournament;
  @override
  TournamentDetailsWithTickerState createState() => new TournamentDetailsWithTickerState();
}

class _ViewModel {
  final TournamentInfo tournament;
  final TournamentDetailsActionSource source;
  // final Function(bool) toggleCompleted;
  final Function onAddToWatch;
  final Function onAddToBasket;
  _ViewModel({
    @required this.tournament,
    @required this.onAddToWatch,
    @required this.onAddToBasket,
    this.source
    // @required this.onDelete,
    // @required this.toggleCompleted,
  });

  factory _ViewModel.from(Store<AppState> store, String id, TournamentDetailsActionSource source) {
    print('tournament_details: _ViewModel factory $source tournamentId: $id' );
    final tournament = tournamentSelector(tournamentsSelector(store.state, source), id).value;
    
    return new _ViewModel(
      tournament: tournament,
      source: source,
      onAddToWatch: () { 
            print('Adding tournament with code: ${tournament.code} to watchlist');
            store.dispatch(new AddWatchedTournamentsAction(TournamentInfo.fromJson(tournament.toJson())));
      },
      onAddToBasket: () { 
            print('Adding tournament with code: ${tournament.code} to basket');
            var playerId = playerSelector(store.state).first?.id;
            store.dispatch(new AddTournamentToBasketAction(tournament, playerId));
      } 
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
