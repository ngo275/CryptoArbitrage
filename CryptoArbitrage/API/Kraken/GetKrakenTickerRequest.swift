//
//  GetKrakenTickerRequest.swift
//  CryptoArbitrage
//
//  Created by Shuichi Nagao on 2017/10/01.
//  Copyright © 2017 Shuichi Nagao. All rights reserved.
//

import Foundation
import APIKit
import Himotoki

struct GetKrakenTickerRequest: KrakenRequest {
    typealias Response = KrakenTicker
    
    let pair: CurrencyPair
    
    init(currencyPair: CurrencyPair) {
        pair = currencyPair
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "/public/Ticker"
    }
    
    var parameters: Any? {
        return [
            "pair": pair.rawValue
        ]
    }
    
}
