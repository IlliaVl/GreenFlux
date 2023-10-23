import 'package:flutter/material.dart';

import '../../../../domain/models/evse.dart';

class EvseCard extends StatelessWidget {
  final Evse evse;

  const EvseCard({
    super.key,
    required this.evse,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('EVSE ID: ${evse.evseId}'),
            Text('Connector Type: ${evse.connectorType?.name}'),
            Text('Power Type: ${evse.powerType?.name}'),
            Row(
              children: [
                Text('Status: ${evse.status?.name}'),
                Icon(
                  evse.status == Status.AVAILABLE
                      ? Icons.check_circle
                      : evse.status == Status.CHARGING
                          ? Icons.flash_on
                          : Icons.help_outline,
                  color: evse.status == Status.AVAILABLE
                      ? Colors.green
                      : evse.status == Status.CHARGING
                          ? Colors.orange
                          : Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
