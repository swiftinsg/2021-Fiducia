//
//  Task.swift
//  Fiducia
//
//  Created by sap on 15/11/21.
//

import Foundation

struct Task: Identifiable {
    var id = UUID()
    
    var name: String
    var difficulty: Double
    var steps: Array<String>
    
}

var tasks = [Task(name: "Make a call", difficulty: 1, steps: ["Locate the stall you want to order from", "stand up from seat", "take a deep breath and walk a few steps forwards", "continue on slowly", "Jot down what you want to order.", "Say and repeat the order to yourself.", "Walk up to the stall.", "Say the order", "Thank the person", "walk away"]),
             Task(name: "Order food from hawker stall", difficulty: 3, steps: ["yes", "hi"])]
