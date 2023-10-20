import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_flux_test/domain/blocs/locations_bloc.dart';

import 'data/network/green_flux_net_client.dart';
import 'data/providers/locations_provider.dart';
import 'domain/repositories/locations_repository.dart';
import 'domain/use_cases/get_locations_use_case.dart';
import 'presentation/locations_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = LocationsProvider(
      netClient: GreenFluxNetClient(
        apiKey: '',
      ),
    );
    final repository = LocationsRepository(provider: provider);
    final getLocationsUseCase = GetLocationsUseCase(repository: repository);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => LocationsBloc(
          getLocationsUseCase: getLocationsUseCase,
        ),
        child: const LocationsScreen(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
