//
//  ExerciseType.swift
//  StackUp
//
//  Created by Rudra Parvate on 6/2/25.
//

import Foundation

enum ExerciseType: String, CaseIterable, Encodable, Decodable {
    case strength
    case cardio
    case flexibility
}
