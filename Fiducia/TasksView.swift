//
//  TasksView.swift
//  Fiducia
//
//  Created by sap on 15/11/21.
//

import SwiftUI

struct TasksView: View {
    
    @State var text = ""
    
    @State var isEditing = false

    @Binding var tasks: [Task]

    @ObservedObject var tasksData: TasksData //Sets that this is the owner of this var and creates an instance of TaskData()
    
    @State var searchText = ""
    
    @State var showSheet = false
    
    @State var isSheetPresented = false
    var body: some View {
        NavigationView {
            
            List {
                if searchText.isEmpty {
                    ForEach($tasksData.tasks) { $task in
                        NavigationLink(destination:
                                        TaskDetailedStepsView(task: $task))
                        {
                            HStack {
                                Text(task.name)
                                if task.difficulty == "1" {
                                    Text("⭐")
                                } else if task.difficulty == "2" {
                                    Text("⭐⭐")
                                } else if task.difficulty == "3" {
                                    Text("⭐⭐⭐")
                                }
                            }
                            
                                .sheet(isPresented: $showSheet) {
                                    TaskSummarisedStepsView(task: $task)
                                }
                            

                        }
                        .swipeActions(edge: .leading) {
                            Button(action: {
                                self.showSheet.toggle()
                            }) {
                                Image(systemName: "list.bullet.rectangle")
                            }
                        }
                    }

                } else {
                    let tasks = tasksData.tasks.filter { task in
                        task.name.lowercased().contains(searchText.lowercased())
            
                    }
                    ForEach(tasks) { task in
                        let taskIndex = tasksData.tasks.firstIndex(of: task)!
                        NavigationLink(destination:
                                        TaskDetailedStepsView(task: $tasksData.tasks[taskIndex]))
                        {
                            HStack {
                                Text(task.name)
                                if task.difficulty == "1" {
                                    Text("⭐")
                                } else if task.difficulty == "2" {
                                    Text("⭐⭐")
                                } else if task.difficulty == "3" {
                                    Text("⭐⭐⭐")
                                }
                            }
                                                            
                        }
                        
                    }
                }
            }

            
            .searchable(text: $searchText)
            .navigationTitle("Tasks")
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        self.isSheetPresented.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            
        }
        .sheet(isPresented: $isSheetPresented) {
            NewTaskView(tasksData: tasksData) // Changed this to pass the tasksData to the other view
        }
    }
}
struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView(tasks: .constant([Task(name: "Make a call", difficulty: "1", steps: ["hi"])]), tasksData: TasksData())
    }
}

