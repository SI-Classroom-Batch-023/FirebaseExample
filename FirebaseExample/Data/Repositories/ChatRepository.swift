//
//  ChatRepository.swift
//  FirebaseExample
//
//  Created by Felix B on 27.02.25.
//

import FirebaseFirestore

class ChatRepository {
    
    private let firebaseManager = FirebaseManager.shared
    private let chatRef = FirebaseManager.shared.database.collection("chats")
    
    func createChat(_ chat: Chat) throws {
        try chatRef.addDocument(from: chat)
    }
    
    func addUserToChat(chatID: String, userID: String) async throws {
        try await chatRef
            .document(chatID)
            .updateData([
                "members": FieldValue.arrayUnion([userID])
            ])
    }
    
    func addChatSnapshotListener(onChange: @escaping ([Chat]) -> Void) -> ListenerRegistration? {
        guard let id = firebaseManager.userID else { return nil }
        
        return chatRef
            .whereField("members", arrayContains: id)
            .addSnapshotListener { querySnapshot, error in
                if let error {
                    print(error)
                    return
                }
                guard let documents = querySnapshot?.documents else { return }
                
                let chats = documents.compactMap { document in
                    try? document.data(as: Chat.self)
                }
                
                onChange(chats)
            }
    }
}
