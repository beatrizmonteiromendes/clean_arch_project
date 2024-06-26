

import 'package:clean_arch_rock_n_roll/data/datasources/remote_datasource.dart';
import 'package:clean_arch_rock_n_roll/domain/domain.dart';
import 'package:dartz/dartz.dart';

class WeatherRemoteRepositoryImpl implements WeatherRemoteRepository {
  final WeatherRemoteDatasource remoteDatasource;
  WeatherRemoteRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<Failure, WeatherEntity>> getWeather(
    String lat,
    String lon,
  ) async {
    try {
      final result = await remoteDatasource.getWeather(lat, lon);
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(e.failure);
    } on NetworkException catch (e) {
      return Left(e.failure);
    } on UnexpectedException catch (e) {
      return Left(e.failure);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}

class ForecastRemoteRepositoryImpl implements ForecastRemoteRepository {
  final ForecastRemoteDatasource remoteDatasource;
  ForecastRemoteRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<Failure, List<ForecastEntity>>> getForecast(
    String lat,
    String lon,
  ) async {
    try {
      final result = await remoteDatasource.getForecast(lat, lon);
      return Right(result.map((f) => f.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(e.failure);
    } on NetworkException catch (e) {
      return Left(e.failure);
    } on UnexpectedException catch (e) {
      return Left(e.failure);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}