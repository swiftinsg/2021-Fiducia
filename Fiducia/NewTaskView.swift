//
//  NewTaskView.swift
//  Fiducia
//
//  Created by sap on 22/11/21.
//

import SwiftUI

struct NewTaskView: View {
    
    @Binding var tasks: [Task]
    @Environment(\.presentationMode) var presentationMode
    @State var task = [Task(name: "", difficulty: 0, steps: [])]
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Information")) {
                    TextField("Name", text: $task[0].name)
                }
                Section(header: Text("Task Steps")) {
                    TextField("Step 1", text: $task[0].steps[0])
                }
                

            }
            .navigationTitle("New Task")
        }
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView(tasks: .constant([]))
    }
}
