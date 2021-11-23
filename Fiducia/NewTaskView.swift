//
//  NewTaskView.swift
//  Fiducia
//
//  Created by sap on 22/11/21.
//

import SwiftUI

struct NewTaskView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var task = Task(name: "", difficulty: "", steps: [""]) // Changed
    
    @ObservedObject var tasksData: TasksData  //Changed
    
    
    var body: some View {
        NavigationView {
            Form {
            
                Section(header: Text("Task Information")) {
                    TextField("Name", text: $task.name)
                    TextField("Difficulty", text: $task.difficulty)
                        
                }
                Section(header: Text("Task Steps")) {
                    ForEach(1..<$task.steps.count + 1, id: \.self) { index in
                        TextField("Step \(index)", text: $task.steps[index - 1])
                    }
                    Button(action: {
                        task.steps.append("")
                    }) {
                        Image(systemName: "plus")
                    }
                }
                Section {
                    Text("\(task.name)")
                    Text("\(task.difficulty)")
                    Button("Save") {
                        tasksData.tasks.append(Task(name: task.name, difficulty: task.difficulty, steps: task.steps))
                        tasksData.save()
                        // Should now update the tasksData variable that things have changed and should update the view
                        presentationMode.wrappedValue.dismiss()
                        
                    }
                    Button("Discard") {
                        presentationMode.wrappedValue.dismiss()
                                        }
                                        .foregroundColor(.red)
                }

            }
            .navigationTitle("New Task")
        }
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView(tasksData: TasksData())
    }
}


