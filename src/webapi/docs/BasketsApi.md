# swagger.api.BasketsApi

## Load the API package
```dart
import 'package:swagger/api.dart';
```

All URIs are relative to *https://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createPlayerBasket**](BasketsApi.md#createPlayerBasket) | **POST** /api/Baskets | 
[**getPlayerBasket**](BasketsApi.md#getPlayerBasket) | **GET** /api/Baskets/{playerId}/getplayerbasket | 


# **createPlayerBasket**
> createPlayerBasket(basketDto)



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new BasketsApi();
var basketDto = new Basket(); // Basket | 

try { 
    api_instance.createPlayerBasket(basketDto);
} catch (e) {
    print("Exception when calling BasketsApi->createPlayerBasket: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **basketDto** | [**Basket**](Basket.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/_*+json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPlayerBasket**
> Basket getPlayerBasket(playerId)



### Example 
```dart
import 'package:swagger/api.dart';

var api_instance = new BasketsApi();
var playerId = playerId_example; // String | 

try { 
    var result = api_instance.getPlayerBasket(playerId);
    print(result);
} catch (e) {
    print("Exception when calling BasketsApi->getPlayerBasket: $e\n");
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

