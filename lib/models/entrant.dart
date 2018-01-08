import 'package:meta/meta.dart';

class EntrantEntity {
  String name;
  int ranking;
  String rating;
  int ltaNumber;
  String status;
  EntrantEntity(
      {this.name, this.ranking, this.rating, this.ltaNumber, this.status});

  // EntrantEntity(
  //     this.name, this.ranking, this.rating, this.ltaNumber, this.status);

  @override
  int get hashCode =>
      name.hashCode ^ rating.hashCode ^ ltaNumber.hashCode ^ status.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntrantEntity &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          ranking == other.ranking &&
          rating == other.rating &&
          ltaNumber == other.ltaNumber &&
          status == other.status;

  Map<String, Object> toJson() {
    return {
      'name': name,
      'ranking': ranking,
      'rating': rating,
      'ltaNumber': ltaNumber,
      'status': status
    };
  }

  Entrant fromEntity(){return new Entrant(name: name, ranking: ranking, ltaNumber: ltaNumber, rating: rating,status: status);}
  static EntrantEntity fromJson(Map<String, Object> json) {
    return new EntrantEntity(
      name: json['name'] as String,
      ranking: json['ranking'] as int,
      rating: json['rating'] as String,
      ltaNumber: json['ltaNumber'] as int,
      status: json['status'] as String,
    );
  }
}

@immutable
class Entrant {
  const Entrant(
      {this.name, this.ranking, this.rating, this.ltaNumber, this.status});

  final String name;
  final int ranking;
  final String rating;
  final int ltaNumber;
  final String status;

  EntrantEntity toEntity(){return new EntrantEntity(name: name, ranking: ranking, ltaNumber: ltaNumber, rating: rating,status: status);}
  Entrant fromEntity(){return new Entrant(name: name, ranking: ranking, ltaNumber: ltaNumber, rating: rating,status: status);}
}
