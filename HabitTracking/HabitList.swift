//
//  HabitList.swift
//  HabitTracking
//
//  Created by Steven Gustason on 4/16/23.
//

import Foundation

// Create an observable class to track our expenses
class HabitList: ObservableObject {
    // Create a published array of ExpenseItems so that announcements get sent when it's modified
    @Published var items = [Habit]() {
        didSet {
            // Here we create an instance of JSONEncoder that will convert our data to JSON, ask that to try encoding our items array, and then we write that to UserDefaults using the key “Items”
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    // Custom initializer to load the user's saved data
    init() {
        // First, load our UserDefaults data.
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            // Then create an instance of the JSONDecoder and try to convert the data from UserDefaults into an array of ExpenseItem objects
            if let decodedItems = try? JSONDecoder().decode([Habit].self, from: savedItems) {
                // Then assign that array to items
                items = decodedItems
                return
            }
        }

        // If our decoding above doesn't work, set items to an empty array
        items = []
    }
}
