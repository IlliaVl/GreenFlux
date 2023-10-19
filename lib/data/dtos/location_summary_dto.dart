import 'package:green_flux_test/data/dtos/evse_summary_dto.dart';

/// Data transfer object that represents a Location summary.
class LocationSummaryDTO {
  final String? address;

  final String? city;

  final String? country;

  final double? latitude;

  final double? longitude;

  /// EVSEs or charge stations.
  final List<EvseSummaryDTO>? evses;

  /// Creates a new [LocationSummaryDTO].
  LocationSummaryDTO({
    required this.address,
    required this.city,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.evses,
  });

  /// Creates a [LocationSummaryDTO] from a json.
  factory LocationSummaryDTO.fromJson(Map<String, dynamic> json) =>
      LocationSummaryDTO(
        address: json['address'],
        city: json['city'],
        country: json['country'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        evses: EvseSummaryDTO.fromJsonList(
          List<Map<String, dynamic>>.from(json['evses']),
        ),
      );

  /// Creates a [LocationSummaryDTO]s from a list of json maps.
  static List<LocationSummaryDTO> fromJsonList(
          List<Map<String, dynamic>> json) =>
      json.map(LocationSummaryDTO.fromJson).toList();
}
