//
//  Goal.swift
//  Fiducia
//
//  Created by sap on 25/11/21.
//

import Foundation

struct Goal: Identifiable, Codable, Hashable {
    
    var id = UUID()
    
    var goalInput: String
}

