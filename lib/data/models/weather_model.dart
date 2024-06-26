import 'package:clean_arch_rock_n_roll/domain/domain.dart';
import 'package:equatable/equatable.dart';



class WeatherModel extends Equatable {
  final double lon, lat, wind, feelsLike;
  final String main, iconCode;
  final String description;
  final int temperature, humidity;

  const WeatherModel({
    required this.lon,
    required this.lat,
    required this.wind,
    required this.feelsLike,
    required this.main,
    required this.description,
    required this.iconCode,
    required this.temperature,
    required this.humidity,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      lat: json['coord']["lat"],
      lon: json['coord']["lon"],
      wind: json['wind']['speed'],
      feelsLike: json['main']['feels_like'],
      main: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      iconCode: json['weather'][0]['icon'],
      temperature: json['main']['temp'].round(),
      humidity: json['main']['humidity'],
    );
  }

  WeatherEntity toEntity() {
    return WeatherEntity(
      lat: lat,
      lon: lon,
      wind: wind,
      feelsLike: feelsLike,
      main: main,
      description: description,
      iconCode: iconCode,
      temperature: temperature,
      humidity: humidity,
    );
  }

  @override
  List<Object> get props => [
        lon,
        lat,
        wind,
        main,
        feelsLike,
        description,
        iconCode,
        temperature,
        humidity,
      ];
}