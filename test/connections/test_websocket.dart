import 'dart:async';

import 'package:foxbit_hiring_test_template/data/helpers/websocket.dart';
import 'package:foxbit_hiring_test_template/data/repositories/cryptocurrency_repository.dart';

import '../mocks/get_instruments_mock.dart';

class TestFoxbitWebSocket extends FoxbitWebSocket {
  List<String> sendedMessages = [];

  final Map responses = {
    // ignore: unnecessary_string_escapes
    'PING': '{"m": 0, "i": 0, "n": "Ping", "o": "{\\\"msg\\\":\\\"PONG\\\"}" }',
    WSEventNameMapper.getAll: getInstrumentsResponseMock
  };

  @override
  void send(String method, dynamic objectData) {
    prepareMessage(method, objectData);

    final response = responses[method];
    if (response != null) {
      Timer(const Duration(milliseconds: 50), () {
        onMessage(response);
      });
    }
  }

  @override
  String prepareMessage(String method, dynamic objectData) {
    final String message = super.prepareMessage(method, objectData);
    sendedMessages.add(message);
    return message;
  }
}
