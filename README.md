## Getting Started
1. Clone the repo.
2. Run `flutter pub get`
3. Run `flutter pub run intl_utils:generate`
4. Run `flutter pub run build_runner build --delete-conflicting-outputs`
5. Run app.


### main.dart
The "entry point" of program.
In general, `main.dart` contain **AppMaterial**, but this repo use **GetMaterialApp** which has the default MaterialApp as a child.
### assets
This folder is to store static assets like fonts and images.
### common
### configs
This folder hold the config of your applications.
### database
### l10n
This folder contain all localized string. [See more](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)
### models
### networks
### router
This folder contain the route navigation
### services
This folder contain all GetxService or any service which can not be removed from memory.
### ui
### utils

## How to use
### Creating a screen.
All screen should be created in the `ui/pages` folder
#### Example: MovieSection
**Logic:** `movies_section_logic.dart`
**State:** `movies_section_state.dart`
**View:** `movies_section_view.dart`

### Creating api service.
1. Create entity object in folder `lib/models/entities`
Class must have `@JsonSerializable()` for generator. Read [json_serializable](https://pub.dev/packages/json_serializable)

2. Define and Generate your API in file `lib/networks/api_client.dart`
Ex: GET movies
```java=
  /// Movie
  @GET("/3/discover/movie")
  Future<ArrayResponse<MovieEntity>> getMovies(@Query('api_key') String apiKey, @Query('page') int page);
```
Note: Using **ArrayResponse** and **ObjectResponse** for generic response

3. Require run command line: 
```
flutter pub run build_runner build --delete-conflicting-outputs
```

4. Create api service file for your feature in folder `lib/services/api` 
Ex: `movies_api.dart`
```java=
part of 'api_service.dart';

extension MovieApiService on ApiService {
  Future<ArrayResponse<MovieEntity>> getMovies({int page = 1}) async {
    return _apiClient.getMovies(MovieAPIConfig.APIKey, page);
  }
}
```
5. You can call API in the logic of screen.
Ex:
```java=
  final apiService = Get.find<ApiService>();
  final result = await apiService.getMovies(page: 1);
```



#### Logger
```java=
logger.d("message"); //"💙 DEBUG: message"
logger.i("message"); //"💚 INFO: message"
logger.e("message"); //"❤️ ERROR: message"
logger.log("very very very long message");
```
