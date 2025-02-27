//
//  SettingsViewModel.swift
//  FirebaseExample
//
//  Created by Felix B on 27.02.25.
//

import SwiftUI

@MainActor
class SettingsViewModel: ObservableObject {
    @Published var appUser: AppUser?
    
    
    private let firebaseManager = FirebaseManager.shared
    
    func logout() {
        try? firebaseManager.auth.signOut()
    }
}
