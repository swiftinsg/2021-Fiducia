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
    @ObservedObject var tasksData: TasksData
    @State var stepCount = 0
    @State var showSheet = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
            
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        HStack {
                            Image(systemName: "chevron.backward")
                                .font(.system(size: 18, weight: .medium))
                            Text("Tasks")
                                .font(.system(size: 20))
                        }
                    })
                    
                    Spacer()
                        .frame(maxWidth: .infinity)
                    
                    Button(action: {
                        self.showSheet.toggle()
                    }) {
                        Image(systemName: "list.bullet.rectangle")
                            .font(.system(size: 20))
                    }.sheet(isPresented: $showSheet) {
                        TaskSummarisedStepsView(task: $task, tasksData: tasksData)
                    }
                }
                .padding()
                HStack {
                Text(task.name)
                    .font(.system(size: 27))
                    .font(.headline)
                    .bold()
                    .padding()
                    Spacer()
                }
                
                if task.steps.count >= 1 {
                    ProgressView(value: Double(stepCount), total: Double(task.steps.count))
                        .padding(20)
                    if stepCount + 1 <= task.steps.count {
                
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.lightBlue)
                            .frame(
                                maxWidth: .infinity,
                                maxHeight: .infinity
                        
                            )
                            .overlay(
                                ScrollView {
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
                        
                        Spacer()
                
                    } else {
                        Text("Good job!")
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                            
                        }, label: {
                            Text("Complete")
                            
                        })
                            .buttonStyle(NextButtonStyle())
                            .padding()
                        
                    }
                } else {
                    VStack {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.lightBlue)
                            .frame(
                                maxWidth: .infinity,
                                maxHeight: .infinity
                        
                            )
                            .overlay(
                                Text("There are no steps in this task. Would you like to add steps?")
                                    .font(.title)
                                    .font(.system(size: 30))
                                    .frame(
                                        maxWidth: .infinity,
                                        maxHeight: .infinity,
                                        alignment: .topLeading
                                    )
                                    .padding(30)
                                    
                            )
                        
                        
                            .padding(20)
                        Button(action: {
                            self.showSheet.toggle()
                        }, label: {
                            Text("Add steps")
                                
                        
                        })
                            .buttonStyle(NextButtonStyle())
                            .padding(30)
                    
                
                    }
                    
                }
                Spacer()
            }
        
    }
}
       
     

struct TaskDetailedStepsView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailedStepsView(task: .constant(Task(name: "", difficulty: "", steps: [""])), tasksData: TasksData())
    }
}
