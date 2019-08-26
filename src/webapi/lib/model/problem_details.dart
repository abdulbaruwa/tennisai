part of swagger.api;

class ProblemDetails {
  
  String type = null;
  

  String title = null;
  

  int status = null;
  

  String detail = null;
  

  String instance = null;
  
  ProblemDetails();

  @override
  String toString() {
    return 'ProblemDetails[type=$type, title=$title, status=$status, detail=$detail, instance=$instance, ]';
  }

  ProblemDetails.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    type =
        json['type']
    ;
    title =
        json['title']
    ;
    status =
        json['status']
    ;
    detail =
        json['detail']
    ;
    instance =
        json['instance']
    ;
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'title': title,
      'status': status,
      'detail': detail,
      'instance': instance
     };
  }

  static List<ProblemDetails> listFromJson(List<dynamic> json) {
    return json == null ? new List<ProblemDetails>() : json.map((value) => new ProblemDetails.fromJson(value)).toList();
  }

  static Map<String, ProblemDetails> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ProblemDetails>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ProblemDetails.fromJson(value));
    }
    return map;
  }
}

