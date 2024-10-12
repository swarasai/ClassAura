//
//  ClassAuraApp.swift
//  ClassAura
//
//  Created by Swarasai Mulagari on 10/12/24.
//

import SwiftUI
import Firebase

@main
struct ClassAuraApp: App {
    init() {
        FirebaseApp.configure()  // Initialize Firebase
    }

    var body: some Scene {
        WindowGroup {
            SignInView()  // Your app's entry point
        }
    }
}
