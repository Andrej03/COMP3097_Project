import SwiftUI

struct ContentView: View {
    var body: some View {
        LauncherView()
    }
}

#Preview {
    ContentView()
}

//struct ContentView: View {
//    @EnvironmentObject var taskViewModel: TaskViewModel
//    @State private var showingAddTask = false
//    
//    var body: some View {
//        NavigationView {
//            TaskListView()
//                .navigationBarTitle("Tasks To Do App")
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarTrailing) {
//                        Button(action: {
//                            showingAddTask = true
//                        }) {
//                            Image(systemName: "plus")
//                        }
//                    }
//                }
//                .sheet(isPresented: $showingAddTask) {
//                    AddNewTask()
//                }
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .environmentObject(TaskViewModel())
//    }
//}
