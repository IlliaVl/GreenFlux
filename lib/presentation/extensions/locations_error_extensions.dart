import '../../domain/blocs/locations_bloc.dart';

extension LocationsErrorToString on LocationsError {
  String get string => switch (this) {
        LocationsError.unknown => 'Something went wrong. Try later, please.',
        LocationsError.minimumLength =>
          'Minimum length of search string is 3 characters.'
      };
}
