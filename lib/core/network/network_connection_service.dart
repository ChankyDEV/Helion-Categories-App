abstract class NetworkConnectionChecker {
  Future<bool> get isConnected;

  Stream<ConnectionStatus> get onNetworkStatusChange;
}

enum ConnectionStatus { connected, disconnected }
