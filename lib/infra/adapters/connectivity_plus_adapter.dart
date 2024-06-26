import 'package:clean_arch_rock_n_roll/infra/adapters/connectivity_dapter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


class ConnectivityPlusAdapter implements ConnectivityAdapter {
  final Connectivity _connectivity;
  ConnectivityPlusAdapter(this._connectivity);

  @override
  Future<bool> isConnected() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}