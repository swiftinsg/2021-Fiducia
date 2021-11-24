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
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView(tasks: $tasksData.tasks, tasksData: tasksData)
                .onAppear {
                    tasksData.load()
                    journalData.load()
                }
                .onChange(of: scenePhase) { phase in
                    if phase == .inactive {
                        tasksData.save()
                        journalData.save()
                    }
                }
            
        }
        
        
    }
}
