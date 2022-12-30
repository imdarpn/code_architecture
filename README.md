1. Clone the repo.
2. Run `flutter pub get`
3. Run `flutter pub run build_runner build --delete-conflicting-outputs`
4. Run app.


## How to use
### Creating a screen.
All screen should be created in the `ui/pages` folder


### Creating api service.
1. Create entity object in folder `lib/models`
   Class must have `@JsonSerializable()` for generator. Read [json_serializable](https://pub.dev/packages/json_serializable)

2. Define and Generate your API in file `lib/api_service/dio_client.dart`
   
Note: Using **ObjectResponse** for generic response

3. Require run command line:
```
flutter pub run build_runner build --delete-conflicting-outputs
```

#### Logger
```java=
logger.d("message"); //"💙 DEBUG: message"
logger.i("message"); //"💚 INFO: message"
logger.e("message"); //"❤️ ERROR: message"
```
