//
//  ContentView.swift
//  SwiftUIFirebase
//
//  Created by Jason M Davis on 5/20/24.
//

import SwiftUI

struct ContentView: View {
// MARK: PROPERTIES
    
    
    
// MARK: BODY
    var body: some View {
        completeView
        .padding()
    }  // End of Body
}  // End of View


// MARK: PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }  // End of Body
}  // End of Preview


// MARK: EXTENSION

extension ContentView {
    
    private var completeView: some View {
        VStack {
            Image(systemName: "globe")
                .font(.largeTitle)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }  // End of VStack
    }  // End of completeView
}  // End of ContentView
