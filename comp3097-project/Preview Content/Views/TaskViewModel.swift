// The Model where we build the functionality for the task
// CREATE, UPDATE, DELETE, SAVE ...

import Foundation
import SwiftUI
import Combine

// ViewModel to manage the list of tasks and their persistent storage
class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    
    private let saveKey = "SavedTasks"

     // Initialize and load previously saved tasks
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
    
       // Delete a task from the list
    func deleteTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks.remove(at: index)
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
    
    // Setup of alert notification for the task due tomorrow
    func alertNotification() -> [Task] {
            let calendar = Calendar.current
            let todayStart = calendar.startOfDay(for: Date())
        
            // Calculate tomorrow's date by adding 1 day to today's start
            guard let tomorrow = calendar.date(byAdding: .day, value: 1, to: todayStart) else { return [] }
             // Returns a filtered list of tasks whose due date matches tomorrow's date.
            // This filter helps to show alert notifications for tasks that are due the next day.
            // Johana Romero | ID: 101445658
            return tasks.filter { calendar.isDate($0.dueDate, inSameDayAs: tomorrow) }
    }
}
