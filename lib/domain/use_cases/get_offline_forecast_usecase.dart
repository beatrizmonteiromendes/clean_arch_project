import 'package:clean_arch_rock_n_roll/domain/domain.dart';
import 'package:dartz/dartz.dart';


abstract class OfflineForecastUsecase {
  Future<Either<Failure, List<ForecastEntity>>> execute(String city);
}

class OfflineForecastUsecaseImpl implements OfflineForecastUsecase {
  final ForecastLocalRepository _repo;
  OfflineForecastUsecaseImpl(this._repo);

  @override
  Future<Either<Failure, List<ForecastEntity>>> execute(String city) async {
    return await _repo.offlineForecast(city);
  }
}