import '../../models/location.dart';

/// The abstract repository for Locations.
abstract class LocationsRepositoryInterface {
  /// Creates new [LocationsRepositoryInterface].
  LocationsRepositoryInterface();

  /// Gets Locations by provided city.
  Future<List<Location>> getLocations(String city);
}
