import 'package:clean_arch_rock_n_roll/domain/domain.dart';
import 'package:dartz/dartz.dart';

abstract class WeatherLocalRepository {
  Future<Either<Failure, void>> cacheWeather(
    WeatherEntity weather,
    String city,
  );

  Future<Either<Failure, WeatherEntity?>> offlineWeather(
    String city,
  );
}

abstract class ForecastLocalRepository {
  Future<Either<Failure, void>> cacheForecast(
    List<ForecastEntity> forecasts,
    String city,
  );
  Future<Either<Failure, List<ForecastEntity>>> offlineForecast(
    String city,
  );
}