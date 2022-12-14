import 'package:foxbit_hiring_test_template/domain/entities/cryptocurrency_entity.dart';
import 'package:foxbit_hiring_test_template/domain/entities/cryptocurrency_quote_entity.dart';

abstract class ICryptocurrencyRepository {
  Future<List<CryptocurrencyEntity>> getAll();
  Stream<CryptocurrencyQuoteEntity> getCryptocurrencyQuoteByCryptocurrencyId(
      int cryptocurrencyId);
}
