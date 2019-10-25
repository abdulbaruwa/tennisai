enum DismissDialogAction {
  cancel,
  discard,
  save,
}

enum AuthMethod {unknown, email, google}

enum TournamentDetailsActionSource { watching, upcoming, search }

enum PlayerRegistrationStatus { unknown, registered, unregistered }

enum Gender { male, female }

const List<String> AgeGroups = ['Under12', 'Under16', 'Under18', 'Adult'];

const List<int> Grades = [1, 2, 3, 4, 5, 6];

const List<String> TournamentStatusTypes = ['Upcoming',  'AcceptingEntries',  'ClosedForEntries',  'WithdrawalDatePassed',  'InProgress',  'PendingResults',  'ResultsAvailable'];

enum TournamentStatus {
  Upcoming,
  AcceptingEntries,
  ClosedForEntries,
  WithdrawalDatePassed,
  InProgress,
  PendingResults,
  ResultsAvailable
}
