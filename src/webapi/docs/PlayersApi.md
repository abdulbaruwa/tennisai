# swagger.api.PlayersApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createPlayer**](PlayersApi.md#createPlayer) | **POST** /api/Players | 
[**enteredTournaments**](PlayersApi.md#enteredTournaments) | **GET** /api/Players/{playerId}/enteredtournaments | 
[**getMatchResults**](PlayersApi.md#getMatchResults) | **GET** /api/Players/{playerId}/matchresults | 
[**playerProfile**](PlayersApi.md#playerProfile) | **GET** /api/Players/{playerId}/playerprofile | 
[**watchedTournaments**](PlayersApi.md#watchedTournaments) | **GET** /api/Players/{playerId}/watchedtournaments | 


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

# **enteredTournaments**
> EnteredTournaments enteredTournaments(playerId)



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new PlayersApi();
var playerId = playerId_example; // String | 

try { 
    var result = api_instance.enteredTournaments(playerId);
    print(result);
} catch (e) {
    print("Exception when calling PlayersApi->enteredTournaments: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playerId** | **String**|  | 

### Return type

[**EnteredTournaments**](EnteredTournaments.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
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

# **playerProfile**
> Player playerProfile(playerId)



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new PlayersApi();
var playerId = playerId_example; // String | 

try { 
    var result = api_instance.playerProfile(playerId);
    print(result);
} catch (e) {
    print("Exception when calling PlayersApi->playerProfile: $e\n");
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

# **watchedTournaments**
> WatchedTournaments watchedTournaments(playerId)



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new PlayersApi();
var playerId = playerId_example; // String | 

try { 
    var result = api_instance.watchedTournaments(playerId);
    print(result);
} catch (e) {
    print("Exception when calling PlayersApi->watchedTournaments: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playerId** | **String**|  | 

### Return type

[**WatchedTournaments**](WatchedTournaments.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

