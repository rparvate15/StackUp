//
//  Exercise.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/2/25.
//

import Foundation

struct Exercise: Identifiable, Codable {
    let id: UUID
    var name: String
    var force: Force?
    var level: Level
    var mechanic: Mechanic
    var equipment: Equipment
    var primaryMuscles: [Muscles]
    var secondaryMuscles : [Muscles]?
    var instructions: String?
    var category: ExerciseType
    var sets: [ExerciseSet]
}
