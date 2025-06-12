//
//  ExerciseSeedLoader.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/4/25.
//
// Loads the exercises from exercises.json to ExerciseSeed
// ExerciseSeed is all string values, needs to be converted to PreLoadedExercise

import Foundation
import SwiftData

struct ExerciseLoader {
    static func performInitialExerciseLoadIfNeeded(using context: ModelContext) {
        let hasPreloaded = UserDefaults.standard.bool(forKey: "hasPreloadedExercises")

        guard !hasPreloaded else {
            print("✅ Exercises already preloaded.")
            return
        }

        print("Preloading Exercises on first launch.")

        // Load and decode JSON
        guard let url = Bundle.main.url(forResource: "exercises", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("🛑 Could not load exercises.json")
            return
        }

        do {
            let decoder = JSONDecoder()
            let decoded = try decoder.decode([ExerciseSeed].self, from: data)

            let exercises = convertToPreLoadedExercises(seeds: decoded)

            for ex in exercises {
                context.insert(ex)
            }

            try context.save()

            UserDefaults.standard.set(true, forKey: "hasPreloadedExercises")
            print("✅ Saved \(exercises.count) exercises to SwiftData.")

        } catch {
            print("🛑 Error decoding or saving exercises: \(error)")
        }
    }
}
