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
    
    @State var filteredJournals: [Journal] = [Journal(date: Date(), journalInput: "", feelingsInput: 0)]
    
    @State var journalText: String = ""
    
    @State var changeCheck: [Journal] = []
    
    @State var saveCheck: [Journal] = []
    
    @State var dateIndex: Int = 0
        
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
                    // bind buttonPressed such that its value can be brought over here
                    
            
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
                        TextEditor(text: $filteredJournals[0].journalInput)
                            .padding(30)
                        
                        }
                    Text("\(filteredJournals[0].journalInput.count)")
                    Text("\(filteredJournals[0].date)" as String)
                    Button("Save") {
                        saveCheck = dailyJournal.filter { journal in
                            journal.date.timeIntervalSince(dateSelect) > 84600
                            // i think it has to do with the number
                        }
                        if saveCheck.isEmpty {
                            dailyJournal.append(Journal(date: dateSelect, journalInput: filteredJournals[0].journalInput, feelingsInput: 0))
                            // change the value of feelingsInput to the value given by buttonPressed
                        } else {
                            for j in dailyJournal {
                                dateIndex = dailyJournal.firstIndex(of: j)!
                                if dailyJournal[dateIndex].date == dateSelect {
                                    dailyJournal[dateIndex].journalInput = filteredJournals[0].journalInput
                                    dailyJournal[dateIndex].feelingsInput = 0
                                    // change the value of feelingsInput to the value given by buttonPressed
                                }
                            }
                        }
                    }

                }
                
            }
            .navigationTitle("Reflection")
                   
        }
        .onChange(of: dateSelect) { _ in
            changeCheck = dailyJournal.filter { journal in
                journal.date.timeIntervalSince(dateSelect) > 84600
                // i think it has to do with the number
            }
            if changeCheck.isEmpty {
                filteredJournals = [Journal(date: dateSelect, journalInput: "", feelingsInput: 0)]
            } else {
                filteredJournals = changeCheck
            }
        }
        
    }
}

struct ReflectionView_Previews: PreviewProvider {
    static var previews: some View {
        ReflectionView()
    }
}
