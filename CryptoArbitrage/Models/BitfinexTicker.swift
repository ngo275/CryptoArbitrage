//
//  BitfinexTicker.swift
//  CryptoArbitrage
//
//  Created by Shuichi Nagao on 2017/10/01.
//  Copyright © 2017 Shuichi Nagao. All rights reserved.
//

import Foundation
import Himotoki

struct BitfinexTicker: TickerType {
    let pair: CurrencyPair
    let price: Double
    let bestBidPrice: Double
    let bestAskPrice: Double
    let bestBidVolume: Double
    let bestAskVolume: Double
    let updatedAt: Date
}

extension BitfinexTicker: Himotoki.Decodable {
    static func decode(_ e: Extractor) throws -> BitfinexTicker {
        let transformer = HimotokiTransformerUtil.DoubleTransformer
        return try BitfinexTicker(
            pair: CurrencyPair(rawValue: "ETHUSD")!,
            price: transformer.apply(e <| ["last_price"]),
            bestBidPrice: transformer.apply(e <| ["bid"]),
            bestAskPrice: transformer.apply(e <| ["ask"]),
            bestBidVolume: 0.0001 ,
            bestAskVolume: 0.0001,
            updatedAt: Date()
        )
    }
}
