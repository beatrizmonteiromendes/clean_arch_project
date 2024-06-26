

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:clean_arch_rock_n_roll/data/const/api.dart';
import 'package:clean_arch_rock_n_roll/data/const/constants.dart';
import 'package:clean_arch_rock_n_roll/data/data.dart';
import 'package:clean_arch_rock_n_roll/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

abstract class WeatherRemoteDatasource {
  Future<WeatherModel> getWeather(String lat, String lon);
}

abstract class ForecastRemoteDatasource {
  Future<List<ForecastModel>> getForecast(String lat, String lon);
}

class WeatherRemoteDatasourceImpl implements WeatherRemoteDatasource {
  final Client client;
  const WeatherRemoteDatasourceImpl(this.client);

  @override
  Future<WeatherModel> getWeather(
    String lat,
    String lon,
  ) async {
    try {
      final response = await client.get(
        Uri.parse(ApiUrls.weather(lat, lon)),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
      );

      final data = json.decode(response.body);

      if (response.statusCode != 200) {
        debugPrint(response.body.toString());
        throw ServerException(Failure(Constants.weatherServerError));
      } else {
        return WeatherModel.fromJson(data);
      }
    } on SocketException {
      throw NetworkException(Failure(Constants.lostConnection));
    } on TimeoutException {
      throw NetworkException(Failure(Constants.connectionTimeout));
    } on ServerException catch (_) {
      rethrow;
    } catch (e) {
      throw UnexpectedException(Failure(e.toString()));
    }
  }
}

class ForecastRemoteDatasourceImpl implements ForecastRemoteDatasource {
  final Client client;

  const ForecastRemoteDatasourceImpl(this.client);

  @override
  Future<List<ForecastModel>> getForecast(
    String lat,
    String lon,
  ) async {
    try {
      final response = await client.get(
        Uri.parse(ApiUrls.forecast(lat, lon)),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
      );

      final data = json.decode(response.body);

      if (response.statusCode != 200) {
        throw ServerException(Failure(Constants.forecastsServerError));
      } else {
        final List forecasts = data['list'];
        return forecasts.map((f) => ForecastModel.fromJson(f)).toList();
      }
    } on SocketException {
      throw NetworkException(Failure(Constants.lostConnection));
    } on TimeoutException {
      throw NetworkException(Failure(Constants.connectionTimeout));
    } on ServerException catch (_) {
      rethrow;
    } catch (e) {
      throw UnexpectedException(Failure(e.toString()));
    }
  }
}