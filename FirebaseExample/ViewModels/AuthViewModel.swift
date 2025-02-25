//
//  AuthViewModel.swift
//  FirebaseExample
//
//  Created by Felix B on 25.02.25.
//

import SwiftUI
import FirebaseAuth

class AuthViewModel: ObservableObject {
    
    @Published var user: User?
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showRegister: Bool = false
    
    var isUserLoggedIn: Bool {
        user != nil
    }
    
    private let auth = Auth.auth()
    private var listener: NSObjectProtocol?
    
    init() {
        self.listener = auth.addStateDidChangeListener { auth, user in
            self.user = user
        }
    }
    
    deinit {
        listener = nil
    }
    
    // Nicht im init als Beispiel weil der state did change listener drin ist.
    func checkLogin() {
        guard let user = auth.currentUser else {
            print("No user found?")
            return
        }
        self.user = user
    }
    
    func logInWithEmail() {
        Task {
            do {
                let authResult = try await auth.signIn(withEmail: email, password: password)
                // Obsolete durch den listener
                // self.user = authResult.user
            } catch {
                print(error)
            }
        }
    }
    
    func registerWithEmail() {
        Task {
            do {
                let authResult = try await auth.createUser(withEmail: email, password: password)
                // Obsolete durch den listener
                // self.user = authResult.user
            } catch {
                print(error)
            }
        }
    }
    
    func logInAnon() {
        Task {
            do {
                let authResult = try await auth.signInAnonymously()
                // Obsolete durch den listener
                // self.user = authResult.user
                print(authResult.user.uid)
            } catch {
                print(error)
            }
        }
    }
    
    func resetPassword() {
        auth.sendPasswordReset(withEmail: email)
    }
    
    func logout() {
        try? auth.signOut()
        // Obsolete durch den listener
        // self.user = nil
    }
    
}
