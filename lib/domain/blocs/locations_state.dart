part of 'locations_bloc.dart';

/// A class that represents all possible Locations states.
sealed class LocationsState extends Equatable {
  /// Creates a new [LocationsState] instance.
  const LocationsState();
}

/// A [LocationsState] that represents an empty state.
final class LocationsEmptyState extends LocationsState {
  @override
  List<Object?> get props => [];
}

/// A [LocationsState] that represents a loading state.
final class LocationsLoadingState extends LocationsState {
  @override
  List<Object?> get props => [];
}

/// A [LocationsState] that represents a loaded state.
final class LocationsLoadedState extends LocationsState {
  final List<Location> locations;

  /// Creates a new [LocationsLoadedState] instance.
  const LocationsLoadedState({required this.locations});

  @override
  List<Object?> get props => [locations];
}

/// A [LocationsState] that represents an error state.
final class LocationsStateError extends LocationsState {
  final LocationsError error;

  /// Creates a new [LocationsStateError] instance.
  const LocationsStateError(this.error);

  @override
  List<Object?> get props => [error];
}

enum LocationsError { unknown, minimumLength }
