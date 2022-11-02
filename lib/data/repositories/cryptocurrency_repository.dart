import 'package:foxbit_hiring_test_template/data/helpers/websocket.dart';
import 'package:foxbit_hiring_test_template/data/models/cryptocurrency_model.dart';
import 'package:foxbit_hiring_test_template/data/models/cryptocurrency_quote_model.dart';
import 'package:foxbit_hiring_test_template/domain/entities/cryptocurrency_entity.dart';
import 'package:foxbit_hiring_test_template/domain/entities/cryptocurrency_quote_entity.dart';
import 'package:foxbit_hiring_test_template/domain/repositories/cryptocurrency_repository.dart';

class CryptocurrencyRepository implements ICryptocurrencyRepository {
  CryptocurrencyRepository(this._websocket);

  final FoxbitWebSocket _websocket;

  @override
  Future<List<CryptocurrencyEntity>> getAll() async {
    try {
      _websocket.send(WSEventNameMapper.getAll, {});
      //todo: criar extensão para o .stream que faça firstWhere
      final Map resultMap = await _websocket.stream.firstWhere((message) =>
          message['n'].toString().toUpperCase() ==
              WSEventNameMapper.getAll.toUpperCase() &&
          message['i'] == _websocket.lastId);
      final List<Map> resultListCryptocurrencyMap =
          (resultMap["o"] as List).cast<Map>();

      return CryptocurrencyModel.fromListMap(resultListCryptocurrencyMap);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Stream<CryptocurrencyQuoteEntity>
      subscribeCryptocurrencyQuoteByCryptocurrencyId(int cryptocurrencyId) {
    try {
      _websocket.send(
          WSEventNameMapper.subscribeCryptocurrencyQuoteByCryptocurrencyId[0],
          {"InstrumentId": cryptocurrencyId});
      //todo: criar extensão para o .stream que faça firstWhere
      final resultFiltered = _websocket.stream.where((message) {
        return WSEventNameMapper.subscribeCryptocurrencyQuoteByCryptocurrencyId
            .contains(message['n'].toString());
      });

      final resultMapToResponse = resultFiltered.map((map) => map['o'] as Map);

      final streamMappedToCryptocurrencyQuoteModel = resultMapToResponse
          .map((map) => CryptocurrencyQuoteModel.fromMap(map));

      return streamMappedToCryptocurrencyQuoteModel;
    } catch (error) {
      throw Exception(error);
    }
  }
}

//todo: mover para constants.dart
class WSEventNameMapper {
  static const getAll = 'getInstruments';
  static const subscribeCryptocurrencyQuoteByCryptocurrencyId = [
    'SubscribeLevel1',
    'Level1UpdateEvent'
  ];
}
