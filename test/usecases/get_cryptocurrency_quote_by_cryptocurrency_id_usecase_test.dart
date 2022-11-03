import 'package:flutter_test/flutter_test.dart';
import 'package:foxbit_hiring_test_template/data/repositories/cryptocurrency_repository.dart';
import 'package:foxbit_hiring_test_template/domain/entities/cryptocurrency_quote_entity.dart';
import 'package:foxbit_hiring_test_template/domain/usecases/get_cryptocurrency_quote_by_cryptocurrency_id_usecase.dart';
import 'package:mockito/mockito.dart';

import '../mocks/subscribe_level1_mock.dart';
import '../utils/default_test_observer.dart';

class MockCryptocurrencyRepository extends Mock
    implements CryptocurrencyRepository {}

void main() {
  CryptocurrencyRepository repository;
  GetCryptocurrencyQuoteByCryptocurrencyIdUseCase usecase;
  GetCryptocurrencyQuoteByCryptocurrencyIdUseCaseParams params;
  DefaultTestObserver<CryptocurrencyQuoteEntity> observer;

  setUp(() {
    repository = MockCryptocurrencyRepository();
    usecase = GetCryptocurrencyQuoteByCryptocurrencyIdUseCase(repository);
    params = GetCryptocurrencyQuoteByCryptocurrencyIdUseCaseParams(1);
    observer = DefaultTestObserver<CryptocurrencyQuoteEntity>();
  });

  test(
      'Validate correct execution and return correct data from repository when GetCryptocurrencyQuoteByCryptocurrencyIdUseCase is called with success',
      () async {
    when(repository
            .getCryptocurrencyQuoteByCryptocurrencyId(params.cryptocurrencyId))
        .thenAnswer((_) => Stream.value(getSubscribeLeve1Mock));
    usecase.execute(observer, params);
    while (!observer.ended) {
      await Future<dynamic>.delayed(const Duration(milliseconds: 10));
    }

    expect(observer.done, true);
    expect(observer.error, false);
    expect(observer.data, isA<CryptocurrencyQuoteEntity>());
  });

  test(
      'Should return a Exception on observer.error when GetCryptocurrencyQuoteByCryptocurrencyIdUseCase is called with error',
      () async {
    when(repository
            .getCryptocurrencyQuoteByCryptocurrencyId(params.cryptocurrencyId))
        .thenThrow(Exception("Generic Error"));
    usecase.execute(observer, params);
    while (!observer.ended) {
      await Future<dynamic>.delayed(const Duration(milliseconds: 10));
    }

    // expect(observer.done, true);
    expect(observer.error, true);
  });
}
