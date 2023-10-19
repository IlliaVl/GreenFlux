import '../abstracts/network/net_client.dart';

/// Net client for GreenFlux Test Locations API
class GreenFluxNetClient extends NetClient {
  static const String _baseUrl =
      'https://app-flutter-locations-test.azurewebsites.net';

  /// Creates new [GreenFluxNetClient]
  GreenFluxNetClient({String? apiKey})
      : super(
          baseUrl: _baseUrl,
          apiKey: apiKey,
        );
}
