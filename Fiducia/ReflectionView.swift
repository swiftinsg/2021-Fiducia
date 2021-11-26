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
            .font(.system(size: 21))
            .frame(width: 21)
            .padding()
    }
    
}



struct ReflectionView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
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
    
    @State var saveAlert = false
    
    @State private var dateSelect = Date()
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack {
                    Spacer()
                    HStack {
                        VStack {
                            Spacer()
                            Text("My personal goal:")
                                .font(.title2)
                                .padding()
                        }
                        Spacer()
                    }
                    .padding(.leading, 20)
                    ZStack {
                        RoundedRectangle(cornerRadius: 25, style:
                                                .continuous)
                            .fill(colorScheme == .dark ? Color.darkBlue : Color.lightBlue)
                            .frame(height: 170).frame(
                                maxWidth: .infinity,
                                maxHeight: .infinity,
                                alignment: .topLeading
                            )
                        
                            .overlay(
                                HStack {
                                    Spacer()
                                    VStack {
                                        Spacer()
                                        Text("\(goalsData.goals[0].goalInputString.count)/200")
                                    }
                                  
                                }
                                    .padding()
                                    .padding(.trailing, 20)
                        
                            )
                            
                            
                        TextEditor(text: $goalsData.goals[0].goalInputString)
                            .padding(.leading, 30)
                            .padding(.trailing, 30)
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                            .onAppear() {
                                UITextView.appearance().backgroundColor = .clear
                            }
                            .onChange(of: goalsData.goals[0].goalInputString) { _ in
                                if goalsData.goals[0].goalInputString.count > 200 {
                                    let limit = String(goalsData.goals[0].goalInputString.prefix(200))
                                    goalsData.goals[0].goalInputString = limit
                                }
                            }
                        
                        

                    }
                    .padding(.trailing)
                    .padding(.leading)
                    .padding(.bottom)
                    
                    Spacer()
                        .padding(.bottom)
                    
                    
                    DatePicker (
                        selection: $dateSelect,
                        in: ...Date(),
                        displayedComponents: [.date],
                        label: {
                        }
                    )
                        .labelsHidden()
                        .frame(alignment: .leading)
                        .padding()
                    
                    
                    HStack {
                        VStack {
                            Spacer()
                            Text("How am I feeling today 🧐")
                                .font(.title2)
                                .padding()
                        }
                        Spacer()
                    }
                    .padding(.leading, 20)
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 10, style:
                                                .continuous)
                            .fill(colorScheme == .dark ? Color.darkBlue : Color.lightBlue)
                            .frame(height: 85).frame(
                                maxWidth: .infinity,
                                maxHeight: .infinity,
                                alignment: .topLeading
                            )
                            .padding(4.5)
                            
                        
                        
                        HStack {
                            
                            Button("D:")
                            {
                                feeling = 1
                            }
                            .rotationEffect(Angle(degrees: -90))
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            .background(feeling == 1 ? (colorScheme == .dark ? Color.darkAquaBlue : Color.lightAquaBlue) : (colorScheme == .dark ? Color.darkGrey : Color.lightGrey))
                            .buttonStyle(FeelingButtonStyle())
                            .clipShape(Circle())
                            
                            Button("):") {
                                feeling = 2
                                
                            }
                            .rotationEffect(Angle(degrees: -90))
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            .background(feeling == 2 ? (colorScheme == .dark ? Color.darkAquaBlue : Color.lightAquaBlue) : (colorScheme == .dark ? Color.darkGrey : Color.lightGrey))
                            .buttonStyle(FeelingButtonStyle())
                            .clipShape(Circle())
                            
                            Button(":/") {
                                feeling = 3
                                
                            }
                            .rotationEffect(Angle(degrees: 90))
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            .background(feeling == 3 ? (colorScheme == .dark ? Color.darkAquaBlue : Color.lightAquaBlue) : (colorScheme == .dark ? Color.darkGrey : Color.lightGrey))
                            .buttonStyle(FeelingButtonStyle())
                            .clipShape(Circle())
                            
                            Button(":)") {
                                feeling = 4
                                
                            }
                            .rotationEffect(Angle(degrees: 90))
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            .background(feeling == 4 ? (colorScheme == .dark ? Color.darkAquaBlue : Color.lightAquaBlue) : (colorScheme == .dark ? Color.darkGrey : Color.lightGrey))
                            .buttonStyle(FeelingButtonStyle())
                            .clipShape(Circle())
                            
                            Button(":D") {
                                feeling = 5
                                
                            }
                            .rotationEffect(Angle(degrees: 90))
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            .background(feeling == 5 ? (colorScheme == .dark ? Color.darkAquaBlue : Color.lightAquaBlue) : (colorScheme == .dark ? Color.darkGrey : Color.lightGrey))
                            .buttonStyle(FeelingButtonStyle())
                            .clipShape(Circle())
                            
                        }
                        
                        
                    }
                    .padding(1)
                    .padding(.leading, 1)
                    .padding(.trailing, 1)
                    
                    
                    HStack {
                        VStack {
                            Spacer()
                            Text("Today's journal 📖")
                                .font(.title2)
                                .padding(.leading)
                        }
                        Spacer()
                    }
                    .padding(.leading, 20)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25, style:
                                                .continuous)
                            .fill(colorScheme == .dark ? Color.darkBlue : Color.lightBlue)
                            .frame(height: 250).frame(
                                maxWidth: .infinity,
                                maxHeight: .infinity,
                                alignment: .topLeading
                            )
                        TextEditor(text: $filteredJournals[0].journalInput)
                            .padding(30)
                            .background(Color.clear)
                            .onAppear() {
                                UITextView.appearance().backgroundColor = .clear
                            }
                        
                    }
                    .padding(.leading)
                    .padding(.trailing)
                    .padding(.bottom)
                    Button("Save") {
                        self.saveAlert.toggle()
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
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    .padding()
                    .background(colorScheme == .dark ? Color.darkGrey : Color.lightGrey)
                    .foregroundColor(.black)
                    .cornerRadius(15)
                    
                }
                
            }
            .alert("Your input was successfully saved!", isPresented: $saveAlert, actions: {})
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
