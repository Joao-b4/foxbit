import 'package:flutter_test/flutter_test.dart';
import 'package:foxbit_hiring_test_template/data/repositories/cryptocurrency_repository.dart';
import 'package:foxbit_hiring_test_template/domain/entities/cryptocurrency_entity.dart';

import '../connections/test_websocket.dart';
import '../mocks/empty_response_mock.dart';
import '../utils/default_test_observer.dart';

void main() {
  TestFoxbitWebSocket webSocket;
  CryptocurrencyRepository repository;
  DefaultTestObserver observer;

  setUp(() {
    webSocket = TestFoxbitWebSocket();
    webSocket.connect();
    repository = CryptocurrencyRepository(webSocket);
    observer = DefaultTestObserver();
  });

  tearDown(() {
    webSocket.disconnect();
  });

  group("GetAll Tests", () {
    test(
        'Should return a CryptocurrencyEntity list with the size of a single CryptocurrencyEntity when getAll is called with success',
        () async {
      final List<CryptocurrencyEntity> result = await repository.getAll();

      expect(result.length, 1);
      expect(result[0].cryptocurrencyId, 1);
    });

    test('Should return a Exception when getAll is called with error',
        () async {
      webSocket.responses[WSEventNameMapper.getAll] =
          mountEmptyResponse(WSEventNameMapper.getAll, webSocket.id);
      expect(() async => repository.getAll(), throwsException);
    });
  });
}
