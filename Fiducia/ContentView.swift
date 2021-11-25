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
    
    public static var lightAquaBlue: Color {
        return Color(red: 114.0 / 255.0, green: 203.0 / 255.0, blue: 210.0 / 255.0)
    }
    
    public static var darkBlue: Color {
        return Color(red: 103.0 / 255.0, green: 190.0 / 255.0, blue: 212.0 / 255.0)
    }
    
    public static var darkGrey: Color {
        return Color(red: 58.0 / 255.0, green: 58.0 / 255.0, blue: 60.0 / 255.0)
    }
    
    public static var darkAquaBlue: Color {
        return Color(red: 1.0 / 255.0, green: 115.0 / 255.0, blue: 113.0 / 255.0)
    }
}


struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    
    
    @Binding var tasks: [Task]
    @Binding var goals: [Goal]
    @ObservedObject var tasksData: TasksData
    @ObservedObject var journalData: JournalData
    @ObservedObject var statisticsData: StatisticsData
    @ObservedObject var goalsData: GoalsData
    
    @State var selection = 1
    var body: some View {
        TabView(selection: $selection)  {
          /*  ProgressTabView(statisticsData: StatisticsData())
                .tabItem {
                    Label("Progress", systemImage: "chart.xyaxis.line")
                }
                .tag(0)*/
            TasksView(statistic: .constant(Statistic(numberTasksCompleted: 0, typeTasksCompleted: [""], achievementsCompleted: [""])), tasks: .constant([Task(name: "", difficulty: "", steps: [""])]), tasksData: tasksData)
                .tabItem {
                    Label("Tasks", systemImage: "checklist")
                    
                }
                .tag(1)
            ReflectionView(goals: .constant([Goal(goalInputString: "")]), goalsData: goalsData, journalData: journalData)
                .tabItem {
                    Label("Reflection", systemImage: "ellipsis.bubble")
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(tasks: .constant([Task(name: "", difficulty: "", steps: [""])]), goals: .constant([Goal(goalInputString: "")]), tasksData: TasksData(), journalData: JournalData(), statisticsData: StatisticsData(), goalsData: GoalsData())
    }
}
