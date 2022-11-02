import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:foxbit_hiring_test_template/domain/entities/cryptocurrency_quote_entity.dart';
import 'package:foxbit_hiring_test_template/domain/repositories/cryptocurrency_repository.dart';

class GetCryptocurrencyQuoteByCryptocurrencyIdUseCase extends UseCase<
    CryptocurrencyQuoteEntity,
    GetCryptocurrencyQuoteByCryptocurrencyIdUseCaseParams> {
  GetCryptocurrencyQuoteByCryptocurrencyIdUseCase(this._repository);

  final ICryptocurrencyRepository _repository;

  @override
  Future<Stream<CryptocurrencyQuoteEntity>> buildUseCaseStream(
      GetCryptocurrencyQuoteByCryptocurrencyIdUseCaseParams params) async {
    final StreamController<CryptocurrencyQuoteEntity> streamController =
        StreamController();

    try {
      final Stream<CryptocurrencyQuoteEntity> cryptocurrencyQuoteStream =
          _repository.subscribeCryptocurrencyQuoteByCryptocurrencyId(
              params.cryptocurrencyId);
      streamController.addStream(cryptocurrencyQuoteStream);
    } catch (e) {
      streamController.addError(e);
    }
    //  finally {
    //   streamController.close();
    // }
    return streamController.stream;
  }
}

class GetCryptocurrencyQuoteByCryptocurrencyIdUseCaseParams {
  final int cryptocurrencyId;

  GetCryptocurrencyQuoteByCryptocurrencyIdUseCaseParams(this.cryptocurrencyId);
}
