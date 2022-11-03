import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:foxbit_hiring_test_template/app/pages/home/home_controller.dart';
import 'package:foxbit_hiring_test_template/app/resources/application_colors.dart';
import 'package:foxbit_hiring_test_template/app/resources/application_dimens.dart';
import 'package:foxbit_hiring_test_template/app/utils/application_utils.dart';
import 'package:foxbit_hiring_test_template/app/utils/double_extension.dart';
import 'package:foxbit_hiring_test_template/domain/entities/cryptocurrency_entity.dart';
import 'package:foxbit_hiring_test_template/domain/entities/cryptocurrency_quote_entity.dart';

class HomePage extends View {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends ViewState<HomePage, HomeController> {
  HomePageState() : super(HomeController());

  double get getMediaUnitHeightValue =>
      MediaQuery.of(context).size.height * 0.01;

  @override
  Widget get view => Scaffold(
        key: globalKey,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                    horizontal: ApplicationDimens.tinyMargin)
                .copyWith(top: ApplicationDimens.defaultMargin),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(
                          left: ApplicationDimens.tinyMargin),
                      child: _buildPageTitle),
                  const SizedBox(
                    height: ApplicationDimens.defaultMargin,
                  ),
                  ControlledWidgetBuilder<HomeController>(
                    builder: (context, controller) => ListView.builder(
                      itemCount: controller.cryptocurrencyEntities.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final cryptocurrencyEntity =
                            controller.cryptocurrencyEntities[index];
                        return _buildCardCryptocurrency(
                            cryptocurrencyEntity,
                            controller.cryptocurrencyQuotesEntitiesCachedById[
                                cryptocurrencyEntity.cryptocurrencyId]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget get _buildPageTitle => Text(
        "Cotação",
        style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 24,
            fontWeight: FontWeight.bold),
      );

  Widget _buildCardCryptocurrency(
    CryptocurrencyEntity cryptocurrencyEntity,
    CryptocurrencyQuoteEntity cryptocurrencyQuoteEntity,
  ) =>
      Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey[700].withOpacity(.215),
              blurRadius: 80.0, // soften the shadow
              offset: const Offset(
                5.0, // Move to right 10  horizontally
                30.0, // Move to bottom 10 Vertically
              ),
            )
          ],
        ),
        child: Card(
          color: Colors.white,
          // elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(ApplicationDimens.defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: _buildCryptocurrencyImageAndDescription(
                              cryptocurrencyEntity)),
                      const SizedBox(
                        width: ApplicationDimens.tinyMargin,
                      ),
                      if (cryptocurrencyQuoteEntity != null) ...[
                        Flexible(
                            child: _buildCryptocurrencyRolling(
                                cryptocurrencyQuoteEntity)),
                      ],
                    ],
                  ),
                ),
                if (cryptocurrencyQuoteEntity != null) ...[
                  Expanded(
                      flex: 2,
                      child:
                          _buildCryptocurrencyValue(cryptocurrencyQuoteEntity)),
                ],
                if (cryptocurrencyQuoteEntity == null) ...[
                  CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  )
                ],
              ],
            ),
          ),
        ),
      );

  Widget _buildCryptocurrencyImageAndDescription(
          CryptocurrencyEntity cryptocurrencyEntity) =>
      Row(
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

  Widget _buildCryptocurrencyRolling(
      CryptocurrencyQuoteEntity cryptocurrencyQuoteEntity) {
    return Text(
        ' ${cryptocurrencyQuoteEntity.rolling24HrQuoteChange.formatToPxChangePattern()}',
        style: TextStyle(
            color: cryptocurrencyQuoteEntity.rolling24HrQuoteChange > 0
                ? ApplicationColors.positiveColor
                : ApplicationColors.negativeColor,
            fontSize: getMediaUnitHeightValue * 1.9,
            fontWeight: FontWeight.w500));
  }

  Widget _buildCryptocurrencyValue(
          CryptocurrencyQuoteEntity cryptocurrencyQuoteEntity) =>
      Text(cryptocurrencyQuoteEntity.currentQuote.formatToCurrency(),
          maxLines: 1,
          textAlign: TextAlign.end,
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: getMediaUnitHeightValue * 2.2,
              fontWeight: FontWeight.bold));
}
