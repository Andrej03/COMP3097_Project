//
//  TaskIndividual.swift
//  comp3097-project
//
//  Created by Teniel Smith-Edwards on 2025-03-19.
//

import SwiftUI

struct TaskIndividual: View {
    var task: Task
    @ObservedObject var taskViewModel: TaskViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Task: ")
                    .fontWeight(.bold)
                Text(task.title)
                    .strikethrough(task.status.color == .green)
                Spacer()
                VStack {
                    Circle()
                        .fill(task.status.color)
                        .frame(width: 25, height: 25)
                    Text(task.status.rawValue)
                        .foregroundColor(.gray)
                        .font(.caption)
                }
            }
            HStack {
                Text("Description: ")
                    .fontWeight(.bold)
                Text(String(task.description))
            }
            HStack {
                Text("Due Date: ")
                    .fontWeight(.bold)
                Text(String(task.formattedDueDate))
            }
            
            Spacer()
            
            NavigationLink(destination: AddNewTask(task: task, isEditing: true).environmentObject(taskViewModel)) {
                Text("Edit Task")
                    .font(.title2)
                    .padding()
                    .foregroundColor(.cyan)
            }
            .padding(.bottom, 20)
        }
        .padding()
    }
}
