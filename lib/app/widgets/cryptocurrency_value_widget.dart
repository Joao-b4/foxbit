import 'package:flutter/material.dart';
import 'package:foxbit_hiring_test_template/app/utils/double_extension.dart';
import 'package:foxbit_hiring_test_template/domain/entities/cryptocurrency_quote_entity.dart';

class CryptocurrencyValueWidget extends StatelessWidget {
  const CryptocurrencyValueWidget({Key key, this.cryptocurrencyQuoteEntity})
      : super(key: key);
  final CryptocurrencyQuoteEntity cryptocurrencyQuoteEntity;

  @override
  Widget build(BuildContext context) {
    final double getMediaUnitHeightValue =
        MediaQuery.of(context).size.height * 0.01;
    return Text(cryptocurrencyQuoteEntity.currentQuote.formatToCurrency(),
        maxLines: 1,
        textAlign: TextAlign.end,
        style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: getMediaUnitHeightValue * 2.2,
            fontWeight: FontWeight.bold));
  }
}
