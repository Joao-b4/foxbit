import 'package:foxbit_hiring_test_template/domain/entities/cryptocurrency_entity.dart';

abstract class ICryptocurrencyRepository {
  Future<List<CryptocurrencyEntity>> getAll();
  Future<Map> getQuoteByCryptocurrencyId(int cryptocurrencyId);
}
