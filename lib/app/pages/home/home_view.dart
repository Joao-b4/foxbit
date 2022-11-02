import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:foxbit_hiring_test_template/app/pages/home/home_controller.dart';
import 'package:foxbit_hiring_test_template/app/utils/application_colors.dart';
import 'package:foxbit_hiring_test_template/app/utils/application_dimens.dart';

class HomePage extends View {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends ViewState<HomePage, HomeController> {
  HomePageState() : super(HomeController());

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
                  ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return _buildCardCryptocurrency();
                    },
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

  Widget _buildCardCryptocurrency() => Container(
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
                _buildCryptocurrencyImageAndDescription(),
                const SizedBox(
                  width: ApplicationDimens.defaultMargin,
                ),
                _buildCryptocurrencyRolling(),
                const SizedBox(
                  width: ApplicationDimens.defaultMargin,
                ),
                Flexible(child: _buildCryptocurrencyValue()),
              ],
            ),
          ),
        ),
      );

  Widget _buildCryptocurrencyImageAndDescription() => Row(
        children: [
          Image.asset("assets/images/1.png", width: 40),
          const SizedBox(
            width: ApplicationDimens.tinyMargin,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bitcoin",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Text("BTC",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w600)),
            ],
          )
        ],
      );
  Widget _buildCryptocurrencyRolling() => const Text("+2.36",
      style: TextStyle(
          color: ApplicationColors.positiveColor,
          fontSize: 17,
          fontWeight: FontWeight.w500));

  Widget _buildCryptocurrencyValue() => Text("R\$ 27.462,29",
      style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 24,
          fontWeight: FontWeight.w500));
}
