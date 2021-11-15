//
//  TaskSummarisedStepsView.swift
//  Fiducia
//
//  Created by sap on 15/11/21.
//

import SwiftUI

struct TaskSummarisedStepsView: View {
    
    @Binding var task: Task
    
    @State var text = "Write down any tips"
    
    
    var body: some View {
        List {
            ForEach(1..<task.steps.count, id: \.self) { index in
                Text(self.task.steps[index])
                    .padding()
                    
            }
        }
    }
}

struct TaskSummarisedStepsView_Previews: PreviewProvider {
    static var previews: some View {
        TaskSummarisedStepsView(task: .constant(Task(name: "Make a call", difficulty: 1, steps: ["hi"])))
    }
}

/*
import SwiftUI

struct TaskSummarisedStepsView: View {
    
    var task: Task
    
    @State var text = "Write down any tips"
    
    var body: some View {
        List(1..<task.steps.count, id: \.self) { index in
            VStack {
                Text(self.task.steps[index])
                    .padding()
                    .frame(alignment: .center)
                TextEditor(text: $text)
            
                
            }
        }
    }
}



struct TaskSummarisedStepsView_Previews: PreviewProvider {
    static var previews: some View {
        TaskSummarisedStepsView(task: Task(name: "Make a call", difficulty: 1, steps: ["hi"]))
    }
}
*/
