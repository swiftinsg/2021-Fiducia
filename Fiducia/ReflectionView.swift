//
//  ReflectionView.swift
//  Fiducia
//
//  Created by sap on 15/11/21.
//

import SwiftUI

struct FeelingButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 25))
            .foregroundColor(.white)
            .frame(width: 25)
            .padding()
    }
    
}



struct ReflectionView: View {
    
    init() {
                UITextView.appearance().backgroundColor = .clear
            }
    
    @State var goalInput: String = ""
    
    @State private var wordCount: Int = 0
    
    @State var dailyJournal = [Journal(date: "", journalInput: "", feelingsInput: 0)]
    
    @State var filteredJournals: [Journal] = [Journal(date: "", journalInput: "", feelingsInput: 0)]
    
    @State var journalText: String = ""
    
    @State var journalForDay = ""
    
    @State var saveCheck: [Journal] = []
    
    @State var changeCheck: [Journal] = []
    
    @State var dateIndex: Int = 0
    
    @State var feeling: Int = 0
    
    @State private var dateSelect = Date()
    
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
                    
                    
                    
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 10, style:
                                                .continuous)
                            .fill(Color.lightBlue)
                            .frame(height: 85).frame(
                                maxWidth: .infinity,
                                maxHeight: .infinity,
                                alignment: .topLeading
                            )
                            .padding(20)
                        
                        HStack {
                            
                            Button("D:")
                            {
                                feeling = 1
                            }
                            .rotationEffect(Angle(degrees: -90))
                            .background(feeling == 1 ? Color.aquaBlue : Color.lightGrey)
                            .buttonStyle(FeelingButtonStyle())
                            .clipShape(Circle())
                            .padding(5)
                            Button("):") {
                                feeling = 2
                                
                            }
                            .rotationEffect(Angle(degrees: -90))
                            .background(feeling == 2 ? Color.aquaBlue : Color.lightGrey)
                            .buttonStyle(FeelingButtonStyle())
                            .clipShape(Circle())
                            .padding(5)
                            Button(":/") {
                                feeling = 3
                                
                            }
                            .rotationEffect(Angle(degrees: 90))
                            .background(feeling == 3 ? Color.aquaBlue : Color.lightGrey)
                            .buttonStyle(FeelingButtonStyle())
                            .clipShape(Circle())
                            .padding(5)
                            
                            Button(":)") {
                                feeling = 4
                                
                            }
                            .rotationEffect(Angle(degrees: 90))
                            .background(feeling == 4 ? Color.aquaBlue : Color.lightGrey)
                            .buttonStyle(FeelingButtonStyle())
                            .clipShape(Circle())
                            .padding(5)
                            Button(":D") {
                                feeling = 5
                                
                            }
                            .rotationEffect(Angle(degrees: 90))
                            .background(feeling == 5 ? Color.aquaBlue : Color.lightGrey)
                            .buttonStyle(FeelingButtonStyle())
                            .clipShape(Circle())
                            .padding(5)
                        }
                        
                        
                    }
                    
                    
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
                    Text("\(filteredJournals)" as String)
                    Button("Save") {
                        saveCheck = dailyJournal.filter { journal in
                            journal.date.contains(dateString)
                        }
                        if saveCheck.isEmpty {
                            dailyJournal.append(Journal(date: dateString, journalInput: filteredJournals[0].journalInput, feelingsInput: feeling))
                        } else {
                            for j in dailyJournal {
                                dateIndex = dailyJournal.firstIndex(of: j)!
                                if dailyJournal[dateIndex].date == dateString {
                                    dailyJournal[dateIndex].journalInput = filteredJournals[0].journalInput
                                    dailyJournal[dateIndex].feelingsInput = feeling
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
                journal.date.contains(dateString)
            }
            if changeCheck.isEmpty {
                filteredJournals = [Journal(date: "", journalInput: "", feelingsInput: 0)]
            } else {
                filteredJournals = changeCheck
            }
        }
        
    }
    
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYYMMdd"
        return dateFormatter.string(from: dateSelect)
    }
}



struct ReflectionView_Previews: PreviewProvider {
    static var previews: some View {
        ReflectionView()
    }
}
