import 'package:flutter/material.dart';

import '../../domain/models/evse.dart';
import '../../domain/models/location.dart';

extension LocationDetails on Location {
  int get _availableEvses =>
      evses?.where((evse) => evse.status == Status.AVAILABLE).length ?? 0;

  String get countryCity => [country, city].join(', ');

  RichText title(BuildContext context) {
    final availableEvses = _availableEvses;
    return RichText(
      text: TextSpan(
        text: '$address\n${evses?.length} total EVSEs, ',
        style: Theme.of(context).textTheme.bodyLarge,
        children: <TextSpan>[
          TextSpan(
            text: '$_availableEvses available',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: availableEvses > 0 ? Colors.green : Colors.red,
                ),
          ),
        ],
      ),
    );
  }

  Icon get availabilityIcon => _availableEvses > (evses?.length ?? 0) / 2
      ? const Icon(Icons.battery_charging_full, color: Colors.green)
      : const Icon(Icons.battery_alert, color: Colors.deepOrangeAccent);
}
