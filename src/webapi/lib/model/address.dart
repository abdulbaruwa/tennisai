part of swagger.api;

class Address {
  
  String line1 = null;
  

  String line2 = null;
  

  String line3 = null;
  

  String line4 = null;
  

  String town = null;
  

  String county = null;
  

  String postCode = null;
  
  Address();

  @override
  String toString() {
    return 'Address[line1=$line1, line2=$line2, line3=$line3, line4=$line4, town=$town, county=$county, postCode=$postCode, ]';
  }

  Address.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    line1 =
        json['line1']
    ;
    line2 =
        json['line2']
    ;
    line3 =
        json['line3']
    ;
    line4 =
        json['line4']
    ;
    town =
        json['town']
    ;
    county =
        json['county']
    ;
    postCode =
        json['postCode']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'line1': line1,
      'line2': line2,
      'line3': line3,
      'line4': line4,
      'town': town,
      'county': county,
      'postCode': postCode
     };
  }

  static List<Address> listFromJson(List<dynamic> json) {
    return json == null ? new List<Address>() : json.map((value) => new Address.fromJson(value)).toList();
  }

  static Map<String, Address> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Address>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new Address.fromJson(value));
    }
    return map;
  }
}

