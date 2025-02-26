//
//  FirebaseManager.swift
//  FirebaseExample
//
//  Created by Felix B on 26.02.25.
//

import FirebaseFirestore
import FirebaseAuth

class FirebaseManager {
    
    static let shared = FirebaseManager()
    private init() {}
    
    let database = Firestore.firestore()
    let auth = Auth.auth()
    
    var userID: String? {
        auth.currentUser?.uid
    }
}

