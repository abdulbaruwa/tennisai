part of swagger.api;



class PlayersApi {
  final ApiClient apiClient;

  PlayersApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// 
  ///
  /// 
  Future checkOutBasket(String playerId, { Basket basketDto }) async {
    Object postBody = basketDto;

    // verify required params are set
    if(playerId == null) {
     throw new ApiException(400, "Missing required param: playerId");
    }

    // create path and map variables
    String path = "/api/Players/{playerId}/checkoutbasket".replaceAll("{format}","json").replaceAll("{" + "playerId" + "}", playerId.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    
    List<String> contentTypes = ["application/json-patch+json","application/json","text/json","application/_*+json"];

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
                                             'POST',
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
          ;
    } else {
      return ;
    }
  }
  /// 
  ///
  /// 
  Future createEnteredTournament(String playerId, { List<TournamentInfo> tournaments }) async {
    Object postBody = tournaments;

    // verify required params are set
    if(playerId == null) {
     throw new ApiException(400, "Missing required param: playerId");
    }

    // create path and map variables
    String path = "/api/Players/{playerId}/createenteredtournament".replaceAll("{format}","json").replaceAll("{" + "playerId" + "}", playerId.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    
    List<String> contentTypes = ["application/json-patch+json","application/json","text/json","application/_*+json"];

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
                                             'POST',
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
          ;
    } else {
      return ;
    }
  }
  /// 
  ///
  /// 
  Future createPlayer({ Player playerDto }) async {
    Object postBody = playerDto;

    // verify required params are set

    // create path and map variables
    String path = "/api/Players".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    
    List<String> contentTypes = ["application/json-patch+json","application/json","text/json","application/_*+json"];

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
                                             'POST',
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
          ;
    } else {
      return ;
    }
  }
  /// 
  ///
  /// 
  Future createPlayerBasket(String playerId, { Basket basketDto }) async {
    Object postBody = basketDto;

    // verify required params are set
    if(playerId == null) {
     throw new ApiException(400, "Missing required param: playerId");
    }

    // create path and map variables
    String path = "/api/Players/{playerId}/createplayerbasket".replaceAll("{format}","json").replaceAll("{" + "playerId" + "}", playerId.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    
    List<String> contentTypes = ["application/json-patch+json","application/json","text/json","application/_*+json"];

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
                                             'POST',
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
          ;
    } else {
      return ;
    }
  }
  /// 
  ///
  /// 
  Future createWatchedTournament(String playerId, { List<TournamentInfo> tournaments }) async {
    Object postBody = tournaments;

    // verify required params are set
    if(playerId == null) {
     throw new ApiException(400, "Missing required param: playerId");
    }

    // create path and map variables
    String path = "/api/Players/{playerId}/createwatchedtournament".replaceAll("{format}","json").replaceAll("{" + "playerId" + "}", playerId.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    
    List<String> contentTypes = ["application/json-patch+json","application/json","text/json","application/_*+json"];

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
                                             'POST',
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
          ;
    } else {
      return ;
    }
  }
  /// 
  ///
  /// 
  Future<EnteredTournaments> getEnteredTournaments(String playerId) async {
    Object postBody = null;

    // verify required params are set
    if(playerId == null) {
     throw new ApiException(400, "Missing required param: playerId");
    }

    // create path and map variables
    String path = "/api/Players/{playerId}/getenteredtournaments".replaceAll("{format}","json").replaceAll("{" + "playerId" + "}", playerId.toString());

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
          apiClient.deserialize(response.body, 'EnteredTournaments') as EnteredTournaments ;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<List<MatchResultInfo>> getMatchResults(String playerId) async {
    Object postBody = null;

    // verify required params are set
    if(playerId == null) {
     throw new ApiException(400, "Missing required param: playerId");
    }

    // create path and map variables
    String path = "/api/Players/{playerId}/getmatchresults".replaceAll("{format}","json").replaceAll("{" + "playerId" + "}", playerId.toString());

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
        (apiClient.deserialize(response.body, 'List<MatchResultInfo>') as List).map((item) => item as MatchResultInfo).toList();
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<Basket> getPlayerBasket(String playerId) async {
    Object postBody = null;

    // verify required params are set
    if(playerId == null) {
     throw new ApiException(400, "Missing required param: playerId");
    }

    // create path and map variables
    String path = "/api/Players/{playerId}/getplayerbasket".replaceAll("{format}","json").replaceAll("{" + "playerId" + "}", playerId.toString());

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
          apiClient.deserialize(response.body, 'Basket') as Basket ;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<Player> getPlayerProfile(String playerId) async {
    Object postBody = null;

    // verify required params are set
    if(playerId == null) {
     throw new ApiException(400, "Missing required param: playerId");
    }

    // create path and map variables
    String path = "/api/Players/{playerId}/getplayerprofile".replaceAll("{format}","json").replaceAll("{" + "playerId" + "}", playerId.toString());

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
          apiClient.deserialize(response.body, 'Player') as Player ;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<WatchedTournaments> getWatchedTournaments(String playerId) async {
    Object postBody = null;

    // verify required params are set
    if(playerId == null) {
     throw new ApiException(400, "Missing required param: playerId");
    }

    // create path and map variables
    String path = "/api/Players/{playerId}/getwatchedtournaments".replaceAll("{format}","json").replaceAll("{" + "playerId" + "}", playerId.toString());

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
          apiClient.deserialize(response.body, 'WatchedTournaments') as WatchedTournaments ;
    } else {
      return null;
    }
  }
}
