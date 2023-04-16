//
//  Habit.swift
//  HabitTracking
//
//  Created by Steven Gustason on 4/16/23.
//

import Foundation

// Struct for our habits - their title and description
struct Habit: Codable, Identifiable {
    var id = UUID()
    let name: String
    let description: String
}
