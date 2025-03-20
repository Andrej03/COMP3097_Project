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
            List { // Displays each task as a list item in the task list view
                ForEach(taskViewModel.tasks) { task in
                    TaskIndividual(task: task, taskViewModel: taskViewModel)
                }
            }
            .navigationTitle("Task List")
            .navigationBarTitleDisplayMode(.inline) // have the navigation bar on one level
            .navigationBarBackButtonHidden(true) // hides back button
            // navigates to add task view when user taps on the plus sign
            .navigationBarItems(trailing: NavigationLink(destination: AddNewTask().environmentObject(taskViewModel)) {
                Image(systemName: "plus") // displays plus sign - represents add a task
                    .font(.title2)
                    .foregroundColor(.cyan)
                    .accessibilityLabel("Add Task") // voiceover and hover label
                }
            )
        }
        //.navigationViewStyle(StackNavigationViewStyle()) // disables back swiping on iPads
    }
}
