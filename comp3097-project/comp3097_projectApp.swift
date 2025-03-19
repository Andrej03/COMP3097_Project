//
//  comp3097_projectApp.swift
//  comp3097-project
//
//  Created by Andrej Bachvarovski on 2025-03-13.
//

// comp3097_projectApp.swift
import SwiftUI

@main
struct comp3097_projectApp: App {
    @StateObject private var taskViewModel = TaskViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(taskViewModel)
        }
    }
}
