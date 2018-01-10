import 'models.dart';

class TournamentEntity {
  TournamentEntity(
      {this.name,
      this.grade,
      this.startDate,
      this.endDate,
      this.location,
      this.numberOfEntrants,
      this.organiserName,
      this.organiserEmail,
      this.organiserPhone,
      this.entryCloseDate,
      this.code,
      this.status,
      this.site,
      this.highestPlayerRating,
      this.entrants,
      this.cost});
  String name;
  String grade;
  DateTime startDate;
  DateTime endDate;
  String location;
  int numberOfEntrants;
  String organiserName;
  String organiserPhone;
  String organiserEmail;
  DateTime entryCloseDate;
  String code;
  String status;
  String site;
  double cost;
  String highestPlayerRating;

  List<EntrantEntity> entrants;

  @override
  int get hashCode =>
      name.hashCode ^
      grade.hashCode ^
      startDate.hashCode ^
      endDate.hashCode ^
      location.hashCode ^
      numberOfEntrants.hashCode ^
      organiserName.hashCode ^
      organiserEmail.hashCode ^
      organiserPhone.hashCode ^
      entryCloseDate.hashCode ^
      code.hashCode ^
      status.hashCode ^
      site.hashCode ^
      highestPlayerRating.hashCode ^
      cost.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TournamentEntity &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          grade == other.grade &&
          startDate == other.startDate &&
          location == other.location &&
          numberOfEntrants == other.numberOfEntrants &&
          organiserName == other.organiserName &&
          organiserEmail == other.organiserEmail &&
          organiserPhone == other.organiserPhone &&
          entryCloseDate == other.entryCloseDate &&
          code == other.code &&
          status == other.status &&
          highestPlayerRating == other.highestPlayerRating &&
          entrantsAreEqual(entrants, other.entrants);

  bool entrantsAreEqual(List<EntrantEntity> left, List<EntrantEntity> right) {
    // TODO: Implement this!
    return true;
  }

  Map<String, Object> toJson() {
    return {
      'name': name,
      'grade': grade,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'location': location,
      'numberOfEntrants': location,
      'organiserName': organiserName,
      'organiserEmail': organiserEmail,
      'organiserPhone': organiserPhone,
      'entryCloseDate': entryCloseDate,
      'code': code,
      'status': status,
      'highestPlayerRating': highestPlayerRating,
      'entrants': _jsonFromEntrant(entrants)
    };
  }

  dynamic _jsonFromEntrant(List<EntrantEntity> entrants) {
    var x = [];
    entrants.forEach((f) => x.add(f.toJson()));
    return x;
  }

  static List<EntrantEntity> _entrantsFromJson(dynamic json) {
    List<EntrantEntity> entrants = [];
    for (int i = 0; i < json.length; i++) {
      var entrantEntity = new EntrantEntity(
          name: json[i]['name'],
          ranking: json[i]['rankin'],
          rating: json[i]['rating'],
          ltaNumber: json[i]['ltaNumber'],
          status: json[i]['status']);
      entrants.add(entrantEntity);
    }
  }

  static TournamentEntity fromJson(Map<String, Object> json) {
    return new TournamentEntity(
        name: json['name'] as String,
        grade: json['grade'] as String,
        startDate: json['startDate'] as DateTime,
        endDate: json['endDate'] as DateTime,
        location: json['location'] as String,
        numberOfEntrants: json['numberOfEntrants'] as int,
        organiserName: json['organiserName'] as String,
        organiserEmail: json['organiserEmail'] as String,
        organiserPhone: json['organiserPhone'] as String,
        entryCloseDate: json['entryCloseDate'] as DateTime,
        code: json['code'] as String,
        status: json['status'] as String,
        highestPlayerRating: json['highestPlayerRating'] as String,
        entrants: _entrantsFromJson(json['entrants']));
  }
}

class Tournament {
  const Tournament(
      {this.name,
      this.grade,
      this.startDate,
      this.endDate,
      this.location,
      this.numberOfEntrants,
      this.organiserName,
      this.organiserEmail,
      this.organiserPhone,
      this.entryCloseDate,
      this.code,
      this.status,
      this.site,
      this.highestPlayerRating,
      this.entrants,
      this.cost});
  final String name;
  final String grade;
  final DateTime startDate;
  final DateTime endDate;
  final String location;
  final int numberOfEntrants;
  final String organiserName;
  final String organiserPhone;
  final String organiserEmail;
  final DateTime entryCloseDate;
  final String code;
  final String status;
  final String site;
  final double cost;
  final String highestPlayerRating;
  final List<Entrant> entrants;

  @override
  int get hashCode =>
      name.hashCode ^
      grade.hashCode ^
      startDate.hashCode ^
      endDate.hashCode ^
      location.hashCode ^
      numberOfEntrants.hashCode ^
      organiserName.hashCode ^
      organiserPhone.hashCode ^
      organiserEmail.hashCode ^
      entryCloseDate.hashCode ^
      code.hashCode ^
      status.hashCode ^
      site.hashCode ^
      cost.hashCode ^
      highestPlayerRating.hashCode ^
      entrants.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Tournament &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          grade == other.grade &&
          startDate == other.startDate &&
          endDate == other.endDate &&
          location == other.location &&
          numberOfEntrants == other.numberOfEntrants &&
          organiserName == other.organiserName &&
          organiserPhone == other.organiserPhone &&
          organiserEmail == other.organiserEmail &&
          entryCloseDate == other.entryCloseDate &&
          code == other.code &&
          status == other.status &&
          site == other.site &&
          cost == other.cost &&
          highestPlayerRating == other.highestPlayerRating &&
          entrants == other.entrants;

  static Tournament fromEntity(TournamentEntity entity) {
    return new Tournament(
      name: entity.name,
      grade: entity.grade,
      startDate: entity.startDate,
      endDate: entity.endDate,
      location: entity.location,
      numberOfEntrants: entity.numberOfEntrants,
      organiserName: entity.organiserName,
      organiserPhone: entity.organiserPhone,
      organiserEmail: entity.organiserEmail,
      entryCloseDate: entity.entryCloseDate,
      code: entity.code,
      status: entity.status,
      site: entity.site,
      cost: entity.cost,
      highestPlayerRating: entity.highestPlayerRating,
    );
  }

  TournamentEntity toEntity() {
    return new TournamentEntity(
        name: name,
        grade: grade,
        startDate: startDate,
        endDate: endDate,
        location: location,
        numberOfEntrants: numberOfEntrants,
        organiserName: organiserName,
        organiserPhone: organiserPhone,
        organiserEmail: organiserEmail,
        entryCloseDate: entryCloseDate,
        code: code,
        status: status,
        site: site,
        cost: cost,
        highestPlayerRating: highestPlayerRating,
        entrants: _entrantEntitys(entrants));
  }

  List<EntrantEntity> _entrantEntitys(List<Entrant> entrants) {
    List<EntrantEntity> entrantEntitys = [];
    if (entrants != null) {
      entrants.forEach((f) => entrantEntitys.add(f.toEntity()));
    }
    return entrantEntitys;
  }
}

List<Tournament> tournaments = <Tournament>[
  new Tournament(
      name: 'Sutton Super Series 1',
      location: 'Sutton Tennis Academy',
      grade: '2',
      endDate: new DateTime(2018, 7, 6),
      startDate: new DateTime(2018, 7, 9),
      site: 'www.sherbornetennis.com',
      organiserName: 'David Freeman',
      organiserPhone: '44776639393',
      organiserEmail: 'DavidFreeman@Mail.com',
      highestPlayerRating: '2.1',
      numberOfEntrants: 12,
      status: 'Accepting Entries',
      cost: 25.0,
      entrants: <Entrant>[
        const Entrant(
            name: 'Archie Duncan',
            status: 'pending',
            rating: '7.2',
            ranking: 124),
        const Entrant(
            name: 'Ben Dean', status: 'pending', rating: '5.2', ranking: 104),
        const Entrant(
            name: 'Ben Dean', status: 'pending', rating: '3.2', ranking: 12),
        const Entrant(
            name: 'Willie Nelsom',
            status: 'pending',
            rating: '1.2',
            ranking: 16),
        const Entrant(
            name: 'Marvin Ashana',
            status: 'pending',
            rating: '2.2',
            ranking: 84),
        const Entrant(
            name: 'Giva Lukman', status: 'pending', rating: '2.1', ranking: 2),
        const Entrant(
            name: 'Navas Jesus',
            status: 'pending',
            rating: '8.2',
            ranking: 1233),
        const Entrant(
            name: 'Obi Mikaiel', status: 'pending', rating: '1.2', ranking: 2),
      ]),
  new Tournament(
      name: 'Horsham Open',
      location: '',
      grade: '1',
      endDate: new DateTime(2018, 8, 6),
      startDate: new DateTime(2018, 8, 4),
      numberOfEntrants: 23,
      highestPlayerRating: '1.1',
      status: 'Accepting Entries',
      cost: 25.0,
      entrants: <Entrant>[
        const Entrant(
            name: 'Archie Duncan',
            status: 'pending',
            rating: '7.2',
            ranking: 124),
        const Entrant(
            name: 'Ben Dean', status: 'pending', rating: '5.2', ranking: 104),
        const Entrant(
            name: 'Ben Dean', status: 'pending', rating: '3.2', ranking: 12),
        const Entrant(
            name: 'Willie Nelsom',
            status: 'pending',
            rating: '1.2',
            ranking: 16),
        const Entrant(
            name: 'Marvin Ashana',
            status: 'pending',
            rating: '2.2',
            ranking: 84),
        const Entrant(
            name: 'Giva Lukman', status: 'pending', rating: '2.1', ranking: 2),
        const Entrant(
            name: 'Navas Jesus',
            status: 'pending',
            rating: '8.2',
            ranking: 1233),
        const Entrant(
            name: 'Obi Mikaiel', status: 'pending', rating: '1.2', ranking: 2),
      ]),
  new Tournament(
      name: 'Salem Cup ',
      location: '',
      grade: '1',
      endDate: new DateTime(2018, 8, 6),
      startDate: new DateTime(2018, 8, 4),
      highestPlayerRating: '2.1',
      numberOfEntrants: 12,
      status: 'Accepting Entries',
      cost: 25.0,
      entrants: const <Entrant>[
        const Entrant(
            name: 'Archie Duncan',
            status: 'pending',
            rating: '7.2',
            ranking: 124),
        const Entrant(
            name: 'Ben Dean', status: 'pending', rating: '5.2', ranking: 104),
        const Entrant(
            name: 'Ben Dean', status: 'pending', rating: '3.2', ranking: 12),
        const Entrant(
            name: 'Willie Nelsom',
            status: 'pending',
            rating: '1.2',
            ranking: 16),
        const Entrant(
            name: 'Marvin Ashana',
            status: 'pending',
            rating: '2.2',
            ranking: 84),
        const Entrant(
            name: 'Giva Lukman', status: 'pending', rating: '2.1', ranking: 2),
        const Entrant(
            name: 'Navas Jesus',
            status: 'pending',
            rating: '8.2',
            ranking: 1233),
        const Entrant(
            name: 'Obi Mikaiel', status: 'pending', rating: '1.2', ranking: 2),
      ]),
  new Tournament(
      name: 'Surrey Open Champion Ships',
      location: '2',
      grade: '1',
      endDate: new DateTime(2018, 8, 6),
      startDate: new DateTime(2018, 8, 4),
      numberOfEntrants: 18,
      highestPlayerRating: '1.1',
      status: 'Accepting Entries',
      cost: 25.0),
  new Tournament(
      name: 'Valencia Junior cup',
      location: '3',
      grade: '3',
      endDate: new DateTime(2018, 8, 6),
      startDate: new DateTime(2018, 8, 4),
      numberOfEntrants: 8,
      highestPlayerRating: '2.1',
      status: 'Accepting Entries',
      cost: 25.0,
      entrants: const <Entrant>[
        const Entrant(
            name: 'Archie Duncan',
            status: 'pending',
            rating: '7.2',
            ranking: 124),
        const Entrant(
            name: 'Ben Dean', status: 'pending', rating: '5.2', ranking: 104),
        const Entrant(
            name: 'Ben Dean', status: 'pending', rating: '3.2', ranking: 12),
        const Entrant(
            name: 'Willie Nelsom',
            status: 'pending',
            rating: '1.2',
            ranking: 16),
        const Entrant(
            name: 'Marvin Ashana',
            status: 'pending',
            rating: '2.2',
            ranking: 84),
        const Entrant(
            name: 'Giva Lukman', status: 'pending', rating: '2.1', ranking: 2),
        const Entrant(
            name: 'Navas Jesus',
            status: 'pending',
            rating: '8.2',
            ranking: 1233),
        const Entrant(
            name: 'Obi Mikaiel', status: 'pending', rating: '1.2', ranking: 2),
      ]),
  new Tournament(
      name: 'Surrey Open',
      location: '',
      grade: '4',
      endDate: new DateTime(2018, 8, 1),
      startDate: new DateTime(2018, 8, 6),
      numberOfEntrants: 7,
      highestPlayerRating: '3.2',
      status: 'Accepting Entries',
      cost: 25.0,
      entrants: const <Entrant>[
        const Entrant(
            name: 'Archie Duncan',
            status: 'pending',
            rating: '7.2',
            ranking: 124),
        const Entrant(
            name: 'Ben Dean', status: 'pending', rating: '5.2', ranking: 104),
        const Entrant(
            name: 'Ben Dean', status: 'pending', rating: '3.2', ranking: 12),
        const Entrant(
            name: 'Willie Nelsom',
            status: 'pending',
            rating: '1.2',
            ranking: 16),
        const Entrant(
            name: 'Marvin Ashana',
            status: 'pending',
            rating: '2.2',
            ranking: 84),
        const Entrant(
            name: 'Giva Lukman', status: 'pending', rating: '2.1', ranking: 2),
        const Entrant(
            name: 'Navas Jesus',
            status: 'pending',
            rating: '8.2',
            ranking: 1233),
        const Entrant(
            name: 'Obi Mikaiel', status: 'pending', rating: '1.2', ranking: 2),
      ]),
  new Tournament(
      name: 'Nike Boys U16',
      location: 'Liverpool Indoor Arena',
      grade: '2',
      endDate: new DateTime(2018, 8, 2),
      startDate: new DateTime(2018, 8, 6),
      numberOfEntrants: 44,
      highestPlayerRating: '2.2'),
  new Tournament(
      name: 'David Lloyds U18',
      location: 'Raynes Park London',
      grade: '3',
      endDate: new DateTime(2018, 8, 6),
      startDate: new DateTime(2018, 8, 4),
      numberOfEntrants: 9,
      highestPlayerRating: '3.1',
      status: 'Accepting Entries',
      cost: 25.0,
      entrants: const <Entrant>[
        const Entrant(
            name: 'Archie Duncan',
            status: 'pending',
            rating: '7.2',
            ranking: 124),
        const Entrant(
            name: 'Ben Dean', status: 'pending', rating: '5.2', ranking: 104),
        const Entrant(
            name: 'Ben Dean', status: 'pending', rating: '3.2', ranking: 12),
        const Entrant(
            name: 'Willie Nelsom',
            status: 'pending',
            rating: '1.2',
            ranking: 16),
        const Entrant(
            name: 'Marvin Ashana',
            status: 'pending',
            rating: '2.2',
            ranking: 84),
        const Entrant(
            name: 'Giva Lukman', status: 'pending', rating: '2.1', ranking: 2),
        const Entrant(
            name: 'Navas Jesus',
            status: 'pending',
            rating: '8.2',
            ranking: 1233),
        const Entrant(
            name: 'Obi Mikaiel', status: 'pending', rating: '1.2', ranking: 2),
      ]),
  new Tournament(
      name: 'Fast Four Super Series',
      location: 'Sutton Tennis Academy',
      grade: '3',
      endDate: new DateTime(2018, 8, 6),
      startDate: new DateTime(2018, 8, 4),
      numberOfEntrants: 91,
      highestPlayerRating: '4.1'),
  new Tournament(
      name: 'Kalkuta Open',
      location: 'Kalkuta India ',
      grade: '3',
      endDate: new DateTime(2018, 8, 6),
      startDate: new DateTime(2018, 8, 4),
      highestPlayerRating: '3.1',
      numberOfEntrants: 6,
      status: 'Accepting Entries',
      cost: 25.0,
      entrants: const <Entrant>[
        const Entrant(
            name: 'Archie Duncan',
            status: 'pending',
            rating: '7.2',
            ranking: 124),
        const Entrant(
            name: 'Ben Dean', status: 'pending', rating: '5.2', ranking: 104),
        const Entrant(
            name: 'Ben Dean', status: 'pending', rating: '3.2', ranking: 12),
        const Entrant(
            name: 'Willie Nelsom',
            status: 'pending',
            rating: '1.2',
            ranking: 16),
        const Entrant(
            name: 'Marvin Ashana',
            status: 'pending',
            rating: '2.2',
            ranking: 84),
        const Entrant(
            name: 'Giva Lukman', status: 'pending', rating: '2.1', ranking: 2),
        const Entrant(
            name: 'Navas Jesus',
            status: 'pending',
            rating: '8.2',
            ranking: 1233),
        const Entrant(
            name: 'Obi Mikaiel', status: 'pending', rating: '1.2', ranking: 2),
      ]),
  new Tournament(
      name: 'Compete Mens Open',
      location: 'University Of Bath',
      grade: '3',
      endDate: new DateTime(2018, 8, 4),
      startDate: new DateTime(2018, 8, 4),
      numberOfEntrants: 33,
      highestPlayerRating: '3.1',
      status: 'Accepting Entries',
      cost: 25.0,
      entrants: const <Entrant>[
        const Entrant(
            name: 'Archie Duncan',
            status: 'pending',
            rating: '7.2',
            ranking: 124),
        const Entrant(
            name: 'Ben Dean', status: 'pending', rating: '5.2', ranking: 104),
        const Entrant(
            name: 'Ben Dean', status: 'pending', rating: '3.2', ranking: 12),
        const Entrant(
            name: 'Willie Nelsom',
            status: 'pending',
            rating: '1.2',
            ranking: 16),
        const Entrant(
            name: 'Marvin Ashana',
            status: 'pending',
            rating: '2.2',
            ranking: 84),
        const Entrant(
            name: 'Giva Lukman', status: 'pending', rating: '2.1', ranking: 2),
        const Entrant(
            name: 'Navas Jesus',
            status: 'pending',
            rating: '8.2',
            ranking: 1233),
        const Entrant(
            name: 'Obi Mikaiel', status: 'pending', rating: '1.2', ranking: 2),
      ])
];
