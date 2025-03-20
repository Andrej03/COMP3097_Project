// The Model where we build the functionality for the task
// CREATE, UPDATE, DELETE, SAVE ...

import SwiftUI
import Combine
import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = [
        Task(title: "COMP3097 - Lab Exercise 1", description: "Solve some tasks using SwiftUI in a swift playground.", dueDate: Date(), status: TaskStatus(rawValue: "Done")!)
    ]
    
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
