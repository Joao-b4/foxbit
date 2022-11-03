import 'package:flutter_test/flutter_test.dart';
import 'package:foxbit_hiring_test_template/data/models/cryptocurrency_quote_model.dart';
import 'package:foxbit_hiring_test_template/domain/entities/cryptocurrency_quote_entity.dart';

import '../../mocks/subscribe_level1_mock.dart';

void main() {
  final CryptocurrencyQuoteModel model = CryptocurrencyQuoteModel(
      instrumentId: 1,
      lastTradedPx: 125,
      rolling24HrPxChange: 203,
      rolling24HrVolume: 223);

  test('Should be a subclass of CryptocurrencyQuoteEntity', () {
    expect(model, isA<CryptocurrencyQuoteEntity>());
  });

  test('Should return an int as hashcode', () {
    expect(model.hashCode, isA<int>());
  });

  test('Should instantiate a copy with values ​​different from the original',
      () {
    final model2 = model.copyWith(instrumentId: 2);
    expect(model2, isA<CryptocurrencyQuoteModel>());
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
        CryptocurrencyQuoteModel.fromMap(getSubscribeLeve1ResponseFieldMock);
    expect(result, isA<CryptocurrencyQuoteModel>());
    expect(result.instrumentId, 2);
  });

  test(
      'Should return a string containing the values ​​of the attributes in toString',
      () {
    final toString = model.toString();
    expect(toString.contains("${model.instrumentId}"), true);
    expect(toString.contains("${model.lastTradedPx}"), true);
    expect(toString.contains("${model.rolling24HrPxChange}"), true);
    expect(toString.contains("${model.rolling24HrVolume}"), true);
  });

  test('Should return a string in JSON format', () {
    final jsonString = model.toJson();
    final result = CryptocurrencyQuoteModel.fromJson(jsonString);
    expect(result == model, true);
  });
}
