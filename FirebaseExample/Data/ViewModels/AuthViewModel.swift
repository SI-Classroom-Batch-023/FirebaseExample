//
//  AuthViewModel.swift
//  FirebaseExample
//
//  Created by Felix B on 25.02.25.
//

import SwiftUI
import FirebaseAuth

@MainActor
class AuthViewModel: ObservableObject {
    
    @Published var user: User?
    //@Published var appUser: AppUser?
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var username: String = ""
    @Published var showRegister: Bool = false
    
    var isUserLoggedIn: Bool {
        user != nil
    }
    
    private let userRepo = UserRepository()
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
    
    func logInWithEmail() {
        Task {
            do {
                try await userRepo.loginWithEmail(email: email, password: password)
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
                try await userRepo.registerUserWithEmail(email: email, password: password, username: username)
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
    
    
    // Nicht im init als Beispiel weil der state did change listener drin ist.
    func checkLogin() {
        guard let user = auth.currentUser else {
            print("No user found?")
            return
        }
        //self.user = user
    }
    
}
