//
//  TaskDetailedStepsView.swift
//  Fiducia
//
//  Created by sap on 15/11/21.
//
import SwiftUI

struct NextButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .font(.system(size: 25))
            .background(Color.gray.opacity(0.3))
            .foregroundColor(.black)
            .cornerRadius(15)
            .scaleEffect(configuration.isPressed ? 1.1 : 1.0)
        
    }
    
}

struct TaskDetailedStepsView: View {
    
    @Binding var task: Task
    @State var showSummarised = false
    @State var stepCount = 0
    
    var body: some View {
        NavigationLink(destination: TaskSummarisedStepsView(task: $task), isActive: $showSummarised) {
        }
        .buttonStyle(PlainButtonStyle())
        .navigationTitle(task.name)
        .navigationBarItems(
            trailing: Button(action: {
                showSummarised = true
            }, label: {
                Image(systemName: "list.bullet.rectangle")
            }
                             )
            )
        ProgressView(value: Double(stepCount), total: Double(task.steps.count))
            .padding()
        
        
        if stepCount + 1 <= task.steps.count {
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 25, style:
                                        .continuous)
                
                    .fill(Color.blue.opacity(0.1))

                
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity,
                        alignment: .topLeading
                        
                    )
                    .overlay(
                        VStack {
                            Text(task.steps[stepCount])
                                .font(.system(size: 30))
                                .frame(
                                    maxWidth: .infinity,
                                    maxHeight: .infinity,
                                    alignment: .topLeading
                                )
                                .padding(30)
                        }
                )
                    .padding(20)
            }
    
            Spacer()
            if stepCount + 1 < task.steps.count {
                Button(action: {
                    stepCount += 1
                }, label: {
                    HStack {
                        Text("Next")
                        Image(systemName: "arrow.right")
                    }
                    
                })
                    .buttonStyle(NextButtonStyle())
                    .padding()
            } else {
                Button(action: {
                    stepCount += 1
                }, label: {
                    Text("Complete")
                })
                    .buttonStyle(NextButtonStyle())
                    .padding()
        }
        
        } else {
            Text("Good job!")
            Button(action: {
            }, label: {
                Text("Complete")
            })
                .buttonStyle(NextButtonStyle())
                .padding()
            }
    }
}



struct TaskDetailedStepsView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailedStepsView(task: .constant(Task(name: "Make a call", difficulty: 1, steps: ["hi"])))
    }
}
