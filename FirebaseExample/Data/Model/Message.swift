//
//  Message.swift
//  FirebaseExample
//
//  Created by Felix B on 27.02.25.
//

import FirebaseFirestore

struct Message: Codable, Identifiable {
    @DocumentID
    var id: String?
    var text: String
    var senderID: String
    var timestamp: Date = Date()
}
