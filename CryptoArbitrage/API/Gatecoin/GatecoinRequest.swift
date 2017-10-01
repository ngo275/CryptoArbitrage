//
//  GatecoinRequest.swift
//  CryptoArbitrage
//
//  Created by Shuichi Nagao on 2017/10/01.
//  Copyright © 2017 Shuichi Nagao. All rights reserved.
//

import Foundation
import APIKit
import Himotoki

protocol GatecoinRequest: Request {}

extension GatecoinRequest {
    
    var baseURL: URL {
        return URL(string: "https://api.gatecoin.com/")!
    }
    
    var headerFields: [String: String] {
        var fields: [String: String] = [:]
        
        fields.updateValue("bankode/iOS", forKey: "User-Agent")
        
        return fields
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

extension Request where Response: Himotoki.Decodable {
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        return try decodeValue(object)
    }
}
