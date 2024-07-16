//
//  SettingViewModel.swift
//  SwiftUIFirebase
//
//  Created by Jason M Davis on 6/20/24.
//

import Foundation

@MainActor
    final class SettingViewModel: ObservableObject {
// MARK: PROPERTIES
        @Published var authProviders: [AuthProviderOption] = []
        
        
        
// MARK:  FUNCTIONS
        
        func loadAuthProviders() {
            do {
                let providers = try AuthenticationManager.shared.getProviders()
                          authProviders = providers
            } catch {
                print("Failed load on auth providers: (error)")
            }
//            if let providers = try? AuthenticationManager.shared.getProviders() {
//                authProviders = authProviders
//            }  // End of if-let
        }  // End of loadAuthProviders
        
        func signOut() throws {
            try AuthenticationManager.shared.signOut()
        }  // End of signOut
        
        func resetPassword() async throws {
            let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
            
            guard let email = authUser.email else {
                throw URLError(.fileDoesNotExist)
            }  // End of guard-let
                    
            try await AuthenticationManager.shared.resetPassword(email: email)
            
            
    //        let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
    //        guard let email = authUser.email else
    //        { throw URLError(.fileDoesNotExist) }  // End of guard let
    //        try await AuthenticationManager.shared.resetPassword(email: email)
        }  // End of resetPassword
        
        func updateEmail() async throws {
            let email = "hello12@testing.com"
            try await AuthenticationManager.shared.resetPassword(email: email)
        }  // End of updatePassword
        
        func updatePassword(password: String) async throws {
            try await AuthenticationManager.shared.updatePassword(password: password)
        }  // End of updatePassword
        
    }  // End of class - SettingViewModel
