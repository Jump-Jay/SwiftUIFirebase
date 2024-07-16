//
//  GoogleSignInResultModel.swift
//  SwiftUIFirebase
//
//  Created by Jason M Davis on 6/30/24.
//

import Foundation
import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth

struct GoogleSignInResultModel {
    let idToken: String
    let accessToken: String
    let name: String?
    let email: String?
}  // End of GoogleSignInResultModel
