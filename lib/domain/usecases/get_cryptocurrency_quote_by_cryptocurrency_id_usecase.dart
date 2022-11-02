import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:foxbit_hiring_test_template/domain/repositories/cryptocurrency_repository.dart';

class GetCryptocurrencyQuoteByCryptocurrencyIdUseCase
    extends CompletableUseCase<
        GetCryptocurrencyQuoteByCryptocurrencyIdUseCaseParams> {
  GetCryptocurrencyQuoteByCryptocurrencyIdUseCase(this._repository);

  final ICryptocurrencyRepository _repository;

  @override
  Future<Stream<void>> buildUseCaseStream(
      GetCryptocurrencyQuoteByCryptocurrencyIdUseCaseParams params) async {
    final StreamController<void> controller = StreamController<void>();

    try {
      final Map _ =
          await _repository.getQuoteByCryptocurrencyId(params.cryptocurrencyId);

      controller.close();
    } catch (e) {
      controller.addError(e);
    }

    return controller.stream;
  }
}

class GetCryptocurrencyQuoteByCryptocurrencyIdUseCaseParams {
  final int cryptocurrencyId;

  GetCryptocurrencyQuoteByCryptocurrencyIdUseCaseParams(this.cryptocurrencyId);
}
