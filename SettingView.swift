//
//  SettingView.swift
//  SwiftUIFirebase
//
//  Created by Jason M Davis on 6/20/24.
//

import SwiftUI

struct SettingView: View {
// MARK: PROPERTIES
    @StateObject private var viewModel = SettingViewModel()
    @Binding var showSignInView: Bool 
    
// MARK: BODY
    var body: some View {
        completeView
    }  // End of Body
}  // End of View

// MARK: PREVIEW
struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingView(showSignInView: .constant(false))
        }  // End of NavStack
    }  // End of Body
}  // End of Preview


// MARK: SCREEN COMPONETS

extension SettingView {
    
    /// This is the complete view of all componets
    ///- Parameter Text :This takes all subsections from the different API's
    ///- Returns:  Everything is done asyncronously
    private var completeView: some View {
        list
    }  // End of completeView
    
    private var list: some View {
        List {
            logOutButton
            if viewModel.authProviders.contains(.email) { emailSection }  // End of if
            }  // End of list
        .onAppear { viewModel.loadAuthProviders() }  // End of onAppear
        .navigationTitle("Settings")
    }  // End of list
    
    private var logOutButton: some View {
            Button("Log Out") {
                Task {
                    do {
                        try viewModel.signOut()
                        showSignInView = true
                    } catch {
                        print("Error")
                    }  // End of do-catch
                }  // End of Task
            }  // End of Button
    }  // End of logOutButton
    
    private var emailSection: some View {
            Section {
                resetPasswordButton
               updatePasswordButton
               updateEmailButton
            } header: {
               Text("Email Section")
            }  // End of section
        }  // End of emailSection
    
    private var resetPasswordButton: some View {
        Button("Reset Password") {
            Task {
                do {
                    try await viewModel.resetPassword()
                    print("Reset sent")
                } catch {
                    print(error)
                }  // End of do-catch
            }  // End of Task
        }  // End of Button
    }  // End of ResetPasswordButton
    
    private var updatePasswordButton: some View {
        Button("Update Password") {
            Task {
                do {
                    try await viewModel.updatePassword(password: "")
                    print("Password updated...")
                } catch {
                    print(error)
                }  // End of do-catch
            }  // End of Task
        }  // End of Button
    }  // End of updatePasswordButton
    
    private var updateEmailButton: some View {
        Button("Update Email") {
            Task {
                do {
                    try await viewModel.updateEmail()
                    print("Email updated...")
                } catch {
                    print(error)
                }  // End of do-catch
            }  // End of Task
        }  // End of Button
    }  // End of updatePasswordButton
    
}  // End of extension
