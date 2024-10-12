//
//  AppDelegate.swift
//  ClassAura
//
//  Created by Raeva Desai on 10/12/24.
//

import Foundation
import SwiftUI
import FirebaseCore

// AppDelegate class to initialize Firebase
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()  // Initialize Firebase when app launches
        return true
    }
}
