//
//  MessageRepository.swift
//  FirebaseExample
//
//  Created by Felix B on 27.02.25.
//

import FirebaseFirestore

class MessageRepository {
    
    private let firebaseManager = FirebaseManager.shared
    private let chatRef = FirebaseManager.shared.database.collection("chats")
    
    func addMessage(chatID: String, message: Message) throws {
        try chatRef
            .document(chatID)
            .collection("messages")
            .addDocument(from: message)
        chatRef
            .document(chatID)
            .updateData([
                "lastMessage": message.text,
                "lastMessageTime": message.timestamp
            ])
    }
    
    func addMessageSnapshotListener(
        chatID: String,
        onChange: @escaping ([Message]) -> Void
    ) -> ListenerRegistration? {
        guard let id = firebaseManager.userID else { return nil }
        
        return chatRef
            .document(chatID)
            .collection("messages")
            .addSnapshotListener { querySnapshot, error in
                if let error {
                    print(error)
                    return
                }
                guard let documents = querySnapshot?.documents else { return }
                
                let messages = documents.compactMap { document in
                    try? document.data(as: Message.self)
                }
                
                onChange(messages)
            }
    }
}
