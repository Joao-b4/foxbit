// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:foxbit_hiring_test_template/domain/entities/cryptocurrency_entity.dart';

class CryptocurrencyModel extends CryptocurrencyEntity {
  CryptocurrencyModel({
    this.instrumentId,
    this.product1Symbol,
    this.sortIndex,
  }) : super(
            cryptocurrencyId: instrumentId,
            symbol: product1Symbol,
            orderIndex: sortIndex);

  final int instrumentId;
  final String product1Symbol;
  final int sortIndex;

  CryptocurrencyModel copyWith({
    int instrumentId,
    String symbol,
    int sortIndex,
  }) {
    return CryptocurrencyModel(
      instrumentId: instrumentId ?? this.instrumentId,
      product1Symbol: symbol ?? this.symbol,
      sortIndex: sortIndex ?? this.sortIndex,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'InstrumentId': instrumentId,
      'Product1Symbol': symbol,
      'SortIndex': sortIndex,
    };
  }

  factory CryptocurrencyModel.fromMap(Map<dynamic, dynamic> map) {
    return CryptocurrencyModel(
      instrumentId: (map['InstrumentId'] as num).toInt(),
      product1Symbol: map['Product1Symbol'] as String,
      sortIndex: (map['SortIndex'] as num).toInt(),
    );
  }

  static List<CryptocurrencyModel> fromListMap(List<Map> listMap) {
    return listMap.map((map) => CryptocurrencyModel.fromMap(map)).toList();
  }

  String toJson() => json.encode(toMap());

  factory CryptocurrencyModel.fromJson(String source) =>
      CryptocurrencyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CryptocurrencyModel(instrumentId: $instrumentId, symbol: $symbol, sortIndex: $sortIndex)';

  @override
  bool operator ==(covariant CryptocurrencyModel other) {
    if (identical(this, other)) return true;

    return other.instrumentId == instrumentId &&
        other.symbol == symbol &&
        other.sortIndex == sortIndex;
  }

  @override
  int get hashCode =>
      instrumentId.hashCode ^ symbol.hashCode ^ sortIndex.hashCode;
}
