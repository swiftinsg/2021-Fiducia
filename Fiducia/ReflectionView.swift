//
//  ReflectionView.swift
//  Fiducia
//
//  Created by sap on 15/11/21.
//

import SwiftUI

struct feelingButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(configuration.isPressed ? Color.blue.opacity(0.1) : Color.blue.opacity(0.2))
            .foregroundColor(.white)
            .clipShape(Circle())
    }
    
}

struct feelingButtonStylePressed: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue.opacity(0.2))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
    
}

struct ReflectionView: View {
    init() {
           UITextView.appearance().backgroundColor = .clear
       }
    
    @State var goalInput: String = ""
    @State var journalInput: String = ""
    @State var buttonPressed: Int = 0
    @State private var date = Date()
    @State private var pickerReset = UUID()
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("My personal goal:")
                        .padding()
                    ZStack {
                        RoundedRectangle(cornerRadius: 25, style:
                                                .continuous)
                            .fill(Color.blue.opacity(0.1))
                            .frame(height: 170).frame(
                                maxWidth: .infinity,
                                maxHeight: .infinity,
                                alignment: .topLeading
                            )
                            .padding(20)
                        TextEditor(text: $goalInput)
                            .padding(30)
                    }
                    
                    Spacer()
                    
                    DatePicker(
                         selection: $date,
                         in: ...Date(),
                         displayedComponents: [.date],
                         label: {
                             }
                             )
                        .labelsHidden()
                        .frame(alignment: .leading)
                        .id(self.pickerReset)
                
                        HStack {
                    
                            Button("D:")
                                {
                                buttonPressed = 1
                                    }
                                  .rotationEffect(Angle(degrees: -90))
                                   .buttonStyle(feelingButtonStyle())
                            Button("):") {
                                buttonPressed = 2
                                    }
                                    .rotationEffect(Angle(degrees: -90))
                                    .buttonStyle(feelingButtonStyle())
                            Button("/:") {
                                 buttonPressed = 3
                                
                            }
                            .rotationEffect(Angle(degrees: -90))
                            .buttonStyle(feelingButtonStyle())
                            Button(":)") {
                                buttonPressed = 4
                                
                            }
                            .rotationEffect(Angle(degrees: 90))
                            .buttonStyle(feelingButtonStyle())
                            Button(":D") {
                                buttonPressed = 5
                                
                            }
                            .rotationEffect(Angle(degrees: 90))
                            .buttonStyle(feelingButtonStyle())
            
                        }
                
            
                    
            
                    Text("Today's journal:")
                        .padding()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25, style:
                                                .continuous)
                            .fill(Color.blue.opacity(0.1))
                            .frame(height: 250).frame(
                                maxWidth: .infinity,
                                maxHeight: .infinity,
                                alignment: .topLeading
                            )
                            .padding(20)
                        TextEditor(text: $goalInput)
                            .padding(30)
                    }
                    
                }
                .navigationTitle("Reflection")
                
            }
        }
        
    }
    
}

struct ReflectionView_Previews: PreviewProvider {
    static var previews: some View {
        ReflectionView()
    }
}
