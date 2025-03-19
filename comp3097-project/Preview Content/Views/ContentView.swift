//
//  ContentView.swift
//  comp3097-project
//
//  Created by Andrej Bachvarovski on 2025-03-13.
//

import SwiftUI

struct ContentView: View {
//    @EnvironmentObject var taskViewModel: TaskViewModel
//    @State private var showingAddTask = false
//    
//    var body: some View {
//        NavigationView {
//            TaskListView()
//                .navigationTitle("Advanced ToDo App - Task List")
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
//                    AddTaskView()
//                }
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TaskViewModel())
    }
}   
