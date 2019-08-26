# swagger.api.SeedingApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**seedPlayer**](SeedingApi.md#seedPlayer) | **GET** /api/Seeding/SeedPlayer | 
[**seedTournaments**](SeedingApi.md#seedTournaments) | **GET** /api/Seeding/SeedTournaments | 


# **seedPlayer**
> Player seedPlayer()



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new SeedingApi();

try { 
    var result = api_instance.seedPlayer();
    print(result);
} catch (e) {
    print("Exception when calling SeedingApi->seedPlayer: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Player**](Player.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **seedTournaments**
> List<Tournament> seedTournaments()



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new SeedingApi();

try { 
    var result = api_instance.seedTournaments();
    print(result);
} catch (e) {
    print("Exception when calling SeedingApi->seedTournaments: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<Tournament>**](Tournament.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

