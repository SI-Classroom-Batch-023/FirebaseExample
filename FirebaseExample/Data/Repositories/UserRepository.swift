//
//  UserRepository.swift
//  FirebaseExample
//
//  Created by Felix B on 26.02.25.
//

class UserRepository {
    
    private let firebaseManager = FirebaseManager.shared
    private let userRef = FirebaseManager.shared.database.collection("user")
    
    func getUserByID(_ id: String) async throws -> AppUser {
        return try await userRef
            .document(id)
            .getDocument(as: AppUser.self)
    }
    
    func loginWithEmail(email: String, password: String) async throws {
        try await firebaseManager.auth.signIn(withEmail: email, password: password)
    }
    
    func registerUserWithEmail(email: String, password: String, username: String) async throws {
        // Holen uns die infos der Registration und vorallem die UID des Authusers
        let authResult = try await firebaseManager.auth.createUser(withEmail: email, password: password)
        let appUser = AppUser(email: email, username: username)
        // Setzen initial die Document ID auf die gleiche wie der Authuser um eine einfache Verbindung herzustellen
        try userRef.document(authResult.user.uid).setData(from: appUser)
    }
}
