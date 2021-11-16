//
//  TasksView.swift
//  Fiducia
//
//  Created by sap on 15/11/21.
//

import SwiftUI

struct TasksView: View {
    
    @Binding var text: String
 
    @State private var isEditing = false

    @State var tasks = [Task(name: "Make a call", difficulty: 1, steps: ["Locate the stall you want to order from", "Stand up from seat", "Take a deep breath and walk a few steps forwards", "Continue on slowly", "Jot down what you want to order.", "Say and repeat the order to yourself", "Walk up to the stall", "Say the order", "Thank the person", "Walk away"]),
                 Task(name: "Order food from hawker stall", difficulty: 3, steps: ["yes", "hi"])]

    var body: some View {
        NavigationView {
           /* VStack {
                HStack {
         
                    TextField("Search ...", text: $text)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal, 10)
                        .onTapGesture {
                            self.isEditing = true
                        }
         
                    if isEditing {
                        Button(action: {
                            self.isEditing = false
                            self.text = ""
         
                        }) {
                            Text("Cancel")
                        }
                        .padding(.trailing, 10)
                        .transition(.move(edge: .trailing))
                    }
                }
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 15)
                 
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                }*/
            List (0..<tasks.count) { index in
                NavigationLink(destination:
                                TaskDetailedStepsView(task: $tasks[index]))
                {
                    Text(tasks[index].name)
                    
                }
                
            }
            .navigationTitle("Tasks")
        }
    }
    
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView(text: .constant(""))
    }
}
