import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/blocs/locations_bloc.dart';
import '../../../extensions/location_extensions.dart';
import '../../location_details_screen/location_details_screen.dart';

class LocationsListWidget extends StatelessWidget {
  const LocationsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locations =
        (context.read<LocationsBloc>().state as LocationsLoadedState).locations;

    return ListView.separated(
      itemCount: locations.length,
      itemBuilder: (context, index) => ListTile(
        leading: locations[index].availabilityIcon,
        title: locations[index].title(context),
        subtitle: Text(locations[index].countryCity),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => LocationDetailsScreen(
              location: locations[index],
            ),
          ),
        ),
      ),
      separatorBuilder: (_, __) => const Divider(indent: 8.0),
    );
  }
}
