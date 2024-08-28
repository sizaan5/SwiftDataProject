//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Izaan Saleem on 27/08/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var showingUpcomingOnly = false
    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate)
    ]
    /*@Query(
        filter: #Predicate<User> { user in
            if user.name.localizedStandardContains("R") {
                    if user.city == "London" {
                        return true
                    } else {
                        return false
                    }
                } else {
                    return false
                }
            /*user.name.localizedStandardContains("R") && user.city == "London"*/
        },
        sort: \User.name
    ) var users: [User]*/
    //@State private var path: [User] = []
    
    var body: some View {
        NavigationStack {//(path: $path) {
            /*List(users) { user in
                //NavigationLink(value: user) {
                Text(user.name)
                //}
            }*/
            UsersView(minimumJoinDate: showingUpcomingOnly ? .now : .distantPast, sortOrder: sortOrder)
            .navigationTitle("Users")
            /*.navigationDestination(for: User.self) { user in
                EditUserView(user: user)
            }*/
            .toolbar {
                Button("Add Samples", systemImage: "plus") {
                    /*let user = User(name: "", city: "", joinDate: .now)
                    modelContext.insert(user)*/
                    //path = [user]
                    try? modelContext.delete(model: User.self)
                    
                    let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
                    let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -5))
                    let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
                    let fourth = User(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))
                    
                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                }
                
                Button(showingUpcomingOnly ? "Show Everyone" : "Show Upcoming") {
                    showingUpcomingOnly.toggle()
                }
                
                Menu("Sort", systemImage: "arrow.up.arrow.down"){
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by Name")
                            .tag([
                                SortDescriptor(\User.name),
                                SortDescriptor(\User.joinDate),
                            ])
                        
                        Text("Sort by Join Date")
                            .tag([
                                SortDescriptor(\User.joinDate),
                                SortDescriptor(\User.name)
                            ])
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
