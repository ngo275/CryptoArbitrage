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
    func finishFetch(_: String)
}

class TickerViewModel {
    private let bag = DisposeBag()
    weak var delegate: TickerDelegate?

//    private var gatecoinTicker = Variable<GatecoinTicker?>(nil)
//    private var krakenTicker = Variable<KrakenTicker?>(nil)
//    private var bitfinexTicker = Variable<BitfinexTicker?>(nil)
    
    private var gatecoinTicker: GatecoinTicker? = nil
    private var krakenTicker: KrakenTicker? = nil
    private var bitfinexTicker: BitfinexTicker? = nil
    
    init() {
//        Observable.combineLatest(gatecoinTicker.asObservable(), krakenTicker.asObservable(), bitfinexTicker.asObservable()).subscribe(onNext: { (g, k, b) in
//            if let g = g, let k = k, let b = b {
//                let min = [g.price, k.price, b.price].min()!
//                let max = [g.price, k.price, b.price].max()!
//                print("\(min)----------------")
//                self.delegate?.finishFetch(min.description)
//            }
//        })
    }
    
    func fetchTickers() {
        gatecoinTicker = nil
        krakenTicker = nil
        bitfinexTicker = nil
        
        fetchGatecoinTicker()
        fetchKrakenTicker()
        fetchBitfinexTicker()
    }
    
    func fetchGatecoinTicker() {
        APIManager.send(request: GetGatecoinTickerRequest(currencyPair: .ETHUSD)).subscribe(
            onNext: { ticker in
                self.gatecoinTicker = ticker
                print(ticker)
        }, onError: { error in
        }).disposed(by: bag)
    }
    
    func fetchKrakenTicker() {
        APIManager.send(request: GetKrakenTickerRequest(currencyPair: .ETHUSD)).subscribe(
            onNext: { ticker in
                self.krakenTicker = ticker
                print(ticker)
        }, onError: { error in
        }).disposed(by: bag)
    }
    
    func fetchBitfinexTicker() {
        APIManager.send(request: GetBitfinexTickerRequest(currencyPair: .ETHUSD)).subscribe(
            onNext: { ticker in
                self.bitfinexTicker = ticker
                print(ticker)
        }, onError: { error in
        }).disposed(by: bag)
    }
    
    func getMessage() -> String {
        guard let g = gatecoinTicker, let k = krakenTicker, let b = bitfinexTicker else { return "取得失敗しました." }
        let min = [g.price, k.price, b.price].min()!
        let max = [g.price, k.price, b.price].max()!
        print("\(min)----------------")
        return "max is \(max), min is \(min)."
    }
}
