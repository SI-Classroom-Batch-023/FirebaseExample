//
//  FirebaseError.swift
//  FirebaseExample
//
//  Created by Felix B on 28.02.25.
//

enum FirebaseError: String, Error {
    case userNotFound = "Der Nutzer konnte nicht gefunden werden."
    case usernameAlreadyExists = "Der Nutzername ist bereits vergeben!"
}
