// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:foxbit_hiring_test_template/domain/entities/cryptocurrency_quote_entity.dart';

class CryptocurrencyQuoteModel extends CryptocurrencyQuoteEntity {
  CryptocurrencyQuoteModel({
    this.lastTradedPx,
    this.rolling24HrVolume,
    this.rolling24HrPxChange,
  }) : super(
            currentQuote: lastTradedPx,
            rolling24HrQuoteChange: rolling24HrVolume,
            rolling24HrVolume: rolling24HrPxChange);

  final double lastTradedPx;
  @override
  // ignore: overridden_fields
  final double rolling24HrVolume;
  final double rolling24HrPxChange;

  CryptocurrencyQuoteModel copyWith({
    double lastTradedPx,
    double rolling24HrVolume,
    double rolling24HrPxChange,
  }) {
    return CryptocurrencyQuoteModel(
      lastTradedPx: lastTradedPx ?? this.lastTradedPx,
      rolling24HrVolume: rolling24HrVolume ?? this.rolling24HrVolume,
      rolling24HrPxChange: rolling24HrPxChange ?? this.rolling24HrPxChange,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'LastTradedPx': lastTradedPx,
      'Rolling24HrVolume': rolling24HrVolume,
      'Rolling24HrPxChange': rolling24HrPxChange,
    };
  }

  factory CryptocurrencyQuoteModel.fromMap(Map<dynamic, dynamic> map) {
    return CryptocurrencyQuoteModel(
      lastTradedPx: map['LastTradedPx'] as double,
      rolling24HrVolume: map['Rolling24HrVolume'] as double,
      rolling24HrPxChange: map['Rolling24HrPxChange'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CryptocurrencyQuoteModel.fromJson(String source) =>
      CryptocurrencyQuoteModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CryptocurrencyQuoteModel(lastTradedPx: $lastTradedPx, rolling24HrVolume: $rolling24HrVolume, rolling24HrPxChange: $rolling24HrPxChange)';

  @override
  bool operator ==(covariant CryptocurrencyQuoteModel other) {
    if (identical(this, other)) return true;

    return other.lastTradedPx == lastTradedPx &&
        other.rolling24HrVolume == rolling24HrVolume &&
        other.rolling24HrPxChange == rolling24HrPxChange;
  }

  @override
  int get hashCode =>
      lastTradedPx.hashCode ^
      rolling24HrVolume.hashCode ^
      rolling24HrPxChange.hashCode;
}
