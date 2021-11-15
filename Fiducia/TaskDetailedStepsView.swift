//
//  TaskDetailedStepsView.swift
//  Fiducia
//
//  Created by sap on 15/11/21.
//

import SwiftUI

struct TaskDetailedStepsView: View {
    
    var task: Task
    
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: TaskSummarisedStepsView(task: task)) {
                Image(systemName: "list.bullet.rectangle")
            }
            .buttonStyle(PlainButtonStyle())
        .navigationTitle(task.name)
        }
    }
}


struct TaskDetailedStepsView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailedStepsView(task: Task(name: "Make a call", difficulty: 1, steps: ["hi"]))
    }
}
