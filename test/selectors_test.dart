import 'package:quiver/core.dart';
import 'package:tennisai/models/models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tennisai/selectors/selectors.dart';

main() {
  group('selectors', () {
    test(
        'should return the watched tournaments if TournamentDetailsActionSource is watched',
        () {
      final enteredTournaments = [
        new Tournament(name: 'T1', code: '1'),
        new Tournament(name: 'T2', code: '2'),
        new Tournament(name: 'T3', code: '3'),
        new Tournament(name: 'T4', code: '4'),
      ];

      final watchedTournaments = [
        new Tournament(name: 'TW1', code: '1w'),
        new Tournament(name: 'TW2', code: '2w'),
      ];

      AppState appState = new AppState(
          enteredTournaments: enteredTournaments,
          watchedTournaments: watchedTournaments);

      expect(
          tournamentsSelector(appState, TournamentDetailsActionSource.watching),
          watchedTournaments);
    });

    test('should return a tournament if valid tournament code is provided', () {
        final tournament1 =  new Tournament(name: 'T1', code: '1');
        final tournament2 =  new Tournament(name: 'T2', code: '2');
        final tournament3 =  new Tournament(name: 'T3', code: '3');
        final tournament4 =  new Tournament(name: 'T4', code: '4');

      final tournaments = [tournament1, tournament2, tournament3, tournament4];
      expect(tournamentSelector(tournaments, '3').value, tournament3);
    });

//    test('', (){});

   test('should return entrants sorted by ranking if sortOrder is set', (){
     final entrants = [
       new Entrant(name: '', ranking: 3),
       new Entrant(name: '', ranking: 1,),
       new Entrant(name: '', ranking: 4),
       new Entrant(name: '', ranking: 2),
       new Entrant(name: '', ranking: 5),
       ];
       final tournament = new Tournament(code: '1', entrants: entrants);

       final result = tournamentEntrantsSelector(tournament, true);
       expect(result[0].ranking,5);
       expect(result[1].ranking,4);
       expect(result[2].ranking,3);
       expect(result[3].ranking,2);
       expect(result[4].ranking,1);
   });
  });
}
