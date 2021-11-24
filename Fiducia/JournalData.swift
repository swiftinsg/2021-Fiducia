//
//  JournalData.swift
//  Fiducia
//
//  Created by Rachel Heer on 24/11/21.
//

import Foundation
import SwiftUI

class JournalData: ObservableObject {
    @Published var journals: [Journal] = []
    
    func getArchiveURL() -> URL {
        let plistName = "journal.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedJournal = try? propertyListEncoder.encode(journals)
        try? encodedJournal?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalJournal: [Journal]!
        
        if let retrievedJournalData = try? Data(contentsOf: archiveURL),
           let decodedJournal = try? propertyListDecoder.decode(Array<Journal>.self, from: retrievedJournalData) {
            finalJournal = decodedJournal
        } else {
            finalJournal = journals
        }
        
        journals = finalJournal
    }
}
