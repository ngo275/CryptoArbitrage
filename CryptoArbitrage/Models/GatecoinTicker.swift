//
//  GatecoinTicker.swift
//  CryptoArbitrage
//
//  Created by Shuichi Nagao on 2017/10/01.
//  Copyright © 2017 Shuichi Nagao. All rights reserved.
//

import Foundation
import Himotoki

struct GatecoinTicker: TickerType {
    let pair: CurrencyPair
    let price: Double
    let bestBidPrice: Double
    let bestAskPrice: Double
    let bestBidVolume: Double
    let bestAskVolume: Double
    let updatedAt: Date
    let vwap: Double
}

extension GatecoinTicker: Himotoki.Decodable {
    static func decode(_ e: Extractor) throws -> GatecoinTicker {
        return try GatecoinTicker(
            pair: CurrencyPair(rawValue: e <| ["ticker", "currencyPair"])!,
            price: e <| ["ticker", "last"],
            bestBidPrice: e <| ["ticker", "bid"],
            bestAskPrice: e <| ["ticker", "ask"],
            bestBidVolume: e <| ["ticker", "bidQ"],
            bestAskVolume: e <| ["ticker", "askQ"],
            updatedAt: Date(),
            vwap: e <| ["ticker", "vwap"]
        )
    }
}

