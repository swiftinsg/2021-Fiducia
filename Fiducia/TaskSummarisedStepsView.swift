//
//  TaskSummarisedStepsView.swift
//  Fiducia
//
//  Created by sap on 15/11/21.
//

import SwiftUI

struct TaskSummarisedStepsView: View {
    
    @Binding var task: Task
    
    @State var text = ""
    
    @State var newStep: String = ""
    
    
    
    var body: some View {
        
        List {
            TextEditor(text: $task.name)
            
            ForEach(1..<task.steps.count + 1) { index in
                Text("Step \(index)")
                    .bold()
                    .padding()
                TextEditor(text: $task.steps[index - 1])
            }
       }

    }
}
struct TaskSummarisedStepsView_Previews: PreviewProvider {
    static var previews: some View {
        TaskSummarisedStepsView(task: .constant(Task(name: "Make a call", difficulty: "1", steps: ["hi"])))
    }
}


