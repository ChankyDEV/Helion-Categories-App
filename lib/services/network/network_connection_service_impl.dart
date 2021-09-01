import 'package:helion/services/network/network_connection_service.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkConnectionServiceImpl implements NetworkConnectionService {
  final InternetConnectionChecker _internetConnectionChecker;

  NetworkConnectionServiceImpl(this._internetConnectionChecker);

  @override
  Future<bool> get isConnected => _internetConnectionChecker.hasConnection;
}
