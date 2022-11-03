import 'package:flutter/material.dart';
import 'package:foxbit_hiring_test_template/app/pages/home/home_view.dart';
import 'package:foxbit_hiring_test_template/app/pages/splash/splash_page.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (BuildContext context) => const SplashPage(),
  '/home': (BuildContext context) => HomePage(),
};
