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
    
    @State var dailyJournal = [Journal(date: Date(), journalInput: "", feelingsInput: 0)]
    
    @State var filteredJournals: [Journal] = []
    
    @State var journalText: String = ""
    
    @State var journalForDay = ""
        
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
                        selection: $dailyJournal[0].date,
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
                            .onChange(of: dailyJournal[0].journalInput) { _ in
                                dailyJournal = dailyJournal
                                
                            }
                        
                        }
                    Text("\(dailyJournal[0].journalInput.count)")
                    Text("\(filteredJournals)" as String)
                    Text("\(dailyJournal[0].journalInput)")
                 /*   Button("Save") {
                       // saveCheck = dailyJournal.filter { journal in
                 //           journal.date.timeIntervalSince(dateSelect) > 84600
                            // i think it has to do with the number
                        
                        if changeCheck.isEmpty {
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
                        }*/
                    }

                }
            .navigationTitle("Reflection")
                   
        }
        .onChange(of: dailyJournal[0].date) { _ in
            filteredJournals = dailyJournal.filter { journal in
                journal.date.timeIntervalSince(dailyJournal[0].date) > 84600
            }
        }
    }
}
        
    

struct ReflectionView_Previews: PreviewProvider {
    static var previews: some View {
        ReflectionView()
    }
}
