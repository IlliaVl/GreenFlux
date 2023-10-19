import 'package:equatable/equatable.dart';

import 'evse.dart';

/// Data transfer object that represents a Location summary.
class Location extends Equatable {
  final String? address;

  final String? city;

  final String? country;

  final double? latitude;

  final double? longitude;

  /// EVSEs or charge stations.
  final List<Evse>? evses;

  /// Creates a new [Location].
  const Location({
    required this.address,
    required this.city,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.evses,
  });

  @override
  List<Object?> get props => [
        address,
        city,
        country,
        latitude,
        longitude,
        evses,
      ];
}
