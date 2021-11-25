//
//  GoalsData.swift
//  Fiducia
//
//  Created by sap on 25/11/21.
//

import Foundation
import SwiftUI

class GoalsData: ObservableObject {
    
    @Published var goals = [Goal(goalInputString: "")]
    
    
    func getArchiveURL() -> URL {
        let plistName = "goals.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedGoals = try? propertyListEncoder.encode(goals)
        try? encodedGoals?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalGoals: [Goal]!
        
        if let retrievedGoalsData = try? Data(contentsOf: archiveURL),
            let decodedGoals = try? propertyListDecoder.decode(Array<Goal>.self, from: retrievedGoalsData) {
            finalGoals = decodedGoals
        } else {
            finalGoals = goals
        }
        
        goals = finalGoals
    }
}
