//
//  TaskViewModel.swift
//  comp3097-project
//
//  Created by Andrej Bachvarovski on 2025-03-19.
//

// The Model where we build the functionality for the task
// CREATE, UPDATE, DELETE, SAVE ...

import SwiftUI
import Combine
import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    
    init() {
        loadTasks()
    }
    
    func createTask(title: String) {
        
    }
    
    func updateTask(id: Int, title: String) {
        
    }
    
    func deleteTask(id: Int) {
        
    }
    
    func saveTasks() {
        
    }
    
    func loadTasks() {
        
    }
}
