//
//  SignInEmailViewModel.swift
//  SwiftUIFirebase
//
//  Created by Jason M Davis on 6/16/24.
//

import Foundation

@MainActor
final class SignInEmailViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    
    /// This is create a user
    ///- Parameter Text: There is a choice of several buttons, they can only choose one to proceed to the next screen.
    ///- Returns: Only one of the choosen options
    func createNewUser() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found... ☹️")
            return
        }  // End of guard let
        let _ = try await AuthenticationManager.shared.createNewUser(email: email, password: password)
        print("Sucess... & returned user data")
        print("Email = \(email), Password = \(password)")
    }  // End of createNewUser
    
    /// This  is to sign in via email & password
    ///- Parameter Text: The user will have to use their signed up email & password to sign in.  Invalid entries means they don't get in.
    ///- Returns: Once authenticated, user will recieve a token to sign in
    func signInUser() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found... ☹️")
            return
        }  // End of guard let
        let _ = try await AuthenticationManager.shared.signInUser(email: email, password: password)
        print("Sucess... & returned user data")
        print("Email = \(email), Password = \(password)")
    }  // End of signInUser
    
    
}  // End of SignInEmailViewModel
