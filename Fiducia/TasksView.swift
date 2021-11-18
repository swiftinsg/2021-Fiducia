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

    @Binding var tasks: [Task]
    

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
        TasksView(tasks: .constant([Task(name: "Make a ffcall", difficulty: 1, steps: ["hi"])]))
    }
}
