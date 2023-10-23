import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart';

import '../models/location.dart';
import '../use_cases/get_locations_use_case.dart';

part 'locations_event.dart';
part 'locations_state.dart';

/// A BLoC that handles the business logic for the Locations screen.
@injectable
class LocationsBloc extends Bloc<LocationsEvent, LocationsState> {
  static const debounceDuration = Duration(milliseconds: 300);

  /// The GetLocationsUseCase to use.
  final GetLocationsUseCase _getLocationsUseCase;

  /// Creates a new [LocationsBloc] instance.
  LocationsBloc({
    required GetLocationsUseCase getLocationsUseCase,
  })  : _getLocationsUseCase = getLocationsUseCase,
        super(LocationsEmptyState()) {
    on<CityChangeEvent>(
      _getLocations,
      transformer: _debounce(debounceDuration),
    );
  }

  EventTransformer<Event> _debounce<Event>(Duration duration) =>
      (events, mapper) => events.debounce(duration).switchMap(mapper);

  /// Handles the CityChangeEvent event.
  FutureOr<void> _getLocations(
    CityChangeEvent event,
    Emitter<LocationsState> emit,
  ) async {
    final city = event.city;

    if (city.isEmpty) {
      return emit(LocationsEmptyState());
    }

    emit(LocationsLoadingState());

    try {
      final locations = await _getLocationsUseCase(event.city);
      emit(LocationsLoadedState(locations: locations));
    } catch (error) {
      if (error is DioException && error.response?.statusCode == 400) {
        emit(const LocationsStateError(LocationsError.minimumLength));
      } else {
        emit(const LocationsStateError(LocationsError.unknown));
      }
    }
  }
}
