//
//  Task.swift
//  Fiducia
//
//  Created by sap on 15/11/21.
//

import Foundation

struct Task: Identifiable, Codable, Hashable {
    
    var id = UUID()
    
    var name: String
    var difficulty: Double
    var steps: Array<String>
}

