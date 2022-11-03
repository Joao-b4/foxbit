import 'package:flutter_test/flutter_test.dart';
import 'package:foxbit_hiring_test_template/data/models/cryptocurrency_model.dart';
import 'package:foxbit_hiring_test_template/domain/entities/cryptocurrency_entity.dart';

import '../../mocks/get_instruments_mock.dart';

void main() {
  final CryptocurrencyModel model =
      CryptocurrencyModel(instrumentId: 1, product1Symbol: "BTC", sortIndex: 0);

  test('Should be a subclass of CryptocurrencyEntity', () {
    expect(model, isA<CryptocurrencyEntity>());
  });

  test('Should return an int as hashcode', () {
    expect(model.hashCode, isA<int>());
  });

  test('Should instantiate a copy with values ​​different from the original',
      () {
    final model2 = model.copyWith(instrumentId: 2);
    expect(model2, isA<CryptocurrencyModel>());
    expect(model2.instrumentId, 2);
  });

  test(
      'Should return true when compared to another object with the same attribute values',
      () {
    final model2 = model.copyWith();
    expect(model == model2, true);
  });

  test('Should return a valid object when parsing an API response JSON', () {
    final result =
        CryptocurrencyModel.fromListMap(getInstrumentsResponseFieldMock);
    expect(result, isA<List<CryptocurrencyModel>>());
    expect(result[0].cryptocurrencyId, 1);
  });

  test(
      'Should return a string containing the values ​​of the attributes in toString',
      () {
    final toString = model.toString();
    expect(toString.contains("${model.instrumentId}"), true);
    expect(toString.contains(model.product1Symbol), true);
    expect(toString.contains("${model.sortIndex}"), true);
  });

  test('Should return a string in JSON format', () {
    final jsonString = model.toJson();
    final result = CryptocurrencyModel.fromJson(jsonString);
    expect(result == model, true);
  });
}
