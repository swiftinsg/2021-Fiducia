//
//  ContentView.swift
//  Fiducia
//
//  Created by sap on 15/11/21.
//

import SwiftUI

extension Color {
    public static var lightBlue: Color {
        return Color(red: 231.0 / 255.0, green: 239.0 / 255.0, blue: 253.0 / 255.0)
    }
    

    public static var lightGrey: Color {
        return Color(red: 220.0 / 255.0, green: 220.0 / 255.0, blue: 220.0 / 255.0)
    }
    
    public static var aquaBlue: Color {
        return Color(red: 114.0 / 255.0, green: 203.0 / 255.0, blue: 210.0 / 255.0)
    }
}


struct ContentView: View {
    
    @Binding var tasks: [Task]
    @ObservedObject var tasksData: TasksData
    @ObservedObject var journalData: JournalData
    
    @State var selection = 1
    var body: some View {
        TabView(selection: $selection)  {
            ProgressTabView()
                .tabItem {
                    Label("Progress", systemImage: "chart.xyaxis.line")
                }
                .tag(0)
            TasksView(tasks: .constant([Task(name: "Make a call", difficulty: "1", steps: ["hi"])]), tasksData: tasksData)
                .tabItem {
                    Label("Tasks", systemImage: "checklist")
                    
                }
                .tag(1)
            ReflectionView(journalData: journalData)
                .tabItem {
                    Label("Reflection", systemImage: "ellipsis.bubble")
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(tasks: .constant([Task(name: "Makec a call", difficulty: "1", steps: ["hi"])]), tasksData: TasksData(), journalData: JournalData())
    }
}
