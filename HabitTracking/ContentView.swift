//
//  ContentView.swift
//  HabitTracking
//
//  Created by Steven Gustason on 4/16/23.
//

import SwiftUI

struct ContentView: View {
    // Create an instance of our HabitList class using the StateObject wrapper so that Swift watches for changes
    @StateObject var habitlist = HabitList()
    
    // Variable to track whether our add expense view is showing
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habitlist.items) {item in
                    // VStack to stack our bolded expense name and type
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.description)
                    }
                }
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                Button {
                    showingAddHabit = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddHabit) {
            // We pass our existing expenses object from this view to the other
            AddHabitView(habitlist: habitlist)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
