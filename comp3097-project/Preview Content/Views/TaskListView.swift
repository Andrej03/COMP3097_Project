//
//  Task.swift
//  comp3097-project
//
//  Created by Andrej Bachvarovski on 2025-03-19.
//  Updated by Teniel Smith-Edwards on 2025-03-19.
//

import SwiftUI

struct TaskListView: View {
    // Connects/Binds model to the view
    @ObservedObject var taskViewModel = TaskViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(taskViewModel.tasks) { task in
                    TaskRow(task: task, taskViewModel: taskViewModel)
                }
            }
            .navigationTitle("Task List")
        }
    }
}
