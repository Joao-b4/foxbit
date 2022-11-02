import 'package:foxbit_hiring_test_template/domain/entities/cryptocurrency_quote_entity.dart';

CryptocurrencyQuoteEntity get getSubscribeLeve1Mock =>
    CryptocurrencyQuoteEntity(
        currentQuote: 39, rolling24HrQuoteChange: 100, rolling24HrVolume: 200);

String get getSubscribeLeve1ResponseMock =>
    // ignore: unnecessary_string_escapes
    '{  "m": 3,  "i": 2,  "n": "Level1UpdateEvent",  "o": "{\\"OMSId\\":1,\\"InstrumentId\\":2,\\"MarketId\\":\\"ltcbrl\\",\\"BestBid\\":\\"313.2687\\",\\"BestOffer\\":\\"317.3692\\",\\"LastTradedPx\\":317.8355,\\"LastTradedQty\\":0.02387656,\\"LastTradeTime\\":1667413111,\\"SessionOpen\\":285.5836,\\"SessionHigh\\":320.817,\\"SessionLow\\":282.6294,\\"SessionClose\\":311.9712,\\"Volume\\":0.02387656,\\"CurrentDayVolume\\":199.2033,\\"CurrentDayNumTrades\\":112,\\"CurrentDayPxChange\\":25.7385,\\"Rolling24HrVolume\\":212.902,\\"Rolling24NumTrades\\":131,\\"Rolling24HrPxChange\\":9.2399,\\"TimeStamp\\":1667413348}"}';
