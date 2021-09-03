import 'package:flutter/material.dart';
import 'package:helion/core/network/network_connection_service.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkConnectionCheckerImpl implements NetworkConnectionChecker {
  final InternetConnectionChecker _internetConnectionChecker;

  NetworkConnectionCheckerImpl(this._internetConnectionChecker);

  @override
  Future<bool> get isConnected => _internetConnectionChecker.hasConnection;

  @override
  Stream<ConnectionStatus> get onNetworkStatusChange =>
      _internetConnectionChecker.onStatusChange.map(
        (status) => networkStatusConverter(status),
      );

  @visibleForTesting
  ConnectionStatus networkStatusConverter(InternetConnectionStatus status) {
    List<ConnectionStatus> possibleStatus = [
      ConnectionStatus.connected,
      ConnectionStatus.disconnected,
    ];
    return possibleStatus[status.index];
  }
}
