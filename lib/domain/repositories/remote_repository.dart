import 'package:clean_arch_rock_n_roll/domain/domain.dart';

import 'package:dartz/dartz.dart';


abstract class WeatherRemoteRepository {
  Future<Either<Failure, WeatherEntity>> getWeather(
    String lat,
    String lon,
  );
}

abstract class ForecastRemoteRepository {
  Future<Either<Failure, List<ForecastEntity>>> getForecast(
    String lat,
    String lon,
  );
}