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
    
    
    @Binding var goals: [Goal]
    
    @ObservedObject var goalsData: GoalsData
    
    @State private var wordCount: Int = 0
    
    @ObservedObject var journalData: JournalData
    
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
                        TextEditor(text: $goalsData.goals[0].goalInputString)
                            .padding(30)
                            .onAppear() {
                                UITextView.appearance().backgroundColor = .clear
                                
                            }
                        
                        HStack {
                            Spacer()
                            VStack {
                                Spacer()
                                Text("\(goalsData.goals[0].goalInputString.count)/200")
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
                            .background(Color.clear)
                            .onAppear() {
                                UITextView.appearance().backgroundColor = .clear
                            }
                        
                    }
                    Text("Word Count: \(filteredJournals[0].journalInput.count)")
                    Button("Save") {
                        saveCheck = journalData.journals.filter { journal in
                            journal.date.contains(dateString)
                        }
                        if saveCheck.isEmpty {
                            journalData.journals.append(Journal(date: dateString, journalInput: filteredJournals[0].journalInput, feelingsInput: feeling))
                        } else {
                            for j in journalData.journals {
                                dateIndex = journalData.journals.firstIndex(of: j)!
                                if journalData.journals[dateIndex].date == dateString {
                                    journalData.journals[dateIndex].journalInput = filteredJournals[0].journalInput
                                    journalData.journals[dateIndex].feelingsInput = feeling
                                }
                            }
                        }
                    }
                    
                }
                
            }
            .navigationTitle("Reflection")
            
        }
        .onChange(of: dateSelect) { _ in
            changeCheck = journalData.journals.filter { journal in
                journal.date.contains(dateString)
            }
            if changeCheck.isEmpty {
                filteredJournals = [Journal(date: "", journalInput: "", feelingsInput: 0)]
                feeling = 0
            } else {
                filteredJournals = changeCheck
                feeling = filteredJournals[0].feelingsInput
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
        ReflectionView(goals: .constant([Goal(goalInputString: "")]), goalsData: GoalsData(), journalData: JournalData())
    }
}
