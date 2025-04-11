//
//  searchTasksView.swift
//  comp3097-project
//
//  Created by Teniel Smith-Edwards 101249879 on 2025-04-11.
//

import SwiftUI

struct searchTasksView: View {
    // Connects/Binds model to the view
    @ObservedObject var taskViewModel = TaskViewModel()
    // state for search
    @State private var inputSearch: String = ""
    
    var filteredSearchResults: [Task] {
        if inputSearch.isEmpty {
            return []
        } else {
            return taskViewModel.tasks.filter {
                $0.title.localizedCaseInsensitiveContains(inputSearch) ||
                $0.description.localizedCaseInsensitiveContains(inputSearch)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                            // search implementation
                TextField("Find tasks by title or description", text: $inputSearch)
                                .padding()
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            // displays search results
                if filteredSearchResults.isEmpty && !inputSearch.isEmpty {
                                    Text("No Search Results")
                                        .foregroundColor(.gray)
                                        .padding()
                                } else {
                                    List {
                                        ForEach(filteredSearchResults) { task in
                                            TaskIndividual(task: task, taskViewModel: taskViewModel)
                                        }
                                    }
                                }
                            }
                            .navigationTitle("Search")
                            .navigationBarTitleDisplayMode(.inline)
                        }
                    }
                }

#Preview {
    searchTasksView()
}
