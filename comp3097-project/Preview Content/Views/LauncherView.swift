//
//  LauncherView.swift
//  comp3097-project
//
//  Created by Teniel Smith-Edwards on 2025-03-20.
//

import SwiftUI

struct LauncherView: View {
    var body: some View {
        NavigationView {
            VStack {
                // Spacer used above and below text to push the text to the middle of the screen
                Spacer()
                
                // Welcome text
                Text("Welcome to Your To-Do App")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.cyan)
                    .multilineTextAlignment(.center)
                    .padding()

                Spacer()

                // Navigates user to the Task List page - through manual navigation
                NavigationLink(destination: TaskListView().navigationBarBackButtonHidden(true)) { // disables back button so the user cannot go back to the launcher
                    Text("View Tasks")
                        .font(.title)
                        .padding()
                        .background(Color.cyan)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 35)
                }
                .padding(.bottom, 50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.ignoresSafeArea()) // enables the background color to black on the whole screen
        }
    }
}
 
