import SwiftUI

// The project uses MVC structure code where it allows for developers to make specified structured code
// The will only be used for the design feature
struct TaskIndividual: View {
    var task: Task
    @ObservedObject var taskViewModel: TaskViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // displays individual task - task name, description, due date, and status
            // following will also display the fixed style of a task on
            // how it will be displayed.
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
            
            // sends user to edit task screen
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

struct TaskIndividual_Previews: PreviewProvider {
    static var previews: some View {
        let sampleTask = Task(
            title: "Sample Task",
            description: "",
            dueDate: Date(),
            status: .inProgress
        )
        
        return TaskIndividual(task: sampleTask, taskViewModel: TaskViewModel())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
