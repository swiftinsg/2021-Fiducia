//
//  GoalStuff.swift
//  Fiducia
//
//  Created by sap on 25/11/21.
//

import SwiftUI

struct GoalsApp: App {
    
    @ObservedObject var goalsData = goalsData()
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView(goals: $goalsData.goals)
                .onAppear {
                    goalsData.load()
                }
                .onChange(of: scenePhase) { phase in
                    if phase == .inactive {
                        goalsData.save()
                    }
                }
        }
    }
}
