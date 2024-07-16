//
//  AuthenticationManager.swift
//  SwiftUIFirebase
//
//  Created by Jason M Davis on 6/17/24.
//


import Foundation
import FirebaseAuth


enum AuthProviderOption: String {
    case email = "testing1234"
    case google = "google.com"
}  // End of AuthProviderOption

final class AuthenticationManager {
    
    static let shared = AuthenticationManager()
    private init() {}  // End of init
    
    func getAuthenticatedUser() throws ->  AuthDataResultModel  {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }  // End of guard-let
        return AuthDataResultModel(user: user)
    }  // End of getUser
    
    func signOut() throws {
        try Auth.auth().signOut()
    }  // End of signOut
    
// google.com <---- here
// password <---- here
    
    func getProviders() throws -> [AuthProviderOption] {
        guard let providerData = Auth.auth().currentUser?.providerData else {
            print("No joy")
            throw URLError(.badServerResponse)
        }  // End of guard-else
        var providers: [AuthProviderOption] = []
        for provider in providerData {
            print(provider.providerID)
            if let option = AuthProviderOption(rawValue: provider.providerID) {
                providers.append(option)
            }  else {  }  //  End  of else
        }  // End of guard-let
        print(providers)
        return providers
    }   // End of getProvider
    
}  // End of AuthenticationManager

// MARK: SIGN IN - EMAIL

extension AuthenticationManager {
    
    func createNewUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }  // End of createNewUser

    func signInUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }  // End of signInUser

    func resetPassword(email: String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }  // End of resetPassword

    func updatePassword(password: String) async throws {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }  // End of guard-let
        try await user.updatePassword(to: password)
    }  // End of updatePassword

    func updateEmail(email: String) async throws {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }  // End of guard-let
        try await user.updatePassword(to: email)
    }  // End of updateEmail

}  // End of AuthenticationManager - Email sign in section

//  MARK: SIGN IN - GOOGLE

extension AuthenticationManager {
    
    @discardableResult
    func signInWithGoogle(tokens: GoogleSignInResultModel) async throws -> AuthDataResultModel {
        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.accessToken)
        return try await signIn(credential: credential)
    }  // End of signInWithGoogle
    
    func signIn(credential: AuthCredential) async throws -> AuthDataResultModel {
        let authDataResult =  try await Auth.auth().signIn(with: credential)
        return AuthDataResultModel(user: authDataResult.user)
    }  // End of signInWithCredential
    
}  // End of AuthenticationManager - Google sign in section

// Code snippets JIC
/*
//struct AuthDataResultModel {
//    let uid: String
//    let email: String?
//    let photoUrl: String?
//
//    init(user: User) {
//        self.uid = user.uid
//        self.email = user.email
//        self.photoUrl = user.photoURL?.absoluteString
//    }  // End of init
//
//}  // End of struct
*/

//    func createNewUser(email: String, password: String) async throws -> AuthDataResultModel {
//        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
//        return AuthDataResultModel(user: authDataResult.user)
//    }  // End of createNewUser

//    func signInUser(email: String, password: String) async throws -> AuthDataResultModel {
//        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
//        return AuthDataResultModel(user: authDataResult.user)
//    }  // End of signInUser

//    func resetPassword(email: String) async throws {
//        try await Auth.auth().sendPasswordReset(withEmail: email)
//    }  // End of resetPassword

//    func updatePassword(password: String) async throws {
//    guard let user = Auth.auth().currentUser else {
//        throw URLError(.badServerResponse)
//    }  // End of guard-let
//    try await user.updatePassword(to: password)
//}  // End of updatePassword

//    func updateEmail(email: String) async throws {
//    guard let user = Auth.auth().currentUser else {
//        throw URLError(.badServerResponse)
//    }  // End of guard-let
//    try await user.updatePassword(to: email)
//}  // End of updateEmail


/*
 [AuthProviderOption]
 */
