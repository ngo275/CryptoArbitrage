//
//  KrakenTicker.swift
//  CryptoArbitrage
//
//  Created by Shuichi Nagao on 2017/10/01.
//  Copyright © 2017 Shuichi Nagao. All rights reserved.
//

import Foundation
import Himotoki

struct KrakenTicker: TickerType {
    let pair: CurrencyPair
    let price: Double
    let bestBidPrice: Double
    let bestAskPrice: Double
    let bestBidVolume: Double
    let bestAskVolume: Double
    let updatedAt: Date
    let vwap: Double
}

extension KrakenTicker: Himotoki.Decodable {
    static func decode(_ e: Extractor) throws -> KrakenTicker {
        let transformer = HimotokiTransformerUtil.DoubleTransformer
        let firstTransformer = HimotokiTransformerUtil.FirstDoubleTransformer
        let lastTransformer = HimotokiTransformerUtil.LastDoubleTransformer

        return try KrakenTicker(
            // TODO: ETHUSDをハードコーディング治す
            pair: CurrencyPair(rawValue: "ETHUSD")!,
            price: firstTransformer.apply(e <|| ["result", "XETHZUSD", "c"]),
            bestBidPrice: firstTransformer.apply(e <|| ["result", "XETHZUSD", "b"]),
            bestAskPrice: firstTransformer.apply(e <|| ["result", "XETHZUSD", "a"]),
            bestBidVolume: lastTransformer.apply(e <|| ["result", "XETHZUSD", "b"]),
            bestAskVolume: lastTransformer.apply(e <|| ["result", "XETHZUSD", "a"]),
            updatedAt: Date(),
            vwap: transformer.apply(e <| ["result", "XETHZUSD", "o"])
        )
    }
}
