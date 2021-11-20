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
    
    @ObservedObject var tasksData = TasksData()
    
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                if searchText.isEmpty {
                    ForEach($tasksData.tasks) { $task in
                        NavigationLink(destination:
                                        TaskDetailedStepsView(task: $task))
                        {
                            Text(task.name)
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
                            Text(task.name)
                        }
                    }
                }
                
            }
            .searchable(text: $searchText)
            .navigationTitle("Tasks")
        }
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView(tasks: .constant([Task(name: "Make a call", difficulty: 1, steps: ["hi"])]))
    }
}
