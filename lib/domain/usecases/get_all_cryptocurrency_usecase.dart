import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:foxbit_hiring_test_template/domain/entities/cryptocurrency_entity.dart';
import 'package:foxbit_hiring_test_template/domain/repositories/cryptocurrency_repository.dart';

class GetAllCryptocurrencyUseCase
    extends UseCase<List<CryptocurrencyEntity>, void> {
  GetAllCryptocurrencyUseCase(this._repository);

  final ICryptocurrencyRepository _repository;

  @override
  Future<Stream<List<CryptocurrencyEntity>>> buildUseCaseStream(_) async {
    final StreamController<List<CryptocurrencyEntity>> controller =
        StreamController<List<CryptocurrencyEntity>>();

    try {
      final List<CryptocurrencyEntity> cryptocurrencyEntities =
          await _repository.getAll();
      controller.add(cryptocurrencyEntities);
    } catch (e) {
      controller.addError(e);
    } finally {
      controller.close();
    }

    return Stream.castFrom(controller.stream);
  }
}
