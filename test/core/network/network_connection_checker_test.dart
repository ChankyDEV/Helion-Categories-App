import 'package:flutter_test/flutter_test.dart';
import 'package:helion/core/network/network_connection_service_impl.dart';
import 'package:mockito/mockito.dart';

import '../../utils/mock_network_connection_service.dart';

void main() {
  late final NetworkConnectionCheckerImpl connectionChecker;
  late final MockInternetConnectionChecker mockInternetConnectionChecker;

  setUp(() {
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
}
