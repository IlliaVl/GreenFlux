import 'package:green_flux_test/data/network/green_flux_net_client.dart';
import 'package:injectable/injectable.dart';

import '../data/abstracts/network/net_client.dart';
import 'env.dart';

@module
abstract class AppModule {
  @singleton
  NetClient get userService => GreenFluxNetClient(apiKey: Env.greenFluxApiKey);
}
