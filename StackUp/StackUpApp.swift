//
//  StackUpApp.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/2/25.
//

import SwiftUI
import SwiftData

@main
struct StackUpApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(sharedModelContainer)
                .onAppear {
                    let context = sharedModelContainer.mainContext
                    ExerciseLoader.performInitialExerciseLoadIfNeeded(using: context)
                }
        }
        .modelContainer(sharedModelContainer)
    }
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
            UserProfile.self,
            PreLoadedExercise.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
}
