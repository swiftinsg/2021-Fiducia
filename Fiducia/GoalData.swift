//
//  GoalData.swift
//  Fiducia
//
//  Created by sap on 25/11/21.
//

import Foundation
import SwiftUI


class GoalsData: ObservableObject {
    @Published var goalInput: [Goal] = []
    
    let sampleGoals = [Goal(name: "YJ",
                                icon: "zzz",
                                school: "Tinkercademy",
                                slothImage: "sloth3",
                                attack: 10,
                                defence: 5,
                                types: [.ice, .fire])]
    
    func getArchiveURL() -> URL {
        let plistName = "Goals.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedGoal = try? propertyListEncoder.encode(goalInput)
        try? encodedGoal?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalGoal: [Goal]!
        
        if let retrievedGoalData = try? Data(contentsOf: archiveURL),
            let decodedGoal = try? propertyListDecoder.decode(Array<Goal>.self, from: retrievedGoalData) {
            finalGoal = decodedGoal
        } else {
            finalGoal = sampleGoals
        }
    }
}
