//
//  TasksView.swift
//  Fiducia
//
//  Created by sap on 15/11/21.
//

import SwiftUI

struct TasksView: View {

    @State var tasks = [Task(name: "Make a call", difficulty: 1, steps: ["Locate the stall you want to order from", "Stand up from seat", "Take a deep breath and walk a few steps forwards", "Continue on slowly", "Jot down what you want to order.", "Say and repeat the order to yourself", "Walk up to the stall", "Say the order", "Thank the person", "Walk away"]),
                 Task(name: "Order food from hawker stall", difficulty: 3, steps: ["yes", "hi"])]

    var body: some View {
        NavigationView {
            List (0..<tasks.count) { index in
                            NavigationLink(destination: TaskDetailedStepsView(task: $tasks[index])) {
                                Text(tasks[index].name)
                                    }
                                }
                        .navigationTitle("Tasks")
        }
    }
    
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
