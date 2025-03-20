// The Model where we build the functionality for the task
// CREATE, UPDATE, DELETE, SAVE ...

import Foundation
import SwiftUI
import Combine

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    
    private let saveKey = "SavedTasks"
    
    init() {
        loadTasks()
    }
    
    // Make new Task with satisfied fields
    func addTask(title: String, description: String, dueDate: Date, status: TaskStatus) {
        let task = Task(title: title, description: description, dueDate: dueDate, status: status)
        tasks.append(task)
        saveTasks()
    }
    
    // Change of information to a task already set
    func updateTask(task: Task, title: String, description: String, dueDate: Date, status: TaskStatus) {
        if let indexTasks = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[indexTasks].title = title
            tasks[indexTasks].description = description
            tasks[indexTasks].dueDate = dueDate
            tasks[indexTasks].status = status
            saveTasks()
        }
    }
    
    // Task Removal
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
        saveTasks()
    }
    
    // Allow to save task features
    private func saveTasks() {
        if let encoded = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    // Task loader to show on screen
    private func loadTasks() {
        if let data = UserDefaults.standard.data(forKey: saveKey),
           let decoded = try? JSONDecoder().decode([Task].self, from: data) {
            tasks = decoded
        }
    }
}
