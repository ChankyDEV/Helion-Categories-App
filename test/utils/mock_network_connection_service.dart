import 'package:helion/core/network/network_connection_service.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/mockito.dart';

class MockNetworkConnectionChecker extends Mock
    implements NetworkConnectionChecker {
  @override
  Future<bool> get isConnected => super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: Future.value(true),
        returnValueForMissingStub: Future.value(true),
      );
}

class MockInternetConnectionChecker extends Mock
    implements InternetConnectionChecker {
  @override
  Future<bool> get hasConnection => super.noSuchMethod(
        Invocation.getter(#hasConnection),
        returnValue: Future.value(true),
        returnValueForMissingStub: Future.value(true),
      );
}
