//
//  Simple_Task_Planner__PP_IV_App.swift
//  Simple Task Planner (PP IV)
//
//  Created by Max Beckmann on 30.05.24.
//

import SwiftUI
import SwiftData

@main
struct Simple_Task_Planner__PP_IV_App: App {
    var sharedModelContainer: ModelContainer = {
        do {
            return try ModelContainer(for: Task.self)
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(sharedModelContainer)
        }
    }
}
