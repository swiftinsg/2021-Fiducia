//
//  TasksData.swift
//  Fiducia
//
//  Created by sap on 18/11/21.
//

import Foundation
import SwiftUI

class TasksData: ObservableObject {
    
    @Published var tasks = [Task(name: "Order food from hawker stall", difficulty: 1, steps: ["Locate the stall you want to order from and where the queue is",
                                                                                                           "Stand up from your seat",
                                                                                                           "Take a deep breath and walk a few steps forwards",
                                                                                                           "Continue on at your place",
                                                                                                           """
                                                                                                           Find what you want to order and jot it down
                                                                                                           Tip: If you're afraid that the stall owner may call upon you, you can use your phone to take a picture of the menu using your phone and then refer to it to decide on your order.
                                                                                                           """,
                                                                                                           "Recite the order in your mind",
                                                                                                           "Walk up to the stall",
                                                                                                           """
                                                                                                           When it's your turn, read out your order.
                                                                                                           Tip: Reading fast might make you stumble over your words. Read slowly and steadily. It's okay, no one will judge you
                                                                                                           """,
                                                                                                           "After your order has been taken down, walk to an empty space while it is being prepared",
                                                                                                           """
                                                                                                           Thank the person
                                                                                                           Tip: rIf you don't want to speak to them, you can bow slightly or nod your head.
                                                                                                           """,
                                                                                                           "Walk away"]),
                                                   Task(name: "Make a phone call", difficulty: 3, steps: ["yes", "hi"])]
    func getArchiveURL() -> URL {
        let plistName = "tasks.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedTasks = try? propertyListEncoder.encode(tasks)
        try? encodedTasks?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalTasks: [Task]!
        
        if let retrievedTasksData = try? Data(contentsOf: archiveURL),
            let decodedTasks = try? propertyListDecoder.decode(Array<Task>.self, from: retrievedTasksData) {
            finalTasks = decodedTasks
        } else {
            finalTasks = tasks
        }
        
        tasks = finalTasks
    }
}
