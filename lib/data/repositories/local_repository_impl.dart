import 'package:clean_arch_rock_n_roll/data/datasources/datasources.dart';
import 'package:clean_arch_rock_n_roll/domain/domain.dart';
import 'package:dartz/dartz.dart';


class WeatherLocalRepositoryImpl implements WeatherLocalRepository {
  final WeatherLocalDatasource localDatasource;
  WeatherLocalRepositoryImpl(this.localDatasource);

  @override
  Future<Either<Failure, void>> cacheWeather(
    WeatherEntity weather,
    String city,
  ) async {
    try {
      await localDatasource.cacheWeather(weather, city);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(e.failure);
    } on HiveException catch (e) {
      return Left(e.failure);
    } on UnexpectedException catch (e) {
      return Left(e.failure);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, WeatherEntity?>> offlineWeather(String city) async {
    try {
      final result = await localDatasource.offlineWeather(city);
      return Right(result);
    } on CacheException catch (e) {
      return Left(e.failure);
    } on HiveException catch (e) {
      return Left(e.failure);
    } on UnexpectedException catch (e) {
      return Left(e.failure);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}

class ForecastLocalRepositoryImpl implements ForecastLocalRepository {
  final ForecastLocalDatasource localDatasource;
  ForecastLocalRepositoryImpl(this.localDatasource);

  @override
  Future<Either<Failure, void>> cacheForecast(
    List<ForecastEntity> forecast,
    String city,
  ) async {
    try {
      await localDatasource.cacheForecast(forecast, city);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(e.failure);
    } on HiveException catch (e) {
      return Left(e.failure);
    } on UnexpectedException catch (e) {
      return Left(e.failure);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ForecastEntity>>> offlineForecast(
    String city,
  ) async {
    try {
      final result = await localDatasource.offlineForecasts(city);
      return Right(result);
    } on CacheException catch (e) {
      return Left(e.failure);
    } on HiveException catch (e) {
      return Left(e.failure);
    } on UnexpectedException catch (e) {
      return Left(e.failure);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}