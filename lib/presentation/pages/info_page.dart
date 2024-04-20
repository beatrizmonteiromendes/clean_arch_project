import 'package:clean_arch_rock_n_roll/data/const/constants.dart';
import 'package:clean_arch_rock_n_roll/presentation/helpers/helpers.dart';
import 'package:clean_arch_rock_n_roll/presentation/state/forecast_cubit.dart';
import 'package:clean_arch_rock_n_roll/presentation/state/forecast_state.dart';
import 'package:clean_arch_rock_n_roll/presentation/state/weather_cubit.dart';
import 'package:clean_arch_rock_n_roll/presentation/state/weather_state.dart';
import 'package:clean_arch_rock_n_roll/presentation/theme/theme.dart';
import 'package:clean_arch_rock_n_roll/presentation/widgets/show_title_widget.dart';
import 'package:clean_arch_rock_n_roll/presentation/widgets/weather_forecast_loader_widget.dart';
import 'package:clean_arch_rock_n_roll/presentation/widgets/weather_forecast_widget.dart';
import 'package:clean_arch_rock_n_roll/presentation/widgets/weather_overview_loader_widget.dart';
import 'package:clean_arch_rock_n_roll/presentation/widgets/weather_overview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConcertInfoPage extends StatefulWidget {
  const ConcertInfoPage({
    super.key,
    required this.arguments,
  });

  final Map<String, dynamic> arguments;

  @override
  State<ConcertInfoPage> createState() => _ConcertInfoPageState();
}

class _ConcertInfoPageState extends State<ConcertInfoPage> {
  String? location;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getWeatherData();
  }

  void getWeatherData() {
    final arguments = widget.arguments;
    final latitude = arguments['coordinates']['latitude'].toString();
    final longitude = arguments['coordinates']['longitude'].toString();

    location = arguments['location'];

    context.read<WeatherCubit>().getWeather(latitude, longitude, location!);
    context.read<ForecastCubit>().getForecast(latitude, longitude, location!);
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(isMobile ? 18 : 56),
          child: Column(
            children: [
              ConcertTitle(city: location!),
              SizedBox(height: isMobile ? 26 : 46),
              BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherLoading) {
                    return const WeatherOverviewLoader();
                  } else if (state is WeatherLoaded) {
                    final weather = state.result;

                    return WeatherOverview(
                      icon: weather.iconCode,
                      condition: weather.description,
                      temperature: weather.temperature.toString(),
                      humidity: weather.humidity.toString(),
                      wind: weather.wind,
                      feelsLike: weather.feelsLike,
                    );
                  } else if (state is WeatherError) {
                    return WidgetHelper.error(state.message);
                  } else {
                    return WidgetHelper.error(Constants.unknownError);
                  }
                },
              ),
              SizedBox(height: isMobile ? 32 : 48),
              BlocBuilder<ForecastCubit, ForecastState>(
                builder: (context, state) {
                  if (state is ForecastLoading) {
                    return const WeatherForecastLoader();
                  } else if (state is ForecastLoaded) {
                    return WeatherForecast(forecast: state.result);
                  } else if (state is ForecastError) {
                    return WidgetHelper.error(state.message);
                  } else {
                    return WidgetHelper.error(Constants.unknownError);
                  }
                },
              ),
              const SizedBox(height: 14),
              Text(
                "Weather for $location",
                style: AppTextTheme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}