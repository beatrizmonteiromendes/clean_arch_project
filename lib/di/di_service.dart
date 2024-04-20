import 'package:clean_arch_rock_n_roll/data/datasources/datasources.dart';
import 'package:clean_arch_rock_n_roll/domain/domain.dart';
import 'package:clean_arch_rock_n_roll/infra/adapters/connectivity_dapter.dart';
import 'package:clean_arch_rock_n_roll/infra/adapters/connectivity_plus_adapter.dart';
import 'package:clean_arch_rock_n_roll/infra/adapters/local_storage_adapter.dart';
import 'package:clean_arch_rock_n_roll/presentation/state/forecast_cubit.dart';
import 'package:clean_arch_rock_n_roll/presentation/state/weather_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import '../../data/repositories/local_repository_impl.dart';
import '../../data/repositories/remote_repository_impl.dart';



final sl = GetIt.instance; // the service locator(sl)

void regFactory<T extends Object>(T Function() factFunc) {
  sl.registerFactory(factFunc);
}

void regSingleton<T extends Object>(T Function() factFunc) {
  sl.registerLazySingleton(factFunc);
}

void init() {
  // can have a separate methods as app scales
  regSingleton(
    () => WeatherCubit(sl(), sl(), sl(), sl()),
  );
  regSingleton<WeatherUsecase>(
    () => WeatherUsecaseImpl(sl()),
  );
  regSingleton<CacheWeatherUsecase>(
    () => CacheWeatherUsecaseImpl(sl()),
  );
  regSingleton<OfflineWeatherUsecase>(
    () => OfflineWeatherUsecaseImpl(sl()),
  );

  regSingleton(
    () => ForecastCubit(sl(), sl(), sl(), sl()),
  );
  regSingleton<ForecastUsecase>(
    () => ForecastUsecaseImpl(sl()),
  );
  regSingleton<CacheForecastUseCase>(
    () => CacheForecastUseCaseImpl(sl()),
  );
  regSingleton<OfflineForecastUsecase>(
    () => OfflineForecastUsecaseImpl(sl()),
  );

  regSingleton<ConnectivityAdapter>(
    () => ConnectivityPlusAdapter(Connectivity()),
  );

  regSingleton<WeatherLocalRepository>(
    () => WeatherLocalRepositoryImpl(sl()),
  );
  regSingleton<ForecastLocalRepository>(
    () => ForecastLocalRepositoryImpl(sl()),
  );
  regSingleton<ForecastRemoteRepository>(
    () => ForecastRemoteRepositoryImpl(sl()),
  );
  regSingleton<WeatherRemoteRepository>(
    () => WeatherRemoteRepositoryImpl(sl()),
  );

  regSingleton<WeatherLocalDatasource>(
    () => WeatherLocalDatasourceImpl(sl()),
  );
  regSingleton<ForecastLocalDatasource>(
    () => ForecastLocalDatasourceImpl(sl()),
  );
  regSingleton<WeatherRemoteDatasource>(
    () => WeatherRemoteDatasourceImpl(sl()),
  );
  regSingleton<ForecastRemoteDatasource>(
    () => ForecastRemoteDatasourceImpl(sl()),
  );
  regSingleton<LocalStorageAdapter>(
    () => HiveLocalStorageAdapter(),
  );
  regSingleton(
    () => http.Client(),
  );
}