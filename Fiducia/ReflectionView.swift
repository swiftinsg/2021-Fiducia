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
    @State private var wordCount: Int = 0
    @State var dateSelect = Date()
    
    @State var dailyJournal = [Journal(date: Date(), journalInput: "", feelingsInput: 0)]
    
    @State var filteredJournals: [Journal] = []
    
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("My personal goal:")
                        .padding()
                    ZStack {
                        RoundedRectangle(cornerRadius: 25, style:
                                                .continuous)
                            .fill(Color.lightBlue)
                            .frame(height: 170).frame(
                                maxWidth: .infinity,
                                maxHeight: .infinity,
                                alignment: .topLeading
                            )
                            .padding(20)
                        TextEditor(text: $goalInput)
                            .padding(30)
                        
                        HStack {
                            Spacer()
                            VStack {
                                Spacer()
                                Text("\(goalInput.count)/200")
                            }
                            .padding(20)
                        }
                        .padding(20)
                    }
                    
                    Spacer()
                    
                    DatePicker (
                        selection: $dateSelect,
                         in: ...Date(),
                         displayedComponents: [.date],
                         label: {
                             }
                             )
                        .labelsHidden()
                        .frame(alignment: .leading)
                
                        
                    FeelingsView()
                    
            
                    Text("Today's journal:")
                        .padding()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25, style:
                                                .continuous)
                            .fill(Color.lightBlue)
                            .frame(height: 250).frame(
                                maxWidth: .infinity,
                                maxHeight: .infinity,
                                alignment: .topLeading
                            )
                            .padding(20)
                        TextEditor(text: $dailyJournal[0].journalInput)
                            .padding(30)
                        
                        }
                    Text("\(dailyJournal[0].journalInput.count)")
                    Text("\(filteredJournals)" as String)
                }
                
            }.navigationTitle("Reflection")
                   
        }
        .onChange(of: dateSelect) { _ in
            filteredJournals = dailyJournal.filter { journal in
                journal.date.timeIntervalSince(dateSelect) < 86400
            }
        }
    }
}

struct ReflectionView_Previews: PreviewProvider {
    static var previews: some View {
        ReflectionView()
    }
}
