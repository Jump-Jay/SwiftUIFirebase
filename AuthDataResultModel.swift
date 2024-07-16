//
//  AuthDataResultModel.swift
//  SwiftUIFirebase
//
//  Created by Jason M Davis on 6/24/24.
//

import Foundation
import Firebase

/// This is to say hi
///- Parameter Text: Booga booga
///
struct AuthDataResultModel {
    let uid: String
    let email: String?
    let photoUrl: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }  // End of init
    
//    enum AuthProviderOption: String {
//        case email = "testing1234"
//        case google = "google.com"
//    }  // End of AuthProviderOption
    
}  // End of struct
