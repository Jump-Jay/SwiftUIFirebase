//
//  SignInView.swift
//  SwiftUIFirebase
//
//  Created by Jason M Davis on 6/16/24.
//

// MARK: AUTHENTICATION VIEW

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct SignInView: View {

// MARK: PROPERTIES
    @StateObject private var aViewModel = AuthenticationViewModel()
    @Binding var showSignInView: Bool
    
// MARK: BODY
    var body: some View {
            completeView
    }  // End of Body
}  // End of View



// MARK: PREVIEW
struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignInView(showSignInView: .constant(false))
        }  // End of NavStack
    }  // End of Body
}  // End of Preview


// MARK: EXTENSION

extension SignInView {
    
    private var completeView: some View {
        NavigationStack {
            VStack {
                signIn1
                googleSignIn
                    .padding()
//                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }  // End of VStack
            Spacer()
        }  // End of NavStack
        .navigationTitle("Sign In")
    }  // End of completeView
    
    /// This is to sign in via email on the next screen
    ///- Parameter Text: You use the email and password via secure field to get authentication which will be on the next screen.
    ///- Returns: If successful, you proceed on to the next screen which should be the home screen.
    private var signIn1: some View {
        NavigationLink {
            SignInEmailView(showSignInView: $showSignInView)
        } label: {
            Text("Sign in with email!")
                .font(.title)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
        }  // End of label
        .padding()
    }  // End of signIn1
    
    private var googleSignIn: some View {
        GoogleSignInButton (viewModel: GoogleSignInButtonViewModel (scheme: .dark, style: .wide, state: .normal)) {
            Task {
                do {
                    try await aViewModel.signInWithGoogle()
                    showSignInView = false
                } catch {
                    print(error)
                }  // End of do-catch
            }  // End of Task
        }  // End of
        .frame(height: 55)
        .background(Color.blue)
        .padding(.horizontal,5)
        .cornerRadius(20)
    }  // End of googleSignIn
    
}  // End of SignInView
