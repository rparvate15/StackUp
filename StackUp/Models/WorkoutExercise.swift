//
//  WorkoutExercise.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/4/25.
//

import Foundation

struct WorkoutExercise: Identifiable, Codable {
    let id: UUID
    var exercise: PreLoadedExercise
    var sets: [Int]
    
    init(exercise: PreLoadedExercise, sets: [Int]) {
        self.id = UUID()
        self.exercise = exercise
        self.sets = sets
    }
}
