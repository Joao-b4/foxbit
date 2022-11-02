class CryptocurrencyQuoteEntity {
  CryptocurrencyQuoteEntity(
      {this.currentQuote, this.rolling24HrVolume, this.rolling24HrQuoteChange});

  // LastTradedPx
  final double currentQuote;
  // Rolling24HrVolume
  final double rolling24HrVolume;
  // Rolling24HrPxChange
  final double rolling24HrQuoteChange;
}
