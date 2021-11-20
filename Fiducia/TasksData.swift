//
//  TasksData.swift
//  Fiducia
//
//  Created by sap on 18/11/21.
//

import Foundation
import SwiftUI

class TasksData: ObservableObject {
    
    @Published var tasks = [Task(name: "Order food from a hawker stall", difficulty: 1, steps: ["Locate the stall you want to order from and where the queue is",
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
                            Task(name: "Take the public transport ⭐️", difficulty: 1, steps: ["Open your browser",
                                                                                              "Search for the train line map",
                                                                                              "Locate the destination you want to go to",
                                                                                              "Plan out your route (no. of trains you need to change, etc.)",
                                                                                              "Observe your surroundings for signs pointing to where your train is",
                                                                                              "Follow the signs and walk slowly so you don't miss any of them.",
                                                                                              "While waiting, you can check the arrival time of your train online through the train company's website.",
                                                                                              "Be aware of the time.",
                                                                                              "When the train arrives, walk towards the door and stand at one side.",
                                                                                              "Wait for all the people to exit.",
                                                                                              "Step into the train.",
                                                                                              "Move towards an open seat or an open area.",
                                                                                              "Sit on the seat or stand at an open space.",
                                                                                              "Wait for your station.",
                                                                                              "When you reach your destination, leave the train."]),
                            Task(name: "Greet a neighbour ⭐️", difficulty: 1, steps: ["Choose a neighbour, as well as a time when they are relaxed and not in a hurry.",
                                                                                      "Choose an appropriate gift to give them, such as homemade treats, home grown veggies, or just anything homemade to give off a more positive impression.",
                                                                                      """
                                                                                      Take a deep breath to slow down your heart.
                                                                                      Tip : Remember the 4-7-8 technique!
                                                                                      """,
                                                                                      "Walk a few steps towards your neighbour.",
                                                                                      "Continue on slowly at your own pace until you have reached them.",
                                                                                      """
                                                                                      Greet them using : 'Hello', 'Good morning/afternoon/evening'.
                                                                                      Tip : If they do not seem to recognise you, just say something along the lines of 'oh I'm of your neighbours, I live near you.'
                                                                                      """,
                                                                                      "Hand them the gift and say: 'I just wanted to give this to you, there was too much of it so we had some leftovers. Hope you like it.'",
                                                                                      "Bow slightly.",
                                                                                      "Thank them for their time.",
                                                                                      "Turn to walk away."]),
                            Task(name: "Thank a cleaner, bus driver, etc. ⭐️", difficulty: 1, steps: ["""
                                                                                                      Find someone you want to thank.
                                                                                                      Tip : Try not to disturb someone who is busy, you might irritate them.
                                                                                                      """,
                                                                                                      "Write down what you want to thank them for, e.g. for their hard work, for keeping the place clean.",
                                                                                                      "Take a deep breath, steady your breathing.",
                                                                                                      "Walk a few steps towards them.",
                                                                                                      "As you walk recite and repeat what you want to say untill you can say it smoothly.",
                                                                                                      "Continue on at your own comfortable pace.",
                                                                                                      "Drink some water to soothe your throat.",
                                                                                                      "When you reach your target, breath in and out.",
                                                                                                      "Smile",
                                                                                                      "Greet them with a 'Good morning/afternoon/evening' + title: 'uncle/auntie'.",
                                                                                                      "Apologise for disturbing their work.",
                                                                                                      "Say: 'I just wanted to tell you' then read out loud what you have recited.",
                                                                                                      "Bow slightly.",
                                                                                                      "Leave"]),
                            Task(name: "When buying groceries, check out by cashier rather than self checkout ⭐️", difficulty: 1, steps: ["""
                                                                                                                                          Bring a recyclable bag. (You can skip this step.)
                                                                                                                                          They will charge 20¢ for the plastic bags.
                                                                                                                                          """,
                                                                                                                                          "Find the cashier with the shortest queue.",
                                                                                                                                          """
                                                                                                                                          Bring your items to the cashier and place them on the conveyer belt.
                                                                                                                                          Tip: Organise them by type. This will greatly help the cashier and yourself. For example, heavier canned food goes first, boxed items second, raw meat third, frozen, deli, diary items fourth, non-food items fifth etc.
                                                                                                                                          """,
                                                                                                                                          """
                                                                                                                                          Let the cashier check out all your items. If you have brought your own bag, remember to tell the cashier.
                                                                                                                                          Tip: While waiting, find and take out your wallet to save time.
                                                                                                                                          """,
                                                                                                                                          "Answer the cashier if you are a member or not with a simple yes or no, or head nod/shake.",
                                                                                                                                          """
                                                                                                                                          Tell the cashier which payment method you're using.
                                                                                                                                          For example:'payWave/cash, please.'
                                                                                                                                          """,
                                                                                                                                          "Remove cash/credit card from wallet.",
                                                                                                                                          "Hand it to the cashier.",
                                                                                                                                          """
                                                                                                                                          Retrieve card/change when handed back.
                                                                                                                                          Tip: Using both hands is more polite.
                                                                                                                                          """,
                                                                                                                                          "Receive your receipts and put them in the bag.",
                                                                                                                                          "Carry your bags.",
                                                                                                                                          "Check from the recipt if the right amount has been deducted from your card and the right amount of change is given.",
                                                                                                                                          "Say thank you to the cashier.",
                                                                                                                                          "Take your items and swiftly leave the scene."]),
                            Task(name: "Calming down ⭐️", difficulty: 1, steps: ["Focus on your breathing.",
                                                                                 "Close your mouth and inhale through your nose for 4 seconds.",
                                                                                 "Hold your mouth and count to 7.",
                                                                                 "Exhale completely through your mouth, making a woosh sound, for 8 seconds.",
                                                                                 "Repeat until your breath is steady.",
                                                                                 "Now think of: 5 things you can see.",
                                                                                 "4 things you can touch.",
                                                                                 "3 things you can hear.",
                                                                                 "2 things you can smell.",
                                                                                 "1 thing you can taste.",
                                                                                 "Open the \"notes\" app.",
                                                                                 """
                                                                                 Type down every negative thought that comes into your mind.
                                                                                 Tip : Don't try to stop your thoughts, embrace it instead.
                                                                                 It's okay to feel this way.
                                                                                 """,
                                                                                 "Identify what type of thoughts they are: Jumping to conclusions? Catastrophizing? Overgeneralization? Labeling? 'Should' statements? Emotional reasoning?",
                                                                                 "Ask yourself if your thoughts are realistic.",
                                                                                  """
                                                                                  Type down realistic explanations or alternatives to the thoughts.
                                                                                  Examples to challenge this thought: 'That man looking towards my direction is probably judging me because I look dumb not knowing where I am.' Think logically and write it down 'he might be looking for someone that's near me' or 'maybe he's looking off into blank space'.
                                                                                  """,
                                                                                 "Realise that your thoughts are just thoughts and not reality.",
                                                                                 "Repeat until you have completely gained a sense of yourself."]),
                            Task(name: "Go out with a friend ⭐️⭐️", difficulty: 2, steps: ["""
                                                                                           Decide which friend you would like to make plans with.
                                                                                           Tip: Make sure you are comfortable with that friend.
                                                                                           """,
                                                                                           "Plan your day with the notes app, e.g. at 5pm eat lunch at a foodcourt, at 6pm watch a movie.",
                                                                                           "Text your friend the time, date and place you would like to meet up.",
                                                                                           "Beforehand, make sure you're relaxed and remeber the details of the meeting.",
                                                                                           "Dress comfortably and arrived at the location 5 minutes before the appointed time.",
                                                                                           """
                                                                                           When you see your friend, take a deep breath and great them.
                                                                                           Tip: Greatings are important, to give a good impression.
                                                                                           DO NOT LEAVE IT OUT.
                                                                                           """,
                                                                                           "When you are walking chat with your friend with some off the topics you have in common.",
                                                                                           "Watch a movie or have lunch together.",
                                                                                           "After the day has ended, take a deep breath and say goodbye to your friend.",
                                                                                           "Exit the scene by calmly walking way.",])]
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
