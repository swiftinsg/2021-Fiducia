//
//  GoalData.swift
//  Fiducia
//
//  Created by sap on 25/11/21.
//

import Foundation
import SwiftUI

//change Friend/Friends and friend/friends -> Journal and journal/journalInput

class FriendsData: ObservableObject {
    @Published var friends: [Friend] = []
    
    let sampleFriends = [Friend(name: "YJ",
                                icon: "zzz",
                                school: "Tinkercademy",
                                slothImage: "sloth3",
                                attack: 10,
                                defence: 5,
                                types: [.ice, .fire])]
    
    func getArchiveURL() -> URL {
        let plistName = "friends.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedFriends = try? propertyListEncoder.encode(friends)
        try? encodedFriends?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalFriends: [Friend]!
        
        if let retrievedFriendsData = try? Data(contentsOf: archiveURL),
            let decodedFriends = try? propertyListDecoder.decode(Array<Friend>.self, from: retrievedFriendsData) {
            finalFriends = decodedFriends
        } else {
            finalFriends = sampleFriends
        }
    }
}
