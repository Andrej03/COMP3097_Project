//
//  comp3097_projectApp.swift
//  comp3097-project
//
//  Created by Andrej Bachvarovski on 2025-03-13.
//

import SwiftUI

@main
struct comp3097_projectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
