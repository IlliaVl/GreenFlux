# GreenFlux Flutter Assignment

Flutter app where users can search for charge locations by city and see charge location details.
The API endpoint to fetch the data is `https://app-flutter-locations-test.azurewebsites.net/`.

## How to launch

Steps to launch app:

1. Create or add to the root directory of project .env file with the following line:
   GREEN_FLUX_API_KEY=API_KEY
   Where API_KEY is the key for authorization. Replace it with the real value.

2. Run `dart run build_runner build --delete-conflicting-outputs` from the root directory of the project.
   It will create `env.g.dart` and `injection.config.dart` files.

3. Launch app as usual Flutter project.


## Brief explanation

Clean architecture is used for app. BLoC - as a state management.
`injectable` and `get_it` packages are used for handling dependencies.
`envied` package is used for handling API key.
`bloc_test`,`mocktail` and `test` packages are used for unit tests.

