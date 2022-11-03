// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:foxbit_hiring_test_template/domain/entities/cryptocurrency_quote_entity.dart';

class CryptocurrencyQuoteModel extends CryptocurrencyQuoteEntity {
  CryptocurrencyQuoteModel({
    this.instrumentId,
    this.lastTradedPx,
    this.rolling24HrVolume,
    this.rolling24HrPxChange,
  }) : super(
            crytocurrencyId: instrumentId,
            currentQuote: lastTradedPx,
            rolling24HrQuoteChange: rolling24HrPxChange,
            rolling24HrVolume: rolling24HrVolume);

  final int instrumentId;
  final double lastTradedPx;
  @override
  final double rolling24HrVolume;
  final double rolling24HrPxChange;

  CryptocurrencyQuoteModel copyWith({
    int instrumentId,
    double lastTradedPx,
    double rolling24HrVolume,
    double rolling24HrPxChange,
  }) {
    return CryptocurrencyQuoteModel(
      instrumentId: instrumentId ?? this.instrumentId,
      lastTradedPx: lastTradedPx ?? this.lastTradedPx,
      rolling24HrVolume: rolling24HrVolume ?? this.rolling24HrVolume,
      rolling24HrPxChange: rolling24HrPxChange ?? this.rolling24HrPxChange,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'InstrumentId': instrumentId,
      'LastTradedPx': lastTradedPx,
      'Rolling24HrVolume': rolling24HrVolume,
      'Rolling24HrPxChange': rolling24HrPxChange,
    };
  }

  factory CryptocurrencyQuoteModel.fromMap(Map<dynamic, dynamic> map) {
    return CryptocurrencyQuoteModel(
      instrumentId: (map['InstrumentId'] as num).toInt(),
      lastTradedPx: (map['LastTradedPx'] as num).toDouble(),
      rolling24HrVolume: (map['Rolling24HrVolume'] as num).toDouble(),
      rolling24HrPxChange: (map['Rolling24HrPxChange'] as num).toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CryptocurrencyQuoteModel.fromJson(String source) =>
      CryptocurrencyQuoteModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CryptocurrencyQuoteModel(instrumentId: $instrumentId, lastTradedPx: $lastTradedPx, rolling24HrVolume: $rolling24HrVolume, rolling24HrPxChange: $rolling24HrPxChange)';
  }

  @override
  bool operator ==(covariant CryptocurrencyQuoteModel other) {
    if (identical(this, other)) return true;

    return other.instrumentId == instrumentId &&
        other.lastTradedPx == lastTradedPx &&
        other.rolling24HrVolume == rolling24HrVolume &&
        other.rolling24HrPxChange == rolling24HrPxChange;
  }

  @override
  int get hashCode {
    return instrumentId.hashCode ^
        lastTradedPx.hashCode ^
        rolling24HrVolume.hashCode ^
        rolling24HrPxChange.hashCode;
  }
}
