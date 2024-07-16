//
//  HomeView.swift
//  SwiftUIFirebase
//
//  Created by Jason M Davis on 6/17/24.
//
// MARK: ROOTVIEW

import SwiftUI

struct HomeView: View {

// MARK: PROPERTIES
    @State private var showSignInView: Bool = false
    
    
// MARK: BODY
    var body: some View {
        completeView
    }  // End of Body
}  // End of View


// MARK: PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
            HomeView()
    }  // End of Body
}  // End of Preview



// MARK: EXTENSION(S)

extension HomeView {
    
    private var completeView: some View {
        ZStack {
            if !showSignInView {
                NavigationStack {
                    SettingView(showSignInView: $showSignInView)
                    }  // End of NavStack
                }  // End of if
            }  // End of ZStack
            .onAppear { let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
                self.showSignInView = authUser == nil
                    }  // End of onAppear
            .fullScreenCover(isPresented: $showSignInView) {
                NavigationStack { SignInView(showSignInView: $showSignInView) }  // End of NavStack
        }  // End of fullScreenCover
    }  // End of completeView
}  // End of HomeView



//    private var SignInTest: some View {
//        NavigationStack {
//            SettingView(showSignInView: $showSignInView)
//        }  // End of NavStack
//    }  // End of SignInTest
//}  // End of HomeView
