import 'package:intl/intl.dart' as intl;

extension DoubleExtension on double {
  static const String currencySymbol = 'R\$';

  String formatToCurrency({int decimalDigits = 5}) {
    return intl.NumberFormat.currency(
            symbol: this < 0 ? ' $currencySymbol' : currencySymbol,
            decimalDigits: decimalDigits,
            locale: 'pt_BR')
        .format(this);
  }

  String formatToPxChangePattern() {
    final String sign = this > 0 ? '+' : '';
    return intl.NumberFormat('$sign##.##').format(this);
  }
}
