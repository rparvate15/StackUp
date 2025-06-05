//
//  Workout.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/2/25.
//

import Foundation

struct WorkoutSession: Identifiable, Codable {
    let id: UUID
    var date: Date
    var name: String
    var exercises: [WorkoutExercise]
    var effort: Int // sum of the exercises' input levels / amount of exercises to get effort level out of 10 OR set by user
}
