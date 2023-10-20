part of 'locations_bloc.dart';

/// A class that represents all possible Locations events.
sealed class LocationsEvent extends Equatable {
  /// Creates a new [LocationsEvent] instance.
  const LocationsEvent();
}

/// A [LocationsEvent] that represents a change in the city.
final class CityChangeEvent extends LocationsEvent {
  /// The new city.
  final String city;

  /// Creates a new CityChangeEvent instance.
  const CityChangeEvent({required this.city});

  @override
  List<Object?> get props => [city];
}
