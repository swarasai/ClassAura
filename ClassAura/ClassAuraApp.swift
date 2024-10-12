//
//  ClassAuraApp.swift
//  ClassAura
//
//  Created by Raeva Desai on 10/12/24.
//

import SwiftUI
import FirebaseCore

@main
struct ClassAuraApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            // Ensure that SignInView is inside a NavigationView
            NavigationView {
                SignInView()
            }
        }
    }
}
