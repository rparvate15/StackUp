//
//  ExerciseSet.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/2/25.
//

import Foundation

struct ExerciseSet: Identifiable {
    let id: UUID = UUID()
    // for weightlifting
    var reps: Int?
    var weight: Double?
    // for cardio
    var duration: TimeInterval?
    var distance: Double?
}
