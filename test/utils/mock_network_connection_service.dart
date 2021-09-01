import 'package:helion/services/network/network_connection_service.dart';
import 'package:mockito/mockito.dart';

class MockNetworkConnectionService extends Mock
    implements NetworkConnectionService {
  @override
  Future<bool> get isConnected => super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: Future.value(true),
        returnValueForMissingStub: Future.value(true),
      );
}
