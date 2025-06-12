//
//  WorkoutExercise.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/4/25.
//

import Foundation

struct WorkoutExercise: Identifiable {
    let id: UUID
    var exercise: PreLoadedExercise
    var sets: [ExerciseSet]
    var effort: Int?
    
    var plannedSetAmt: Int = 0
    
    init(exercise: PreLoadedExercise, sets: [ExerciseSet], effort: Int) {
        self.id = UUID()
        self.exercise = exercise
        self.sets = sets
        self.effort = effort
    }
    
    init(exercise: PreLoadedExercise, sets: [ExerciseSet], effort: Int, plannedSetAmt: Int) {
        self.id = UUID()
        self.exercise = exercise
        self.sets = sets
        self.effort = effort
        self.plannedSetAmt = plannedSetAmt
    }
    
    init(exercise: PreLoadedExercise, sets: [ExerciseSet]) {
        self.id = UUID()
        self.exercise = exercise
        self.sets = sets
        self.effort = nil
    }
    
    init(exercise: PreLoadedExercise, sets: [ExerciseSet], plannedSetAmt: Int) {
        self.id = UUID()
        self.exercise = exercise
        self.sets = sets
        self.effort = nil
        self.plannedSetAmt = plannedSetAmt
    }
}
