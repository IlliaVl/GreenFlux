import '../abstracts/network/net_client.dart';
import '../dtos/location_summary_dto.dart';

/// Locations data provider.
class LocationsProvider {
  static const _locationsEndpoint = '/locations';

  /// The NetClient to use for the network requests.
  final NetClient netClient;

  /// Creates new [LocationsProvider].
  LocationsProvider({
    required this.netClient,
  });

  /// Returns list of Locations.
  Future<List<LocationSummaryDTO>> getLocations(
    String city,
  ) async {
    final response = await netClient(
      _locationsEndpoint,
      queryParameters: {
        'q': city,
      },
    );
    if (response.statusCode != 200) {
      return [];
    }
    if (response.data is List) {
      final locationSummaryDto = LocationSummaryDTO.fromJsonList(
        List<Map<String, dynamic>>.from(response.data),
      );
      return locationSummaryDto;
    }
    return [];
  }
}
