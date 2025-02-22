//
//  memberAppIOSApp.swift
//  memberAppIOS
//
//  Created by Arav Prasad on 15/02/2025.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      FirebaseApp.configure()

    return true
  }
}

@main
struct memberAppIOSApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup("SetupView", id: "Setup") {
            SetupView()
        }
        
        WindowGroup("ContentView", id: "Content") {
            ContentView()
        }
        
        WindowGroup("SettingsView", id: "Settings") {
            SettingsView()
        }
    }
}
