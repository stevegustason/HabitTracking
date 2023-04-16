//
//  AddHabitView.swift
//  HabitTracking
//
//  Created by Steven Gustason on 4/16/23.
//

import SwiftUI

struct AddHabitView: View {
    @State private var name = ""
    @State private var description = ""
    
    // Property to store a HabitList object. Since we don't want to create a second instance of Expenses, we use ObservedObject instead of StateObject
    @ObservedObject var habitlist: HabitList
    
    // Property to dismiss our sheet
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                // Text field to enter the name of the habit
                TextField("Name", text: $name)
                // Text field to enter a description of the habit
                TextField("Description", text: $description)
            }
            .navigationTitle("Add new habit")
            // Here we add a button that has a variable item, set to an habit with all of our user's input data. Then we append that new variable to our habitlist.items Habit array
            .toolbar {
                Button("Save") {
                    let item = Habit(name: name, description: description)
                    habitlist.items.append(item)
                    
                    // Call dismiss to dismiss our view
                    dismiss()
                }
            }
        }
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(habitlist: HabitList())
    }
}
