import 'package:clean_arch_rock_n_roll/data/const/constants.dart';
import 'package:clean_arch_rock_n_roll/domain/domain.dart';
import 'package:clean_arch_rock_n_roll/infra/adapters/local_storage_adapter.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';



abstract class WeatherLocalDatasource {
  Future<void> cacheWeather(WeatherEntity weather, String city);
  Future<WeatherEntity?> offlineWeather(String city);
}

abstract class ForecastLocalDatasource {
  Future<void> cacheForecast(List<ForecastEntity> forecasts, String city);
  Future<List<ForecastEntity>> offlineForecasts(String city);
}

class WeatherLocalDatasourceImpl implements WeatherLocalDatasource {
  final LocalStorageAdapter localStorageAdapter;
  const WeatherLocalDatasourceImpl(this.localStorageAdapter);

  @override
  Future<void> cacheWeather(
    WeatherEntity weather,
    String city,
  ) async {
    final localStorage = await localStorageAdapter.openBox('weathers');

    try {
      debugPrint("Storing weathers for offline...");
      await localStorage.put(city, weather);
      debugPrint("Weathers stored in offline cache!");
    } on HiveError catch (e) {
      debugPrint("Hive error occurred: $e");
      throw HiveException(Failure(e.toString()));
    } on CacheException catch (e) {
      debugPrint("Cache error occurred: $e");
      rethrow;
    } on Exception catch (e) {
      debugPrint("Unexpected error occurred: $e");
      throw UnexpectedException(Failure(e.toString()));
    } finally {
      try {
        await localStorage.close();
        debugPrint("Forecasts box closed!");
      } catch (e) {
        debugPrint("Error closing weathers box: $e");
      }
    }
  }

  @override
  Future<WeatherEntity?> offlineWeather(
    String city,
  ) async {
    final localStorage = await localStorageAdapter.openBox(
      Constants.weathersBox,
    );

    try {
      final hasLocation = localStorage.containsKey(city);

      if (hasLocation) {
        debugPrint("Gathering resources...");
        final WeatherEntity weather = localStorage.get(city);
        debugPrint("Retrieved from offline cache!");

        return weather;
      } else {
        debugPrint("$city's weather is not found offline!");
        throw CacheException(Failure(Constants.offlineError));
      }
    } on HiveError catch (e) {
      debugPrint("Hive error occurred: $e");
      throw HiveException(Failure(e.toString()));
    } on CacheException catch (e) {
      debugPrint("Cache error occurred: $e");
      rethrow;
    } on Exception catch (e) {
      debugPrint("Unexpected error occurred: $e");
      throw UnexpectedException(Failure(e.toString()));
    } finally {
      try {
        await localStorage.close();
        debugPrint("Forecasts box closed!");
      } catch (e) {
        debugPrint("Error closing weathers box: $e");
      }
    }
  }
}

class ForecastLocalDatasourceImpl implements ForecastLocalDatasource {
  final LocalStorageAdapter localStorageAdapter;
  const ForecastLocalDatasourceImpl(this.localStorageAdapter);

  @override
  Future<void> cacheForecast(
    List<ForecastEntity> forecasts,
    String city,
  ) async {
    final localStorage = await localStorageAdapter.openBox(
      Constants.forecastsBox,
    );

    try {
      debugPrint("Storing forecasts for offline...");
      localStorage.put(city, forecasts);
      debugPrint("Forecasts stored in offline cache for $city!");
    } on HiveError catch (e) {
      debugPrint("Hive error occurred: $e");
      throw HiveException(Failure(e.toString()));
    } on CacheException catch (e) {
      debugPrint("Cache error occurred: $e");
      rethrow;
    } on Exception catch (e) {
      debugPrint("Unexpected error occurred: $e");
      throw UnexpectedException(Failure(e.toString()));
    } finally {
      try {
        await localStorage.close();
        debugPrint("Forecasts box closed!");
      } catch (e) {
        debugPrint("Error closing forecasts box: $e");
      }
    }
  }

  @override
  Future<List<ForecastEntity>> offlineForecasts(
    String city,
  ) async {
    final localStorage = await localStorageAdapter.openBox(
      Constants.forecastsBox,
    );

    try {
      final hasLocation = localStorage.containsKey(city);
      debugPrint("Gathering offline forecasts...");

      if (hasLocation) {
        final forecasts = await localStorage.get(city);
        debugPrint("Retrieved offline forecasts for $city!");
        if (forecasts is List<dynamic>) {
          return forecasts.map((e) => e as ForecastEntity).toList();
        } else {
          throw HiveException(Failure(Constants.invalidError));
        }
      } else {
        debugPrint("$city's forecasts are not found offline!");
        throw CacheException(Failure(Constants.offlineError));
      }
    } on HiveError catch (e) {
      debugPrint("Hive error occurred: $e");
      throw HiveException(Failure(e.toString()));
    } on CacheException catch (e) {
      debugPrint("Cache error occurred: $e");
      rethrow;
    } on Exception catch (e) {
      debugPrint("Unexpected error occurred: $e");
      throw UnexpectedException(Failure(e.toString()));
    } finally {
      try {
        await localStorage.close();
        debugPrint("Forecasts box closed!");
      } catch (e) {
        debugPrint("Error closing forecasts box: $e");
      }
    }
  }
}