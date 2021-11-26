//
//  TasksView.swift
//  Fiducia
//
//  Created by sap on 15/11/21.
//

import SwiftUI

struct TasksView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
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
            ScrollView {
                LazyVStack {
                    if searchText.isEmpty {
                        ForEach($tasksData.tasks) { $task in
                            NavigationLink(destination:
                                            TaskDetailedStepsView(task: $task, tasksData: tasksData).navigationBarTitleDisplayMode(.inline))
                            {
                                HStack {
                                    Text(task.name)
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
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
                                    Image(systemName: "chevron.forward")
                                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                }
                                
                                .padding(30)
                                .background(colorScheme == .dark ? Color.darkBlue : Color.lightBlue)
                                .cornerRadius(15)
                                .padding(.leading, 15)
                                .padding(.trailing, 15)
                                .padding(.bottom, 15)
                                
                                .sheet(isPresented: $showSheet) {
                                    TaskSummarisedStepsView(task: $task, tasksData: tasksData)
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
                                            TaskDetailedStepsView(task: $tasksData.tasks[taskIndex], tasksData: tasksData))
                            {
                                HStack {
                                    Text(task.name)
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(.black)
                                    Spacer()
                                    if task.difficulty == "1" {
                                        Text("⭐")
                                    } else if task.difficulty == "2" {
                                        Text("⭐⭐")
                                    } else if task.difficulty == "3" {
                                        Text("⭐⭐⭐")
                                    }
                                }
                                .padding(20)
                                .background(colorScheme == .dark ? Color.darkBlue : Color.lightBlue)
                                .cornerRadius(15)
                                .padding(5)
                                
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
            
        }
        .sheet(isPresented: $isSheetPresented) {
            NewTaskView(tasksData: tasksData)
        }
    }
}
struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView(statistic: .constant(Statistic(numberTasksCompleted: 0, typeTasksCompleted: [""], achievementsCompleted: [""])), tasks: .constant([Task(name: "", difficulty: "", steps: [""])]), tasksData: TasksData())
    }
}

