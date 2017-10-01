//
//  HimotokiTransformerUtil.swift
//  CryptoArbitrage
//
//  Created by Shuichi Nagao on 2017/10/01.
//  Copyright © 2017 Shuichi Nagao. All rights reserved.
//

import Foundation
import Himotoki

class HimotokiTransformerUtil {
    static let DoubleTransformer = Transformer<String, Double> { string throws -> Double in
        if let double = Double(string) {
            return double
        }
        throw NSError(domain: "teck.shuichi", code: 500)
    }
    
    static let FirstDoubleTransformer = Transformer<[String], Double> { strings throws -> Double in
        if let str = strings.first, let double = Double(str) {
            return double
        }
        throw NSError(domain: "tech.shuichi", code: 500)
    }
    
    static let LastDoubleTransformer = Transformer<[String], Double> { strings throws -> Double in
        if let str = strings.last, let double = Double(str) {
            return double
        }
        throw NSError(domain: "tech.shuichi", code: 500)
    }
}
