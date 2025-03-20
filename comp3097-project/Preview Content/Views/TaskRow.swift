//
//  TaskRow.swift
//  comp3097-project
//
//  Created by Teniel Smith-Edwards on 2025-03-19.
//

import SwiftUI

struct TaskRow: View {
    var task: Task
    @ObservedObject var taskViewModel: TaskViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Task: ")
                Text(task.title)
                    .strikethrough(task.status.color == .green)
                Spacer()
                VStack {
                    Circle()
                        .fill(task.status.color)
                        .frame(width: 15, height: 15)
                    Text(task.status.rawValue)
                        .foregroundColor(.gray)
                }
            }
            HStack {
                Text("Description: ")
                Text(task.description)
            }
            HStack {
                Text("Due Date: ")
                Text(String(task.formattedDueDate))
            }
        }
        .padding()
    }
}
