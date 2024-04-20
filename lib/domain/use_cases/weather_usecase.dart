import 'package:clean_arch_rock_n_roll/domain/domain.dart';
import 'package:dartz/dartz.dart';


abstract class WeatherUsecase {
  Future<Either<Failure, WeatherEntity>> execute(
    String lat,
    String lon,
  );
}

class WeatherUsecaseImpl implements WeatherUsecase {
  final WeatherRemoteRepository _repo;
  WeatherUsecaseImpl(this._repo);

  @override
  Future<Either<Failure, WeatherEntity>> execute(
    String lat,
    String lon,
  ) async {
    return await _repo.getWeather(lat, lon);
  }
}