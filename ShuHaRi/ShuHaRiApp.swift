//
//  ShuHaRiApp.swift
//  ShuHaRi
//
//  Created by Yuki on 
//

import SwiftUI
import UserNotifications

@main
struct ShuHaRiApp: App {
    // 通知設定
    init() {
            requestNotificationPermission()
        }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    // 通知許可アラートを出す
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Notification permission error: \(error.localizedDescription)")
            }
        }
    }
}


