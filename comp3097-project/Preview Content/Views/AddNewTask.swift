//
//  AddNewTask.swift
//  comp3097-project
//
//  Created by Andrej Bachvarovski on 2025-03-19.
//

import SwiftUI

struct AddNewTask: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var taskViewModel: TaskViewModel
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var dueDate: Date = Date()
    @State private var status: TaskStatus = .notFinished
    
    var task: Task?
    var isEditing: Bool = false
    
    init(task: Task? = nil, isEditing: Bool = false) {
        self.task = task
        self.isEditing = isEditing
        
        if let task = task {
            _title = State(initialValue: task.title)
            _description = State(initialValue: task.description)
            _dueDate = State(initialValue: task.dueDate)
            _status = State(initialValue: task.status)
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Details")) {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                    DatePicker("Due Date", selection: $dueDate,
                               displayedComponents: .date)
                            
                        }
                    }
                }
            }
        }

struct AddNewTask_Previews: PreviewProvider {
    static var previews: some View {
        AddNewTask()
           .environmentObject(TaskViewModel())
    }
}
