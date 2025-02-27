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
    
    // Beispiel für die getUserByID als completion
    private func getUserByID(_ id: String, completion: @escaping (AppUser) -> Void) {
         userRef
            .document(id)
            .getDocument { snapshot, error in
                if let error {
                    print(error)
                    return
                }
                
                guard let snapshot else { return }
                
                do {
                    let user = try snapshot.data(as: AppUser.self)
                    completion(user)
                } catch {
                    print(error)
                }
            }
    }
    
    // Beispiel für Aufruf der verschiedenen Varianten
    private func test() {
        Task {
            do {
                let user1 = try await getUserByID("123")
                let user2 = try await getUserByID("1234")
            } catch {
                print(error)
            }
        }
        
        
        getUserByID("123") { appUser in
            let user1 = appUser
            self.getUserByID("1234") { appUser2 in
                let user2 = appUser2
            }
        }
    }
    
    func updateUser(username: String) async throws {
        guard let id = firebaseManager.userID else { return }
        
        try await userRef.document(id).updateData(["username": username])
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
        
        // Möchten uns eine ID generieren lassen:
        // Folgende aufrufe sind identisch
        // userRef.document().setData(from: appUser)
        // userRef.addDocument(from: appUser)
    }
}
