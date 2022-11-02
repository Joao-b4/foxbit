import 'package:foxbit_hiring_test_template/data/helpers/websocket.dart';
import 'package:foxbit_hiring_test_template/data/models/cryptocurrency_model.dart';
import 'package:foxbit_hiring_test_template/domain/entities/cryptocurrency_entity.dart';
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
  Future<Map> getQuoteByCryptocurrencyId(int cryptocurrencyId) {
    // TODO: implement getQuoteByCryptocurrencyId
    throw UnimplementedError();
  }
}

//todo: mover para constants.dart
class WSEventNameMapper {
  static const getAll = 'getInstruments';
}

void main() {
  CryptocurrencyRepository(FoxbitWebSocket()).getAll();
}
