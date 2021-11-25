//
//  TaskSummarisedStepsView.swift
//  Fiducia
//
//  Created by sap on 15/11/21.
//

import SwiftUI

struct TaskSummarisedStepsView: View {
    
    @Binding var task: Task
    
    @ObservedObject var tasksData: TasksData 
    
    @State var text = ""
    
    @State var newStep: String = ""
    
    @State var presentAlert = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    
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
                    HStack {
                        Spacer()
                        Image(systemName: "plus")
                            .foregroundColor(Color(.systemBlue))
                        Spacer()
                    }
                }
                Button(action: {
                    self.presentAlert.toggle()
                }) {
                    HStack {
                        Spacer()
                        Text("Delete task")
                            .foregroundColor(Color(.systemRed))
                        Spacer()
                    }
                }
            }
            .alert("Are you sure you want to delete task?", isPresented: $presentAlert, actions: {
                Button("Delete", role: .destructive, action: {
                    presentationMode.wrappedValue.dismiss()
                    if let delete = tasksData.tasks.firstIndex(of: task) {
                        tasksData.tasks.remove(at: delete)
                    }
                })
            }, message: {
                // Text("Message")
            })
            .navigationBarHidden(true)
            
            
        }
        
    }
}
struct TaskSummarisedStepsView_Previews: PreviewProvider {
    static var previews: some View {
        TaskSummarisedStepsView(task: .constant(Task(name: "Make a call", difficulty: "1", steps: ["hi"])), tasksData: TasksData())
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
