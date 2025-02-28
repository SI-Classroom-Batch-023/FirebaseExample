//
//  MessageViewModel.swift
//  FirebaseExample
//
//  Created by Felix B on 27.02.25.
//

import SwiftUI
import FirebaseFirestore

@MainActor
class MessageViewModel: ObservableObject {
    @Published var messages: [Message] = []
    @Published var messageInput = ""
    @Published var usernameToAdd = ""
    @Published var addUserSheetPresented = false
    
    var currentUserID: String? {
        firebaseManager.userID
    }
    
    private var listener: ListenerRegistration?
    private let messageRepository = MessageRepository()
    private let chatRepository = ChatRepository()
    private let userRepository = UserRepository()
    private let firebaseManager = FirebaseManager.shared
    private let chatID: String
    
    init(chatID: String) {
        self.chatID = chatID
        addMessageSnapshotListener()
    }
    
    func sendMessage() {
        guard let id = firebaseManager.userID else { return }
        let message = Message(text: messageInput, senderID: id)
        messageInput = ""
        do {
            try messageRepository.addMessage(chatID: chatID, message: message)
        } catch {
            print(error)
        }
    }
    
    func addMessageSnapshotListener() {
        listener = messageRepository.addMessageSnapshotListener(chatID: chatID) { [weak self] messages in
            self?.messages = messages.sorted { m1, m2 in
                m1.timestamp > m2.timestamp
            }
        }
    }
    
    func addUserToChat() {
        Task {
            do {
                let user = try await userRepository.getUserByUsername(usernameToAdd)
                guard let userToAddID = user.id else { return }
                try await chatRepository.addUserToChat(chatID: chatID, userID: userToAddID)
                usernameToAdd = ""
            } catch {
                print(error)
            }
        }
    }
}

/*
 public
 private
 
 var
 let
 
 @Bindings
 @StateObject
 @States
 */
