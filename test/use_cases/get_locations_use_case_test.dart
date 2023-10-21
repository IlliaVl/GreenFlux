import 'package:green_flux_test/domain/abstracts/repositories/locations_repository_interface.dart';
import 'package:green_flux_test/domain/models/location.dart';
import 'package:green_flux_test/domain/use_cases/get_locations_use_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockLocationsRepository extends Mock
    implements LocationsRepositoryInterface {}

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
  late MockLocationsRepository mockRepository;

  setUp(() {
    mockRepository = MockLocationsRepository();
    getLocationsUseCase = GetLocationsUseCase(repository: mockRepository);
  });

  group('GetLocationsUseCase', () {
    test('returns a list of locations when the repository provides data',
        () async {
      when(
        () => mockRepository.getLocations(city),
      ).thenAnswer(
        (_) async => mockLocations,
      );

      final result = await getLocationsUseCase(city);

      expect(result, isA<List<Location>>());
      expect(result, mockLocations);
      expect(result.length, 2);
    });

    test('returns an empty list when the repository does not provide data',
        () async {
      when(
        () => mockRepository.getLocations(city),
      ).thenAnswer(
        (_) async => [],
      );

      final result = await getLocationsUseCase(city);

      expect(result, isA<List<Location>>());
      expect(result.isEmpty, true);
    });
  });
}
