//
//  ExerciseSeedLoader.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/4/25.
//

import Foundation

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
