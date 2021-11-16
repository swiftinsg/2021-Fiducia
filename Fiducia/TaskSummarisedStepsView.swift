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
    
    @State var newStep: String = ""
    
    
    
    var body: some View {
        
       List {
            ForEach(1..<task.steps.count) { index in
                Text("Step \(index)")
                    .bold()
                    .padding()
                TextEditor(text: $task.steps[index - 1])
            }
       }
    }
}
/*@State var goalOutput: String = ""
 @State var goalInput: String = ""
 @State var goalTyping = false
 TextField("", text: $goalInput, onEditingChanged: {
     self.goalTyping = $0
     
 }, onCommit: {
     self.goalOutput = self.goalInput
     
 })
     .background(Color.blue.opacity(0.1))
     .padding()
 
            }
            Button("+") {
            }
                    
            Button("Save") {
                task.steps.append(newStep)
            }
        }.navigationTitle(task.name)
       }
    }

*/
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
} */
