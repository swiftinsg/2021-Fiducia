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
        NavigationView {
            
        List {
            TextEditor(text: $task.name)
                .font(Font.title.weight(.bold))
            Picker("Difficulty", selection: $task.difficulty){
                Text("⭐")
                    .tag("1")
                Text("⭐⭐")
                    .tag("2")
                Text("⭐⭐⭐")
                    .tag("3")
            }
            .font(Font.headline.weight(.bold))
            ForEach(1..<task.steps.count + 1, id: \.self) { index in
                TextEditor(text: $task.steps[index - 1])
                    .swipeActions(edge: .leading) {
                        Button(action: {
                            task.steps.remove(at: index - 1)
                        }) {
                            Image(systemName: "trash")
                        }
                        .tint(.red)
                    }
            }

            Button(action: {
                task.steps.append("")
            }) {
                Image(systemName: "plus")
            }
        }
        .navigationBarHidden(true)
            
            
        }

    }
}
struct TaskSummarisedStepsView_Previews: PreviewProvider {
    static var previews: some View {
        TaskSummarisedStepsView(task: .constant(Task(name: "Make a call", difficulty: "1", steps: ["hi"])))
    }
}


/*
 .swipeActions(edge: .leading) {
     Button(action: {
         task.steps.remove()
     }) {
         Image(systemName: "trash")
     }
     .tint(.red)
 }
 */
