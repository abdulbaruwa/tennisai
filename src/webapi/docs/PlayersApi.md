# swagger.api.PlayersApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**checkOutBasket**](PlayersApi.md#checkOutBasket) | **POST** /api/Players/{playerId}/checkoutbasket | 
[**createEnteredTournament**](PlayersApi.md#createEnteredTournament) | **POST** /api/Players/{playerId}/createenteredtournament | 
[**createPlayer**](PlayersApi.md#createPlayer) | **POST** /api/Players | 
[**createPlayerBasket**](PlayersApi.md#createPlayerBasket) | **POST** /api/Players/{playerId}/createplayerbasket | 
[**createWatchedTournament**](PlayersApi.md#createWatchedTournament) | **POST** /api/Players/{playerId}/createwatchedtournament | 
[**getEnteredTournaments**](PlayersApi.md#getEnteredTournaments) | **GET** /api/Players/{playerId}/getenteredtournaments | 
[**getMatchResults**](PlayersApi.md#getMatchResults) | **GET** /api/Players/{playerId}/getmatchresults | 
[**getPlayerBasket**](PlayersApi.md#getPlayerBasket) | **GET** /api/Players/{playerId}/getplayerbasket | 
[**getPlayerProfile**](PlayersApi.md#getPlayerProfile) | **GET** /api/Players/{playerId}/getplayerprofile | 
[**getWatchedTournaments**](PlayersApi.md#getWatchedTournaments) | **GET** /api/Players/{playerId}/getwatchedtournaments | 


# **checkOutBasket**
> checkOutBasket(playerId, basketDto)



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new PlayersApi();
var playerId = playerId_example; // String | 
var basketDto = new Basket(); // Basket | 

try { 
    api_instance.checkOutBasket(playerId, basketDto);
} catch (e) {
    print("Exception when calling PlayersApi->checkOutBasket: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playerId** | **String**|  | 
 **basketDto** | [**Basket**](Basket.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createEnteredTournament**
> createEnteredTournament(playerId, tournaments)



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new PlayersApi();
var playerId = playerId_example; // String | 
var tournaments = [new List&lt;TournamentInfo&gt;()]; // List<TournamentInfo> | 

try { 
    api_instance.createEnteredTournament(playerId, tournaments);
} catch (e) {
    print("Exception when calling PlayersApi->createEnteredTournament: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playerId** | **String**|  | 
 **tournaments** | [**List&lt;TournamentInfo&gt;**](TournamentInfo.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

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

# **createPlayerBasket**
> createPlayerBasket(playerId, basketDto)



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new PlayersApi();
var playerId = playerId_example; // String | 
var basketDto = new Basket(); // Basket | 

try { 
    api_instance.createPlayerBasket(playerId, basketDto);
} catch (e) {
    print("Exception when calling PlayersApi->createPlayerBasket: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playerId** | **String**|  | 
 **basketDto** | [**Basket**](Basket.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createWatchedTournament**
> createWatchedTournament(playerId, tournaments)



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new PlayersApi();
var playerId = playerId_example; // String | 
var tournaments = [new List&lt;TournamentInfo&gt;()]; // List<TournamentInfo> | 

try { 
    api_instance.createWatchedTournament(playerId, tournaments);
} catch (e) {
    print("Exception when calling PlayersApi->createWatchedTournament: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playerId** | **String**|  | 
 **tournaments** | [**List&lt;TournamentInfo&gt;**](TournamentInfo.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getEnteredTournaments**
> EnteredTournaments getEnteredTournaments(playerId)



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new PlayersApi();
var playerId = playerId_example; // String | 

try { 
    var result = api_instance.getEnteredTournaments(playerId);
    print(result);
} catch (e) {
    print("Exception when calling PlayersApi->getEnteredTournaments: $e\n");
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

# **getPlayerBasket**
> Basket getPlayerBasket(playerId)



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new PlayersApi();
var playerId = playerId_example; // String | 

try { 
    var result = api_instance.getPlayerBasket(playerId);
    print(result);
} catch (e) {
    print("Exception when calling PlayersApi->getPlayerBasket: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playerId** | **String**|  | 

### Return type

[**Basket**](Basket.md)

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

# **getWatchedTournaments**
> WatchedTournaments getWatchedTournaments(playerId)



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new PlayersApi();
var playerId = playerId_example; // String | 

try { 
    var result = api_instance.getWatchedTournaments(playerId);
    print(result);
} catch (e) {
    print("Exception when calling PlayersApi->getWatchedTournaments: $e\n");
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

