//
//  TickerType.swift
//  CryptoArbitrage
//
//  Created by Shuichi Nagao on 2017/10/01.
//  Copyright © 2017 Shuichi Nagao. All rights reserved.
//

import Foundation

protocol TickerType {
    var pair: CurrencyPair { get }
    var price: Double { get }
    var bestBidPrice: Double { get }
    var bestAskPrice: Double { get }
    var bestBidVolume: Double { get }
    var bestAskVolume: Double { get }
    var updatedAt: Date { get }
}

enum CurrencyPair: String {
    case ETHUSD, ETHJPY
}
