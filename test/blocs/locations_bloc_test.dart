import 'package:bloc_test/bloc_test.dart';
import 'package:green_flux_test/domain/blocs/locations_bloc.dart';
import 'package:green_flux_test/domain/models/location.dart';
import 'package:green_flux_test/domain/use_cases/get_locations_use_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockGetLocationsUseCase extends Mock implements GetLocationsUseCase {}

void main() {
  const city = 'Amsterdam';

  final mockLocations = List.generate(
    2,
    (index) => Location(
      address: '123 Main St $index',
      city: '$city $index',
      country: 'Country $index',
      latitude: 123.456 + index,
      longitude: 789.012 + index,
      evses: const [],
    ),
  );

  late GetLocationsUseCase getLocationsUseCase;
  late LocationsBloc locationsBloc;

  setUp(() {
    getLocationsUseCase = MockGetLocationsUseCase();
    locationsBloc = LocationsBloc(getLocationsUseCase: getLocationsUseCase);
  });

  tearDown(() {
    locationsBloc.close();
  });

  group('LocationsBloc', () {
    blocTest<LocationsBloc, LocationsState>(
      'emits LoadingState and LoadedState on CityChangeEvent',
      build: () {
        when(
          () => getLocationsUseCase.call(any()),
        ).thenAnswer((_) async {
          return [];
        });
        return locationsBloc;
      },
      act: (bloc) => bloc.add(const CityChangeEvent(city: city)),
      wait: LocationsBloc.debounceDuration,
      expect: () => [
        LocationsLoadingState(),
        const LocationsLoadedState(locations: []),
      ],
    );

    blocTest<LocationsBloc, LocationsState>(
      'emits LoadingState and LoadedState on CityChangeEvent',
      build: () {
        when(
          () => getLocationsUseCase.call(city),
        ).thenAnswer(
          (_) async => mockLocations,
        );
        return locationsBloc;
      },
      act: (bloc) => bloc.add(const CityChangeEvent(city: city)),
      wait: LocationsBloc.debounceDuration,
      expect: () => [
        LocationsLoadingState(),
        LocationsLoadedState(locations: mockLocations),
      ],
    );

    blocTest<LocationsBloc, LocationsState>(
      'emits LoadingState and EmptyState on CityChangeEvent with an empty city',
      build: () {
        return locationsBloc;
      },
      act: (bloc) => bloc.add(const CityChangeEvent(city: '')),
      wait: LocationsBloc.debounceDuration,
      expect: () => [
        LocationsEmptyState(),
      ],
    );

    final exception = Exception('Error');
    blocTest<LocationsBloc, LocationsState>(
      'emits LoadingState and handles errors gracefully',
      build: () {
        when(
          () => getLocationsUseCase.call(any()),
        ).thenThrow(
          exception,
        );
        return locationsBloc;
      },
      act: (bloc) => bloc.add(const CityChangeEvent(city: city)),
      wait: LocationsBloc.debounceDuration,
      expect: () => [
        LocationsLoadingState(),
        LocationsStateError(exception.toString()),
      ],
    );
  });
}
