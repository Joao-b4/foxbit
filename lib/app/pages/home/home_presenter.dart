import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:foxbit_hiring_test_template/data/helpers/websocket.dart';
import 'package:foxbit_hiring_test_template/data/repositories/cryptocurrency_repository.dart';
import 'package:foxbit_hiring_test_template/data/repositories/heartbeat_repository.dart';
import 'package:foxbit_hiring_test_template/domain/entities/cryptocurrency_entity.dart';
import 'package:foxbit_hiring_test_template/domain/entities/cryptocurrency_quote_entity.dart';
import 'package:foxbit_hiring_test_template/domain/usecases/get_all_cryptocurrency_usecase.dart';
import 'package:foxbit_hiring_test_template/domain/usecases/get_cryptocurrency_quote_by_cryptocurrency_id_usecase.dart';
import 'package:foxbit_hiring_test_template/domain/usecases/heartbeat_usecase.dart';

class HomePresenter extends Presenter {
  final FoxbitWebSocket webSocket;
  CryptocurrencyRepository _cryptocurrencyRepository;
  GetAllCryptocurrencyUseCase _getAllCryptocurrencyUseCase;
  GetCryptocurrencyQuoteByCryptocurrencyIdUseCase
      _getCryptocurrencyQuoteByCryptocurrencyIdUseCase;
  final HeartbeatUseCase _heartbeatUseCase =
      HeartbeatUseCase(HeartbeatRepository());

  HomePresenter() : webSocket = FoxbitWebSocket() {
    webSocket.connect();
    _cryptocurrencyRepository = CryptocurrencyRepository(webSocket);
    _getAllCryptocurrencyUseCase =
        GetAllCryptocurrencyUseCase(_cryptocurrencyRepository);
    _getCryptocurrencyQuoteByCryptocurrencyIdUseCase =
        GetCryptocurrencyQuoteByCryptocurrencyIdUseCase(
            _cryptocurrencyRepository);
  }

  Function heartbeatOnComplete;
  Function(dynamic) heartbeatOnError;

  Function getAllCryptocurrencyOnComplete;
  Function(List<CryptocurrencyEntity>) getAllCryptocurrencyOnNext;
  Function(dynamic) getAllCryptocurrencyOnError;

  Function getCryptocurrencyQuoteByCryptocurrencyIdOnComplete;
  Function(CryptocurrencyQuoteEntity)
      getCryptocurrencyQuoteByCryptocurrencyIdOnNext;
  Function(dynamic) getCryptocurrencyQuoteByCryptocurrencyIdOnError;

  void sendHeartbeat() {
    _heartbeatUseCase.execute(_HeartBeatObserver(this), webSocket);
  }

  void getAllCryptocurrency() {
    _getAllCryptocurrencyUseCase.execute(
      _GetAllCryptocurrencyObserver(this),
    );
  }

  void getCryptocurrencyQuoteByCryptocurrencyId(int cryptocurrencyId) {
    _getCryptocurrencyQuoteByCryptocurrencyIdUseCase.execute(
        _GetCryptocurrencyQuoteByCryptocurrencyIdObserver(this),
        GetCryptocurrencyQuoteByCryptocurrencyIdUseCaseParams(
            cryptocurrencyId));
  }

  @override
  void dispose() {
    _heartbeatUseCase.dispose();
    _getAllCryptocurrencyUseCase.dispose();
    _getCryptocurrencyQuoteByCryptocurrencyIdUseCase.dispose();
    webSocket.disconnect();
  }
}

class _HeartBeatObserver implements Observer<void> {
  HomePresenter presenter;

  _HeartBeatObserver(this.presenter);

  @override
  void onNext(_) {}

  @override
  void onComplete() {
    assert(presenter.heartbeatOnComplete != null);
    presenter.heartbeatOnComplete();
  }

  @override
  void onError(dynamic e) {
    assert(presenter.heartbeatOnError != null);
    presenter.heartbeatOnError(e);
  }
}

class _GetAllCryptocurrencyObserver
    implements Observer<List<CryptocurrencyEntity>> {
  HomePresenter presenter;

  _GetAllCryptocurrencyObserver(this.presenter);

  @override
  void onNext(List<CryptocurrencyEntity> data) {
    assert(presenter.getAllCryptocurrencyOnNext != null);
    presenter.getAllCryptocurrencyOnNext(data);
  }

  @override
  void onComplete() {
    assert(presenter.getAllCryptocurrencyOnComplete != null);
    presenter.getAllCryptocurrencyOnComplete();
  }

  @override
  void onError(dynamic e) {
    assert(presenter.getAllCryptocurrencyOnError != null);
    presenter.getAllCryptocurrencyOnError(e);
  }
}

class _GetCryptocurrencyQuoteByCryptocurrencyIdObserver
    implements Observer<CryptocurrencyQuoteEntity> {
  HomePresenter presenter;

  _GetCryptocurrencyQuoteByCryptocurrencyIdObserver(this.presenter);

  @override
  void onNext(CryptocurrencyQuoteEntity data) {
    assert(presenter.getCryptocurrencyQuoteByCryptocurrencyIdOnNext != null);
    presenter.getCryptocurrencyQuoteByCryptocurrencyIdOnNext(data);
  }

  @override
  void onComplete() {
    assert(
        presenter.getCryptocurrencyQuoteByCryptocurrencyIdOnComplete != null);
    presenter.getCryptocurrencyQuoteByCryptocurrencyIdOnComplete();
  }

  @override
  void onError(dynamic e) {
    assert(presenter.getCryptocurrencyQuoteByCryptocurrencyIdOnError != null);
    presenter.getCryptocurrencyQuoteByCryptocurrencyIdOnError(e);
  }
}
