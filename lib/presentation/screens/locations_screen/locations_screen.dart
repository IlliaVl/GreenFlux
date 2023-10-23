import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_flux_test/presentation/extensions/locations_error_extensions.dart';

import '../../../domain/blocs/locations_bloc.dart';
import 'widgets/locations_list_widget.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('GreenFlux charge locations search'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            autocorrect: false,
            onChanged: (text) => context.read<LocationsBloc>().add(
                  CityChangeEvent(city: text),
                ),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: InputBorder.none,
              hintText: 'Enter city name to search',
            ),
          ),
          BlocBuilder<LocationsBloc, LocationsState>(
            builder: (context, state) => switch (state) {
              LocationsEmptyState() => Container(),
              LocationsLoadingState() => const CircularProgressIndicator(),
              LocationsLoadedState() => const Expanded(
                  child: LocationsListWidget(),
                ),
              LocationsStateError() => Text(state.error.string)
            },
          ),
        ],
      ),
    );
  }
}
