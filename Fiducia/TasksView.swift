//
//  TasksView.swift
//  Fiducia
//
//  Created by sap on 15/11/21.
//

import SwiftUI

struct TasksView: View {
    
    
    
    var body: some View {
        NavigationView {
                    List(tasks) { task in
                        NavigationLink(destination: TaskDetailedStepsView(task: task)) {
                            Text(task.name)
                        }
                    }
                    .navigationTitle("Tasks")
        }
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
