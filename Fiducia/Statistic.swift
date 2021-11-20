//
//  Statistic.swift
//  Fiducia
//
//  Created by sap on 20/11/21.
//

import Foundation

struct Statistic: Identifiable, Codable {
    
    var id = UUID()
    
    var numberTasksCompletedDaily: Int
    var typeTasksCompleted: Array<String>
    var achievementsCompleted: Array<String>
}

