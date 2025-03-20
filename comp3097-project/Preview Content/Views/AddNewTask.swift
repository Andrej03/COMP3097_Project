import SwiftUI

struct AddNewTask: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var taskViewModel: TaskViewModel

    // Model type variables 
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var dueDate: Date = Date()
    @State private var status: TaskStatus = .notFinished
    
    var task: Task?
    var isEditing: Bool = false
    
    init(task: Task? = nil, isEditing: Bool = false) {
        self.task = task
        self.isEditing = isEditing

        // Task sample structure to let the rest of the application know what steps to follow
        if let task = task {
            _title = State(initialValue: task.title)
            _description = State(initialValue: task.description)
            _dueDate = State(initialValue: task.dueDate)
            _status = State(initialValue: task.status)
        }
    }
    
    var body: some View {
        NavigationView {
            // Form design feature to add internal services into the design feature
            Form {
                Section(header: Text("Task Details")) {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                    DatePicker("Due Date", selection: $dueDate,
                               displayedComponents: .date)
                    
                }
                
                Section(header: Text("Status")){
                    Picker("Status", selection: $status) {
                        ForEach(TaskStatus.allCases) { status in
                            Text(status.rawValue).tag(status)
                        }
                    }
                    .pickerStyle(.wheel)
                }
            }
            .navigationTitle(isEditing ? "Edit Task" : "Add Task")
            .toolbar {
                // Add or Edit feature to allow the user to make new or update old task
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        if !isEditing && !title.isEmpty {
                            taskViewModel.addTask(title: title, description: description, dueDate: dueDate, status: status)
                        }
                        dismiss()
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.blue)
                    }
                }
                // Dismis or cancel task creatiion/edit 
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red)
                    }
                }
                // Testing feature to allow for task creation submition
                ToolbarItem(placement: .bottomBar) {
                    Button(isEditing ? "Save Changes" : "Add Task") {
                        if isEditing, let task = task {
                            taskViewModel.updateTask(task: task, title: title, description: description, dueDate: dueDate, status: status)
                        } else {
                            taskViewModel.addTask(title: title, description: description, dueDate: dueDate, status: status)
                        }
                        dismiss()
                    }
                    .disabled(title.isEmpty)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.horizontal)
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
