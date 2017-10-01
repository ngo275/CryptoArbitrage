//
//  APIManager.swift
//  CryptoArbitrage
//
//  Created by Shuichi Nagao on 2017/10/01.
//  Copyright © 2017 Shuichi Nagao. All rights reserved.
//

import Foundation
import RxSwift
import APIKit

class APIManager {
    
    static func send<T: Request>(request: T) -> Observable<T.Response> {
        return Observable.create { observer -> Disposable in
            Session
                .rx_response(request)
                .subscribe(
                    onNext: { result in
                        observer.onNext(result)
                }, onError: { error in
                    observer.onError(error)
                }, onCompleted: {
                    observer.onCompleted()
                })
        }
    }
    
}

