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
    
    @State var goalOutput: String = ""
    @State var goalInput: String = ""
    @State var goalTyping = false
    @State var journalOutput: String = ""
    @State var journalInput: String = ""
    @State var journalTyping = false
    @State var buttonPressed: Int = 0
    @State private var date = Date()
    @State private var pickerReset = UUID()
    
    
    var body: some View {
        VStack {
            
            TextField("", text: $goalInput, onEditingChanged: {
                self.goalTyping = $0
                
            }, onCommit: {
                self.goalOutput = self.goalInput
                
            })
                .background(Color.blue.opacity(0.1))
                .padding()
            
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
                
            TextField("", text: $journalInput, onEditingChanged: {
                self.journalTyping = $0
                
            }, onCommit: {
                self.journalOutput = self.journalInput
                
            })
                .background(Color.blue.opacity(0.1))
                .padding()
        }
        }
    }

struct ReflectionView_Previews: PreviewProvider {
    static var previews: some View {
        ReflectionView()
    }
}
