//
//  SwiftUIFirebaseApp.swift
//  SwiftUIFirebase
//
//  Created by Jason M Davis on 5/20/24.
//

import SwiftUI
import Firebase


@main
struct SwiftUIFirebaseApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
   
    var body: some Scene {
        WindowGroup {
                HomeView()
        }  // End of WindowGroup
    }  // End of Scene
}  // End of App

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey
                                  : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        print("Configured Firebase complete!")
        return true
    }  // End of Func
}  // End of Class


