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
                Spacer()
                
                Text("Welcome to Your To-Do App")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.cyan)
                    .multilineTextAlignment(.center)
                    .padding()

                Spacer()

                NavigationLink(destination: TaskListView().navigationBarBackButtonHidden(true)) {
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
            .background(Color.black.ignoresSafeArea())
        }
    }
}
 
