//
//  Exercise.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/2/25.
//

import Foundation

struct PreLoadedExercise: Identifiable, Codable {
    var id: String
    var name: String
    var force: Force?
    var level: Level
    var mechanic: Mechanic
    var equipment: Equipment
    var primaryMuscles: [Muscles]
    var secondaryMuscles : [Muscles]?
    var instructions: [String]?
    var category: ExerciseType
    
    init(id: String, name: String, force: Force, level: Level, mechanic: Mechanic, equipment: Equipment, primaryMuscles: [Muscles], secondaryMuscles: [Muscles], instructions: [String], category: ExerciseType) {
        self.id = id
        self.name = name
        self.force = force
        self.level = level
        self.mechanic = mechanic
        self.equipment = equipment
        self.primaryMuscles = primaryMuscles
        self.secondaryMuscles = secondaryMuscles
        self.instructions = instructions
        self.category = category
    }
    
}
