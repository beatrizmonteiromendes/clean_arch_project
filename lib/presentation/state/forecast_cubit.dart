import 'package:clean_arch_rock_n_roll/domain/domain.dart';
import 'package:clean_arch_rock_n_roll/infra/adapters/connectivity_dapter.dart';
import 'package:clean_arch_rock_n_roll/presentation/state/forecast_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ForecastCubit extends Cubit<ForecastState> {
  final ForecastUsecase _forecastUsecase;
  final CacheForecastUseCase _cacheForecastUsecase;
  final OfflineForecastUsecase _offlineForecastUsecase;
  final ConnectivityAdapter _connectivityAdapter;

  ForecastCubit(
    this._forecastUsecase,
    this._cacheForecastUsecase,
    this._offlineForecastUsecase,
    this._connectivityAdapter,
  ) : super(ForecastInitial());

  Future<void> getForecast(String lat, String lon, String city) async {
    emit(ForecastLoading());

    try {
      final hasInternet = await _connectivityAdapter.isConnected();

      if (hasInternet) {
        debugPrint("Internet connection is available!");
        final result = await _forecastUsecase.execute(lat, lon);
        _cacheForecast(result, city);
      } else {
        debugPrint("Internet connection is unavailable!");
        final result = await _offlineForecastUsecase.execute(city);
        _emitForecastState(result);
      }
    } catch (error) {
      emit(ForecastError(error.toString()));
    }
  }

  void _cacheForecast(
    Either<Failure, List<ForecastEntity>> result,
    String city,
  ) async {
    _emitForecastState(result);

    result.fold(
      (failure) => ForecastError(failure.message), // Handle failure silently
      (forecast) => _cacheForecastUsecase.execute(forecast, city),
    );
  }

  void _emitForecastState(Either<Failure, List<ForecastEntity>> result) {
    emit(
      result.fold(
        (failure) => ForecastError(failure.message),
        (forecast) => ForecastLoaded(forecast),
      ),
    );
  }
}