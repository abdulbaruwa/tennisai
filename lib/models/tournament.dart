import 'package:uuid/uuid.dart';
import 'models.dart';

class TournamentEntity {
  TournamentEntity(
      {this.name,
      this.grade,
      this.startDate,
      this.endDate,
      this.location,
      this.address,
      this.town,
      this.county,
      this.postCode,
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
  int startDate;
  int endDate;
  String location;
  String address;
  String town;
  String county;
  String postCode;
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
      address.hashCode ^
      town.hashCode ^
      county.hashCode ^
      postCode.hashCode ^
      numberOfEntrants.hashCode ^
      organiserName.hashCode ^
      organiserEmail.hashCode ^
      organiserPhone.hashCode ^
      entryCloseDate.hashCode ^
      code.hashCode ^
      cost.hashCode ^
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
          address == other.address &&
          town == other.town &&
          county == other.county &&
          postCode == other.postCode &&
          numberOfEntrants == other.numberOfEntrants &&
          organiserName == other.organiserName &&
          organiserEmail == other.organiserEmail &&
          organiserPhone == other.organiserPhone &&
          entryCloseDate == other.entryCloseDate &&
          code == other.code &&
          cost == other.cost &&
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
      'startDate': startDate,
      'endDate': endDate,
      'location': location,
      'address': address,
      'town': town,
      'county': county,
      'postCode': postCode,
      'numberOfEntrants': numberOfEntrants,
      'organiserName': organiserName,
      'organiserEmail': organiserEmail,
      'organiserPhone': organiserPhone,
      'entryCloseDate': entryCloseDate,
      'code': code,
      'cost': cost,
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
          ranking: json[i]['ranking'],
          rating: json[i]['rating'],
          ltaNumber: json[i]['ltaNumber'],
          status: json[i]['status']);
      entrants.add(entrantEntity);
    }
    return entrants;
  }

  static TournamentEntity fromJson(Map<String, Object> json) {
    return new TournamentEntity(
        name: json['name'] as String,
        grade: json['grade'] as String,
        startDate: json['startDate'] as int,
        endDate: json['endDate'] as int,
        location: json['location'] as String,
        address : json['address'] as String,
        town: json['town'] as String,
        county : json['county'] as String,
        postCode: json['postCode'] as String,
        numberOfEntrants: json['numberOfEntrants'] as int,
        organiserName: json['organiserName'] as String,
        organiserEmail: json['organiserEmail'] as String,
        organiserPhone: json['organiserPhone'] as String,
        entryCloseDate: json['entryCloseDate'] as DateTime,
        code: json['code'] as String,
        cost: json['cost'] as double,
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
      this.address,
      this.town,
      this.county,
      this.postCode,
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
  final String address;
  final String county;
  final String town;
  final String postCode;
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
      address.hashCode ^
      town.hashCode ^
      county.hashCode ^
      postCode.hashCode ^
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
          address == other.address &&
          town == other.town &&
          county == other.county &&
          postCode == other.postCode &&
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
      startDate: new DateTime.fromMillisecondsSinceEpoch(entity.startDate),
      endDate: new DateTime.fromMillisecondsSinceEpoch(entity.endDate),
      location: entity.location,
      address: entity.address,
      town: entity.town,
      county: entity.county,
      postCode: entity.postCode,
      numberOfEntrants: entity.numberOfEntrants,
      organiserName: entity.organiserName,
      organiserPhone: entity.organiserPhone,
      organiserEmail: entity.organiserEmail,
      entryCloseDate: entity.entryCloseDate,
      code: entity.code,
      cost: entity.cost,
      status: entity.status,
      site: entity.site,
      highestPlayerRating: entity.highestPlayerRating,
      entrants: _entrants(entity.entrants)
    );
  }

  TournamentEntity toEntity() {
    return new TournamentEntity(
        name: name,
        grade: grade,
        startDate: startDate.millisecondsSinceEpoch,
        endDate: endDate.millisecondsSinceEpoch,
        location: location,
        address: address,
        town: town,
        county: county,
        postCode: postCode,
        numberOfEntrants: numberOfEntrants,
        organiserName: organiserName,
        organiserPhone: organiserPhone,
        organiserEmail: organiserEmail,
        entryCloseDate: entryCloseDate,
        code: code,
        cost: cost,
        status: status,
        site: site,
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

  static List<Entrant> _entrants(List<EntrantEntity> entrantEntitys) {
    List<Entrant> entrants = [];
    if (entrantEntitys != null) {
      entrantEntitys.forEach((f) => entrants.add(f.fromEntity()));
    }
    return entrants;
  }
}

String getRandomString = new Uuid().v4().toString().substring(0,8);
List<Tournament> watchedTournaments = <Tournament>[
    
  new Tournament(
      name: 'Sutton Super Series 1',
      location: 'Sutton Tennis Academy',
      address: 'Redham Street',
      town: 'Sutton',
      county: 'Surrey',
      postCode: 'KT17 9EL',
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
      code: new Uuid().v4().toString().substring(0,8), cost:  25.0,
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
      ])];
List<Tournament> tournaments = <Tournament>[
    
  new Tournament(
      name: 'Sutton Super Series 1',
      location: 'Sutton Tennis Academy',
      address: 'Redham Street',
      town: 'Sutton',
      county: 'Surrey',
      postCode: 'KT17 9EL',
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
      code: new Uuid().v4().toString().substring(0,8), cost:  25.0,
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
      location: 'Horsham Tennis Center',
      address: '25 Kettring Road',
      town: 'Horsham',
      county: 'Hampshire',
      postCode: 'GU17 8Rs',
      grade: '1',
      endDate: new DateTime(2018, 8, 6),
      startDate: new DateTime(2018, 8, 4),
      numberOfEntrants: 23,
      highestPlayerRating: '1.1',
      status: 'Accepting Entries',
      code: new Uuid().v4().toString().substring(0,8),  cost:  25.0,
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
      location: 'Salem',
      address: '9 Winston Street',
      town: 'Wilsdean Green',
      county: 'London',
      postCode: 'N17 7UE',
      grade: '1',
      endDate: new DateTime(2018, 8, 6),
      startDate: new DateTime(2018, 8, 4),
      highestPlayerRating: '2.1',
      numberOfEntrants: 12,
      status: 'Accepting Entries',
      code: new Uuid().v4().toString().substring(0,8),  cost:25.0,
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
      address: '2 Cheam Street',
      town: 'Cheam',
      county: 'Surrey',
      postCode: 'KT8 9LU',
      grade: '1',
      endDate: new DateTime(2018, 8, 6),
      startDate: new DateTime(2018, 8, 4),
      numberOfEntrants: 18,
      highestPlayerRating: '1.1',
      status: 'Accepting Entries',
      code: new Uuid().v4().toString().substring(0,8),  cost:  25.0),
  new Tournament(
      name: 'Valencia Junior cup',
      location: '3',
      address: '2 Petxina',
      town: 'Valencia',
      county: 'Sila',
      postCode: '83833',
      grade: '3',
      endDate: new DateTime(2018, 8, 6),
      startDate: new DateTime(2018, 8, 4),
      numberOfEntrants: 8,
      highestPlayerRating: '2.1',
      status: 'Accepting Entries',
      code: new Uuid().v4().toString().substring(0,8),  cost:  25.0,
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
      location: 'National Tennis Center',
      address: '2 Nates Park Road',
      town: 'Roehampton',
      county: 'Kingston',
      postCode: 'LH8 9DE',
      grade: '4',
      endDate: new DateTime(2018, 8, 1),
      startDate: new DateTime(2018, 8, 6),
      numberOfEntrants: 7,
      highestPlayerRating: '3.2',
      status: 'Accepting Entries',
      code: new Uuid().v4().toString().substring(0,8),  cost:  25.0,
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
      address: 'Bales Avenue',
      town: 'Liverpool',
      county: 'Mersey Side',
      postCode: 'LV98 1LD',
      grade: '2',
      endDate: new DateTime(2018, 8, 2),
      startDate: new DateTime(2018, 8, 6),
      numberOfEntrants: 44,
      highestPlayerRating: '2.2'),
  new Tournament(
      name: 'David Lloyds U18',
      location: 'Raynes Park London',
      address: '3 Lloyds Road',
      town: 'Raynes Park',
      county: 'Surrey',
      postCode: 'KT15 8DD',
      grade: '3',
      endDate: new DateTime(2018, 8, 6),
      startDate: new DateTime(2018, 8, 4),
      numberOfEntrants: 9,
      highestPlayerRating: '3.1',
      status: 'Accepting Entries',
      code: new Uuid().v4().toString().substring(0,8),  cost:  25.0,
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
      address: '7 Will Smit Street',
      town: 'Sutton',
      county: 'Surrey',
      postCode: 'KT38 3DM',
      grade: '3',
      endDate: new DateTime(2018, 8, 6),
      startDate: new DateTime(2018, 8, 4),
      numberOfEntrants: 91,
      highestPlayerRating: '4.1'),
  new Tournament(
      name: 'Kalkuta Open',
      location: 'Kalkuta India ',
      address: '3 Chuhala Road',
      town: 'Chenai',
      county: 'Chenai Main',
      postCode: 'ZZ303',
      grade: '3',
      endDate: new DateTime(2018, 8, 6),
      startDate: new DateTime(2018, 8, 4),
      highestPlayerRating: '3.1',
      numberOfEntrants: 6,
      status: 'Accepting Entries',
      code: new Uuid().v4().toString().substring(0,8),  cost:  25.0,
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
      address: '3 Bath Road',
      town: 'Bath',
      county: 'Bath',
      postCode: 'BU99 3PA',
      grade: '3',
      endDate: new DateTime(2018, 8, 4),
      startDate: new DateTime(2018, 8, 4),
      numberOfEntrants: 33,
      highestPlayerRating: '3.1',
      status: 'Accepting Entries',
      code: new Uuid().v4().toString().substring(0,8),  cost:  25.0,
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
