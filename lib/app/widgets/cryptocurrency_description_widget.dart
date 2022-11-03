import 'package:flutter/material.dart';
import 'package:foxbit_hiring_test_template/app/resources/application_dimens.dart';
import 'package:foxbit_hiring_test_template/app/utils/application_utils.dart';
import 'package:foxbit_hiring_test_template/domain/entities/cryptocurrency_entity.dart';

class CryptocurrencyDescriptionWidget extends StatelessWidget {
  const CryptocurrencyDescriptionWidget({Key key, this.cryptocurrencyEntity})
      : super(key: key);
  final CryptocurrencyEntity cryptocurrencyEntity;

  @override
  Widget build(BuildContext context) {
    final double getMediaUnitHeightValue =
        MediaQuery.of(context).size.height * 0.01;
    return Row(
      children: [
        Image.asset(
            "assets/images/${cryptocurrencyEntity.cryptocurrencyId}.png",
            width: 40),
        const SizedBox(
          width: ApplicationDimens.tinyMargin,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ApplicationUtils.cryptocurrencyIdToName[
                        cryptocurrencyEntity.cryptocurrencyId]
                    .toString(),
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: getMediaUnitHeightValue * 1.9,
                    fontWeight: FontWeight.bold),
              ),
              Text(cryptocurrencyEntity.symbol,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        )
      ],
    );
  }
}
