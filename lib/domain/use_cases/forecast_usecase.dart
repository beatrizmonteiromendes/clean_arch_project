import 'package:clean_arch_rock_n_roll/domain/domain.dart';
import 'package:dartz/dartz.dart';


abstract class ForecastUsecase {
  Future<Either<Failure, List<ForecastEntity>>> execute(
    String lat,
    String lon,
  );
}

class ForecastUsecaseImpl implements ForecastUsecase {
  final ForecastRemoteRepository _repo;
  ForecastUsecaseImpl(this._repo);

  @override
  Future<Either<Failure, List<ForecastEntity>>> execute(
    String lat,
    String lon,
  ) async {
    return await _repo.getForecast(lat, lon);
  }
}