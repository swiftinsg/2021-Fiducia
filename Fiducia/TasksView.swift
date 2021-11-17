//
//  TasksView.swift
//  Fiducia
//
//  Created by sap on 15/11/21.
//

import SwiftUI

struct TasksView: View {
    
    @State var text = ""
    
    @State var isEditing = false
    
    @State var searchText = ""

    @State var tasks = [Task(name: "Order food from hawker stall", difficulty: 1, steps: ["Locate the stall you want to order from and where the queue is",
                                                                         "Stand up from your seat",
                                                                         "Take a deep breath and walk a few steps forwards",
                                                                         "Continue on at your place",
                                                                         """
                                                                         Find what you want to order and jot it down
                                                                         Tip: If you're afraid that the stall owner may call upon you, you can use your phone to take a picture of the menu using your phone and then refer to it to decide on your order.
                                                                         """,
                                                                         "Recite the order in your mind",
                                                                         "Walk up to the stall",
                                                                         """
                                                                         When it's your turn, read out your order.
                                                                         Tip: Reading fast might make you stumble over your words. Read slowly and steadily. It's okay, no one will judge you
                                                                         """,
                                                                         "After your order has been taken down, walk to an empty space while it is being prepared",
                                                                         """
                                                                         Thank the person
                                                                         Tip: If you don't want to speak to them, you can bow slightly or nod your head.
                                                                         """,
                                                                         "Walk away"]),
                 Task(name: "Make a phone call", difficulty: 3, steps: ["yes", "hi"])]

    var body: some View {
        NavigationView {
            VStack {
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
                            }
                        }
                    }
                )
                
            List (0..<tasks.count - 1) { index in
                ForEach(searchResult, id: \.self) { task in
                        let taskIndex = tasks.firstIndex(of: task)!
                        NavigationLink(destination:
                                        TaskDetailedStepsView(task: $tasks[taskIndex]))
                        {
                            Text(tasks[taskIndex].name)
                        }
                    }
                }
            
            }.navigationTitle("Tasks")
        }
    }
    
    var searchResult: [Task] {
        if searchText.isEmpty {
            return tasks
        } else {
            let searchArray = ["\(searchText)"]
            let filteredArray = tasks.filter { searchArray.contains($0.name) }
            return filteredArray
        }
    }
    
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
