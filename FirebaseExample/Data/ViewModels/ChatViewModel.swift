//
//  ChatViewModel.swift
//  FirebaseExample
//
//  Created by Felix B on 27.02.25.
//

import SwiftUI
import FirebaseFirestore

@MainActor
class ChatViewModel: ObservableObject {
    
    @Published var chats: [Chat] = []
    
    
    private var listener: ListenerRegistration?
    private let chatRepository = ChatRepository()
    private let firebaseManager = FirebaseManager.shared
    
    init() {
        addSnapshotListener()
    }
    
    deinit {
        listener?.remove()
        listener = nil
    }
    
    func createChat() {
        guard let id = firebaseManager.userID else { return }
        let chat = Chat(name: "testchat\(Array(0...100).randomElement() ?? 0)", admin: id, members: [id])
        do {
            try chatRepository.createChat(chat)
        } catch {
            print(error)
        }
    }
    
    func addSnapshotListener() {
        self.listener = chatRepository.addChatSnapshotListener { [weak self] chats in
            self?.chats = chats
        }
    }
    
}
