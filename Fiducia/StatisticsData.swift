//
//  StatisticsData.swift
//  Fiducia
//
//  Created by sap on 24/11/21.
//

import Foundation
import SwiftUI

class StatisticsData: ObservableObject {
    @Published var statistics: [Statistic] = []
    
    let sampleStatistics = [Statistic(numberTasksCompleted: 0, typeTasksCompleted: [], achievementsCompleted: [])]
    
    func getArchiveURL() -> URL {
        let plistName = "statistics.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedStatistics = try? propertyListEncoder.encode(statistics)
        try? encodedStatistics?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalStatistics: [Statistic]!
        
        if let retrievedStatisticsData = try? Data(contentsOf: archiveURL),
            let decodedStatistics = try? propertyListDecoder.decode(Array<Statistic>.self, from: retrievedStatisticsData) {
            finalStatistics = decodedStatistics
        } else {
            finalStatistics = sampleStatistics
        }
        
        statistics = finalStatistics
    }
}
