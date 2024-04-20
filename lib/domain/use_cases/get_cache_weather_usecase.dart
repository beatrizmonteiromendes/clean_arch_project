import 'package:clean_arch_rock_n_roll/domain/domain.dart';
import 'package:dartz/dartz.dart';


abstract class CacheWeatherUsecase {
  Future<Either<Failure, void>> execute(
    WeatherEntity weather,
    String city,
  );
}

class CacheWeatherUsecaseImpl implements CacheWeatherUsecase {
  final WeatherLocalRepository _repo;
  CacheWeatherUsecaseImpl(this._repo);

  @override
  Future<Either<Failure, void>> execute(
    WeatherEntity weather,
    String city,
  ) async {
    return await _repo.cacheWeather(weather, city);
  }
}