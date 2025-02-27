//
//  Chat.swift
//  FirebaseExample
//
//  Created by Felix B on 27.02.25.
//

import FirebaseFirestore

struct Chat: Codable, Identifiable {
    @DocumentID
    var id: String?
    var name: String
    var admin: String
    var members: Set<String>
    var lastMessage: String = ""
    var lastMessageTime: Date = Date()
    var creationDate: Date = Date()
}
