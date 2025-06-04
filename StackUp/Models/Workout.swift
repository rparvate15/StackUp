//
//  Workout.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/2/25.
//

import Foundation

struct Workout: Identifiable, Codable {
    let id: UUID
    var date: Date
    var name: String
    var exercises: [WorkoutExercise]
}
