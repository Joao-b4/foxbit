import 'package:flutter_test/flutter_test.dart';
import 'package:foxbit_hiring_test_template/app/utils/double_extension.dart';

void main() {
  test('Should return the value formatted with Currency Pattern', () {
    const double value = 13;
    final String valueFormatted = value.formatToCurrency();
    expect(valueFormatted, "R\$ 13,000");
  });
  test('Should return the value positive formatted with PxChangePattern', () {
    const double value = 13.14;
    final String valueFormatted = value.formatToPxChangePattern();
    expect(valueFormatted, "+13.14");
  });

  test('Should return the value negative formatted with PxChangePattern', () {
    const double value = -12.10;
    final String valueFormatted = value.formatToPxChangePattern();
    expect(valueFormatted, "-12.1");
  });
}
