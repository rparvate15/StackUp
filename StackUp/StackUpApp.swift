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
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    let seeds = loadExerciseSeeds()
                    let preloaded = convertToPreLoadedExercises(seeds: seeds)
                }
        }
        .modelContainer(sharedModelContainer)
    }
}
