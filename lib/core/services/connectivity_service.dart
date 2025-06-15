import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  Stream<List<ConnectivityResult>> get connectivityStream => _connectivity.onConnectivityChanged ;
  Future<List<ConnectivityResult>> get currentConnectivity => _connectivity.checkConnectivity();
}
