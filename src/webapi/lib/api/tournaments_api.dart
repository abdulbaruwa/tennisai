part of swagger.api;



class TournamentsApi {
  final ApiClient apiClient;

  TournamentsApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// 
  ///
  /// 
  Future<List<Tournament>> byPreference(String playerId) async {
    Object postBody = null;

    // verify required params are set
    if(playerId == null) {
     throw new ApiException(400, "Missing required param: playerId");
    }

    // create path and map variables
    String path = "/api/Tournaments/{playerId}/bypreference".replaceAll("{format}","json").replaceAll("{" + "playerId" + "}", playerId.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    
    List<String> contentTypes = [];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = [];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      
      if(hasFields)
        postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'GET',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return 
        (apiClient.deserialize(response.body, 'List<Tournament>') as List).map((item) => item as Tournament).toList();
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<List<Entrant>> entrants(String tournamentId) async {
    Object postBody = null;

    // verify required params are set
    if(tournamentId == null) {
     throw new ApiException(400, "Missing required param: tournamentId");
    }

    // create path and map variables
    String path = "/api/Tournaments/{tournamentId}/entrants".replaceAll("{format}","json").replaceAll("{" + "tournamentId" + "}", tournamentId.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    
    List<String> contentTypes = [];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = [];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      
      if(hasFields)
        postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'GET',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return 
        (apiClient.deserialize(response.body, 'List<Entrant>') as List).map((item) => item as Entrant).toList();
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<List<Tournament>> searchTournaments({ int grade, String ageGroup, String gender, String tournamentStatus }) async {
    Object postBody = null;

    // verify required params are set

    // create path and map variables
    String path = "/api/Tournaments/api/tournaments".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    if(grade != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "Grade", grade));
    }
    if(ageGroup != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "AgeGroup", ageGroup));
    }
    if(gender != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "Gender", gender));
    }
    if(tournamentStatus != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "TournamentStatus", tournamentStatus));
    }
    
    List<String> contentTypes = [];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = [];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      
      if(hasFields)
        postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'GET',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return 
        (apiClient.deserialize(response.body, 'List<Tournament>') as List).map((item) => item as Tournament).toList();
    } else {
      return null;
    }
  }
}
