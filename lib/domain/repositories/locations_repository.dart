import 'package:green_flux_test/domain/models/location.dart';
import 'package:injectable/injectable.dart';

import '../../data/providers/locations_provider.dart';
import '../abstracts/repositories/locations_repository_interface.dart';
import '../mapping/location_summary_dto_mapping.dart';

/// The repository for Locations.
@Injectable(as: LocationsRepositoryInterface)
class LocationsRepository extends LocationsRepositoryInterface {
  final LocationsProvider _provider;

  /// Creates new [LocationsRepository]
  LocationsRepository({required LocationsProvider provider})
      : _provider = provider;

  @override
  Future<List<Location>> getLocations(String city) async {
    final dtos = await _provider.getLocations(city);
    return dtos
        .map(
          (locationSummaryDto) => locationSummaryDto.toLocation(),
        )
        .toList();
  }
}
