//
//  FirebaseExampleApp.swift
//  FirebaseExample
//
//  Created by Felix B on 24.02.25.
//

import SwiftUI
import Firebase

@main
struct FirebaseExampleApp: App {
    
    init() {
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
