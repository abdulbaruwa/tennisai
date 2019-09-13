# swagger.api.PlayersApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createPlayer**](PlayersApi.md#createPlayer) | **POST** /api/Players | 
[**getMatchResults**](PlayersApi.md#getMatchResults) | **GET** /api/Players/{playerId}/matchresults | 
[**getPlayerProfile**](PlayersApi.md#getPlayerProfile) | **GET** /api/Players/{playerId}/getplayerprofile | 
[**getPlayerTournaments**](PlayersApi.md#getPlayerTournaments) | **GET** /api/Players/{playerId}/getplayertournaments | 


# **createPlayer**
> createPlayer(playerDto)



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new PlayersApi();
var playerDto = new Player(); // Player | 

try { 
    api_instance.createPlayer(playerDto);
} catch (e) {
    print("Exception when calling PlayersApi->createPlayer: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playerDto** | [**Player**](Player.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMatchResults**
> List<MatchResultInfo> getMatchResults(playerId)



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new PlayersApi();
var playerId = playerId_example; // String | 

try { 
    var result = api_instance.getMatchResults(playerId);
    print(result);
} catch (e) {
    print("Exception when calling PlayersApi->getMatchResults: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playerId** | **String**|  | 

### Return type

[**List<MatchResultInfo>**](MatchResultInfo.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPlayerProfile**
> Player getPlayerProfile(playerId)



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new PlayersApi();
var playerId = playerId_example; // String | 

try { 
    var result = api_instance.getPlayerProfile(playerId);
    print(result);
} catch (e) {
    print("Exception when calling PlayersApi->getPlayerProfile: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playerId** | **String**|  | 

### Return type

[**Player**](Player.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPlayerTournaments**
> PlayerTournaments getPlayerTournaments(playerId)



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new PlayersApi();
var playerId = playerId_example; // String | 

try { 
    var result = api_instance.getPlayerTournaments(playerId);
    print(result);
} catch (e) {
    print("Exception when calling PlayersApi->getPlayerTournaments: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playerId** | **String**|  | 

### Return type

[**PlayerTournaments**](PlayerTournaments.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

