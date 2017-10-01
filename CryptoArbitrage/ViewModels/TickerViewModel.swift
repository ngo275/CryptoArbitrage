//
//  TickerViewModel.swift
//  CryptoArbitrage
//
//  Created by Shuichi Nagao on 2017/10/01.
//  Copyright © 2017 Shuichi Nagao. All rights reserved.
//

import Foundation
import RxSwift

protocol TickerDelegate: class {
    
}

class TickerViewModel {
    private let bag = DisposeBag()
    weak var delegate: TickerDelegate?
    
    func fetchGatecoinTicker() {
        APIManager.send(request: GetGatecoinTickerRequest(currencyPair: .ETHUSD)).subscribe(
            onNext: { ticker in
                print(ticker)
        }, onError: { error in
        }).disposed(by: bag)
    }
    
    func fetchKrakenTicker() {
        APIManager.send(request: GetKrakenTickerRequest(currencyPair: .ETHUSD)).subscribe(
            onNext: { ticker in
                print(ticker)
        }, onError: { error in
        }).disposed(by: bag)
    }
    
    func fetchBitfinexTicker() {
        APIManager.send(request: GetBitfinexTickerRequest(currencyPair: .ETHUSD)).subscribe(
            onNext: { ticker in
                print(ticker)
        }, onError: { error in
        }).disposed(by: bag)
    }
}
