//
//  ExerciseSet.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/2/25.
//

import Foundation

struct ExerciseSet: Identifiable {
    let id: UUID
    let exercise: PreLoadedExercise
    
    // for weightlifting
    var reps: Int?
    var weight: Double?
    
    // for cardio
    var duration: TimeInterval?
    var distance: Double?
    
    init(exercise: PreLoadedExercise, reps: Int, weight: Int) {
        self.id = UUID()
        self.exercise = exercise
        self.reps = reps
        self.weight = Double(weight)
    }
    
    init(exercise: PreLoadedExercise, reps: Int, weight: Double) {
        self.id = UUID()
        self.exercise = exercise
        self.reps = reps
        self.weight = weight
    }
    
    init(exercise: PreLoadedExercise, duration: TimeInterval, distance: Double) {
        self.id = UUID()
        self.exercise = exercise
        self.duration = duration
        self.distance = distance
    }
    
    init(exercise: PreLoadedExercise, duration: TimeInterval, distance: Int) {
        self.id = UUID()
        self.exercise = exercise
        self.duration = duration
        self.distance = Double(distance)
    }
}
