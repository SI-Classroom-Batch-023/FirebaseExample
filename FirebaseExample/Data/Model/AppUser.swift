//
//  AppUser.swift
//  FirebaseExample
//
//  Created by Felix B on 26.02.25.
//

import Foundation
import FirebaseFirestore

struct AppUser: Codable {
    @DocumentID
    var id: String?
    var email: String
    var username: String
    var creationDate: Date = Date()
}
