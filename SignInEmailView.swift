//
//  SignInEmailView.swift
//  SwiftUIFirebase
//
//  Created by Jason M Davis on 6/16/24.
//

// MARK: SIGNiNeMAILvIEW

import SwiftUI

struct SignInEmailView: View {
    
// MARK: PROPERTIES
    @StateObject private var viewModel =  SignInEmailViewModel()
    @Binding var showSignInView: Bool
    
// MARK: BODY
    var body: some View {
        completeView
    }  // End of Body
}  // End of View


// MARK: PREVIEW
struct SignInEmailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignInEmailView(showSignInView: .constant(false))
        }  // End of NavStack
    }  // End of Body
}  // End of Preview

// MARK: EXTENTIONS

extension SignInEmailView {
    
    private var completeView: some View {
        signIn1
    }  // End of completeView
    
    private var signIn1: some View {
        VStack {
            emailField
            pwordField
            returnButton
        }  // End of VStack
        .padding()
        .navigationTitle("Sign in with email")
    }  // End of test1
    
    private var emailField: some View {
        TextField("Email...", text: $viewModel.email)
            .padding()
            .background(Color.gray.opacity(0.2) )
            .cornerRadius(10)
    }  // End of emailField
    
    private var pwordField: some View {
        SecureField("Password", text: $viewModel.password)
            .padding()
            .background(Color.gray.opacity(0.2) )
            .cornerRadius(10)
    }  // End of pwordField
    
    private var returnButton: some  View {
        Button(action: {
            Task {
                do {
                    try await viewModel.createNewUser()
                    showSignInView = true
                    return
                } catch {
                    print ("Error.... 🔥" )
                }  // End of do-catch
                do {
                    try await viewModel.signInUser()
                    showSignInView = false
                    return
                } catch {
                    print ("Success.... signed back in. 😊" )
                }  // End of do-catch
            }  // End of Task
        }, label: {
            Text("Sign In")
                .frame(width: 200, height: 55)
                .font(.title2)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10.0)
        })  // End of Button
    }  // End of returnButton
    
}  // End of Extension
