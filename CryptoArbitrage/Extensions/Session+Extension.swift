//
//  Session+Extension.swift
//  CryptoArbitrage
//
//  Created by Shuichi Nagao on 2017/10/01.
//  Copyright © 2017 Shuichi Nagao. All rights reserved.
//

import APIKit
import RxSwift

extension Session {
    static func rx_response<T: Request>(_ request: T) -> Observable<T.Response> {
        return Observable.create { observer in
            let task = send(request) { result in
                switch result {
                case .success(let response):
                    observer.onNext(response)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            let t = task
            t?.resume()
            
            return Disposables.create {
                task?.cancel()
            }
        }
        
    }
}
