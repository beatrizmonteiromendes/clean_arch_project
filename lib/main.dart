import 'package:clean_arch_rock_n_roll/app.dart';
import 'package:clean_arch_rock_n_roll/infra/adapters/forecast_adapter.dart';
import 'package:clean_arch_rock_n_roll/infra/adapters/weather_adapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injectors
  var di;
  di.init();

  // Initialize hive and register adapters - for offline support
  await Hive.initFlutter();
  Hive.registerAdapter(WeatherAdapter());
  Hive.registerAdapter(ForecastAdapter());

  // Initialize screen utils - for responsiveness
  await ScreenUtil.ensureScreenSize();

  runApp(const RockAndRoll());
}

