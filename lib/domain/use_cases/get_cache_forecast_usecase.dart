import 'package:clean_arch_rock_n_roll/domain/domain.dart';
import 'package:dartz/dartz.dart';


abstract class CacheForecastUseCase {
  Future<Either<Failure, void>> execute(
    List<ForecastEntity> forecast,
    String city,
  );
}

class CacheForecastUseCaseImpl implements CacheForecastUseCase {
  final ForecastLocalRepository _repo;
  CacheForecastUseCaseImpl(this._repo);

  @override
  Future<Either<Failure, void>> execute(
    List<ForecastEntity> forecast,
    String city,
  ) async {
    return await _repo.cacheForecast(forecast, city);
  }
}