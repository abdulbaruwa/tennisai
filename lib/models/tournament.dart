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
      this.statusIndex,
      this.site,
      this.highestPlayerRating,
      this.entrants,
      this.cost});
  String name;
  int grade;
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
  int entryCloseDate;
  String code;
  String status;
  int statusIndex;
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
      statusIndex.hashCode ^
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
          statusIndex == other.statusIndex &&
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
      'statusIndex': statusIndex,
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
    if(json == null)return entrants;
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
        grade: json['grade'] as int,
        startDate: json['startDate'] as int,
        endDate:   json['endDate']   as int,
        location: json['location'] as String,
        address : json['address'] as String,
        town: json['town'] as String,
        county : json['county'] as String,
        postCode: json['postCode'] as String,
        numberOfEntrants: json['numberOfEntrants'] as int,
        organiserName: json['organiserName'] as String,
        organiserEmail: json['organiserEmail'] as String,
        organiserPhone: json['organiserPhone'] as String,
        entryCloseDate: json['entryCloseDate'] as int,
        code: json['code'] as String,
        cost: json['cost'] as double,
        status: json['status'] as String,
        statusIndex: json['statusIndex'] as int,
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
      this.statusIndex,
      this.site,
      this.highestPlayerRating,
      this.entrants,
      this.cost});
  final String name;
  final int grade;
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
  final int statusIndex;
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
      statusIndex.hashCode ^
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
          statusIndex == other.statusIndex &&
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
      entryCloseDate:  entity.entryCloseDate == null ? null : new DateTime.fromMillisecondsSinceEpoch(entity.entryCloseDate),
      code: entity.code,
      cost: entity.cost,
      status: entity.status,
      statusIndex: entity.statusIndex,
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
        entryCloseDate: entryCloseDate?.millisecondsSinceEpoch,
        code: code,
        cost: cost,
        status: status,
        statusIndex: statusIndex,
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