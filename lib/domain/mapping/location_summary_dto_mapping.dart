import 'package:green_flux_test/domain/mapping/evse_summary_dto_mapping.dart';

import '../../data/dtos/location_summary_dto.dart';
import '../models/location.dart';

/// Extension that provides mappings for [LocationSummaryDTO].
extension LocationSummaryDTOMapping on LocationSummaryDTO {
  /// Maps into a [Location].
  Location toLocation() => Location(
        address: address,
        city: city,
        country: country,
        latitude: latitude,
        longitude: longitude,
        evses: evses?.map((evseSummaryDto) => evseSummaryDto.toEvse()).toList(),
      );
}
