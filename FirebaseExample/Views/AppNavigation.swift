//
//  AppNavigation.swift
//  FirebaseExample
//
//  Created by Felix B on 25.02.25.
//

import SwiftUI

struct AppNavigation: View {
    
    init() {
        UITabBar.appearance().backgroundColor = .siPurple
        UITabBar.appearance().unselectedItemTintColor = .white
    }
    
    var body: some View {
        TabView {
            Tab("Chats", systemImage: "bubble") {
                ChatListView()
            }
            
            Tab("Einstellungen", systemImage: "wrench") {
                SettingsView()
            }
        }
        .tint(.siYellow)
    }
}

#Preview {
    AppNavigation()
}
