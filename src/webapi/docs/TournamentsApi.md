# swagger.api.TournamentsApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**byPreference**](TournamentsApi.md#byPreference) | **GET** /api/Tournaments/{playerId}/bypreference | 
[**entrants**](TournamentsApi.md#entrants) | **GET** /api/Tournaments/{tournamentId}/entrants | 
[**searchTournaments**](TournamentsApi.md#searchTournaments) | **GET** /api/Tournaments/api/tournaments | 


# **byPreference**
> List<Tournament> byPreference(playerId)



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new TournamentsApi();
var playerId = playerId_example; // String | 

try { 
    var result = api_instance.byPreference(playerId);
    print(result);
} catch (e) {
    print("Exception when calling TournamentsApi->byPreference: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **playerId** | **String**|  | 

### Return type

[**List<Tournament>**](Tournament.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **entrants**
> List<Entrant> entrants(tournamentId)



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new TournamentsApi();
var tournamentId = tournamentId_example; // String | 

try { 
    var result = api_instance.entrants(tournamentId);
    print(result);
} catch (e) {
    print("Exception when calling TournamentsApi->entrants: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tournamentId** | **String**|  | 

### Return type

[**List<Entrant>**](Entrant.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchTournaments**
> List<Tournament> searchTournaments(grade, ageGroup, gender, tournamentStatus)



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new TournamentsApi();
var grade = 56; // int | 
var ageGroup = ageGroup_example; // String | 
var gender = gender_example; // String | 
var tournamentStatus = tournamentStatus_example; // String | 

try { 
    var result = api_instance.searchTournaments(grade, ageGroup, gender, tournamentStatus);
    print(result);
} catch (e) {
    print("Exception when calling TournamentsApi->searchTournaments: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **grade** | **int**|  | [optional] 
 **ageGroup** | **String**|  | [optional] 
 **gender** | **String**|  | [optional] 
 **tournamentStatus** | **String**|  | [optional] 

### Return type

[**List<Tournament>**](Tournament.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

