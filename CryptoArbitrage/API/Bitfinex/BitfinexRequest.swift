//
//  BitfinexRequest.swift
//  CryptoArbitrage
//
//  Created by Shuichi Nagao on 2017/10/01.
//  Copyright © 2017 Shuichi Nagao. All rights reserved.
//

import Foundation
import Himotoki
import APIKit

protocol BitfinexRequest: Request {}

extension BitfinexRequest {
    
    var baseURL: URL {
        return URL(string: "https://api.bitfinex.com/v1")!
    }
    
    func intercept(urlRequest: URLRequest) throws -> URLRequest {
        print("Request is \(urlRequest.url?.description)")
        return urlRequest
    }
    
    func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any {
        print("Response Status code is \(urlResponse.statusCode)")
        return object
    }
    
}
