import 'package:flutter/material.dart';
import 'package:green_flux_test/presentation/extensions/location_extensions.dart';

import '../../../domain/models/location.dart';
import 'widgets/evse_card.dart';

class LocationDetailsScreen extends StatelessWidget {
  final Location location;

  const LocationDetailsScreen({
    super.key,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    final evses = location.sortedByAvailabilityEvses;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(location.fullAddress),
      ),
      body: ListView.builder(
        itemCount: evses.length ?? 0,
        itemBuilder: (context, index) => EvseCard(evse: evses[index]),
      ),
    );
  }
}
