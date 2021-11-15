//
//  TaskSummarisedStepsView.swift
//  Fiducia
//
//  Created by sap on 15/11/21.
//

import SwiftUI

struct TaskSummarisedStepsView: View {
    
    var task: Task
    
    var body: some View {
        ForEach(1..<task.steps.count, id: \.self) { index in
            HStack {
                Text(self.task.steps[index])
            }
        }
                    .navigationTitle(task.name)
    }
}

struct TaskSummarisedStepsView_Previews: PreviewProvider {
    static var previews: some View {
        TaskSummarisedStepsView(task: Task(name: "Make a call", difficulty: 1, steps: ["hi"]))
    }
}
