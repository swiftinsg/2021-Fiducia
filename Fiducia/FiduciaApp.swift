//
//  FiduciaApp.swift
//  Fiducia
//
//  Created by sap on 15/11/21.
//

import SwiftUI

@main
struct Fiducia: App {
    
    @ObservedObject var tasksData = TasksData()
    @ObservedObject var journalData = JournalData()
    @ObservedObject var statisticsData = StatisticsData()
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView(tasks: $tasksData.tasks, tasksData: tasksData, journalData: journalData, statisticsData: statisticsData)
                .onAppear {
                    tasksData.load()
                    journalData.load()
                    statisticsData.load()
                }
                .onChange(of: scenePhase) { phase in
                    if phase == .inactive {
                        tasksData.save()
                        journalData.save()
                        statisticsData.save()
                    }
                }
            
        }
        
        
    }
}
