import 'package:flutter/material.dart';
import 'package:foxbit_hiring_test_template/app/resources/application_colors.dart';
import 'package:foxbit_hiring_test_template/app/utils/double_extension.dart';
import 'package:foxbit_hiring_test_template/domain/entities/cryptocurrency_quote_entity.dart';

class CryptocurrencyPxValueChangedWidget extends StatelessWidget {
  const CryptocurrencyPxValueChangedWidget(
      {Key key, this.cryptocurrencyQuoteEntity})
      : super(key: key);
  final CryptocurrencyQuoteEntity cryptocurrencyQuoteEntity;

  @override
  Widget build(BuildContext context) {
    final double getMediaUnitHeightValue =
        MediaQuery.of(context).size.height * 0.01;
    return Text(
        ' ${cryptocurrencyQuoteEntity.rolling24HrQuoteChange.formatToPxChangePattern()}',
        style: TextStyle(
            color: cryptocurrencyQuoteEntity.rolling24HrQuoteChange > 0
                ? ApplicationColors.positiveColor
                : ApplicationColors.negativeColor,
            fontSize: getMediaUnitHeightValue * 1.9,
            fontWeight: FontWeight.w500));
  }
}
