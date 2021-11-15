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
        HStack {
            Button {
                print("Button pressed")
            } label: {
                Image(systemName: "list.bullet.rectangle")
                    .padding(20)
        }
        }
        ForEach(1..<task.steps.count, id: \.self) { index in
            HStack {
                Text(self.task.steps[index])
            }
        }
                    .navigationTitle(task.name)
    }
}

struct TaskDetailedStepsView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailedStepsView(task: Task(name: "Make a call", difficulty: 1, steps: ["hi"]))
    }
}
