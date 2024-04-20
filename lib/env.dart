import 'package:envied/envied.dart';


@Envied(path: ".env")
abstract class Env {
  @EnviedField(varName: 'OPEN_WEATHER_KEY')
  static const openWeatherApiKey = _Env.openWeatherApiKey;
}

