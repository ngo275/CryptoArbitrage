//
//  NotificationUtil.swift
//  CryptoArbitrage
//
//  Created by Shuichi Nagao on 2017/09/30.
//  Copyright © 2017 Shuichi Nagao. All rights reserved.
//

import UIKit
import UserNotifications

class NotificationUtil {
    
    static func alert() {
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "test"
        content.body = "testtest"
        content.categoryIdentifier = "alarm"
        content.userInfo = ["url": "deeplink"]
        content.sound = UNNotificationSound.default()
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
        let notification = UNNotificationRequest(identifier: "hoge", content: content, trigger: trigger)
        center.add(notification)
    }
    
    static func authorize() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .alert, .sound]) { granted, error in
            // callback
        }
        UIApplication.shared.registerForRemoteNotifications()
    }
    
}
