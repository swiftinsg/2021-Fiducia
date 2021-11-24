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
    
    @Binding var statistic: Statistic
    
    @Binding var tasks: [Task]

    @ObservedObject var tasksData: TasksData
    
    @State var searchText = ""
    
    @State var showSheet = false
    
    @State var isSheetPresented = false
    var body: some View {
        NavigationView {
            
            List {
                if searchText.isEmpty {
                    ForEach($tasksData.tasks) { $task in
                        NavigationLink(destination:
                                        TaskDetailedStepsView(task: $task).navigationBarBackButtonHidden(true).navigationBarHidden(true))
                        {
                            HStack {
                                Text(task.name)
                                Spacer()
                                ZStack {
                                    if task.difficulty == "1" {
                                        Text("⭐")
                                        
                                    } else if task.difficulty == "2" {
                                        Text("⭐⭐")
                                        
                                    } else if task.difficulty == "3" {
                                        Text("⭐⭐⭐")
                                        
                                    }
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
            .lineLimit(5)

            
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
        TasksView(statistic: .constant(Statistic(numberTasksCompleted: 0, typeTasksCompleted: [""], achievementsCompleted: [""])), tasks: .constant([Task(name: "Make a call", difficulty: "1", steps: ["hi"])]), tasksData: TasksData())
    }
}

