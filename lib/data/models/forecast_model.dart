import 'package:clean_arch_rock_n_roll/domain/domain.dart';
import 'package:equatable/equatable.dart';

class ForecastModel extends Equatable {
  final int dailyTime;
  final num dailyMinTemp, dailyMaxTemp;
  final String dailyIcon;

  const ForecastModel({
    required this.dailyTime,
    required this.dailyMinTemp,
    required this.dailyMaxTemp,
    required this.dailyIcon,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) => ForecastModel(
        dailyTime: json["dt"],
        dailyMinTemp: json['main']['temp_min'],
        dailyMaxTemp: json['main']['temp_max'],
        dailyIcon: json["weather"][0]["icon"],
      );

  ForecastEntity toEntity() => ForecastEntity(
        dailyTime: dailyTime,
        dailyMinTemp: dailyMinTemp,
        dailyMaxTemp: dailyMaxTemp,
        dailyIcon: dailyIcon,
      );

  @override
  List<Object?> get props => [
        dailyTime,
        dailyMinTemp,
        dailyMaxTemp,
        dailyIcon,
      ];
}