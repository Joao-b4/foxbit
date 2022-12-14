import 'package:foxbit_hiring_test_template/domain/entities/cryptocurrency_entity.dart';

List<CryptocurrencyEntity> get getInstrumentsMock => [
      CryptocurrencyEntity(
          cryptocurrencyId: 1, symbol: "BTC/BRL", orderIndex: 0)
    ];

String get getInstrumentsResponseMock =>
    // ignore: unnecessary_string_escapes
    '{"m": 0, "i": 0, "n": "getInstruments", "o": "[{    \\"OMSId\\": 1,    \\"InstrumentId\\": 1,    \\"Symbol\\": \\"BTC/BRL\\",    \\"Product1\\": 1,    \\"Product1Symbol\\": \\"BTC\\",    \\"Product2\\": 2,    \\"Product2Symbol\\": \\"BRL\\",    \\"InstrumentType\\": \\"Standard\\",    \\"VenueInstrumentId\\": 1,    \\"VenueId\\": 1,    \\"SortIndex\\": 0,    \\"SessionStatus\\": \\"Running\\",    \\"PreviousSessionStatus\\": \\"Paused\\",    \\"SessionStatusDateTime\\": \\"2020-07-11T01:27:02.851Z\\",    \\"SelfTradePrevention\\": true,    \\"QuantityIncrement\\": 1e-8,    \\"PriceIncrement\\": 0.01, \\"MinimumQuantity\\": 1e-8,\\"MinimumPrice\\": 0.01, \\"VenueSymbol\\": \\"BTC/BRL\\", \\"IsDisable\\": false, \\"MasterDataId\\": 0, \\"PriceCollarThreshold\\": 0, \\"PriceCollarPercent\\": 0, \\"PriceCollarEnabled\\": false,\\"PriceFloorLimit\\": 0, \\"PriceFloorLimitEnabled\\": false, \\"PriceCeilingLimit\\": 0, \\"PriceCeilingLimitEnabled\\": false,\\"CreateWithMarketRunning\\": true, \\"AllowOnlyMarketMakerCounterParty\\": false}]" }';

List<Map<dynamic, dynamic>> get getInstrumentsResponseFieldMock => [
      {
        "OMSId": 1,
        "InstrumentId": 1,
        "Symbol": "BTC/BRL",
        "Product1": 1,
        "Product1Symbol": "BTC",
        "Product2": 2,
        "Product2Symbol": "BRL",
        "InstrumentType": "Standard",
        "VenueInstrumentId": 1,
        "VenueId": 1,
        "SortIndex": 0,
        "SessionStatus": "Running",
        "PreviousSessionStatus": "Paused",
        "SessionStatusDateTime": "2020-07-11T01:27:02.851Z",
        "SelfTradePrevention": true,
        "QuantityIncrement": 1e-8,
        "PriceIncrement": 0.001,
        "MinimumQuantity": 1e-8,
        "MinimumPrice": 0.001,
        "VenueSymbol": "BTC/BRL",
        "IsDisable": false,
        "MasterDataId": 0,
        "PriceCollarThreshold": 0,
        "PriceCollarPercent": 0,
        "PriceCollarEnabled": false,
        "PriceFloorLimit": 0,
        "PriceFloorLimitEnabled": false,
        "PriceCeilingLimit": 0,
        "PriceCeilingLimitEnabled": false,
        "CreateWithMarketRunning": true,
        "AllowOnlyMarketMakerCounterParty": false
      },
      {
        "OMSId": 1,
        "InstrumentId": 2,
        "Symbol": "LTC/BRL",
        "Product1": 3,
        "Product1Symbol": "LTC",
        "Product2": 2,
        "Product2Symbol": "BRL",
        "InstrumentType": "Standard",
        "VenueInstrumentId": 3,
        "VenueId": 1,
        "SortIndex": 0,
        "SessionStatus": "Running",
        "PreviousSessionStatus": "Paused",
        "SessionStatusDateTime": "2020-07-11T01:27:50.427Z",
        "SelfTradePrevention": true,
        "QuantityIncrement": 1e-8,
        "PriceIncrement": 0.001,
        "MinimumQuantity": 1e-8,
        "MinimumPrice": 0.001,
        "VenueSymbol": "LTC/BRL",
        "IsDisable": false,
        "MasterDataId": 0,
        "PriceCollarThreshold": 0,
        "PriceCollarPercent": 0,
        "PriceCollarEnabled": false,
        "PriceFloorLimit": 0,
        "PriceFloorLimitEnabled": false,
        "PriceCeilingLimit": 0,
        "PriceCeilingLimitEnabled": false,
        "CreateWithMarketRunning": true,
        "AllowOnlyMarketMakerCounterParty": false
      }
    ];
