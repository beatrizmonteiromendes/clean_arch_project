import 'package:clean_arch_rock_n_roll/domain/entities/weather_entity.dart';
import 'package:equatable/equatable.dart';


abstract class WeatherState extends Equatable {
  const WeatherState();
  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherEntity result;
  const WeatherLoaded(this.result);

  @override
  List<Object> get props => [result];
}

class WeatherError extends WeatherState {
  final String message;
  const WeatherError(this.message);

  @override
  List<Object> get props => [message];
}