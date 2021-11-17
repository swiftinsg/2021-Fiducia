//
//  ReflectionView.swift
//  Fiducia
//
//  Created by sap on 15/11/21.
//

import SwiftUI


struct ReflectionView: View {
    init() {
           UITextView.appearance().backgroundColor = .clear
       }
    
    @State var goalInput: String = ""
    @State var journalInput: String = ""
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
                
                        
                    FeelingsView()
                    
            
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
                        TextEditor(text: $journalInput)
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
