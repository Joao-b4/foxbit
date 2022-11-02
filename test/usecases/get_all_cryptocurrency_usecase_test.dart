import 'package:flutter_test/flutter_test.dart';
import 'package:foxbit_hiring_test_template/data/repositories/cryptocurrency_repository.dart';
import 'package:foxbit_hiring_test_template/domain/entities/cryptocurrency_entity.dart';
import 'package:foxbit_hiring_test_template/domain/usecases/get_all_cryptocurrency_usecase.dart';
import 'package:mockito/mockito.dart';

import '../mocks/get_instruments_mock.dart';
import '../utils/default_test_observer.dart';

class MockCryptocurrencyRepository extends Mock
    implements CryptocurrencyRepository {}

void main() {
  CryptocurrencyRepository repository;
  GetAllCryptocurrencyUseCase usecase;
  DefaultTestObserver<List<CryptocurrencyEntity>> observer;

  setUp(() {
    repository = MockCryptocurrencyRepository();
    usecase = GetAllCryptocurrencyUseCase(repository);
    observer = DefaultTestObserver<List<CryptocurrencyEntity>>();
  });

  test(
      'Validate correct execution and return correct data from repository when GetAllCryptocurrencyUseCase is called with success',
      () async {
    when(repository.getAll()).thenAnswer((_) async => getInstrumentsMock);
    usecase.execute(observer);
    while (!observer.ended) {
      await Future<dynamic>.delayed(const Duration(milliseconds: 10));
    }

    expect(observer.done, true);
    expect(observer.error, false);
    expect(observer.data[0].cryptocurrencyId,
        getInstrumentsMock[0].cryptocurrencyId);
  });

  test(
      'Should return a Exception on observer.error when GetAllCryptocurrencyUseCase is called with error',
      () async {
    when(repository.getAll()).thenThrow(Exception("Generic Error"));
    usecase.execute(observer);
    while (!observer.ended) {
      await Future<dynamic>.delayed(const Duration(milliseconds: 10));
    }

    expect(observer.done, true);
    expect(observer.error, true);
  });
}
