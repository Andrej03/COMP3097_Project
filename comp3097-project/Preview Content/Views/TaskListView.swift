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
                    TaskIndividual(task: task, taskViewModel: taskViewModel)
                }
            }
            .navigationTitle("Task List")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(trailing: NavigationLink(destination: AddNewTask().environmentObject(taskViewModel)) {
                Image(systemName: "plus")
                    .font(.title2)
                    .foregroundColor(.cyan)
                    .accessibilityLabel("Add Task")
                }
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
