import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:foxbit_hiring_test_template/app/pages/home/home_presenter.dart';
import 'package:foxbit_hiring_test_template/app/utils/application_utils.dart';
import 'package:foxbit_hiring_test_template/domain/entities/cryptocurrency_entity.dart';
import 'package:foxbit_hiring_test_template/domain/entities/cryptocurrency_quote_entity.dart';

class HomeController extends Controller {
  final HomePresenter presenter;

  HomeController() : presenter = HomePresenter() {
    presenter.sendHeartbeat();
    presenter.getAllCryptocurrency();
  }

  List<CryptocurrencyEntity> cryptocurrencyEntities = [];
  Map<int, CryptocurrencyQuoteEntity> cryptocurrencyQuotesEntitiesCachedById =
      {};
  bool _cryptocurrencyQuoteAlreadyLoaded = false;

  @override
  void onDisposed() {
    presenter.dispose();
    super.onDisposed();
  }

  @override
  void initListeners() {
    presenter.heartbeatOnComplete = heartbeatOnComplete;
    presenter.heartbeatOnError = heartbeatOnError;
    presenter.getAllCryptocurrencyOnComplete = getAllCryptocurrencyOnComplete;
    presenter.getAllCryptocurrencyOnError = getAllCryptocurrencyOnError;
    presenter.getAllCryptocurrencyOnNext = getAllCryptocurrencyOnNext;
    presenter.getCryptocurrencyQuoteByCryptocurrencyIdOnComplete =
        getCryptocurrencyQuoteByCryptocurrencyIdOnComplete;
    presenter.getCryptocurrencyQuoteByCryptocurrencyIdOnError =
        getCryptocurrencyQuoteByCryptocurrencyIdOnError;
    presenter.getCryptocurrencyQuoteByCryptocurrencyIdOnNext =
        getCryptocurrencyQuoteByCryptocurrencyIdOnNext;
  }

  void getAllCryptocurrencyOnComplete() {
    debugPrint("[getAllCryptocurrencyOnComplete]");
  }

  void getAllCryptocurrencyOnError(dynamic e) {
    debugPrint("[getAllCryptocurrencyOnError] $e");
    ScaffoldMessenger.of(getStateKey().currentContext).showSnackBar(
        const SnackBar(
            duration: Duration(seconds: 10),
            content: Text('Não foi possível recuperar as moedas')));
  }

  void getAllCryptocurrencyOnNext(
      List<CryptocurrencyEntity> cryptocurrencyEntitiesData) {
    debugPrint("[getAllCryptocurrencyOnNext] $cryptocurrencyEntitiesData");

    cryptocurrencyEntities = cryptocurrencyEntitiesData
        .where((cryptocurrencyEntity) => ApplicationUtils
            .cryptocurrencyIdsVisibles
            .contains(cryptocurrencyEntity.cryptocurrencyId))
        .toList();

    cryptocurrencyEntities.sort((a, b) => ApplicationUtils
        .cryptocurrencyIdsSorted
        .indexOf(a.cryptocurrencyId)
        .compareTo(ApplicationUtils.cryptocurrencyIdsSorted
            .indexOf(b.cryptocurrencyId)));

    for (final cryptocurrency in cryptocurrencyEntities) {
      presenter.getCryptocurrencyQuoteByCryptocurrencyId(
          cryptocurrency.cryptocurrencyId);
    }
    refreshUI();
    _schedulePeriodicUIRefresh();
  }

  void getCryptocurrencyQuoteByCryptocurrencyIdOnComplete() {
    debugPrint("[getCryptocurrencyQuoteByCryptocurrencyIdOnComplete]");
  }

  void getCryptocurrencyQuoteByCryptocurrencyIdOnError(dynamic e) {
    ScaffoldMessenger.of(getStateKey().currentContext).showSnackBar(
        const SnackBar(
            duration: Duration(seconds: 10),
            content: Text('Não foi possível recuperar a cotação')));
  }

  void getCryptocurrencyQuoteByCryptocurrencyIdOnNext(
      CryptocurrencyQuoteEntity cryptocurrencyQuoteEntityData) {
    cryptocurrencyQuotesEntitiesCachedById[cryptocurrencyQuoteEntityData
        .crytocurrencyId] = cryptocurrencyQuoteEntityData;

    if (_cryptocurrencyQuoteAlreadyLoaded == false) {
      refreshUI();
      _cryptocurrencyQuoteAlreadyLoaded = true;
    }
  }

  void heartbeatOnComplete() {
    _scheduleNextHeartbeat();
  }

  void heartbeatOnError(dynamic e) {
    ScaffoldMessenger.of(getStateKey().currentContext).showSnackBar(
        const SnackBar(
            duration: Duration(seconds: 10),
            content: Text('Não foi possível enviar a mensagem: [PING]')));

    _scheduleNextHeartbeat();
  }

  void _scheduleNextHeartbeat() {
    Timer(const Duration(seconds: 30), () {
      presenter.sendHeartbeat();
    });
  }

  void _schedulePeriodicUIRefresh() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      refreshUI();
    });
  }
}
