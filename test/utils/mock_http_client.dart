import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockHttpClient extends Mock implements http.Client {
  @override
  Future<http.Response> get(Uri? url, {Map<String, String>? headers}) {
    return super.noSuchMethod(
      Invocation.method(#get, [
        url
      ], {
        #headers: headers,
      }),
      returnValue: Future.value(http.Response('', 200)),
      returnValueForMissingStub: Future.value(http.Response('', 200)),
    );
  }
}
