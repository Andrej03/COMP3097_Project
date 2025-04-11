import SwiftUI

struct TaskListView: View {
    // Connects/Binds model to the view
    @ObservedObject var taskViewModel = TaskViewModel()
    @State private var showAlert = false
    @State private var alertNotificationMessage = ""
    
    var body: some View {
        NavigationView {
            // Static scrollable test list display for the tasks
            List {
                ForEach(taskViewModel.tasks) { task in
                    TaskIndividual(task: task, taskViewModel: taskViewModel) // TaskViewModel variables taken as parameters from the file
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
                })
            .onAppear {
            // Check for tasks due tomorrow
            let dueTomorrowTasks = taskViewModel.alertNotification()
            if !dueTomorrowTasks.isEmpty {
                let taskTitles = dueTomorrowTasks.map { $0.title }.joined(separator: ", ")
                        alertNotificationMessage = "You have task(s) due tomorrow: \(taskTitles)"
                        showAlert = true
                    }
                }
                // Present an alert if tasks due tomorrow exist
                .alert("Task Reminder", isPresented: $showAlert) {
                    Button("OK", role: .cancel) { }
                } message: {
                    Text(alertNotificationMessage)
                }
            }
        }
    }

struct TaskListView_Preview: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
