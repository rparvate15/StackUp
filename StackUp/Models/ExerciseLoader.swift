//
//  ExerciseSeedLoader.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/4/25.
//
// Loads the exercises from exercises.json to ExerciseSeed
// ExerciseSeed is all string values, needs to be converted to PreLoadedExercise

import Foundation

struct ExerciseLoader {
    static let hasLoadedKey = "hasLoadedExercises"

    static func performInitialExerciseLoadIfNeeded() {
        if !UserDefaults.standard.bool(forKey: hasLoadedKey) {
            let seeds = loadExerciseSeeds()
            let preloaded = convertToPreLoadedExercises(seeds: seeds)

            // TODO: Store `preloaded` to SwiftData or Core Data if desired.

            UserDefaults.standard.set(true, forKey: hasLoadedKey)
            print("✅ Preloaded exercises on first launch.")
        } else {
            print("ℹ️ Exercises already preloaded.")
        }
    }
}

func loadExerciseSeeds() -> [ExerciseSeed] {
    guard let url = Bundle.main.url(forResource: "exercises", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("❌ Could not load exercises.json")
            return []
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode([ExerciseSeed].self, from: data)
        } catch {
            print("❌ Decoding error: \(error)")
            return []
        }
}
