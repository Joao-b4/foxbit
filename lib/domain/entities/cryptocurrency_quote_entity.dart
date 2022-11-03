class CryptocurrencyQuoteEntity {
  CryptocurrencyQuoteEntity(
      {this.crytocurrencyId,
      this.currentQuote,
      this.rolling24HrVolume,
      this.rolling24HrQuoteChange});

  // InstrumentId
  final int crytocurrencyId;
  // LastTradedPx
  final double currentQuote;
  // Rolling24HrVolume
  final double rolling24HrVolume;
  // Rolling24HrPxChange
  final double rolling24HrQuoteChange;
}
