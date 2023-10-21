import 'package:injectable/injectable.dart';

import '../abstracts/repositories/locations_repository_interface.dart';
import '../models/location.dart';

/// Use case that gets Locations.
@injectable
class GetLocationsUseCase {
  final LocationsRepositoryInterface _repository;

  /// Creates a new [GetLocationsUseCase] instance.
  GetLocationsUseCase({
    required LocationsRepositoryInterface repository,
  }) : _repository = repository;

  /// Gets Locations.
  Future<List<Location>> call(String city) => _repository.getLocations(city);
}
