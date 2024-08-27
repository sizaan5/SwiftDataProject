//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Izaan Saleem on 27/08/2024.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
