//
//  Journal.swift
//  Fiducia
//
//  Created by sap on 19/11/21.
//

import Foundation

struct Journal: Identifiable, Codable, Hashable, Equatable {
    
    var id = UUID()
    
    var date: Date
    var journalInput: String
    var feelingsInput: Int
}


