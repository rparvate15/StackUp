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
    var type: ExerciseType
    var sets: [ExerciseSet]
}
