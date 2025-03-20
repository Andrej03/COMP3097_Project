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
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red)
                    }
                }
                
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
