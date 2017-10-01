//
//  ViewController.swift
//  CryptoArbitrage
//
//  Created by Shuichi Nagao on 2017/09/30.
//  Copyright © 2017 Shuichi Nagao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let vm = TickerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationUtil.authorize()
        vm.fetchGatecoinTicker()
        vm.fetchKrakenTicker()
        vm.fetchBitfinexTicker()
    }

}

