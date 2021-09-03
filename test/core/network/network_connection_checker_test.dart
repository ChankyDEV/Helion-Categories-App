import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:helion/core/network/network_connection_service.dart';
import 'package:helion/core/network/network_connection_service_impl.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/mockito.dart';

import '../../utils/mock_network_connection_service.dart';

void main() {
  late final NetworkConnectionCheckerImpl connectionChecker;
  late final MockInternetConnectionChecker mockInternetConnectionChecker;

  setUpAll(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    connectionChecker =
        NetworkConnectionCheckerImpl(mockInternetConnectionChecker);
  });

  test('should forward the call to InternetConnectionChecker.hasConnection ',
      () async {
    final tHasConnectionFuture = Future.value(true);

    when(mockInternetConnectionChecker.hasConnection)
        .thenAnswer((_) => tHasConnectionFuture);

    final result = connectionChecker.isConnected;

    verify(mockInternetConnectionChecker.hasConnection);
    expect(
      result,
      tHasConnectionFuture,
    );
  });

  test(
      'should emit ConnectionState.connected on InternetConnectionStatus.connected',
      () async {
    final controller = StreamController<InternetConnectionStatus>();
    when(mockInternetConnectionChecker.onStatusChange).thenAnswer(
      (_) => controller.stream,
    );
    final stream = connectionChecker.onNetworkStatusChange;
    expectLater(
      stream,
      emits(ConnectionStatus.connected),
    );
    controller.add(InternetConnectionStatus.connected);
    controller.close();
  });

  test(
      'should emit ConnectionState.disconnected on InternetConnectionStatus.disconnected',
      () async {
    final controller = StreamController<InternetConnectionStatus>();
    when(mockInternetConnectionChecker.onStatusChange).thenAnswer(
      (_) => controller.stream,
    );
    final stream = connectionChecker.onNetworkStatusChange;
    expectLater(
      stream,
      emits(ConnectionStatus.disconnected),
    );
    controller.add(InternetConnectionStatus.disconnected);
    controller.close();
  });
}
