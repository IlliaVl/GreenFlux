import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(
    varName: 'GREEN_FLUX_API_KEY',
    obfuscate: true,
  )
  static String greenFluxApiKey = _Env.greenFluxApiKey;
}
