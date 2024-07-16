//
//  AuthenticationViewModel.swift
//  SwiftUIFirebase
//
//  Created by Jason M Davis on 6/29/24.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift

@MainActor
    final class AuthenticationViewModel: ObservableObject {
    
        /// This is to clean up the code; the helper file is "SignInGoogleHelper" and is located in Utilities
        ///- Parameter Text: The Google sign in is decoupled from FireBase to make it run smoother
        ///- Returns:  Once you get authenticated via Google, a token will be given and tranfered to Firebase for signing into app.
        func signInWithGoogle() async throws {
            let helper = SignInGoogleHelper()
            let tokens = try await helper.signInGoogle()
            try await AuthenticationManager.shared.signInWithGoogle(tokens: tokens)
        }  // End of signInWithGoogle
    
}  //  End of AuthenticationViewModel
